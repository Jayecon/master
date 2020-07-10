#delimit ;
capture program drop eopcal;
program eopcal, byable(recall) rclass sortpreserve;
syntax varlist(numeric ) [if] [in] [pweight aweight fweight iweight] [using] , ENVironment(varname numeric )
	[GOIndex RRIndex(passthru) Bootstrap(integer 0) Seed(integer 10101) ///Options for calculating indicies.
	 DOM ACCuracy(passthru) ///Option for dominance test.
	 CUMDplot KDENplot GRoptions(passthru) ///Options for drawing graphs.
	 Value(passthru) Percent(passthru) NOZero TRace(integer 0)] ; ///Extra options.
/* ARGUMENTS CHECK LIST {{{*/
	/** TRACE ON/OFF {{{*/
	qui capture set trace off ;
	if ("`trace'" != "0") {;
		set trace on ;
		set traced `trace' ;
		set traceindent on ;
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
	/** CHECK IF THE OPTION RRINDEX HAS THE FORM OF (TYPE , CRITERA) {{{*/
	if `"`rrindex'"' != "" {; 
		local rrindex = strltrim(strltrim(subinstr("`rrindex'" , "rrindex(","",1)));
		local rrindex = strltrim(strltrim(subinstr("`rrindex'" , ")","",1)));
		gettoken rritype rricrit : rrindex, parse(,) ;
		local rritype = strltrim(strrtrim("`rritype'"));
		local rricrit = strltrim(strrtrim(subinstr("`rricrit'" , ",","",1)));
		if("`rritype'" != "type" & "`rritype'" != "percent" & "`rritype'" != "score") {;
			di as error "ERROR in RRindex type. " as text "The following values are admitted: type, percent and score.";
			exit ;
		};
		captur confirm number `rricrit' ; 
		if _rc != 0 {;
			di as error "ERROR in RRindex critera." as text "An appropriate number is required";
			exit ;
		};
		local rrindex rrindex ;
	}; /*}}}*/
	/** CHECK IF THE ENVIRONMENT VALUE HAVE SEQUENCE FROM 1 TO 1.{{{*/
	qui levelsof `environment' , local(typlist) ;
	local typnum : word count `typlist' ;
	forvalue i = 1/`typnum' {;
		local typ`i' : word `i' of `typlist' ;
		if !(`typ`i'' == `i') {;
			di as error "ERROR in Environment value. " as text "The value must increase from 1 to 1. (eg. 1,2,3,...)." ;
			exit;
		};
	}; /*}}}*/
/*}}}*/
/* MARKER SETTING {{{*/
marksample touse  ;
markout `touse' `environment' ;
	/** APPLYING NOZERO OPTION TO THE VARLIST {{{*/
	if ("`nozero'" != "") {;
		qui count if `varlist' < 0 & `touse' ;
		noi if r(N) > 0 { ;
			di " " ;
			di as txt "Warning: `varlist' has `r(N)' values < 0." _c ;
			di as txt " Not used in calculations" ;
		} ;
		qui replace `touse' = 0 if `varlist' <= 0 ;
	}; /*}}}*/
/*}}}*/
/* CALCULATION {{{*/
preserve ;
qui keep if `touse' ;
tempname temps temps2 ;

if ("`goindex'" != "") {;
	goi `varlist' [`weight' `exp'] , environment(`environment') ;
	return scalar index = `r(index)' ;
	return local idxname "goindex" ;
};
else if ("`rrindex'" != "") {;
	rri `varlist' [`weight' `exp'] , environment(`environment') type(`rritype') crit(`rricrit') ;
	return scalar index = `r(index)' ;
	return local success  "`r(type)' , `r(crit)'";
	return local idxname "rrindex" ;
};
else if ("`cumdplot'" != "") {;
	cumd `varlist' [`weight' `exp'] , environment(`environment') `value' `percent' `groptions';
};
else if ("`kdenplot'" != "") {;
	kden `varlist' [`weight' `exp'] , environment(`environment') `value' `groptions';
};
else if ("`dom'" != "") {;
	dom `varlist' [`weight' `exp'] , environment(`environment') `value' `percent' `accuracy' ;
};
/** RETURN RESULTS{{{*/
return local achname "`varlist'" ;
return local evnname "`environment'" ;
/*** PRINT of GOI and RRI{{{*/
if ("`goindex'" != "")|("`rrindex'" != "") {;
	matrix `temps' = r(results) ;
	return matrix results = `temps' ;
	di as text "`goindex'`rrindex' = " as result %5.4f `r(index)' ;
}; /*}}}*/
/*** PRINT of DOM{{{*/
if ("`dom'" != ""){;
	matrix `temps' = r(results) ;
	matrix `temps2' = r(results) ;
	return matrix results = `temps2' ;

	qui levelsof `environment' , local(typlist) ;
	local typnum : word count `typlist' ;
	local typlab : variable label `environment' ;
	local typvalue : value label `environment';
	local hlnum = 8*`typnum' + 4*(`typnum' - 1);
	if ("`typvalue'" != "") { ;
		forvalues i = 1/`typnum' {;
			local lbv`i' : label `typvalue' `i';
		};
	};

	svmat `temps' ;
	qui keep `temps'* ;
	qui keep if !missing(`temps'1) ;

	/**** CREATING LOCAL dom`i'`j'{{{*/
	local i = 1 ;
	while (`i' < `typnum') { ;
		local iplus = `i' +1 ;
		forvalues j=`iplus'/`typnum'{ ; 
			sum `temps'11 if `temps'1 == 1 & `temps'2 == `i' & `temps'3 == `j' , meanonly ;
				if (r(mean) == 1) { ; local dom`i'`j' "   <1***" ; };
			sum `temps'12 if `temps'1 == 1 & `temps'2 == `i' & `temps'3 == `j' , meanonly ;
				if (r(mean) == 1) { ; local dom`i'`j' "    <1**" ; };
			sum `temps'13 if `temps'1 == 1 & `temps'2 == `i' & `temps'3 == `j' , meanonly ;
				if (r(mean) == 1) { ; local dom`i'`j' "     <1*" ; };
			sum `temps'8 if `temps'1 == 1 & `temps'2 == `i' & `temps'3 == `j'  , meanonly ;
				if (r(mean) == 1) { ; local dom`i'`j' "   >1***" ; };
			sum `temps'9 if `temps'1 == 1 & `temps'2 == `i' & `temps'3 == `j'  , meanonly ;
				if (r(mean) == 1) { ; local dom`i'`j' "    >1**" ; };
			sum `temps'10 if `temps'1 == 1 & `temps'2 == `i' & `temps'3 == `j' , meanonly ;
				if (r(mean) == 1) { ; local dom`i'`j' "     >1*" ; };
			sum `temps'11 if `temps'1 == 2 & `temps'2 == `i' & `temps'3 == `j' , meanonly ;
				if (r(mean) == 1) { ; local dom`i'`j' "   <2***" ; };
			sum `temps'12 if `temps'1 == 2 & `temps'2 == `i' & `temps'3 == `j' , meanonly ;
				if (r(mean) == 1) { ; local dom`i'`j' "    <2**" ; };
			sum `temps'13 if `temps'1 == 2 & `temps'2 == `i' & `temps'3 == `j' , meanonly ;
				if (r(mean) == 1) { ; local dom`i'`j' "     <2*" ; };
			sum `temps'8 if `temps'1 == 2 & `temps'2 == `i' & `temps'3 == `j'  , meanonly ;
				if (r(mean) == 1) { ; local dom`i'`j' "   >2***" ; };
			sum `temps'9 if `temps'1 == 2 & `temps'2 == `i' & `temps'3 == `j'  , meanonly ;
				if (r(mean) == 1) { ; local dom`i'`j' "    >2**" ; };
			sum `temps'10 if `temps'1 == 2 & `temps'2 == `i' & `temps'3 == `j' , meanonly ;
				if (r(mean) == 1) { ; local dom`i'`j' "     >2*" ; };
			if ("`dom`i'`j''" == "") {; local dom`i'`j' "ambiguous" ; };
		} ;
		local ++i ;
	} ; /*}}}*/
	restore, preserve ;
	/**** KSMIRNOV TEST for EQUAL DISTRIBUTION{{{*/
	local i = 1 ;
	while (`i' < `typnum') { ;
		local iplus = `i' +1 ;
		forvalues j=`iplus'/`typnum'{ ; 
			if ("`dom`i'`j''" == "ambiguous") {; 
				tempvar tempgrp;
				qui gen `tempgrp' = `environment' ;
				qui replace `tempgrp' = . if !inlist(`environment' , `i' ,`j') ;
				qui ksmirnov `varlist' `if' , by(`tempgrp');
				if (r(p) <= 0.1  ) {; local dom`i'`j'  "     ??*"; };
				if (r(p) <= 0.05 ) {; local dom`i'`j'  "    ??**"; };
				if (r(p) <= 0.01 ) {; local dom`i'`j'  "   ??***"; };
				if (r(p) > 0.1 )   {; local dom`i'`j'  "    === "; };
			};
		};
		local ++i ;
	}; /*}}}*/
	/**** CREATING RESULT TABLE{{{*/
	forvalue i = 0/`typnum' {;
		forvalue j = 1/`typnum' {;
			if ("`dom`i'`j''" == "") { ;
				local dom`i'`j' "    {hline 3} ";
			};
			if (`i' == 0) { ;
				local contents = `"`contents' %8s abbrev("`lbv`j''",8) _skip(4)"' ;
			};
			else if (`i' >= 1 ) {;
				local contents`i' = `"`contents`i'' "`dom`i'`j''" _skip(4)"';
			};
		};
			if (`i' == 0) { ;
				di ;
				di as result "Stochastic Dominance Test Results" ;
				di ;
				di as text %12s abbrev("`typlab'",12) _col(14) "{c |}" `contents';
				di as text "{hline 13}{c +}{hline `hlnum'}";
			};
			else if (`i' >= 1 ) { ;
				di as text %12s abbrev("`lbv`i''",8) _col(14) "{c |}" `contents`i'';
			};
	}; /*}}}*/
}; /*}}}*/
/*}}}*/
restore, preserve ;
/*}}}*/
/* BOOTSTRAP SAMPLING FOR CALCULATING CI of GOI and RRI {{{*/
if (`bootstrap' >= 1) { ; 
	set seed `seed' ;
	tempname temp tempi temp1 temp2 tempind tempsum ;
	forvalue i = 1/`bootstrap' { ;
		qui keep if `touse' ;
		bsample ;
		if "`goindex'" != "" {;
			goi `varlist' [`weight' `exp'] , environment(`environment') ;
		};
		if "`rrindex'" != "" {;
			rri `varlist' [`weight' `exp'] , environment(`environment') type(`rritype') crit(`rricrit') ;
		};
		/*CREATING BSTINDEX MATRIX{{{*/
		mat `tempi'=J(1,2,99); 
			mat `tempi'[1,1] = `i' ;
			mat `tempi'[1,2] = `r(index)' ;
			mat `tempind' = (nullmat(`tempind') \ `tempi') ;
			mat colnames `tempind'= bstnum Index ; /*}}}*/
		/*CREATING BSTRESULTS MATRIX{{{*/
		matrix `temp2' = r(results) ; 
			if "`goindex'" != "" {;
				qui levelsof `environment' , local(typlist) ;
				local typnum : word count `typlist' ;
				local t1 = `typnum' + 1 ;
				matrix `temp1' = J(`t1',1,`i');
			};
			else if "`rrindex'" != "" {;
				matrix `temp1' = J(1,1,`i');
			};
			matrix colname `temp1' = bstnum ;
			matrix `temp' = (`temp1',`temp2') ;
			mat `tempsum' = (nullmat(`tempsum') \ `temp') ;/*}}}*/
		restore, preserve ;
	};
	/*CREAING RESULTS{{{*/
	svmat `tempind' ;
	qui keep `tempind'2 ;
	qui keep if !missing(`tempind'2) ;
	_pctile `tempind'2 , p(2.5 97.5) ;
	return scalar l95 = r(r1) ;
	return scalar u95 = r(r2) ;
	restore ;
	return matrix bstindex = `tempind' ;
	return matrix bstresults = `tempsum' ; /*}}}*/
}; /*}}}*/
end;

/* SUB PROGRAMS {{{*/
/** GOINDEX PROGRAM {{{*/
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
matrix results = (`envm',`ginim',`senm',`countm', `populm') ;
matrix rowname results = `rowname' ;
matrix results = (`tempg' \ results) ;
matrix colname results = Env Gini Sen  ObsNum PopRatio ;

local count = 1 ;
local go = 0 ;
while (`count' < `typnum') { ;
	local cplus = `count' +1 ;
	forvalues j=`cplus'/`typnum'{ ;
		local go = `go' + `populm'[`count',1]*`populm'[`j',1]*abs(`senm'[`count',1]-`senm'[`j',1]) ;
	} ;
	local ++count ;
} ;

local go = `go'/`gmean' ;
return scalar index = `go' ;
return matrix results = results ;
end ; /*}}}*/
/** RRINDEX PROGRAM {{{*/
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

matrix results =(`disadv' , `diswin' , `dispop' , `totwin' , `totpop') ;
matrix colname results = DisTyp SucDisNum DisNum SucNum PopNum ;
return matrix results = results ;

end; /*}}}*/
/** CUMDPLOT PROGRAM {{{*/
program define cumd, byable(recall);
syntax varlist [if] [in] [fw aw pw iw] 
	, ENVironment(varlist numeric) [ Value(numlist min=2 max=2 ascending) Percent(numlist min=2 max=2 >0 <1 ascending) GROPtions(string) ] ;
/******************************** LABELING ******************************/
qui levelsof `environment', local(envlist);
local varlabel : variable label `varlist';
local envvalue : value label `environment';
local count = 1;

if ("`envvalue'" != "") { ;
	foreach i of local envlist {;
		local lbv`i' : label `envvalue' `i';
		local labels `labels' label(`count' `lbv`i'') ;
		local ++count;
	};
};
else {;
	foreach i of local envlist {;
		local lbv`i' "`environment' == `i'" ;
		local labels `labels' label(`count' `lbv`i'') ;
		local ++count;
	};
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
if `"`percent'"' != "" {;
	gettoken ymin ymax : percent ;
	foreach i of local envlist {;
		qui replace c`environment'`i' = . if inlist(`environment' , `i') &
			!inrange(c`environment'`i' ,  `ymin' , `ymax') ;
	};
};
qui stack `cvar2list', into (c c`environment') wide;
if `"`value'"' != "" {;
	gettoken xmin xmax : value ;
	qui replace c`environment' =. if !inrange( c`environment' , `xmin' , `xmax' ) ;
};
/******************************** DRAWING ******************************/
if (strpos("`groptions'" , "sort") == 0) {; local sort "sort" ; };
if (strpos("`groptions'" , "ytitle") == 0) {; local ytitle "ytitle(CDF)" ; };
if (strpos("`groptions'" , "ylab") == 0) {; local ylab "ylab(,grid)" ; };
if (strpos("`groptions'" , "xtitle") == 0) {; local xtitle "xtitle(`varlabel')" ; };
if (strpos("`groptions'" , "xlab") == 0) {; local xlab "xlab(,grid)" ; };
if (strpos("`groptions'" , "legend") == 0) {; local legend " legend( region(lpattern(blank) color(none)) pos(5) ring(0) col(1) `labels' ) " ; };
qui line `cvarlist' c`environment',
	`sort' `ytitle' `xtitle' `ylab'  `xlab' `legend' `groptions' ;
end; /*}}}*/
/** KDENPLOT PROGRAM {{{*/
program define kden, ;
syntax varname [if] [in] [fw aw pw iw] ,
	ENVironment(varlist numeric) [ Number(integer 500) Kernel(string)
	Value(numlist min=2 max=2  ascending) Filename(name max=1) GROPtions(string)] ;
/******************************** LABELING ******************************/
qui levelsof `environment', local(envlist);
local varlabel : variable label `varlist';
local envvalue : value label `environment';

local count = 1;
if ("`envvalue'" != "") { ;
	foreach i of local envlist {;
		local lbv`i' : label `envvalue' `i';
		local labels `labels' label(`count' `lbv`i'') ;
		local ++count;
	};
};
else {;
	local count = 1;
	foreach i of local envlist {;
		local lbv`i' "`environment' == `i'" ;
		local labels `labels' label(`count' `lbv`i'') ;
		local ++count;
	};
};
/******************************** GEN KDEN ******************************/
qui kdensity `varlist' [`weight' `exp'] , n(`number') nograph gen(x c`environment') kernel(`kernel');
foreach i of local envlist {;
	local cv  c`environment'`i';
	local cvlist `cvlist' `cv';
	kdensity `varlist' [`weight' `exp'] if inlist(`environment' , `i') , nograph gen(c`environment'`i') at(x) kernel(`kernel');
	label var c`environment'`i' `"`lbv`i''"';
};
if `"`value'"' != "" {;
	gettoken xmin xmax : value ;
	foreach i of local envlist {;
		qui replace x =. if !inrange( x , `xmin' , `xmax' ) ;
	};
};
/******************************** Drawing ******************************/
if (strpos("`groptios'" , "sort") == 0) {; local sort "sort" ; };
if (strpos("`groptios'" , "ytitle") == 0) {; local ytitle "ytitle(Density)" ; };
if (strpos("`groptios'" , "xtitle") == 0) {; local xtitle "xtitle(`varlabel')" ; };
if (strpos("`groptios'" , "legend") == 0) {; local legend "legend( region(lpattern(blank) color(none)) pos(1) ring(0) col(1) `labels' )" ; };
if ("`xtitle'" != "") {; local xlabel `xtitle' ; }; else {; local xlabe `varlabel' ; };
line `cvlist' x ,
	`sort' `ytitle' `xtitle' `legend' `groptions' ;
end; /*}}}*/
/** DOM PROGRAM{{{*/
capture program drop dom ;
program define dom, rclass;
	syntax varlist [fw pw aw] , ENVironment(varname numeric) 
	[Value(numlist min=2 max=2  ascending) Percent(numlist min=2 max=2 >=0 <=1 ascending) ///Options for control a test range.
	 ACCuracy(integer 40) ]; ///Extra options.

qui levelsof `environment' , local(typlist) ;
local typnum : word count `typlist' ;

/*MARKER SETTING*/
marksample touse ;
markout `touse' `environment' ;

/* MANIPULATE THE TEST RANGE {{{*/
if `"`percent'"' != "" {;
	gettoken min max : percent;
	foreach i of local typlist {;
		_pctile `varlist' [`weight' `exp'] if `environment' == `i' , p(`min', `max');
		local min`i' = r(r1); local max`i' = r(r2);
		qui replace `touse' = 0 if `environment' == `i' & !inrange(`varlist' , `min`i'' , `max`i'');
	};
};
if `"`value'"' != "" {;
	gettoken min max : value;
	foreach i of local typlist {;
		qui replace `touse' = 0 if `environment' == `i' & !inrange(`varlist' , `min' , `max');
	};
}; /*}}}*/

preserve ;
foreach i of local typlist { ;
	summarize `varlist' [`weight' `exp'] if `environment' == `i' & `touse' , meanonly;
		local min`i' = r(min); local max`i' = r(max);
};
local i = 1 ;
while (`i' < `typnum') { ;
	local iplus = `i' +1 ;
	forvalues j=`iplus'/`typnum'{ ;
		local min`i'`j' = max(`min`i'',`min`j'');
		local max`i'`j' = min(`max`i'',`max`j'');
		local inter`i'`j' = (`max`i'`j''-`min`i'`j'')/(`accuracy'-1);
	};
	local ++i ;
};
local s = 1;
tempvar X ;
tempname temp temp1 temp2 ;
while (`s' < 3) { ;
local i = 1 ;
while (`i' < `typnum') { ;
	local iplus = `i' +1 ;
	forvalues j= `iplus'/`typnum'{ ;
		/*MAX POINT ERROR CHECK{{{*/
		if `max`i'`j'' <= `min`i'`j'' {;
			local done = 1;
			display as error "Error: " as text "Max test point is not larger than min test point!";
			exit;
		};
		/*}}}*/
		local alpha = `s' - 1;
		local afac = round(exp(lnfactorial(`alpha')),1);
		qui count if inlist(`environment' , `i' ,`j') ;
		local nsample = r(N) - 4 ;
		local z = `min`i'`j'';
		local rownum = 1;

		while !(`z' > `max`i'`j'') {;
			qui gen double `X' = 0 ;
			qui replace `X'  = (1/`afac')*((`z'-`varlist')^`alpha') if `varlist'<= (`z' + 0.0000000001) ;

			qui mean `X' [`weight' `exp'] if `environment' == `i' & `touse' ;
			matrix est1 = e(b);
			matrix var1 = e(V);
			local  D1 = est1[1,1];
			local  VD1 = var1[1,1];

			qui mean `X' [`weight' `exp'] if `environment' == `j' & `touse' ;
			matrix est2 = e(b);
			matrix var2 = e(V);
			local D2 = est2[1,1];
			local VD2 = var2[1,1];

			local t = (`D2'-`D1')/sqrt(`VD1'+`VD2'); //The t-statistic
			qui drop `X' ;

			/*CREATING RESULT MATRIX{{{*/
			if (`t' > invttail(`nsample',.005)) { ; local o005 = 1; }; else {; local o005 = 0; };
			if (`t' > invttail(`nsample',.025)) { ; local o025 = 1; }; else {; local o025 = 0; };
			if (`t' > invttail(`nsample',.05)) { ; local o05 = 1; }; else {; local o05 = 0; };
			if (`t' < invttail(`nsample',.95)) { ; local b95 = 1; }; else {; local b95 = 0; };
			if (`t' < invttail(`nsample',.975)) { ; local b975 = 1; }; else {; local b975 = 0; };
			if (`t' < invttail(`nsample',.995)) { ; local b995 = 1; }; else {; local b995 = 0; };
			matrix `temp' = J(1,13,99);
			matrix colname `temp' = S_order Group1 Group2 Z_value D1 D2 T over005 over025 over05 below995 below975 below95 ;
			matrix `temp'[1,1] = `s' ;		matrix `temp'[1,2] = `i' ;		matrix `temp'[1,3] = `j' ;
			matrix `temp'[1,4] = `z' ;		matrix `temp'[1,5] = `D1' ;		matrix `temp'[1,6] = `D2' ;
			matrix `temp'[1,7] = `t' ;		matrix `temp'[1,8] = `o005' ;	matrix `temp'[1,9] = `o025' ;
			matrix `temp'[1,10] = `o05' ;	matrix `temp'[1,11] = `b995' ;	matrix `temp'[1,12] = `b975' ;
			matrix `temp'[1,13] = `b95' ;

			matrix rowname `temp' = `i'to`j'(t`rownum');
			matrix `temp1' = (nullmat(`temp1') \ `temp') ;
			local ++rownum ;
			/*}}}*/

			local z = `z' + `inter`i'`j'';
		};
	};
	local ++i;
};
	local ++s;
};
return matrix results = `temp1';
restore ; 
#delimit cr;
end /*}}}*/
/*}}}*/

#delimit cr

*! A nonparametic analysis tool for (in)equality of opportunity.
*! Created by Jay Oh on 18th Aug 2017.
*! First update on Novemver 2019.
*! Second update on June 2020.
