local path E:\Works\TIMSS\Stata\ 
tempfile tfile1 tfile2 tfile3 tfile4 tfile5 tfile6 tfile7
/*Set input list{{{*/
local dlist bcg bsg btm bts bst
/*35 Countries for 8th Grades in TIMSS 1995*/
local clist aus aut can col cyp csk dnk fra deu grc ///
			hkg hun isl irn irl isr kor kwt lva ltu ///
			nld nzl nor prt rom rus sco sgp slv svn ///
			esp swe che tha usa
local fcntry : word 1 of `clist'
/*Set ID Input List{{{*/
local bcgidlist idcntry	idschool
local bsgidlist idcntry	idschool	idstud
local btmidlist idcntry	idschool			idteach	idlink
local btsidlist idcntry	idschool			idteach	idlink
local bstidlist idcntry				idstud	idteach	idlink
/*}}}*/
/*Set File Specific Input Lists {{{*/
local bcgvlist bcbgcomm bcbgftte bcbgptte bcbgcom1 bcbgbenr bcbggenr
local bsgvlist ///
	bsspv01 bsspv02 bsspv03 bsspv04 bsspv05 ///
	bsmpv01 bsmpv02 bsmpv03 bsmpv04 bsmpv05 ///
	bsbglang bsbgbrn1 bsdage itsex ///
	bsbgbook bsbgps01 bsbgps02 bsbgps03 bsbgps04 ///
	bsbgedum bsbgeduf bsdgedup ///
	bsbgbrnm bsbgbrnf
local btmvlist btbgeduc btbgage btbgsex btdcsize btbgtaug
local btsvlist btbgeduc btbgage btbgsex btdcsize btbgtaug
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
foreach z of local clist {
/*Renaming and Missing Value Control{{{*/
	/*BCG file{{{*/
	use "`path'bcg`z'm1.dta", clear
		rename _all , lower
		mvdecode bcbgcomm, mv(9=. \ 8=. \ 99=.)
		mvdecode bcbgftte, mv(998=.)	/*GEN\NUMBER OF FULL-TIME TEACHERS */
		mvdecode bcbgptte, mv(998=.)	/*GEN\NUMBER OF PART-TIME TEACHERS*/
		mvdecode bcbgcom1, mv(998=.)	/*GEN\COMPUTERS\AVAILABLE*/
		mvdecode bcbgbenr, mv(9998=.)	/*GEN\TOTAL SCHOOL ENROLLMENT\BOYS */
		mvdecode bcbggenr, mv(9998=.)	/*GEN\TOTAL SCHOOL\ENROLLMENT\GIRLS */
		keep `bcgidlist' `bcgvlist' `bcgwlist'
			rename (`bcgvlist') (`bcgrvlist')
			save `tfile1', replace
	/*}}}*/
	/*BSG file{{{*/
	use "`path'bsg`z'm1.dta", clear
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
		keep `bsgidlist' `bsgvlist' `bsgwlist'
			rename (`bsgvlist') (`bsgrvlist')
			save `tfile2', replace/*}}}*/
	/*BTM file{{{*/
	use "`path'btm`z'm1.dta", clear
		rename _all , lower
		mvdecode btbgeduc, mv(99=. \ 98=.)
		mvdecode btbgage, mv(99=. \ 98=.)
		mvdecode btbgsex, mv(9=. \ 8=.)
		mvdecode btbgtaug, mv(99=. \ 98=.)
		mvdecode btdcsize, mv(9999=. \ 9998=. \ 9996=.)
		keep `btmidlist' `btmvlist' `btmwlist'
			rename (`btmvlist') (`btmrvlist')
		save `tfile3', replace/*}}}*/
	/*BTS file{{{*/
	use "`path'bts`z'm1.dta", clear
		rename _all , lower
		mvdecode btbgeduc, mv(99=. \ 98=.)
		mvdecode btbgage, mv(99=. \ 98=.)
		mvdecode btbgsex, mv(9=. \ 8=.)
		mvdecode btbgtaug, mv(99=. \ 98=.)
		mvdecode btdcsize, mv(9999=. \ 9998=. \ 9996=.)
		keep `btsidlist' `btsvlist' `btswlist'
			rename (`btsvlist') (`btsrvlist')
			save `tfile4', replace/*}}}*/
	/*BST file{{{*/
	use "`path'bst`z'm1.dta", clear
		rename _all , lower
		keep `bstidlist'  `bstwlist'
		save `tfile5', replace/*}}}*/
/*}}}*/
/*Merge Files{{{*/
disp "Country: `z'"
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
		replace cntry = "cze" if cntry == "csk"	/*CSK exception*/
		replace idcntry = 203 if idcntry == 200		/*CSK exception*//*}}}*/
	save `tfile6', replace
	/*Merge by Countries{{{*/
	if  "`z'" == "`fcntry'" {
		save `tfile7' , replace
		continue
	}
	append using `tfile7'
	save `tfile7' , replace /*}}}*/
/*}}}*/
}
/*Merge with the Country List{{{*/
drop cntry
rename idcntry cntcod
destring cntcod , replace
merge m:1 cntcod using ~/git/etc/countrycode_1.dta 
	drop if _merge == 2
	drop _merge
	compress
/*}}}*/
/*Generating Parent Highest Education{{{*/
drop paredu
egen paredu = rowmax(mtredu  ftredu)
label var paredu "GEN\HIGHEST EUDC LEVEL\PARENTS"
local edulabel : value label ftredu
label value paredu `edulabel'
/*}}}*/
save "~/dropbox/timssr1.dta", replace
