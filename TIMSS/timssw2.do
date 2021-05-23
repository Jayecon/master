local path E:\Works\TIMSS\Stata\
tempfile tfile1 tfile2 tfile3 tfile4 tfile5 tfile6

/*Set input list{{{*/
local dlist bcg bsg btm bts bst
/*34 Countries for 8th Grades in TIMSS 1999*/
local clist aus bgr can chl twn cyp cze fin hkg hun ///
			idn irn isr ita jor kor lva ltu mkd mda ///
			mar mys nld nzl phl rom rus sgp svk svn ///
			tha tun tur usa
/*Set ID Input List{{{*/
local bcgidlist idcntry	idschool
local bsgidlist idcntry	idschool	idstud
local btmidlist idcntry	idschool			idteach	idlink
local btsidlist idcntry	idschool			idteach	idlink
local bstidlist idcntry				idstud	idteach	idlink
/*}}}*/
/*Set File Specific Input Lists {{{*/
local bcgvlist bcbgcomm bcbgftte bcbgptte bcbgcmp3 bcbgbenr bcbggenr
local bsgvlist ///
	bsssci01 bsssci02 bsssci03 bsssci04 bsssci05 ///
	bsmmat01 bsmmat02 bsmmat03 bsmmat04 bsmmat05 ///
	bsbglang bsbgbrn1 bsdage itsex ///
	bsbgbook bsbgps01 bsbgps02 bsbgps03 bsbgps04 ///
	bsbgedmo bsbgedfa bsdgedup ///
	bsbgbrnm bsbgbrnf
local btmvlist btbgeduc btbgage btbgsex btdmsize btbgtaug
local btsvlist btbgeduc btbgage btbgsex btdssize btbgtaug
/*}}}*/
/*Set Rename Vars list{{{*/
local bcgrvlist comsiz tcfnum tcpnum sccnum scbnum scgnum
local bsgrvlist ///
	pv1scie pv2scie pv3scie pv4scie pv5scie ///
	pv1math pv2math pv3math pv4math pv5math ///
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

local fcntry : word 1 of `clist'
/*Missing Value Control{{{*/
foreach z of local clist {
disp "Country: `z'"
	/*BCG file{{{*/
	use "`path'bcg`z'm2.dta", clear
		rename _all , lower
		mvdecode bcbgcomm, mv(9=. \ 8=. \ 99=.)
		mvdecode bcbgftte, mv(998=.)	/*GEN\NUMBER OF FULL-TIME TEACHERS */
		mvdecode bcbgptte, mv(998=.)	/*GEN\NUMBER OF PART-TIME TEACHERS*/
		mvdecode bcbgcmp3, mv(998=.)	/*GEN\COMPUTERS\AVAILABLE*/
		mvdecode bcbgbenr, mv(9998=.)	/*GEN\TOTAL SCHOOL ENROLLMENT\BOYS */
		mvdecode bcbggenr, mv(9998=.)	/*GEN\TOTAL SCHOOL\ENROLLMENT\GIRLS */
		keep `bcgidlist' `bcgvlist' `bcgwlist'
			rename (`bcgvlist') (`bcgrvlist')
			save `tfile1', replace
	/*}}}*/
	/*BSG file{{{*/
	use "`path'bsg`z'm2.dta", clear
		rename _all , lower
		mvdecode bsbglang, 	mv(9=. \ 8=.)
		mvdecode bsbgbrn1, 	mv(9=. \ 8=.)
		mvdecode bsdage,   	mv(99=. \ 98=.)
		mvdecode itsex,   	mv(9=. \ 8=.)
		mvdecode bsbgbook, 	mv(9=. \ 8=.)
		mvdecode bsbgps01, 	mv(9=. \ 8=.)
		mvdecode bsbgps02, 	mv(9=. \ 8=.)
		mvdecode bsbgps03, 	mv(9=. \ 8=.)
		mvdecode bsbgps04, 	mv(9=. \ 8=.)
		mvdecode bsbgedmo, 	mv(99=. \ 98=. \ 8=.)
		mvdecode bsbgedfa, 	mv(99=. \ 98=. \ 8=.)
		mvdecode bsdgedup, 	mv(9=. \ 8=. \ 5=. \ 6=.)
		mvdecode bsbgbrnm, 	mv(9=. \ 8=.) 
		mvdecode bsbgbrnf, 	mv(9=. \ 8=.)
		keep `bsgidlist' `bsgvlist' `bsgwlist'
			rename (`bsgvlist') (`bsgrvlist')
			save `tfile2', replace/*}}}*/
	/*BTM file{{{*/
	use "`path'btm`z'm2.dta", clear
		rename _all , lower
		mvdecode btbgeduc, mv(99=. \ 98=.) 
		mvdecode btbgage, mv(999=. \ 998=.)
		mvdecode btbgsex, mv(99=. \ 98=.) 
		mvdecode btbgtaug, mv(999=. \ 998=.)
		mvdecode btdmsize, mv(9999=. \ 9998=. \ 9996=.) 
		keep `btmidlist' `btmvlist' `btmwlist'
			rename (`btmvlist') (`btmrvlist')
		save `tfile3', replace/*}}}*/
	/*BTS file{{{*/
	use "`path'bts`z'm2.dta", clear
		rename _all , lower
		mvdecode btbgeduc, mv(99=. \ 98=.) 
		mvdecode btbgage, mv(99=. \ 98=.)
		mvdecode btbgsex, mv(9=. \ 8=.) 
		mvdecode btbgtaug, mv(99=. \ 98=.)
		mvdecode btdssize, mv(9999=. \ 9998=. \ 9996=.) 
		keep `btsidlist' `btsvlist' `btswlist'
			rename (`btsvlist') (`btsrvlist')
			save `tfile4', replace/*}}}*/
	/*BST file{{{*/
	use "`path'bst`z'm2.dta", clear
		rename _all , lower
		keep `bstidlist' `bstwlist'
		save `tfile5', replace/*}}}*/
/*}}}*/

/*Merge Files{{{*/
	/*Merge BCG and BSG{{{*/
	use `tfile1', clear
		merge 1:m idcntry idschool using `tfile2'
		drop if _merge == 1
		drop _merge
		save `tfile6', replace /*}}}*/
	/*Control BTM{{{*/
	use `tfile5', clear
		merge m:1 idcntry idteach idlink using `tfile3'
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
		save `tfile3' , replace/*}}}*/
	/*Control BTS{{{*/
	use `tfile5', clear
		merge m:1 idcntry idteach idlink using `tfile4'
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
		save `tfile4', replace
	/*}}}*/
	/*Combine BCG BSG BTM BTS{{{*/
	use `tfile6', replace
		merge 1:1 idcntry idstud using `tfile3' , nogen
		merge 1:1 idcntry idstud using `tfile4' , nogen
		gen str3 cntry = "`z'"
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
	save `tfile6', replace
	/*Merge by Countries{{{*/
	if  "`z'" == "`fcntry'" {
		save "`path'timssw2.dta", replace
		continue
	}
	append using "`path'timssw2.dta"/*}}}*/
	save "`path'timssw2.dta", replace
} /*}}}*/
