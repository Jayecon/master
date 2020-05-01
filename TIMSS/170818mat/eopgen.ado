#delimit ;
*! Coded by Jay Oh on 18th Aug 2017. 
*! Syntax is varname , Iteration(Num) RAnge(Num2) GOIndex RRIndex. 
capture program drop eopgen;
program eopgen, byable(recall) rclass sortpreserve;
	syntax varname [if] [in] [fw aw] [using/]
			, BYgroup(varlist numeric )
			[Iteration(integer 1) RAnge(numlist min=2 max=2 ascending >0 <100 )  
			GOIndex GOIPair(numlist min=2 max=2 ascending) 
			RRIndex(varname) RRINorm(integer 20) 
			TESTprog 
			MIIndex MIVar(varlist numeric )];
		  
	if `"`using'"' != "" {; 
		use "`using'" , clear ;
	};

	/*************** Byable setting *****************/
	local bylist `_byvars';
	local bynu : word count `_byvars' ;
	local excnt = _byindex() ;
	local bycnt = 1 ;
	if _by() {;
		while "`bylist'" == "" {;
			gettoken byv`bycnt' bylist : bylist ; 
			local ++bycnt;
		}; 
	}; 
	local idx = _byn1();
	foreach j of local _byvars {;
		local l_`j' = `j'[`idx'];
	};

	/*************** Mark setting *****************/
	if `"`miindex'"' != "" {; local miop1 nov ; local miop2 sysmis; };
	
	marksample touse , `miop1' ;
	markout `touse' `bygroup' `rrindex' `mivar' , `miop2' ;
	marksample alluse, noby `miop1' ;
	markout `alluse' `bygroup' `rrindex' `mivar' ,  `miop2' ;
	
	preserve;

	tempname stat ;

	/*************** Options setting *****************/
	if `"`goipair'"' != "" {; local goipname goipair ; };
	if `"`rrindex'"' != "" {; local rriname rrindex ; };
	local optlist `goindex' `goipname' `testprog' `miindex' `rriname' ;
	local optnu : word count `optlist' ;
	foreach j of local optlist {;
		tempname stat`j' ;
	};

	/*************** Data Manipulation *****************/
	forvalue i = 1/`iteration'{;
		if `iteration' > 1 {; 								
				bsample;
			qui keep if `touse';
			if "`range'" != "" {;
				qui levelsof `bygroup' , local(levels);
				foreach j of local levels {;
					cumul `1' [`weight'  `exp'] if `bygroup'==`j', equal gen(c`bygroup'`j');
				};
				gettoken amin amax : range ;
				local aamin = `amin'*10 ;
				local aamax = `amax'*10 ;
				foreach j of local levels {;
					qui drop if `bygroup' == `j' & 
					(c`bygroup'`j' < `yymin' | c`bygroup'`j' > `yymax') ; 
				};
			};
		};
		else {;
			qui keep if `touse';
		};

	/*********** Index Calculation ***************/
		foreach j of local optlist {;
			if "`j'" == "goipair" {;
				gettoken gr1 gr2 : goipair ;
				goipairc `1' [`weight' `exp'] , by(`bygroup') nozero `gr1' `gr2'; 
			};
			else if "`j'" == "goindex" {;
				goi `1' [`weight' `exp'] , by(`bygroup') nozero; 
			};
			else if "`j'" == "testprog" {;
				testprog `1' [`weight' `exp'] , by(`bygroup') nozero; 
			};
			else if "`j'" == "rrindex" {;
				rri `1' `rrindex' [`weight' `exp'] , by(`bygroup') norm(`rrinorm') ; 
			};
			else if "`j'" == "miindex" {;
				miidx `1' [`weight' `exp'] , by(`bygroup') miv(`mivar') nozero; 
				disp "tempindex: `r(tempindex)' index `r(index)' missing `r(missing)'";
			};

			mat stat_`j'`i'=J(1,1,99);
			mat rownames stat_`j'`i'=`j'`i' ;
			mat colnames stat_`j'`i'=`j' ;
			
			mat stat_`j'`i'[1,1] = r(index) ;
			mat `stat`j''=(nullmat(`stat`j'')\stat_`j'`i') ;
			mat drop stat_`j'`i' ;

		};
		restore, preserve ;
	};
	
/**************** Printing *************************************/
	if _by() {;
		foreach j of local optlist {;
			local tbynu = `bynu' ;
			local tnu = `bynu' + 5;
			mat report_`j'`excnt'=J(1,`tnu',99) ;
			capture drop `j'idx ;
			svmat `stat`j'', names(`j'idx);
			
			forvalues k = 1/`bynu' {;
				local l : word `k' of `_byvars' ;
				mat report_`j'`excnt'[1,`k'] = `l_`l'' ;
			};
			qui sum `j'idx ;
				mat report_`j'`excnt'[1,`+tbynu'] = r(N) ;
				mat report_`j'`excnt'[1,`++tbynu'] = r(mean) ;
				mat report_`j'`excnt'[1,`++tbynu'] = r(sd) ;
				mat report_`j'`excnt'[1,`++tbynu'] = r(min) ;
				mat report_`j'`excnt'[1,`++tbynu'] = r(max) ;
		};
		if _bylastcall() {;
			foreach j of local optlist {;
				forvalues i = 1/`excnt' {;
					mat idx_`j'=(nullmat(idx_`j')\report_`j'`i') ;
				};
			mat colnames idx_`j' = `_byvars' itrnum idxmean idxsd min max ;
			matlist idx_`j' , title(`j') rowtitle(by `bygroup') ;
			return matrix `j' = idx_`j';
			};
		};
	};
	else {;
		foreach j of local optlist {;
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
	};

end;

/*************** GOINDEX Program *****************/
program define goi , rclass; 
	syntax varname [fw aw] , BYgroup(varname) [NOZero] ; 
	tempname gini gl2 typop;

	preserve;

	if "`nozero'" != "" {;
		 qui keep if `1'>0;
	};

	qui levelsof `bygroup' , local(list) ;
	local nu : word count `list' ;

	qui ineqdeco `1' [`weight' `exp'] , bygroup(`bygroup');

	matrix `gini'=J(`nu',1,0);
	
	forvalues i=1/`nu'{;
		local j : word `i' of `list' ;
		matrix `gini'[`i',1]=1-r(gini_`j');
	};

	matrix `gl2'=J(`nu',1,0);
	matrix `typop'=J(`nu',1,0);

	local cnt = 1;
	foreach i of local list {;
		sum `1' [`weight' `exp'] if inlist(`bygroup' ,`i'), meanonly;
		matrix `typop'[`cnt',1] = r(sum_w);
		matrix `gl2'[`cnt',1] = r(mean)* `gini'[`cnt',1];
		local ++cnt;
	};

	matrix go = J(`nu',`nu',0);
	qui sum `1' [`weight' `exp'] , meanonly ;
	local m = r(mean);
	local pop = r(sum_w);

	forvalues i=1/`nu'{;
		forvalues j=1/`nu'{;
			if `gl2'[`i',1]-`gl2'[`j',1] > 0 {;
				local go=`go' + 1/`m' *`typop'[`j',1]/`pop' * `typop'[`i',1]/`pop' * (`gl2'[`i',1]-`gl2'[`j',1]);
			};
		};
	};
	return scalar index=`go';
	restore;
end;

/*************** GOIpair Program *****************/
program define goipairc, rclass;
	syntax varname [fw aw] , BYgroup(varname) [NOZero] ; 
	tempname gini gl2 typop;

	preserve;

	if "`nozero'" != "" {;
		 qui keep if `1'>0;
	};

	qui levelsof `bygroup' , local(list) ;
	local nu : word count `bygroup' ;

	qui ineqdeco `1' [`weight' `exp'] , bygroup(`bygroup');
	matrix `gini'=J(`nu',1,0);
	forvalues i=1/`nu'{;
		local j : word `i' of `list' ;
		matrix `gini'[`i',1]=1-r(gini_`j');
	};

	matrix `gl2'=J(`nu',1,0);
	matrix `typop'=J(`nu',1,0);

	local cnt = 1;
	foreach i of local list {;
		qui sum `1' [`weight' `exp'] if inlist(`bygroup' ,`i'), meanonly;
		matrix `typop'[`cnt',1] = r(sum_w);
		matrix `gl2'[`cnt',1] = r(mean) * `gini'[`cnt',1];
		local ++cnt;
	};
	
	matrix go=J(`nu',`nu',0);
	qui sum `1' [`weight' `exp'], meanonly ;
	local m = r(mean);
	local pop = r(sum_w);
	local go=`go' + 1/`m' *`typop'[`gr2',1]/`pop' * `typop'[`gr1',1]/`pop' * (`gl2'[`gr2',1]-`gl2'[`gr1',1]);

	return scalar index=`go';
	restore;
end;

/*************** Testprog Program *****************/
program define testprog, rclass; 
	syntax varname [fw aw] , BYgroup(varname) [NOZero] ; 
	tempname gini gl2 typop;

	preserve;

	if "`nozero'" != "" {;
		 qui keep if `1'>0;
	};

	qui levelsof `bygroup' , local(list) ;
	local nu : word count `list' ;
	qui gen `1'temp = . ;

	foreach i of local list {;
		sum `1' if `bygroup' == `i'  [`weight' `exp'] , meanonly ; 
		qui replace `1'temp = `1' - r(mean) ; 
	};

	sum `1' [`weight' `exp'] , meanonly ; 
	qui replace `1'temp = `1'temp + r(min) + 1 ;

	qui ineqdeco `1' [`weight' `exp']  ; local goriginal = r(gini) ;
	qui ineqdeco `1'temp [`weight' `exp']  ; local gcounter = r(gini) ;

	return scalar index = `gorigrnal' - `gcounter' ;
	restore;
end;

/*************** MI Estimation Program *****************/
program define miidx, rclass; 
	syntax varname [fw aw/] , BYgroup(varlist) [MIVar(varlist numeric ) NOZero] ; 

	mi set mlong;

	foreach j of local bygroup {;
		qui  levelsof `j' , local(lvs);
		sum `j' , meanonly ; 
		if "`lvs'" == "0 1" {;
			local lgblist `lgblist' `j' ;
			continue;
		};
			local fcblist `fcblist' `j' ;
	};
	foreach j of local mivar {;
		qui  levelsof `j' , local(lvs);
		sum `j' , meanonly ; 
		if "`lvs'" == "0 1" {;
			local lgmlist `lgmlist' `j' ;
			continue;
		};
			local fcmlist `fcmlist' `j' ;
	};
	mi register imputed `1' `bygroup' `mivar';
	mi register regular `exp' ;
	mi describe;

	qui regress `1' `bygroup' [`weight' = `exp'];
	return scalar tempindex = e(r2);
	local n0 = e(N);
	
	qui mi impute chained (regress) `1' `fcblist' `fcmlist' (logit) `lgblist' `lgmlist' , add(20) ;
	qui mi estimate, saving(miest, replace): regress `1' `bygroup' [`weight' = `exp'] ;
	local n1 = e(N_mi) ;

	qui mi predict yhat using miest, xb;
	qui mi xeq 0: sum `1' yhat [`weight' = `exp'] ;

	qui mi xeq 0: sum yhat [`weight' = `exp'] ;
	local vyhat = r(Var);

	qui mi xeq 0: sum `1' [`weight' = `exp'] ;
	local vy = r(Var);

	return scalar index = `vyhat' / `vy' ;
	return scalar missing = 1 - `n0' / `n1' ;

end;
/*************** MI Estimation Program *****************/
program define rri, rclass;
	syntax varlist [if] [in] [fw aw]
		, BYgroup(varname) Norm(integer);

	local a = 100 - `norm';
	local b = `norm'/100 ; 
	qui sum `1' [`weight' `exp'];
		local c = r(sum_w);
	qui _pctile `1' [`weight' `exp'] , p(`a');
		local d = r(r1);
	qui sum `bygroup';
		local e = r(min);
	qui sum `1' if `1' >= `d' & `bygroup' == `e' [`weight' `exp'];
		local f = r(sum_w);
	qui sum `2' if  `bygroup' == `e' [`weight' `exp'];
		local g = r(sum_w);
	qui sum `2' [`weight' `exp'];
		local h = r(sum_w);
	
	return scalar index = 1-(`f'/(`c'*`b'))/(`g'/`h');
end;
exit;
delimit cr
