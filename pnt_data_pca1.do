/*PCA Score; Possession, Book and Parental Education*/
foreach i in pisa timss {
forvalue j=1/7 {
	use ~/dropbox/`i'w`j' , clear
	levelsof cntcod , local(clist)
	/* Generate PCA Group1{{{*/
	local pcalist posbok posses paredu 
	capture drop pcascr1 pcagrp1 
	local count = 1
	foreach k of local clist {
		pca `pcalist' if cntcod == `k'
			predict temp1`count' if e(sample)
			xtile temp2`count' = temp1`count' , nq(3)
		local ++count
	}
	egen pcascr1 = rowtotal(temp1*) , missing
		label var pcascr1 "PCA Score; Possession, Book and Parental Education"
	egen pcagrp1 = rowtotal(temp2*) , missing
		label var pcagrp1 "PCA Group; Possession, Book and Parental Education"
		capture label drop PCAGRP
		label define PCAGRP 1 "Low Env." 2 "Mid Env." 3 "high Env."
		label value pcagrp1 PCAGRP
	drop temp*
	/*}}}*/
	compress
	save ~/dropbox/`i'w`j' , replace
}
}
