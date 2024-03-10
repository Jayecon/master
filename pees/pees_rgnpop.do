cd ~/dropbox/pees
import excel "C:\Users\USER\Dropbox\PEES\rawdata\220719_kosis_행정구역별인구.xlsx", sheet("데이터") firstrow clear
  drop X-BL
  drop if missing(a999)
  rename 지역 region
    label var region "지역"
    label define REGION  32 "강원" 31 "경기" 38 "경남" ///
      37 "경북" 24 "광주" 22 "대구" 25 "대전" 21 "부산" ///
      11 "서울" 29 "세종" 26 "울산" 23 "인천" 36 "전남" ///
      35 "전북" 39 "제주" 34 "충남" 33 "충북" 99 "검역"
    replace region = "32"  if region == "강원도"
    replace region = "31"  if region == "경기도"
    replace region = "38"  if region == "경상남도"
    replace region = "37"  if region == "경상북도"
    replace region = "24"  if region == "광주광역시"
    replace region = "22"  if region == "대구광역시"
    replace region = "25"  if region == "대전광역시"
    replace region = "21"  if region == "부산광역시"
    replace region = "11"  if region == "서울특별시"
    replace region = "29"  if region == "세종특별자치시"
    replace region = "26"  if region == "울산광역시"
    replace region = "23"  if region == "인천광역시"
    replace region = "36"  if region == "전라남도"
    replace region = "35"  if region == "전라북도"
    replace region = "39"  if region == "제주특별자치도"
    replace region = "34"  if region == "충청남도"
    replace region = "33"  if region == "충청북도"
    replace region = "99"  if region == "검역"
    replace region = "98"  if region == "전국"
    destring region , replace
		label value region REGION
  rename a999 totpop
    label var totpop "지역별 총인구"
  egen u20pop = rowtotal(a??)
    label var u20pop  "지역별 20세미만 인구"
  drop a??
  drop if region > 90
save rawdata/rgnpop.dta , replace
