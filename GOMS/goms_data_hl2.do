  set more off
  cd ~/dropbox/goms/
  use goms_master , clear
    /* 숫자형 변수를 long type으로 변환{{{*/
        local numvarlist ///
          branch     /// /*본분교*/
          found      /// /*국공사립*/
          course     /// /*학위과정 유형*/
          daynight   /// /*주야간*/
          majorcat   /// /*전공계열*/
          school     /// /*학교유형*/
          province   /// /*학교소재권역*/
          area       /// /*학교소재지역*/
          sex        /// /*성별*/
          birthy     /// /*출생년*/
          birthm     /// /*출생월*/
          age        /// /*연령(조사기준일 당시)*/
          graduy     /// /*졸업년*/
          gradum     /// /*졸업월*/
          f001       /// /*출신 고등학교 졸업 시기_년*/
          f002       /// /*출신 고등학교 졸업 시기_월*/
          f004       /// /*출신 고등학교 소재지(국내외구분)*/
          f006       /// /*출신 고등학교 소재지_시도(특별시/광역시/도) CODE*/
          f007       /// /*출신 고등학교 소재지_시군구(구/시/군) CODE*/
          f008       /// /*출신 고등학교 구분(고등학교 혹은 검정고시)*/
          f009       /// /*고등학교 계열*/
          f010       /// /*졸업 대학 입학 구분(입학 혹은 편입)*/
          f011       /// /*졸업 대학 입학/편입 시기_년*/
          f013       /// /*대학 입학 모집방법(정시 혹은 수시)*/
          f014       /// /*전형방법*/
          f170       /// /*입학 전형 유형 (세부 유형)*/
          f016       /// /*졸업한 대학에 입학하는데 가장 중요했던 요소*/
          f017       /// /*졸업한 대학에 입학하는데 가장 중요했던 요소(2순위)*/
          f018       /// /*졸업한 대학을 선택한 이유*/
          f138       /// /*최종 졸업한 대학 이전에 다른 대학을 다닌 경험 유무*/
          f139       /// /*최종 졸업한 대학 이전에 다른 대학(원)을 다닌 경험_횟수*/
          p018       /// /*출생 지역(국내외구분)*/
          p020       /// /*출생 지역 시도(특별시/광역시/도) CODE*/
          p021       /// /*출생 지역 시군구(구/시/군) CODE*/
          p026       /// /*아버님의 최종 학력*/
          p027       /// /*아버님의 최종 학력 이수 여부*/
          p028z      /// /*아버님의 최종 학력_생성변수*/
          p029       /// /*어머님의 최종 학력*/
          p030       /// /*어머님의 최종 학력 이수 여부*/
          p031z      /// /*어머님의 최종 학력_생성변수*/
          p032       /// /*대학 입학(편입) 당시 아버님의 직업*/
          p033       /// /*대학 입학(편입) 당시 어머님의 직업*/
          p034       /// /*대학 입학(편입) 당시 부모님의 월평균 소득*/
          unicode    /// /*출신대학code*/
          medtyp     /// /*의예과 전공*/
          wt             /*가중치*/
      /* 변수유형 교정*/
        destring daynight11 , replace
        destring school15 , replace
      foreach i of local numvarlist {
        egen `i' = rowlast(`i'??)
      }
    /*}}}*/
    /* 문자형 변수를 long type으로 변환 {{{*/
      local charvarlist ///
        hsname	   /// /*출신고교명*/
        uniname	   /// /*출신대학명*/
        dpmt       /// /*전공_소분류 CODE*/
        major          /*전공 세분류 CODE 혹은 전공명*/
      /* 변수유형 교정*/
        gen str1 hsname07 = ""
        gen str1 hsname08 = ""
        tostring major07 , replace force
      foreach i of local charvarlist {
        gen str1 `i' = ""
        replace `i' = `i'07 if year == 2007
        replace `i' = `i'08 if year == 2008
        replace `i' = `i'09 if year == 2009
        replace `i' = `i'10 if year == 2010
        replace `i' = `i'11 if year == 2011
        replace `i' = `i'12 if year == 2012
        replace `i' = `i'13 if year == 2013
        replace `i' = `i'14 if year == 2014
        replace `i' = `i'15 if year == 2015
        replace `i' = `i'16 if year == 2016
        replace `i' = `i'17 if year == 2017
      }
    /*}}}*/
    /* labeling {{{*/
      label var branch     "본분교"
        label copy G171BRAN BRANCH
        label define BRANCH 4 "캠퍼스1" , add
        label value branch BRANCH
      label var found      "국공사립"
        label copy G171FOUN FOUND
        label define FOUND 7 "특별법법인" 8 "기타" , add
        label value found FOUND
        recode found (4=7) if year == 2011
        recode found (4=8) if year == 2012
        recode found (4=8) if year == 2013
        recode found (4=7) if year == 2014
      label var course     "학위과정 유형"
        label copy G171COUR COURSE
        label define COURSE 9 전공심화 , add
        label value course COURSE
        recode course (1/2=3) (3=2) (4=1) (5=4) if year == 2007 
        recode course (1/2=3) (3=2) (4=1) (5=4) (6=7) if year == 2008
        recode course (4=9) (5=4) (6=7) if year == 2009
        recode course (4=9) (5=4) (6=7) if year == 2010
        recode course (4=9) (5=4) (6=7) if year == 2011
        recode course (4=9) (5=4) if year == 2012
        recode course (4=9) (5=4) if year == 2013
        recode course (4=9) (5=4) if year == 2014
        recode course (4=9) (5=4) if year == 2014
      label var daynight   "주야간"
        label copy G171DAYN DAYNIGHT
        label value daynight DAYNIGHT
        replace daynight = 1 if course07 == 1 | course08 == 1
        replace daynight = 2 if course07 == 2 | course08 == 2
      label var majorcat   "전공계열"
        label copy G171MAJO MAJORCAT
        label value majorcat MAJORCAT
      label var dpmt       "전공_소분류 CODE"
      label var major      "전공 세분류 CODE 혹은 전공명"
      label var school     "학교유형"
        label copy G171SCHO SCHOOL
        label value school SCHOOL
      label var province   "학교소재권역"
        label copy G171PROV PROVINCE
        label value province PROVINCE
      label var area       "학교소재지역"
        label copy G171AREA AREA
        label value area AREA
      label var sex        "성별"
        label copy G171SEX SEX
        label value sex SEX
      label var birthy     "출생년"
      label var birthm     "출생월"
      label var age        "연령(조사기준일 당시)"
      label var graduy     "졸업년"
      label var gradum     "졸업월"
      label var medtyp     "의예계열 전공"
        label value medtyp MEDTYP
      label var f001       "출신 고등학교 졸업 시기_년"
      label var f002       "출신 고등학교 졸업 시기_월"
      label var f004       "출신 고등학교 소재지(국내외구분)"
        label copy G171F004 F004
        label value f004 F004
      label var f006       "출신 고등학교 소재지_시도(특별시/광역시/도) CODE"
        label copy G171F006 F006
        label value f006 F006
      label var f007       "출신 고등학교 소재지_시군구(구/시/군) CODE"
        label copy G171F007 F007
        label value f007 F007
      label var f008       "출신 고등학교 구분(고등학교 혹은 검정고시)"
        label copy G171F008 F008
        label value f008 F008
      label var f009       "고등학교 계열"
        label copy G171F009 F009
        label value f009 F009
        recode f009 (3/4=3) (5=4) (9=10) if year == 2007
        recode f009 (3/4=3) (5=4) (9=10) if year == 2008
        recode f009 (3/4=3) (5=4) (9=10) if year == 2009
        recode f009 (3/4=3) (5=4) (9=10) if year == 2010
        recode f009 (3/4=3) (5=4) (9=10) if year == 2011
        recode f009 (3/4=3) (5=4) (9=10) if year == 2012
        recode f009 (3/4=3) (5=4) (9=10) if year == 2013
        recode f009 (4=6) (5=7) (6=8) (7=4) (8=10) if year == 2014
      label var f010       "졸업 대학 입학 구분(입학 혹은 편입)"
        label copy G171F010 F010
        label value f010 F010
      label var f013       "대학 입학 모집방법(정시 혹은 수시)"
        label copy G171F013 F013
        label value f013 F013
      label var f014       "입학 전형 (일반 혹은 특별)"
        label define F014 -1  "모름/무응답" 1  "일반전형" 2  "일반전형(정시입학)" 3  "일반전형(수시입학)" 4 "특별전형" 5  "특별전형(정원내)" 6  "특별전형(정원외) " 7  "입학사정관제(학생부종합전형)" 8 "기타"
        label value f014 F014
        recode f014 (2=4) if year == 2009
        recode f014 (1=2) (2=3) (3=4) (4=5) (5=6) (6=8)  if year == 2010
        recode f014 (1=2) (2=3) (3=4) (4=8) if year == 2011
        recode f014 (1=2) (2=3) (3=4) (4=8) if year == 2012
        recode f014 (1=2) (2=3) (3=4) (4=8) if year == 2013
        recode f014 (1=2) (2=3) (3=4) (4=7) (5=8) if year == 2014
        recode f014 (2=7) (3=5) (4=6) (5=7) if year == 2015
      label var f170       "입학 전형 유형 (세부 유형)"
        label copy G171F170 F170
        label value f170 F170
      label var f016       "졸업한 대학에 입학하는데 가장 중요했던 요소"
        label copy LABCE F016
        label value f016 F016
        recode f016 (9=13) if year == 2012
        recode f016 (10=13) if year == 2013
        recode f016 (10=13) if year == 2014
        recode f016 (10=13) if year == 2015
        recode f016 (12=13) if year == 2016
      label var f017       "졸업한 대학에 입학하는데 가장 중요했던 요소(2순위)"
        label copy LABCE F017
        label value f017 F017
        recode f017 (12=13) if year == 2016
      label var f018       "졸업한 대학을 선택한 이유"
        label copy G171F018 F018
        label value f018 F018
        recode f018 (8=10) if year == 2007
        recode f018 (8=10) if year == 2008
      label var f138       "최종 졸업한 대학 이전에 다른 대학(원)을 다닌 경험 유무"
        label copy G171F138 F138
        label value f138 F138
      label var f139       "최종 졸업한 대학 이전에 다른 대학(원)을 다닌 횟수"
      label var p018       "출생 지역(국내외구분)"
        label copy G171P018 P018
        label value p018 P018
      label var p020       "출생 지역 시도(특별시/광역시/도) CODE"
        label copy LABEI P020
        label value p020 P020
      label var p021       "출생 지역 시군구(구/시/군) CODE"
        label copy LABEJ P021
        label value p021 P021
      label var p026       "아버님의 최종 학력"
        label copy LABEK P026
        label value p026 P026
      label var p027       "아버님의 최종 학력 이수 여부"
        label copy LABEL P027
        label value p027 P027
      label var p028z      "아버님의 최종 학력_생성변수"
        label copy LABEM P028Z
        label value p028z P028Z
      label var p029       "어머님의 최종 학력"
        label copy LABEK P029
        label value p029 P029
      label var p030       "어머님의 최종 학력 이수 여부"
        label copy LABEL P030
        label value p030 P030
      label var p031z      "어머님의 최종 학력_생성변수"
        label copy LABEM P031Z
        label value p031z P031Z
      label var p032       "대학 입학(편입) 당시 아버님의 직업"
        label copy LABEN P032
        label value p032 P032
        recode p032 (1/3=1) (4=2) (5 7 24=3) (6=4) (8=5) (11/13=6) (9/10=7) (14=8) (15/22=9) (23=10) if inrange(year , 2007 , 2016)
      label var p033       "대학 입학(편입) 당시 어머님의 직업"
        label copy LABEN P033
        label value p033 P033
        recode p032 (1/3=1) (4=2) (5 7 24=3) (6=4) (8=5) (11/13=6) (9/10=7) (14=8) (15/22=9) (23=10) if inrange(year , 2007 , 2016)
      label var p034       "대학 입학(편입) 당시 부모님의 월평균 소득"
        label copy LABEO P034
        label value p034 P034
      label var wt         "가중치"
    /*}}}*/
    /*2019 QS 대학순위 붙이기 */
      merge m:1 uniname using rawdata/uniranking.dta , nogen
      label var unirank "QS2018순위"
    /*불성실 응답 제거*/
      /*고교졸업연령 0세 이하 사례 제거*/
        gen agehg = f001 - birthy
        label var agehg "고교졸업당시 연령"
        drop if agehg <0 
      /*현재나이 답변이상 사례 제거*/
        gen temp1 = age + birthy
        gen temp2 = year - `temp1'
        drop if !inrange(`temp2' , -2 , 0 )
      /*고교졸업이전 대학입학 사례 제거*/
        gen temp3 = f011 - f001
        drop if `temp3' < 0
      drop temp?
    /*대입전형방법*/
      recode f01410 (1=1) (2=2) (3=3) (4/6=4) , gen(temp10)
      gen temp11 = f01411
      gen temp12 = f01412
      gen temp13 = f01413
      recode f01414 (1=1) (2=2) (3=3) (4/5=4) , gen(temp14)
      gen temp15 = .
        replace temp15 = 1 if f01315 == 1 & inlist(f01415 , 1 , 2)
        replace temp15 = 2 if f01315 == 2 & inlist(f01415 , 1 , 2)
        replace temp15 = 3 if inlist(f01315 , 1 , 2 ) & inlist(f01415 , 3 , 4)
        replace temp15 = 4 if f01315 == 3 | f01415 == 5 
      gen temp16 = .
        replace temp16 = 1 if f01316 == 1 & inlist(f17016 , 1 , 2, 3, 4, 5)
        replace temp16 = 2 if f01316 == 2 & inlist(f17016 , 1 , 2, 3, 4, 5)
        replace temp16 = 3 if inlist(f01316 , 1 , 2 ) & inlist(f17016 , 6 , 7)
        replace temp16 = 4 if f01316 == 3 | f17016 == 8 
      gen temp17 = .
        replace temp17 = 1 if f01317 == 1 & inlist(f17017 , 1 , 2, 3, 4, 5)
        replace temp17 = 2 if f01317 == 2 & inlist(f17017 , 1 , 2, 3, 4, 5)
        replace temp17 = 3 if inlist(f01317 , 1 , 2 ) & inlist(f17017 , 6 , 7)
        replace temp17 = 4 if f01317 == 3 | f17017 == 8 
      egen enttyp = rowlast(temp??) 
        label define ENTTYP 1 "일반정시" 2 "일반수시" 3 "특별전형" 4 "기타"
        label var enttyp "대입전형 방법"
        label value enttyp ENTTYP
      drop temp??
    /*입학점수생성*/
      gen score3 = .
        replace score3 = 1 if school == 1
        replace score3 = 2 if inlist(school , 2 , 3)
        replace score3 = 3 if !missing(unirank)
        label var score3 "대학3등급"
      gen score4 = score3
        replace score4 = 4 if inrange(unirank , 1 , 10) & branch == 1
        label var score4 "대학4등급"
      gen score5 = score4
        replace score5 = 5 if medtyp | (inlist( unirank , 1, 2, 3, 5, 6) & branch == 1 )
        label var score5 "대학5등급"
    /* 재수여부*/
      gen reexam = f011>f001 & f010 == 1 
        replace reexam = 0 if missing(f011)
        label var reexam "재수여부"
      gen reexamy = f011 - f001 if reexam
        label var reexamy "재수기간(년)"
    /*고등학교계열 {{{*/
      recode f00907 (1=2) (2=3) (3 4=7) (5=4) (6/9=1) , gen(temp07)
      recode f00908 (1=2) (2=3) (3 4=7) (5=4) (6/9=1) , gen(temp08)
      recode f00909 (1=2) (2=3) (3 4=7) (5=4) (6/9=1) , gen(temp09)
      recode f00910 (1=2) (2=3) (3 4=7) (5=4) (6/9=1) , gen(temp10)
      recode f00911 (1=2) (2=3) (3 4=7) (5=4) (6/9=1) , gen(temp11)
      recode f00912 (1=2) (2=3) (3 4=7) (5=4) (6/9=1) , gen(temp12)
      recode f00913 (1=2) (2=3) (3 4=7) (5=4) (6/9=1) , gen(temp13)
      recode f00914 (1=2) (2=3) (3 =7) (7=4) (4 5 6 8 =1) , gen(temp14)
      recode f00915 (1=2) (2=3) (3 =7) (4=4) (5/10=1) , gen(temp15)
      recode f00916 (1=2) (2=3) (3 =7) (4=4) (5/10=1) , gen(temp16)
      recode f00917 (1=2) (2=3) (3 =7) (4=4) (5/10=1) , gen(temp17)
      egen f999 = rowlast(temp??) 
        label define F999 1 "기타(특성화등)" 2 "일반계(문과)" 3 "일반계(이과)" 4 "특목고(예체능)" 5 "강남3구" 6 "자율고" 7 "특목고(외과국)" 
        label var f999 "고등학교 계열"
        label value f999 F999
      /* 특목고(외/과/국) 범주 바로잡기{{{*/
        replace f999 = 7 if strpos(hsname , "외국어" ) & f999 != 7
        replace f999 = 7 if strpos(hsname , "과학" ) & f999 != 7
        replace f999 = 7 if strpos(hsname , "국제" ) & f999 != 7
        /* from 특목 to 기타{{{*/
          replace f999 = 1 if strpos(hsname , "영상과학" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "자연과학" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "해양과학" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "조리과학" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "생활과학" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "항공과학" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "생명과학" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "비즈니스" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "마이스터" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "한동국제" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "혜성국제" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "국제특성" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "벨국제" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "테크노" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "테트노" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "자동차" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "디지털" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "인터넷" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "디자인" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "모바일" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "컴퓨터" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "바이오" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "미디어" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "에너지" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "농생명" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "컨베션" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "컨벤션" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "컴벤션" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "산업" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "외식" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "영상" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "물류" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "영화" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "무역" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "해향" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "해양" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "기술" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "전자" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "농공" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "발명" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "아트" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "상업" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "경영" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "세무" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "조리" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "해사" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "공업" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "금융" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "관광" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "통상" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "항공" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "한독" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "정보" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "게임" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "종교" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "도시" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "전산" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "선화" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "화교" ) & f999 == 7
          replace f999 = 1 if strpos(hsname , "한인" ) & f999 == 7
        /*}}}*/
        /* from 특목 to 일반{{{*/
          replace f999 = 2 if strpos(hsname , "휘문" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "국제" ) & f999 == 7 & f006 == 6
          replace f999 = 2 if strpos(hsname , "상일여자" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "성덕" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "부광" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "홍천" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "영알" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "청암" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "선덕" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "성남자" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "강산" ) & f999 == 7
          replace f999 = . if strpos(hsname , "제일외국어" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "목동" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "신목" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "브니엘" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "장안" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "동인" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "동의" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "대동" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "장안" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "경덕여자" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "선일" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "옥련여자" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "영흥" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "서인천" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "호남삼육" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "금호" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "현대" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "구리여자" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "산본" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "심석" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "중앙" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "전북대" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "영생" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "배영" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "여수화양" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "청도" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "순심" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "밀성" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "보광" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "명석" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "원주여자" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "성산" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "부평" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "삼성" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "상서" ) & f999 == 7
          replace f999 = 2 if strpos(hsname , "성서" ) & f999 == 7
        /*}}}*/
        /* from 특목 to 자율{{{*/
          replace f999 = 6 if strpos(hsname , "해운대" ) & f999 == 7
        /*}}}*/
        /* from 특목 to 예술{{{*/
          replace f999 = 4 if strpos(hsname , "국악" ) & f999 == 7 
          replace f999 = 4 if strpos(hsname , "예술" ) & f999 == 7 
          replace f999 = 4 if strpos(hsname , "전통문화" ) & f999 == 7 
        /*}}}*/
        /* 강남{{{*/
          gen temp99 =  inlist(f007 , 101 , 115 , 118)
          replace f999 = 5 if temp99 & strpos(hsname , "가락")
          replace f999 = 5 if temp99 & strpos(hsname , "개포")
          replace f999 = 5 if temp99 & strpos(hsname , "경기")
          replace f999 = 5 if temp99 & strpos(hsname , "구정")
          replace f999 = 5 if temp99 & strpos(hsname , "단국")
          replace f999 = 5 if temp99 & strpos(hsname , "단대")
          replace f999 = 5 if temp99 & strpos(hsname , "동덕")
          replace f999 = 5 if temp99 & strpos(hsname , "반포")
          replace f999 = 5 if temp99 & strpos(hsname , "방산")
          replace f999 = 5 if temp99 & strpos(hsname , "배명")
          replace f999 = 5 if temp99 & strpos(hsname , "보성")
          replace f999 = 5 if temp99 & strpos(hsname , "보인")
          replace f999 = 5 if temp99 & strpos(hsname , "상문")
          replace f999 = 5 if temp99 & strpos(hsname , "서문")
          replace f999 = 5 if temp99 & strpos(hsname , "서울고")
          replace f999 = 5 if temp99 & strpos(hsname , "청담")
          replace f999 = 5 if temp99 & strpos(hsname , "현대")
          replace f999 = 5 if temp99 & strpos(hsname , "서초")
          replace f999 = 5 if temp99 & strpos(hsname , "세종")
          replace f999 = 5 if temp99 & strpos(hsname , "세화")
          replace f999 = 5 if temp99 & strpos(hsname , "숙명")
          replace f999 = 5 if temp99 & strpos(hsname , "양재")
          replace f999 = 5 if temp99 & strpos(hsname , "언남")
          replace f999 = 5 if temp99 & strpos(hsname , "영동")
          replace f999 = 5 if temp99 & strpos(hsname , "영파")
          replace f999 = 5 if temp99 & strpos(hsname , "오금")
          replace f999 = 5 if temp99 & strpos(hsname , "은광")
          replace f999 = 5 if temp99 & strpos(hsname , "잠신")
          replace f999 = 5 if temp99 & strpos(hsname , "잠실")
          replace f999 = 5 if temp99 & strpos(hsname , "정신")
          replace f999 = 5 if temp99 & strpos(hsname , "중대")
          replace f999 = 5 if temp99 & strpos(hsname , "중동")
          replace f999 = 5 if temp99 & strpos(hsname , "중산")
          replace f999 = 5 if temp99 & strpos(hsname , "중앙대")
          replace f999 = 5 if temp99 & strpos(hsname , "진선")
          replace f999 = 5 if temp99 & strpos(hsname , "창덕")
          replace f999 = 5 if temp99 & strpos(hsname , "휘문")
          replace f999 = 1 if strpos(hsname , "공업") &f999 == 5
          replace f999 = 1 if strpos(hsname , "상업") &f999 == 5
          replace f999 = 1 if strpos(hsname , "산업") &f999 == 5
          replace f999 = 1 if strpos(hsname , "전자") &f999 == 5
        /*}}}*/
        replace f999 = 6 if strpos(hsname , "하나" ) & f007 == 122
        replace f999 = 6 if strpos(hsname , "청운" ) & f006 == 7
        replace f999 = 6 if strpos(hsname , "민족" ) & f006 == 9
        replace f999 = 6 if strpos(hsname , "상산" ) & f007 == 1212
        replace f999 = 6 if strpos(hsname , "제철" ) & f007 == 1304 
        replace f999 = 6 if strpos(hsname , "제철" ) & f007 == 1423
        replace f999 = 6 if strpos(hsname , "해운대") & inrange(f999 , 1, 4) & !strpos(hsname , "공고") & !strpos(hsname , "여자") & !strpos(hsname , "공업")& !strpos(hsname , "관광")& !strpos(hsname , "기계")
        replace f999 = 7 if strpos(hsname , "영재" ) 
      /*}}}*/
      gen hscgrp = .
        label var hscgrp "출신고계열환경"
        label define HSCGRP 1 "특성화/기타" 2 "일반" 3 "특목/자율/강남3고"
        label value hscgrp HSCGRP
      replace hscgrp = 1 if f999 == 1
      replace hscgrp = 2 if inlist(f999 , 2, 3)
      replace hscgrp = 3 if inlist(f999 , 4, 5, 6, 7)
      drop temp??
    /*}}}*/
    foreach i of local numvarlist {
      drop `i'??
    }
    foreach i of local charvarlist {
      drop `i'??
    }
  save ~/dropbox/goms/goms.dta , replace
