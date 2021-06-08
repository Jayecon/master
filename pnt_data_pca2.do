 /*PCA Score; Possession, Book, and Parental Education and Migration */
foreach i in pisa timss {
forvalue j=1/7 {
	use ~/dropbox/`i'w`j' , clear
	capture drop _pca2
	save , replace
	/*Errant Control{{{*/
	if "`i'" == "pisa" & `j' == 1 {
		drop if cntcod == 410 /*Korea Missing BRN Variables*/
	}
	if "`i'" == "timss" & `j' == 1 {
		drop if cntcod == 250 /*France Missing BRN Variables*/
	}
	if "`i'" == "timss" & `j' == 4 {
		drop if cntcod == 12 /*Algeria Missing BRN Variables*/
	}
	/*}}}*/
	/* Generate PCA Group2{{{*/
	local pcalist posbok posses paredu fambrn
	capture drop pcascr2 pcagrp2 
	local count = 1
	levelsof cntcod , local(clist)
	foreach k of local clist {
	di ""
	di as text " DATA : " as input "`i'" as text " Wave : " as input "`j'" as text " Cntcod : " as input "`k'"
		pca `pcalist' if cntcod == `k'
			predict temp1`count' if e(sample)
			xtile temp2`count' = temp1`count' , nq(3)
		local ++count
	}
	egen pcascr2 = rowtotal(temp1*) , missing
		label var pcascr2 "PCA Score; Possession, Book, and Parental Education and Migration "
	egen pcagrp2 = rowtotal(temp2*) , missing
		label var pcagrp2 "PCA Group; Possession, Book, and Parental Education and Migration "
		capture label drop PCAGRP
		label value pcagrp2 PCAGRP
	drop temp*
	/*}}}*/
	compress
	keep cntcod id* pca*
	merge 1:1 cntcod idschool idstudent using ~/dropbox/`i'w`j' , gen(_pca2) 
	save , replace
}
}
