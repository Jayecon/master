set more off

local env jobgrp

use klips , clear

forvalues x = 1/21 { 
	local yr : disp %02.0f  = `x'
	
	preserve
	keep if hwave`yr' == 1
		
	collapse (count) income = incw`yr' (percent) percent = incw`yr' (mean) mean = incw`yr' (sd) ///
		sd = incw`yr'  [aw=wgt`yr'] if p`yr'0102 == 10 & !missing(`env'), by(`env')
	
	rename `env' envtyp
	gen envgrp = `"`env'"'
	gen wave = `yr'
		
	if `x' == 1 {
		save stat_`env'.dta , replace
		}
	else {
		append using stat_`env'.dta
		save  stat_`env'.dta , replace
		}
	restore
	}


