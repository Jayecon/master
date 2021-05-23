cd ~/dropbox/goms

local firstyr = 2000
local lastyr  = 2011

use ~/dropbox/goms/goms.dta if inrange(f001, `firstyr' , `lastyr') , clear

/*출생년, 고교졸업년, 대학입학년 히스토그램 {{{*/
/*hist birthy if inrange(birthy , 1979 , 1996 ), freq ylabel(,format(%6.0f)) saving(figure/birthy ,replace) by(sex, total compact)*/
/*hist f001 if inrange(f001 , 1997 , 2014 ), freq ylabel(,format(%6.0f)) saving(figure/f001 ,replace) by(sex, total compact)*/
/*hist f011 if inrange(f011 , 1998 , 2015 ), freq ylabel(,format(%6.0f)) saving(figure/f011 ,replace) by(sex, total compact)*/
/*}}}*/

/* 출생년별 고교졸업자 수 {{{*/
tab birthy f001 , matcell(data) matrow(datarow) matcol(datacol)
	tempname mtx mtx1 mtx2
	matrix `mtx1' = (datacol \ data)
	matrix `mtx2' = (9999 \ datarow)
	matrix `mtx' = ( `mtx2' , `mtx1' )
preserve
	svmat `mtx'
	keep `mtx'*
	keep if !missing(`mtx'1)
	export excel using "results/stat_birthy_f001", replace
restore
/*}}}*/
/* 고졸년별 부친학력  {{{*/
tab f001 p026 , matcell(data) matrow(datarow) matcol(datacol)
	tempname mtx mtx1 mtx2
	matrix `mtx1' = (datacol \ data)
	matrix `mtx2' = (9999 \ datarow)
	matrix `mtx' = ( `mtx2' , `mtx1' )
preserve
	svmat `mtx'
	keep `mtx'*
	keep if !missing(`mtx'1)
	export excel using "results/stat_f001_p026", replace
restore
/*}}}*/
/* 고졸년별 모친학력  {{{*/
tab f001 p029 , matcell(data) matrow(datarow) matcol(datacol)
	tempname mtx mtx1 mtx2
	matrix `mtx1' = (datacol \ data)
	matrix `mtx2' = (9999 \ datarow)
	matrix `mtx' = ( `mtx2' , `mtx1' )
preserve
	svmat `mtx'
	keep `mtx'*
	keep if !missing(`mtx'1)
	export excel using "results/stat_f001_p029", replace
restore
/*}}}*/
/* 고졸년별 가계소득  {{{*/
tab f001 p034 , matcell(data) matrow(datarow) matcol(datacol)
	tempname mtx mtx1 mtx2
	matrix `mtx1' = (datacol \ data)
	matrix `mtx2' = (9999 \ datarow)
	matrix `mtx' = ( `mtx2' , `mtx1' )
preserve
	svmat `mtx'
	keep `mtx'*
	keep if !missing(`mtx'1)
	export excel using "results/stat_f001_p034", replace
restore
/*}}}*/

/*기초통계량 생성{{{*/
tempname mtx
preserve

local grplist incgrp edugrp rgngrp pcagrp 
local achvlist score5 income

foreach j of local achvlist {
foreach k of local grplist {
	forvalue i = `firstyr'/`lastyr' {
		local temp : value label `k'
		eopcal `j' [aw=wgt] if f001 == `i' , env(`k') stat
		matrix `mtx' = r(results)
		svmat `mtx' , names(matcol)
		keep `mtx'*
		rename `mtx'* *
		drop if missing(N)
		label value Group `temp'
		gen year = `i'
		if (`i' == `firstyr') {
			save results/stat_`j'_`k' , replace
		}
		else {
			append using results/stat_`j'_`k'
			save results/stat_`j'_`k' , replace
		}
		restore , preserve
	}
}
}
/*}}}*/
/*기초통계량 생성 sjob{{{*/
tempname mtx
capture preserve

local grplist incgrp edugrp rgngrp pcagrp 
local achvlist score5 income

foreach j of local achvlist {
foreach k of local grplist {
	forvalue i = `firstyr'/`lastyr' {
		local temp : value label `k'
		eopcal `j' [aw=wgt] if f001 == `i' & sjob , env(`k') stat
		matrix `mtx' = r(results)
		svmat `mtx' , names(matcol)
		keep `mtx'*
		rename `mtx'* *
		drop if missing(N)
		label value Group `temp'
		gen year = `i'
		if (`i' == `firstyr') {
			save results/stat_`j'_`k'_sjob , replace
		}
		else {
			append using results/stat_`j'_`k'_sjob
			save results/stat_`j'_`k'_sjob , replace
		}
		restore , preserve
	}
}
}
/*}}}*/
/*기초통계량 생성 jobcat{{{*/
tempname mtx
capture preserve

local grplist jobcat
local achvlist score5 income p026 p029 p034

foreach j of local achvlist {
foreach k of local grplist {
	forvalue i = `firstyr'/`lastyr' {
		local temp : value label `k'
		eopcal `j' [aw=wgt] if f001 == `i' , env(`k') stat
		matrix `mtx' = r(results)
		svmat `mtx' , names(matcol)
		keep `mtx'*
		rename `mtx'* *
		drop if missing(N)
		label value Group `temp'
		gen year = `i'
		if (`i' == `firstyr') {
			save results/stat_`j'_`k'_jobcat , replace
		}
		else {
			append using results/stat_`j'_`k'_jobcat
			save results/stat_`j'_`k'_jobcat , replace
		}
		restore , preserve
	}
}
}
/*}}}*/
