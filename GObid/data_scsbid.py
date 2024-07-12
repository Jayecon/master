"""
조달청 낙찰정보 낙찰된 목록 현황
"""
import os
import time
from concurrent.futures import ThreadPoolExecutor, as_completed
import requests
import pandas as pd


def fetch_page_data(url, params):
    """
    Fetch data from a single page of the API.

    Args:
        url (str): The API endpoint.
        params (dict): The parameters for the API request.

    Returns:
        list: A list of items from the page.
    """
    max_retries = 5
    for attempt in range(max_retries):
        try:
            response = requests.get(url, params=params, timeout=30)
            response.raise_for_status()
            data = response.json()
            return data.get('response', {}).get('body', {}).get('items', [])
        except requests.exceptions.RequestException as ex:
            print(f"Attempt {attempt + 1} failed: {ex}")
            if attempt < max_retries - 1:
                time.sleep(5)  # 재시도 전 대기 시간
        except ValueError as ex:
            print("응답 데이터를 JSON으로 파싱할 수 없습니다: {ex}")
            print(response.text)  # 응답 내용을 출력하여 문제를 진단

    # 모든 시도가 실패한 경우 빈 목록 반환
    return []


def fetch_data_and_save_as_csv(api_key, url, start_date, end_date, save_path):
    """
    Fetch data from the API and save it as a CSV file.

    This function fetches data from the API using the specified date range and
    saves the data as a CSV file at the given save path. The function handles
    API rate limits and retries on request failures.

    Args:
        api_key (str): The API key for authentication.
        url (str): The API endpoint.
        start_date (str): The start date for the data query in the format
            'YYYYMMDDHHMM'.
        end_date (str): The end date for the data query in the format
            'YYYYMMDDHHMM'.
        save_path (str): The file path where the CSV file will be saved.

    Returns:
        None
    """
    # 요청 파라미터 설정
    params = {
        'serviceKey': api_key,
        'numOfRows': '9999',  # 페이지 당 최대 개수
        'pageNo': '1',
        'inqryDiv': '1',
        'inqryBgnDt': start_date,
        'inqryEndDt': end_date,
        'bidNtceNo': '',
        'type': 'json'
    }

    all_items = []

    with ThreadPoolExecutor(max_workers=10) as executor:
        future_to_page = {
            executor.submit(
                fetch_page_data,
                url,
                dict(params, pageNo=str(page))
            ): page
            for page in range(1, 101)
        }

        for future in as_completed(future_to_page):
            page = future_to_page[future]
            try:
                items = future.result()
                if items:
                    all_items.extend(items)
                else:
                    print(f"No more items found on page {page}.")
            except requests.exceptions.RequestException as ex:
                print(f"Page {page} generated a request exception: {ex}")
            except ValueError as ex:
                print(f"Page {page} generated a value error: {ex}")

    if all_items:
        # 데이터를 pandas 데이터프레임으로 변환
        df = pd.DataFrame(all_items)
        print(df)

        # CSV 파일로 저장
        df.to_csv(save_path, index=False, encoding='utf-8-sig')
        print(f'CSV 파일이 성공적으로 생성되었습니다: {save_path}')
    else:
        print("No items collected.")


# 함수 호출
fetch_data_and_save_as_csv(
    api_key=(
        'iH00EqQbsktpVE3cUMmXmTpoQ+1YPATpJGqcYWUCgvVXR8nK3q0PrF6ZvVp1iYGY'
        '695j1OMRscAAbptePgiGIw=='
    ),
    url=(
        'http://apis.data.go.kr/1230000/ScsbidInfoService/getScsbidListSttus'
        'Servc'
    ),
    start_date='201401010000',
    end_date='201412312359',
    save_path=os.path.expanduser('~/dropbox/bid_public_info_srvc_2014.csv')
)
