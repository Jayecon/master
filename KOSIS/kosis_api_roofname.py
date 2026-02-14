import requests
import pandas as pd
import time
import logging
from datetime import datetime

# =========================================================
# 설정
# =========================================================

BASE_URL = "https://kosis.kr/openapi/Param/statisticsParameterData.do"
API_KEY = "NmExYWUzYjEwNjNlNzIyMTgzOTE0NmExYjU4YWM3ZTQ="

META_FILE = "kosis_area_sido_updated.xlsx"
OUTPUT_FILE = "kosis_all_panel.csv"

MAX_RETRY = 3
SLEEP_BASE = 0.7

RUN_TIME = datetime.now().strftime("%Y%m%d_%H%M%S")
LOG_FILE = f"kosis_run_{RUN_TIME}.log"

logging.basicConfig(
    filename=LOG_FILE,
    level=logging.INFO,
    format="%(asctime)s | %(levelname)s | %(message)s",
    encoding="utf-8"
)

# =========================================================
# API 호출 함수
# =========================================================

def fetch_with_retry(params):
    for attempt in range(1, MAX_RETRY + 1):
        try:
            resp = requests.get(BASE_URL, params=params, timeout=60)
            resp.raise_for_status()
            data = resp.json()

            if isinstance(data, list):
                return pd.json_normalize(data)

            if isinstance(data, dict):
                for key in ("data", "DATA", "result", "RESULT"):
                    if key in data and isinstance(data[key], list):
                        return pd.json_normalize(data[key])

            raise ValueError("Unexpected JSON structure")

        except Exception as e:
            logging.warning(f"Retry {attempt}/{MAX_RETRY} | {params.get('tblId')} | {e}")
            time.sleep(SLEEP_BASE * attempt)

    return None


# =========================================================
# 메타정보 가져오기
# =========================================================

def fetch_meta(orgId, tblId):

    params = {
        "method": "getMetaInfo",
        "apiKey": API_KEY,
        "format": "json",
        "jsonVD": "Y",
        "orgId": str(orgId),
        "tblId": str(tblId),
    }

    try:
        resp = requests.get(BASE_URL, params=params, timeout=60)
        resp.raise_for_status()
        meta = resp.json()

        dim_map = {}

        if isinstance(meta, dict):
            for key in meta:
                if key.startswith("C") and key.endswith("_NM"):
                    dim_code = key.replace("_NM", "")
                    dim_map[dim_code] = meta[key]

        return dim_map

    except:
        return {}


# =========================================================
# 메타 파일 로드
# =========================================================

meta_file = pd.read_excel(META_FILE)

all_frames = []

for idx, row in meta_file.iterrows():

    logging.info(f"START {idx+1}/{len(meta_file)} | {row['tblId']}")

    # 메타정보 먼저 가져오기
    dim_labels = fetch_meta(row["orgId"], row["tblId"])

    params = {
        "method": "getList",
        "apiKey": API_KEY,
        "itmId": "ALL",
        "objL1": "ALL",
        "objL2": "ALL",
        "objL3": "",
        "jsonVD": "Y",
        "prdSe": "Y",
        "format": "json",
        "startPrdDe": str(row["시작년도"]),
        "endPrdDe": str(row["종료년도"]),
        "orgId": str(row["orgId"]),
        "tblId": str(row["tblId"]),
    }

    df = fetch_with_retry(params)

    if df is not None and len(df) > 0:

        # -------------------------------------------------
        # 1️⃣ 코드 대신 라벨값 사용
        # -------------------------------------------------
        for col in list(df.columns):
            if col.endswith("_NM"):
                base = col.replace("_NM", "")
                df[base] = df[col]
                df.drop(columns=[col], inplace=True)

        # -------------------------------------------------
        # 2️⃣ 메타정보 기반 컬럼명 변경
        # -------------------------------------------------
        rename_dict = {}

        for col in df.columns:
            if col.startswith("C") and col in dim_labels:
                rename_dict[col] = dim_labels[col]

        rename_dict["PRD_DE"] = "year"
        rename_dict["DT"] = "value"

        df = df.rename(columns=rename_dict)

        # -------------------------------------------------
        # 3️⃣ 메타 정보 추가
        # -------------------------------------------------
        df["시군구"] = row["시군구"]
        df["종류"] = row["종류"]
        df["source_tbl"] = row["tblId"]

        # 타입 정리
        if "year" in df.columns:
            df["year"] = pd.to_numeric(df["year"], errors="coerce")

        if "value" in df.columns:
            df["value"] = pd.to_numeric(df["value"], errors="coerce")

        all_frames.append(df)

    time.sleep(SLEEP_BASE)


# =========================================================
# 저장
# =========================================================

if all_frames:
    final_df = pd.concat(all_frames, ignore_index=True)
    final_df.to_csv(OUTPUT_FILE, index=False, encoding="utf-8-sig")
    logging.info(f"TOTAL ROWS SAVED = {len(final_df)}")

print("===== RUN COMPLETE =====")
