foreach i in pisa timss {
forvalue j=1/7 {
	use ~/dropbox/`i'w`j' , clear
	levelsof cntcod , local(clist)
	/*Errant Control{{{*/
	if "`i'" == "pisa" & `j' == 1 {
		drop if cntcod == 124 /*Korea Missing schloc Variable*/
		drop if cntcod == 352 /*Korea Missing schloc Variable*/
		drop if cntcod == 604 /*Korea Missing schloc Variable*/
	}
	if "`i'" == "pisa" & `j' == 2 {
		drop if cntcod == 250 /*Korea Missing schloc Variable*/
		drop if cntcod == 344 /*Korea Missing schloc Variable*/
		drop if cntcod == 446 /*Korea Missing schloc Variable*/
	}
	if "`i'" == "pisa" & `j' == 3 {
		drop if cntcod == 250 /*Korea Missing schloc Variable*/
		drop if cntcod == 344 /*Korea Missing schloc Variable*/
	}
	if "`i'" == "pisa" & `j' == 4 {
		drop if cntcod == 250 /*Korea Missing schloc Variable*/
	}
	if "`i'" == "pisa" & `j' == 6 {
		drop if cntcod == 752 /*Korea Missing schloc Variable*/
	}
	if "`i'" == "pisa" & `j' == 7 {
		drop if cntcod == 578 /*Korea Missing schloc Variable*/
		drop if cntcod == 752 /*Korea Missing schloc Variable*/
	}
	if "`i'" == "timss" & `j' == 1 {
		drop if cntcod == 414 /*France Missing schloc Variable*/
	}
	/*}}}*/
	/* Generate PCA Group3{{{*/
	local pcalist schloc posbok posses paredu fambrn
	capture drop pcascr3 pcagrp3 
	local count = 1
	foreach k of local clist {
		pca `pcalist' if cntcod == `k'
			predict temp1`count' if e(sample)
			xtile temp2`count' = temp1`count' , nq(3)
		local ++count
	}
	egen pcascr3 = rowtotal(temp1*) , missing
		label var pcascr3 "PCA Score; Possession, Book, Sch location and Parental Education and Migration "
	egen pcagrp3 = rowtotal(temp2*) , missing
		label var pcagrp3 "PCA Group; Possession, Book, Sch location and Parental Education and Migration "
		capture label drop PCAGRP
		label value pcagrp3 PCAGRP
	drop temp*
	/*}}}*/
	compress
	keep cntcod id* pca*
	merge 1:1 cntcod idschool idstudent using ~/dropbox/`i'w`j' , gen(_pca3) 
	save ~/dropbox/`i'w`j' , replace
}
}
