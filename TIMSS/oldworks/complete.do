	/*Set Common Input Lists {{{*/
	local path_input E:\Works\TIMSS\Stata/
	local dlist bcg bsg btm bts bst
		/*Set ID Input List{{{*/
		local bcgidlist idcntry	idschool
		local bsgidlist idcntry	idschool	idstud
		local btmidlist idcntry	idschool			idteach	idlink
		local btsidlist idcntry	idschool			idteach	idlink
		local bstidlist idcntry				idstud	idteach	idlink
		/*}}}*/
		/*Set Rename Vars list{{{*/
		local bcgrvlist comsiz
		local bsgrvlist ///
			sci01 sci02 sci03 sci04 sci05 ///
			mat01 mat02 mat03 mat04 mat05 ///
			stdlng stdbrn stdage stdsex ///
			hombok homcom ///
			mtredu ftredu paredu ///
			mtrbrn ftrbrn
		local btmrvlist tcmedu tcmage tcmsex clmsiz tcmyox 
		local btsrvlist tcsedu tcsage tcssex clssiz tcsyox 
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
	local btmvlist1 btbgeduc btbgage btbgsex btdcsize btbgtaug
	local btsvlist1 btbgeduc btbgage btbgsex btdcsize btbgtaug
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
	local btmvlist2 btbgeduc btbgage btbgsex btdmsize btbgtaug
	local btsvlist2 btbgeduc btbgage btbgsex btdssize btbgtaug
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
	/*Set Input Lists for Wave 4(47 Countries + England and Scottland){{{*/
	local clist4 dza arm aus bhr bih bwa bgr twn col cyp cze egy eng slv geo gha hkg hun idn irn isr ita jpn jor kor kwt lbn ltu mys mlt mng mar nor omn pse qat rom rus sau sco scg sgp svn swe syr tha tun ukr usa
	local bcgvlist4 bc4gcomu
	local bsgvlist4 ///
		bsssci01 bsssci02 bsssci03 bsssci04 bsssci05  ///
		bsmmat01 bsmmat02 bsmmat03 bsmmat04 bsmmat05  ///
		bs4golan bs4gborn bsdage itsex ///
		bs4gbook bs4gth02 ///
		bs4gmfed bs4gfmed bsdgedup ///
		bs4gmbrn bs4gfbrn  
	local btmvlist4 bt4gfedc bt4gage bt4gsex btdmstud bt4gtaut
	local btsvlist4 bt4gfedc bt4gage bt4gsex btdsstud bt4gtaut
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
		bsbg08a bsbg08b  
	local btmvlist5 btbg04 btbg03 btbg02 btbg12 btbg01
	local btsvlist5 btbg04 btbg03 btbg02 btbg12 btbg01
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
		bsbg09a bsbg09b  
	local btmvlist6 btbg04 btbg03 btbg02 btbg12 btbg01
	local btsvlist6 btbg04 btbg03 btbg02 btbg12 btbg01
	/*}}}*/
cd c:/timss/complete
set more off
forvalue i=1/6{
	foreach j of local dlist {
		foreach k of local clist`i' {
			use `path_input'`j'`k'm`i' , clear
			foreach l of varlist _all {
				sum `l' , meanonly
				if r(N) < c(N) {
					drop `l'
				}
			}
			rename _all , low
			drop id*
			save `j'`k'c`i', replace
		}
	}
}
