clear
local path ~/dropbox/data/
import excel `path'alimi/ALIMI_list_231204.xls , sheet("empty") firstrow allstring
  label data "대학알리미 학교 개황(20231214)"
  compress
  destring _all , replace
    rename 학교구분 uniclass
      label var uniclass "학교구분"
      label define UNICLASS 1 "대학" 2 "대학원" 3 "대학원대학" 4 "전문대학"
      replace uniclass = "1" if uniclass == "대학"
      replace uniclass = "2" if uniclass == "대학원"
      replace uniclass = "3" if uniclass == "대학원대학"
      replace uniclass = "4" if uniclass == "전문대학"
      destring uniclass, replace
      label value uniclass UNICLASS
    rename 학교코드 unicode
      label var unicode "학교코드"
    rename 학교명 camname
      label var camname "캠퍼스명"
      gen uniname = substr(camname, 1, strpos(camname, "(") - 1)
      replace uniname = camname if missing(uniname)
      label var uniname "대학명"
    rename 본분교 branch
      label var branch "본분교"
      label define BRANCH 1 "본교" 2 "분교" 3 "캠퍼스"
      replace branch = "1" if branch == "본교"
      replace branch = "2" if branch == "분교"
      replace branch = "3" if strpos(branch , "캠퍼스")
      destring branch , replace
      label value branch BRANCH
    rename 학제 school
      label var school "학제"
      label define SCHOOL 1 "2-3년제" 2 "4년제" 3 "교육대" 4 "대학원"
      replace school = "2" if school == "대학교" & uniclass == 1
      replace school = "3" if school == "교육대학"
      replace school = "4" if inlist(uniclass , 2 , 3)
      replace school = "1" if !inlist(school , "2" , "3" , "4")
      destring school , replace
      label value school SCHOOL
    rename 지역 area
      label var area "지역"
      label define AREA 1  "서울" 2  "부산" 3  "대구" 4  "대전" 5  "인천" 6  "광주" 7  "울산" 8  "경기" 9  "강원" 10 "충북" 11 "충남" 12 "전북" 13 "전남" 14 "경북" 15 "경남" 16 "제주" 17 "세종"
      replace area = "1"  if area == "서울"
      replace area = "2"  if area == "부산"
      replace area = "3"  if area == "대구"
      replace area = "4"  if area == "대전"
      replace area = "5"  if area == "인천"
      replace area = "6"  if area == "광주"
      replace area = "7"  if area == "울산"
      replace area = "8"  if area == "경기"
      replace area = "9"  if area == "강원"
      replace area = "10" if area == "충북"
      replace area = "11" if area == "충남"
      replace area = "12" if area == "전북"
      replace area = "13" if area == "전남"
      replace area = "14" if area == "경북"
      replace area = "15" if area == "경남"
      replace area = "16" if area == "제주"
      replace area = "17" if area == "세종"
      destring area, replace
      label value area AREA
    rename 설립구분 found
      label var found "설립구분" 
      label define FOUND 1 "국립" 2 "공립" 3 "사립" 4 "국립대법인" 5 "특별법국립" 6 "특별법법인" 7 "기타"
      replace found = "1" if found == "국립"
      replace found = "2" if found == "공립"
      replace found = "3" if found == "사립"
      replace found = "4" if found == "국립대법인"
      replace found = "5" if found == "특별법국립"
      replace found = "6" if found == "특별법법인"
      replace found = "7" if found == "기타"
      destring found , replace
      label value found FOUND
    rename 관련법령 legalbase
     label var legalbase "관련법령"
     label define LEGALBASE 1 "개별설치령에 의한 국립학교" 2 "고등교육법" 3 "국민 평생 직업능력 개발법" 4 "기타" 5 "특별법국립" 6 "특별법법인"
     replace legalbase = "1" if legalbase == "개별설치령에 의한 국립학교"
     replace legalbase = "2" if legalbase == "고등교육법"
     replace legalbase = "3" if legalbase == "국민 평생 직업능력 개발법"
     replace legalbase = "4" if legalbase == "기타"
     replace legalbase = "5" if legalbase == "특별법국립"
     replace legalbase = "6" if legalbase == "특별법법인"
     destring legalbase , replace
     label value legalbase LEGALBASE
    rename 법인명 foundname
      label var foundname "법인명"
    rename 학교상태 status
      label var status "학교상태" 
      label define STATUS 1 "기존" 2 "신설" 3 "폐교" 4 "학교명 변경"
      replace status = "1" if status == "기존"
      replace status = "2" if status == "신설"
      replace status = "3" if status == "폐교"
      replace status = "4" if status == "학교명 변경"
      destring status , replace
      label value status STATUS
    gen founddate = date(학교개교일 , "YMD" )
      label var founddate "학교개교일"
      format founddate %td
      drop 학교개교일
    rename 주소 address
        label var address "주소"
    drop 학교명한자 학교명영문 영문주소 중문주소 우편번호 학교홈페이지 총장명 학교대표번호 학교대표팩스번호
  compress
save `path'/dta/alimilist , replace
