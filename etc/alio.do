  tempfile temp

  import excel "/Users/jay/Library/CloudStorage/Dropbox/ALIO_0.xlsx", sheet("Default") firstrow clear
    replace I = "" if I == "-"
    destring _all , replace
      rename 기관명       coname
        label var coname "기관명"
      rename 기관유형     cotype
        label var cotype "기관유형"
      rename 부설기관여부 attach
        label var attach "부설기관여부"
      rename 년           v2018
      rename E            v2019
      rename F            v2020
      rename G            v2021
      rename H            v2022
      rename I            v2023
    reshape long v , i(coname) j(year)
      replace v=v*1000
      rename v wagenc
      label var wagenc "신입사윈 초임"
      label var year "년도"
    drop 항목 단위
    save `temp'

  import excel "/Users/jay/Library/CloudStorage/Dropbox/ALIO_1.xlsx", sheet("Default") firstrow clear
    replace I = "" if I == "-"
    destring _all , replace
      rename 기관명       coname
        label var coname "기관명"
      rename 기관유형     cotype
        label var cotype "기관유형"
      rename 부설기관여부 attach
        label var attach "부설기관여부"
      rename 년           v2018
      rename E            v2019
      rename F            v2020
      rename G            v2021
      rename H            v2022
      rename I            v2023
    reshape long v , i(coname) j(year)
      replace v=v*1000
      rename v wageav
      label var wageav "일반정규직 1인당 평균 보수액"
      label var year "년도"
    drop 항목 단위
    append using `temp'
    save `temp' , replace

  import excel "/Users/jay/Library/CloudStorage/Dropbox/ALIO_2.xlsx", sheet("Default") firstrow clear
    replace I = "" if I == "-"
    destring _all , replace
      rename 기관명       coname
        label var coname "기관명"
      rename 기관유형     cotype
        label var cotype "기관유형"
      rename 부설기관여부 attach
        label var attach "부설기관여부"
      rename 년           v2018
      rename E            v2019
      rename F            v2020
      rename G            v2021
      rename H            v2022
      rename I            v2023
    reshape long v , i(coname) j(year)
      rename v totalwkr
      label var totalwkr "일반정규직 상시종업원수"
      label var year "년도"
    drop 항목 단위
    append using `temp'
    save `temp' , replace

  import excel "/Users/jay/Library/CloudStorage/Dropbox/ALIO_3.xlsx", sheet("Default") firstrow clear
    replace I = "" if I == "-"
    destring _all , replace
      rename 기관명       coname
        label var coname "기관명"
      rename 기관유형     cotype
        label var cotype "기관유형"
      rename 부설기관여부 attach
        label var attach "부설기관여부"
      rename 년           v2018
      rename E            v2019
      rename F            v2020
      rename G            v2021
      rename H            v2022
      rename I            v2023
    reshape long v , i(coname) j(year)
      rename v monthavg
      label var monthavg "일반정규직 평균근속월수"
      label var year "년도"
    drop 항목 단위
    append using `temp'
    save `temp' , replace

  import excel "/Users/jay/Library/CloudStorage/Dropbox/ALIO_4.xlsx", sheet("Default") firstrow clear
    replace I = "" if I == "-"
    destring _all , replace
      rename 기관명       coname
        label var coname "기관명"
      rename 기관유형     cotype
        label var cotype "기관유형"
      rename 부설기관여부 attach
        label var attach "부설기관여부"
      rename 년           v2018
      rename E            v2019
      rename F            v2020
      rename G            v2021
      rename H            v2022
      rename I            v2023
    reshape long v , i(coname) j(year)
      rename v totalnc
      label var totalnc "일반정규직 총신규채용"
      label var year "년도"
    drop 항목 단위
    append using `temp'
    save `temp' , replace

  import excel "/Users/jay/Library/CloudStorage/Dropbox/ALIO_5.xlsx", sheet("Default") firstrow clear
    replace I = "" if I == "-"
    destring _all , replace
      rename 기관명       coname
        label var coname "기관명"
      rename 기관유형     cotype
        label var cotype "기관유형"
      rename 부설기관여부 attach
        label var attach "부설기관여부"
      rename 년           v2018
      rename E            v2019
      rename F            v2020
      rename G            v2021
      rename H            v2022
      rename I            v2023
    reshape long v , i(coname) j(year)
      rename v nctalent
      label var nctalent "일반정규직 비수도권 지역인재"
      label var year "년도"
    drop 항목 단위
    append using `temp'
    save `temp' , replace

  import excel "/Users/jay/Library/CloudStorage/Dropbox/ALIO_6.xlsx", sheet("Default") firstrow clear
    replace I = "" if I == "-"
    destring _all , replace
      rename 기관명       coname
        label var coname "기관명"
      rename 기관유형     cotype
        label var cotype "기관유형"
      rename 부설기관여부 attach
        label var attach "부설기관여부"
      rename 년           v2018
      rename E            v2019
      rename F            v2020
      rename G            v2021
      rename H            v2022
      rename I            v2023
    reshape long v , i(coname) j(year)
      rename v zntalent
      label var zntalent "일반정규직 이전지역 지역인재"
      label var year "년도"
    drop 항목 단위
    append using `temp'
    save `temp' , replace

  import excel "/Users/jay/Library/CloudStorage/Dropbox/ALIO_7.xlsx", sheet("Default") firstrow clear
    replace I = "" if I == "-"
    destring _all , replace
      rename 기관명       coname
        label var coname "기관명"
      rename 기관유형     cotype
        label var cotype "기관유형"
      rename 부설기관여부 attach
        label var attach "부설기관여부"
      rename 년           v2018
      rename E            v2019
      rename F            v2020
      rename G            v2021
      rename H            v2022
      rename I            v2023
    reshape long v , i(coname) j(year)
      rename v totalnum
      label var totalnum "임직원 총계"
      label var year "년도"
    drop 항목 단위
    append using `temp'
    save `temp' , replace

  import excel "/Users/jay/Library/CloudStorage/Dropbox/ALIO_8.xlsx", sheet("Default") firstrow clear
    replace I = "" if I == "-"
    destring _all , replace
      rename 기관명       coname
        label var coname "기관명"
      rename 기관유형     cotype
        label var cotype "기관유형"
      rename 부설기관여부 attach
        label var attach "부설기관여부"
      rename 년           v2018
      rename E            v2019
      rename F            v2020
      rename G            v2021
      rename H            v2022
      rename I            v2023
    reshape long v , i(coname) j(year)
      replace v=v*1000000
      rename v asset
      label var asset "K-IFRS 자산총계"
      label var year "년도"
    drop 항목 단위
    append using `temp'
    save `temp' , replace

  import excel "/Users/jay/Library/CloudStorage/Dropbox/ALIO_9.xlsx", sheet("Default") firstrow clear
    replace I = "" if I == "-"
    destring _all , replace
      rename 기관명       coname
        label var coname "기관명"
      rename 기관유형     cotype
        label var cotype "기관유형"
      rename 부설기관여부 attach
        label var attach "부설기관여부"
      rename 년           v2018
      rename E            v2019
      rename F            v2020
      rename G            v2021
      rename H            v2022
      rename I            v2023
    reshape long v , i(coname) j(year)
      replace v=v*1000000
      rename v liability
      label var liability "K-IFRS 부채총계"
      label var year "년도"
    drop 항목 단위
    append using `temp'
    save `temp' , replace

  import excel "/Users/jay/Library/CloudStorage/Dropbox/ALIO_10.xlsx", sheet("Default") firstrow clear
    replace I = "" if I == "-"
    destring _all , replace
      rename 기관명       coname
        label var coname "기관명"
      rename 기관유형     cotype
        label var cotype "기관유형"
      rename 부설기관여부 attach
        label var attach "부설기관여부"
      rename 년           v2018
      rename E            v2019
      rename F            v2020
      rename G            v2021
      rename H            v2022
      rename I            v2023
    reshape long v , i(coname) j(year)
      replace v=v*1000000
      rename v capital
      label var capital "K-IFRS 자본총계"
      label var year "년도"
    drop 항목 단위
    append using `temp'
    save `temp' , replace

  import excel "/Users/jay/Library/CloudStorage/Dropbox/ALIO_11.xlsx", sheet("Default") firstrow clear
    replace I = "" if I == "-"
    destring _all , replace
      rename 기관명       coname
        label var coname "기관명"
      rename 기관유형     cotype
        label var cotype "기관유형"
      rename 부설기관여부 attach
        label var attach "부설기관여부"
      rename 년           v2018
      rename E            v2019
      rename F            v2020
      rename G            v2021
      rename H            v2022
      rename I            v2023
    reshape long v , i(coname) j(year)
      replace v=v*1000000
      rename v sales
      label var sales "매출"
      label var year "년도"
    drop 항목 단위
    append using `temp'
    save `temp' , replace

  import excel "/Users/jay/Library/CloudStorage/Dropbox/ALIO_12.xlsx", sheet("Default") firstrow clear
    replace I = "" if I == "-"
    destring _all , replace
      rename 기관명       coname
        label var coname "기관명"
      rename 기관유형     cotype
        label var cotype "기관유형"
      rename 부설기관여부 attach
        label var attach "부설기관여부"
      rename 년           v2018
      rename E            v2019
      rename F            v2020
      rename G            v2021
      rename H            v2022
      rename I            v2023
    reshape long v , i(coname) j(year)
      replace v=v*1000000
      rename v oprofit
      label var oprofit "영업이익"
      label var year "년도"
    drop 항목 단위
    append using `temp'
    save `temp' , replace

  import excel "/Users/jay/Library/CloudStorage/Dropbox/ALIO_13.xlsx", sheet("Default") firstrow clear
    replace I = "" if I == "-"
    destring _all , replace
      rename 기관명       coname
        label var coname "기관명"
      rename 기관유형     cotype
        label var cotype "기관유형"
      rename 부설기관여부 attach
        label var attach "부설기관여부"
      rename 년           v2018
      rename E            v2019
      rename F            v2020
      rename G            v2021
      rename H            v2022
      rename I            v2023
    reshape long v , i(coname) j(year)
      replace v=v*1000000
      rename v tprofit
      label var tprofit "총수익"
      label var year "년도"
    drop 항목 단위
    append using `temp'
    save `temp' , replace

  import excel "/Users/jay/Library/CloudStorage/Dropbox/ALIO_14.xlsx", sheet("Default") firstrow clear
    replace I = "" if I == "-"
    destring _all , replace
      rename 기관명       coname
        label var coname "기관명"
      rename 기관유형     cotype
        label var cotype "기관유형"
      rename 부설기관여부 attach
        label var attach "부설기관여부"
      rename 년           v2018
      rename E            v2019
      rename F            v2020
      rename G            v2021
      rename H            v2022
      rename I            v2023
    reshape long v , i(coname) j(year)
      replace v=v*1000000
      rename v tcost
      label var tcost "총비용"
      label var year "년도"
    drop 항목 단위
    append using `temp'
    save `temp' , replace

  import excel "/Users/jay/Library/CloudStorage/Dropbox/ALIO_15.xlsx", sheet("Default") firstrow clear
    replace I = "" if I == "-"
    destring _all , replace
      rename 기관명       coname
        label var coname "기관명"
      rename 기관유형     cotype
        label var cotype "기관유형"
      rename 부설기관여부 attach
        label var attach "부설기관여부"
      rename 년           v2018
      rename E            v2019
      rename F            v2020
      rename G            v2021
      rename H            v2022
      rename I            v2023
    reshape long v , i(coname) j(year)
      replace v=v*1000000
      rename v nitsales
      label var nitsales "매출액순이익률"
      label var year "년도"
    drop 항목 단위
    append using `temp'
    save `temp' , replace

  label define COTYPE 1 "공기업(시장형)" 2 "공기업(준시장형)" 3 "기타공공기관" 4 "준정부기관(기금관리형)" 5 "준정부기관(위탁집행형)"
    replace cotype = "1" if cotype == "공기업(시장형)"
    replace cotype = "2" if cotype == "공기업(준시장형)"
    replace cotype = "3" if cotype == "기타공공기관"
    replace cotype = "4" if cotype == "준정부기관(기금관리형)"
    replace cotype = "5" if cotype == "준정부기관(위탁집행형)"
    destring cotype , replace
    label value cotype COTYPE
  label define YN 1 "예" 0 "아니오"
    replace attach = "1" if attach == "Y"
    replace attach = "0" if attach == "N"
    destring attach , replace
    label value attach YN
  save ~/dropbox/alio.dta , replace
