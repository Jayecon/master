local grplist incgrp edugrp rgngrp pcagrp 

set more off
set matsize 10000
cd ~/dropbox

tempname temp1 temp2
matrix `temp1' = J(1,5,.)

foreach k in pisa {
forvalue l = 1/7 {
	use `k'w`l' , clear
	levelsof country , local(clist)
foreach j in math scie {
foreach i of local clist{
	/*datatype {{{*/
	if ("`k'" == "pisa") {
		local datatype = 1
	}
	else if ("`k'" == "timss") {
		local datatype = 2
	} /*}}}*/
	/*grouptype {{{*/
	if ("`j'" == "mat") {
		local subtype = 1
	}
	else if ("`k'" == "scie") {
		local type = 2
	} /*}}}*/
	eopcal pv1`j' [aw=stuwgt] if country == `i' , env(pcagrp) goi 
	matrix `temp1'[1,1] =  `datatype'
	matrix `temp1'[1,2] = `l'        
	matrix `temp1'[1,3] = `subtype'        
	matrix `temp1'[1,4] = r(index)   
	matrix `temp1'[1,5] = 1     
	matrix `temp2' = (nullmat(`temp2') \ `temp1' )
}
}
}
} 

matrix colname `temp2' = datatype wave subtype index indextype

svmat `temp2' , names(matcol)
	keep `temp2'*
	rename `temp2'* *
	keep if !missing(index)
	label drop _all
	label var datatype "지수유형"
		label define DATATYPE 1 "PISA" 2 "TIMSS"
		label value datatype DATATYPE
	label var subtype "지수유형"
		label define INDEXTYPE 1 "GOI" 2 "RRI"
		label value indextype INDEXTYPE
	label var subtype "과목"
		label define SUBTYPE 1 "Math" 2 "Science" 
		label value scoretype SUBTYPE
save pisa_goi.dta , replace
