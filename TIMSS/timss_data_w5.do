local path E:\Works\TIMSS\Stata\
tempfile tfile1 tfile2 tfile3 tfile4 tfile5 tfile6 tfile7
/*Set input list{{{*/
local dlist bcg bsg btm bts bst
/*42 Countries for 8th Grades in TIMSS 2011*/
local clist arm aus bhr chl twn eng fin geo gha hkg ///
			hun idn irn isr ita jpn jor kaz kor lbn ///
			ltu mkd mys mar nzl nor omn pse qat rom ///
			rus sau sgp svn swe syr tha tun tur ukr ///
			are usa
local fcntry : word 1 of `clist'
/*Set ID Input List{{{*/
local bcgidlist idcntry	idschool
local bsgidlist idcntry	idschool	idstud
local btmidlist idcntry	idschool			idteach	idlink
local btsidlist idcntry	idschool			idteach	idlink
local bstidlist idcntry				idstud	idteach	idlink
/*}}}*/
/*Set File Specific Input Lists {{{*/
local bcgvlist bcbg05a bcbg07 bcbg01
local bsgvlist  ///
	bsssci01 bsssci02 bsssci03 bsssci04 bsssci05  ///
	bsmmat01 bsmmat02 bsmmat03 bsmmat04 bsmmat05  ///
	bsbg03 bsbg09a bsdage itsex ///
	bsbg04 bsbg05a bsbg05b bsbg05d  bsbg05e ///
	bsbg06a bsbg06b bsdgedup ///
	bsbg08a bsbg08b
local btmvlist btbg04 btbg03 btbg02 btbg12 btbg01
local btsvlist btbg04 btbg03 btbg02 btbg12 btbg01
/*}}}*/
/*Set Rename Vars list{{{*/
local bcgrvlist comsiz sccnum scsnum
local bsgrvlist ///
	pv1scie pv2scie pv3scie pv4scie pv5scie ///
	pv1math pv2math pv3math pv4math pv5math ///
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
foreach z of local clist {
/*Renaming and Missing Value Control{{{*/
local fcntry : word 1 of `clist'
	/*BCG file{{{*/
	use "`path'bcg`z'm5.dta", clear
		rename _all , lower
		mvdecode bcbg05a, mv(9=.)
		mvdecode bcbg01, mv(99999=.)
		mvdecode bcbg07, mv(999=.)
		keep `bcgidlist' `bcgvlist' `bcgwlist'
			rename (`bcgvlist') (`bcgrvlist')
			save `tfile1', replace
	/*}}}*/
	/*BSG file{{{*/
	use "`path'bsg`z'm5.dta", clear
		rename _all , lower
		mvdecode bsbg03, 	mv(9=. \ 8=.)
		mvdecode bsbg09a, 	mv(9=. \ 8=.)
		mvdecode bsdage,   	mv(99=. \ 98=.)
		mvdecode itsex,   	mv(9=. \ 8=.)
		mvdecode bsbg04, 	mv(9=. \ 8=. )
		mvdecode bsbg05a,  	mv(9=. \ 8=.)
		mvdecode bsbg05b,  	mv(9=. \ 8=.)
		mvdecode bsbg05d,  	mv(9=. \ 8=.)
		mvdecode bsbg05e,  	mv(9=. \ 8=.)
		mvdecode bsbg06a, 	mv(99=. \ 98=. \ 8=.)
		mvdecode bsbg06b, 	mv(99=. \ 98=. \ 8=.)
		mvdecode bsdgedup, 	mv(99=. \ 96=. \ 6=.)
		mvdecode bsbg08a, 	mv(9=. \ 8=.)
		mvdecode bsbg08b, 	mv(9=. \ 8=.)
		keep `bsgidlist' `bsgvlist' `bsgwlist'
			rename (`bsgvlist') (`bsgrvlist')
			recode stdsex (2=0)
		save `tfile2', replace/*}}}*/
	/*BTM file{{{*/
	use "`path'btm`z'm5.dta", clear
		rename _all , lower
		mvdecode btbg04, mv(9=. \ 8=.)
		mvdecode btbg03, mv(9=. \ 8=.)
		mvdecode btbg02, mv(9=. \ 8=.)
		mvdecode btbg01, mv(99=. \ 98=.)
		mvdecode btbg12, mv(999=. \ 998=.)
		keep `btmidlist' `btmvlist' `btmwlist'
			rename (`btmvlist') (`btmrvlist')
		save `tfile3', replace /*}}}*/
	/*BTS file{{{*/
	use "`path'bts`z'm5.dta", clear
		rename _all , lower
		mvdecode btbg04, mv(9=. \ 8=.)
		mvdecode btbg03, mv(9=. \ 8=.)
		mvdecode btbg02, mv(9=. \ 8=.)
		mvdecode btbg01, mv(99=. \ 98=.)
		mvdecode btbg12, mv(999=. \ 998=.)
		keep `btsidlist' `btsvlist' `btswlist'
			rename (`btsvlist') (`btsrvlist')
			save `tfile4', replace/*}}}*/
	/*BST file{{{*/
	use "`path'bst`z'm5.dta", clear
			rename _all , lower
			keep `bstidlist'
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
save "~/dropbox/timssr5.dta", replace
