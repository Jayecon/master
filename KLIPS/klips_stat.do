local envlist edugrp jobgrp

cd ~/dropbox/klips
use ~/dropbox/klips/klips.dta , clear

preserve

foreach j of local envlist {
forvalue i = 1998/2020 {
	eopcal incn [aw=wgtp] if head & year == `i' , env(`j') stat
	matrix aaa = r(results)
	svmat aaa , names(matcol)
	keep aaa*
	rename aaa* *
	drop if missing(N)
	gen year = `i'
	if (`i' == 1998) {
		save results/klips_stat_`j'.dta , replace
	}
	else {
		append using results/klips_stat_`j'.dta
		save results/klips_stat_`j'.dta , replace
	}
	restore , preserve
}
}
