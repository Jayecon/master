  local path ~/dropbox/
    tempfile tfile1 tfile2
    label define YN 1 "예" 0 "아니오"

  /*Import ALIO_location_240212{{{*/
  import excel `path'ALIO_location_240212.xlsx, sheet("Default") firstrow clear
    keep 기관명 
    rename 기관명 coname
      replace coname = trim(coname)
      replace coname = "한전KDN(주)" if coname == "한전KDN" /*error fix*/
      drop if strpos(coname , "•")
    gen byte certfied = 1
      label var certfied "지정공공기관(2024)"
      label value certfied YN
    save `tfile1' , replace
  /*}}}*/
  /*Import ALIO_move{{{*/
  import excel `path'alio_move.xlsx, sheet("Sheet1") firstrow clear
    keep 이전지역 기관명 영문명 이전 이전공기업 비고 지역인재
    rename 이전지역 area
      label var area "소재지역"
      replace area = "2"  if area == "부산"
      replace area = "3"  if area == "대구"
      replace area = "4"  if area == "대전"
      replace area = "7"  if area == "울산"
      replace area = "9"  if area == "강원"
      replace area = "10" if area == "충북"
      replace area = "11" if area == "충남"
      replace area = "12" if area == "전북"
      replace area = "13" if area == "광주전남"
      replace area = "14" if area == "경북"
      replace area = "15" if area == "경남"
      replace area = "16" if area == "제주"
      replace area = "17" if area == "세종"
      destring area , replace
      label define AREA -1 "모름/무응답" 1 "서울" 2 "부산" 3 "대구" 4 "대전" 5 "인천" 6 "광주" 7 "울산" 8 "경기" 9 "강원" 10 "충북" 11 "충남" 12 "전북" 13 "전남" 14 "경북" 15 "경남" 16 "제주" 17 "세종"
      label value area AREA
    rename 기관명 coname
      label var coname "기관명"
      replace coname = trim(coname)
    rename 영문명 engname
      label var engname "기관영문명"
    /*이전일시 년 월 생성*/
      rename 이전 move
        tempvar tvar1 tvar2 tvar3 tvar4
        recode move (1/9999=1) (100000/999999=2) (10000000/99999999=3) , gen(`tvar1')
        tostring move , replace
        gen `tvar2' = date(move , "Y")   if `tvar1' == 1
        gen `tvar3' = date(move , "YM")  if `tvar1' == 2
        gen `tvar4' = date(move , "YMD") if `tvar1' == 3
      egen movedate = rowlast(`tvar2'-`tvar4')
        label var movedate "이전일시"
        format movedate %td
        drop move
      gen movemonth = month(movedate)
          label var movemonth "이전월"
      gen moveyear = year(movedate)
          label var moveyear "이전년"
    rename 지역인재 talentyear
      label var talentyear "지역인재년도"
      replace talentyear = talentyear +2000
      replace talentyear = 2013 if talentyear < 2013 & !missing(talentyear)
      /*혁신도시법 제29조2*/
        /*2013 : 이전공공기관의 장은 해당 기관이 이전하는 지역이 속한 시•도에 소재하는 지방대학을 졸업(예정)인 사람을 우선하여 고용할 수 있다.*/
        /*2016 : 이전지역의 범위를 대통령령으로 정한다.*/
        /*2018 : 대통령령에 따라 채용해야 한다. 그 실적을 매년 공개해야 한다.*/
      /*혁신도시법시행령 제30조2*/
        /*2016 : 해당지역의 시,도로 한다. 대구경북.*/
        /*2018 : 혁신도시를 공동건설한 광역시 및 도. 대구경북.*/
        /*2020 : 별표 1의 비율을 만족할 때 까지 뽑아야 한다. 대구경북. 대전세종충북충남.*/
        /*2022 : 대구경북. 대전세종충북충남. 울산경남.*/
    gen byte talentyn = 1 if !missing(talentyear)
      label var talentyn "지역인재 대상 공기업"
      label value talentyn YN
    rename 이전공기업 movetype
      label var movetype "이전대상여부 및 유형"
      replace movetype = 2 if strpos(비고 , "개별")
      replace movetype = 3 if area == 17
      label define MOVETYPE 1 "혁신도시" 2 "개별이전" 3 "세종시" 4 "N/A"
      label value movetype MOVETYPE
    drop `tvar1' `tvar2' `tvar3' `tvar4' 비고
  save `tfile2' , replace
  /*}}}*/
  /*Gen pimove by merging ALIO location and move files{{{*/
  use `tfile1' , clear
    merge m:1 coname using `tfile2'
      drop if _merge == 1
      drop _merge
    label data "이전 및 지역인재 대상 공기업 명단 2024"
    mvencode certfied , mv(0)
    mvencode talentyn   , mv(0)
    mvencode movetype , mv(4)
    forvalue i = 2006/2020 {
      gen move`i' = 0
        replace move`i' = 1 if `i' >= moveyear
      gen talent`i' = 0
        replace talent`i' = 1 if `i' >= talentyear
    }
    reshape long talent move , i(coname ) j(year)
      label var move "당해년 이전여부"
      label value move YN
      label var talent "당해년 지역인재여부"
      label value talent YN
      label var year "년도"
    sort coname
    order _all , alpha
    order coname year area , first
    compress
  save ~/dropbox/pimove.dta , replace
  /*}}}*/
  /*Gen talent list by collapsing pimove.dta{{{*/
  collapse (sum) a = talent b = move , by(area year)
    rename a talent
      label var talent "지역인재 대상 공공기관수"
    rename b move 
      label var move"이전 공공기관수"
    sort year area
    order year , first
  /*혁신도시법시행령 제30조2*/
    /*2016 : 해당지역의 시,도로 한다. 대구경북.*/
    gen temp1 = 0
    bys year : replace temp1 = talent if area == 3
    bys year : replace temp1 = talent if area == 14
    bys year : egen temp2 = total(temp1)
    replace talent = temp2 if inlist(area , 3 , 14) & year >= 2016
    /*2020 : 대전세종충북충남.*/
    gen temp3 = 0
    bys year : replace temp3 = talent if area == 4
    bys year : replace temp3 = talent if area == 17
    bys year : replace temp3 = talent if area == 10
    bys year : replace temp3 = talent if area == 11
    bys year : egen temp4 = total(temp3)
    replace talent = temp4 if inlist(area , 4 , 17 , 10 , 11 ) & year >= 2020
    /*2022 : 대구경북. 대전세종충북충남. 울산경남.*/
    gen temp5 = 0
    bys year : replace temp5 = talent if area == 7
    bys year : replace temp5 = talent if area == 15
    bys year : egen temp6 = total(temp5)
    replace talent = temp6 if inlist(area , 7 , 15) & year >= 2022
    /*누락된 광주(광주전남) 포함해주기*/
    qui count
    local num = r(N) + 1
    expand 2 if area == 13
    replace area = 6 in `num'/l
    drop temp*
  save `path'localtalent , replace
