set more off

foreach i in edu job {
	foreach j in goi rri {
		foreach k in all 2545 3050 {
			use weighted_`i'grp_`j'_`k'.dta , clear
			if "`k'" == "all" {
				capture drop ages
				gen ages = 1
				}
			else if "`k'" == "2545" {
				capture drop ages
				gen ages = 2
				}
			else {
				capture drop ages
				gen ages = 3
				}
			save , replace
			}
		}
	}

foreach i in edu job {
	foreach j in goi rri {
		foreach k in all 2545 3050 {
			if "`k'" == "all" {
				use weighted_`i'grp_`j'_`k'.dta , replace
				label define v_ages 1 "전연령" 2 "25-45" 3 "30-50"
				label value ages v_ages
				save weighted_`i'grp_`j'.dta , replace
				}
			else if "`k'" == "2545" {
				append using weighted_`i'grp_`j'_`k'.dta
				label value ages v_ages
				save weighted_`i'grp_`j'.dta , replace
				}
			else {
				append using weighted_`i'grp_`j'_`k'.dta
				rename idxmean `j'
				gen group = "`i'grp"
				label value ages v_ages
				save weighted_`i'grp_`j'.dta , replace
				}
			}
		
		}
	}
	

*forvalues x = 1/19 { 
*	local yr : disp %02.0f  = `x'
*	local y2 : disp %02.0f  = `x'+1
	


