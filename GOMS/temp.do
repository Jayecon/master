cd ~/dropbox/goms

local firstyr = 2000
local lastyr  = 2011

use ~/dropbox/goms/goms.dta if inrange(f001, `firstyr' , `lastyr') & jobcat == 3, clear


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
	export excel using "results/stat_birthy_f001_jobcat3", replace
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
	export excel using "results/stat_f001_p026_jobcat3", replace
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
	export excel using "results/stat_f001_p029_jobcat3", replace
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
	export excel using "results/stat_f001_p034_jobcat3", replace
restore
/*}}}*/

