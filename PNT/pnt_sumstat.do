cd ~/dropbox

tempfile temp1 temp2

local dblist pisa timss

foreach i of local dblist {
	forvalue j = 1/7 {
		use `i'/`i'w`j' , clear 
		local dataf = substr("`i'",1,1)
		gen one = 1
		collapse	(count) obs`dataf'=one (count) sample`dataf'=pcagrp2	///
					(mean) mathm`dataf'=pv1math (sd) smath`dataf'=pv1math	///
					(mean) mscie`dataf'=pv1scie (sd) sscie`dataf'=pv1scie	///
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

use `temp1' , clear
merge 1:1 cntcod year using `temp2'
drop _merge

save pnt/pnt_sumstat , replace
