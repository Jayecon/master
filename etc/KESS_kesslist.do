clear
local path ~/dropbox/data/
import excel `path'alimi/kess_list_2023.xlsx , sheet("대학") firstrow allstring
    label data "교육통계서비스 학교 개황(2023)"
    compress
    destring _all , replace
    rename 학교종류 schooldtl
        label var schooldtl "학교종류(KESS)"
        label define SCHOOLDTL 1 "각종대학(대학)" 2 "교육대학" 3 "기능대학" 4 "기술대학" ///
        5 "대학교" 6 "방송통신대학" 7 "사내대학(대학)" 8 "사내대학(전문)" ///
        9 "사이버대학(대학)" 10 "사이버대학(전문)" 11 "산업대학" 12 "원격대학(대학)" ///
        13 "원격대학(전문)" 14 "전공대학" 15 "전문대학" 
        replace schooldtl = "1"  if schooldtl == "각종대학(대학)"
        replace schooldtl = "2"  if schooldtl == "교육대학"
        replace schooldtl = "3"  if schooldtl == "기능대학"
        replace schooldtl = "4"  if schooldtl == "기술대학"
        replace schooldtl = "5"  if schooldtl == "대학교"
        replace schooldtl = "6"  if schooldtl == "방송통신대학"
        replace schooldtl = "7"  if schooldtl == "사내대학(대학)"
        replace schooldtl = "8"  if schooldtl == "사내대학(전문)"
        replace schooldtl = "9"  if schooldtl == "사이버대학(대학)"
        replace schooldtl = "10" if schooldtl == "사이버대학(전문)"
        replace schooldtl = "11" if schooldtl == "산업대학"
        replace schooldtl = "12" if schooldtl == "원격대학(대학)"
        replace schooldtl = "13" if schooldtl == "원격대학(전문)"
        replace schooldtl = "14" if schooldtl == "전공대학"
        replace schooldtl = "15" if schooldtl == "전문대학"
        destring schooldtl , replace
        label value schooldtl SCHOOLDTL
    rename 시도 area
        label var area "지역"
        label define AREA 1  "서울" 2  "부산" 3  "대구" 4  "대전" 5  "인천" 6  "광주" ///
        7  "울산" 8  "경기" 9  "강원" 10 "충북" 11 "충남" 12 "전북" 13 "전남" ///
        14 "경북" 15 "경남" 16 "제주" 17 "세종"
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
    rename 행정구 areadetail
        label var areadetail "시군구(KESS)"
    rename 학교명 uniname
        label var uniname "학교명"
    rename 본분교 branchdtl
        label var branchdtl "본분교(KESS)"
        label define BRANCHDTL 1 `"본교(제1캠퍼스)"' 2 `"본교(제2캠퍼스)"' ///
        3 `"본교(제3캠퍼스)"' 4 `"본교(제4캠퍼스)"' 5 `"분교(제1캠퍼스)"'
        replace branchdtl = "1" if branchdtl == "본교(제1캠퍼스)" 
        replace branchdtl = "2" if branchdtl == "본교(제2캠퍼스)" 
        replace branchdtl = "3" if branchdtl == "본교(제3캠퍼스)" 
        replace branchdtl = "4" if branchdtl == "본교(제4캠퍼스)" 
        replace branchdtl = "5" if branchdtl == "분교(제1캠퍼스)" 
        destring branchdtl , replace
        label value branchdtl BRANCHDTL
    rename 학교상태 status
        label var status "학교상태" 
        label define STATUS 1 "기존" 2 "신설" 3 "폐교" 4 "학교명 변경"
        replace status = "1" if status == "기존"
        replace status = "2" if status == "신설"
        replace status = "3" if status == "폐교"
        replace status = "4" if status == "학교명 변경"
        destring status , replace
        label value status STATUS
    rename 설립 found
        label var found "설립구분" 
        label define FOUND 1 "국립" 2 "공립" 3 "사립" 4 "국립대법인" 5 "특별법국립" ///
        6 "특별법법인" 7 "기타"
        replace found = "1" if found == "국립"
        replace found = "2" if found == "공립"
        replace found = "3" if found == "사립"
        replace found = "4" if found == "국립대법인"
        replace found = "5" if found == "특별법국립"
        replace found = "6" if found == "특별법법인"
        replace found = "7" if found == "기타"
        destring found , replace
        label value found FOUND
    rename 우편번호 zipcode
        label var zipcode "우편번호(KESS)"
    rename 주소 address
        label var address "주소(KESS)"
    /*error collection*/
        replace zipcode = 02455 if strpos(address , "서울 동대문구 회기로 85")
        replace zipcode = 38610 if strpos(address , "서울 동대문구 회기로 85")
        replace address = "경기도 포천시 신북면 신평로 154" if uniname == "경복대학교" & branchdtl == 1
        replace zipcode = 11138 if uniname == "경복대학교" & branchdtl == 1
        replace uniname = "한밭대학교(산업대)" if uniname == "한밭대학교" & schooldtl == 11

    drop 연도 팩스번호 학교명영문 전화번호 팩스번호 홈페이지
compress
save `path'/dta/kesslist , replace
