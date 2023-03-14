set more off
set maxvar 30000
clear
cd ~/dropbox/goms
/* 년도별 추출변수 목록 {{{*/
  local varlist07 pid age birthy sex area province graduy gradum majorcat major school wt ///
    /*occyear   */ a001-a002 a003 ///
    /*jobtype   */ a004_10-a006_10 a007a_2018-a009_2018 ///
    /*fulljob   */ a021 a022 ///
    /*job time  */ a116-a118 ///
    /*wage      */ a120-a122 ///
    /*experience*/ d001-d006 e001-e006 e078-e081 e153-e156 ///
    /*exponuniv */ h001-h002 h006-h009 h026-h029 h046-h049 ///
    /*exponhs   */ f001-f002 f006 f009
  local varlist08 pid age birthy branch sex area province graduy gradum majorcat major school wt ///
    /*occyear   */ a001-a002 a003 ///
    /*jobtype   */ a004_10-a006_10 a007a_2018-a009_2018 ///
    /*fulljob   */ a021 a022 ///
    /*job time  */ a116-a118 ///
    /*wage      */ a120-a122 ///
    /*experience*/ d001-d006 e001-e006 e078-e081 e153-e156 ///
    /*exponuniv */ h001-h002 h010z h030z h050z ///
    /*exponhs   */ f001-f002 f006-f009
  local varlist09 pid age birthy branch sex area province graduy gradum majorcat major school wt ///
    /*occyear   */ a001-a002 a003 ///
    /*jobtype   */ a004_10-a006_10 a007a_2018-a009_2018 ///
    /*fulljob   */ a021 a022 /// 
    /*job time  */ a116-a118 ///
    /*wage      */ a120-a122 ///
    /*experience*/ d001-d006 e001-e006 e078-e081 e153-e156 ///
    /*exponuniv */ h001-h002 h010z h030z h050z ///
    /*exponhs   */ f001-f002 f006-f009
  local varlist10 pid age birthy branch sex area province graduy gradum majorcat major school wt ///
    /*occyear   */ a001-a002 a003 ///
    /*jobtype   */ a004_10-a006_10 a007a_2018-a009_2018 ///
    /*fulljob   */ a021 a022 /// 
    /*job time  */ a116-a118 ///
    /*wage      */ a120-a122 ///
    /*experience*/ d001-d006 e001-e006 e078-e081 e153-e156 ///
    /*exponuniv */ h001-h002 h010z h030z h050z ///
    /*exponhs   */ f001-f002 f006-f009
  local varlist11 pid age birthy branch sex area province graduy gradum majorcat major school wt ///
    /*occyear   */ a001-a002 a003 ///
    /*jobtype   */ a004_10-a006_10 a007a_2018-a009_2018 ///
    /*fulljob   */ a021 a022 /// 
    /*job time  */ a116-a118 ///
    /*wage      */ a120-a122 ///
    /*experience*/ d001-d006 e001-e006 e078-e081 e153-e156 ///
    /*exponuniv */ h001-h002 h006-h009 h026-h029 h046-h049  ///
    /*exponhs   */ f001-f002 f006-f009
  local varlist12 pid age birthy branch sex area province graduy gradum majorcat major school wt ///
    /*occyear   */ a001-a002 a003 ///
    /*jobtype   */ a004_10-a006_10 a007a_2018-a009_2018 ///
    /*fulljob   */ a021 a022 /// 
    /*job time  */ a116-a118 ///
    /*wage      */ a120-a122 ///
    /*experience*/ d001-d006 e001-e006 e078-e081 e153-e156 ///
    /*exponuniv */ h001-h002 h006-h009 h026-h029 h046-h049  ///
    /*exponhs   */ f001-f002 f006-f009
  local varlist13 pid age birthy branch sex area province graduy gradum majorcat major school wt ///
    /*occyear   */ a001-a002 a003 ///
    /*jobtype   */ a004_10-a006_10 a007a_2018-a009_2018 ///
    /*fulljob   */ a021 a022 /// 
    /*job time  */ a116-a118 ///
    /*wage      */ a120-a122 ///
    /*experience*/ d001-d006 e001-e006 e078-e081 e153-e156 ///
    /*exponuniv */ h001-h002 h006-h009 h026-h029 h046-h049  ///
    /*exponhs   */ f001-f002 f006-f009
  local varlist14 pid age birthy branch sex area province graduy gradum majorcat major school wt ///
    /*occyear   */ a001-a002 a003 ///
    /*jobtype   */ a004_10-a006_10 a007a_2018-a009_2018 ///
    /*fulljob   */ a021 a022 /// 
    /*job time  */ a116-a118 ///
    /*wage      */ a120-a122 ///
    /*experience*/ d001-d006 e001-e006 e078-e081 e153-e156 ///
    /*exponuniv */ h001-h002 h006-h009 h026-h029 h046-h049  ///
    /*exponhs   */ f001-f002 f006-f009
  local varlist15 pid age birthy branch sex area province graduy gradum majorcat major school wt ///
    /*occyear   */ a001-a002 a003 ///
    /*jobtype   */ a004_10-a006_10 a007a_2018-a009_2018 ///
    /*fulljob   */ a021 a022 /// 
    /*job time  */ a116-a118 ///
    /*wage      */ a120-a122 ///
    /*experience*/ d001-d006 e001-e006 e078-e081 e153-e156 ///
    /*exponuniv */ h001-h002 h006-h009 h010z h026-h029 h030z h046-h049 h050z ///
    /*exponhs   */ f001-f002 f006-f009
  local varlist16 pid age birthy branch sex area province graduy gradum majorcat major school wt ///
    /*occyear   */ a001-a002 a003 ///
    /*jobtype   */ a004_10-a006_10 a007a_2018-a009_2018 ///
    /*fulljob   */ a021 a022 /// 
    /*job time  */ a116-a118 ///
    /*wage      */ a120-a122 ///
    /*experience*/ d001-d006 e001-e006 e078-e081 e153-e156 ///
    /*exponuniv */ h001-h002 h006-h009 h010z h026-h029 h030z h046-h049 h050z ///
    /*exponhs   */ f001-f002 f006-f009
  local varlist17 pid age birthy branch sex area province graduy gradum majorcat major school wt ///
    /*occyear   */ a001-a002 a003 ///
    /*jobtype   */ a004_10-a006_10 a007a_2018-a009_2018 ///
    /*fulljob   */ a021 a022 /// 
    /*job time  */ a116-a118 ///
    /*wage      */ a120-a122 ///
    /*experience*/ d001-d006 e001-e006 e078-e081 e153-e156 ///
    /*exponuniv */ h001-h002 h006-h009 h010z h026-h029 h030z h046-h049  ///
    /*exponhs   */ f001-f002 f006-f009
  local varlist18 pid age birthy branch sex area province graduy gradum majorcat major school wt ///
    /*occyear   */ a001-a002 a003 ///
    /*jobtype   */ a004_10-a006_10 a007a_2018-a009_2018 ///
    /*fulljob   */ a021 a022 /// 
    /*job time  */ a116-a118 ///
    /*wage      */ a120-a122 ///
    /*experience*/ d001-d006 e001-e006 e078-e081 e153-e156 ///
    /*exponuniv */ h001-h002 h006-h009 h010z h026-h029 h030z h046-h049 h050z ///
    /*exponhs   */ f001-f002 f006-f009
  local varlist19 pid age birthy branch sex area province graduy gradum majorcat major school wt ///
    /*occyear   */ a001-a002 a003 ///
    /*jobtype   */ a004_10-a006_10 a007a_2018-a009_2018 ///
    /*fulljob   */ a021 a022 /// 
    /*job time  */ a116-a118 ///
    /*wage      */ a120-a122 ///
    /*experience*/ d001-d006 e001-e006 e078-e081 e153-e156 ///
    /*exponuniv */ h001-h002 h006-h009 h010z h026-h029 h030z h046-h049 h050z ///
    /*exponhs   */ f001-f002 f006-f009
/*}}}*/
/*년도별 파일을 goms??.dta 로 각각 저장하기{{{*/
  forvalue x = 7/19 {
    local yr : disp %02.0f  = `x'
    use ~/dropbox/GOMS/rawdata/GP`yr'.dta
    di "year == " 2000+`x'
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
    /* 대학정보 및 고교정보 합치기{{{*/
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
        capture drop hscode 
      }
      else {
        gen str hsname = ""
      }
      if `x' == 7 { /*고교관련변수 예외처리*/
        gen f007 = .
        gen f008 = .
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
      if ("`x'" >= "18" ){
        destring unicode?? , replace
      }
    /*}}}*/
    gen year = `x' +2000
      label var year "조사년도"
    gen wave = `x' - 6
      label var wave "조사회차(07==1)"
    mvdecode _all , mv(-1, -3)
    if ("`x'" == "7") {
      save ~/dropbox/goms/goms_master.dta , replace
    }
    else {
      append using ~/dropbox/goms/goms_master.dta
      save ~/dropbox/goms/goms_master.dta , replace
    }
  }
/*}}}*/
label data "GOMS 09-19"
  order _all , alpha
	order pid?? wave year , first
save ~/dropbox/goms/goms_eq_master.dta , replace
save ~/dropbox/sjho/goms_eq_master.dta , replace

