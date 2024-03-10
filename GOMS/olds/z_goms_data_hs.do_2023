set more off
set maxvar 30000
cd ~/dropbox/goms
  /* 고교정보 append and merge {{{*/
  tempfile temp
  forvalue x = 9/19 {
    local yr : disp %02.0f  = `x'
    use ~/dropbox/goms/rawdata/GP`yr' , clear
    drop if missing(g`yr'1sex)
    rename g`yr'1* * 
    keep pid f001-f002 f006-f009 
    gen year = 2000 + `x'
      label var year "조사년도"
    merge 1:1 pid using ~/dropbox/goms/rawdata/goms_gh`yr' , nogen
      replace hsname = "" if strpos(hsname, "-1")
      replace hsname = "" if strpos(hsname, "-2")
      replace hsname = "" if strpos(hsname, "모름")
      replace hsname = "" if strpos(hsname, "무응답")
      replace hsname = "" if strpos(hsname, "비공개")
      replace hsname = "" if strpos(hsname, "거절")
      replace hsname = "" if strpos(hsname, "탁송")
      capture label var hsname "출신고교명"
      capture drop hscode 
    if `x' == 9 {
      save `temp' , replace
    }
    else {
      append using `temp'
      save `temp' , replace
    }
  }
  /*}}}*/
  capture drop hsnamec
    gen hsnamec = hsname
    label var hsnamec "출신고교명(cleaned)"
    levelsof hsname , local(hslist)
    /*학교명 필터(DO NOT SORT){{{*/
    foreach i of local hslist {
      local temp = ustrregexrf("`i'"    , "\s+"                  , "")
      local temp = ustrregexrf("`temp'" , "\s+"                  , "")
      local temp = ustrregexrf("`temp'" , "\s+"                  , "")
      local temp = ustrregexrf("`temp'" , "\:"                   , "")
      local temp = ustrregexrf("`temp'" , "\/"                   , "")
      local temp = ustrregexrf("`temp'" , "\/"                   , "")
      local temp = ustrregexrf("`temp'" , "\-"                   , "")
      local temp = ustrregexrf("`temp'" , "\([\/가-힣]+\)"       , "")
      local temp = ustrregexrf("`temp'" , "\([\/가-힣]+\)"       , "")
      local temp = ustrregexrf("`temp'" , "\([\/가-힣]+"         , "")
      local temp = ustrregexrf("`temp'" , "[0-9]+"               , "")
      /*과학고 항목*/
      local temp = ustrregexrf("`temp'" , "과고$"                , "과학고등학교")
      local temp = ustrregexrf("`temp'" , "과학$"                , "과학고등학교")
      /*외고 항목*/
      local temp = ustrregexrf("`temp'" , "외국어$"              , "외국어고등학교")
      local temp = ustrregexrf("`temp'" , "외국$"                , "외국어고등학교")
      local temp = ustrregexrf("`temp'" , "외고$"                , "외국어고등학교")
      local temp = ustrregexrf("`temp'" , "외고등학교$"          , "외국어고등학교")
      local temp = ustrregexrf("`temp'" , "외$"                  , "외국어고등학교")
      /*국제고 및 예술고*/
      local temp = ustrregexrf("`temp'" , "국제$"                , "국제고등학교")
      local temp = ustrregexrf("`temp'" , "예술$"                , "예술고등학교")
      /*사대부고*/
      local temp = ustrregexrf("`temp'" , "사범대부속"           , "대학교사범대학부속")
      local temp = ustrregexrf("`temp'" , "대대학교사범대학부속" , "대학교사범대학부속")
      local temp = ustrregexrf("`temp'" , "대사범대부속"         , "대학교사범대학부속")
      local temp = ustrregexrf("`temp'" , "대부속"               , "대학교사범대학부속")
      local temp = ustrregexrf("`temp'" , "대학사"               , "대학교사")
      local temp = ustrregexrf("`temp'" , "대사대"               , "대학교사범대학")
      local temp = ustrregexrf("`temp'" , "교부속"               , "교사범대학부속")
      local temp = ustrregexrf("`temp'" , "대부속"               , "대학교사범대학부속")
      local temp = ustrregexrf("`temp'" , "대사범대부속"         , "대학교사범대학부속")
      local temp = ustrregexrf("`temp'" , "대사범대학"           , "대학교사범대학부속")
      local temp = ustrregexrf("`temp'" , "사대부속"             , "사범대학부속")
      local temp = ustrregexrf("`temp'" , "사대부대"             , "사범대학부속")
      local temp = ustrregexrf("`temp'" , "사범부속"             , "사범대학부속")
      local temp = ustrregexrf("`temp'" , "사범부설"             , "사범대학부설")
      local temp = ustrregexrf("`temp'" , "사대부고"             , "사범대학부속고")
      local temp = ustrregexrf("`temp'" , "사범대학학교사범대학" , "사범대학")
      local temp = ustrregexrf("`temp'" , "부속부속"             , "부속")
      local temp = ustrregexrf("`temp'" , "대부$"                , "대학교사범대학부속고등학교")
      local temp = ustrregexrf("`temp'" , "대부고$"              , "대학교사범대학부속고등학교")
      local temp = ustrregexrf("`temp'" , "사대학교"             , "대학교")
      local temp = ustrregexrf("`temp'" , "부설$"                , "부설고등학교")
      local temp = ustrregexrf("`temp'" , "부속$"                , "부속고등학교")
      /*.*대*/
      local temp = ustrregexrf("`temp'" , "^중대"                , "중앙대")
      /*마지막정리*/
      local temp = ustrregexrf("`temp'" , "여자$"                , "여자고")
      local temp = ustrregexrf("`temp'" , "여고$"                , "여자고")
      local temp = ustrregexrf("`temp'" , "여대"                 , "여자대")
      local temp = ustrregexrf("`temp'" , "고등학교고등학교"     , "고등학교")
      local temp = ustrregexrf("`temp'" , "고등$"                , "고등학교")
      local temp = ustrregexrf("`temp'" , "고$"                  , "고등학교")
      replace hsnamec = "`temp'" if hsname == "`i'"
    }
    /*}}}*/
  /*학교명 예외사례 강제 정정{{{*/
      replace hsnamec = ""                                 if strlen(hsnamec) <= 2
      replace hsnamec = hsnamec + "고등학교"               if !ustrregexm(hsnamec , "학교$")
      replace hsnamec = "KAIST부설한국과학영재학교"        if strpos(hsnamec , "과학영재")                             & f006 == 2
      replace hsnamec = "경기과학고등학교"                 if hsnamec == "경기과락고등학교"
      replace hsnamec = "경신고등학교"                     if strpos(hsnamec , "경신")                                 & f007 == 307
      replace hsnamec = "경일고등학교"                     if strpos(hsnamec , "경일")                                 & f007 == 301
      replace hsnamec = "광주동신고등학교"                 if hsnamec == "동신고등학교"                                & f006 == 6
      replace hsnamec = "대성고등학교"                     if strpos(hsnamec , "대성")                                 & f007 == 405
      replace hsnamec = "대원외국어고등학교"               if strpos(hsnamec , "대원")                                 & f007 == 106 & inlist(f009 , 3 , 9)
      replace hsnamec = "대일외국어고등학교"               if strpos(hsnamec , "대일")                                 & f007 == 117
      replace hsnamec = "부산국제외국어고등학교"           if strpos(hsnamec , "국제외")                               & f007 == 216
      replace hsnamec = "동성고등학교"                     if strpos(hsnamec , "동성")                                 & f007 == 123
      replace hsnamec = "동신고등학교"                     if hsnamec == "대전동신고등학교"                            & f006 == 4
      replace hsnamec = "동신고등학교"                     if hsnamec == "동신과학고등학교"                            & f001 <= 2016
      replace hsnamec = "명덕외국어고등학교"               if strpos(hsnamec , "명덕")                                 & f007 == 104
      replace hsnamec = "부일외국어고등학교"               if strpos(hsnamec , "부일")                                 & f007 == 210
      replace hsnamec = "북일고등학교"                     if strpos(hsnamec , "북일")                                 & f007 == 1113
      replace hsnamec = "북일고등학교"                     if hsnamec == "천안북일고등학교"
      replace hsnamec = "서울세종고등학교"                 if inlist( hsnamec , "서울세정고등학교" , "세종고등학교")   & inlist(f007 , 101 , 115 )
      replace hsnamec = "선덕고등학교"                     if strpos(hsnamec , "선덕")                                 & f007 == 110
      replace hsnamec = "숙명여자고등학교"                 if inlist( hsnamec , "숙명고등학교" , "숙명여고등학교")     & inlist(f007 , 101 , 115 )
      replace hsnamec = "신일고등학교"                     if strpos(hsnamec , "신일")                                 & f007 == 103
      replace hsnamec = "안산동산고등학교"                 if strpos(hsnamec , "동산")                                 & f007 == 815
      replace hsnamec = "언남고등학교"                     if inlist( hsnamec , "서울언남고등학교" , "언남자고등학교") & inlist(f007 , 101 , 115 )
      replace hsnamec = "용인한국외국어대학교부설고등학교" if strpos(hsnamec , "한국외")                               & f007 == 823
      replace hsnamec = "이화여자외국어고등학교"           if strpos(hsnamec , "이화")                                 & f007 == 124
      replace hsnamec = "인천진산고등학교"                 if strpos(hsnamec , "진산")                                 & f007 == 506 & f009 != 3
      replace hsnamec = "장훈고등학교"                     if strpos(hsnamec , "장훈")                                 & f007 == 120
      replace hsnamec = "중앙고등학교"                     if strpos(hsnamec , "중앙")                                 & f007 == 123
      replace hsnamec = "중산외국어고등학교"               if strpos(hsnamec , "증산외")
      replace hsnamec = "한가람고등학교"                   if strpos(hsnamec , "한가람")                               & f007 == 119
      replace hsnamec = "한영외국어고등학교"               if strpos(hsnamec , "한영")                                 & f007 == 102
      replace hsnamec = "현대고등학교"                     if strpos(hsnamec , "현대")                                 & f007 == 101
      replace hsnamec = "현대청운고등학교"                 if strpos(hsnamec , "청운")                                 & f006 == 7
      replace hsnamec = "광양제철고등학교"                 if strpos(hsnamec , "제철고등학교")                         & f007 == 1304
      replace hsnamec = "포항제철고등학교"                 if strpos(hsnamec , "제철고등학교")                         & f007 == 1423

      replace hsnamec = "단국대학교사범대학부속고등학교"   if hsnamec == "단국"                                        & f007 == 101
      replace hsnamec = "단국대학교사범대학부속고등학교"   if hsnamec == "단국대학교사범대학무"
      replace hsnamec = "단국대학교사범대학부속고등학교"   if hsnamec == "단대학교사범대학부속고등학교"
      replace hsnamec = "부일외국어고등학교"               if hsnamec == "부산부일외국어고등학교"
      replace hsnamec = "제주과학고등학교"                 if hsnamec == "제주고등학교"
      replace hsnamec = "중앙대학교사범대학부속고등학교"   if hsnamec == "중대학교사범대학부설고등학교"
      replace hsnamec = "중앙대학교사범대학부속고등학교"   if hsnamec == "중앙대삼범대학부속고등학교"
      replace hsnamec = "중앙대학교사범대학부속고등학교"   if hsnamec == "중앙대학교사범대학부설고등학교"
      replace hsnamec = "한성과학고등학교"                 if hsnamec == "한성고등학교"

      replace hsnamec = "경기여자고등학교"                 if hsnamec == "서울경기여자고등학교"                        & inlist(f007 , 101 , 115 )
      replace hsnamec = "동덕여자고등학교"                 if hsnamec == "동덕고등학교"                                & inlist(f007 , 101 , 115 )
      replace hsnamec = "서문여자고등학교"                 if hsnamec == "서문고등학교"                                & inlist(f007 , 101 , 115 )
      replace hsnamec = "영동고등학교"                     if hsnamec == "서울영동고등학교"                            & inlist(f007 , 101 , 115 )
      replace hsnamec = "은광여자고등학교"                 if hsnamec == "은광고등학교"                                & inlist(f007 , 101 , 115 )
      replace hsnamec = "중산고등학교"                     if hsnamec == "서울중산고등학교"                            & inlist(f007 , 101 , 115 )
      replace hsnamec = "청담고등학교"                     if hsnamec == "서울청담고등학교"                            & inlist(f007 , 101 , 115 )
      replace hsnamec = "풍문고등학교"                     if hsnamec == "풍문여자고등학교"                            & inlist(f007 , 101 , 115 )
      replace hsnamec = "현대고등학교"                     if hsnamec == "서울현대고등학교"                            & inlist(f007 , 101 , 115 )
    /*}}}*/
  capture drop f998
    capture label drop F998
    gen f998 = .
    label var f998 "특목고(cleaned)"
    label define F998 1 "과학(영재)고" 2 "예술영재고" 3 "외국어고" 4 "국제고" 5 "자사고(전국)" 6 "자사고(광역)" 7 "강남8학군"
    label value f998 F998
    /* 과학고 및 과학영재학교{{{*/
      replace f998 = 1 if hsnamec == "KAIST부설한국과학영재학교" & ( inrange(f001 , 1993 , 9999 ) | missing(f001) ) // 부산광역시     부산진구 (구 부산과고)
      replace f998 = 1 if hsnamec == "강원과학고등학교"          & ( inrange(f001 , 1997 , 9999 ) | missing(f001) ) // 강원도         원주시
      replace f998 = 1 if hsnamec == "경기과학고등학교"          & ( inrange(f001 , 1987 , 9999 ) | missing(f001) ) // 경기도         수원시   (영재학교로 전환)
      replace f998 = 1 if hsnamec == "경기북과학고등학교"        & ( inrange(f001 , 1996 , 9999 ) | missing(f001) ) // 경기도         의정부시
      replace f998 = 1 if hsnamec == "경남과학고등학교"          & ( inrange(f001 , 1988 , 9999 ) | missing(f001) ) // 경상남도       진주시
      replace f998 = 1 if hsnamec == "경북과학고등학교"          & ( inrange(f001 , 1997 , 9999 ) | missing(f001) ) // 경상북도       포항시
      replace f998 = 1 if hsnamec == "경산과학고등학교"          & ( inrange(f001 , 2009 , 9999 ) | missing(f001) ) // 경상북도       경산시
      replace f998 = 1 if hsnamec == "광주과학고등학교"          & ( inrange(f001 , 1994 , 9999 ) | missing(f001) ) // 광주광역시     동구     (영재학교로 전환)
      replace f998 = 1 if hsnamec == "대구과학고등학교"          & ( inrange(f001 , 1992 , 9999 ) | missing(f001) ) // 대구광역시     수성구   (영재학교로 전환)
      replace f998 = 1 if hsnamec == "대구일과학고등학교"        & ( inrange(f001 , 2015 , 9999 ) | missing(f001) ) // 대구광역시     동구
      replace f998 = 1 if hsnamec == "대전과학고등학교"          & ( inrange(f001 , 1988 , 9999 ) | missing(f001) ) // 대전광역시     유성구   (영재학교로 전환)
      replace f998 = 1 if hsnamec == "대전동신과학고등학교"      & ( inrange(f001 , 2017 , 9999 ) | missing(f001) ) // 대전광역시     동구     (동신고에서 2014년부터 전환)
      replace f998 = 1 if hsnamec == "부산과학고등학교"          & ( inrange(f001 , 1993 , 2004 ) | missing(f001) ) // 부산광역시     부산진구 (한국영재로 전환)
      replace f998 = 1 if hsnamec == "부산과학고등학교"          & ( inrange(f001 , 2005 , 9999 ) | missing(f001) ) // 부산광역시     금정구   (구 부산과고와 별개)
      replace f998 = 1 if hsnamec == "부산일과학고등학교"        & ( inrange(f001 , 2014 , 9999 ) | missing(f001) ) // 부산광역시     금정구
      replace f998 = 1 if hsnamec == "서울과학고등학교"          & ( inrange(f001 , 1993 , 9999 ) | missing(f001) ) // 서울특별시     종로구   (영재학교로 전환)
      replace f998 = 1 if hsnamec == "세종과학고등학교"          & ( inrange(f001 , 2010 , 9999 ) | missing(f001) ) // 서울특별시     구로구
      replace f998 = 1 if hsnamec == "울산과학고등학교"          & ( inrange(f001 , 2008 , 9999 ) | missing(f001) ) // 울산광역시     울주군
      replace f998 = 1 if hsnamec == "의정부과학고등학교"        & ( inrange(f001 , 2009 , 9999 ) | missing(f001) ) // 경기도         의정부시
      replace f998 = 1 if hsnamec == "인천과학고등학교"          & ( inrange(f001 , 1998 , 9999 ) | missing(f001) ) // 인천광역시     중구
      replace f998 = 1 if hsnamec == "인천진산과학고등학교"      & ( inrange(f001 , 2015 , 9999 ) | missing(f001) ) // 인천광역시     부평구
      replace f998 = 1 if hsnamec == "장영실과학고등학교"        & ( inrange(f001 , 2007 , 9999 ) | missing(f001) ) // 부산광역시     금정구
      replace f998 = 1 if hsnamec == "전남과학고등학교"          & ( inrange(f001 , 1988 , 1995 ) | missing(f001) ) // 광주광역시     동구
      replace f998 = 1 if hsnamec == "전남과학고등학교"          & ( inrange(f001 , 1996 , 9999 ) | missing(f001) ) // 전라남도       나주시
      replace f998 = 1 if hsnamec == "전북과학고등학교"          & ( inrange(f001 , 1995 , 9999 ) | missing(f001) ) // 전라북도       익산시
      replace f998 = 1 if hsnamec == "제주과학고등학교"          & ( inrange(f001 , 2001 , 9999 ) | missing(f001) ) // 제주특별자치도 제주시
      replace f998 = 1 if hsnamec == "창원과학고등학교"          & ( inrange(f001 , 2015 , 9999 ) | missing(f001) ) // 경상남도       창원시
      replace f998 = 1 if hsnamec == "충남과학고등학교"          & ( inrange(f001 , 1997 , 9999 ) | missing(f001) ) // 충청남도       공주시
      replace f998 = 1 if hsnamec == "충북과학고등학교"          & ( inrange(f001 , 1993 , 9999 ) | missing(f001) ) // 충청북도       청주시
      replace f998 = 1 if hsnamec == "한성과학고등학교"          & ( inrange(f001 , 1994 , 9999 ) | missing(f001) ) // 서울특별시     서대문구
    /*}}}*/
    /*과학예술영재학교 {{{*/
      replace f998 = 2 if hsnamec == "세종과학예술영재학교" & ( inrange(f001 , 2018 , 9999 ) | missing(f001) ) // 세종특별자치시
      replace f998 = 2 if hsnamec == "인천과학예술영재학교" & ( inrange(f001 , 2001 , 9999 ) | missing(f001) ) // 인천광역시     연수구
    /*}}}*/
    /*외국어고{{{*/
      replace f998 = 3 if hsnamec == "강원외국어고등학교"     & ( inrange(f001 , 2014 , 9999) | missing(f001) ) // 양구군 양구읍
      replace f998 = 3 if hsnamec == "경기외국어고등학교"     & ( inrange(f001 , 2007 , 9999) | missing(f001) ) // 의왕시 (명지외고에서 개명)
      replace f998 = 3 if hsnamec == "경남외국어고등학교"     & ( inrange(f001 , 1991 , 9999) | missing(f001) ) // 양산시
      replace f998 = 3 if hsnamec == "경북외국어고등학교"     & ( inrange(f001 , 2000 , 9999) | missing(f001) ) // 구미시
      replace f998 = 3 if hsnamec == "고양외국어고등학교"     & ( inrange(f001 , 2005 , 9999) | missing(f001) ) // 고양시
      replace f998 = 3 if hsnamec == "과천외국어고등학교"     & ( inrange(f001 , 1994 , 9999) | missing(f001) ) // 과천시
      replace f998 = 3 if hsnamec == "김포외국어고등학교"     & ( inrange(f001 , 2009 , 9999) | missing(f001) ) // 김포시
      replace f998 = 3 if hsnamec == "김해외국어고등학교"     & ( inrange(f001 , 2009 , 9999) | missing(f001) ) // 김해시
      replace f998 = 3 if hsnamec == "대구외국어고등학교"     & ( inrange(f001 , 2000 , 9999) | missing(f001) ) // 달서구
      replace f998 = 3 if hsnamec == "대원외국어고등학교"     & ( inrange(f001 , 1988 , 9999) | missing(f001) ) // 광진구
      replace f998 = 3 if hsnamec == "대일외국어고등학교"     & ( inrange(f001 , 1984 , 9999) | missing(f001) ) // 성북구
      replace f998 = 3 if hsnamec == "대전외국어고등학교"     & ( inrange(f001 , 1999 , 9999) | missing(f001) ) // 서구
      replace f998 = 3 if hsnamec == "동두천외국어고등학교"   & ( inrange(f001 , 2008 , 9999) | missing(f001) ) // 동두천시
      replace f998 = 3 if hsnamec == "명지외국어고등학교"     & ( inrange(f001 , 2007 , 9999) | missing(f001) ) // 의왕시 (경기외고로 개명)
      replace f998 = 3 if hsnamec == "명덕외국어고등학교"     & ( inrange(f001 , 1995 , 9999) | missing(f001) ) // 강서구
      replace f998 = 3 if hsnamec == "미추홀외국어고등학교"   & ( inrange(f001 , 2014 , 9999) | missing(f001) ) // 남동구
      replace f998 = 3 if hsnamec == "부산국제외국어고등학교" & ( inrange(f001 , 2007 , 2021) | missing(f001) ) // 해운대구 (2019부터 부산센텀여고로 변경)
      replace f998 = 3 if hsnamec == "부산외국어고등학교"     & ( inrange(f001 , 1989 , 9999) | missing(f001) ) // 연제구
      replace f998 = 3 if hsnamec == "부일외국어고등학교"     & ( inrange(f001 , 1998 , 9999) | missing(f001) ) // 사하구
      replace f998 = 3 if hsnamec == "서울외국어고등학교"     & ( inrange(f001 , 1998 , 9999) | missing(f001) ) // 도봉구
      replace f998 = 3 if hsnamec == "성남외국어고등학교"     & ( inrange(f001 , 2009 , 9999) | missing(f001) ) // 성남시 분당구
      replace f998 = 3 if hsnamec == "수원외국어고등학교"     & ( inrange(f001 , 2009 , 9999) | missing(f001) ) // 수원시 영통구
      replace f998 = 3 if hsnamec == "안양외국어고등학교"     & ( inrange(f001 , 2001 , 9999) | missing(f001) ) // 안양시 만안구
      replace f998 = 3 if hsnamec == "울산외국어고등학교"     & ( inrange(f001 , 2013 , 9999) | missing(f001) ) // 북구
      replace f998 = 3 if hsnamec == "이화여자외국어고등학교" & ( inrange(f001 , 1995 , 9999) | missing(f001) ) // 중구
      replace f998 = 3 if hsnamec == "인천외국어고등학교"     & ( inrange(f001 , 1989 , 9999) | missing(f001) ) // 부평구
      replace f998 = 3 if hsnamec == "전남외국어고등학교"     & ( inrange(f001 , 1998 , 9999) | missing(f001) ) // 나주시
      replace f998 = 3 if hsnamec == "전북외국어고등학교"     & ( inrange(f001 , 2008 , 9999) | missing(f001) ) // 군산시
      replace f998 = 3 if hsnamec == "제주외국어고등학교"     & ( inrange(f001 , 2007 , 9999) | missing(f001) ) // 제주시
      replace f998 = 3 if hsnamec == "중산외국어고등학교"     & ( inrange(f001 , 1996 , 2013) | missing(f001) ) // 충주시
      replace f998 = 3 if hsnamec == "진주외국어고등학교"     & ( inrange(f001 , 2001 , 9999) | missing(f001) ) //
      replace f998 = 3 if hsnamec == "청주외국어고등학교"     & ( inrange(f001 , 1995 , 9999) | missing(f001) ) // 청주시 흥덕구
      replace f998 = 3 if hsnamec == "충남외국어고등학교"     & ( inrange(f001 , 2011 , 9999) | missing(f001) ) // 아산시
      replace f998 = 3 if hsnamec == "한영외국어고등학교"     & ( inrange(f001 , 1994 , 9999) | missing(f001) ) // 강동구
    /*}}}*/
    /*국제고{{{*/
      replace f998 = 4 if hsnamec == "고양국제고등학교" & ( inrange(f001 , 2014 , 9999 ) | missing(f001) ) // 경기도 고양시
      replace f998 = 4 if hsnamec == "대구국제고등학교" // 대구광역시 북구
      replace f998 = 4 if hsnamec == "동탄국제고등학교" & ( inrange(f001 , 2014 , 9999 ) | missing(f001) ) // 경기도 화성시
      replace f998 = 4 if hsnamec == "부산국제고등학교" // 부산광역시 부산진구
      replace f998 = 4 if hsnamec == "서울국제고등학교" // 서울특별시 종로구
      replace f998 = 4 if hsnamec == "세종국제고등학교" & ( inrange(f001 , 2016 , 9999 ) | missing(f001) ) // 세종특별자치시 아름동
      replace f998 = 4 if hsnamec == "인천국제고등학교" // 인천광역시 중구
      replace f998 = 4 if hsnamec == "청심국제고등학교" // 경기도 가평군
    /*}}}*/
    /*전국단위 자사고{{{*/
      replace f998 = 5 if hsnamec == "광양제철고등학교"                 & ( inrange(f001 , 1989 , 9999) | missing(f001) ) // 전남
      replace f998 = 5 if hsnamec == "김천고등학교"                     & ( inrange(f001 , 1935 , 9999) | missing(f001) ) // 경북
      replace f998 = 5 if hsnamec == "민족사관고등학교"                 & ( inrange(f001 , 1999 , 9999) | missing(f001) ) // 강원
      replace f998 = 5 if hsnamec == "북일고등학교"                     & ( inrange(f001 , 1980 , 9999) | missing(f001) ) // 충남
      replace f998 = 5 if hsnamec == "상산고등학교"                     & ( inrange(f001 , 1984 , 9999) | missing(f001) ) // 전북
      replace f998 = 5 if hsnamec == "용인한국외국어대학교부설고등학교" & ( inrange(f001 , 2008 , 9999) | missing(f001) ) // 경기
      replace f998 = 5 if hsnamec == "인천하늘고등학교"                 & ( inrange(f001 , 2014 , 9999) | missing(f001) ) // 인천  영종도
      replace f998 = 5 if hsnamec == "포항제철고등학교"                 & ( inrange(f001 , 1985 , 9999) | missing(f001) ) // 경북
      replace f998 = 5 if hsnamec == "하나고등학교"                     & ( inrange(f001 , 2012 , 9999) | missing(f001) ) // 서울  은평구
      replace f998 = 5 if hsnamec == "현대청운고등학교"                 & ( inrange(f001 , 1985 , 9999) | missing(f001) ) // 울산  동구
    /*}}}*/
    /*광역단위 자사고{{{*/
      replace f998 = 6 if hsnamec == "경문고등학교"                               & ( inrange(f001 , 2015 , 9999) | missing(f001) ) // 서울 동작구
      replace f998 = 6 if hsnamec == "경신고등학교"                               & ( inrange(f001 , 2015 , 9999) | missing(f001) ) // 대구 수성구
      replace f998 = 6 if hsnamec == "경일여자고등학교"                           & ( inrange(f001 , 2015 , 9999) | missing(f001) ) // 대구 남구
      replace f998 = 6 if hsnamec == "경희고등학교"                               & ( inrange(f001 , 2014 , 9999) | missing(f001) ) // 서울 동대문구
      replace f998 = 6 if hsnamec == "계성고등학교"                               & ( inrange(f001 , 2014 , 9999) | missing(f001) ) // 대구 중구
      replace f998 = 6 if hsnamec == "군산중앙고등학교"                           & ( inrange(f001 , 2015 , 9999) | missing(f001) ) // 전북
      replace f998 = 6 if hsnamec == "남성고등학교"                               & ( inrange(f001 , 2015 , 9999) | missing(f001) ) // 전북 익산
      replace f998 = 6 if hsnamec == "대건고등학교"                               & ( inrange(f001 , 2015 , 9999) | missing(f001) ) // 대구 달서구
      replace f998 = 6 if hsnamec == "대광고등학교"                               & ( inrange(f001 , 2015 , 9999) | missing(f001) ) // 서울 동대문구
      replace f998 = 6 if hsnamec == "대성고등학교"                               & ( inrange(f001 , 2014 , 9999) | missing(f001) ) // 대전
      replace f998 = 6 if hsnamec == "대성고등학교"                               & ( inrange(f001 , 2015 , 9999) | missing(f001) ) // 서울 은평구
      replace f998 = 6 if hsnamec == "대전대신고등학교"                           & ( inrange(f001 , 2017 , 9999) | missing(f001) ) // 대전 서구
      replace f998 = 6 if hsnamec == "동래여자고등학교"                           & ( inrange(f001 , 2014 , 9999) | missing(f001) ) // 부산 동래구
      replace f998 = 6 if hsnamec == "동성고등학교"                               & ( inrange(f001 , 2014 , 9999) | missing(f001) ) // 서울 종로구
      replace f998 = 6 if hsnamec == "동양고등학교"                               & ( inrange(f001 , 2015 , 9999) | missing(f001) ) // 서울 강서구
      replace f998 = 6 if hsnamec == "미림여자고등학교"                           & ( inrange(f001 , 2015 , 9999) | missing(f001) ) // 서울 관악구
      replace f998 = 6 if hsnamec == "배재고등학교"                               & ( inrange(f001 , 2014 , 9999) | missing(f001) ) // 서울 강동구
      replace f998 = 6 if hsnamec == "보문고등학교"                               & ( inrange(f001 , 2015 , 9999) | missing(f001) ) // 광주 광산구
      replace f998 = 6 if hsnamec == "보인고등학교"                               & ( inrange(f001 , 2015 , 9999) | missing(f001) ) // 서울 송파구
      replace f998 = 6 if hsnamec == "서대전여자고등학교"                         & ( inrange(f001 , 2015 , 9999) | missing(f001) ) // 대전 서구
      replace f998 = 6 if hsnamec == "선덕고등학교"                               & ( inrange(f001 , 2015 , 9999) | missing(f001) ) // 서울 도봉구
      replace f998 = 6 if hsnamec == "성신고등학교"                               & ( inrange(f001 , 2015 , 9999) | missing(f001) ) // 울산 중구
      replace f998 = 6 if hsnamec == "세화고등학교"                               & ( inrange(f001 , 2014 , 9999) | missing(f001) ) // 서울 서초구
      replace f998 = 6 if hsnamec == "세화여자고등학교"                           & ( inrange(f001 , 2015 , 9999) | missing(f001) ) // 서울 서초구
      replace f998 = 6 if hsnamec == "송원고등학교"                               & ( inrange(f001 , 2014 , 9999) | missing(f001) ) // 광주 남구
      replace f998 = 6 if hsnamec == "숭덕고등학교"                               & ( inrange(f001 , 2015 , 9999) | missing(f001) ) // 광주 광산구
      replace f998 = 6 if hsnamec == "숭문고등학교"                               & ( inrange(f001 , 2014 , 9999) | missing(f001) ) // 서울 마포구
      replace f998 = 6 if hsnamec == "신일고등학교"                               & ( inrange(f001 , 2014 , 9999) | missing(f001) ) // 서울 강북구
      replace f998 = 6 if hsnamec == "안산동산고등학교"                           & ( inrange(f001 , 2014 , 9999) | missing(f001) ) // 경기
      replace f998 = 6 if hsnamec == "양정고등학교"                               & ( inrange(f001 , 2015 , 9999) | missing(f001) ) // 서울 양천구
      replace f998 = 6 if hsnamec == "용문고등학교"                               & ( inrange(f001 , 2015 , 9999) | missing(f001) ) // 서울 성북구
      replace f998 = 6 if hsnamec == "우신고등학교"                               & ( inrange(f001 , 2014 , 9999) | missing(f001) ) // 서울 구로구
      replace f998 = 6 if hsnamec == "이화여자고등학교"                           & ( inrange(f001 , 2014 , 9999) | missing(f001) ) // 서울 중구
      replace f998 = 6 if hsnamec == "이화여자대학교사범대학부속이화금란고등학교" & ( inrange(f001 , 2014 , 9999) | missing(f001) ) // 서울 서대문구
      replace f998 = 6 if hsnamec == "인천포스코고등학교"                         & ( inrange(f001 , 2019 , 9999) | missing(f001) ) // 인천
      replace f998 = 6 if hsnamec == "장훈고등학교"                               & ( inrange(f001 , 2015 , 9999) | missing(f001) ) // 서울 영등포구
      replace f998 = 6 if hsnamec == "중동고등학교"                               & ( inrange(f001 , 2014 , 9999) | missing(f001) ) // 서울 강남구
      replace f998 = 6 if hsnamec == "중앙고등학교"                               & ( inrange(f001 , 2014 , 9999) | missing(f001) ) // 서울 종로구
      replace f998 = 6 if hsnamec == "충남삼성고등학교"                           & ( inrange(f001 , 2018 , 9999) | missing(f001) ) //
      replace f998 = 6 if hsnamec == "한가람고등학교"                             & ( inrange(f001 , 2014 , 9999) | missing(f001) ) // 서울 양천구
      replace f998 = 6 if hsnamec == "한양대학교사범대학부속고등학교"             & ( inrange(f001 , 2014 , 9999) | missing(f001) ) // 서울 성동구
      replace f998 = 6 if hsnamec == "현대고등학교"                               & ( inrange(f001 , 2014 , 9999) | missing(f001) ) // 서울 강남구
      replace f998 = 6 if hsnamec == "휘문고등학교"                               & ( inrange(f001 , 2014 , 9999) | missing(f001) ) // 서울 강남구
    /*}}}*/
    /*강남8학군 {{{*/
      replace f998 = 7 if hsnamec == "개포고등학교"                   & f006 == 1
      replace f998 = 7 if hsnamec == "경기고등학교"                   & f006 == 1
      replace f998 = 7 if hsnamec == "경기여자고등학교"               & f006 == 1
      replace f998 = 7 if hsnamec == "구정고등학교"                   & f006 == 1
      replace f998 = 7 if hsnamec == "단국대학교사범대학부속고등학교" & f006 == 1
      replace f998 = 7 if hsnamec == "동덕여자고등학교"               & f006 == 1
      replace f998 = 7 if hsnamec == "반포고등학교"                   & f006 == 1
      replace f998 = 7 if hsnamec == "상문고등학교"                   & f006 == 1
      replace f998 = 7 if hsnamec == "서문여자고등학교"               & f006 == 1
      replace f998 = 7 if hsnamec == "서울고등학교"                   & f006 == 1
      replace f998 = 7 if hsnamec == "서울세종고등학교"               & f006 == 1
      replace f998 = 7 if hsnamec == "서초고등학교"                   & f006 == 1
      replace f998 = 7 if hsnamec == "세화고등학교"                   & f006 == 1
      replace f998 = 7 if hsnamec == "세화여자고등학교"               & f006 == 1
      replace f998 = 7 if hsnamec == "숙명여자고등학교"               & f006 == 1
      replace f998 = 7 if hsnamec == "압구정고등학교"                 & f006 == 1
      replace f998 = 7 if hsnamec == "양재고등학교"                   & f006 == 1
      replace f998 = 7 if hsnamec == "언남고등학교"                   & f006 == 1
      replace f998 = 7 if hsnamec == "영동고등학교"                   & f006 == 1
      replace f998 = 7 if hsnamec == "은광여자고등학교"               & f006 == 1
      replace f998 = 7 if hsnamec == "중동고등학교"                   & f006 == 1
      replace f998 = 7 if hsnamec == "중산고등학교"                   & f006 == 1
      replace f998 = 7 if hsnamec == "중앙대학교사범대학부속고등학교" & f006 == 1
      replace f998 = 7 if hsnamec == "진선여자고등학교"               & f006 == 1
      replace f998 = 7 if hsnamec == "청담고등학교"                   & f006 == 1
      replace f998 = 7 if hsnamec == "풍문고등학교"                   & f006 == 1
      replace f998 = 7 if hsnamec == "현대고등학교"                   & f006 == 1 & ( inrange(f001 , 1989 , 2013) | missing(f001) ) // 서울 강남구
      replace f998 = 7 if hsnamec == "휘문고등학교"                   & f006 == 1 & ( inrange(f001 , 1908 , 2013) | missing(f001) ) // 서울 강남구
    /*}}}*/
  drop f001-f002 f006-f009
save rawdata/goms_data_hs.dta , replace
