set more off
set maxvar 30000
clear
local path ~/dropbox/data/
/* 년도별 추출변수 목록 {{{*/
  local varlist00 pid age birthy sex area province graduy gradum majorcat major school wt ///
    /*occyear   */ a001-a002 a003 ///
    /*jobtype   */ a004_10-a006_10 a007a_2018-a009_2018 ///
    /*jobsize   */ a010 a011 ///
    /*jobinfo   */ a012 a014 a020 ///
    /*fulljob   */ a021 a022 ///
    /*conthur   */ a023 a024 ///
    /*job time  */ a116-a118 ///
    /*wage      */ a120-a122 ///
    /*experience*/ d001-d006 d110-d112 e001-e006 e078-e081 e153-e156 ///
    /*exponhs   */ f001-f002 f006-f009 ///
    /*GPA       */ f073-f074 ///
    /*service   */ p045 ///
    /*family income  */ p034 p035 ///
    /*eq 2nd rv */ l001 l003 m001 m002 ///
    /*job edu mismatch */ a142-a144 ///
    /*enterance*/ f010-f012
  local varlist07 ///
    /*exponuniv */ h001-h002 h006-h009 h026-h029 h046-h049 ///
    /*4sure     */ a157-a165
  local varlist08 branch ///
    /*exponuniv */ h001-h002 h010z h030z h050z ///
    /*4sure     */ a157-a165 ///
    /*eq 2nd rv */ f036-f041 l016 l042 l068
  local varlist09 branch ///
    /*exponuniv */ h001-h002 h010z h030z h050z ///
    /*4sure     */ a157-a165 ///
    /*eq 2nd rv */ f036-f041 l016 l042 l068
  local varlist10 branch ///
    /*exponuniv */ h001-h002 h010z h030z h050z ///
    /*4sure     */ a157-a165 ///
    /*eq 2nd rv */ f036-f041 l016 l042 l068 l018 l044 l070 l022 l048 l074 l030 l056 l082
  local varlist11 branch ///
    /*exponuniv */ h001-h002 h006-h009 h026-h029 h046-h049  ///
    /*4sure     */ a158-a165 ///
    /*eq 2nd rv */ f036-f041 l016 l042 l068 l018 l044 l070 l022 l048 l074 l030 l056 l082
  local varlist12 branch ///
    /*exponuniv */ h001-h002 h006-h009 h026-h029 h046-h049  ///
    /*4sure     */ a158-a165 ///
    /*eq 2nd rv */ f036-f041 l016 l042 l068 l018 l044 l070 l022 l048 l074 l030 l056 l082
  local varlist13 branch ///
    /*exponuniv */ h001-h002 h006-h009 h026-h029 h046-h049  ///
    /*4sure     */ a158-a165 ///
    /*eq 2nd rv */ f036-f041 l016 l042 l068 l018 l044 l070 l022 l048 l074 l030 l056 l082
  local varlist14 branch ///
    /*exponuniv */ h001-h002 h006-h009 h026-h029 h046-h049  ///
    /*4sure     */ a158-a165 ///
    /*eq 2nd rv */ f036-f041 l016 l042 l068 l018 l044 l070 l022 l048 l074 l030 l056 l082
  local varlist15 branch ///
    /*exponuniv */ h001-h002 h006-h009 h010z h026-h029 h030z h046-h049 h050z ///
    /*4sure     */ a158-a165 ///
    /*eq 2nd rv */ f036-f041 l016 l042 l068 l018 l044 l070 l022 l048 l074 l030 l056 l082
  local varlist16 branch ///
    /*exponuniv */ h001-h002 h006-h009 h010z h026-h029 h030z h046-h049 h050z ///
    /*4sure     */ a158-a165 ///
    /*eq 2nd rv */ f036-f041 l016 l042 l068 l018 l044 l070 l022 l048 l074 l030 l056 l082
  local varlist17 branch ///
    /*exponuniv */ h001-h002 h006-h009 h010z h026-h029 h030z h046-h049  ///
    /*4sure     */ a158-a165 ///
    /*eq 2nd rv */ f036-f041 l016 l042 l068 l018 l044 l070 l022 l048 l074 l030 l056 l082
  local varlist18 branch ///
    /*exponuniv */ h001-h002 h006-h009 h010z h026-h029 h030z h046-h049 h050z ///
    /*4sure     */ a158-a165 ///
    /*eq 2nd rv */ f036-f041 l016 l042 l068 l018 l044 l070 l022 l048 l074 l030 l056 l082
  local varlist19 branch ///
    /*exponuniv */ h001-h002 h006-h009 h010z h026-h029 h030z h046-h049 h050z ///
    /*4sure     */ a158-a165 ///
    /*eq 2nd rv */ f036-f041 l016 l042 l068 l018 l044 l070 l022 l048 l074 l030 l056 l082
/*}}}*/
/*년도별 파일을 goms??.dta 로 각각 저장하기{{{*/
  forvalue x = 7/19 {
    local yr : disp %02.0f  = `x'
    use `path'GOMS/rawdata/GP`yr'.dta
    rename g`yr'1* *
    drop if missing(sex)
    keep `varlist`yr'' `varlist00'
    rename * *`yr'
    /* 예외처리 {{{*/
        if ("`x'" == "7") {
            tostring major07, replace force
            gen f00707 = .
            gen f00807 = .
        }
        if ("`x'" == "9" ){
            recode l00109 (1/2=1) (3=2)
        }
        if ("`x'" == "10" ){
            recode l00110 (1/2=1) (3=2)
        }
        if ("`x'" == "15" ){
            destring school15 , replace force
        }
        if ("`x'" == "18" ){
            destring m00218 l01618 l04218 l06818, replace
            mvdecode l01618 l04218 l06818 , mv(-1 , 99999)
        }
        if ("`x'" == "19" ){
            destring l01619 l04219 l06819, replace
            mvdecode l01619 l04219 l06819 , mv(-1 , 99999)
        }
    /*}}}*/
    gen year = `x' +2000
      label var year "조사년도"
    gen wave = `x' - 6
      label var wave "조사회차(07==1)"
    mvdecode _all , mv(-1, -3)
    if ("`x'" == "7") {
      save `path'goms/goms_master.dta , replace
    }
    else {
      append using `path'goms/goms_master.dta
      save `path'goms/goms_master.dta , replace
    }
  }
/*}}}*/
label data "GOMS 09-19"
  order _all , alpha
  order pid?? wave year , first
save `path'goms/goms_eq_raw.dta , replace
