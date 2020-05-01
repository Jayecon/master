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
forvalue k= 3/4 {
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
		disp "Wave `k' ; Country `j' Shapley Decomposition of the Gini index {{{"
		use `j'rg`k' , clear
			disp "Subject Math ; Model Base {{{"
			rbdineq `typmlist', dep(mat01) index(gini) hsize(totwgt) dregres(0)
			disp"}}}"
			disp "Subject Math ; Model ARSD {{{"
			rbdineq `typmlist' ahtmat, dep(mat01) index(gini) hsize(totwgt) dregres(0)
			disp"}}}"
			disp "Subject Math ; Model SRSD {{{"
			rbdineq `typmlist' shtmat, dep(mat01) index(gini) hsize(totwgt) dregres(0)
			disp"}}}"
			disp "Subject Science ; Model Base {{{"
			rbdineq `typslist', dep(sci01) index(gini) hsize(totwgt) dregres(0)
			disp"}}}"
			disp "Subject Science ; Model ARSD {{{"
			rbdineq `typslist' ahtsci, dep(sci01) index(gini) hsize(totwgt) dregres(0)
			disp"}}}"
			disp "Subject Science ; Model SRSD {{{"
			rbdineq `typslist' shtsci, dep(sci01) index(gini) hsize(totwgt) dregres(0)
			disp"}}}"
		disp"}}}"
	}
}
