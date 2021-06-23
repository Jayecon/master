set more off
set matsize 10000
cd ~/dropbox

local grpvar pcagrp2 /*Input for Environment HERE*/

tempname temp1 temp2
tempvar wgt
matrix `temp1' = J(1,6,.)

forvalue k = 1/7 {
	use pisaw`k' , clear
	drop if missing(`grpvar')
	gen `wgt' = round(stuwgt , 1)
	levelsof cntcod , local(clist)
	foreach j in math scie read masc mrsc {
		foreach i of local clist{
			/*subtype {{{*/
			if ("`j'" == "math") {
				local subject = 1
			}
			else if ("`j'" == "scie") {
				local subject = 2
			} 
			else if ("`j'" == "read") {
				local subject = 3
			} 
			else if ("`j'" == "masc") {
				local subject = 4
			} 
			else if ("`j'" == "mrsc") {
				local subject = 5
			} /*}}}*/
			di ""
			di as text " DATA : " as input "PISA" as text " Wave : " as input "`k'" as text " Country : " as input "`i'" as text " Subject : " as input "`j'"
			eopcal pv1`j' posses posbok paredu fambrn [fw=`wgt'] if cntcod == `i' , bjork(mld , 5)/*Index Calculator HERE*/
			matrix `temp1'[1,1] = `k'        
			matrix `temp1'[1,2] = `i'        
			matrix `temp1'[1,3] = `subject'        
			matrix `temp1'[1,4] = r(fg1a)   
			matrix `temp1'[1,5] = r(fg1r)   
			matrix `temp1'[1,6] = r(fg2r)   
			matrix `temp2' = (nullmat(`temp2') \ `temp1' )
		}
	}
}

matrix colname `temp2' = wave cntcod subject index1 index2 index3

svmat `temp2' , names(matcol)
	keep `temp2'*
	rename `temp2'* *
	keep if !missing(index1)
	label drop _all
gen datatype = 1
	label var datatype "지수유형"
		label define DATATYPE 1 "PISA" 2 "TIMSS"
		label value datatype DATATYPE
	label var subject "과목"
		label define SUBJECT 1 "수학" 2 "과학" 3 "읽기" 4 "수과" 5 "읽수과"
		label value subject SUBJECT
	label var index1 "FG1A"
	label var index2 "FG1R"
	label var index3 "FG2A"
save pisa_bj_pcagrp2.dta , replace
