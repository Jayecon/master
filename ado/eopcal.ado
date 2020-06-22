#delimit ;
capture program drop eopcal;
program eopcal, byable(recall) rclass sortpreserve;

/* SYNTAX SETTING {{{*/
syntax varlist(numeric ) [if] [in] [pweight aweight fweight iweight] [using] , ENVironment(varlist numeric )
	[GOIndex RRIndex(passthru) 
	CUMDplot KDENplot XRange(numlist min=2 max=2) YRange(numlist min=2 max=2)
	NOZero REPs(integer 1) TRace(integer 0)] ; /*}}}*/

/* ARGUMENTS CHECKING {{{*/
	/** TRACE ON/OFF {{{*/
	qui capture set trace off ;
	if ("`trace'" != "") {;
		set trace on ;
		set traced `trace' ;
	}; /*}}}*/
	/** WEIGHT CHECK {{{*/
	tempvar wgt ;
	if ("`weight'" == "") {;
		qui gen `wgt' = 1;
		local weight fw ;
		local exp "= `wgt'" ;
	};
	if("`weight'"=="iweight"){ ;
		local wvar=strltrim(subinstr("`exp'","=","",1)) ;
		qui sum `exp' ;
		gen `wgt'=`wvar'/(r(mean)) ;
		local exp="=`wgt'" ;
	};
	if("`weight'"=="fweight" ){;
		local wvar=strltrim(subinstr("`exp'","=","",1)) ;
		qui gen `wgt' = round(`wvar' , 1) ; 
		local exp = "=`wgt'" ;
	};/*}}}*/
	/** CHECK IF THE ENVIRONMENT CONTAINS WRONG VALUE {{{*/
	if "`environment'" != "" {;
		capture levelsof `environment' if `touse' , local(gp);
		foreach x of local gp {;
			if (int(`x') != `x') | (`x' < 0) { ;
				di as error "`environment' should have positive integers only";
				exit 459;
			};
		};
	}; /*}}}*/
	/** CHECK IF THE OPTION RRINDEX HAS THE FORM OF (TYPE , CRITERA) {{{*/
	if `"`rrindex'"' != "" {; 
		local rrindex = strltrim(strltrim(subinstr("`rrindex'" , "rrindex(","",1)));
		local rrindex = strltrim(strltrim(subinstr("`rrindex'" , ")","",1)));
		gettoken rritype rricrit : rrindex, parse(,) ;
		local rritype = strltrim(strrtrim("`rritype'"));
		local rricrit = strltrim(strrtrim(subinstr("`rricrit'" , ",","",1)));
		if("`rritype'" != "type" & "`rritype'" != "percent" & "`rritype'" != "score") {;
			di as error "ERROR in RRindex type." _n "The following values are admitted: type, percent and score.";
			exit ;
		};
		captur confirm number `rricrit' ; 
		if _rc != 0 {;
			di as error "ERROR in RRindex critera." _n "An appropriate number is required";
			exit ;
		};
		local rrindex rrindex ;
	}; /*}}}*/
/*}}}*/

/* MARKER SETTING {{{*/
marksample touse  ;
markout `touse' `environment' ;
	// CHECK IF THE ACHIEVEMENT CONTAINS POSITIVE INTEGER ONLY{{{*/
	if "`nozero'" != "" {;
		count if `varlist' < 0 & `touse' ;
		noi if r(N) > 0 { ;
			di " " ;
			di as txt "Warning: `varlist' has `r(N)' values < 0." _c ;
			di as txt " Not used in calculations" ;
		} ;
		count if `varlist' == 0 & `touse' ;
		noi if r(N) > 0 { ;
			di " " ;
			di as txt "Warning: `varlist' has `r(N)' values = 0." _c ;
			di as txt " Not used in calculations" ;
		} ;
		replace `touse' = 0 if `varlist' <= 0 ;
	}; /*}}}*/
/*}}}*/

/* CALCULATION {{{*/
preserve ;
qui keep if `touse' ;
if ("`reps'" != "") { ; /*BOOTSTRAP SAMPLING*/
	forvalue i = 1/`reps' { ;
	bsample ;
		/* BYABLE SETTING {{{*/
		/*local bylist `_byvars';*/
		/*local bynu : word count `_byvars' ;*/
		/*local excnt = _byindex() ;*/
		/*local bycnt = 1 ;*/
		/*if _by() {;*/
			/*while "`bylist'" == "" {;*/
				/*gettoken byv`bycnt' bylist : bylist ; */
				/*local ++bycnt;*/
				/*}; */
			/*}; */
		/*local idx = _byn1();*/
		/*foreach j of local _byvars {;*/
			/*local l_`j' = `j'[`idx'];*/
			/*};*/
			/*}}}*/
	/* CALCULATION {{{*/
	foreach j in `goindex' `rrindex' {;
		if "`goindex'" != "" {;
			goi `varlist' [`weight' `exp'] , environment(`environment') ;
			return scalar score = `r(index)' ;
			return local idxname "goindex" ;
			return local achname "`varlist'" ;
			return local evnname "`environment'" ;
		};
		if "`rrindex'" != "" {;
			rri `varlist' [`weight' `exp'] , environment(`environment') type(`rritype') crit(`rricrit') ;
			return scalar score = `r(index)' ;
			return scalar diswin = `r(diswin)' ;
			return scalar dispop = `r(dispop)' ;
			return scalar totwin = `r(totwin)' ;
			return scalar totpop = `r(totpop)' ;
			return local idxname "rrindex" ;
			return local achname "`varlist'" ;
			return local evnname "`environment'" ;
		};
		if "`cumdplot'" != "" {;
			cumd `varlist' [`weight' `exp'] , environment(`environment') xrange(`xrange') yrange(`yrange') ;
		};
		if "`kdenplot'" != "" {;
			kden `varlist' [`weight' `exp'] , environment(`environment') xrange(`xrange') yrange(`yrange') ;
		};
		mat stat_`j'`i'=J(1,1,99);
		mat rownames stat_`j'`i'=`j'`i' ;
		mat colnames stat_`j'`i'=`j' ;
		mat stat_`j'`i'[1,1] = r(index) ;
		mat `stat`j''=(nullmat(`stat`j'')\stat_`j'`i') ;
		mat drop stat_`j'`i' ;
	}; /*}}}*/
	restore, preserve ;
	};
};
else {;
		/* BYABLE SETTING {{{*/
		/*local bylist `_byvars';*/
		/*local bynu : word count `_byvars' ;*/
		/*local excnt = _byindex() ;*/
		/*local bycnt = 1 ;*/
		/*if _by() {;*/
			/*while "`bylist'" == "" {;*/
				/*gettoken byv`bycnt' bylist : bylist ; */
				/*local ++bycnt;*/
				/*}; */
			/*}; */
		/*local idx = _byn1();*/
		/*foreach j of local _byvars {;*/
			/*local l_`j' = `j'[`idx'];*/
			/*};*/
			/*}}}*/
		/* CALCULATION {{{*/
		foreach j in `goindex' `rrindex' {;
			if "`goindex'" != "" {;
				goi `varlist' [`weight' `exp'] , environment(`environment') ;
				return scalar score = `r(index)' ;
				return scalar gini = `r(gini)' ;
				return local idxname "goindex" ;
				return local achname "`varlist'" ;
				return local evnname "`environment'" ;
			};
			if "`rrindex'" != "" {;
				rri `varlist' [`weight' `exp'] , environment(`environment') type(`rritype') crit(`rricrit') ;
				return scalar score = `r(index)' ;
				return scalar diswin = `r(diswin)' ;
				return scalar dispop = `r(dispop)' ;
				return scalar totwin = `r(totwin)' ;
				return scalar totpop = `r(totpop)' ;
				return local idxname "rrindex" ;
				return local achname "`varlist'" ;
				return local evnname "`environment'" ;
			};
			if "`cumdplot'" != "" {;
				cumd `varlist' [`weight' `exp'] , environment(`environment') xrange(`xrange') yrange(`yrange') ;
			};
			if "`kdenplot'" != "" {;
				kden `varlist' [`weight' `exp'] , environment(`environment') xrange(`xrange') yrange(`yrange') ;
			};
			mat stat_`j'`i'=J(1,1,99);
			mat rownames stat_`j'`i'=`j'`i' ;
			mat colnames stat_`j'`i'=`j' ;
			mat stat_`j'`i'[1,1] = r(index) ;
			mat `stat`j''=(nullmat(`stat`j'')\stat_`j'`i') ;
			mat drop stat_`j'`i' ;
		}; /*}}}*/
	restore, preserve ;
}; /*}}}*/

	/* PRINTING {{{*/
	foreach j in `goindex' `rrindex' {;
		tempname stat`j' ;
	};
	/*if _by() {;*//*{{{*/
		/*foreach j of local optlist {;*/
			/*local tbynu = `bynu' ;*/
			/*local tnu = `bynu' + 5;*/
			/*mat report_`j'`excnt'=J(1,`tnu',99) ;*/
			/*capture drop `j'idx ;*/
			/*svmat `stat`j'', names(`j'idx);*/
			/*forvalues k = 1/`bynu' {;*/
				/*local l : word `k' of `_byvars' ;*/
				/*mat report_`j'`excnt'[1,`k'] = `l_`l'' ;*/
			/*};*/
			/*qui sum `j'idx ;*/
			/*mat report_`j'`excnt'[1,`++tbynu'] = r(N) ;*/
			/*mat report_`j'`excnt'[1,`++tbynu'] = r(mean) ;*/
			/*mat report_`j'`excnt'[1,`++tbynu'] = r(sd) ;*/
			/*mat report_`j'`excnt'[1,`++tbynu'] = r(min) ;*/
			/*mat report_`j'`excnt'[1,`++tbynu'] = r(max) ;*/
		/*};*/
		/*if _bylastcall() {;*/
			/*foreach j of local optlist {;*/
				/*forvalues i = 1/`excnt' {;*/
					/*mat idx_`j'=(nullmat(idx_`j')\report_`j'`i') ;*/
				/*};*/
				/*mat colnames idx_`j' = `_byvars' itrnum idxmean idxsd min max ;*/
				/*matlist idx_`j' , title(`j') rowtitle(by `environment') ;*/
				/*return matrix `j' = idx_`j';*/
			/*};*/
		/*};*/
	/*};*/
	/*else {;*//*}}}*/
		foreach j in `goindex' `rrindex' {;
			mat report_`j'=J(1, 5 ,99) ;
			capture drop `j'idx ;
			svmat `stat`j'', names(`j'idx);
			qui sum `j'idx ;
				mat report_`j'[1,1] = r(N) ;
				mat report_`j'[1,2] = r(mean) ;
				mat report_`j'[1,3] = r(sd) ;
				mat report_`j'[1,4] = r(min) ;
				mat report_`j'[1,5] = r(max) ;
			mat colnames report_`j' = itrnum idxmean idxsd min max ;
			matlist report_`j' , title(`j')  rowtitle(by `bygroup') ;
			return matrix `j' = report_`j' ;
		};
	/*};*/ /*}}}*/
end;

/* SUB PROGRAM {{{*/

/** GOINDEX PROGRAM {{{*/
capture program drop goi ;
program define goi , rclass; 
	syntax varname [fw aw pw iw] , ENVironment(varlist numeric) ;

tempname envm ginim senm countm populm ;
qui levelsof `environment' , local(typlist) ;
local typnum : word count `typlist' ;
local envvalue : value lable `environment' ;

sum `varlist' [`weight' `exp'] if `touse' , meanonly ;
	local gsumw = r(sum_w);
	local gmean = r(mean);

qui ineqdeco `varlist' [`weight' `exp'] , bygroup(`environment') welfare ;
local ggini = r(gini) ; /* Grand Gini */
local gsen = r(wgini) ; /* Grand Sen's Welfare Mu*(1-Gini) */
forvalues i=1/`typnum'{;
	local j : word `i' of `typlist' ;
	local jlabel : label `envvalue' `j' ;
	matrix `envm'[`i',1]=`j' ;
	matrix `ginim'[`i',1]=r(gini_`j') ;
	matrix `senm'[`i',1]=r(wgini_`j') ;
	qui count if `environment' == `j' ;
	matrix `countm'[`i',1] = r(N) ;
	matrix `populm'[`i',1] = r(sumw_`j')/`gsumw' ;
	local rowname `rowname' `jlabel' ;
} ;
matrix results = (`envm',`ginim',`senm',`countm', `populm') ;
matrix colname results = Env. Gini Sen's  #Obs. %Pop ;
matrix rowname results = `rowname' ;

local count = 1 ;
while (`count' < `typnum') { ;
	local cplus = `count' +1 ;
	forvalues j=`cplus'/`typnum'{ ;
		local go = `go' + `popul'[`count',1]*`popul'[`j',1]*abs(`sen'[`i',1]-`sen'[`j',1]) ;
	} ;
	local count = `i' + 1 ;
} ;
local go = `go'/`gmean' ;
return scalar index = `go' ;
return matrix Results = results ;
end ;
/*}}}*/
/** RRINDEX PROGRAM {{{*/
capture program drop rri ;
program define rri , rclass; 
	syntax varname [fw aw pw iw] , ENVironment(varlist numeric) TYPE(str) CRIT(real) ;

	tempvar one ;

	qui levelsof `environment' , local(typlist) ;
	local typnum : word count `typlist' ;
	local disadv : word 1 of `typlist' ;
	di as txt "We consider the group `disadv' of `environment' as the disadvantaged group";

	gen `one' = 1;
	sum `one' [`weight' `exp'] , meanonly ;
	local totpop = r(sum_w) ; /*Grand Population*/
	sum `one' if `environment' == `disadv' [`weight' `exp'] , meanonly ;
	local dispop = r(sum_w) ; /*Population of the Disadvantage Grouop*/

	if ("`type'" == "score") {;
		sum `one' [`weight' `exp'] if `varlist' >= `crit' , meanonly ;
		local totwin = r(sum_w) ;
		sum `one' if `environment' == `disadv' & `varlist' >= `crit' [`weight' `exp'] , meanonly ;
		local diswin = r(sum_w) ;
	};
	else if ("`type'" == "type") {;
		sum `one' [`weight' `exp'] if `varlist' == `crit' , meanonly ;
		local totwin = r(sum_w) ;
		sum `one' if `environment' == `disadv' & `varlist' == `crit' [`weight' `exp'] , meanonly ;
		local diswin = r(sum_w) ;
	};
	else if ("`type'" == "percent") {;
		local crit = 100 - `crit' ;
		_pctile `varlist' [`weight' `exp'] , p( `crit') ;
		local crit = r(r1);
		sum `one' if `varlist' >= `crit' [`weight' `exp'] , meanonly ;
		local totwin = r(sum_w) ;
		sum `one' if `environment' == `disadv' & `varlist' >= `crit' [`weight' `exp'] , meanonly ;
		local diswin = r(sum_w) ;
	};
	local rr = 1 - (`diswin'/`totwin')/(`dispop'/`totpop') ;
	return scalar index = `rr' ;

	matrix Results =(`disadv' , `type', `crit', `diswin' , `dispop' , `totwin' , `totpop') ;
	matrix colname Results = Disadv.type Succ.type Succ.crit #Succ.&Disadv. #Disadv. #Succ. #Pop ;
	return matrix Results ;
end;
/*}}}*/
/** CUMDPLOT PROGRAM {{{*/
capture program drop cumd;
program define cumd, byable(recall);
	syntax varlist [if] [in] [fw aw pw iw] 
		, ENVironment(varlist numeric) [ XRange(numlist min=2 max=2 >0 ascending) YRange(numlist min=2 max=2 >0 <100 ascending)] ;
	/******************************** LABELING ******************************/
	qui levelsof `environment', local(envlist);
	local lbg : variable label `environment';
	local lbs : variable label `varlist';
	local lbe : value label `environment';
	local lvscnt = 1;
	foreach i of local envlist {;
		local lbv`i' : label `lbe' `i';
		local labels `labels' label(`lvscnt' `lbv`i'') ;
		local ++lvscnt;
		};
	/******************************** GEN CUMUL ******************************/
	foreach i of local envlist {;
		local cvar  c`environment'`i';
		local cvarlist `cvarlist' `cvar';
		local cvar2list `cvar2list' `cvar' `varlist';
		cumul `varlist' [`weight' `exp'] if `environment'==`i', equal gen(c`environment'`i');
		label variable `cvar' `"`lbv`i''"'; 
		};
	/******************************** RANGE RESTRICTION ******************************/
	if `"`yrange'"' != "" {;
		gettoken ymin ymax : yrange ;
		local yymin = `ymin'/100 ;
		local yymax = `ymax'/100 ;
		foreach i of local envlist {;
			qui replace c`environment'`i'=. if `environment' == `i' &
				(c`environment'`i' < `yymin' | c`environment'`i' > `yymax') ; 
			};
		};
	stack `cvar2list', into (c c`environment') wide;
	if `"`xrange'"' != "" {;
		gettoken xmin xmax : xrange ;
		qui replace c`environment'=. if  c`environment'< `xmin' | c`environment'> `xmax' ;
		};
	/******************************** DRAWING ******************************/
	line `cvarlist' c`environment',
		sort ylab(, grid) ytitle("CDF") 
		xlab(, grid) xtitle("`lbs'", size(vlarge))
		legend( region(lpattern(blank) color(none)) pos(5) ring(0) col(1) `labels' );
	/******************************** SAVING ******************************/
	local i = _byindex();
	capture mkdir figure;
	if _by() {;
		graph save "`c(pwd)'`c(dirsep)'figure`c(dirsep)'`environment'_cum_`varlist'_`_byvars'_`i'",replace;
		graph export "`c(pwd)'`c(dirsep)'figure`c(dirsep)'`environment'_cum_`varlist'_`_byvars'_`i'.png", as(png) replace;
	};
	else if _by() == 0 {;
		graph save "`c(pwd)'`c(dirsep)'figure`c(dirsep)'`environment'_cum_`varlist'_",replace;
		graph export "`c(pwd)'`c(dirsep)'figure`c(dirsep)'`environment'_cum_`varlist'.png", as(png) replace;
	};
	end;/*}}}*/
/** KDENPLOT PROGRAM {{{*/
capture program drop kden;
program define kden, byable(recall);
	syntax varname [if] [in] [fw aw pw iw] ,
		ENVironment(varlist numeric) [ Number(integer 500) Kernel(string)
		XRange(numlist min=2 max=2 >0 ascending) YRange(numlist min=2 max=2 >0 <100 ascending)] ;
/******************************** LABELING ******************************/
	qui levelsof `environment', local(envlist);
	local lbg : variable label `environment';
	local lbs : variable label `varlist';
	local lbe : value label `environment';	
	local lvscnt = 1;
	foreach i of local envlist {;
		local lbv`i' : label `lbe' `i';
		local labels `labels' label(`lvscnt' `lbv`i'') ;
		local ++lvscnt;
		};
/******************************** GEN CUMUL ******************************/
	kdensity `varlist' [`weight' `exp'] , n(`number') nograph gen(x c`environment') kernel(`kernel');
	foreach i of local envlist {;
		local cv  c`environment'`i';
		local cvlist `cvlist' `cv';
		kdensity `varlist' [`weight' `exp'] if `environment'==`i', nograph gen(c`environment'`i') at(x) kernel(`kernel');
		label var c`environment'`i' `"`lbv`i''"'; 
		};
	if `"`yrange'"' != "" {;
		gettoken ymin ymax : yrange ;
		local yymin = `ymin'/100 ;
		local yymax = `ymax'/100 ;
		foreach i of local envlist {;
			qui replace c`environment'`i'=. if `environment' == `i' &
				(c`environment'`i' < `yymin' | c`environment'`i' > `yymax') ; 
			};
		};
	if `"`xrange'"' != "" {;
		gettoken xmin xmax : xrange ;
		foreach i of local envlist {;
			qui replace c`environment'=. if  c`environment'< `xmin' | c`environment'> `xmax' ;
		};
	};
/******************************** Drawing ******************************/
	line `cvlist' x ,
	sort ytitle(Density)
		xtitle("`lbs'", size(vlarge))
		legend( region(lpattern(blank) color(none)) pos(1) ring(0) col(1) `labels'  );		
/******************************** Saving ******************************/
	local i = _byindex();
	capture mkdir figure;
	if _by() {;
		graph save "`c(pwd)'`c(dirsep)'figure`c(dirsep)'`environment'_kdn_`varlist'_`_byvars'_`i'",replace;
		graph export "`c(pwd)'`c(dirsep)'figure`c(dirsep)'`environment'_kdn_`varlist'_`_byvars'_`i'.png", as(png) replace;
	};
	else if _by() == 0 {;
		graph save "`c(pwd)'`c(dirsep)'figure`c(dirsep)'`environment'_kdn_`varlist'",replace;
		graph export "`c(pwd)'`c(dirsep)'figure`c(dirsep)'`environment'_kdn_`varlist'.png", as(png) replace;
	};
end;
/*}}}*/
/*}}}*/
exit;
#delimit cr

*! Created by Jay Oh on 18th Aug 2017.
*! First update by Jay Oh on 29th Nov 2019.
