cd ~/dropbox

tempfile temp

foreach i in pisa timss {
	forvalue j = 1/4 {
		use `i'_pcagrp`j'_eigvec.dta
		if ("`i'" == "pisa" & `j' == 1){
			save `temp' , replace
		}
		else {
			append using `temp'
			save `temp' , replace
		}
	}
}

save pnt_pcaresults.dta , replace
