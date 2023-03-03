set more off
capture drop unizone
capture drop pr_?
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
  
           단국대학교 |       115      1,168        529          3          2 |     1,817 
           명지대학교 |       816        862          3          3          1 |     1,685 
           중앙대학교 |     1,661        987          2         12          3 |     2,665 
       한국농수산대학 |         0         91          1          1        136 |       229 
       한국체육대학교 |       204         92          0          1          1 |       298 
          
		  단국대학교 |       115      1,168        529          3          2 |     1,817 
           명지대학교 |       816        862          3          3          1 |     1,685 
           중앙대학교 |     1,661        987          2         12          3 |     2,665 
       한국농수산대학 |         0         91          1          1        136 |       229 
       한국체육대학교 |       204         92          0          1          1 |       298 

  
