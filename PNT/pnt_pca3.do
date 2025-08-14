/*PCA Group; Possession, Book and Parental Education*/
set more off

tempname temp1 temp2 temp3
matrix `temp2' = J(1,2,.)
capture label define DATATYPE 1 "PISA" 2 "TIMSS"
capture label define PCAGRP 1 "Low Env." 2 "Mid Env." 3 "high Env."

foreach i in pisa timss {
	/*datatype {{{*/
	if ("`i'" == "pisa") {
		local datatype = 1
	}
	else if ("`i'" == "timss") {
		local datatype = 2
	} /*}}}*/
	forvalue j=1/7 {
		use ~/dropbox/`i'/`i'w`j' , clear
		levelsof cntcod , local(clist)
		local pcalist posbok posses paredu stusex
		/* Generate PCA Group1{{{*/
		capture drop pcascr3 pcagrp3 
		local count = 1
		foreach k of local clist {
			di ""
			di as text " DATA : " as input "`i'" as text " Wave : " as input "`j'" as text " Cntcod : " as input "`k'"
			pca `pcalist' if cntcod == `k'
				matrix `temp1' = e(L)
				predict temp1`count' if e(sample)
				xtile temp2`count' = temp1`count' , nq(3)
				matrix `temp1' = `temp1'[1...,1]
				matrix `temp1' = `temp1''
			matrix `temp2'[1,1] = `j'        
			matrix `temp2'[1,2] = `k'        
			matrix `temp1' = `temp1',`temp2'
			matrix `temp3' = (nullmat(`temp3') \ `temp1' )
			local ++count
		}
		egen pcascr3 = rowtotal(temp1*) , missing
			label var pcascr3 "PCA Score; Possession, Book Parental Education and Sex"
		egen pcagrp3 = rowtotal(temp2*) , missing
			label var pcagrp3 "PCA Score; Possession, Book Parental Education and Sex"
			capture label drop PCAGRP
			label value pcagrp3 PCAGRP
		drop temp*
		/*}}}*/
		compress
		save ~/dropbox/`i'w`j' , replace
	}
	/*save eigenvector data{{{*/
	matrix colname `temp3' = `pcalist' wave cntcod 
	svmat `temp3' , names(matcol)
		keep `temp3'*
		rename `temp3'* *
		keep if !missing(posbok)
		label drop _all
	gen datatype = `datatype'
		label var datatype "지수유형"	
		label value datatype DATATYPE
	/*}}}*/
	save ~/dropbox/`i'/`i'_pcagrp3_eigvec.dta , replace
}
