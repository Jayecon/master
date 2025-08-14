  tempfile temp temp2
  local path ~/dropbox/

  /*merge ALIO_0-15{{{*/
  import excel `path'ALIO_0.xlsx, sheet("Default") firstrow clear
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

  import excel `path'ALIO_1.xlsx, sheet("Default") firstrow clear
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
    merge 1:1 coname year using `temp' , nogen
    save `temp' , replace

  import excel `path'ALIO_2.xlsx, sheet("Default") firstrow clear
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
    merge 1:1 coname year using `temp' , nogen
    save `temp' , replace

  import excel `path'ALIO_3.xlsx, sheet("Default") firstrow clear
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
    merge 1:1 coname year using `temp' , nogen
    save `temp' , replace

  import excel `path'ALIO_4.xlsx, sheet("Default") firstrow clear
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
    merge 1:1 coname year using `temp' , nogen
    save `temp' , replace

  import excel `path'ALIO_5.xlsx, sheet("Default") firstrow clear
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
      rename v talentnc
      label var talentnc "일반정규직 비수도권 지역인재"
      label var year "년도"
    drop 항목 단위
    merge 1:1 coname year using `temp' , nogen
    save `temp' , replace

  import excel `path'ALIO_6.xlsx, sheet("Default") firstrow clear
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
      rename v talentzn
      label var talentzn "일반정규직 이전지역 지역인재"
      label var year "년도"
    drop 항목 단위
    merge 1:1 coname year using `temp' , nogen
    save `temp' , replace

  import excel `path'ALIO_7.xlsx, sheet("Default") firstrow clear
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
    merge 1:1 coname year using `temp' , nogen
    save `temp' , replace

  import excel `path'ALIO_8.xlsx, sheet("Default") firstrow clear
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
      label var asset "자산총계(K-IFRS)"
      label var year "년도"
    drop 항목 단위
    merge 1:1 coname year using `temp' , nogen
    save `temp' , replace

  import excel `path'ALIO_9.xlsx, sheet("Default") firstrow clear
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
      label var liability "부채총계(K-IFRS) "
      label var year "년도"
    drop 항목 단위
    merge 1:1 coname year using `temp' , nogen
    save `temp' , replace

  import excel `path'ALIO_10.xlsx, sheet("Default") firstrow clear
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
      label var capital "자본총계(K-IFRS) "
      label var year "년도"
    drop 항목 단위
    merge 1:1 coname year using `temp' , nogen
    save `temp' , replace

  import excel `path'ALIO_11.xlsx, sheet("Default") firstrow clear
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
    merge 1:1 coname year using `temp' , nogen
    save `temp' , replace

  import excel `path'ALIO_12.xlsx, sheet("Default") firstrow clear
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
    merge 1:1 coname year using `temp' , nogen
    save `temp' , replace

  import excel `path'ALIO_13.xlsx, sheet("Default") firstrow clear
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
    merge 1:1 coname year using `temp' , nogen
    save `temp' , replace

  import excel `path'ALIO_14.xlsx, sheet("Default") firstrow clear
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
    merge 1:1 coname year using `temp' , nogen
    save `temp' , replace

  import excel `path'ALIO_15.xlsx, sheet("Default") firstrow clear
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
    merge 1:1 coname year using `temp' , nogen

    /*error fix and cleaning*/
      replace coname = "한전KDN(주)" if coname == "한전KDN"
      replace coname = trim(coname)
      drop if strpos(coname , "•")
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
    drop if strpos(coname , "•")
    save `temp' , replace
  /*}}}*/
  /*merge ALIO_list_240212{{{*/
  import excel `path'ALIO_list_240212.xlsx, sheet("Default") firstrow clear
    drop 기관유형
    rename 기관명 coname
    rename 지역 area1
      label var area1 "시도"
      replace area1 = "-1" if area1 == "모름/무응답"
      replace area1 = "1" if area1 == "서울특별시"
      replace area1 = "2" if area1 == "부산광역시"
      replace area1 = "3" if area1 == "대구광역시"
      replace area1 = "4" if area1 == "대전광역시"
      replace area1 = "5" if area1 == "인천광역시"
      replace area1 = "6" if area1 == "광주광역시"
      replace area1 = "7" if area1 == "울산광역시"
      replace area1 = "8" if area1 == "경기도"
      replace area1 = "9" if area1 == "강원도"
      replace area1 = "10" if area1 == "충청북도"
      replace area1 = "11" if area1 == "충청남도"
      replace area1 = "12" if area1 == "전라북도"
      replace area1 = "13" if area1 == "전라남도"
      replace area1 = "14" if area1 == "경상북도"
      replace area1 = "15" if area1 == "경상남도"
      replace area1 = "16" if area1 == "제주특별자치도"
      replace area1 = "17" if area1 == "세종특별자치시"
      destring area1 , replace
      label define AREA1 -1 "모름/무응답" 1 "서울" 2 "부산" 3 "대구" 4 "대전" 5 "인천" 6 "광주" 7 "울산" 8 "경기" 9 "강원" 10 "충북" 11 "충남" 12 "전북" 13 "전남" 14 "경북" 15 "경남" 16 "제주" 17 "세종"
      label value area1 AREA1
    rename 주무부처 ministry
      label var ministry "주무부처"
    gen byte certfied = 1
      label var certfied "지정공공기관(2024)"
    replace coname = "한전KDN(주)" if coname == "한전KDN" /*error fix*/
    save `temp2'
  /*}}}*/
  /*merge ALIO_move{{{*/
  import excel `path'alio_move.xlsx, sheet("Sheet1") firstrow clear
    keep 이전지역 기관명 이전 이전공기업 비고 지역인재
    rename 이전지역 movearea
      label var movearea "이전지역"
      replace movearea = "1" if movearea == "부산"
      replace movearea = "2" if movearea == "울산"
      replace movearea = "3" if movearea == "경남"
      replace movearea = "4" if movearea == "대구"
      replace movearea = "5" if movearea == "경북"
      replace movearea = "6" if movearea == "대전"
      replace movearea = "7" if movearea == "충남"
      replace movearea = "8" if movearea == "충북"
      replace movearea = "9" if movearea == "세종"
      replace movearea = "10" if movearea == "광주전남"
      replace movearea = "11" if movearea == "전북"
      replace movearea = "12" if movearea == "강원"
      replace movearea = "13" if movearea == "제주"
      destring movearea , replace
      label define MOVEAREA 1 "부산" 2 "울산" 3 "경남" 4 "대구" 5 "경북" 6 "대전" 7 "충남" 8 "충북" 9 "세종" 10 "광주전남" 11 "전북" 12 "강원" 13 "제주"
      label value movearea MOVEAREA
    rename 기관명 coname
      label var coname "기관명" 
    rename 이전 move
      tempvar tempv1 tempv2 tempv3 tempv4
      recode move (1/9999=1) (100000/999999=2) (10000000/99999999=3) , gen(`tempv1')
      tostring move , replace
      gen `tempv2' = date(move , "Y")   if `tempv1' == 1
      gen `tempv3' = date(move , "YM")  if `tempv1' == 2
      gen `tempv4' = date(move , "YMD") if `tempv1' == 3
      egen movedate = rowlast(`tempv2'-`tempv4')
      label var movedate "이전일시"
      format movedate %td
      drop move
    gen movemonth = month(movedate)
      label var movemonth "이전월"
    gen moveyear = year(movedate)
      label var moveyear "이전년"
    rename 지역인재 talentyear
      label var talentyear "지역인재년"
      replace talentyear = talentyear +2000
    rename 이전공기업 movetype
      label var movetype "이전유형"
      replace movetype = 2 if strpos(비고 , "개별")
      label define MOVETYPE 1 "혁신도시" 2 "개별이전" 3 "이전대상아님"
    drop `tempv1' `tempv2' `tempv3' `tempv4' 비고
  merge 1:1 coname using `temp2'
    drop if _merge == 2
    drop _merge
  save `temp2' , replace
  /*}}}*/

  use `temp' , clear
    merge m:1 coname using `temp2' 
      drop if _merge == 1
      drop _merge
    label data "ALIO 2018-2023"
    sort coname year
    order nitsales tcost-asset , last
    order coname year cotype ministry area1 , first
    compress
  save ~/dropbox/alio.dta , replace


