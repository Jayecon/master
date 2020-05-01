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
		local bcgrvlist comsiz sccnum scsnum
		local bsgrvlist ///
			sci01 sci02 sci03 sci04 sci05 ///
			mat01 mat02 mat03 mat04 mat05 ///
			stdlng stdbrn stdage stdsex ///
			posbok poscom posdsk posrom posnet ///
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
	/*Set Input Lists for Wave 5(42 Countries){{{*/
	local clist5 arm aus bhr chl twn eng fin geo gha hkg hun idn irn isr ita jpn jor kaz kor lbn ltu mkd mys mar nzl nor omn pse qat rom rus sau sgp svn swe syr tha tun tur ukr are usa
	local bcgvlist5 bcbg05a bcbg07 bcbg01
	local bsgvlist5  ///
		bsssci01 bsssci02 bsssci03 bsssci04 bsssci05  ///
		bsmmat01 bsmmat02 bsmmat03 bsmmat04 bsmmat05  ///
		bsbg03 bsbg09a bsdage itsex ///
		bsbg04 bsbg05a bsbg05b  bsbg05d  bsbg05e ///
		bsbg06a bsbg06b bsdgedup ///
		bsbg08a bsbg08b
	local btmvlist5 btbg04 btbg03 btbg02 btbg12 btbg01
	local btsvlist5 btbg04 btbg03 btbg02 btbg12 btbg01
	/*}}}*/
/*}}}*/
/*Missing Value Control{{{*/
foreach z of local clist5 {
	/*BCG file{{{*/
	use "`path_input'bcg`z'm5.dta", clear
		rename _all , lower
		mvdecode bcbg05a, mv(9=.)
		mvdecode bcbg01, mv(99999=.)
		mvdecode bcbg07, mv(999=.)
		keep `bcgidlist' `bcgvlist5' `bcgwlist'
			rename (`bcgvlist5') (`bcgrvlist')
			save "bcg`z'temp5", replace
	/*}}}*/
	/*BSG file{{{*/
	use "`path_input'bsg`z'm5.dta", clear
		rename _all , lower
		mvdecode bsbg03, 	mv(9=. \ 8=.)
		mvdecode bsbg09a, 	mv(9=. \ 8=.)
		mvdecode bsdage,   	mv(99=. \ 98=.)
		mvdecode itsex,   	mv(9=. \ 8=.)
		mvdecode bsbg04, 	mv(9=. \ 8=. )
		mvdecode bsbg05a,  	mv(9=. \ 8=.)
		mvdecode bsbg06a, 	mv(99=. \ 98=. \ 8=.)
		mvdecode bsbg06b, 	mv(99=. \ 98=. \ 8=.)
		mvdecode bsdgedup, 	mv(99=. \ 96=. \ 6=.)
		mvdecode bsbg08a, 	mv(9=. \ 8=.)
		mvdecode bsbg08b, 	mv(9=. \ 8=.)
		keep `bsgidlist' `bsgvlist5' `bsgwlist'
			rename (`bsgvlist5') (`bsgrvlist')
			recode stdsex (2=0)
		save "bsg`z'temp5", replace/*}}}*/
	/*BTM file{{{*/
	use "`path_input'btm`z'm5.dta", clear
		rename _all , lower
		mvdecode btbg04, mv(9=. \ 8=.)
		mvdecode btbg03, mv(9=. \ 8=.)
		mvdecode btbg02, mv(9=. \ 8=.)
		mvdecode btbg01, mv(99=. \ 98=.)
		mvdecode btbg12, mv(999=. \ 998=.)
		keep `btmidlist' `btmvlist5' `btmwlist'
			rename (`btmvlist5') (`btmrvlist')
		save "btm`z'temp5", replace /*}}}*/
	/*BTS file{{{*/
	use "`path_input'bts`z'm5.dta", clear
		rename _all , lower
		mvdecode btbg04, mv(9=. \ 8=.)
		mvdecode btbg03, mv(9=. \ 8=.)
		mvdecode btbg02, mv(9=. \ 8=.)
		mvdecode btbg01, mv(99=. \ 98=.)
		mvdecode btbg12, mv(999=. \ 998=.)
		keep `btsidlist' `btsvlist5' `btswlist'
			rename (`btsvlist5') (`btsrvlist')
			save "bts`z'temp5", replace/*}}}*/
	/*BST file{{{*/
	use "`path_input'bst`z'm5.dta", clear
			rename _all , lower
			keep `bstidlist'
			save "bst`z'temp5", replace/*}}}*/
	}
/*}}}*/
/*Merge Files{{{*/
local fcntry : word 1 of `clist5'
foreach y of local clist5 {
	disp "Country: `y'"
	/*Merge BCG and BSG{{{*/
	use "bcg`y'temp5", clear
		merge 1:m idcntry idschool using "bsg`y'temp5"
		drop if _merge == 1
		drop _merge
		save "`y'w5", replace /*}}}*/
	/*Control BTM{{{*/
	use "bst`y'temp5", clear
		merge m:1 idcntry idteach idlink using "btm`y'temp5"
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
		label value tcmedu BTBG04
		label value tcmage BTBG03
		label value tcmsex BTBG02
		label value clmsiz BTBG12
		save "btm`y'temp5", replace/*}}}*/
	/*Control BTS{{{*/
	use "bst`y'temp5", clear
		merge m:1 idcntry idteach idlink using "bts`y'temp5"
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
		label value tcsedu BTBG04
		label value tcsage BTBG03
		label value tcssex BTBG02
		label value clssiz BTBG12
		save "bts`y'temp5", replace
	/*}}}*/
	/*Combine BCG BSG BTM BTS{{{*/
	use "`y'w5", replace
		merge 1:1 idcntry idstud using "btm`y'temp5" , nogen
		merge 1:1 idcntry idstud using "bts`y'temp5" , nogen
		gen str3 cntry = "`y'"
		label variable cntry "COUNTRY 3CHAR"
		gen byte wave = 5
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
		save "`y'w5", replace
	/*Merge by Countries{{{*/
	if  "`y'" == "`fcntry'" {
		save "timssw5.dta", replace
		continue
	}
	append using "timssw5.dta"
	save "timssw5.dta", replace/*}}}*/
}
/*}}}*/
