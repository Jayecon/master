set more off
set matsize 10000
cd ~/dropbox

tempname temp1 temp2
matrix `temp1' = J(1,8,.)

foreach k in pisa timss {
forvalue j = 1/7 {
	if "`k'" == "pisa" {
		local dbname = 1
	}
	else if "`k'" == "timss" {
		local dbname = 2
	}
	use `k'w`j' , clear
	levelsof cntcod , local(clist)
	foreach i of local clist{
		qui count if cntcod == `i' 
			local rn = `r(N)'
		qui count if cntcod == `i' & !missing(pcascr1)
			local rn1 = `r(N)'
		qui count if cntcod == `i' & !missing(pcascr2)
			local rn2 = `r(N)'
		qui count if cntcod == `i' & !missing(pcascr3)
			local rn3 = `r(N)'
		qui count if cntcod == `i' & !missing(pcascr4)
			local rn4 = `r(N)'
		matrix `temp1'[1,1] = `j'        
		matrix `temp1'[1,2] = `i'        
		matrix `temp1'[1,3] = `rn'        
		matrix `temp1'[1,4] = `rn1'        
		matrix `temp1'[1,5] = `rn2'        
		matrix `temp1'[1,6] = `rn3'        
		matrix `temp1'[1,7] = `rn4'        
		matrix `temp1'[1,8] = `dbname'        
		matrix `temp2' = (nullmat(`temp2') \ `temp1' )
		}
	}
}

matrix colname `temp2' = wave cntcod nsample ngrp1 ngrp2 ngrp3 ngrp4 dbname

svmat `temp2' , names(matcol)
	keep `temp2'*
	rename `temp2'* *
	label drop _all
	label var dbname "지수유형"
		label define DBNAME 1 "PISA" 2 "TIMSS"
		label value dbname DBNAME
	gen mis1 = ngrp1/nsample
	gen mis2 = ngrp2/nsample
	gen mis3 = ngrp3/nsample
	gen mis4 = ngrp4/nsample
save pnt_missing.dta , replace
