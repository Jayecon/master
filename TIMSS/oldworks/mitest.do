capture mkdir c:\timss\mi
cd c:\timss\mi
/*Set input list{{{*/
	/*Set Common Input Lists {{{*/
	local dlist bcg bsg btm bts bst
	/*}}}*/
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
	use c:\timss\korw1 , clear
	mi set flongsep kormi1
	mi register imputed clmsiz clssiz comsiz parbrn posses tcmedu tcsedu paredu stdsex
	mi register regular id*
	mi impute chained ///
		(ologit) clssiz ///
		(ologit) clmsiz ///
		(ologit) comsiz ///
		(ologit) parbrn ///
		(ologit) posses ///
		(ologit) tcmedu ///
		(ologit) tcsedu ///
		(ologit) paredu ///
		(ologit) stdsex = c.*num c.*age c.*yox, augment add(1) rseed(1234) force
