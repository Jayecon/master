set more off

cd ~/dropbox/goms

use goms.dta , clear 

gr drop _all

local achlist score5 
/*local env edugrp incgrp rgngrp pcagrp sex f009 majgrp hscgrp*/
local envlist edugrp incgrp rgngrp pcagrp 
 
/*교육불평등 환경별 누적분포*/
foreach k of local envlist {
	foreach j of local achlist {
		forvalue i = 2000/2011 {
			eopcal `j' [aw=wgt] if f001 == `i' , env(`k') cumd gr( name(`k'_cumd_w`i'_`j')  xtitle(`i'년))
			local `k'cumd`j' ``k'cumd`j'' `k'_cumd_w`i'_`j'
		}
	}
}

foreach k of local envlist {
	foreach j of local achlist {
		grc1leg ``k'cumd`j''
			gr save figure/`k'_cumd_`j'.gph , replace
			gr export figure/`k'_cumd_`j'.png , as(png) replace
	}
}

/*소득불평등 환경별 누적분포(if sjob)*/
gr drop _all

/*local env edugrp incgrp rgngrp pcagrp sex f009 majgrp hscgrp*/
local envlist edugrp incgrp rgngrp pcagrp 

foreach k of local envlist {
	forvalue i = 2000/2011 {
		eopcal income [aw=wgt] if f001 == `i' & sjob , env(`k') cumd val(0, 500) gr( name(`k'_cumd_w`i'_income)  xtitle(`i'년))
		local `k'cumdinc ``k'cumdinc' `k'_cumd_w`i'_income
	}
}

foreach k of local envlist {
	grc1leg ``k'cumdinc'
		gr save figure/`k'_cumd_inc_sjob.gph , replace
		gr export figure/`k'_cumd_income_sjob.png , as(png) replace
}

/*소득불평등 환경별 누적분포(jobcat)*/
gr drop _all

/*local env edugrp incgrp rgngrp pcagrp sex f009 majgrp hscgrp*/
local envlist jobcat
foreach k of local envlist {
	forvalue i = 2000/2011 {
		eopcal income [aw=wgt] if f001 == `i' , env(`k') cumd val(0, 500) gr( name(`k'_cumd_w`i'_income)  xtitle(`i'년))
		local `k'cumdinc ``k'cumdinc' `k'_cumd_w`i'_income
	}
}

foreach k of local envlist {
	grc1leg ``k'cumdinc'
		gr save figure/`k'_cumd_income.gph , replace
		gr export figure/`k'_cumd_income.png , as(png) replace
}
