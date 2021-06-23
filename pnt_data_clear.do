set more off
foreach i in pisa timss{
forvalue j=1/7 {
	use ~/dropbox/`i'r`j' , clear
	/*Errant Countries Control{{{*/
	if "`i'" == "pisa" & `j' == 6 {
		drop if cntcod == 8 /*No parental education : Albania*/
	}
	if "`i'" == "pisa" & `j' == 7 {
		drop if cntcod == 704 /*No Score : Viet Nam*/
	}
	if "`i'" == "timss" & `j' == 4 {
		drop if cntcod == 926 /*No parental education : England*/
	}
	/*Exception Control{{{*/
	replace cntcod = 276 if cntcod == 280 /* Germany code changed */
	replace cntcod = 705 if cntcod == 890 /* Slovenia code changed */
	replace cntcod = 826 if cntcod == 926 /* England is a large part of the UK */
	replace cntcod = 688 if cntcod == 891 /* Serbia code changed */
	drop if inlist(cntcod , 201 , 827 , 927 , 438) /* 201 = Unknown; 827 and 927 = Scotland is a part of the UK; 438 Liehitenstein is a small country */
	/*}}}*/
	levelsof cntcod , local(clist)
	/*}}}*/
	/*Rename Variables {{{*/
	if "`i'" == "timss" {
		rename totwgt stuwgt
		rename comsiz schloc
		rename idstud idstudent
		rename stdsex stusex
	}
	if "`i'" == "pisa" & `j' <= 5 {
		rename schoolid idschool
		rename stidstd idstudent
	}
	if "`i'" == "pisa" & `j' > 5 {
		rename cntschid idschool
		rename cntstuid idstudent
	}
	/*}}}*/
	drop if missing(cntcod , idschool , idstudent)
	/* Cleaning Dummy Variables {{{*/
	captur label drop YN
	label define YN 1 "Yes" 0 "No"
	qui lookfor pos
	local plist `r(varlist)'
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
	qui lookfor brn
	local blist `r(varlist)'
	foreach k of local blist {
		local brntest strpos("`k'" , "brn")
		if `brntest' == 4 {
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
	/*Drop Redundent Variables{{{*/
	*if "`i'" == "timss" {
	*	drop clmsiz clssiz sscnum scsnum stdlng tcm??? tcs??? wave 
	*}
	*if "`i'" == "pisa" {
	*	drop _* ???edu? ???job ???occ strati tch*
	*}
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
	capture drop pv1masc pv1mrsc
	if "`i'" == "pisa" {
		egen pv1masc = rowmean(pv1math pv1scie)
			label var pv1masc "Plausible Value in Math and Science"
		egen pv1mrsc = rowmean(pv1math pv1scie)
			label var pv1mrsc "Plausible Value in Math, Science and Reading"
	}
	else if "`i'" == "timss" {
		egen pv1masc = rowmean(pv1math pv1scie)
			label var pv1masc "Plausible Value in Math and Science"
	}
	/*Generate the Family Born in the Country Variables{{{*/
	/*Caution on BRN Missing : pisa w1 cnt410 Korea ; timss w1 cnt250 France ; timss w4 cnt12 Algeria*/
	capture drop fambrn
	egen fambrn = rowtotal(???brn) , missing
		label var fambrn "Born in the Country; Family"
	/*}}}*/
	compress
	save ~/dropbox/`i'w`j' , replace
}
}
