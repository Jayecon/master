  set more off
  clear
  tempfile tempgoms
  cd ~/dropbox/goms
  /*07 data cleaning{{{*/
    local varlist ///
      pid        /// /*PID*/
      found      /// /*국공사립*/
      course     /// /*학위과정 유형*/
      majorcat   /// /*전공계열*/
      dpmt       /// /*전공_소분류 CODE*/
      major      /// /*전공 세분류 CODE 혹은 전공명*/
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
      f005       /// /*출신 고등학교 소재지(국가명)*/
      f006       /// /*출신 고등학교 소재지_시도(특별시/광역시/도) CODE*/
      f009       /// /*고등학교 계열*/
      f010       /// /*졸업 대학 입학 구분(입학 혹은 편입)*/
      f018       /// /*졸업한 대학을 선택한 이유*/
      f138       /// /*최종 졸업한 대학 이전에 다른 대학을 다닌 경험 유무*/
      p018       /// /*출생 지역(국내외구분)*/
      p019       /// /*출생 지역(국외_국가명)*/
      p020       /// /*출생 지역 시도(특별시/광역시/도) CODE*/
      p026       /// /*아버님의 최종 학력*/
      p027       /// /*아버님의 최종 학력 이수 여부*/
      p028z      /// /*아버님의 최종 학력_생성변수*/
      p029       /// /*어머님의 최종 학력*/
      p030       /// /*어머님의 최종 학력 이수 여부*/
      p031z      /// /*어머님의 최종 학력_생성변수*/
      p032       /// /*대학 입학(편입) 당시 아버님의 직업*/
      p033       /// /*대학 입학(편입) 당시 어머님의 직업*/
      p034       /// /*대학 입학(편입) 당시 부모님의 월평균 소득*/
      wt             /*가중치*/
    use rawdata/GP07.dta
    rename g071* *
    keep `varlist'
    /* 의예과 선별*/ 
      gen byte medtyp = 0
        label var medtyp "의예과"
        capture label define MEDTYP 1 "의학" 2 "치의학" 3 "한의학" 4 "수의학" 5 "약학" 
        label value medtyp MEDTYP
        replace medtyp = 1 if inlist(major , 1798 , 1799 )
        replace medtyp = 2 if inlist(major , 2362 )
        replace medtyp = 3 if inlist(major , 2632 )
        replace medtyp = 4 if inlist(major , 1306 , 1307 )
        replace medtyp = 5 if inlist(major , 1516 , 1517 , 1518 , 2173 , 2174 ) 
    /* 대학명 합치기*/
      rename pid g071pid
      merge 1:1 g071pid using rawdata/goms_gu07 , nogen
      rename g071* * 
      rename unibran branch /*07년 branch 변수는 원자료에 없음*/
        label var branch "본분교"
        capture label var uniname "출신대학명"
        capture label var unicode "출신대학code"
    /*결측치 제어*/
      mvdecode _all , mv(-1, -3)
      mvdecode p034* , mv(9, 10)
      mvdecode p026* , mv(8)
      mvdecode p029* , mv(8)
    /*기타 제어*/
      rename * *07
      rename pid07 pid 
      gen year = 2007
        label var year "조사년도"
      gen wave =  1
        label var wave "조사회차"
    save `tempgoms'
  /*}}}*/
  /*08 data cleaning{{{*/
    local varlist ///
      pid        /// /*PID*/
      branch     /// /*본분교*/
      found      /// /*국공사립*/
      course     /// /*학위과정 유형*/
      majorcat   /// /*전공계열*/
      dpmt       /// /*전공_소분류 CODE*/
      major      /// /*전공 세분류 CODE 혹은 전공명*/
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
      f005       /// /*출신 고등학교 소재지(국가명)*/
      f006       /// /*출신 고등학교 소재지_시도(특별시/광역시/도) CODE*/
      f007       /// /*출신 고등학교 소재지_시군구(구/시/군) CODE*/
      f008       /// /*출신 고등학교 구분(고등학교 혹은 검정고시)*/
      f009       /// /*고등학교 계열*/
      f010       /// /*졸업 대학 입학 구분(입학 혹은 편입)*/
      f018       /// /*졸업한 대학을 선택한 이유*/
      f138       /// /*최종 졸업한 대학 이전에 다른 대학을 다닌 경험 유무*/
      p018       /// /*출생 지역(국내외구분)*/
      p019       /// /*출생 지역(국외_국가명)*/
      p020       /// /*출생 지역 시도(특별시/광역시/도) CODE*/
      p026       /// /*아버님의 최종 학력*/
      p027       /// /*아버님의 최종 학력 이수 여부*/
      p028z      /// /*아버님의 최종 학력_생성변수*/
      p029       /// /*어머님의 최종 학력*/
      p030       /// /*어머님의 최종 학력 이수 여부*/
      p031z      /// /*어머님의 최종 학력_생성변수*/
      p032       /// /*대학 입학(편입) 당시 아버님의 직업*/
      p033       /// /*대학 입학(편입) 당시 어머님의 직업*/
      p034       /// /*대학 입학(편입) 당시 부모님의 월평균 소득*/
      wt             /*가중치*/
    use rawdata/GP08.dta
    rename g081* *
    keep `varlist'
    /* 의예과 선별*/ 
      gen byte medtyp = 0
        label var medtyp "의예과"
        capture label define MEDTYP 1 "의학" 2 "치의학" 3 "한의학" 4 "수의학" 5 "약학" 
        label value medtyp MEDTYP
        replace medtyp = 1 if inlist(major , "U06010100003", "U06010100004" , "U06010100005" , "U06010100017" , "U06010100021"  )
        replace medtyp = 2 if inlist(major , "U06010200005" )
        replace medtyp = 3 if inlist(major , "U06010300002" )
        replace medtyp = 4 if inlist(major , "U05020300003" , "U05020300015" )
        replace medtyp = 5 if strpos(major , "U060301" ) 
    /* 대학명 합치기*/
      rename pid g081pid
      merge 1:1 g081pid using rawdata/goms_gu08 , nogen
      rename g081* * 
      drop unibran 
      capture label var uniname "출신대학명"
      capture label var unicode "출신대학code"
    /*결측치 제어*/
      mvdecode _all , mv(-1, -3)
      mvdecode p034* , mv(9, 10)
      mvdecode p026* , mv(8)
      mvdecode p029* , mv(8)
    /*기타 제어*/
      rename * *08
      rename pid08 pid 
      gen year = 2008
        label var year "조사년도"
      gen wave =  1
        label var wave "조사회차"
    append using `tempgoms'
    save `tempgoms' , replace
  /*}}}*/
  /*09 data cleaning{{{*/
    local varlist ///
      pid        /// /*PID*/
      branch     /// /*본분교*/
      found      /// /*국공사립*/
      course     /// /*학위과정 유형*/
      daynight   /// /*주야간*/
      majorcat   /// /*전공계열*/
      dpmt       /// /*전공_소분류 CODE*/
      major      /// /*전공 세분류 CODE 혹은 전공명*/
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
      f005       /// /*출신 고등학교 소재지(국가명)*/
      f006       /// /*출신 고등학교 소재지_시도(특별시/광역시/도) CODE*/
      f007       /// /*출신 고등학교 소재지_시군구(구/시/군) CODE*/
      f008       /// /*출신 고등학교 구분(고등학교 혹은 검정고시)*/
      f009       /// /*고등학교 계열*/
      f010       /// /*졸업 대학 입학 구분(입학 혹은 편입)*/
      f014       /// /*입학 전형 (일반 혹은 특별)*/
      f018       /// /*졸업한 대학을 선택한 이유*/
      f138       /// /*최종 졸업한 대학 이전에 다른 대학을 다닌 경험 유무*/
      p018       /// /*출생 지역(국내외구분)*/
      p019       /// /*출생 지역(국외_국가명)*/
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
      wt             /*가중치*/
    use rawdata/GP09.dta
    rename g091* *
    keep `varlist'
    /* 의예과 선별*/ 
      gen byte medtyp = 0
        label var medtyp "의예과"
        capture label define MEDTYP 1 "의학" 2 "치의학" 3 "한의학" 4 "수의학" 5 "약학" 
        label value medtyp MEDTYP
        replace medtyp = 1 if inlist(major , "U06010100003", "U06010100004" , "U06010100005" , "U06010100017" , "U06010100021"  )
        replace medtyp = 2 if inlist(major , "U06010200005" )
        replace medtyp = 3 if inlist(major , "U06010300002" )
        replace medtyp = 4 if inlist(major , "U05020300003" , "U05020300015" )
        replace medtyp = 5 if strpos(major , "U060301" ) 
    /* 대학명 합치기*/
      rename pid g091pid
      merge 1:1 g091pid using rawdata/goms_gu09 , nogen
      rename g091* * 
        capture label var uniname "출신대학명"
        capture label var unicode "출신대학code"
    /*고교명 합치기*/
      merge 1:1 pid using rawdata/goms_gh09 , nogen
        replace hsname = "" if strpos(hsname, "-1")
        replace hsname = "" if strpos(hsname, "-2")
        replace hsname = "" if strpos(hsname, "모름")
        replace hsname = "" if strpos(hsname, "무응답")
        replace hsname = "" if strpos(hsname, "비공개")
        replace hsname = "" if strpos(hsname, "거절")
        replace hsname = "" if strpos(hsname, "탁송")
        capture label var hsname "출신고교명"
        capture label var hscode "출신고교code"
    /*결측치 제어*/
      mvdecode _all , mv(-1, -3)
      mvdecode p034* , mv(9, 10)
      mvdecode p026* , mv(8)
      mvdecode p029* , mv(8)
    /*기타 제어*/
      rename * *09
      rename pid09 pid 
      gen year = 2009
        label var year "조사년도"
      gen wave =  1
        label var wave "조사회차"
    append using `tempgoms'
    save `tempgoms' , replace
  /*}}}*/
  /*10 data cleaning{{{*/
    local varlist ///
      pid        /// /*PID*/
      branch     /// /*본분교*/
      found      /// /*국공사립*/
      course     /// /*학위과정 유형*/
      daynight   /// /*주야간*/
      majorcat   /// /*전공계열*/
      dpmt       /// /*전공_소분류 CODE*/
      major      /// /*전공 세분류 CODE 혹은 전공명*/
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
      f005       /// /*출신 고등학교 소재지(국가명)*/
      f006       /// /*출신 고등학교 소재지_시도(특별시/광역시/도) CODE*/
      f007       /// /*출신 고등학교 소재지_시군구(구/시/군) CODE*/
      f008       /// /*출신 고등학교 구분(고등학교 혹은 검정고시)*/
      f009       /// /*고등학교 계열*/
      f010       /// /*졸업 대학 입학 구분(입학 혹은 편입)*/
      f014       /// /*입학 전형 (일반 혹은 특별)*/
      f018       /// /*졸업한 대학을 선택한 이유*/
      f138       /// /*최종 졸업한 대학 이전에 다른 대학을 다닌 경험 유무*/
      p018       /// /*출생 지역(국내외구분)*/
      p019       /// /*출생 지역(국외_국가명)*/
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
      wt             /*가중치*/
    use rawdata/GP10.dta
    rename g101* *
    keep `varlist'
    /* 의예과 선별*/ 
      gen byte medtyp = 0
        label var medtyp "의예과"
        capture label define MEDTYP 1 "의학" 2 "치의학" 3 "한의학" 4 "수의학" 5 "약학" 
        label value medtyp MEDTYP
        replace medtyp = 1 if inlist(major , "U06010100003", "U06010100004" , "U06010100005" , "U06010100017" , "U06010100021"  )
        replace medtyp = 2 if inlist(major , "U06010200005" )
        replace medtyp = 3 if inlist(major , "U06010300002" )
        replace medtyp = 4 if inlist(major , "U05020300003" , "U05020300015" )
        replace medtyp = 5 if strpos(major , "U060301" ) 
    /* 대학명 합치기*/
      rename pid g101pid
      merge 1:1 g101pid using rawdata/goms_gu10 , nogen
      rename g101* * 
        capture label var uniname "출신대학명"
        capture label var unicode "출신대학code"
    /*고교명 합치기*/
      merge 1:1 pid using rawdata/goms_gh10 , nogen
        replace hsname = "" if strpos(hsname, "-1")
        replace hsname = "" if strpos(hsname, "-2")
        replace hsname = "" if strpos(hsname, "모름")
        replace hsname = "" if strpos(hsname, "무응답")
        replace hsname = "" if strpos(hsname, "비공개")
        replace hsname = "" if strpos(hsname, "거절")
        replace hsname = "" if strpos(hsname, "탁송")
        capture label var hsname "출신고교명"
        capture label var hscode "출신고교code"
    /*결측치 제어*/
      mvdecode _all , mv(-1, -3)
      mvdecode p034* , mv(9, 10)
      mvdecode p026* , mv(8)
      mvdecode p029* , mv(8)
    /*기타 제어*/
      rename * *10
      rename pid10 pid 
      gen year = 2010
        label var year "조사년도"
      gen wave =  1
        label var wave "조사회차"
    append using `tempgoms'
    save `tempgoms' , replace
  /*}}}*/
  /*11 data cleaning{{{*/
    local varlist ///
      pid        /// /*PID*/
      branch     /// /*본분교*/
      found      /// /*국공사립*/
      course     /// /*학위과정 유형*/
      daynight   /// /*주야간*/
      majorcat   /// /*전공계열*/
      dpmt       /// /*전공_소분류 CODE*/
      major      /// /*전공 세분류 CODE 혹은 전공명*/
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
      f005       /// /*출신 고등학교 소재지(국가명)*/
      f006       /// /*출신 고등학교 소재지_시도(특별시/광역시/도) CODE*/
      f007       /// /*출신 고등학교 소재지_시군구(구/시/군) CODE*/
      f008       /// /*출신 고등학교 구분(고등학교 혹은 검정고시)*/
      f009       /// /*고등학교 계열*/
      f010       /// /*졸업 대학 입학 구분(입학 혹은 편입)*/
      f014       /// /*입학 전형 (일반 혹은 특별)*/
      f018       /// /*졸업한 대학을 선택한 이유*/
      f138       /// /*최종 졸업한 대학 이전에 다른 대학을 다닌 경험 유무*/
      p018       /// /*출생 지역(국내외구분)*/
      p019       /// /*출생 지역(국외_국가명)*/
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
      wt             /*가중치*/
    use rawdata/GP11.dta
    rename g111* *
    keep `varlist'
    /* 의예과 선별*/ 
      gen byte medtyp = 0
        label var medtyp "의예과"
        capture label define MEDTYP 1 "의학" 2 "치의학" 3 "한의학" 4 "수의학" 5 "약학" 
        label value medtyp MEDTYP
        replace medtyp = 1 if inlist(major , "U06010100003", "U06010100004" , "U06010100005" , "U06010100017" , "U06010100021"  )
        replace medtyp = 2 if inlist(major , "U06010200005" )
        replace medtyp = 3 if inlist(major , "U06010300002" )
        replace medtyp = 4 if inlist(major , "U05020300003" , "U05020300015" )
        replace medtyp = 5 if strpos(major , "U060301" ) 
    /* 대학명 합치기*/
      rename pid g111pid
      merge 1:1 g111pid using rawdata/goms_gu11 , nogen
      rename g111* * 
        capture label var uniname "출신대학명"
        capture label var unicode "출신대학code"
    /*고교명 합치기*/
      merge 1:1 pid using rawdata/goms_gh11 , nogen
        replace hsname = "" if strpos(hsname, "-1")
        replace hsname = "" if strpos(hsname, "-2")
        replace hsname = "" if strpos(hsname, "모름")
        replace hsname = "" if strpos(hsname, "무응답")
        replace hsname = "" if strpos(hsname, "비공개")
        replace hsname = "" if strpos(hsname, "거절")
        replace hsname = "" if strpos(hsname, "탁송")
        capture label var hsname "출신고교명"
        capture label var hscode "출신고교code"
    /*결측치 제어*/
      mvdecode _all , mv(-1, -3)
      mvdecode p034* , mv(9, 10)
      mvdecode p026* , mv(8)
      mvdecode p029* , mv(8)
    /*기타 제어*/
      rename * *11
      rename pid11 pid 
      gen year = 2011
        label var year "조사년도"
      gen wave =  1
        label var wave "조사회차"
    append using `tempgoms'
    save `tempgoms' , replace
  /*}}}*/
  /*12 data cleaning{{{*/
    local varlist ///
      pid        /// /*PID*/
      branch     /// /*본분교*/
      found      /// /*국공사립*/
      course     /// /*학위과정 유형*/
      daynight   /// /*주야간*/
      majorcat   /// /*전공계열*/
      dpmt       /// /*전공_소분류 CODE*/
      major      /// /*전공 세분류 CODE 혹은 전공명*/
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
      f005       /// /*출신 고등학교 소재지(국가명)*/
      f006       /// /*출신 고등학교 소재지_시도(특별시/광역시/도) CODE*/
      f007       /// /*출신 고등학교 소재지_시군구(구/시/군) CODE*/
      f008       /// /*출신 고등학교 구분(고등학교 혹은 검정고시)*/
      f009       /// /*고등학교 계열*/
      f010       /// /*졸업 대학 입학 구분(입학 혹은 편입)*/
      f014       /// /*입학 전형 (일반 혹은 특별)*/
      f016       /// /*졸업한 대학에 입학하는데 가장 중요했던 요소*/
      f018       /// /*졸업한 대학을 선택한 이유*/
      f138       /// /*최종 졸업한 대학 이전에 다른 대학을 다닌 경험 유무*/
      p018       /// /*출생 지역(국내외구분)*/
      p019       /// /*출생 지역(국외_국가명)*/
      p020       /// /*출생 지역 시도(특별시/광역시/도) CODE*/
      p026       /// /*아버님의 최종 학력*/
      p027       /// /*아버님의 최종 학력 이수 여부*/
      p028z      /// /*아버님의 최종 학력_생성변수*/
      p029       /// /*어머님의 최종 학력*/
      p030       /// /*어머님의 최종 학력 이수 여부*/
      p031z      /// /*어머님의 최종 학력_생성변수*/
      p032       /// /*대학 입학(편입) 당시 아버님의 직업*/
      p033       /// /*대학 입학(편입) 당시 어머님의 직업*/
      p034       /// /*대학 입학(편입) 당시 부모님의 월평균 소득*/
      wt             /*가중치*/
    use rawdata/GP12.dta
    rename g121* *
    keep `varlist'
    /* 의예과 선별*/ 
      gen byte medtyp = 0
        label var medtyp "의예과"
        capture label define MEDTYP 1 "의학" 2 "치의학" 3 "한의학" 4 "수의학" 5 "약학" 
        label value medtyp MEDTYP
        replace medtyp = 1 if inlist(major , "U06010100003", "U06010100004" , "U06010100005" , "U06010100017" , "U06010100021"  )
        replace medtyp = 2 if inlist(major , "U06010200005" )
        replace medtyp = 3 if inlist(major , "U06010300002" )
        replace medtyp = 4 if inlist(major , "U05020300003" , "U05020300015" )
        replace medtyp = 5 if strpos(major , "U060301" ) 
    /* 대학명 합치기*/
      rename pid g121pid
      merge 1:1 g121pid using rawdata/goms_gu12 , nogen
      rename g121* * 
        capture label var uniname "출신대학명"
        capture label var unicode "출신대학code"
    /*고교명 합치기*/
      merge 1:1 pid using rawdata/goms_gh12 , nogen
        replace hsname = "" if strpos(hsname, "-1")
        replace hsname = "" if strpos(hsname, "-2")
        replace hsname = "" if strpos(hsname, "모름")
        replace hsname = "" if strpos(hsname, "무응답")
        replace hsname = "" if strpos(hsname, "비공개")
        replace hsname = "" if strpos(hsname, "거절")
        replace hsname = "" if strpos(hsname, "탁송")
        capture label var hsname "출신고교명"
        capture label var hscode "출신고교code"
    /*결측치 제어*/
      mvdecode _all , mv(-1, -3)
      mvdecode p034* , mv(9, 10)
      mvdecode p026* , mv(8)
      mvdecode p029* , mv(8)
    /*기타 제어*/
      rename * *12
      rename pid12 pid 
      gen year = 2012
        label var year "조사년도"
      gen wave =  1
        label var wave "조사회차"
    append using `tempgoms'
    save `tempgoms' , replace
  /*}}}*/
  /*13 data cleaning{{{*/
    local varlist ///
      pid        /// /*PID*/
      branch     /// /*본분교*/
      found      /// /*국공사립*/
      course     /// /*학위과정 유형*/
      daynight   /// /*주야간*/
      majorcat   /// /*전공계열*/
      dpmt       /// /*전공_소분류 CODE*/
      major      /// /*전공 세분류 CODE 혹은 전공명*/
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
      f005       /// /*출신 고등학교 소재지(국가명)*/
      f006       /// /*출신 고등학교 소재지_시도(특별시/광역시/도) CODE*/
      f007       /// /*출신 고등학교 소재지_시군구(구/시/군) CODE*/
      f008       /// /*출신 고등학교 구분(고등학교 혹은 검정고시)*/
      f009       /// /*고등학교 계열*/
      f010       /// /*졸업 대학 입학 구분(입학 혹은 편입)*/
      f014       /// /*입학 전형 (일반 혹은 특별)*/
      f016       /// /*졸업한 대학에 입학하는데 가장 중요했던 요소*/
      f018       /// /*졸업한 대학을 선택한 이유*/
      f138       /// /*최종 졸업한 대학 이전에 다른 대학을 다닌 경험 유무*/
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
      wt             /*가중치*/
    use rawdata/GP13.dta
    rename g131* *
    keep `varlist'
    /*복제된 관측치 제거*/
    bys pid : gen tag = _N
    drop if missing(sex) & tag != 1
    drop tag
    /* 의예과 선별*/ 
      gen byte medtyp = 0
        label var medtyp "의예과"
        capture label define MEDTYP 1 "의학" 2 "치의학" 3 "한의학" 4 "수의학" 5 "약학" 
        label value medtyp MEDTYP
        replace medtyp = 1 if inlist(major , "U06010100003", "U06010100004" , "U06010100005" , "U06010100017" , "U06010100021"  )
        replace medtyp = 2 if inlist(major , "U06010200005" )
        replace medtyp = 3 if inlist(major , "U06010300002" )
        replace medtyp = 4 if inlist(major , "U05020300003" , "U05020300015" )
        replace medtyp = 5 if strpos(major , "U060301" ) 
    /* 대학명 합치기*/
      rename pid g131pid
      merge 1:1 g131pid using rawdata/goms_gu13 , nogen
      rename g131* * 
        capture label var uniname "출신대학명"
        capture label var unicode "출신대학code"
    /*고교명 합치기*/
      merge 1:1 pid using rawdata/goms_gh13 , nogen
        replace hsname = "" if strpos(hsname, "-1")
        replace hsname = "" if strpos(hsname, "-2")
        replace hsname = "" if strpos(hsname, "모름")
        replace hsname = "" if strpos(hsname, "무응답")
        replace hsname = "" if strpos(hsname, "비공개")
        replace hsname = "" if strpos(hsname, "거절")
        replace hsname = "" if strpos(hsname, "탁송")
        capture label var hsname "출신고교명"
        capture label var hscode "출신고교code"
    /*결측치 제어*/
      mvdecode _all , mv(-1, -3)
      mvdecode p034* , mv(9, 10)
      mvdecode p026* , mv(8)
      mvdecode p029* , mv(8)
    /*기타 제어*/
      rename * *13
      rename pid13 pid 
      gen year = 2013
        label var year "조사년도"
      gen wave =  1
        label var wave "조사회차"
    append using `tempgoms'
    save `tempgoms' , replace
  /*}}}*/
  /*14 data cleaning{{{*/
    local varlist ///
      pid        /// /*PID*/
      branch     /// /*본분교*/
      found      /// /*국공사립*/
      course     /// /*학위과정 유형*/
      daynight   /// /*주야간*/
      majorcat   /// /*전공계열*/
      dpmt       /// /*전공_소분류 CODE*/
      major      /// /*전공 세분류 CODE 혹은 전공명*/
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
      f014       /// /*입학 전형 (일반 혹은 특별)*/
      f016       /// /*졸업한 대학에 입학하는데 가장 중요했던 요소*/
      f018       /// /*졸업한 대학을 선택한 이유*/
      f138       /// /*최종 졸업한 대학 이전에 다른 대학을 다닌 경험 유무*/
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
      wt             /*가중치*/
    use rawdata/GP14.dta
    rename g141* *
    keep `varlist'
    /* 의예과 선별*/ 
      gen byte medtyp = 0
        label var medtyp "의예과"
        capture label define MEDTYP 1 "의학" 2 "치의학" 3 "한의학" 4 "수의학" 5 "약학" 
        label value medtyp MEDTYP
        replace medtyp = 1 if inlist(major , "U06010100003", "U06010100004" , "U06010100005" , "U06010100017" , "U06010100021"  )
        replace medtyp = 2 if inlist(major , "U06010200005" )
        replace medtyp = 3 if inlist(major , "U06010300002" )
        replace medtyp = 4 if inlist(major , "U05020300003" , "U05020300015" )
        replace medtyp = 5 if strpos(major , "U060301" ) 
    /* 대학명 합치기*/
      rename pid g141pid
      merge 1:1 g141pid using rawdata/goms_gu14 , nogen
      rename g141* * 
        capture label var uniname "출신대학명"
        capture label var unicode "출신대학code"
    /*고교명 합치기*/
      merge 1:1 pid using rawdata/goms_gh14 , nogen
        replace hsname = "" if strpos(hsname, "-1")
        replace hsname = "" if strpos(hsname, "-2")
        replace hsname = "" if strpos(hsname, "모름")
        replace hsname = "" if strpos(hsname, "무응답")
        replace hsname = "" if strpos(hsname, "비공개")
        replace hsname = "" if strpos(hsname, "거절")
        replace hsname = "" if strpos(hsname, "탁송")
        capture label var hsname "출신고교명"
        capture label var hscode "출신고교code"
    /*결측치 제어*/
      mvdecode _all , mv(-1, -3)
      mvdecode p034* , mv(9, 10)
      mvdecode p026* , mv(8)
      mvdecode p029* , mv(8)
    /*기타 제어*/
      rename * *14
      rename pid14 pid 
      gen year = 2014
        label var year "조사년도"
      gen wave =  1
        label var wave "조사회차"
    append using `tempgoms'
    save `tempgoms' , replace
  /*}}}*/
  /*15 data cleaning{{{*/
    local varlist ///
      pid        /// /*PID*/
      branch     /// /*본분교*/
      found      /// /*국공사립*/
      course     /// /*학위과정 유형*/
      daynight   /// /*주야간*/
      majorcat   /// /*전공계열*/
      dpmt       /// /*전공_소분류 CODE*/
      major      /// /*전공 세분류 CODE 혹은 전공명*/
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
      f005       /// /*출신 고등학교 소재지(국가명)*/
      f006       /// /*출신 고등학교 소재지_시도(특별시/광역시/도) CODE*/
      f007       /// /*출신 고등학교 소재지_시군구(구/시/군) CODE*/
      f008       /// /*출신 고등학교 구분(고등학교 혹은 검정고시)*/
      f009       /// /*고등학교 계열*/
      f010       /// /*졸업 대학 입학 구분(입학 혹은 편입)*/
      f013       /// /*대학 입학 모집방법(정시 혹은 수시)*/
      f014       /// /*입학 전형 (일반 혹은 특별)*/
      f016       /// /*졸업한 대학에 입학하는데 가장 중요했던 요소*/
      f018       /// /*졸업한 대학을 선택한 이유*/
      f138       /// /*최종 졸업한 대학 이전에 다른 대학을 다닌 경험 유무*/
      p018       /// /*출생 지역(국내외구분)*/
      p019       /// /*출생 지역(국외_국가명)*/
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
      wt             /*가중치*/
    use rawdata/GP15.dta
    rename g151* *
    keep `varlist'
    /* 의예과 선별*/ 
      gen byte medtyp = 0
        label var medtyp "의예과"
        capture label define MEDTYP 1 "의학" 2 "치의학" 3 "한의학" 4 "수의학" 5 "약학" 
        label value medtyp MEDTYP
        replace medtyp = 1 if inlist(major , "U06010100003", "U06010100004" , "U06010100005" , "U06010100017" , "U06010100021"  )
        replace medtyp = 2 if inlist(major , "U06010200005" )
        replace medtyp = 3 if inlist(major , "U06010300002" )
        replace medtyp = 4 if inlist(major , "U05020300003" , "U05020300015" )
        replace medtyp = 5 if strpos(major , "U060301" ) 
    /* 대학명 합치기*/
      rename pid g151pid
      merge 1:1 g151pid using rawdata/goms_gu15 , nogen
      rename g151* * 
        capture label var uniname "출신대학명"
        capture label var unicode "출신대학code"
    /*고교명 합치기*/
      merge 1:1 pid using rawdata/goms_gh15 , nogen
        replace hsname = "" if strpos(hsname, "-1")
        replace hsname = "" if strpos(hsname, "-2")
        replace hsname = "" if strpos(hsname, "모름")
        replace hsname = "" if strpos(hsname, "무응답")
        replace hsname = "" if strpos(hsname, "비공개")
        replace hsname = "" if strpos(hsname, "거절")
        replace hsname = "" if strpos(hsname, "탁송")
        capture label var hsname "출신고교명"
        capture label var hscode "출신고교code"
    /*결측치 제어*/
      mvdecode _all , mv(-1, -3)
      mvdecode p034* , mv(9, 10)
      mvdecode p026* , mv(8)
      mvdecode p029* , mv(8)
    /*기타 제어*/
      rename * *15
      rename pid15 pid 
      gen year = 2015
        label var year "조사년도"
      gen wave =  1
        label var wave "조사회차"
    append using `tempgoms'
    save `tempgoms' , replace
  /*}}}*/
  /*16 data cleaning{{{*/
    local varlist ///
      pid        /// /*PID*/
      branch     /// /*본분교*/
      found      /// /*국공사립*/
      course     /// /*학위과정 유형*/
      daynight   /// /*주야간*/
      majorcat   /// /*전공계열*/
      dpmt       /// /*전공_소분류 CODE*/
      major      /// /*전공 세분류 CODE 혹은 전공명*/
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
      f005       /// /*출신 고등학교 소재지(국가명)*/
      f006       /// /*출신 고등학교 소재지_시도(특별시/광역시/도) CODE*/
      f007       /// /*출신 고등학교 소재지_시군구(구/시/군) CODE*/
      f008       /// /*출신 고등학교 구분(고등학교 혹은 검정고시)*/
      f009       /// /*고등학교 계열*/
      f010       /// /*졸업 대학 입학 구분(입학 혹은 편입)*/
      f013       /// /*대학 입학 모집방법(정시 혹은 수시)*/
      f170       /// /*입학 전형 유형 (세부 유형)*/
      f016       /// /*졸업한 대학에 입학하는데 가장 중요했던 요소*/
      f017       /// /*졸업한 대학에 입학하는데 가장 중요했던 요소(2순위)*/
      f018       /// /*졸업한 대학을 선택한 이유*/
      f138       /// /*최종 졸업한 대학 이전에 다른 대학을 다닌 경험 유무*/
      f139       /// /*최종 졸업한 대학 이전에 다른 대학(원)을 다닌 경험_횟수*/
      p018       /// /*출생 지역(국내외구분)*/
      p019       /// /*출생 지역(국외_국가명)*/
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
      wt             /*가중치*/
    use rawdata/GP16.dta
    rename g161* *
    keep `varlist'
    /* 의예과 선별*/ 
      gen byte medtyp = 0
        label var medtyp "의예과"
        capture label define MEDTYP 1 "의학" 2 "치의학" 3 "한의학" 4 "수의학" 5 "약학" 
        label value medtyp MEDTYP
        replace medtyp = 1 if inlist(major , "U06010100003", "U06010100004" , "U06010100005" , "U06010100017" , "U06010100021"  )
        replace medtyp = 2 if inlist(major , "U06010200005" )
        replace medtyp = 3 if inlist(major , "U06010300002" )
        replace medtyp = 4 if inlist(major , "U05020300003" , "U05020300015" )
        replace medtyp = 5 if strpos(major , "U060301" ) 
    /* 대학명 합치기*/
      rename pid g161pid
      merge 1:1 g161pid using rawdata/goms_gu16 , nogen
      rename g161* * 
        capture label var uniname "출신대학명"
        capture label var unicode "출신대학code"
    /*고교명 합치기*/
      merge 1:1 pid using rawdata/goms_gh16 , nogen
        replace hsname = "" if strpos(hsname, "-1")
        replace hsname = "" if strpos(hsname, "-2")
        replace hsname = "" if strpos(hsname, "모름")
        replace hsname = "" if strpos(hsname, "무응답")
        replace hsname = "" if strpos(hsname, "비공개")
        replace hsname = "" if strpos(hsname, "거절")
        replace hsname = "" if strpos(hsname, "탁송")
        capture label var hsname "출신고교명"
        capture label var hscode "출신고교code"
    /*결측치 제어*/
      mvdecode _all , mv(-1, -3)
      mvdecode p034* , mv(9, 10)
      mvdecode p026* , mv(8)
      mvdecode p029* , mv(8)
    /*기타 제어*/
      rename * *16
      rename pid16 pid 
      gen year = 2016
        label var year "조사년도"
      gen wave =  1
        label var wave "조사회차"
    append using `tempgoms'
    save `tempgoms' , replace
  /*}}}*/
  /*17 data cleaning{{{*/
    local varlist ///
      pid        /// /*PID*/
      branch     /// /*본분교*/
      found      /// /*국공사립*/
      course     /// /*학위과정 유형*/
      daynight   /// /*주야간*/
      majorcat   /// /*전공계열*/
      dpmt       /// /*전공_소분류 CODE*/
      major      /// /*전공 세분류 CODE 혹은 전공명*/
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
      f005       /// /*출신 고등학교 소재지(국가명)*/
      f006       /// /*출신 고등학교 소재지_시도(특별시/광역시/도) CODE*/
      f007       /// /*출신 고등학교 소재지_시군구(구/시/군) CODE*/
      f008       /// /*출신 고등학교 구분(고등학교 혹은 검정고시)*/
      f009       /// /*고등학교 계열*/
      f010       /// /*졸업 대학 입학 구분(입학 혹은 편입)*/
      f013       /// /*대학 입학 모집방법(정시 혹은 수시)*/
      f170       /// /*입학 전형 유형 (세부 유형)*/
      f016       /// /*졸업한 대학에 입학하는데 가장 중요했던 요소*/
      f017       /// /*졸업한 대학에 입학하는데 가장 중요했던 요소(2순위)*/
      f018       /// /*졸업한 대학을 선택한 이유*/
      f138       /// /*최종 졸업한 대학 이전에 다른 대학을 다닌 경험 유무*/
      f139       /// /*최종 졸업한 대학 이전에 다른 대학(원)을 다닌 경험_횟수*/
      p018       /// /*출생 지역(국내외구분)*/
      p019       /// /*출생 지역(국외_국가명)*/
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
      wt             /*가중치*/
  use rawdata/GP17.dta
  rename g171* *
  keep `varlist'
  /* 의예과 선별*/ 
    gen byte medtyp = 0
      label var medtyp "의예과"
      capture label define MEDTYP 1 "의학" 2 "치의학" 3 "한의학" 4 "수의학" 5 "약학" 
      label value medtyp MEDTYP
      replace medtyp = 1 if inlist(major , "U06010100003", "U06010100004" , "U06010100005" , "U06010100017" , "U06010100021"  )
      replace medtyp = 2 if inlist(major , "U06010200005" )
      replace medtyp = 3 if inlist(major , "U06010300002" )
      replace medtyp = 4 if inlist(major , "U05020300003" , "U05020300015" )
      replace medtyp = 5 if strpos(major , "U060301" ) 
  /* 대학명 합치기*/
    rename pid g171pid
    merge 1:1 g171pid using rawdata/goms_gu17 , nogen
    rename g171* * 
      capture label var uniname "출신대학명"
      capture label var unicode "출신대학code"
  /*고교명 합치기*/
    merge 1:1 pid using rawdata/goms_gh17 , nogen
      replace hsname = "" if strpos(hsname, "-1")
      replace hsname = "" if strpos(hsname, "-2")
      replace hsname = "" if strpos(hsname, "모름")
      replace hsname = "" if strpos(hsname, "무응답")
      replace hsname = "" if strpos(hsname, "비공개")
      replace hsname = "" if strpos(hsname, "거절")
      replace hsname = "" if strpos(hsname, "탁송")
      capture label var hsname "출신고교명"
      capture label var hscode "출신고교code"
  /*결측치 제어*/
    mvdecode _all , mv(-1, -3)
    mvdecode p034* , mv(9, 10)
    mvdecode p026* , mv(8)
    mvdecode p029* , mv(8)
  /*기타 제어*/
    rename * *17
    rename pid17 pid 
    gen year = 2017
      label var year "조사년도"
    gen wave =  1
      label var wave "조사회차"
  append using `tempgoms'
  save `tempgoms' , replace
  /*}}}*/
  label data "GOMS 07-17"
    order _all , alpha
    order wave pid year , first
    sort wave pid
  save goms_master.dta , replace
