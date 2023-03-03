set more off
set maxvar 30000
clear
cd ~/dropbox/goms
  /* 년도별 추출변수 목록 {{{*/
    local varlist07 pid-gradum sq004-sq011 a001-a077 a116-a355 a388-a389 /// 
      b001-b047 c001-c003 d001-d061 d106-d253 f001-f053 f073-f074 h001-h060 ///
      i001-i072 j001-j021 k001-k074 l001-l082 m001-m085           p001-p045 wt
    local varlist08 pid-gradum sq004-sq011 a001-a057 a116-a296 a388-a389 /// 
      b001-b067 c001-c006 d001-d060 d106-d249 f001-f061 f073-f074 h001-h062 ///
      i001-i070 j001-j023 k001-k059 l001-l080 m001-m096 o010-o152 p001-p045 wt
    local varlist09 pid-gradum sq001-sq011 a001-a079 a116-a296 a388-a389 /// 
      b001-b067 c001-c006 d001-d060 d106-d249 f001-f061 f073-f074 h001-h062 ///
      i001-i073 j001-j021 k001-k059 l001-l082 m001-m096 o001-o152 p001-p045 wt
    local varlist10 pid-gradum sq001-sq011 a001-a085 a114-a355 a388-a389 /// 
      b001-b067 c001-c021 d001-d060 d106-d249 f001-f061 f073-f074 h001-h062 ///
      i001-i070 j001-j021 k001-k059 l001-l082 m001-m096 o001-o100 p001-p045 wt
    local varlist11 pid-gradum sq001-sq011 a001-a085 a114-a355 a388-a389 /// 
      b001-b067 c001-c021 d001-d060 d106-d249 f001-f061 f073-f074 h001-h062 ///
      i001-i073 j001-j021 k001-k059 l001-l082 m001-m096 o001-o100 p001-p045 wt
    local varlist12 pid-gradum sq001-sq011 a001-a085 a114-a355 a388-a389 /// 
      b001-b067 c001-c021 d001-d079 d106-d249 f001-f061 f073-f074 h001-h062 ///
      i001-i071 j001-j021 k001-k059 l001-l082 m001-m096 o035-o100 p001-p045 wt
    local varlist13 pid-gradum sq001-sq011 a001-a085 a114-a355 a388-a389 /// 
      b001-b067 c001-c021 d001-d079 d106-d249 f001-f061 f073-f074 h001-h062 ///
      i001-i072 j001-j021 k001-k059 l001-l082 m001-m096 o035-o100 p001-p045 wt
    local varlist14 pid-gradum sq001-sq011 a001-a074_2018 a114-a355 a388-a389 /// 
      b001-b068 c001-c021 d001-d079 d106-d249 f001-f061 f073-f074 h001-h062 ///
      i001-i071 j001-j021 k001-k109 l001-l082 m001-m093 o035-o146 p001-p045 wt
    local varlist15 pid-gradum sq001-sq011 a001-a074_2018 a114-a355 a388-a389 /// 
      b001-b068 c001-c021 d001-d079 d106-d249 f001-f061 f073-f074 h001-h062 ///
      i001-i071 j001-j021 k004-k109 l001-l084 m001-m093 o035-o150 p001-p045 wt
    local varlist16 pid-gradum sq001-sq011 a001-a074_2018 a114-a355 a388-a389 /// 
      b001-b068 c001-c021 d001-d079 d106-d249 f001-f061 f073-f074 h001-h062 ///
      i001-i074 j001-j021 k004-k109 l001-l084 m001-m093 o035-o161 p001-p045 wt
    local varlist17 pid-gradum sq001-sq011 a001-a074_2018 a114-a355 a388-a389 /// 
      b001-b068 c001-c021 d001-d079 d106-d249 f001-f061 f073-f074 h001-h062 ///
      i001-i074 j001-j021 k001-k109 l001-l084 m001-m093           p001-p045 wt
  /*}}}*/
  /*년도별 파일을 goms??.dta 로 각각 저장하기{{{*/
    forvalue x = 7/17 {
      local yr : disp %02.0f  = `x'
      use ~/dropbox/GOMS/rawdata/GP`yr'.dta
      di "year = " 2000+`x'
      rename g`yr'1* *
      drop if missing(sex)
      keep `varlist`yr''
      /*년도별 의예계열 선별{{{*/ 
        gen byte medtyp = .
        label var medtyp "의예계열전공"
        label define medtyp 1 "의학" 2 "치의학" 3 "한의학" 4 "수의학" 5 "약학"
        label value medtyp medtyp
        if ("`x'" == "7") {
          replace medtyp = 1 if inlist(major , 1798 , 1799 )
          replace medtyp = 2 if inlist(major , 2362 )
          replace medtyp = 3 if inlist(major , 2632 )
          replace medtyp = 4 if inlist(major , 1306 , 1307 )
          replace medtyp = 5 if inlist(major , 1516 , 1517 , 1518 , 2173 , 2174 ) 
        }
        else {
          replace medtyp = 1 if inlist(major , "U06010100003", "U06010100004" , "U06010100005" , "U06010100017" , "U06010100021"  )
          replace medtyp = 2 if inlist(major , "U06010200005" )
          replace medtyp = 3 if inlist(major , "U06010300002" )
          replace medtyp = 4 if inlist(major , "U05020300003" , "U05020300015" )
          replace medtyp = 5 if strpos(major , "U060301" ) 
          replace medtyp = . if inlist(major , "U06030100021" ) 
        }
      /*}}}*/
      /* 대학 및 고교정보 합치기{{{*/
        rename pid g`yr'1pid
        merge 1:1 g`yr'1pid using ~/dropbox/goms/rawdata/goms_gu`yr' , nogen
        rename g`yr'1* * 
        capture label var uniname "출신대학명"
        capture label var unicode "출신대학code"
        if (`x' >= 9 ){
          merge 1:1 pid using ~/dropbox/goms/rawdata/goms_gh`yr' , nogen
          replace hsname = "" if strpos(hsname, "-1")
          replace hsname = "" if strpos(hsname, "-2")
          replace hsname = "" if strpos(hsname, "모름")
          replace hsname = "" if strpos(hsname, "무응답")
          replace hsname = "" if strpos(hsname, "비공개")
          replace hsname = "" if strpos(hsname, "거절")
          replace hsname = "" if strpos(hsname, "탁송")
          capture label var hsname "출신고교명"
          capture label var hscode "출신고교code"
        }
        rename * *`yr'
      /*}}}*/
      /* 예외처리 {{{*/
        if ("`x'" == "7") {
          rename unibran branch07
          label var branch "본분교"
        }
        if ("`x'" == "15" ){
          destring school15 , replace
        }
        if (`x' >= 9 ){
          rename hs????`yr' hs????
        }
      /*}}}*/
      gen year = `x' +2000
      label var year "조사년도"
      gen wave = `x' - 6
      label var wave "조사회차"
      mvdecode _all , mv(-1, -3)
      mvdecode p034* , mv(9, 10)
      mvdecode p026* , mv(8)
      mvdecode p029* , mv(8)
      if ("`x'" == "7") {
        save ~/dropbox/goms/goms_master.dta , replace
      }
      else {
        append using ~/dropbox/goms/goms_master.dta
        save ~/dropbox/goms/goms_master.dta , replace
      }
    }
  /*}}}*/
  label data "GOMS 07-17"
  order pid?? wave year , first
save ~/dropbox/goms/goms_eq_master.dta , replace
save ~/dropbox/sjho/goms_eq_master.dta , replace
