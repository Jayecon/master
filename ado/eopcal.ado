#delimit ;
capture program drop eopcal;
program eopcal, byable(recall) rclass sortpreserve;
/* SYNTAX SETTING {{{*/
syntax varlist(numeric ) [if] [in] [pweight aweight fweight iweight] [using] , ENVironment(varlist numeric )
	[GOIndex RRIndex(passthru) 
	CUMDplot KDENplot XRange(passthru) YRange(passthru) Filename(passthru)
	NOZero REPs(integer 0) TRace(integer 0)] ; /*}}}*/
/* ARGUMENTS CHECK LIST {{{*/
	/** TRACE ON/OFF {{{*/
	qui capture set trace off ;
	if ("`trace'" != "0") {;
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
	/* APPLYING NOZERO OPTION TO THE VARLIST {{{*/
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
/*BOOTSTRAP SAMPLING {{{*/
if (`reps' >= 1) { ;
	tempname temps tempi temp1 temp2 tempind tempsum ;
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
	if "`goindex'" != "" {;
		goi `varlist' [`weight' `exp'] , environment(`environment') ;
		return scalar index = `r(index)' ;
		return local idxname "goindex" ;
	};
	if "`rrindex'" != "" {;
		rri `varlist' [`weight' `exp'] , environment(`environment') type(`rritype') crit(`rricrit') ;
		return scalar index = `r(index)' ;
		return local type  "`r(type)'";
		return local crit "`r(crit)'";
		return local idxname "rrindex" ;
	};
	mat `tempi'=J(1,2,99);
		mat `tempi'[1,1] = `i' ;
		mat `tempi'[1,2] = `r(index)' ;
		mat `tempind' = (nullmat(`tempind') \ `tempi') ;
		mat colnames `tempind'= #bst Index ;
	matrix `temp2' = r(RESULTS) ;
		if "`goindex'" != "" {;
			qui levelsof `environment' , local(typlist) ;
			local typnum : word count `typlist' ;
			local t1 = `typnum' + 1 ;
			matrix `temp1' = J(`t1',1,`i');
		};
		else if "`rrindex'" != "" {;
			matrix `temp1' = J(1,1,`i');
		};
		matrix colname `temp1' = #bst ;
		matrix `temps' = (`temp1',`temp2') ;
		mat `tempsum' = (nullmat(`tempsum') \ `temps') ;
	 /*}}}*/
	restore, preserve ;
	};
	return local achname "`varlist'" ;
	return local evnname "`environment'" ;
	return matrix INDEX = `tempind' ;
	return matrix RESULTS = `tempsum' ;
};
/*}}}*/
/*NON-BOOTSTRAP {{{*/
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
	tempname temp ;
	if ("`goindex'" != "") {;
		goi `varlist' [`weight' `exp'] , environment(`environment') ;
		return scalar index = `r(index)' ;
		return local idxname "goindex" ;
	};
	if ("`rrindex'" != "") {;
		rri `varlist' [`weight' `exp'] , environment(`environment') type(`rritype') crit(`rricrit') ;
		return scalar index = `r(index)' ;
		return local type  "`r(type)'";
		return local crit "`r(crit)'";
		return local idxname "rrindex" ;
	};
	if ("`cumdplot'" != "") {;
		cumd `varlist' [`weight' `exp'] , environment(`environment') `xrange' `yrange' `filename' ;
	}
	if ("`kdenplot'" != "") {;
		kden `varlist' [`weight' `exp'] , environment(`environment') `xrange' `yrange' `filename' ;
	};
	return local achname "`varlist'" ;
	return local evnname "`environment'" ;
	if ("`goindex'" != "")|("`rrindex'" != "") {;
		matrix `temp' = r(RESULTS) ;
		return matrix RESULTS = `temp' ;
	};
	restore, preserve ;
/*}}}*/
};
/*}}}*/
/*}}}*/
end;

/* SUB PROGRAM {{{*/
/* GOINDEX PROGRAM {{{*/
capture program drop goi ;
program define goi , rclass; 
syntax varlist [fw aw pw iw] , ENVironment(varlist numeric) ;

tempname envm ginim senm countm populm tempg ;
qui levelsof `environment' , local(typlist) ;
local typnum : word count `typlist' ;
local envvalue : value label `environment' ;
mat `envm'=J(`typnum', 1 ,99) ;
mat `ginim'=J(`typnum', 1 ,99) ;
mat `senm'=J(`typnum', 1 ,99) ;
mat `countm'=J(`typnum', 1 ,99) ;
mat `populm'=J(`typnum', 1 ,99) ;

sum `varlist' [`weight' `exp'] , meanonly ;
local gsumw = r(sum_w);
local gmean = r(mean);
qui count ;
local gn = r(N);

qui ineqdeco `varlist' [`weight' `exp'] , bygroup(`environment') welfare ;
local ggini = r(gini) ; /* Grand Gini */
local gsen = r(wgini) ; /* Grand Sen's Welfare Mu*(1-Gini) */
forvalues i=1/`typnum'{;
	local j : word `i' of `typlist' ;
	local jlabel : label `envvalue' `j' ;
	matrix `envm'[`i',1]=`j' ;
	matrix `ginim'[`i',1]=r(gini_`j') ;
	matrix `senm'[`i',1]=r(wgini_`j') ;
	matrix `populm'[`i',1] = r(sumw_`j')/`gsumw' ;
	local rowname `rowname' `jlabel' ;
} ;
forvalues i=1/`typnum'{;
	local j : word `i' of `typlist' ;
	qui count if `environment' == `j' ;
	matrix `countm'[`i',1] = r(N) ;
} ;
sum `varlist' [`weight' `exp'] , meanonly ;
matrix `tempg' = (-1 , `ggini' , `gsen' , `gn' , 1 ) ;
matrix rowname `tempg' = All ;
matrix RESULTS = (`envm',`ginim',`senm',`countm', `populm') ;
matrix rowname RESULTS = `rowname' ;
matrix RESULTS = (`tempg' \ RESULTS) ;
matrix colname RESULTS = Env Gini Sen  #Obs %Pop ;

local count = 1 ;
local go = 0 ;
while (`count' < `typnum') { ;
	local cplus = `count' +1 ;
	forvalues j=`cplus'/`typnum'{ ;
		local go = `go' + `populm'[`count',1]*`populm'[`j',1]*abs(`senm'[`count',1]-`senm'[`j',1]) ;
	} ;
	local count = `count' + 1 ;
} ;

local go = `go'/`gmean' ;
return scalar index = `go' ;
return matrix RESULTS = RESULTS ;
end ; /*}}}*/
/* RRINDEX PROGRAM {{{*/
capture program drop rri ;
program define rri , rclass; 
syntax varlist [fw aw pw iw] , ENVironment(varlist numeric) TYPE(str) CRIT(real) ;
return local type  "`type'" ;
return local crit  "`crit'" ;

tempvar one ;
qui levelsof `environment' , local(typlist) ;
local typnum : word count `typlist' ;
local disadv : word 1 of `typlist' ;

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

matrix RESULTS =(`disadv' , `diswin' , `dispop' , `totwin' , `totpop') ;
matrix colname RESULTS = Disadv_type #Succ_Disadv #Disadv #Succ #Pop ;
return matrix RESULTS = RESULTS ;

end; /*}}}*/
/* CUMDPLOT PROGRAM {{{*/
program define cumd, byable(recall);
syntax varlist [if] [in] [fw aw pw iw] 
	, ENVironment(varlist numeric) [ XRange(numlist min=2 max=2 >0 ascending) YRange(numlist min=2 max=2 >0 <1 ascending) Filename(name max=1) ] ;
/******************************** LABELING ******************************/
qui levelsof `environment', local(envlist);
local varlabel : variable label `varlist';
local envvalue : value label `environment';
local count = 1;
foreach i of local envlist {;
	local lbv`i' : label `envvalue' `i';
	local labels `labels' label(`count' `lbv`i'') ;
	local ++count;
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
	local yymin = `ymin' ;
	local yymax = `ymax' ;
	foreach i of local envlist {;
		qui replace c`environment'`i' = . if inlist(`environment' , `i') &
			inrange(c`environment'`i' ,  `yymin' , `yymax') ;
	};
};
stack `cvar2list', into (c c`environment') wide;
if `"`xrange'"' != "" {;
	gettoken xmin xmax : xrange ;
	qui replace c`environment'=. if inrange( c`environment' , `xmin' , `xmax') ;
};
/******************************** DRAWING ******************************/
line `cvarlist' c`environment',
	sort ylab(, grid) ytitle("CDF") 
	xlab(, grid) xtitle("`varlabel'", size(vlarge))
	legend( region(lpattern(blank) color(none)) pos(5) ring(0) col(1) `labels' );
/******************************** SAVING ******************************/
capture mkdir figure;
if ("`filename'" != "") { ;
	graph save "`c(pwd)'`c(dirsep)'figure`c(dirsep)'`filename'",replace;
	graph export "`c(pwd)'`c(dirsep)'figure`c(dirsep)'`filename'.png", as(png) replace;
};
else { ;
	graph save "`c(pwd)'`c(dirsep)'figure`c(dirsep)'`environment'_cumd_`varlist'_",replace;
	graph export "`c(pwd)'`c(dirsep)'figure`c(dirsep)'`environment'_cumd_`varlist'.png", as(png) replace;
};
end; /*}}}*/
/* KDENPLOT PROGRAM {{{*/
program define kden, ;
syntax varname [if] [in] [fw aw pw iw] ,
	ENVironment(varlist numeric) [ Number(integer 500) Kernel(string)
	XRange(numlist min=2 max=2 >0 ascending) YRange(numlist min=2 max=2 >0 <100 ascending) Filename(name max=1)] ;
/******************************** LABELING ******************************/
qui levelsof `environment', local(envlist);
local varlabel : variable label `varlist';
local envvalue : value label `environment';
local count = 1;
foreach i of local envlist {;
	local lbv`i' : label `envvalue' `i';
	local labels `labels' label(`count' `lbv`i'') ;
	local ++count;
};
/******************************** GEN CUMUL ******************************/
qui kdensity `varlist' [`weight' `exp'] , n(`number') nograph gen(x c`environment') kernel(`kernel');
foreach i of local envlist {;
	local cv  c`environment'`i';
	local cvlist `cvlist' `cv';
	kdensity `varlist' [`weight' `exp'] if inlist(`environment' , `i') , nograph gen(c`environment'`i') at(x) kernel(`kernel');
	label var c`environment'`i' `"`lbv`i''"';
};
if `"`yrange'"' != "" {;
	gettoken ymin ymax : yrange ;
	local yymin = `ymin' ;
	local yymax = `ymax' ;
	foreach i of local envlist {;
		qui replace c`environment'`i'=. if inlist( `environment' , `i') &
			inrange(c`environment'`i' , `yymin' , `yymax') ;
	};
};
if `"`xrange'"' != "" {;
	gettoken xmin xmax : xrange ;
	foreach i of local envlist {;
		qui replace c`environment'=. if  inrange(c`environment' , `xmin' , `xmax' ) ;
	};
};
/******************************** Drawing ******************************/
line `cvlist' x ,
sort ytitle(Density)
xtitle("`varlabel'", size(vlarge))
	legend( region(lpattern(blank) color(none)) pos(1) ring(0) col(1) `labels'  );
/******************************** Saving ******************************/
capture mkdir figure ;
if ("`filename'" != "") { ;
	graph save "`c(pwd)'`c(dirsep)'figure`c(dirsep)'`filename'",replace;
	graph export "`c(pwd)'`c(dirsep)'figure`c(dirsep)'`filename'.png", as(png) replace;
};
else { ;
	graph save "`c(pwd)'`c(dirsep)'figure`c(dirsep)'`environment'_kden_`varlist'",replace;
	graph export "`c(pwd)'`c(dirsep)'figure`c(dirsep)'`environment'_kden_`varlist'.png", as(png) replace;
};
end; /*}}}*/
/*}}}*/
#delimit cr

*! Created by Jay Oh on 18th Aug 2017.
*! First update by Jay Oh on 29th Nov 2019.
