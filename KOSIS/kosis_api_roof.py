import requests
import pandas as pd
import time
import logging
from datetime import datetime
from pathlib import Path

# =========================================================
# 설정
# =========================================================

BASE_URL = "https://kosis.kr/openapi/Param/statisticsParameterData.do"
API_KEY = "YOUR_API_KEY"

META_FILE = "kosis_area_sido_updated.xlsx"
OUTPUT_FILE = "kosis_all_panel.csv"

MAX_RETRY = 3
SLEEP_BASE = 0.7  # 기본 대기시간

RUN_TIME = datetime.now().strftime("%Y%m%d_%H%M%S")
LOG_FILE = f"kosis_run_{RUN_TIME}.log"
FAIL_FILE = f"kosis_failed_{RUN_TIME}.csv"
SUCCESS_FILE = f"kosis_success_{RUN_TIME}.csv"

# =========================================================
# 로깅 설정
# =========================================================

logging.basicConfig(
    filename=LOG_FILE,
    level=logging.INFO,
    format="%(asctime)s | %(levelname)s | %(message)s",
    encoding="utf-8"
)

logging.info("===== KOSIS API RUN START =====")

# =========================================================
# API 호출 함수 (재시도 포함)
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
            logging.warning(f"Retry {attempt}/{MAX_RETRY} | {params['tblId']} | {e}")
            time.sleep(SLEEP_BASE * attempt)

    return None  # 모든 재시도 실패

# =========================================================
# 메타 파일 로드
# =========================================================

meta = pd.read_excel(META_FILE)

all_frames = []
failed_rows = []
success_rows = []

start_time = time.time()

# =========================================================
# 반복 실행
# =========================================================

for idx, row in meta.iterrows():

    logging.info(f"START {idx+1}/{len(meta)} | {row['orgId']} | {row['tblId']}")

    params = {
        "method": "getList",
        "apiKey": "NmExYWUzYjEwNjNlNzIyMTgzOTE0NmExYjU4YWM3ZTQ=",
        "itmId": "I_1+",
        "objL1": "ALL",
        "objL2": "ALL",
        "objL3": "",
        "objL4": "",
        "objL5": "",
        "objL6": "",
        "objL7": "",
        "objL8": "",
        "jsonVD": "Y",
        "prdSe": "Y",
        "format": "json",
        "startPrdDe": str(row["시작년도"]),
        "endPrdDe": str(row["종료년도"]),
        "orgId": str(row["orgId"]),
        "tblId": str(row["tblId"]),
        "itmId": "ALL",
    }

    df = fetch_with_retry(params)

    if df is not None and len(df) > 0:

        df["시군구"] = row["시군구"]
        df["종류"] = row["종류"]
        df["source_tbl"] = row["tblId"]

        all_frames.append(df)
        success_rows.append(row)

        logging.info(f"SUCCESS {row['tblId']} | rows={len(df)}")

    else:
        failed_rows.append(row)
        logging.error(f"FAIL {row['tblId']}")

    time.sleep(SLEEP_BASE)

# =========================================================
# 결과 저장
# =========================================================

if all_frames:
    final_df = pd.concat(all_frames, ignore_index=True)
    final_df.to_csv(OUTPUT_FILE, index=False, encoding="utf-8-sig")
    logging.info(f"TOTAL ROWS SAVED = {len(final_df)}")
else:
    logging.warning("NO DATA COLLECTED")

# 실패 목록 저장
if failed_rows:
    pd.DataFrame(failed_rows).to_csv(FAIL_FILE, index=False, encoding="utf-8-sig")

# 성공 목록 저장
if success_rows:
    pd.DataFrame(success_rows).to_csv(SUCCESS_FILE, index=False, encoding="utf-8-sig")

# =========================================================
# 실행 요약 리포트
# =========================================================

elapsed = round(time.time() - start_time, 2)

print("=================================")
print("KOSIS API RUN SUMMARY")
print("=================================")
print(f"총 시도: {len(meta)}")
print(f"성공: {len(success_rows)}")
print(f"실패: {len(failed_rows)}")
print(f"총 소요시간(초): {elapsed}")
print(f"결과 파일: {OUTPUT_FILE}")
print(f"로그 파일: {LOG_FILE}")
print("=================================")

logging.info("===== KOSIS API RUN END =====")
