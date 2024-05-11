 clear
 import excel "/Users/jay/Library/CloudStorage/Dropbox/Data/KOSIS/시군구_성_연령_5세_별_주민등록연앙인구_20240505144628.xlsx" ///
    , sheet("데이터") firstrow
    rename (행정구역시군구별 시점) (area year)
    rename 계 popsum
    rename 세 pop2529
    rename F  pop3034
    drop 성별
    /*area cleaning*/
        label var area "지역"
        label define AREA 1  "서울" 2  "부산" 3  "대구" 4  "대전" 5  "인천" 6  "광주" ///
        7 "울산" 8  "경기" 9  "강원" 10 "충북" 11 "충남" 12 "전북" 13 "전남" 14 "경북" ///
        15 "경남" 16 "제주" 17 "세종"
        replace area = "1"  if strpos(area , "서울")
        replace area = "2"  if strpos(area , "부산")
        replace area = "3"  if strpos(area , "대구")
        replace area = "4"  if strpos(area , "대전")
        replace area = "5"  if strpos(area , "인천")
        replace area = "6"  if strpos(area , "광주")
        replace area = "7"  if strpos(area , "울산")
        replace area = "8"  if strpos(area , "경기")
        replace area = "9"  if strpos(area , "강원")
        replace area = "10" if strpos(area , "충청북도")
        replace area = "11" if strpos(area , "충청남도")
        replace area = "12" if strpos(area , "전라북도")
        replace area = "13" if strpos(area , "전라남도")
        replace area = "14" if strpos(area , "경상북도")
        replace area = "15" if strpos(area , "경상남도")
        replace area = "16" if strpos(area , "제주")
        replace area = "17" if strpos(area , "세종")
        drop if area == "전 국"
        destring area, replace
        label value area AREA
    /*year*/
        destring year , replace
        label var year "년도"
    /*pop2534*/
        gen pop2534 = pop3034 + pop2529
        label var pop2534 "25-34 인구"
    drop popsum pop3034 pop2529 
save ~/dropbox/data/kosis/kosis_pop_gomseq.dta , replace
