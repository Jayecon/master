cd c:\timss
local path_input E:\Works\TIMSS\Stata\

/*Set input list{{{*/
local dlist bcg bsg btm bts bst
/*46 Countries for 8th Grades in TIMSS 2003*/
local clist arm aus bhr bwa bgr chl twn cyp egy eng ///
			est gha hkg hun idn irn isr ita jpn jor ///
			kor lva lbn ltu mkd mys mda mar nld nzl ///
			nor pse phl rom rus sau sco scg sgp svk ///
			svn zaf swe syr tun usa
/*Set ID Input List{{{*/
local bcgidlist idcntry	idschool
local bsgidlist idcntry	idschool	idstud
local btmidlist idcntry	idschool			idteach	idlink
local btsidlist idcntry	idschool			idteach	idlink
local bstidlist idcntry				idstud	idteach	idlink
/*}}}*/
/*Set File Specific Input Lists {{{*/
local bcgvlist bcbgcomu bcbgcmps bcbgtenr
local bsgvlist ///
	bsssci01 bsssci02 bsssci03 bsssci04 bsssci05 ///
	bsmmat01 bsmmat02 bsmmat03 bsmmat04 bsmmat05 ///
	bsbgolan bsbgborn bsdage itsex ///
	bsbgbook bsbgps01 bsbgps02 bsbgps03 bsbgps04 ///
	bsbgmfed bsbgfmed bsdgedup ///
	bsbgmbrn bsbgfbrn
local btmvlist btbgfedc btbgage btbgsex btdmstud btbgtaut
local btsvlist btbgfedc btbgage btbgsex btdsstud btbgtaut
/*}}}*/
/*Set Rename Vars list{{{*/
local bcgrvlist comsiz sccnum scsnum
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

/*Missing Value Control{{{*/
foreach z of local clist {
	/*BCG file{{{*/
	use "`path_input'bcg`z'm3.dta", clear
		rename _all , lower
		mvdecode bcbgcomu, mv(9=. \ 8=. \ 99=.) 
		mvdecode bcbgcmps, mv(999=. ) 
		mvdecode bcbgtenr, mv(99999=. ) 
		keep `bcgidlist' `bcgvlist' `bcgwlist'
			rename (`bcgvlist') (`bcgrvlist')
			save "bcg`z'temp3", replace
	/*}}}*/
	/*BSG file{{{*/
	use "`path_input'bsg`z'm3.dta", clear
		rename _all , lower
			mvdecode bsbgolan, 	mv(9=. \ 8=.)
			mvdecode bsbgborn, 	mv(9=. \ 8=.)
			mvdecode bsdage,   	mv(99=. \ 98=.)
			mvdecode itsex,   	mv(9=. \ 8=.)
			mvdecode bsbgbook, 	mv(9=. \ 8=.)
			mvdecode bsbgps01, 	mv(9=. )
			mvdecode bsbgps02, 	mv(9=. )
			mvdecode bsbgps03, 	mv(9=. )
			mvdecode bsbgps04, 	mv(9=. )
			mvdecode bsbgmfed, 	mv(99=. \ 98=. \ 9=.)
			mvdecode bsbgfmed, 	mv(99=. \ 98=. \ 9=.)
			mvdecode bsdgedup, 	mv(9=. \ 8=. )
			mvdecode bsbgmbrn, 	mv(9=. \ 8=. )
			mvdecode bsbgfbrn, 	mv(9=. \ 8=. )
		keep `bsgidlist' `bsgvlist' `bsgwlist'
			rename (`bsgvlist') (`bsgrvlist')
		save "bsg`z'temp3", replace/*}}}*/
	/*BTM file{{{*/
	use "`path_input'btm`z'm3.dta", clear
	rename _all , lower
		mvdecode btbgfedc, mv(9=. ) 
		mvdecode btbgage, mv(9=.)
		mvdecode btbgsex, mv(9=.) 
		mvdecode btbgtaut, mv(99=. \ 98=.)
		mvdecode btdmstud, mv(9=.) 
	keep `btmidlist' `btmvlist' `btmwlist'
		rename (`btmvlist') (`btmrvlist')
	save "btm`z'temp3", replace/*}}}*/
	/*BTS file{{{*/
	use "`path_input'bts`z'm3.dta", clear
	rename _all , lower
		mvdecode btbgfedc, mv(9=.) 
		mvdecode btbgage, mv(9=.)
		mvdecode btbgsex, mv(9=.) 
		mvdecode btbgtaut, mv(99=. \ 98=.)
		mvdecode btdsstud, mv(9=.) 
	keep `btsidlist' `btsvlist' `btswlist'
		rename (`btsvlist') (`btsrvlist')
	save "bts`z'temp3", replace/*}}}*/
	/*BST file{{{*/
	use "`path_input'bst`z'm3.dta", clear
	rename _all , lower
	keep `bstidlist' `bstwlist'
	save "bst`z'temp3", replace/*}}}*/
	}
/*}}}*/

/*Merge Files{{{*/
local fcntry : word 1 of `clist'
foreach y of local clist {
	disp "Country: `y'"
	/*Merge BCG and BSG{{{*/
	use "bcg`y'temp3", clear
		merge 1:m idcntry idschool using "bsg`y'temp3"
		drop if _merge == 1
		drop _merge
		save "`y'w3", replace /*}}}*/
	/*Control BTM{{{*/
	use "bst`y'temp3", clear
		merge m:1 idcntry idteach idlink using "btm`y'temp3"
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
		label value tcmedu BTBGFEDC
		label value tcmage BTBGAGE
		label value tcmsex BTBGSEX
		label value clmsiz BTDMSTUD
		save "btm`y'temp3", replace/*}}}*/
	/*Control BTS{{{*/
	use "bst`y'temp3", clear
		merge m:1 idcntry idteach idlink using "bts`y'temp3"
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
		label value tcsedu BTBGFEDC
		label value tcsage BTBGAGE
		label value tcssex BTBGSEX
		label value clssiz BTDSSTUD
		save "bts`y'temp3", replace
	/*}}}*/
	/*Combine BCG BSG BTM BTS{{{*/
	use "`y'w3", replace
		merge 1:1 idcntry idstud using "btm`y'temp3" , nogen
		merge 1:1 idcntry idstud using "bts`y'temp3" , nogen
		gen str3 cntry = "`y'"
		label variable cntry "COUNTRY 3CHAR"
		gen byte wave = 3
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
		save "`y'w3", replace
	/*Merge by Countries{{{*/
	if  "`y'" == "`fcntry'" {
		save "timssw3.dta", replace
		continue
	}
	append using "timssw3.dta"
	save "timssw3.dta", replace/*}}}*/
}
/*}}}*/
