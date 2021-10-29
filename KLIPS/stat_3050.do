set more off

local env edugrp

use klips , clear

forvalues x = 1/21 { 
	local yr : disp %02.0f  = `x'
	
	preserve
	keep if hwave`yr' == 1
		
	collapse (count) income = incw`yr' (percent) percent = incw`yr' (mean) mean = incw`yr' (sd) ///
		sd = incw`yr'  [aw=wgt`yr'] if p`yr'0102 == 10 & inrange(p`yr'0107 ,30 ,50) * !missing(`env'), by(`env')
	
	rename `env' envtyp
	gen envgrp = `"`env'"'
	gen wave = `yr'
		
	if `x' == 1 {
		save stat_`env'_3050.dta , replace
		}
	else {
		append using stat_`env'_3050.dta
		save  stat_`env'_3050.dta , replace
		}
	restore
	}


