"""
폴더에 있는 모든 엑셀파일의 병합된 셀을 풀어주고 cleaned 하위폴더에 저장
"""

import os
import pandas as pd

# 작업할 폴더 경로
FOLDER_PATH = '/Users/jay/Dropbox/Data/ALIMI/JArating'  # 작업할 폴더 경로를 입력합니다.
OUTPUT_FILE = os.path.join(FOLDER_PATH, 'corrupt_files.txt')  # 손상된 파일 목록

# 손상된 파일을 저장할 리스트
corrupt_files = []
failed_files = []

# cleaned 폴더 생성
CLEANED_FOLDER_PATH = os.path.join(FOLDER_PATH, 'cleaned')
os.makedirs(CLEANED_FOLDER_PATH, exist_ok=True)

# 폴더의 존재 여부 확인
if not os.path.exists(FOLDER_PATH):
    print("Error: 폴더를 찾을 수 없습니다.")
else:
    # 폴더 내의 모든 파일 확인
    for filename in os.listdir(FOLDER_PATH):
        filepath = os.path.join(FOLDER_PATH, filename)

        # 파일이 엑셀 파일인지 확인
        if filename.endswith('.xlsx') or filename.endswith('.xls'):
            try:
                # 엑셀 파일 불러오기
                print(f"{filename} 파일을 청소합니다.")
                df = pd.read_excel(filepath)

                # 병합된 셀 여부 확인 후 병합된 셀 모두 해제
                merged_cells = df.columns[df.columns.str.contains(':')]
                if not merged_cells.empty:
                    df = df.unstack().reset_index()

                # 정리된 엑셀 파일을 cleaned 폴더에 저장
                cleaned_filepath = os.path.join(CLEANED_FOLDER_PATH, filename)
                df.to_excel(cleaned_filepath, index=False)

                print(f"{filename} 파일 정리 완료")

            except Exception as e:
                if isinstance(e, FileNotFoundError):
                    corrupt_files.append(filename)
                    print(f"{filename} 파일을 불러올 수 없습니다: {str(e)}")
                else:
                    failed_files.append(filename)
                    print(f"{filename} 파일 처리 중 오류 발생: {str(e)}")

# 손상된 파일 목록을 텍스트 파일에 저장
if corrupt_files:
    with open(OUTPUT_FILE, 'w') as f:
        f.write('\n'.join(corrupt_files))
    print(f"손상된 파일 목록이 '{OUTPUT_FILE}'에 저장되었습니다.")
else:
    print("손상된 파일이 없습니다.")

# 처리에 실패한 파일 목록 출력
if failed_files:
    print("처리에 실패한 파일 목록:")
    for file in failed_files:
        print(file)
else:
    print("처리에 실패한 파일이 없습니다.")
