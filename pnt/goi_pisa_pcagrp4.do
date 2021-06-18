set more off
set matsize 10000
cd ~/dropbox

local grpvar pcagrp4 /*Input for Environment HERE*/

tempname temp1 temp2
matrix `temp1' = J(1,4,.)

forvalue k = 1/7 {
	use pisaw`k' , clear
	drop if missing(`grpvar')
	levelsof cntcod , local(clist)
	foreach j in math scie read{
		foreach i of local clist{
			/*grouptype {{{*/
			if ("`j'" == "math") {
				local subject = 1
			}
			else if ("`j'" == "scie") {
				local subject = 2
			} 
			else if ("`j'" == "read") {
				local subject = 3
			} /*}}}*/
			di ""
			di as text " DATA : " as input "PISA" as text " Wave : " as input "`k'" as text " Country : " as input "`i'" as text " Subject : " as input "`j'"
			eopcal pv1`j' [aw=stuwgt] if cntcod == `i' , env(`grpvar') goi /*Index Calculator HERE*/
			matrix `temp1'[1,1] = `k'        
			matrix `temp1'[1,2] = `i'        
			matrix `temp1'[1,3] = `subject'        
			matrix `temp1'[1,4] = r(index)   
			matrix `temp2' = (nullmat(`temp2') \ `temp1' )
		}
	}
}

matrix colname `temp2' = wave cntcod subject index

svmat `temp2' , names(matcol)
	keep `temp2'*
	rename `temp2'* *
	keep if !missing(index)
	label drop _all
gen datatype = 1
	label var datatype "지수유형"
		label define DATATYPE 1 "PISA" 2 "TIMSS"
		label value datatype DATATYPE
	label var subject "과목"
		label define SUBJECT 1 "수학" 2 "과학" 3 "읽기"
		label value subject SUBJECT
	label var index "GOI"
save pisa_goi_pcagrp4.dta , replace
