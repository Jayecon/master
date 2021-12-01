local test rri(percent,20)
local grp pcagrp3050
local age 3050
local cond & h3050

set more off
set matsize 10000

use ~/dropbox/klips/klips , clear

tempname temp1 temp2
matrix `temp1' = J(1,4,.)

forvalue i = 1/22 {
	eopcal incn1m [aw=wgt2p] if wave == `i' `cond' , env(`grp') `test' b(2)
	matrix `temp1'[1,1] = `i'
	matrix `temp1'[1,2] = r(index)
	matrix `temp1'[1,3] = r(l95)
	matrix `temp1'[1,4] = r(u95)
	matrix `temp2' = (nullmat(`temp2') \ `temp1' )
}
matrix colname `temp2' = wave index lci95 uci95

svmat `temp2' , names(matcol)
	keep `temp2'*
	rename `temp2'* *
	keep if !missing(wave)

save ~/dropbox/klips/results/rri_`grp'_`age' , replace
