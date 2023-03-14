set more off
set maxvar 30000
cd ~/dropbox/goms/
use goms_eq, clear
/*일자리경험 계산{{{*/
  capture drop expm?
  gen expm1 = (d004*12 +d005) - (d002*12 +d003) +1 if d001 == 1
    label var expm1 "첫일자리근무(월)"
  gen expm2 = (e005*12 +e006) - (e003*12 +e004) +1 if e001 == 1 & e002 == 1
    label var expm2 "경험일자리1근무(월)"
  gen expm3 = (e080*12 +e081) - (e078*12 +e079) +1 if e001 == 1 & e002 == 2
    label var expm3 "경험일자리2근무(월)"
  gen expm4 = (e155*12 +e156) - (e153*12 +e154) +1 if e001 == 1 & e002 == 3
    label var expm4 "경험일자리3근무(월)"
  gen expm5 = (h008*12 +h009) - (h006*12 +h007) +1 if h001 == 1 & h002 == 1
    label var expm5 "재학일자리1근무(월)"
  gen expm6 = (h028*12 +h029) - (h026*12 +h027) +1 if h001 == 1 & h002 == 2
    label var expm6 "재학일자리2근무(월)"
  gen expm7 = (h048*12 +h049) - (h046*12 +h047) +1 if h001 == 1 & h002 == 3
    label var expm7 "재학일자리3근무(월)"
  forvalue i = 1/7 {
    replace expm`i' = . if expm`i' < 0
  }
/*}}}*/
/*대학별 branch 정리{{{*/
  capture drop unibran 
  capture drop br_* 
  gen unibran = .
  label var unibran "branch(cleaned)"
  label value unibran BRANCH
  tab branch , gen(br_)
  qui levelsof uniname , local(unilist)
  foreach i of local unilist {
    forvalue j = 1/3 {
      sum br_`j' if uniname == "`i'" , meanonly
      if inrange(r(mean) , 0.9 ,1) {
        replace unibran = `j' if uniname == "`i'"
      }
    }
  }
  drop br_?
  /*예외처리*/
    replace unibran = branch if uniname == "가야대학교"
    replace unibran = 3      if uniname == "가야대학교"       & inlist(unibran , 2)
    replace unibran = branch if uniname == "가톨릭대학교"
    replace unibran = 3      if uniname == "가톨릭대학교"     & inlist(unibran , 2)
    replace unibran = branch if uniname == "강릉원주대학교"
    replace unibran = 3      if uniname == "강릉원주대학교"   & inlist(unibran , 2)
    replace unibran = branch if uniname == "강원대학교"
    replace unibran = 3      if uniname == "강원대학교"       & inlist(unibran , 2)
    replace unibran = branch if uniname == "강원대학교"
    replace unibran = 3      if uniname == "강원대학교"       & inlist(unibran , 2)
    replace unibran = branch if uniname == "건국대학교"
    replace unibran = 2      if uniname == "건국대학교"       & inlist(unibran , 3)
    replace unibran = branch if uniname == "건양대학교"
    replace unibran = 3      if uniname == "건양대학교"       & inlist(unibran , 2)
    replace unibran = branch if uniname == "경기대학교"
    replace unibran = 3      if uniname == "경기대학교"       & inlist(unibran , 2)
    replace unibran = branch if uniname == "경동대학교"
    replace unibran = branch if uniname == "경북대학교"
    replace unibran = 3      if uniname == "경북대학교"       & inlist(unibran , 2)
    replace unibran = branch if uniname == "경인교육대학교"
    replace unibran = 3      if uniname == "경인교육대학교"   & inlist(unibran , 2)
    replace unibran = branch if uniname == "경희대학교"
    replace unibran = 2      if uniname == "경희대학교"       & inlist(unibran , 3)
    replace unibran = branch if uniname == "고려대학교"
    replace unibran = 2      if uniname == "고려대학교"       & inlist(unibran , 3)
    replace unibran = branch if uniname == "단국대학교"
    replace unibran = branch if uniname == "대구대학교"
    replace unibran = 3      if uniname == "대구대학교"       & inlist(unibran , 2)
    replace unibran = branch if uniname == "동국대학교"
    replace unibran = 2      if uniname == "동국대학교"       & inlist(unibran , 3)
    replace unibran = branch if uniname == "명지대학교"
    replace unibran = 3      if uniname == "명지대학교"       & inlist(unibran , 2)
    replace unibran = branch if uniname == "부산대학교"
    replace unibran = 3      if uniname == "부산대학교"       & inlist(unibran , 2)
    replace unibran = branch if uniname == "상명대학교"
    replace unibran = branch if uniname == "서남대학교"
    replace unibran = 3      if uniname == "서남대학교"       & inlist(unibran , 2)
    replace unibran = branch if uniname == "성균관대학교"
    replace unibran = 3      if uniname == "성균관대학교"     & inlist(unibran , 2)
    replace unibran = branch if uniname == "신한대학교"
    replace unibran = 3      if uniname == "신한대학교"       & inlist(unibran , 2)
    replace unibran = branch if uniname == "안양대학교"
    replace unibran = 3      if uniname == "안양대학교"       & inlist(unibran , 2)
    replace unibran = branch if uniname == "연세대학교"
    replace unibran = 2      if uniname == "연세대학교"       & inlist(unibran , 3)
    replace unibran = branch if uniname == "영남대학교"
    replace unibran = 3      if uniname == "영남대학교"       & inlist(unibran , 2)
    replace unibran = branch if uniname == "영산대학교"
    replace unibran = 3      if uniname == "영산대학교"       & inlist(unibran , 2)
    replace unibran = branch if uniname == "예원예술대학교"
    replace unibran = 3      if uniname == "예원예술대학교"   & inlist(unibran , 2)
    replace unibran = branch if uniname == "을지대학교"
    replace unibran = 3      if uniname == "을지대학교"       & inlist(unibran , 2)
    replace unibran = branch if uniname == "인제대학교"
    replace unibran = 3      if uniname == "인제대학교"       & inlist(unibran , 2)
    replace unibran = branch if uniname == "인천가톨릭대학교"
    replace unibran = 3      if uniname == "인천가톨릭대학교" & inlist(unibran , 2)
    replace unibran = branch if uniname == "전남대학교"
    replace unibran = 3      if uniname == "전남대학교"       & inlist(unibran , 2)
    replace unibran = branch if uniname == "중앙대학교"
    replace unibran = 3      if uniname == "중앙대학교"       & inlist(unibran , 2)
    replace unibran = branch if uniname == "한국외국어대학교"
    replace unibran = 2      if uniname == "한국외국어대학교" & inlist(unibran , 3)
    replace unibran = branch if uniname == "한양대학교"
    replace unibran = 2      if uniname == "한양대학교"       & inlist(unibran , 3)
    replace unibran = branch if uniname == "홍익대학교"
    replace unibran = 2      if uniname == "홍익대학교"       & inlist(unibran , 3)
/*}}}*/
/*대학별 province 정리{{{*/
  capture drop unizone 
  capture drop pr_* 
  gen unizone = .
  label var unizone "province(cleaned)"
  label value unizone PROVINCE
  tab province , gen(pr_)
  qui levelsof uniname , local(unilist)
  foreach i of local unilist {
    forvalue j = 1/5 {
      sum pr_`j' if uniname == "`i'" , meanonly
      if inrange(r(mean) , 0.8 ,1) {
        replace unizone = `j' if uniname == "`i'"
      }
    }
  }
  drop pr_?
  /*예외처리*/
    replace unizone = province if uniname == "건국대학교"
    replace unibran = 2        if uniname == "건국대학교"       & inlist(unizone,3)
    replace unizone = .        if uniname == "건국대학교"       & inlist(unizone,2,4,5)
    replace unibran = .        if uniname == "건국대학교"       & inlist(unizone,2,4,5)
    replace unizone = province if uniname == "경희대학교"
    replace unibran = 2        if uniname == "경희대학교"       & inlist(unizone,2)
    replace unizone = .        if uniname == "경희대학교"       & inlist(unizone,3,4,5)
    replace unibran = .        if uniname == "경희대학교"       & inlist(unizone,3,4,5)
    replace unizone = province if uniname == "고려대학교"
    replace unibran = 1        if uniname == "고려대학교"       & inlist(unizone,1)
    replace unibran = 2        if uniname == "고려대학교"       & inlist(unizone,3)
    replace unizone = .        if uniname == "고려대학교"       & inlist(unizone,2,4,5)
    replace unibran = .        if uniname == "고려대학교"       & inlist(unizone,2,4,5)
    replace unizone = province if uniname == "단국대학교"
    replace unizone = .        if uniname == "단국대학교"       & inlist(unizone,4,5)
    replace unibran = .        if uniname == "단국대학교"       & inlist(unizone,4,5)
    replace unizone = province if uniname == "동국대학교"
    replace unibran = 2        if uniname == "동국대학교"       & inlist(unizone,4)
    replace unizone = .        if uniname == "동국대학교"       & inlist(unizone,2,3,5)
    replace unibran = .        if uniname == "동국대학교"       & inlist(unizone,2,3,5)
    replace unizone = province if uniname == "명지대학교"
    replace unibran = 1        if uniname == "명지대학교"       & inlist(unizone,2)
    replace unizone = .        if uniname == "명지대학교"       & inlist(unizone,3,4,5)
    replace unibran = .        if uniname == "명지대학교"       & inlist(unizone,3,4,5)
    replace unizone = province if uniname == "상명대학교"
    replace unizone = .        if uniname == "상명대학교"       & inlist(unizone,2,4,5)
    replace unibran = .        if uniname == "상명대학교"       & inlist(unizone,2,4,5)
    replace unizone = province if uniname == "연세대학교"
    replace unibran = 2        if uniname == "연세대학교"       & inlist(unizone,2)
    replace unizone = .        if uniname == "연세대학교"       & inlist(unizone,3,4,5)
    replace unibran = .        if uniname == "연세대학교"       & inlist(unizone,3,4,5)
    replace unizone = province if uniname == "중앙대학교"
    replace unizone = .        if uniname == "중앙대학교"       & inlist(unizone,3,4,5)
    replace unibran = .        if uniname == "중앙대학교"       & inlist(unizone,3,4,5)
    replace unizone = province if uniname == "한국농수산대학교"
    replace unizone = .        if uniname == "한국농수산대학교" & inlist(unizone,3,4)
    replace unibran = .        if uniname == "한국농수산대학교" & inlist(unizone,3,4)
    replace unizone = province if uniname == "한국외국어대학교"
    replace unibran = 2        if uniname == "한국외국어대학교" & inlist(unizone,2)
    replace unizone = .        if uniname == "한국외국어대학교" & inlist(unizone,3,4,5)
    replace unibran = .        if uniname == "한국외국어대학교" & inlist(unizone,3,4,5)
    replace unizone = province if uniname == "한국체육대학교"
    replace unizone = .        if uniname == "한국체육대학교"   & inlist(unizone,3,4,5)
    replace unibran = .        if uniname == "한국체육대학교"   & inlist(unizone,3,4,5)
    replace unizone = province if uniname == "한양대학교"
    replace unibran = 1        if uniname == "한양대학교"       & inlist(unizone,1)
    replace unibran = 2        if uniname == "한양대학교"       & inlist(unizone,2)
    replace unizone = .        if uniname == "한양대학교"       & inlist(unizone,3,4,5)
    replace unibran = .        if uniname == "한양대학교"       & inlist(unizone,3,4,5)
    replace unizone = province if uniname == "홍익대학교"
    replace unibran = 1        if uniname == "홍익대학교"       & inlist(unizone,1)
    replace unibran = 2        if uniname == "홍익대학교"       & inlist(unizone,3)
    replace unizone = .        if uniname == "홍익대학교"       & inlist(unizone,2,4,5)
    replace unibran = .        if uniname == "홍익대학교"       & inlist(unizone,2,4,5)
    replace unizone = province if uniname == "한국농수산대학"
    replace unizone = .        if uniname == "한국농수산대학"   & inlist(unizone,1,3,4)
    replace unibran = .        if uniname == "한국농수산대학"   & inlist(unizone,1,3,4)
/*}}}*/
/*대학별 area 정리{{{*/
  capture drop uniarea
  capture drop ar_*
  gen uniarea = .
  label var uniarea "area(cleaed)"
  label value uniarea AREA
  tab area , gen(ar_)
  qui levelsof uniname , local(unilist)
  foreach i of local unilist {
    forvalue j = 1/17 {
      sum ar_`j' if uniname == "`i'" , meanonly
      if inrange(r(mean) , 0.8 ,1) {
        replace uniarea = `j' if uniname == "`i'"
      }
    }
  }
  levelsof uniname if missing(uniarea), local(unilist)
  foreach i of local unilist {
	replace uniarea = area if uniname == "`i'"
    forvalue j = 1/17 {
      sum ar_`j' if uniname == "`i'" ,
      if r(mean) <= 0.01  {
        replace uniarea = . if uniname == "`i'" & area == `j'
      }
    }
  }
  drop ar_*
/*}}}*/
replace unizone = . if missing(uniarea)
replace unibran = . if missing(uniarea)
save goms_eq.dta , replace
save ~/dropbox/sjho/goms_eq.dta , replace
