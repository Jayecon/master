/*Set Country list{{{*/
	/*Set Input Lists for Wave 1(35 Countries){{{*/
	local clist1 aus aut can col cyp csk dnk fra deu grc hkg hun isl irn irl isr kor kwt lva ltu nld nzl nor prt rom rus sco sgp slv svn esp swe che tha usa
	/*}}}*/
	/*Set Input Lists for Wave 2(34 Countries){{{*/
	local clist2 aus bgr can chl twn cyp cze fin hkg hun idn irn isr ita jor kor lva ltu mkd mda mar mys nld nzl phl rom rus sgp svk svn tha tun tur usa
	/*}}}*/
	/*Set Input Lists for Wave 3(46 Countries){{{*/
	local clist3 arm aus bhr bwa bgr chl twn cyp egy eng est gha hkg hun idn irn isr ita jpn jor kor lva lbn ltu mkd mys mda mar nld nzl nor pse phl rom rus sau sco scg sgp svk svn zaf swe syr tun usa
	/*}}}*/
	/*Set Input Lists for Wave 4(47 Countries + England and Scottland){{{*/
	local clist4 dza arm aus bhr bih bwa bgr twn col cyp cze egy eng slv geo gha hkg hun idn irn isr ita jpn jor kor kwt lbn ltu mys mlt mng mar nor omn pse qat rom rus sau sco scg sgp svn swe syr tha tun ukr usa
	/*}}}*/
	/*Set Input Lists for Wave 5(42 Countries){{{*/
	local clist5 arm aus bhr chl twn eng fin geo gha hkg hun idn irn isr ita jpn jor kaz kor lbn ltu mkd mys mar nzl nor omn pse qat rom rus sau sgp svn swe syr tha tun tur ukr are usa
	/*}}}*/
	/*Set Input Lists for Wave 6(39 Countires){{{*/
	local clist6 aus bhr bwa can chl twn egy eng geo hkg hun irn irl isr ita jpn jor kaz kor kwt lbn ltu mys mlt mar nzl nor omn qat rus sau sgp svn zaf swe tha tur are usa
	/*}}}*/
/*}}}*/
cd c:\timss
set more off
forvalue k=1/6 {
	/*foreach j of local clist`k'{*/
	foreach j of local clist`k'{
		/*Set input list{{{*/
		if `k' == 1  & "`j'" == "aut"{
			local typmlist comsiz parbrn paredu posses 
			local regmlist i.comsiz i.parbrn i.paredu i.posses 
			local typslist comsiz parbrn paredu posses clssiz 
			local regslist i.comsiz i.parbrn i.paredu i.posses i.clssiz 
		}
		else if `k' == 1  & "`j'" == "can"{
			local typmlist comsiz parbrn paredu posses tcmedu clmsiz 
			local regmlist i.comsiz i.parbrn i.paredu i.posses i.tcmedu i.clmsiz 
			local typslist comsiz parbrn paredu posses tcsedu 
			local regslist i.comsiz i.parbrn i.paredu i.posses i.tcsedu 
		}
		else if `k' == 1  & "`j'" == "col"{
			local typmlist comsiz parbrn paredu posses tcmedu 
			local regmlist i.comsiz i.parbrn i.paredu i.posses i.tcmedu 
			local typslist comsiz parbrn paredu posses tcsedu 
			local regslist i.comsiz i.parbrn i.paredu i.posses i.tcsedu 
		}
		else if `k' == 1  & "`j'" == "cyp"{
			local typmlist comsiz parbrn paredu posses tcmedu clmsiz 
			local regmlist i.comsiz i.parbrn i.paredu i.posses i.tcmedu i.clmsiz 
			local typslist comsiz parbrn paredu posses tcsedu 
			local regslist i.comsiz i.parbrn i.paredu i.posses i.tcsedu 
		}
		else if `k' == 1  & "`j'" == "dnk"{
			local typmlist comsiz parbrn paredu posses clmsiz 
			local regmlist i.comsiz i.parbrn i.paredu i.posses i.clmsiz 
			local typslist comsiz parbrn paredu posses clssiz 
			local regslist i.comsiz i.parbrn i.paredu i.posses i.clssiz 
		}
		else if `k' == 1  & "`j'" == "fra"{
			local typmlist comsiz paredu posses tcmedu clmsiz 
			local regmlist i.comsiz i.paredu i.posses i.tcmedu i.clmsiz 
			local typslist comsiz paredu posses tcsedu clssiz 
			local regslist i.comsiz i.paredu i.posses i.tcsedu i.clssiz 
		}
		else if `k' == 1  & "`j'" == "aut"{
			local typmlist comsiz parbrn paredu posses clmsiz 
			local regmlist i.comsiz i.parbrn i.paredu i.posses i.clmsiz 
			local typslist comsiz parbrn paredu posses clssiz 
			local regslist i.comsiz i.parbrn i.paredu i.posses i.clssiz 
		}
		else if `k' == 1  & "`j'" == "kwt"{
			local typmlist parbrn paredu posses tcmedu clmsiz 
			local regmlist i.parbrn i.paredu i.posses i.tcmedu i.clmsiz 
			local typslist parbrn paredu posses tcsedu clssiz 
			local regslist i.parbrn i.paredu i.posses i.tcsedu i.clssiz 
		}
		else if `k' == 1  & "`j'" == "che"{
			local typmlist comsiz parbrn paredu posses tcmedu 
			local regmlist i.comsiz i.parbrn i.paredu i.posses i.tcmedu 
			local typslist comsiz parbrn paredu posses tcsedu 
			local regslist i.comsiz i.parbrn i.paredu i.posses i.tcsedu 
		}
		else if `k' == 1  & "`j'" == "tha"{
			local typmlist comsiz parbrn paredu posses tcmedu 
			local regmlist i.comsiz i.parbrn i.paredu i.posses i.tcmedu 
			local typslist comsiz parbrn paredu posses tcsedu 
			local regslist i.comsiz i.parbrn i.paredu i.posses i.tcsedu 
		}
		else if `k' == 1  & "`j'" == "usa"{
			local typmlist comsiz parbrn paredu posses tcmedu 
			local regmlist i.comsiz i.parbrn i.paredu i.posses i.tcmedu 
			local typslist comsiz parbrn paredu posses tcsedu 
			local regslist i.comsiz i.parbrn i.paredu i.posses i.tcsedu 
		}
		else if `k' == 2  & "`j'" == "aut"{
			local typmlist comsiz parbrn paredu posses tcmedu clmsiz 
			local regmlist i.comsiz i.parbrn i.paredu i.posses i.tcmedu i.clmsiz 
			local typslist comsiz parbrn paredu posses tcsedu clssiz 
			local regslist i.comsiz i.parbrn i.paredu i.posses i.tcsedu i.clssiz 
		}
		else if `k' == 2  & "`j'" == "can"{
			local typmlist comsiz parbrn paredu posses tcmedu clmsiz 
			local regmlist i.comsiz i.parbrn i.paredu i.posses i.tcmedu i.clmsiz 
			local typslist comsiz parbrn paredu posses tcsedu 
			local regslist i.comsiz i.parbrn i.paredu i.posses i.tcsedu 
		}
		else if `k' == 2  & "`j'" == "sgp"{
			local typmlist parbrn paredu posses tcmedu clmsiz 
			local regmlist i.parbrn i.paredu i.posses i.tcmedu i.clmsiz 
			local typslist parbrn paredu posses tcsedu clssiz 
			local regslist i.parbrn i.paredu i.posses i.tcsedu i.clssiz 
		}
		else if `k' == 3  & "`j'" == "lbn"{
			local typmlist comsiz parbrn paredu posses clmsiz 
			local regmlist i.comsiz i.parbrn i.paredu i.posses i.clmsiz 
			local typslist comsiz parbrn paredu posses clssiz 
			local regslist i.comsiz i.parbrn i.paredu i.posses i.clssiz 
		}
		else if `k' == 4  & "`j'" == "dza"{
			local typmlist comsiz paredu posses tcmedu clmsiz 
			local regmlist i.comsiz i.paredu i.posses i.tcmedu i.clmsiz 
			local typslist comsiz paredu posses tcsedu clssiz 
			local regslist i.comsiz i.paredu i.posses i.tcsedu i.clssiz 
		}
		else if `k' == 4  & "`j'" == "eng"{
			local typmlist comsiz parbrn posses tcmedu clmsiz 
			local regmlist i.comsiz i.parbrn i.posses i.tcmedu i.clmsiz 
			local typslist comsiz parbrn posses tcsedu clssiz 
			local regslist i.comsiz i.parbrn i.posses i.tcsedu i.clssiz 
		}
		else if `k' == 4  & "`j'" == "sgp"{
			local typmlist parbrn paredu posses tcmedu clmsiz 
			local regmlist i.parbrn i.paredu i.posses i.tcmedu i.clmsiz 
			local typslist parbrn paredu posses tcsedu clssiz 
			local regslist i.parbrn i.paredu i.posses i.tcsedu i.clssiz 
		}
		else if `k' == 4  & "`j'" == "hun"{
			local typmlist comsiz parbrn paredu posses clmsiz 
			local regmlist i.comsiz i.parbrn i.paredu i.posses i.clmsiz 
			local typslist comsiz parbrn paredu posses clssiz 
			local regslist i.comsiz i.parbrn i.paredu i.posses i.clssiz 
		}
		else if `k' == 4  & "`j'" == "sco"{
			local typmlist comsiz parbrn posses tcmedu clmsiz 
			local regmlist i.comsiz i.parbrn i.posses i.tcmedu i.clmsiz 
			local typslist comsiz parbrn posses tcsedu clssiz 
			local regslist i.comsiz i.parbrn i.posses i.tcsedu i.clssiz 
		}
		else if `k' == 5  & "`j'" == "sgp"{
			local typmlist parbrn paredu posses tcmedu clmsiz 
			local regmlist i.parbrn i.paredu i.posses i.tcmedu i.clmsiz 
			local typslist parbrn paredu posses tcsedu clssiz 
			local regslist i.parbrn i.paredu i.posses i.tcsedu i.clssiz 
		}
		else if `k' == 6  & "`j'" == "sgp"{
			local typmlist parbrn paredu posses tcmedu clmsiz 
			local regmlist i.parbrn i.paredu i.posses i.tcmedu i.clmsiz 
			local typslist parbrn paredu posses tcsedu clssiz 
			local regslist i.parbrn i.paredu i.posses i.tcsedu i.clssiz 
		}
		else {
			local typmlist comsiz parbrn paredu posses tcmedu clmsiz 
			local regmlist i.comsiz i.parbrn i.paredu i.posses i.tcmedu i.clmsiz 
			local typslist comsiz parbrn paredu posses tcsedu clssiz 
			local regslist i.comsiz i.parbrn i.paredu i.posses i.tcsedu i.clssiz 
		}
		/*}}}*/
		use `j'w`k' , clear
	/*Gen Effort for Math Score{{{*/
		disp " Wave `k' Country `j' {{{"
		/*Gen Type*/
		bys `typmlist': gen mattyp = 1 if _n ==1
			replace mattyp = sum(mattyp)
		bys `typmlist': gen matfrq = _N
		/*Calaulate ehat of i,t*/
			regress mat01 `regmlist' [pw=totwgt]
			predict xbmat if e(sample), xb
			predict resmat if e(sample), residual
		/*Calaulate Actual Residual Standard Deviation of i,t*/
		qui gen ardmat = .
		qui levelsof mattyp , local(mtlist)
		foreach i of local mtlist {
			qui sum resmat if mattyp == `i'
			qui replace ardmat = r(sd) if mattyp == `i'
		}
		/*Calaulate Smoothed Residual Standard Deviation of i,t*/
		regress ardmat `regmlist' [pw=totwgt]
		predict smdmat if e(sample), xb
		/*Calaulate Type Heterogeniety of i,t*/
		sum matfrq , meanonly
		qui gen sig1 = matfrq/r(N)
		bys mattyp : gen mtag_n = _n
		bys mattyp : gen mtag_N = _N
		bys mattyp : gen mtag_l = (mtag_n ==mtag_N)
		qui gen sig2 = smdmat^2
		qui gen sig3 = sig1*sig2
		qui gen sig4 = sum(sig3) if mtag_l
		sum sig4 , meanonly
		local ssigmamat = sqrt(r(max))
		qui gen shtmat = resmat*(1-(`ssigmamat'/smdmat))
		qui gen sig5 = ardmat^2
		qui gen sig6 = sig1*sig5
		qui gen sig7 = sum(sig6) if mtag_l
		sum sig7 , meanonly
		local asigmamat = sqrt(r(max))
		qui gen ahtmat = resmat*(1-(`asigmamat'/ardmat))
		qui drop sig?
		qui drop mtag_?/*}}}*/
	/*Gen Effort for Science Score{{{*/
		/*Gen Type*/
		bys `typslist': gen scityp = 1 if _n ==1
			replace scityp = sum(scityp)
		bys `typslist': gen scifrq = _N
		/*Calaulate ehat of i,t*/
		qui levelsof scityp , local(stlist)
			regress sci01 `regslist' [pw=totwgt]
			predict xbsci if e(sample), xb
			predict double ressci if e(sample), residual
		/*Calaulate Actual Residual Standard Deviation of i,t*/
		gen ardsci = .
		foreach i of local stlist {
			qui sum ressci if scityp == `i'
			qui replace ardsci = r(sd) if scityp == `i'
		}
		/*Calaulate Smoothed Residual Standard Deviation of i,t*/
		regress ardsci `regslist' [pw=totwgt]
		predict smdsci if e(sample), xb
		/*Calaulate Type Heterogeniety of i,t*/
		sum scifrq , meanonly
		qui gen sig1 = scifrq/r(N)
		bys scityp : gen stag_n = _n
		bys scityp : gen stag_N = _N
		bys scityp : gen stag_l = (stag_n ==stag_N)
		qui gen sig2 = smdsci^2
		qui gen sig3 = sig1*sig2
		qui gen sig4 = sum(sig3) if stag_l
		sum sig4 , meanonly
		local ssigmasci = sqrt(r(max))
		qui gen shtsci = ressci*(1-(`ssigmasci'/smdsci))
		qui gen sig5 = smdsci^2
		qui gen sig6 = sig1*sig5
		qui gen sig7 = sum(sig6) if stag_l
		sum sig7 , meanonly
		local asigmasci = sqrt(r(max))
		qui gen ahtsci = ressci*(1-(`asigmasci'/ardsci))
		qui drop sig?
		qui drop stag_?/*}}}*/
	save `j'rg`k' , replace
	disp "}}}"
	}
}
