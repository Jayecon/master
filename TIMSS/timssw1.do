cd c:\timss
local path_input E:\Works\TIMSS\Stata\
/*Set input list{{{*/
	/*Set Common Input Lists {{{*/
	local dlist bcg bsg btm bts bst
		/*Set ID Input List{{{*/
		local bcgidlist idcntry	idschool
		local bsgidlist idcntry	idschool	idstud
		local btmidlist idcntry	idschool			idteach	idlink
		local btsidlist idcntry	idschool			idteach	idlink
		local bstidlist idcntry				idstud	idteach	idlink
		/*}}}*/
		/*Set Rename Vars list{{{*/
		local bcgrvlist comsiz tcfnum tcpnum sccnum scbnum scgnum
		local bsgrvlist ///
			sci01 sci02 sci03 sci04 sci05 ///
			mat01 mat02 mat03 mat04 mat05 ///
			stdlng stdbrn stdage stdsex ///
			posbok poscal poscom posdsk posdic ///
			mtredu ftredu paredu ///
			mtrbrn ftrbrn
		local btmrvlist tcmedu tcmage tcmsex clmsiz tcmyox
		local btsrvlist tcsedu tcsage tcssex clssiz tcsyox
		local bstrvlist tcmnum tcsnum tcanum
		/*}}}*/
		/*Set Weight Vars list{{{*/
		local bcgwlist schwgt
		local bsgwlist totwgt houwgt senwgt
		local btmwlist
		local btswlist
		local bstwlist
		/*}}}*/
	/*}}}*/
	/*Set Input Lists for Wave 1(35 Countries){{{*/
	local clist1 aus aut can col cyp csk dnk fra deu grc hkg hun isl irn irl isr kor kwt lva ltu nld nzl nor prt rom rus sco sgp slv svn esp swe che tha usa
	local bcgvlist1 bcbgcomm bcbgftte bcbgptte bcbgcom1 bcbgbenr bcbggenr
	local bsgvlist1 ///
		bsspv01 bsspv02 bsspv03 bsspv04 bsspv05 ///
		bsmpv01 bsmpv02 bsmpv03 bsmpv04 bsmpv05 ///
		bsbglang bsbgbrn1 bsdage itsex ///
		bsbgbook bsbgps01 bsbgps02 bsbgps03 bsbgps04 ///
		bsbgedum bsbgeduf bsdgedup ///
		bsbgbrnm bsbgbrnf
	local btmvlist1 btbgeduc btbgage btbgsex btdcsize btbgtaug
	local btsvlist1 btbgeduc btbgage btbgsex btdcsize btbgtaug
	/*}}}*/
/*}}}*/
/*Missing Value Control{{{*/
foreach z of local clist1 {
	/*BCG file{{{*/
	use "`path_input'bcg`z'm1.dta", clear
		rename _all , lower
		mvdecode bcbgcomm, mv(9=. \ 8=. \ 99=.)
		mvdecode bcbgftte, mv(998=.)	/*GEN\NUMBER OF FULL-TIME TEACHERS */
		mvdecode bcbgptte, mv(998=.)	/*GEN\NUMBER OF PART-TIME TEACHERS*/
		mvdecode bcbgcom1, mv(998=.)	/*GEN\COMPUTERS\AVAILABLE*/
		mvdecode bcbgbenr, mv(9998=.)	/*GEN\TOTAL SCHOOL ENROLLMENT\BOYS */
		mvdecode bcbggenr, mv(9998=.)	/*GEN\TOTAL SCHOOL\ENROLLMENT\GIRLS */
		keep `bcgidlist' `bcgvlist1' `bcgwlist'
			rename (`bcgvlist1') (`bcgrvlist')
			save "bcg`z'temp1", replace
	/*}}}*/
	/*BSG file{{{*/
	use "`path_input'bsg`z'm1.dta", clear
		rename _all , lower
		mvdecode bsbglang, 	mv(9=. \ 8=. \ 6=. )
		mvdecode bsbgbrn1, 	mv(9=. \ 8=. \ 6=. )
		mvdecode bsdage,   	mv(99=. \ 98=.)
		mvdecode itsex,   	mv(9=. \ 8=.)
		mvdecode bsbgbook, 	mv(9=. \ 8=. \ 6=.)
		mvdecode bsbgps01, 	mv(9=. \ 8=.)
		mvdecode bsbgps02, 	mv(9=. \ 8=.)
		mvdecode bsbgps03, 	mv(9=. \ 8=.)
		mvdecode bsbgps04, 	mv(9=. \ 8=.)
		mvdecode bsbgedum, 	mv(99=. \ 98=. \96=. \ 7=.)
		mvdecode bsbgeduf, 	mv(99=. \ 98=. \96=. \ 7=.)
		mvdecode bsdgedup, 	mv(9=. \ 8=. \ 6=. \ 4=.)
		mvdecode bsbgbrnm, 	mv(9=. \ 8=. \ 6=. )
		mvdecode bsbgbrnf, 	mv(9=. \ 8=. \ 6=. )
		keep `bsgidlist' `bsgvlist1' `bsgwlist'
			rename (`bsgvlist1') (`bsgrvlist')
			save "bsg`z'temp1", replace/*}}}*/
	/*BTM file{{{*/
	use "`path_input'btm`z'm1.dta", clear
		rename _all , lower
		mvdecode btbgeduc, mv(99=. \ 98=.)
		mvdecode btbgage, mv(99=. \ 98=.)
		mvdecode btbgsex, mv(9=. \ 8=.)
		mvdecode btbgtaug, mv(99=. \ 98=.)
		mvdecode btdcsize, mv(9999=. \ 9998=. \ 9996=.)
		keep `btmidlist' `btmvlist1' `btmwlist'
			rename (`btmvlist1') (`btmrvlist')
		save "btm`z'temp1", replace/*}}}*/
	/*BTS file{{{*/
	use "`path_input'bts`z'm1.dta", clear
		rename _all , lower
		mvdecode btbgeduc, mv(99=. \ 98=.)
		mvdecode btbgage, mv(99=. \ 98=.)
		mvdecode btbgsex, mv(9=. \ 8=.)
		mvdecode btbgtaug, mv(99=. \ 98=.)
		mvdecode btdcsize, mv(9999=. \ 9998=. \ 9996=.)
		keep `btsidlist' `btsvlist1' `btswlist'
			rename (`btsvlist1') (`btsrvlist')
			save "bts`z'temp1", replace/*}}}*/
	/*BST file{{{*/
	use "`path_input'bst`z'm1.dta", clear
		rename _all , lower
		keep `bstidlist'  `bstwlist'
		save "bst`z'temp1", replace/*}}}*/
}
/*}}}*/
/*Merge Files{{{*/
local fcntry : word 1 of `clist1'
foreach y of local clist1 {
	disp "Country: `y'"
	/*Merge BCG and BSG{{{*/
	use "bcg`y'temp1", clear
		merge 1:m idcntry idschool using "bsg`y'temp1"
		drop if _merge == 1
		drop _merge
		save "`y'w1", replace /*}}}*/
	/*Control BTM{{{*/
	use "bst`y'temp1", clear
		merge m:1 idcntry idteach idlink using "btm`y'temp1"
		drop if _merge == 2
		drop _merge
		mvdecode idschool, mv(999999=. )
		drop if missing(idschool)
		drop idteach idlink
		bys idstud : gen nu = _n
		sum nu , meanonly
		local tcmmax = r(max)
		reshape wide `btmrvlist' , i(idstud) j(nu)
		order _all , alpha
		foreach j of local btmrvlist {
			egen `j' = rowmean(`j'1-`j'`tcmmax')
			replace `j' = round(`j',1)
				drop `j'1-`j'`tcmmax'
		}
		label var tcmedu "GEN\LEVEL OF EDUCATION COMPLETED"
		label var tcmage "GEN\AGE OF TEACHER" 
		label var tcmsex "GEN\SEX OF TEACHER"
		label var clmsiz "GEN\CLSS\NUMBER OF BOYS & GIRLS IN CLASS"
		label var tcmyox "GEN\YEARS BEEN TEACHING"
		label value tcmedu BTBGEDUC
		label value tcmage BTBGAGE
		label value tcmsex BTBGSEX
		label value clmsiz BTDCSIZE
		save "btm`y'temp1", replace/*}}}*/
	/*Control BTS{{{*/
	use "bst`y'temp1", clear
		merge m:1 idcntry idteach idlink using "bts`y'temp1"
		drop if _merge == 2
		drop _merge
		mvdecode idschool, mv(999999=. )
		drop if missing(idschool)
		drop idteach idlink
		bys idstud : gen nu = _n
		sum nu , meanonly
		local tcsmax = r(max)
		reshape wide `btsrvlist' , i(idstud) j(nu)
		order _all , alpha
		foreach j of local btsrvlist {
			egen `j' = rowmean(`j'1-`j'`tcsmax')
			replace `j' = round(`j',1)
				drop `j'1-`j'`tcsmax'
		}
		label var tcsedu "GEN\LEVEL OF EDUCATION COMPLETED"
		label var tcsage "GEN\AGE OF TEACHER"
		label var tcssex "GEN\SEX OF TEACHER"
		label var clssiz "GEN\CLSS\NUMBER OF BOYS & GIRLS IN CLASS"
		label var tcsyox "GEN\YEARS BEEN TEACHING"
		label value tcsedu BTBGEDUC
		label value tcsage BTBGAGE
		label value tcssex BTBGSEX
		label value clssiz BTDCSIZE
		save "bts`y'temp1", replace
	/*}}}*/
	/*Combine BCG BSG BTM BTS{{{*/
	use "`y'w1", replace
		merge 1:1 idcntry idstud using "btm`y'temp1" , nogen
		merge 1:1 idcntry idstud using "bts`y'temp1" , nogen
		gen str3 cntry = "`y'"
		label variable cntry "COUNTRY 3CHAR"
		gen byte wave = 1
		label variable wave "WAVE NUMBER"
		order _all, alphabetic
		compress/*}}}*/
	/*Cleaning & Exception Control{{{*/
		order _all , first
		order wave cntry id* , first
		egen posses = rowtotal(pos*) , missing
		egen parbrn = rowtotal(ftrbrn mtrbrn) , missing
		replace cntry = "cze" if cntry == "csk"	/*CSK exception*/
		replace idcntry = 203 if idcntry == 200		/*CSK exception*//*}}}*/
	save "`y'w1", replace
	/*Merge by Countries{{{*/
	if  "`y'" == "`fcntry'" {
		save "timssw1.dta", replace
		continue
	}
	append using "timssw1.dta"/*}}}*/
	save "timssw1.dta", replace
}
/*}}}*/
