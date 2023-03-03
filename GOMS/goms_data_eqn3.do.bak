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
/*대학별 지역 정리{{{*/
  gen unizone = .
  label var unizone "대학소재지역(정리)"
  label value unizone PROVINCE
  tab province , gen(pr_)
  qui levelsof uniname , local(unilist)
  foreach i of local unilist {
    forvalue j = 1/5 {
      sum pr_`j' if uniname == "`i'" , meanonly
      if r(mean) >= 0.8 {
        replace unizone = `j' if uniname == "`i'"
      }
    }
  }
  qui levelsof uniname if missing(unizone), local(unilist)
  foreach i of local unilist {
    forvalue j = 1/5 {
	  sum pr_`j' if uniname == "`i'" & missing(unizone) & inlist(branch ,1 ,3) , meanonly
      if r(mean) >= 0.8 {
        replace unizone = `j' if uniname == "`i'"
      }  
    }
  }
  local unilist 단국대학교  명지대학교  중앙대학교  한국농수산대학  한국체육대학교  

  drop pr_?

  replace unizone = province if uniname == "단국대학교" 
  replace unizone = . if uniname == "단국대학교"     & inlist(unizone , 4 , 5 )
  replace unizone = province if uniname == "명지대학교"
  replace unizone = . if uniname == "명지대학교"     & inlist(unizone , 3 , 4, 5)
  replace unizone = province if uniname == "중앙대학교" 
  replace unizone = . if uniname == "중앙대학교"     & inlist(unizone , 3 , 4, 5)
  replace unizone = province if uniname == "한국농수산대학" 
  replace unizone = . if uniname == "한국농수산대학" & inlist(unizone , 1 , 3 , 4)
  replace unizone = province if uniname == "한국체육대학교" 
  replace unizone = . if uniname == "한국체육대학교" & inlist(unizone , 3 , 4, 5)
/*}}}*/
save goms_eq.dta , replace
save ~/dropbox/sjho/goms_eq.dta , replace
