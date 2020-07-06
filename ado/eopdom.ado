#delimit ;
program define eopdom,  rclass;
	syntax varlist [if] [in] [fw pw aw] 
	,ENVironment(varname numeric) 
	[Value(numlist min=2 max=2 >0 ascending) 
	 Percent(numlist min=2 max=2 >0 <1 ascending) 
	 ACCuracy(integer 40) TRace(integer 0)];

/*capture timer clear ; //timer!!*/
/*timer on 1 ; //timer!!*/
/** TRACE ON/OFF {{{*/
qui capture set trace off ;
if ("`trace'" != "0") {;
	set trace on ;
	set traced `trace' ;
}; /*}}}*/

qui levelsof `environment' , local(typlist) ;
local typnum : word count `typlist' ;

/*MARKER SETTING{{{*/
marksample touse ;
markout `touse' `environment' ;
qui replace `touse' = 0 if `varlist' <= 0 ; //To exclude non-positive achievement samples
/* MANIPULATE THE TEST RANGE {{{*/
if `"`percent'"' != "" {;
	gettoken min max : percent;
	local min = `min' * 100 ;
	local max = `max' * 100 ;
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
};
/*}}}*/
/*}}}*/

preserve ;
qui keep if `touse' ;
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
return matrix result = `temp1';
/*{{{*/
/*summarize `ind', meanonly;*/
 /*if r(mean) == 1 {; local done = 1;*/
                       /*global Dorder = -`s';*/
                       /*display "";*/
                       /*display "Dominance achieved at order " `s';*/
                       /*local s = 1;};*/
 /*if r(mean) == 2 {; local done = 1;*/
                       /*global Dorder = `s';*/
                       /*display "";*/
                       /*display "Dominance achieved at order " `s';*/
                       /*local s = 1;};*/
 /*if `s' >= 3        {; local done = 1;*/
                       /*global Dorder = 0;*/
                       /*display "";*/
                       /*display "Dominance not achieved up to order 3";};*/
/*drop `ind';*/
/*local s = `s' + 1;*/
/*}}}*/
/*timer off 1 ; //timer!!*/
/*timer list 1 ; //timer!!*/
#delimit cr;
end
