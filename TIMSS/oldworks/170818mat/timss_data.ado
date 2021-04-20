/*Set Data Path {{{*/
	clear
	local path_input C:\TIMSS\Stata`c(dirsep)'
	mkdir c:\temp
	cd c:\temp
	local path_output C:\Users`c(dirsep)'`c(username)'\Dropbox\Stata\TIMSS\Oh`c(dirsep)'
/*}}}*/
/*Set input list{{{*/
	/*Set Common Input Lists {{{*/
	local dlist bcg bsg btm bts bst
		/*Set ID Input List{{{*/
		local bcgidlist idcntry  idschool
		local bsgidlist idcntry  idschool idstud
		local btmidlist idcntry  idschool idteach
		local btsidlist idcntry  idschool idteach
		local bstidlist idcntry  idstud   idteach
		/*}}}*/
		/*Set Rename Vars list*//*{{{*/
		local bcgrvlist comsiz
		local bsgrvlist ///
			sci01 sci02 sci03 sci04 sci05 ///
			mat01 mat02 mat03 mat04 mat05 ///
			stdlng stdbrn stdage stdsex ///
			hombok homcom ///
			mtredu ftredu paredu ///
			mtrbrn ftrbrn
		local btmrvlist tcmedu tcmage tcmsex tcmyox clmsiz
		local btsrvlist tcsedu tcsage tcssex tcsyox clssiz
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
	local bcgvlist1 bcbgcomm
	local bsgvlist1 ///
		bsspv01 bsspv02 bsspv03 bsspv04 bsspv05 ///
		bsmpv01 bsmpv02 bsmpv03 bsmpv04 bsmpv05 ///
		bsbglang bsbgbrn1 bsdage itsex ///
		bsbgbook bsbgps02 ///
		bsbgedum bsbgeduf bsdgedup ///
		bsbgbrnm bsbgbrnf
	local btmvlist1 btbgeduc btbgage btbgsex btbgtaug btdcsize
	local btsvlist1 btbgeduc btbgage btbgsex btbgtaug btdcsize
	/*}}}*/
	/*Set Input Lists for Wave 2(34 Countries){{{*/
	local clist2 aus bgr can chl twn cyp cze fin hkg hun idn irn isr ita jor kor lva ltu mkd mda mar mys nld nzl phl rom rus sgp svk svn tha tun tur usa
	local bcgvlist2 bcbgcomm
	local bsgvlist2 ///
		bsssci01 bsssci02 bsssci03 bsssci04 bsssci05 ///
		bsmmat01 bsmmat02 bsmmat03 bsmmat04 bsmmat05 ///
		bsbglang bsbgbrn1 bsdage itsex ///
		bsbgbook bsbgps02 ///
		bsbgedmo bsbgedfa bsdgedup ///
		bsbgbrnm bsbgbrnf
	local btmvlist2 btbgeduc btbgage btbgsex btbgtaug btdmsize
	local btsvlist2 btbgeduc btbgage btbgsex btbgtaug btdssize
	local bstvlist2 /*}}}*/
	/*Set Input Lists for Wave 3(46 Countries){{{*/
	local clist3 arm aus bhr bwa bgr chl twn cyp egy eng est gha hkg hun idn irn isr ita jpn jor kor lva lbn ltu mkd mys mda mar nld nzl nor pse phl rom rus sau sco scg sgp svk svn zaf swe syr tun usa
	local bcgvlist3 bcbgcomu
	local bsgvlist3 ///
		bsssci01 bsssci02 bsssci03 bsssci04 bsssci05 ///
		bsmmat01 bsmmat02 bsmmat03 bsmmat04 bsmmat05 ///
		bsbgolan bsbgborn bsdage itsex ///
		bsbgbook bsbgps02 ///
		bsbgmfed bsbgfmed bsdgedup ///
		bsbgmbrn bsbgfbrn
	local btmvlist3 btbgfedc btbgage btbgsex btbgtaut btdmstud
	local btsvlist3 btbgfedc btbgage btbgsex btbgtaut btdsstud
	/*}}}*/
	/*Set Input Lists for Wave 4(48 Countries){{{*/
	local clist4 dza arm aus bhr bih bwa bgr twn col cyp cze egy slv geo gha hkg hun idn irn isr ita jpn jor kor kwt lbn ltu mys mlt mng mar nor omn pse qat rom rus sau scg sgp svn swe syr tha tun ukr tur usa
	local bcgvlist4 bc4gcomu
	local bsgvlist4 ///
		bsssci01 bsssci02 bsssci03 bsssci04 bsssci05  ///
		bsmmat01 bsmmat02 bsmmat03 bsmmat04 bsmmat05  ///
		bs4golan bs4gborn bsdage itsex ///
		bs4gbook bs4gth02 ///
		bs4gmfed bs4gfmed bsdgedup ///
		bs4gmbrn bs4gfbrn  ///
	local btmvlist4 bt4gfedc bt4gage bt4gsex bt4gtaut btdmstud
	local btsvlist4 bt4gfedc bt4gage bt4gsex bt4gtaut btdsstud
	/*}}}*/
	/*Set Input Lists for Wave 5(42 Countries){{{*/
	local clist5 arm aus bhr chl twn eng fin geo gha hkg hun idn irn isr ita jpn jor kaz kor lbn ltu mkd mys mar nzl nor omn pse qat rom rus sau sgp svn swe syr tha tun tur ukr are usa
	local bcgvlist5 bcbg05a
	local bsgvlist5  ///
		bsssci01 bsssci02 bsssci03 bsssci04 bsssci05  ///
		bsmmat01 bsmmat02 bsmmat03 bsmmat04 bsmmat05  ///
		bsbg03 bsbg09a bsdage itsex ///
		bsbg04 bsbg05a  ///
		bsbg06a bsbg06b bsdgedup ///
		bsbg08a bsbg08b  ///
	local btmvlist5 btbg04 btbg03 btbg02 btbg01 btbg12
	local btsvlist5 btbg04 btbg03 btbg02 btbg01 btbg12
	/*}}}*/
	/*Set Input Lists for Wave 6(39 Countires){{{*/
	local clist6 aus bhr bwa can chl twn egy eng geo hkg hun irn irl isr ita jpn jor kaz kor kwt lbn ltu mys mlt mar nzl nor omn qat rus sau sgp svn zaf swe tha tur are usa
	local bcgvlist6 bcbg05a
	local bsgvlist6  ///
		bsssci01 bsssci02 bsssci03 bsssci04 bsssci05  ///
		bsmmat01 bsmmat02 bsmmat03 bsmmat04 bsmmat05  ///
		bsbg03 bsbg10a bsdage itsex ///
		bsbg04 bsbg06a  ///
		bsbg07a bsbg07b bsdgedup ///
		bsbg09a bsbg09b  ///
	local btmvlist6 btbg04 btbg03 btbg02 btbg01 btbg12
	local btsvlist6 btbg04 btbg03 btbg02 btbg01 btbg12
	/*}}}*/
/*}}}*/
/*Missing Value Control{{{*/
foreach y of local dlist {
	if "`y'" == "bcg" {
		foreach z of local clist`k' {
			use "`path_input'`y'`z'm`k'.dta", clear
				rename _all , lower
				if `k' == 1 {
				mvdecode bcbgcomm, mv(9=. \ 8=. \ 99=.) 
				}
				else if `k' == 2 {
					mvdecode bcbgcomm, mv(9=. \ 8=. \ 99=.) 
				}
				else if `k' == 3 {
					mvdecode bcbgcomu, mv(9=. \ 8=. \ 99=.) 
				}
				else if `k' == 4 {
					mvdecode bc4gcomu, mv(9=. \ 8=. \ 99=.) 
				}
				else if `k' == 5 {
					mvdecode bcbg05a, mv(9=. \ 8=. \ 6=.\ 99=.) 
				}
				else if `k' == 6 {
					mvdecode bcbg05a, mv(9=. \ 99=.) 
				}
			keep ``y'idlist' ``y'vlist`k'' ``y'wlist' 
				rename (``y'vlist`k'') (``y'rvlist')
				tempname `y'`z'temp`k'
				save "``y'`z'temp`k''", replace; 
		}
	}
	else if "`y'" == "bsg" {
		foreach z of local clist`k' {
			use "`path_input'`y'`z'm`k'.dta", clear
				rename _all , lower
				if `k' == 1 {
					mvdecode bsbglang, 	mv(9=. \ 8=.)
						mvdecode bsbgbrn1, 	mv(9=. \ 8=.)
						mvdecode bsdage,   	mv(99=. \ 98=.)
						mvdecode itsex,   	mv(9=. \ 8=.)
						mvdecode bsbgbook, 	mv(9=. \ 8=.)
						mvdecode bsbgps02, 	mv(99=. \ 98=.)
						mvdecode bsbgedum, 	mv(99=. \ 98=. \ 7=.)
					mvdecode bsbgeduf, 	mv(99=. \ 98=. \ 7=.)
						mvdecode bsdgedup, 	mv(9=. \ 8=. \ 4=.)
						mvdecode bsbgbrnm, 	mv(9=. \ 8=. )
						mvdecode bsbgbrnf, 	mv(9=. \ 8=. )
				}
				else if `k' == 2 {
					mvdecode bsbglang, 	mv(9=. \ 8=.)
						mvdecode bsbgbrn1, 	mv(9=. \ 8=.)
						mvdecode bsdage,   	mv(99=. \ 98=.)
						mvdecode itsex,   	mv(9=. \ 8=.)
						mvdecode bsbgbook, 	mv(9=. \ 8=.)
						mvdecode bsbgps02, 	mv(99=. \ 98=.)
						mvdecode bsbgedmo, 	mv(99=. \ 98=. \ 8=.)
						mvdecode bsbgedfa, 	mv(99=. \ 98=. \ 8=.)
						mvdecode bsdgedup, 	mv(9=. \ 8=. \ 5=.)
						mvdecode bsbgbrnm, 	mv(9=. \ 8=. \ 4=.)
						mvdecode bsbgbrnf, 	mv(9=. \ 8=. \ 4=.)
				}
				else if `k' == 3 {
					mvdecode bsbgolan, 	mv(9=. \ 8=.)
						mvdecode bsbgborn, 	mv(9=. \ 8=.)
						mvdecode bsdage,   	mv(99=. \ 98=.)
						mvdecode itsex,   	mv(9=. \ 8=.)
						mvdecode bsbgbook, 	mv(9=. \ 8=.)
						mvdecode bsbgps02, 	mv(99=. \ 98=.)
						mvdecode bsbgmfed, 	mv(99=. \ 98=. \ 9=.)
						mvdecode bsbgfmed, 	mv(99=. \ 98=. \ 9=.)
						mvdecode bsdgedup, 	mv(9=. \ 8=. )
						mvdecode bsbgmbrn, 	mv(9=. \ 8=. )
						mvdecode bsbgfbrn, 	mv(9=. \ 8=. )
				}
				else if `k' == 4 {
					mvdecode bs4golan, 	mv(9=. \ 8=.)
						mvdecode bs4gborn, 	mv(9=. \ 8=.)
						mvdecode bsdage,   	mv(99=. \ 98=.)
						mvdecode itsex,   	mv(9=. \ 8=.)
						mvdecode bs4gbook, 	mv(9=. \ 8=.)
						mvdecode bs4gth02, 	mv(99=. \ 98=.)
						mvdecode bs4gmfed, 	mv(99=. \ 98=. \ 8=.);  
					mvdecode bs4gfmed, 	mv(99=. \ 98=. \ 8=.); 
					mvdecode bsdgedup, 	mv(9=. \ 8=. \ 6=.)
						mvdecode bs4gmbrn, 	mv(9=. \ 8=. )
						mvdecode bs4gfbrn, 	mv(9=. \ 8=. )
				}
				else if `k' == 5 {
					mvdecode bsbg03, 	mv(9=. \ 8=.)
						mvdecode bsbg09a, 	mv(9=. \ 8=.)
						mvdecode bsdage,   	mv(99=. \ 98=.)
						mvdecode itsex,   	mv(9=. \ 8=.)
						mvdecode bsbg04, 	mv(9=. \ 8=. \ 5=.)
						mvdecode bsbg05a,  	mv(9=. \ 8=.)
						mvdecode bsbg06a, 	mv(99=. \ 98=. \ 8=.)
						mvdecode bsbg06b, 	mv(99=. \ 98=. \ 8=.)
						mvdecode bsdgedup, 	mv(9=. \ 8=. \ 6=.)
						mvdecode bsbg08a, 	mv(9=. \ 8=.)
						mvdecode bsbg08b, 	mv(9=. \ 8=.)
				}
				else if `k' == 6 {
					mvdecode bsbg03, 	mv(9=. )
						mvdecode bsbg10a, 	mv(9=. )
						mvdecode bsdage,   	mv(99=. )
						mvdecode itsex,   	mv(9=. )
						mvdecode bsbg04, 	mv(9=. )
						mvdecode bsbg06a, 	mv(99=. )
						mvdecode bsbg07a, 	mv(99=. \ 8=.)
						mvdecode bsbg07b, 	mv(99=. \ 8=.)
						mvdecode bsdgedup, 	mv(9=.  \ 6=.)
						mvdecode bsbg09a, 	mv(9=. \ 3=. )
						mvdecode bsbg09b, 	mv(9=. \ 3=. )
				}
			keep ``y'idlist' ``y'vlist`k'' ``y'wlist' 
				rename (``y'vlist`k'') (``y'rvlist')
				recode stdsex (2=0) ; 
			tempname `y'`z'temp`k'
				save "``y'`z'temp`k''", replace; 
		}
	}
	else if "`y'" == "btm" {
		foreach z of local clist`k' {
			use "`path_input'`y'`z'm`k'.dta", clear
				rename _all , lower
				if `k' == 1 {
					mvdecode btbgeduc, mv(99=. \ 98=.) 
						mvdecode btbgage, mv(99=. \ 98=.)
						mvdecode btbgsex, mv(9=. \ 8=.) 
						mvdecode btbgtaug, mv(99=. \ 98=.)
						mvdecode btdcsize, mv(9999=. \ 9998=. \ 9996=.) 
				}
				else if `k' == 2 {
					mvdecode btbgeduc, mv(99=. \ 98=.) 
						mvdecode btbgage, mv(999=. \ 998=.)
						mvdecode btbgsex, mv(99=. \ 98=.) 
						mvdecode btbgtaug, mv(999=. \ 998=.)
						mvdecode btdmsize, mv(9999=. \ 9998=. \ 9996=.) 
				}
				else if `k' == 3 {
					mvdecode btbgfedc, mv(99=. \ 98=.) 
						mvdecode btbgage, mv(999=. \ 998=.)
						mvdecode btbgsex, mv(99=. \ 98=.) 
						mvdecode btbgtaut, mv(99=. \ 98=.)
						mvdecode btdmstud, mv(999=. \ 998=.) 
				}
				else if `k' == 4 {
					mvdecode bt4gfedc, mv(99=. \ 98=.) 
						mvdecode bt4gage, mv(999=. \ 998=.)
						mvdecode bt4gsex, mv(99=. \ 98=.) 
						mvdecode bt4gtaut, mv(99=. \ 98=.)
						mvdecode btdmstud, mv(999=. \ 998=.) 
				}
				else if `k' == 5 {
					mvdecode btbg04, mv(9=. \ 8=.) 
						mvdecode btbg03, mv(9=. \ 8=.)
						mvdecode btbg02, mv(9=. \ 8=.) 
						mvdecode btbg01, mv(99=. \ 98=.)
						mvdecode btbg12, mv(999=. \ 998=.) 
				}
				else if `k' == 6 {
					mvdecode btbg04, mv(99=. ) 
						mvdecode btbg03, mv(9=. )
						mvdecode btbg02, mv(9=. ) 
						mvdecode btbg01, mv(99=. )
						mvdecode btbg12, mv(99=. ) 
				}
			keep ``y'idlist' ``y'vlist`k'' ``y'wlist' 
				rename (``y'vlist`k'') (``y'rvlist')
				tempname `y'`z'temp`k'
				save "``y'`z'temp`k''", replace
		}
	}
	else if "`y'" == "bts" {
		foreach z of local clist`k' {
			use "`path_input'`y'`z'm`k'.dta", clear
				rename _all , lower
				if `k' == 1 {
					mvdecode btbgeduc, mv(99=. \ 98=.) 
						mvdecode btbgage, mv(99=. \ 98=.)
						mvdecode btbgsex, mv(9=. \ 8=.) 
						mvdecode btbgtaug, mv(99=. \ 98=.)
						mvdecode btdcsize, mv(9999=. \ 9998=. \ 9996=.) 
				}
				else if `k' == 2 {
					mvdecode btbgeduc, mv(99=. \ 98=.) 
						mvdecode btbgage, mv(99=. \ 98=.)
						mvdecode btbgsex, mv(9=. \ 8=.) 
						mvdecode btbgtaug, mv(99=. \ 98=.)
						mvdecode btdssize, mv(9999=. \ 9998=. \ 9996=.) 
				}
				else if `k' == 3 {
					mvdecode btbgfedc, mv(99=. \ 98=.) 
						mvdecode btbgage, mv(999=. \ 998=.)
						mvdecode btbgsex, mv(99=. \ 98=.) 
						mvdecode btbgtaut, mv(99=. \ 98=.)
						mvdecode btdsstud, mv(999=. \ 998=.) 
				}
				else if `k' == 4 {
					mvdecode bt4gfedc, mv(99=. \ 98=.) 
						mvdecode bt4gage, mv(999=. \ 998=.)
						mvdecode bt4gsex, mv(99=. \ 98=.) 
						mvdecode bt4gtaut, mv(99=. \ 98=.)
						mvdecode btdsstud, mv(999=. \ 998=.) 
				}
				else if `k' == 5 {
					mvdecode btbg04, mv(9=. \ 8=.) 
						mvdecode btbg03, mv(9=. \ 8=.)
						mvdecode btbg02, mv(9=. \ 8=.) 
						mvdecode btbg01, mv(99=. \ 98=.)
						mvdecode btbg12, mv(999=. \ 998=.) 
				}
				else if `k' == 6 {
					mvdecode btbg04, mv(99=. ) 
						mvdecode btbg03, mv(9=. )
						mvdecode btbg02, mv(9=. ) 
						mvdecode btbg01, mv(99=. )
						mvdecode btbg12, mv(99=. ) 
				}
			keep ``y'idlist' ``y'vlist`k'' ``y'wlist' 
				rename (``y'vlist`k'') (``y'rvlist')
				tempname `y'`z'temp`k'
				save "``y'`z'temp`k''", replace; }
	}
	else if "`y'" == "bst" {
		foreach z of local clist`k' {
			use "`path_input'`y'`z'm`k'.dta", clear
				rename _all , lower
				keep ``y'idlist' 
				tempname `y'`z'temp`k'
				save "``y'`z'temp`k''", replace; 
		}
	}
}
/*}}}*/
foreach k of local anything {/*{{{*/
	local fcntry : word 1 of `clist`k''
		foreach y of local clist`k' {
			disp "Country: `y' Wave: `k'"
				use "`bcg`y'temp`k''", clear
				merge 1:m idcntry idschool using "`bsg`y'temp`k''" 
				drop if _merge == 1
				drop _merge 
				tempfile `y'temp`k' 
				save "``y'temp`k''", replace; 
				use "`bst`y'temp`k''", clear
				merge m:1 idcntry idteach idlink using "`btm`y'temp`k''"  
				drop if _merge == 2
				drop _merge 
				mvdecode idschool, mv(999999=. ) 
				drop if missing(idschool) ; 
			drop idteach idlink ; 
			bys idstud : gen nu = _n 
				sum nu , meanonly ; local tcmmax = r(max)
				reshape wide `btmrvlist' , i(idstud) j(nu) 
				tempfile btm`y'tmp`k' 
				order _all , alpha 
				foreach j of local btmrvlist {
					egen `j' = rowmean(`j'1-`j'`tcmmax')
						drop `j'1-`j'`tcmmax' 
				}
			recode tcrsexm (2=0) ; 
			save "`btm`y'tmp`k''", replace; 
			*save bstbtm`y'w`k' , replace 
				use "`bst`y'temp`k''", clear
				merge m:1 idcntry idteach idlink using "`bts`y'temp`k''" 
				drop if _merge == 2
				drop _merge 
				mvdecode idschool, mv(999999=. ) 
				drop if missing(idschool) ; 
			drop idteach idlink ; 
			bys idstud : gen nu = _n 
				sum nu , meanonly ; local tcsmax = r(max)
				reshape wide `btsrvlist' , i(idstud) j(nu) 
				tempfile bts`y'tmp`k' 
				order _all , alpha 
				foreach j of local btsrvlist {
					egen `j' = rowmean(`j'1-`j'`tcsmax')
						drop `j'1-`j'`tcsmax' 
				}
			recode tcrsexs (2=0) ; 
			save "`bts`y'tmp`k''", replace; 
			*save bstbts`y'w`k' , replace 
				use "``y'temp`k''", replace; 
			merge 1:1 idcntry idstud using "`btm`y'tmp`k''" , nogen
				*save bcgbsgbtm`y'w`k' , replace 
				merge 1:1 idcntry idstud using "`bts`y'tmp`k''" , nogen
				gen str3 cntry = "`y'"; label variable cntry "COUNTRY 3CHAR"
				gen byte wave = `k'; label variable wave "WAVE NUMBER"
				order _all, alphabetic
				compress
				save "``y'temp`k''", replace; 
			*save all`y'w`k' , replace 

				order _all , first 
				order wave cntry id* , first 

				keep if inlist(cntry , "dza" , "fra" ) | (mtrbrn == 1 & ftrbrn == 1) ; 
			replace cntry == "cze" if cntry == "csk" 
				replace idcntry == 203 if cntry == 200 

				if  "`y'" == "`fcntry'" {; 
					save "`path_input'timssw`k'.dta", replace
						saveold "`path_input'timssw`k'_v11.dta", replace; 
					continue ; 
				}

			append using "`path_input'timssw`k'.dta" 

				save "`path_input'timssw`k'.dta", replace
				saveold "`path_input'timssw`k'_v11.dta", replace
		}
}/*}}}*/
