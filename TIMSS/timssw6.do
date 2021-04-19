cd c:\timss
local path_input E:\Works\TIMSS\Stata\

/*Set input list{{{*/
local dlist bcg bsg btm bts bst
/*39 Countries for 8th Grades in TIMSS 2015*/
local clist aus bhr bwa can chl twn egy eng geo hkg ///
			hun irn irl isr ita jpn jor kaz kor kwt ///
			lbn ltu mys mlt mar nzl nor omn qat rus ///
			sau sgp svn zaf swe tha tur are usa
/*Set ID Input List{{{*/
local bcgidlist idcntry	idschool
local bsgidlist idcntry	idschool	idstud
local btmidlist idcntry	idschool			idteach	idlink
local btsidlist idcntry	idschool			idteach	idlink
local bstidlist idcntry				idstud	idteach	idlink
/*}}}*/
/*Set File Specific Input Lists {{{*/
local bcgvlist bcbg05a bcbg10 stotwgtu
local bsgvlist  ///
	bsssci01 bsssci02 bsssci03 bsssci04 bsssci05  ///
	bsmmat01 bsmmat02 bsmmat03 bsmmat04 bsmmat05  ///
	bsbg03 bsbg10a bsdage itsex ///
	bsbg04 bsbg06a bsbg06b bsbg06c bsbg06d bsbg06e bsbg06f bsbg06g   ///
	bsbg07a bsbg07b bsdgedup ///
	bsbg09a bsbg09b
local btmvlist btbg04 btbg03 btbg02 btbg12 btbg01
local btsvlist btbg04 btbg03 btbg02 btbg12 btbg01
/*}}}*/
/*Set Rename Vars list{{{*/
local bcgrvlist comsiz sccnum scsnum
local bsgrvlist ///
	sci01 sci02 sci03 sci04 sci05 ///
	mat01 mat02 mat03 mat04 mat05 ///
	stdlng stdbrn stdage stdsex ///
	posbok poscto poscts posdsk posrom posnet posphn posgam ///
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

/*Missing Value Control{{{*/
foreach z of local clist {
	/*BCG file{{{*/
	use "`path_input'bcg`z'm6.dta", clear
		rename _all , lower
		mvdecode bcbg05a, mv(99=.)
		mvdecode stotwgtu, mv(999999=.)
		mvdecode bcbg10, mv(999=.)
		keep `bcgidlist' `bcgvlist' `bcgwlist'
			rename (`bcgvlist') (`bcgrvlist')
			save "bcg`z'temp6", replace
	/*}}}*/
	/*BSG file{{{*/
	use "`path_input'bsg`z'm6.dta", clear
		rename _all , lower
		mvdecode bsbg03, 	mv(9=. \ 8=.)
		mvdecode bsbg10a, 	mv(9=. \ 8=.)
		mvdecode bsdage,   	mv(99=.)
		mvdecode itsex,   	mv(9=. )
		mvdecode bsbg04, 	mv(9=. \ 8=. \ 5=.)
		mvdecode bsbg06a,  	mv(9=. )
		mvdecode bsbg06b,  	mv(9=. )
		mvdecode bsbg06c,  	mv(9=. )
		mvdecode bsbg06d,  	mv(9=. )
		mvdecode bsbg06e,  	mv(9=. )
		mvdecode bsbg06f,  	mv(9=. )
		mvdecode bsbg06f,  	mv(9=. )
		mvdecode bsbg07a, 	mv(99=. \ 8=.)
		mvdecode bsbg07b, 	mv(99=. \ 8=.)
		mvdecode bsdgedup, 	mv(9=. \ 6=.)
		mvdecode bsbg09a, 	mv(9=. \ 8=.)
		mvdecode bsbg09b, 	mv(9=. \ 8=.)
		keep `bsgidlist' `bsgvlist' `bsgwlist'
			rename (`bsgvlist') (`bsgrvlist')
		save "bsg`z'temp6", replace/*}}}*/
	/*BTM file{{{*/
	use "`path_input'btm`z'm6.dta", clear
		rename _all , lower
		mvdecode btbg04, mv(99=.)
		mvdecode btbg03, mv(9=.)
		mvdecode btbg02, mv(9=.)
		mvdecode btbg01, mv(99=.)
		mvdecode btbg12, mv(99=.)
		keep `btmidlist' `btmvlist' `btmwlist'
			rename (`btmvlist') (`btmrvlist')
		save "btm`z'temp6", replace/*}}}*/
	/*BTS file{{{*/
	use "`path_input'bts`z'm6.dta", clear
		rename _all , lower
		mvdecode btbg04, mv(99=.)
		mvdecode btbg03, mv(9=.)
		mvdecode btbg02, mv(9=.)
		mvdecode btbg01, mv(99=.)
		mvdecode btbg12, mv(99=.)
		keep `btsidlist' `btsvlist' `btswlist'
			rename (`btsvlist') (`btsrvlist')
		save "bts`z'temp6", replace/*}}}*/
	/*BST file{{{*/
	use "`path_input'bst`z'm6.dta", clear
			rename _all , lower
			keep `bstidlist'
		save "bst`z'temp6", replace/*}}}*/
	}
/*}}}*/

/*Merge Files{{{*/
local fcntry : word 1 of `clist'
foreach y of local clist {
	disp "Country: `y'"
	/*Merge BCG and BSG{{{*/
	use "bcg`y'temp6", clear
		merge 1:m idcntry idschool using "bsg`y'temp6"
		drop if _merge == 1
		drop _merge
		save "`y'w6", replace /*}}}*/
	/*Control BTM{{{*/
	use "bst`y'temp6", clear
		merge m:1 idcntry idteach idlink using "btm`y'temp6"
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
		save "btm`y'temp6", replace/*}}}*/
	/*Control BTS{{{*/
	use "bst`y'temp6", clear
		merge m:1 idcntry idteach idlink using "bts`y'temp6"
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
		save "bts`y'temp6", replace
	/*}}}*/
	/*Combine BCG BSG BTM BTS{{{*/
	use "`y'w6", replace
		merge 1:1 idcntry idstud using "btm`y'temp6" , nogen
		merge 1:1 idcntry idstud using "bts`y'temp6" , nogen
		gen str3 cntry = "`y'"
		label variable cntry "COUNTRY 3CHAR"
		gen byte wave = 6
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
		save "`y'w6", replace
	/*Merge by Countries{{{*/
	if  "`y'" == "`fcntry'" {
		save "timssw6.dta", replace
		continue
	}
	append using "timssw6.dta"
	save "timssw6.dta", replace/*}}}*/
}
/*}}}*/
