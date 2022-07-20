cd ~/dropbox/pees
clear
import delimited "rawdata/corona_220704.csv", encoding(UTF-8)
  /*변수 labeling*/
    label var date "yyyymmdd"
        tostring date , gen(temp)
        gen year  = substr(temp,1,4)
            label var year "yyyy"
        gen month = substr(temp,5,2)
            label var month "mm"
        gen day   = substr(temp,7,2)
            label var day "dd"
    label var confirmed "누적확진자"
    label var death "누적사망자"
    label var released "완치자"
    label var region "지역"
      replace region = "32"   if region == "강원"
      replace region = "31"   if region == "경기"
      replace region = "38"   if region == "경남"
      replace region = "37"   if region == "경북"
      replace region = "24"   if region == "광주"
      replace region = "22"   if region == "대구"
      replace region = "25"   if region == "대전"
      replace region = "21"   if region == "부산"
      replace region = "11"   if region == "서울"
      replace region = "29"  if region == "세종"
      replace region = "26"  if region == "울산"
      replace region = "23"  if region == "인천"
      replace region = "36"  if region == "전남"
      replace region = "35"  if region == "전북"
      replace region = "39"  if region == "제주"
      replace region = "34"  if region == "충남"
      replace region = "33"  if region == "충북"
      replace region = "99"  if region == "검역"
      destring region , replace
    label define REGION  32 "강원" 31 "경기" 38 "경남" ///
      37 "경북" 24 "광주" 22 "대구" 25 "대전" 21 "부산" ///
      11 "서울" 29 "세종" 26 "울산" 23 "인천" 36 "전남" ///
      35 "전북" 39 "제주" 34 "충남" 33 "충북" 99 "검역"
  /*신규확진자, 신규사망자 변수 만들기*/
    sort region year month day
    bys region year month : gen tempf = _n == 1
    bys region year month : gen templ = _n == _N
    keep if tempf | templ
    gen temp1 = .
      bys region year month : replace temp1 = confirmed[2]
      gen nconfirmed = temp1 - confirmed
      label var nconfirmed "신규확진자"
    gen temp2 = .
      bys region year month : replace temp2 = death[2]
      gen ndeath = temp2 - death
      label var ndeath "신규사망자"
  /*일일자료를 월간자료로 변경*/
    keep if tempf
    drop temp* day date released
    destring year month , replace
  /*일일자료를 년간자료로 변경*/
    order region year month , first
		sort region year month 
    foreach i of var confirmed-ndeath {
      bys region year : egen XX`i' = sum(`i')
    }
    drop month-ndeath 
    rename XX* *
      bys region year : keep if _n == 1
label data "지역별 년간 COVID19 (202002-202207)"
compress
save corona.dta , replace
