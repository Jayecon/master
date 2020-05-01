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
			posbok poscal poscom posdsk posdic posnet ///
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
	/*Set Input Lists for Wave 4(47 Countries + England and Scottland){{{*/
	local clist4 dza arm aus bhr bih bwa bgr twn col cyp cze egy eng slv geo gha hkg hun idn irn isr ita jpn jor kor kwt lbn ltu mys mlt mng mar nor omn pse qat rom rus sau sco scg sgp svn swe syr tha tun ukr usa
	local bcgvlist4 bc4gcomu bc4gcmps bc4gtenr
	local bsgvlist4 ///
		bsssci01 bsssci02 bsssci03 bsssci04 bsssci05  ///
		bsmmat01 bsmmat02 bsmmat03 bsmmat04 bsmmat05  ///
		bs4golan bs4gborn bsdage itsex ///
		bs4gbook bs4gth01 bs4gth02 bs4gth03 bs4gth04 bs4gth05 ///
		bs4gmfed bs4gfmed bsdgedup ///
		bs4gmbrn bs4gfbrn
	local btmvlist4 bt4gfedc bt4gage bt4gsex btdmstud bt4gtaut
	local btsvlist4 bt4gfedc bt4gage bt4gsex btdsstud bt4gtaut
	/*}}}*/
/*}}}*/
/*Missing Value Control{{{*/
foreach z of local clist4 {
	/*BCG file{{{*/
	use "`path_input'bcg`z'm4.dta", clear
		rename _all , lower
		mvdecode bc4gcomu, mv(9=. \ 8=. \ 99=.) 
		mvdecode bc4gcmps, mv(999=.) 
		mvdecode bc4gtenr, mv(99999=.) 
		keep `bcgidlist' `bcgvlist4' `bcgwlist'
			rename (`bcgvlist4') (`bcgrvlist')
		save "bcg`z'temp4", replace
	/*}}}*/
	/*BSG file{{{*/
	use "`path_input'bsg`z'm4.dta", clear
		rename _all , lower
		mvdecode bs4golan, 	mv(9=. \ 8=.)
		mvdecode bs4gborn, 	mv(9=. \ 8=.)
		mvdecode bsdage,   	mv(99=. \ 98=.)
		mvdecode itsex,   	mv(9=. \ 8=.)
		mvdecode bs4gbook, 	mv(9=. \ 8=.)
		mvdecode bs4gth01, 	mv(9=. \ 8=.)
		mvdecode bs4gth02, 	mv(9=. \ 8=.)
		mvdecode bs4gth03, 	mv(9=. \ 8=.)
		mvdecode bs4gth04, 	mv(9=. \ 8=.)
		mvdecode bs4gth05, 	mv(9=. \ 8=.)
		mvdecode bs4gmfed, 	mv(99=. \ 98=. \ 8=.)
		mvdecode bs4gfmed, 	mv(99=. \ 98=. \ 8=.)
		mvdecode bsdgedup, 	mv(9=. \ 8=. \ 6=.)
		mvdecode bs4gmbrn, 	mv(9=. \ 8=. )
		mvdecode bs4gfbrn, 	mv(9=. \ 8=. )
		keep `bsgidlist' `bsgvlist4' `bsgwlist'
			rename (`bsgvlist4') (`bsgrvlist')
		save "bsg`z'temp4", replace/*}}}*/
	/*BTM file{{{*/
	use "`path_input'btm`z'm4.dta", clear
		rename _all , lower
		mvdecode bt4gfedc, mv(9=. \ 8=.)
		mvdecode bt4gage, mv(9=. \ 8=.)
		mvdecode bt4gsex, mv(9=. \ 8=.)
		mvdecode bt4gtaut, mv(99=. \ 98=.)
		mvdecode btdmstud, mv(9=.)
		keep `btmidlist' `btmvlist4' `btmwlist'
			rename (`btmvlist4') (`btmrvlist')
		save "btm`z'temp4", replace/*}}}*/
	/*BTS file{{{*/
	use "`path_input'bts`z'm4.dta", clear
		rename _all , lower
		mvdecode bt4gfedc, mv(9=. \ 8=.)
		mvdecode bt4gage, mv(9=. \ 8=.)
		mvdecode bt4gsex, mv(9=. \ 8=.)
		mvdecode bt4gtaut, mv(99=. \ 98=.)
		mvdecode btdsstud, mv(9=.)
		keep `btsidlist' `btsvlist4' `btswlist'
			rename (`btsvlist4') (`btsrvlist')
		save "bts`z'temp4", replace/*}}}*/
	/*BST file{{{*/
	use "`path_input'bst`z'm4.dta", clear
			rename _all , lower
			keep `bstidlist'
			save "bst`z'temp4", replace/*}}}*/
	}
/*}}}*/
/*Merge Files{{{*/
local fcntry : word 1 of `clist4'
foreach y of local clist4 {
	disp "Country: `y'"
	/*Merge BCG and BSG{{{*/
	use "bcg`y'temp4", clear
		merge 1:m idcntry idschool using "bsg`y'temp4"
		drop if _merge == 1
		drop _merge
		save "`y'w4", replace /*}}}*/
	/*Control BTM{{{*/
	use "bst`y'temp4", clear
		merge m:1 idcntry idteach idlink using "btm`y'temp4"
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
		label value tcmedu BT4GFEDC
		label value tcmage BT4GAGE
		label value tcmsex BT4GSEX
		label value clmsiz BTDMSTUD
		save "btm`y'temp4", replace/*}}}*/
	/*Control BTS{{{*/
	use "bst`y'temp4", clear
		merge m:1 idcntry idteach idlink using "bts`y'temp4"
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
		label value tcsedu BT4GFEDC
		label value tcsage BT4GAGE
		label value tcssex BT4GSEX
		label value clssiz BTDSSTUD
		save "bts`y'temp4", replace
	/*}}}*/
	/*Combine BCG BSG BTM BTS{{{*/
	use "`y'w4", replace
		merge 1:1 idcntry idstud using "btm`y'temp4" , nogen
		merge 1:1 idcntry idstud using "bts`y'temp4" , nogen
		gen str3 cntry = "`y'"
		label variable cntry "COUNTRY 3CHAR"
		gen byte wave = 4
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
		save "`y'w4", replace
	/*Merge by Countries{{{*/
	if  "`y'" == "`fcntry'" {
		save "timssw4.dta", replace
		continue
	}
	append using "timssw4.dta"
	save "timssw4.dta", replace/*}}}*/
}
/*}}}*/
