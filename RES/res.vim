" 폴더 내의 모든 .do 파일에 대해 반복
for file in split(glob("*.do"), '\n')
    " 파일을 읽기 모드로 열기
    execute "edit " . file

    " 파일의 내용을 읽어옴
    let contents = getline(1, "$")

    " "import" 단어가 있는지 확인하고 있으면 해당 줄을 찾음
    let import_line = 0
    for i in range(len(contents))
        if contents[i] =~# '^\s*import\s'
            let import_line = i + 1
            break
        endif
    endfor

    " "import" 단어가 발견되었으면 그 줄에서 첫 번째 " 기호를 "`path'로 바꿈
    g/import/s/"/"`path'/

    " "import" 단어가 발견되었으면 그 위에 "local path cd ~/dropbox/data/res/rawdata/" 추가
    if import_line != 0
        call append(import_line - 1, 'local path ~/dropbox/data/res/rawdata/')
        call append(import_line - 1, 'clear')
    endif

    " 현재 파일명에서 "(" 이후의 문자열을 삭제하여 새로운 파일명 생성
    let new_filename = substitute(expand("%"), '(.*', '', '')

    " 파일의 마지막 줄에 "save 수정된파일명, replace" 추가
    call append("$", ["save `path'".new_filename.", replace"])

    " 변경 사항을 저장하고 파일을 닫음
    w
    bd
endfor
