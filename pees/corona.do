cd ~/dropbox/ohong
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
        replace region = "1"   if region == "강원"
        replace region = "2"   if region == "경기"
        replace region = "3"   if region == "경남"
        replace region = "4"   if region == "경북"
        replace region = "5"   if region == "광주"
        replace region = "6"   if region == "대구"
        replace region = "7"   if region == "대전"
        replace region = "8"   if region == "부산"
        replace region = "9"   if region == "서울"
        replace region = "10"  if region == "세종"
        replace region = "11"  if region == "울산"
        replace region = "12"  if region == "인천"
        replace region = "13"  if region == "전남"
        replace region = "14"  if region == "전북"
        replace region = "15"  if region == "제주"
        replace region = "16"  if region == "충남"
        replace region = "17"  if region == "충북"
        replace region = "18"  if region == "검역"
        destring region , replace
        label define REGION  1  "강원" 2  "경기" 3  "경남" ///
            4  "경북" 5  "광주" 6  "대구" 7  "대전" 8  "부산" ///
            9  "서울" 10 "세종" 11 "울산" 12 "인천" 13 "전남" ///
            14 "전북" 15 "제주" 16 "충남" 17 "충북" 18 "검역"
        label value region REGION
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
label data "지역별 월간 COVID19 (202002-202207)"
compress
save corona.dta , replace
