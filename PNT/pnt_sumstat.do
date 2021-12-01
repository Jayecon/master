cd ~/dropbox

tempfile temp1 temp2 temp3 temp4

local dblist pisa timss

foreach i of local dblist {
	forvalue j = 1/7 {
		use `i'/`i'w`j' , clear 
		local dataf = substr("`i'",1,1)
		gen one = 1
		collapse	(count) obs`dataf'=one (count) sample`dataf'=pcagrp1	///
					(mean) mmath`dataf'o=pv1math (sd) smath`dataf'o=pv1math	///
					(mean) mscie`dataf'o=pv1scie (sd) sscie`dataf'o=pv1scie	///
					[aw=stuwgt] , by(cntcod)
		if "`i'" == "pisa" {
			gen year = `j'*3 + 1997
		capture append using `temp1'
		save `temp1' , replace
		}
		else if "`i'" == "timss" {
			gen year = `j'*4 + 1991
		capture append using `temp2'
		save `temp2' , replace
		}
	}
}

foreach i of local dblist {
	forvalue j = 1/7 {
		use `i'/`i'w`j' , clear 
		local dataf = substr("`i'",1,1)
		gen one = 1
    qui reg pv1math posses posbok paredu 
    gen sample = e(sample)
    keep if sample
		collapse	(mean) mmath`dataf's=pv1math (sd) smath`dataf's=pv1math	///
					(mean) mscie`dataf's=pv1scie (sd) sscie`dataf's=pv1scie	///
					[aw=stuwgt] , by(cntcod)
		if "`i'" == "pisa" {
			gen year = `j'*3 + 1997
		capture append using `temp3'
		save `temp3' , replace
		}
		else if "`i'" == "timss" {
			gen year = `j'*4 + 1991
		capture append using `temp4'
		save `temp4' , replace
		}
	}
}

use `temp1' , clear
merge 1:1 cntcod year using `temp2' , nogen
merge 1:1 cntcod year using `temp3' , nogen
merge 1:1 cntcod year using `temp4' , nogen
merge m:1 cntcod using ~/dropbox/Data_extras/countrycode_1.dta , nogen

save pnt/pnt_sumstat , replace

