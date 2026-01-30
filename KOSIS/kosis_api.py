import requests
import pandas as pd

BASE_URL = "https://kosis.kr/openapi/Param/statisticsParameterData.do"

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
    "format": "json",
    "jsonVD": "Y",
    "prdSe": "Y",
    "startPrdDe": "2011",
    "endPrdDe": "2021",
    "orgId": "542",
    "tblId": "DT_54201_D001005",
}

OUT_CSV = "DT_54201_D001005_2011_2021.csv"


def fetch_rows(base_url: str, query: dict) -> pd.DataFrame:
    resp = requests.get(base_url, params=query, timeout=60)
    resp.raise_for_status()
    data = resp.json()

    if isinstance(data, list):
        if not data:
            raise ValueError("Empty list response; check params or apiKey.")
        return pd.json_normalize(data)

    if isinstance(data, dict):
        for key in ("data", "DATA", "result", "RESULT"):
            rows = data.get(key)
            if isinstance(rows, list):
                if not rows:
                    raise ValueError(f"Empty '{key}' list; check params.")
                return pd.json_normalize(rows)
        keys = list(data.keys())[:20]
        raise ValueError(f"Unexpected dict JSON. keys={keys}")

    raise ValueError(f"Unexpected JSON type: {type(data)}")


if __name__ == "__main__":
    df = fetch_rows(BASE_URL, params)
    df.to_csv(OUT_CSV, index=False, encoding="utf-8-sig")
    print(f"Saved: {OUT_CSV}")
    print(f"Rows: {len(df):,}, Cols: {df.shape[1]:,}")
    print("Columns:", list(df.columns)[:20])
