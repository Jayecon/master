foreach i in pisa timss {
forvalue j=1/7 {
	use ~/dropbox/`i'r`j' , clear
	/*Excpetion Control{{{*/
	/*Drop Error Counrtries{{{*/
	if "`i'" == "pisa" & `j' == 1 {
		drop if cntcod == 438 /*Small Size : Liechtenstein*/
	}
	if "`i'" == "pisa" & `j' == 4 {
		drop if cntcod == 438 /*Small Size : Liechtenstein*/
	}
	if "`i'" == "pisa" & `j' == 5 {
		drop if cntcod == 438 /*Small Size : Liechtenstein*/
	}
	if "`i'" == "pisa" & `j' == 6 {
		drop if cntcod == 8 /*No parental education : Albania*/
	}
	if "`i'" == "timss" & `j' == 4 {
		drop if cntcod == 926 /*No parental education : Kosovo*/
		drop if cntcod == 927 /*No parental education : Kosovo*/
	}
	/*}}}*/
	levelsof cntcod , local(clist)
	/*}}}*/
	/*Rename Variables {{{*/
	if "`i'" == "timss" {
		rename totwgt stuwgt
		rename comsiz schloc
	}
	/*}}}*/
	/* Cleaning Dummy Variables {{{*/
	captur label drop YN
	label define YN 1 "Yes" 0 "No"
	qui lookfor pos
	local plist r(varlist)
	foreach k of local plist {
		local postest strpos("`k'" , "pos")
		if `postest' {
			qui inspect `k'
			local length = r(N_unique) 
			sum `k' , meanonly
			local min = r(min)
			local max = r(max)
			if `length' == 2 & `min' == 1 & `max' == 2 {
				recode `k' 2 = 0 
				label value `k' YN
			}
		}
	}
	/*}}}*/
	/*Generate Possession Variables{{{*/
	capture drop posses 
	local plist_pisa_1 posdsk poscom posnet posdic 
	local plist_pisa_2 posdsk poscom posnet posdic 
	local plist_pisa_3 posdsk poscom posnet posdic 
	local plist_pisa_4 posdsk poscom posnet posdic 
	local plist_pisa_5 posdsk poscom posnet posdic 
	local plist_pisa_6 posdsk poscom posnet posdic 
	local plist_pisa_7 posdsk poscom posnet posdic 
	local plist_timss_1 posdsk poscom poscal posdic 
	local plist_timss_2 posdsk poscom poscal posdic 
	local plist_timss_3 posdsk poscom poscal posdic 
	local plist_timss_4 posdsk poscom posnet posdic 
	local plist_timss_5 posdsk poscom posnet posrom 
	local plist_timss_6 posdsk poscto posnet posrom
	local plist_timss_7 posdsk poscto posnet posrom
	egen posses = rowtotal(`plist_`i'_`j'') , missing
		label var posses "Possession Status: Sum of 4 Vars"
	/*}}}*/
	/*Generate the Family Born in the Country Variables{{{*/
	/*BRN : pisa w1 cnt410 Korea ; timss w1 cnt250 France ; timss w4 cnt12 Algeria*/
	capture drop fambrn
	egen fambrn = rowtotal(???brn) 
		label var fambrn "Born in the Country; Family"
	/*}}}*/
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
	/* Generate PCA Group2{{{*/
	local pcalist posbok posses paredu fambrn
	capture drop pcascr2 pcagrp2 
	local count = 1
	foreach k of local clist {
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
	save ~/dropbox/`i'w`j' , replace
}
}
