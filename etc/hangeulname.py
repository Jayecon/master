import os
import unicodedata

def contains_hangul_jaso(text):
    """주어진 텍스트에 한글 자음 또는 모음이 포함되어 있는지 확인하는 함수"""
    for char in text:
        char_code = ord(char)
        if (0x1100 <= char_code <= 0x11FF) or \
           (0x3130 <= char_code <= 0x318F):
            return True
    return False

def normalize_text(text):
    """주어진 텍스트를 정규화하여 반환하는 함수"""
    return unicodedata.normalize('NFC', text)

def fix_hangul_filenames(FOLDER_PATH):
    """주어진 폴더 내의 파일 이름에 있는 한글 자소분리를 수정하는 함수"""
    files_fixed = False
    for filename in os.listdir(FOLDER_PATH):
        # 파일 이름에 한글 자음 또는 모음이 있는지 확인합니다.
        if contains_hangul_jaso(filename):
            # 현재 처리 중인 파일 이름을 출력합니다.
            print("Processing file:", filename)

            # 파일 이름을 정규화합니다.
            normalized_filename = normalize_text(filename)

            # 파일 이름을 수정합니다.
            os.rename(
                os.path.join(FOLDER_PATH, filename),
                os.path.join(FOLDER_PATH, normalized_filename)
            )

            print("Fixed file:", normalized_filename)
            files_fixed = True

    if not files_fixed:
        print("고칠 파일명이 없습니다.")

# 수정할 폴더의 경로를 지정합니다.
# FOLDER_PATH = '/Users/jay/Downloads'
FOLDER_PATH = '/Users/jay/Library/CloudStorage/Dropbox/Data/ALIMI/JArating'

# 함수를 호출하여 파일 이름을 수정합니다.
fix_hangul_filenames(FOLDER_PATH)
