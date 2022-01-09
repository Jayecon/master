local test rri(percent,20)
local grp edugrp
local age all
local cond & head

set more off
set matsize 10000

use ~/dropbox/klips/klips , clear

tempname temp1 temp2
matrix `temp1' = J(1,9,.)

forvalue i = 1/23 {
	eopcal incn1m [aw=wgt2p] if wave == `i' `cond' , env(`grp') `test' b(1)
	matrix `temp1'[1,1] = `i'
	matrix `temp1'[1,2] = r(index)
	matrix `temp1'[1,3] = r(sd)
	matrix `temp1'[1,4] = r(l95)
	matrix `temp1'[1,5] = r(u95)
	matrix `temp1'[1,6] = r(l90)
	matrix `temp1'[1,7] = r(u90)
	matrix `temp1'[1,8] = r(l99)
	matrix `temp1'[1,9] = r(u99)
	matrix `temp2' = (nullmat(`temp2') \ `temp1' )
}
matrix colname `temp2' = wave index sd lc95 uc95 lc90 uc90 lc99 uc99

svmat `temp2' , names(matcol)
	keep `temp2'*
	rename `temp2'* *
	keep if !missing(wave)

save ~/dropbox/klips/results/rri_`grp'_`age' , replace
