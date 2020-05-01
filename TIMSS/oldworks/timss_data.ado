clear
/*TIMSS95 Data Merge{{{*/
local dlist bcg bsa bsg bsr btm bts bst
local clist aus aut can col cyp csk dnk fra deu grc hkg hun isl irn irl isr kor kwt lva ltu nld nzl nor prt rom rus sco sgp slv svn esp swe che tha usa
foreach y of local dlist {
	if "`y'" == "bcg" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSCHOOL
		local vlist BCBGLSIZ BCBGST01
		local rvlist schpop stdmtr
		local wlist SCHWGT 
		foreach z of local clist {
			use "`path_input'`y'`z'm1.dta", clear
			keep `idlist' `vlist' `wlist'
			rename (`vlist') (`rvlist')
			rename _all , lower
			save "`path_output'`y'`z'm1.dta", replace }
	}/*}}}*/
	else if "`y'" == "bsa" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSCHOOL IDCLASS IDSTUD IDBOOK 
		local vlist ITSEX BISCISCR BIMATSCR
		local rvlist ITSEX BSSSCI01 BSMMAT01
		local wlist TOTWGT HOUWGT SENWGT 
		foreach z of local clist {
			use "`path_input'`y'`z'm1.dta", clear
			keep `idlist' `vlist' `wlist'
			rename (`vlist') (`rvlist')
			rename _all , lower
			save "`path_output'`y'`z'm1.dta", replace }
	}/*}}}*/
	else if "`y'" == "bsg" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSCHOOL IDCLASS IDSTUD IDBOOK 
		local vlist BSBGLANG BSBGBRN1 BSBGBOOK BSBGEDUM BSBGEDUF BSDAGE
		local rvlist stdlng stdimg stdbok mtredu ftredu stdage
		local wlist TOTWGT HOUWGT SENWGT 
		foreach z of local clist {
			use "`path_input'`y'`z'm1.dta", clear
			keep `idlist' `vlist' `wlist'
			rename (`vlist') (`rvlist')
			rename _all , lower
			save "`path_output'`y'`z'm1.dta", replace }
	}/*}}}*/
	else if "`y'" == "btm" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSCHOOL IDTEACH 
		local vlist BTBGEDUC BTDMTOEN
		local rvlist mtcqul mtcpop
		foreach z of local clist {
			use "`path_input'`y'`z'm1.dta", clear
			keep `idlist' `vlist' 
			rename (`vlist') (`rvlist')
			replace mtcqul = . if mtcqul >= 98
			replace mtcpop = . if mtcpop >= 998
			rename _all , lower
			save "`path_output'`y'`z'm1.dta", replace }
	}/*}}}*/
	else if "`y'" == "bts" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSCHOOL IDTEACH 
		local vlist BTBGEDUC BTDSTOEN
		local rvlist stcqul stcpop
		foreach z of local clist {
			use "`path_input'`y'`z'm1.dta", clear
			keep `idlist' `vlist' 
			rename (`vlist') (`rvlist')
			rename _all , lower
			replace stcqul = . if stcqul >= 98
			replace stcpop = . if stcpop >= 998
			save "`path_output'`y'`z'm1.dta", replace }
	}/*}}}*/
	else if "`y'" == "bst" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSTUD IDTEACH 
		foreach z of local clist {
			use "`path_input'`y'`z'm1.dta", clear
			keep `idlist' 
			rename _all , lower
			save "`path_output'`y'`z'm1.dta", replace }
	}/*}}}*/
}		
/*}}}*/
/*TIMSS99 Data Merge{{{*/
local dlist bcg bsa bsg bsr btm bts bst
local clist aus bgr can chl twn cyp cze fin hkg hun idn irn isr ita jor kor lva ltu mkd mda mar mys nld nzl phl rom rus sgp svk svn tha tun tur usa
foreach y of local dlist {
	if "`y'" == "bcg" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSCHOOL
		local vlist BCBGCOMM BCBGST01
		local rvlist schpop stdmtr
		local wlist SCHWGT 
		foreach z of local clist {
			use "`path_input'`y'`z'm2.dta", clear
			keep `idlist' `vlist' `wlist'
			rename (`vlist') (`rvlist')
			rename _all , lower   
			save "`path_output'`y'`z'm2.dta", replace }
	}/*}}}*/
	else if "`y'" == "bsa" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSCHOOL IDCLASS IDSTUD IDBOOK 
		local vlist ITSEX BSSSCI01 BSMMAT01
		local wlist TOTWGT HOUWGT SENWGT 
		foreach z of local clist {
			use "`path_input'`y'`z'm2.dta", clear
			keep `idlist' `vlist' `wlist'
			rename _all , lower
			save "`path_output'`y'`z'm2.dta", replace }
	}/*}}}*/
	else if "`y'" == "bsg" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSCHOOL IDCLASS IDSTUD IDBOOK 
		local vlist BSBGLANG BSBGBRN1 BSBGBOOK BSBGEDMO BSBGEDFA BSDAGE 
		local rvlist stdlng stdimg stdbok mtredu ftredu stdage 
		local wlist TOTWGT HOUWGT SENWGT 
		foreach z of local clist {
			use "`path_input'`y'`z'm2.dta", clear
			keep `idlist' `vlist' `wlist'
			rename (`vlist') (`rvlist')
			rename _all , lower
			save "`path_output'`y'`z'm2.dta", replace }
	}/*}}}*/
	else if "`y'" == "btm" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSCHOOL IDTEACH 
		local vlist BTBGEDUC BTDMTOEN
		local rvlist mtcqul mtcpop
		foreach z of local clist {
			use "`path_input'`y'`z'm2.dta", clear
			keep `idlist' `vlist' 
			rename (`vlist') (`rvlist')
			rename _all , lower
			replace mtcqul = . if mtcqul >= 98
			replace mtcpop = . if mtcpop >= 998
			save "`path_output'`y'`z'm2.dta", replace }
	}/*}}}*/
	else if "`y'" == "bts" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSCHOOL IDTEACH 
		local vlist BTBGEDUC BTDSTOEN
		local rvlist stcqul stcpop
		foreach z of local clist {
			use "`path_input'`y'`z'm2.dta", clear
			keep `idlist' `vlist' 
			rename (`vlist') (`rvlist')
			rename _all , lower
			replace stcqul = . if stcqul >= 98
			replace stcpop = . if stcpop >= 998
			save "`path_output'`y'`z'm2.dta", replace }
	}/*}}}*/
	else if "`y'" == "bst" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSTUD IDSCHOOL IDTEACH IDCLASS
		foreach z of local clist {
			use "`path_input'`y'`z'm2.dta", clear
			keep `idlist' 
			rename _all , lower
			save "`path_output'`y'`z'm2.dta", replace }
	}/*}}}*/
}		
/*}}}*/
/*TMISS03 Data Merge{{{*/
local dlist bcg bsa bsg bsr btm bts bst
local clist arm aus bhr bwa bgr chl twn cyp egy eng est gha hkg hun idn irn isr ita jpn jor kor lva lbn ltu mkd mys mda mar nld nzl nor pse phl rom rus sau sco scg sgp svk svn zaf swe syr tun usa
foreach y of local dlist {
	if "`y'" == "bcg" {/*{{{*/
		local idlist idcntry idpop idschool
		local vlist bcbgcomu bcbgst01
		local rvlist schpop stdmtr
		local wlist schwgt 
		foreach z of local clist {
			use "`path_input'`y'`z'm3.dta", clear
			keep `idlist' `vlist' `wlist'
			rename (`vlist') (`rvlist')
			rename _all , lower
			save "`path_output'`y'`z'm3.dta", replace }
	}/*}}}*/
	else if "`y'" == "bsa" {/*{{{*/
		local idlist idcntry idpop idschool idclass idstud idbook 
		local vlist itsex bsssci01 bsmmat01
		local wlist totwgt houwgt senwgt 
		foreach z of local clist {
			use "`path_input'`y'`z'm3.dta", clear
			keep `idlist' `vlist' `wlist'
			rename _all , lower
			save "`path_output'`y'`z'm3.dta", replace }
	}/*}}}*/
	else if "`y'" == "bsg" {/*{{{*/
		local idlist idcntry idpop idschool idclass idstud idbook 
		local vlist bsbgolan bsbgbook bsbgborn bsbgmfed bsbgfmed bsdage
		local rvlist stdlng stdbok stdimg mtredu ftredu stdage
		local wlist totwgt houwgt senwgt 
		foreach z of local clist {
			use "`path_input'`y'`z'm3.dta", clear
			rename _all , lower
			keep `idlist' `vlist' `wlist'
			rename (`vlist') (`rvlist')
			save "`path_output'`y'`z'm3.dta", replace }
	}/*}}}*/
	else if "`y'" == "btm" {/*{{{*/
		local idlist idcntry idpop idschool idteach idlink
		local vlist btbgfedc btbmstud
		local rvlist MTCQUL MTCPOP
		foreach z of local clist {
			use "`path_input'`y'`z'm3.dta", clear
			keep `idlist' `vlist' 
			rename (`vlist') (`rvlist')
			rename _all , lower
			replace mtcqul = . if mtcqul >= 98
			replace mtcpop = . if mtcpop >= 998
			save "`path_output'`y'`z'm3.dta", replace }
	}/*}}}*/
	else if "`y'" == "bts" {/*{{{*/
		local idlist idcntry idpop idschool idteach idlink
		local vlist btbgfedc btbsstud
		local rvlist stcqul stcpop
		foreach z of local clist {
			use "`path_input'`y'`z'm3.dta", clear
			keep `idlist' `vlist' 
			rename (`vlist') (`rvlist')
			rename _all , lower
			replace stcqul = . if stcqul >= 98
			replace stcpop = . if stcpop >= 998
			save "`path_output'`y'`z'm3.dta", replace }
	}/*}}}*/
	else if "`y'" == "bst" {/*{{{*/
		local idlist idcntry idpop idschool idstud idteach idclass
		foreach z of local clist {
			use "`path_input'`y'`z'm3.dta", clear
			keep `idlist' 
			rename _all , lower
			save "`path_output'`y'`z'm3.dta", replace }
	}/*}}}*/
}		
/*}}}*/
/*TIMSS07 Data Merge{{{*/
local dlist bcg bsa bsg bsr btm bts bst
local clist dza arm aus bhr bih bwa bgr twn col cyp cze egy slv geo gha hkg hun idn irn isr ita jpn jor kor kwt lbn ltu mys mlt mng mar nor omn pse qat rom rus sau scg sgp svn swe syr tha tun ukr usa
foreach y of local dlist {
	if "`y'" == "bcg" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSCHOOL
		local vlist BC4GCOMU BC4GST01
		local rvlist SCHPOP STDMTR
		local wlist SCHWGT 
		foreach z of local clist {
			use "`path_input'`y'`z'm5.dta", clear
			keep `idlist' `vlist' `wlist'
			rename (`vlist') (`rvlist')
			rename _all , lower
			save "`path_output'`y'`z'm5.dta", replace }
	}/*}}}*/
	else if "`y'" == "bsa" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSCHOOL IDCLASS IDSTUD IDBOOK 
		local vlist ITSEX BSSSCI01 BSMMAT01
		local wlist TOTWGT HOUWGT SENWGT 
		foreach z of local clist {
			use "`path_input'`y'`z'm5.dta", clear
			keep `idlist' `vlist' `wlist'
			rename _all , lower
			save "`path_output'`y'`z'm5.dta", replace }
	}/*}}}*/
	else if "`y'" == "bsg" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSCHOOL IDCLASS IDSTUD IDBOOK 
		local vlist BS4GOLAN BS4GBORN BS4GBOOK BS4GMFED BS4GFMED BSDAGE
		local rvlist STDLNG STDIMG STDBOK MTREDU FTREDU STDAGE
		local wlist TOTWGT HOUWGT SENWGT 
		foreach z of local clist {
			use "`path_input'`y'`z'm5.dta", clear
			keep `idlist' `vlist' `wlist'
			rename (`vlist') (`rvlist')
			rename _all , lower
			save "`path_output'`y'`z'm5.dta", replace }
	}/*}}}*/
	else if "`y'" == "btm" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSCHOOL IDTEACH 
		local vlist BT4GFEDC BT4MSTUD
		local rvlist MTCQUL MTCPOP
		foreach z of local clist {
			use "`path_input'`y'`z'm5.dta", clear
			keep `idlist' `vlist' 
			rename (`vlist') (`rvlist')
			rename _all , lower
			replace mtcqul = . if mtcqul >= 98
			replace mtcpop = . if mtcpop >= 998
			save "`path_output'`y'`z'm5.dta", replace }
	}/*}}}*/
	else if "`y'" == "bts" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSCHOOL IDTEACH 
		local vlist BT4GFEDC BT4SSTUD
		local rvlist STCQUL STCPOP
		foreach z of local clist {
			use "`path_input'`y'`z'm5.dta", clear
			keep `idlist' `vlist' 
			rename (`vlist') (`rvlist')
			rename _all , lower
			replace stcqul = . if stcqul >= 98
			replace stcpop = . if stcpop >= 998
			save "`path_output'`y'`z'm5.dta", replace }
	}/*}}}*/
	else if "`y'" == "bst" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSCHOOL IDSTUD IDTEACH IDCLASS
		foreach z of local clist {
			use "`path_input'`y'`z'm5.dta", clear
			keep `idlist' 
			rename _all , lower
			save "`path_output'`y'`z'm5.dta", replace }
	}/*}}}*/
}		
/*}}}*/
/*TIMSS11 Data Merge{{{*/
local dlist bcg bsa bsg bsr btm bts bst
local clist arm aus bhr chl twn eng fin geo gha hkg hun idn irn isr ita jpn jor kaz kor lbn ltu mkd mys mar nzl nor omn pse qat rom rus sau sgp svn swe syr tha tun tur ukr are usa
foreach y of local dlist {
	if "`y'" == "bcg" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSCHOOL
		local vlist BCBG05A BCBG09AA
		local rvlist SCHPOP STDMTR
		local wlist SCHWGT 
		foreach z of local clist {
			use "`path_input'`y'`z'm5.dta", clear
			keep `idlist' `vlist' `wlist'
			rename (`vlist') (`rvlist')
			rename _all , lower
			save "`path_output'`y'`z'm5.dta", replace }
	}/*}}}*/
	else if "`y'" == "bsa" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSCHOOL IDCLASS IDSTUD IDBOOK 
		local vlist ITSEX BSSSCI01 BSMMAT01
		local wlist TOTWGT HOUWGT SENWGT 
		foreach z of local clist {
			use "`path_input'`y'`z'm5.dta", clear
			keep `idlist' `vlist' `wlist'
			rename _all , lower
			save "`path_output'`y'`z'm5.dta", replace }
	}/*}}}*/
	else if "`y'" == "bsg" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSCHOOL IDCLASS IDSTUD IDBOOK 
		local vlist BSBG03 BSBG09A BSBG04 BSBG06A BSBG06B BSDAGE
		local rvlist STDLNG STDIMG STDBOK MTREDU FTREDU STDAGE
		local wlist TOTWGT HOUWGT SENWGT 
		foreach z of local clist {
			use "`path_input'`y'`z'm5.dta", clear
			keep `idlist' `vlist' `wlist'
			rename (`vlist') (`rvlist')
			rename _all , lower
			save "`path_output'`y'`z'm5.dta", replace }
	}/*}}}*/
	else if "`y'" == "btm" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSCHOOL IDTEACH 
		local vlist BTBG04 BTBG12
		local rvlist MTCQUL MTCPOP
		foreach z of local clist {
			use "`path_input'`y'`z'm5.dta", clear
			keep `idlist' `vlist' 
			rename (`vlist') (`rvlist')
			rename _all , lower
			replace mtcqul = . if mtcqul >= 98
			replace mtcpop = . if mtcpop >= 998
			save "`path_output'`y'`z'm5.dta", replace }
	}/*}}}*/
	else if "`y'" == "bts" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSCHOOL IDTEACH 
		local vlist BTBG04 BTBG12
		local rvlist STCQUL STCPOP
		foreach z of local clist {
			use "`path_input'`y'`z'm5.dta", clear
			keep `idlist' `vlist' 
			rename (`vlist') (`rvlist')
			rename _all , lower
			replace stcqul = . if stcqul >= 98
			replace stcpop = . if stcpop >= 998
			save "`path_output'`y'`z'm5.dta", replace }
	}/*}}}*/
	else if "`y'" == "bst" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSCHOOL IDSTUD IDTEACH IDCLASS
		foreach z of local clist {
			use "`path_input'`y'`z'm5.dta", clear
			keep `idlist' 
			rename _all , lower
			save "`path_output'`y'`z'm5.dta", replace }
	}/*}}}*/
}		
/*}}}*/
/*TMISS15 Data Merge{{{*/
local dlist bcg bsa bsg bsr btm bts bst
local clist aus bhr bwa can chl twn egy eng geo hkg hun irn irl isr ita jpn jor kaz kor kwt lbn ltu mys mlt mar nzl nor omn qat rus sau sgp svn zaf swe tha tur are usa
foreach y of local dlist {
	if "`y'" == "bcg" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSCHOOL
		local vlist BCBG05A BCBG13AA
		local rvlist SCHPOP STDMTR
		local wlist SCHWGT 
		foreach z of local clist {
			use "`path_input'`y'`z'm6.dta", clear
			keep `idlist' `vlist' `wlist'
			rename (`vlist') (`rvlist')
			rename _all , lower
			save "`path_output'`y'`z'm6.dta", replace }
	}/*}}}*/
	else if "`y'" == "bsa" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSCHOOL IDCLASS IDSTUD IDBOOK 
		local vlist ITSEX BSSSCI01 BSMMAT01
		local wlist TOTWGT HOUWGT SENWGT 
		foreach z of local clist {
			use "`path_input'`y'`z'm6.dta", clear
			keep `idlist' `vlist' `wlist'
			rename _all , lower
			save "`path_output'`y'`z'm6.dta", replace }
	}/*}}}*/
	else if "`y'" == "bsg" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSCHOOL IDCLASS IDSTUD IDBOOK 
		local vlist BSBG03 BSBG10A BSBG04 BSBG07A BSBG07B BSDAGE
		local rvlist STDLNG STDIMG STDBOK MTREDU FTREDU STDAGE
		local wlist TOTWGT HOUWGT SENWGT 
		foreach z of local clist {
			use "`path_input'`y'`z'm6.dta", clear
			keep `idlist' `vlist' `wlist'
			rename (`vlist') (`rvlist')
			rename _all , lower
			save "`path_output'`y'`z'm6.dta", replace }
	}/*}}}*/
	else if "`y'" == "btm" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSCHOOL IDTEACH 
		local vlist BTBG04 BTBG12
		local rvlist MTCQUL MTCPOP
		foreach z of local clist {
			use "`path_input'`y'`z'm6.dta", clear
			keep `idlist' `vlist' 
			rename (`vlist') (`rvlist')
			rename _all , lower
			replace mtcqul = . if mtcqul >= 98
			replace mtcpop = . if mtcpop >= 998
			save "`path_output'`y'`z'm6.dta", replace }
	}/*}}}*/
	else if "`y'" == "bts" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSCHOOL IDTEACH 
		local vlist BTBG04 BTBG12
		local rvlist STCQUL STCPOP
		foreach z of local clist {
			use "`path_input'`y'`z'm6.dta", clear
			keep `idlist' `vlist' 
			rename (`vlist') (`rvlist')
			rename _all , lower
			replace stcqul = . if stcqul >= 98
			replace stcpop = . if stcpop >= 998
			save "`path_output'`y'`z'm6.dta", replace }
	}/*}}}*/
	else if "`y'" == "bst" {/*{{{*/
		local idlist IDCNTRY IDPOP IDSCHOOL IDSTUD IDTEACH IDCLASS
		foreach z of local clist {
			use "`path_input'`y'`z'm6.dta", clear
			keep `idlist' 
			rename _all , lower
			save "`path_output'`y'`z'm6.dta", replace }
	}/*}}}*/
}		
/*}}}*/
