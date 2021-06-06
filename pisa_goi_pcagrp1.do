set more off
set matsize 10000
cd ~/dropbox

tempname temp1 temp2
matrix `temp1' = J(1,5,.)

foreach k in pisa {
forvalue l = 1/7 {
	use `k'w`l' , clear
	levelsof cntcod , local(clist)
foreach j in math scie read{
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
		local subject = 1
	}
	else if ("`k'" == "scie") {
		local subject = 2
	} /*}}}*/
	eopcal pv1`j' [aw=stuwgt] if cntcod == `i' , env(pcagrp1) goi 
	matrix `temp1'[1,1] =  `datatype'
	matrix `temp1'[1,2] = `l'        
	matrix `temp1'[1,3] = `subject'        
	matrix `temp1'[1,4] = r(index)   
	matrix `temp2' = (nullmat(`temp2') \ `temp1' )
}
}
}
} 

matrix colname `temp2' = datatype wave subject index1

svmat `temp2' , names(matcol)
	keep `temp2'*
	rename `temp2'* *
	keep if !missing(index)
	label drop _all
	label var datatype "지수유형"
		label define DATATYPE 1 "PISA" 2 "TIMSS"
		label value datatype DATATYPE
	label var subject "과목"
		label define SUBJECT 1 "Math" 2 "Science" 
		label value subject SUBJECT
	label var index1 "GOI"
save pisa_index1.dta , replace
