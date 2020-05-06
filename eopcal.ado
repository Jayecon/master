#delimit ;
capture program drop eopcal;
program eopcal, byable(recall) rclass sortpreserve;

/* SYNTAX SETTING {{{*/
syntax varname(numeric fv ) [if] [in] [pweight aweight fweight iweight] [using] , ENVironment(varlist numeric )
	[GOIndex RRIndex(passthru) 
	CUMDplot KDENplot XRange(numlist min=2 max=2) YRange(numlist min=2 max=2)
	NOZero REPs(integer 1) Trace(integer 0)] ; /*}}}*/

/* ARGUMENTS CHECKING {{{*/
	/** TRACE ON/OFF {{{*/
	qui capture set trace off ;
	if `trace' > 0 {;
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
			if int(`x') != `x' | (`x' < 0) { ;
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
			di as error "ERROR in RRindex critera." _n "A appropriate number is required";
			exit ;
		};
		local rrindex rrindex ;
	}; /*}}}*/
/*}}}*/

/* MARKER SETTING {{{*/
marksample touse  ;
if "`environment'" != "" markout `touse' `environment' ;
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

/* BSAMPLE SETTING {{{*/
preserve ;
forvalue i = 1/`reps' { ;
	if `reps' > 1 { ;
		qui keep if `touse' ;
		bsample ;
	};
	else {;
		qui keep if `touse' ;
	};
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
			/** ineqdeco {{{*/
			if "`summarize'" != "" local summ "summ" 
			if "`welfare'" != ""    local w "w" 
			local inc "`varlist'"

			tempvar fi totaly py gini wgini im1 i0 i1 i2                 	///
			  nk vk fik meanyk varyk lambdak loglamk lgmeank             	///
			  thetak im1k i0k i1k i2k  ginik pyk                         	///
			  im1b i0b i1b i2b  wginik                              	///
			  ahalf a1 a2 ahalfk a1k a2k 				      	///
			  whalf w1 w2 whalfk w1k w2k                                 	///
			  ahalfb a1b a2b edehalfk ede1k ede2k          			///
			  edehalf ede1 ede2 withm1 with0 withh with1 with2 	     	///
			  awithh awith1 awith2 wi first  
			  

			if "`weight'" == "" gen byte `wi' = 1
			else gen `wi' `exp'

			marksample touse
			if "`bygroup'" != "" markout `touse' `bygroup'

			qui count if `touse'
			if r(N) == 0 error 2000

			lab var `touse' "All obs"
			lab def `touse' 1 " "
			lab val `touse' `touse'

			if "`bygroup'" != "" {
				capture levelsof `bygroup' if `touse' , local(gp)
				qui if _rc levels `bygroup' if `touse' , local(gp)
				foreach x of local gp {
					if int(`x') != `x' | (`x' < 0) { 
						di as error "`bygroup' contains non-integer or negative values"
						exit 459
					}
				}
			}

			set more off
				
			quietly {

				count if `inc' < 0 & `touse'
				noi if r(N) > 0 {
					di " "
					di as txt "Warning: `inc' has `r(N)' values < 0." _c
					di as txt " Not used in calculations"
				}
				
				count if `inc' == 0 & `touse'
				noi if r(N) > 0 {
					di " "
					di as txt "Warning: `inc' has `r(N)' values = 0." _c
					di as txt " Not used in calculations"
				}
				
				replace `touse' = 0 if `inc' <= 0  // this replaces former 'badinc' stuff

				noi if "`summ'" != "" {
					di " "
					di as txt "Summary statistics for distribution of " _c
					di as txt "`inc'" ": all valid cases"
					sum `inc' [w = `wi'] if `touse', de
				}
				else  sum `inc' [w = `wi'] if `touse', de

				foreach P in 5 10 25 50 75 90 95 { 
					local p`P'  = r(p`P')
				}	
				
				local sumwi = r(sum_w)
				local meany = r(mean)
				local vary = r(Var) 
				local sdy = r(sd)

				return scalar mean = r(mean)
				return scalar Var = r(Var)
				return scalar sd = r(sd)
				return scalar sumw = r(sum_w)
				return scalar N = r(N)
				return scalar min = r(min)
				return scalar max = r(max)

				foreach p in 5 10 25 50 75 90 95 {
					return scalar p`p' = r(p`p')
				}
				gen double `fi' = `wi' / `sumwi' if `touse'

				gsort -`touse' `inc' 

				gen double `py' = (2 * sum(`wi') - `wi' + 1)/(2 * `sumwi' ) if `touse'

				egen double `gini' = sum(`fi'*(2 / `meany') * `py' * (`inc' - `meany')) if `touse'
				egen double `im1' = sum(`fi' * ((`meany' / `inc') - 1) / 2) if `touse'
				egen double `i0' = sum(`fi' * log(`meany' / `inc')) if `touse'
				egen double `i1' = sum(`fi' * (`inc' / `meany') * log(`inc' / `meany')) if `touse'
				egen double `i2' = sum(`fi' * (((`inc' / `meany')^2) - 1) / 2) if `touse'

				gen double `wgini' = `meany' * (1 - `gini') if `touse'

				lab var `gini' "Gini"
				lab var `im1' "GE(-1)"
				lab var `i0' "GE(0)"
				lab var `i1' "GE(1)"
				lab var `i2' "GE(2)"

				tempvar v9010 v9050 v1050 v7525
				gen `v9010' = `p90'/`p10' in 1
				gen `v9050' = `p90'/`p50' in 1
				gen `v1050' = `p10'/`p50' in 1
				gen `v7525' = `p75'/`p25' in 1
				lab var `v9010' "p90/p10"
				lab var `v9050' "p90/p50"
				lab var `v1050' "p10/p50"
				lab var `v7525' "p75/p25"


				noi { 
					di " "
					di as txt "Percentile ratios" 
					tabdisp `touse' in 1, c(`v9010' `v9050' `v1050' `v7525') f(%9.3f)

					global S_9010 = `p90'/`p10'
					global S_7525 = `p75'/`p25'
					return scalar p90p10 = `p90'/`p10' 
					return scalar p75p25 = `p75'/`p25' 
					return scalar p90p50 = `p90'/`p50'
					return scalar p10p50 = `p10'/`p50'
					return scalar p25p50 = `p25'/`p50' 
					return scalar p75p50 = `p75'/`p50' 

					di "  "
					di as txt "Generalized Entropy indices GE(a), where a = income difference" 
					di as txt " sensitivity parameter, and Gini coefficient"
					tabdisp `touse' in 1, c(`im1' `i0' `i1' `i2' `gini') f(%9.5f)
				}	

				// saved results compatible with previous versions of -ineqdeco-
				global S_gini = `gini'[1]
				global S_im1 = `im1'[1]
				global S_i0 = `i0'[1]
				global S_i1 = `i1'[1]
				global S_i2 = `i2'[1]

				return scalar gini = `gini'[1] 
				return scalar gem1 = `im1'[1] 
				return scalar ge0 = `i0'[1] 
				return scalar ge1 = `i1'[1] 
				return scalar ge2 = `i2'[1] 
					
				drop `gini' `im1' `i0' `i1' `i2' 

				egen double `edehalf' = sum(`fi' * sqrt(`inc') )  if `touse'
				replace `edehalf' = (`edehalf')^2 if `touse'
				gen double `ahalf' = 1 - `edehalf' / `meany'  if `touse'
				egen double `ede1' = sum(`fi' * log(`inc') ) if `touse'
				replace `ede1' = exp(`ede1')  if `touse'
				gen double `a1' = 1 - `ede1' / `meany'  if `touse'
				egen double `ede2' = sum(`fi' / `inc' )  if `touse'
				replace `ede2' = 1 / `ede2' if `touse' 
				gen double `a2' = 1 - `ede2' / `meany'  if `touse'

				lab var `ahalf' "A(0.5)"
				lab var `a1' "A(1)"
				lab var `a2' "A(2)"
				
				noi { 
					di "   "
					di as txt "Atkinson indices, A(e), where e > 0 is " _c
					di as txt "the inequality aversion parameter"
					tabdisp `touse' if `touse', c(`ahalf' `a1' `a2') f(%9.5f)
				}	

				global S_ahalf = `ahalf'[1]
				global S_a1 = `a1'[1]
				global S_a2 = `a2'[1]

				return scalar ahalf = `ahalf'[1] 
				return scalar a1 = `a1'[1] 
				return scalar a2 = `a2'[1] 

				drop `ahalf' `a1' `a2'  

				// results for Yede, welfare indices if requested: 

				if "`w'" == "w" {

					lab var `edehalf' "Yede(0.5)"
					lab var `ede1' "Yede(1)"
					lab var `ede2' "Yede(2)"

					noi { 
						di "   "
						di as txt "Equally-distributed-equivalent incomes, Yede(e)"
						tabdisp `touse' in 1, c(`edehalf' `ede1' `ede2') f(%15.5f)
						di "   "
					}	

					return scalar edehalf = `edehalf'[1]
					return scalar ede1 = `ede1'[1]
					return scalar ede2 = `ede2'[1]


					// Don't drop `edehalf' `ede1' `ede2' yet: needed in decomp

					egen double `whalf' = sum(`fi' * sqrt(`inc') * 2) if `touse'
					egen double `w1' = sum(`fi' * log(`inc') ) if `touse'
					egen double `w2' = sum(-`fi'/`inc') if `touse'
					lab var `whalf' "W(0.5)"
					lab var `w1' "W(1)"
					lab var `w2' "W(2)"
					lab var `wgini' "mean*(1-Gini)"

					noi { 
						di as txt "Social welfare indices, W(e), and Sen's welfare index"
						tabdisp `touse' in 1, c(`whalf' `w1' `w2' `wgini') f(%15.5f)
					}	


					return scalar whalf = `whalf'[1]
					return scalar w1 = `w1'[1]
					return scalar w2 = `w2'[1]
					return scalar wgini = `wgini'[1]


					drop `whalf' `w1' `w2'

				}

			*************************
			* SUBGROUP DECOMPOSITIONS
			*************************

			if "`bygroup'" != "" {	

				qui {
					tempvar notuse
						gen byte `notuse' = -`touse'
					sort `notuse' `bygroup' `inc'

					by `notuse' `bygroup': gen byte `first' = _n == 1 if `touse'
					by `notuse' `bygroup': egen double `nk' = sum(`wi') if `touse'

					gen double `vk' = `nk' / `sumwi' if `touse'
					gen double `fik' = `wi' / `nk' if `touse'
					by `notuse' `bygroup': egen double `meanyk' = sum(`fik' * `inc') if `touse'
					by `notuse' `bygroup': egen double `varyk' = sum(`fik'* (`inc' - `meanyk')^2) if `touse'
					gen double `loglamk' = log(`meanyk') if `touse'
					gen double `lambdak' = `meanyk' / `meany' if `touse'
					gen double `lgmeank' = log(`meanyk') if `touse'
					gen double `thetak' = `vk' * `lambdak' if `touse'
					by `notuse' `bygroup': egen double `im1k' = sum(`fik' * ((`meanyk' / `inc') - 1) / 2) if `touse'
					by `notuse' `bygroup': egen double `i0k' = sum(`fik' * log(`meanyk' / `inc')) if `touse'
					by `notuse' `bygroup': egen double `i1k' = sum(`fik' * (`inc' / `meanyk') * log(`inc' / `meanyk')) if `touse'
					by `notuse' `bygroup': egen double `i2k' = sum(`fik' * (((`inc' / `meanyk')^2) - 1) / 2) if `touse'

				}

				noi { 
					di "  "
					di as txt "Subgroup summary statistics, for each subgroup k = 1,...,K:"
					if "`summ'" != "" {
						bys `bygroup': sum `inc' [w = `wi'] if `touse', de
					}
				}	

				bysort `notuse' `bygroup' (`inc'): gen double `pyk' = (2 * sum(`wi') - `wi' + 1) / (2 * `nk' ) ///
					if `touse'

				by `notuse' `bygroup': egen double `ginik' = sum(`fik' * (2 / `meanyk') * `pyk' * (`inc' - `meanyk')) ///
					if `touse'

				gen double `wginik' = `meanyk' * (1 - `ginik') if `touse'

				lab var `vk' "Popn. share"
				lab var `meanyk' "Mean"
				lab var `lambdak' "Relative mean"
				lab var `thetak' "Income share"
				lab var `lgmeank' "log(mean)"
				lab var `ginik' "Gini"
				lab var `im1k' "GE(-1)"
				lab var `i0k' "GE(0)"
				lab var `i1k' "GE(1)"
				lab var `i2k' "GE(2)"
				lab var `wginik' "mean*(1-Gini)"

				noi { 
					di "  "
					tabdisp `bygroup' if `first' , c(`vk' `meanyk' `lambdak' `thetak' `lgmeank') f(%15.5f)

					di "  "
					di as txt "Subgroup indices: GE_k(a) and Gini_k "
					tabdisp `bygroup' if `first' , c(`im1k' `i0k' `i1k' `i2k' `ginik')  f(%9.5f)
				}

				
				capture levelsof `bygroup' if `touse' , local(group)
				qui if _rc levels `bygroup' if `touse' , local(group)

				return local levels "`group'"
				
				gsort -`first' `bygroup'
				local i = 1
				foreach k of local group	{
					return scalar gem1_`k' = `im1k'[`i']
					return scalar ge0_`k' = `i0k'[`i']
					return scalar ge1_`k' = `i1k'[`i']
					return scalar ge2_`k' = `i2k'[`i']
					return scalar gini_`k' = `ginik'[`i']

					return scalar mean_`k' = `meanyk'[`i']
					return scalar lgmean_`k' = `lgmeank'[`i']
					return scalar theta_`k' = `thetak'[`i']
					return scalar lambda_`k' = `lambdak'[`i']
					return scalar v_`k' = `vk'[`i']
					return scalar sumw_`k' = `nk'[`i']

					local ++i
				}

				drop `lgmeank' `ginik' `thetak' `nk' `pyk' 

				egen double `withm1' = sum(`fi' * `im1k' / `lambdak') if `touse'
				egen double `with0' = sum(`fi' * `i0k') if `touse'
				egen double `with1' = sum(`fi' * `i1k' * `lambdak') if `touse'
				egen double `with2' = sum(`fi' * `i2k' * `lambdak'^2) if `touse'
				lab var `withm1' "GE(-1)"
				lab var `with0' "GE(0)"
				lab var `with1' "GE(1)"
				lab var `with2' "GE(2)"

				noi { 
					di "  "
					di as txt "Within-group inequality, GE_W(a)"
					tabdisp `touse' in 1 if `touse', c(`withm1' `with0' `with1' `with2')  f(%9.5f)
				}	

				return scalar within_gem1 = `withm1'[1]
				return scalar within_ge0 = `with0'[1]
				return scalar within_ge1 = `with1'[1]
				return scalar within_ge2 = `with2'[1]

				drop `im1k' `i0k' `i1k' `i2k' `withm1' `with0' `with1' `with2' 

				** GE index between-group inequalities **

				egen double `im1b' = sum(`fi' * ((`meany' / `meanyk') - 1) / 2 ) if `touse'
				egen double `i0b' = sum(`fi' * log(`meany' / `meanyk')) if `touse'
				egen double `i1b' = sum(`fi' * (`meanyk' / `meany') * log(`meanyk' / `meany')) ///
					if `touse'
				egen double `i2b' = sum(`fi' * (((`meanyk' / `meany')^2) - 1) / 2) if `touse'
				lab var `im1b' "GE(-1)"
				lab var `i0b' "GE(0)"
				lab var `i1b' "GE(1)"
				lab var `i2b' "GE(2)"

				noi { 
					di "              "
					di as txt "Between-group inequality, GE_B(a):"
					tabdisp `touse' in 1 if `touse' , c(`im1b' `i0b' `i1b' `i2b')  f(%9.5f)
				}	

				return scalar between_gem1 = `im1b'[1]
				return scalar between_ge0 = `i0b'[1]
				return scalar between_ge1 = `i1b'[1]
				return scalar between_ge2 = `i2b'[1]

				drop `im1b' `i0b' `i1b' `i2b' 

				** Subgroup Atkinson and welfare indices **

				sort `notuse' `bygroup' 

				by `notuse' `bygroup': egen double `edehalfk' = sum(`fik' * sqrt(`inc')) if `touse'
				replace `edehalfk' = (`edehalfk')^2 if `touse'
				gen double `ahalfk' = 1 - `edehalfk' / `meanyk' if `touse'
				by `notuse' `bygroup': egen double `ede1k' = sum(`fik' * log(`inc')) if `touse'
				replace `ede1k' = exp(`ede1k') if `touse'
				gen `a1k' = 1 - `ede1k' / `meanyk' if `touse'
				by `notuse' `bygroup': egen double `ede2k' = sum(`fik' / `inc') if `touse'
				replace `ede2k' = 1 / `ede2k' if `touse'
				gen double `a2k' = 1 - `ede2k' / `meanyk' if `touse'

				lab var `ahalfk' "A(0.5)"
				lab var `a1k' "A(1)"
				lab var `a2k' "A(2)"

				noi { 
					di "              "
					di as txt "Subgroup Atkinson indices, A_k(e)"
					tabdisp `bygroup' if `first' , c(`ahalfk' `a1k' `a2k')  f(%9.5f)
				}


				egen double `awithh' = sum(`fi' * `lambdak' * `ahalfk') if `touse'
				egen double `awith1' = sum(`fi' * `lambdak' * `a1k') if `touse'
				egen double `awith2' = sum(`fi' * `lambdak' * `a2k') if `touse'
				lab var `awithh' "A(0.5)"
				lab var `awith1' "A(1)"
				lab var `awith2' "A(2)"

				noi {
					di "  "
					di as txt "Within-group inequality, A_W(e)"
					tabdisp `touse' if `touse' , c(`awithh' `awith1' `awith2')  f(%9.5f)
				}

				gsort -`first' `bygroup'
				local i = 1
				foreach k of local group	{
					return scalar ahalf_`k' = `ahalfk'[`i']
					return scalar a1_`k' = `a1k'[`i']
					return scalar a2_`k' = `a2k'[`i']
					local ++i
				}

				return scalar within_ahalf = `awithh'[1]
				return scalar within_a1 = `awith1'[1]
				return scalar within_a2 = `awith2'[1]

				drop `ahalfk' `a1k' `a2k' `awithh' `awith1' `awith2' `lambdak'

				* Atkinson between-group inequality (Blackorby et al., eqn (17))

				egen double `ahalfb' = sum(`fi' * `edehalfk' )  if `touse'
				replace `ahalfb' = 1 - `edehalf' / `ahalfb' if `touse'
				egen double `a1b' = sum(`fi' * `ede1k' )  if `touse'
				replace `a1b' = 1 - `ede1' / `a1b' if `touse'
				egen double `a2b' = sum(`fi' * `ede2k' )  if `touse'
				replace `a2b' = 1 - `ede2' / `a2b' if `touse'
				lab var `ahalfb' "A(0.5)"
				lab var `a1b' "A(1)"
				lab var `a2b' "A(2)"

				noi { 
					di " "
					di as txt "Between-group inequality, A_B(e)"
					tabdisp `touse' in 1 if `touse'	, c(`ahalfb' `a1b' `a2b') f(%9.5f)
				}	

				return scalar between_ahalf = `ahalfb'[1]
				return scalar between_a1 = `a1b'[1]
				return scalar between_a2 = `a2b'[1]
				return scalar edehalf = `edehalf'[1]
				return scalar ede1 = `ede1'[1]
				return scalar ede2 = `ede2'[1]

				drop `ahalfb' `a1b' `a2b' `edehalf' `ede1' `ede2'

				// results for Yede, welfare indices if requested 

				if "`w'" == "w" {
					lab var `edehalfk' "Yede(0.5)"
					lab var `ede1k' "Yede(1)"
					lab var `ede2k' "Yede(2)"

					noi { 
						di "              "
						di as txt "Subgroup equally-distributed-equivalent income, Yede_k(e)"
						tabdisp `bygroup' if `first', c(`edehalfk' `ede1k' `ede2k')  f(%15.5f)
					}

					gsort -`first' `bygroup'
					local i = 1
					foreach k of local group	{
						return scalar edehalf_`k' = `edehalfk'[`i']
						return scalar ede1_`k' = `ede1k'[`i']
						return scalar ede2_`k' = `ede2k'[`i']
						local ++i 
					}

					drop `edehalfk' `ede1k' `ede2k' 


					sort `notuse' `bygroup' 

					by `notuse' `bygroup': egen double `whalfk' = sum(`fik' * sqrt(`inc') * 2) if `touse'
					by `notuse' `bygroup': egen double `w1k' = sum(`fik' * log(`inc') ) if `touse'
					by `notuse' `bygroup': egen double `w2k' = sum(-`fik' / `inc') if `touse'
					lab var `whalfk' "W(0.5)"
					lab var `w1k' "W(1)"
					lab var `w2k' "W(2)"

					noi { 
						di "              "
						di as txt "Subgroup welfare indices: W_k(e) and Sen's index"
						tabdisp `bygroup' if `first', c(`whalfk' `w1k' `w2k' `wginik')  f(%15.5f)
					}  

					gsort -`first' `bygroup'
					local i = 1
					foreach k of local group	{
						return scalar whalf_`k' = `whalfk'[`i']
						return scalar w1_`k' = `w1k'[`i']
						return scalar w2_`k' = `w2k'[`i']
						return scalar wgini_`k' = `wginik'[`i']
						local ++i 
					}

					drop `whalfk' `w1k' `w2k'
				}

				drop `wginik' `fi'



			} 	// end of  "`bygroup'"  block for subgroup decompositions


			} 	// end quietly block

			end
					/*}}}*/
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

tempvar gini relsat popul py fi notuse ;

qui levelsof `environment' , local(typlist) ;
local typnum : word count `typlist' ;

sum `varlist' [`weight' `exp'] if `touse' , meanonly ;
	local sumwi = r(sum_w);
	local meany = r(mean);

gsort -`touse' `varlist' ;
gen double `fi' = `exp' / `sumwi' if `touse' ;
gen double `py' = (2 * sum(`exp') - `exp' + 1)/(2 * `sumwi' ) if `touse' ;
egen double `gini' = total(`fi'*(2 / `meany') * `py' * (`varlist' - `meany')) if `touse' ;
gen double `wgini' = `meany' * (1 - `gini') if `touse' ;

gen byte `notuse' = -`touse' ;
sort `notuse' `environment' `varlist' ;

	by `notuse' `environment': gen byte `first' = _n == 1 if `touse' ;
	by `notuse' `environment': egen double `nk' = total(`exp')  if `touse' ;

gen double `fik' = `exp' / `nk'  if `touse' ;
by `notuse' `bygroup': egen double `meanyk' = sum(`fik' * `inc')  if `touse' ;
bysort `notuse' `bygroup' (`inc'): gen double `pyk' = (2 * sum(`exp') - `exp' + 1) / (2 * `nk' ) if `touse' ;
by `environment': egen double `ginik' = sum(`fik' * (2 / `meanyk') * `pyk' * (`inc' - `meanyk'))  if `touse' ;
gen double `wginik' = `meanyk' * (1 - `ginik') if `touse' ;

lab var `gini' "Gini" ;
return scalar gini = `gini'[1] ;

qui ineqdeco `varlist' [`weight' `exp'] , bygroup(`environment');
local totgini = r(gini) ;
forvalues i=1/`typnum'{;
	local j : word `i' of `typlist' ;
	matrix `gini'[`i',1]=r(gini_`j');
	matrix `popul'[`i',1] = r(sumw_`j')/r(sumw);
};

local count = 1;
foreach i of local typlist {;
	sum `varlist' [`weight' `exp'] if inlist(`environment' ,`i'), meanonly;
	matrix `relsat'[`count',1] = r(mean)*(1-`gini'[`count',1]);
	local ++count;
};

qui sum `varlist' [`weight' `exp'] , meanonly ;
local totsat = r(mean) *(1-`totgini') ;
forvalues i=1/`typnum'{;
	local count = `i' + 1 ;
	if `count' <= `typnum' {;
		forvalues j=`count'/`typnum'{;
			local go = `go' + 0 + `popul'[`i',1]*`popul'[`j',1]*abs(`relsat'[`i',1]-`relsat'[`j',1]);
		};
	};
};
local go = `go'/`totsat' ;
return scalar index = `go' ;
end;
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
		local totpop = r(sum_w) ;
		sum `one' if `environment' == `disadv' [`weight' `exp'] , meanonly ;
		local dispop = r(sum_w) ;
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
		return scalar diswin = `diswin' ;
		return scalar dispop = `dispop' ;
		return scalar totwin = `totwin' ;
		return scalar totpop = `totpop' ;
end;
/*}}}*/
/** CUMDPLOT PROGRAM {{{*/
capture program drop cumd;
program define cumd, byable(recall);
	syntax varname [if] [in] [fw aw pw iw] 
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
