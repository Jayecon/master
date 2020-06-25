#delimit ;
capture program drop domtest;
program define domtest, byable(recall);
	syntax [varname] [if] [in] [fw aw/] 
	, environment(varname) [Range(numlist min=2 max=2) options];

	marksample touse ;
	markout `touse' `environment';

	preserve;
	quietly keep if `touse';

	sum `environment' , meanonly;
	local n_GRP = r(max);
	local n_GRP_1 = r(max)-1;

	forvalue i = 1/`n_GRP_1' {;
		local n_j = `i'+1;
		forvalue j = `n_j'/`n_GRP'{;
				sum `1' if `environment'==`i'|`environment'==`j', meanonly;
				scalar zmax = r(max);
				qui keep if `1'>0 & `environment'==`i';
				qui keep `1' `exp';
				rename `1' `1'_temp;
				rename `exp' `exp'_temp;
				tempfile temp;
				if `"`range'"' != "" {;
					gettoken rmin rmax : range;
					_pctile `1'_temp [aw=`exp'_temp] , p(`rmin', `rmax');
					local min = r(r1); local max = r(r2); 
					qui drop if !inrange(`1'_temp , `min' , `max');};
				qui save "`temp'", replace;
				restore, preserve;
				quietly keep if `touse';

				qui keep if `1'>0&`environment'==`j';
				qui keep `1' `exp';
				if `"`range'"' != "" {;
					gettoken rmin rmax : range;
					_pctile `1' [aw=`exp'] , p(`rmin', `rmax');
					local min = r(r1); local max = r(r2); 
					qui drop if !inrange(`1' , `min' , `max');};
				qui merge using "`temp'";


				display " ";
				display in red "{bf:Test for `1''s Dominance Betweein `environment''s `i' and `j'}" ;
				dom `1'_temp `exp'_temp `1' `exp' zmax 40 99.9 ;
				dom `1'_temp `exp'_temp `1' `exp' zmax 40 99 ;  
				dom `1'_temp `exp'_temp `1' `exp' zmax 40 95 ; 
				restore, preserve;
				quietly keep if `touse';

			if r(order) == 3 & r(cfitv) == 95 {;
				qui keep if `environment'==`i' | `environment'==`j';
				ksmirnov `1', by(`environment');
				restore, preserve;
				quietly keep if `touse';
			};
		};
	};
end;

program define dom, rclass; // syntax is dom var1 wgt1 var2 wgt2 zmax #test-points
	version 6.0;
	local x1     `1';
	local wgt1   `2';
	local x2     `3';
	local wgt2   `4';
	local zmax = `5';
	local num  = `6';
	if `7' == 95{; local confitv = 1.96; };
		else if `7' == 99{; local confitv = 2.576; };
		else if `7' == 99.9{; local confitv = 3.291; };

	summarize `x1', meanonly;
	local min1   = r(min);
	local max1   = r(max);
	summarize `x2', meanonly;
	local min2   = r(min);
	local max2   = r(max);

	local min    = max(`min1',`min2');
	local zmax    = min(`max1',`max2');
	local inter  = (`zmax'-`min')/(`num'-1);
	local min    = `min' + 2*`inter';         // dont start at very end of tail;
	local zmax    = `zmax' - 2*`inter';         // dont end at very end of tail;
	local inter  = (`zmax'-`min')/(`num'-1);
	local done   = 0;
	local s      = 1;
	tempvar ind;
	 
	/*display " ";*/
	/*display "minimum test point is " `min';*/
	/*display "maximum test point is " `zmax';*/
	/*display " ";*/

	if `zmax' <= `min' {;
		local done = 1;
			display " ";
		display in red "error: " in yellow "max test point is not larger than min test point!";
		display " ";
	 };
	while `done' == 0 {;
	/*		display " ";*/
	/*      display "order " `s';*/
	/*      display "z          d1        d2        t-statistic";*/
			local alpha = `s' - 1;
		local  i    = 1;
		local  z    = `min';
		quietly gen `ind' = .;
		while `z'  <= `zmax' {;
				quietly fgt `x1' `wgt1' `z' `alpha';
				local  D1 =  ${D`s'};
				local VD1 =  ${VD`s'};
				quietly fgt `x2' `wgt2' `z' `alpha';
				local  D2 =  ${D`s'};
				local VD2 =  ${VD`s'};
				local   t = (`D2'-`D1')/sqrt(`VD1'+`VD2');
	/*		display %5.4f `z' "    " %5.4f `d1' "    " %5.4f `d2'  "    " %4.2f `t';*/
				local ind0 = 1.5;
				if `t' >=  `confitv' {; local ind0 = 1; };
				if `t' <= -`confitv' {; local ind0 = 2; };
				quietly replace `ind' = `ind0' if _n==`i';
				local z = `z' + `inter';
				local i = `i' + 1;
		};
		summarize `ind', meanonly;
		if r(mean) == 1 {; local done = 1;
			    global dorder = -`s';
	/*                  display "";*/
			    display as result "dominance achieved at order `s' with `7'%ci";
						return scalar order = `s';
						return scalar cfitv = `7';
						local s = 1;
		};
		if r(mean) == 2 {; local done = 1;
			    global dorder = `s';
	//					display "";
						display as result "dominance achieved at order `s' with `7'%ci";
						return scalar order = `s';
						return scalar cfitv = `7';
						local s = 1;
		};
		if `s' >= 3		{; local done = 1;
						global dorder = 0;
	//					display "";
						display as result "dominance not achieved up to order 3 with `7'%ci";
						return scalar order = `s';
						return scalar cfitv = `7';
		};
		drop `ind';
	      local s = `s' + 1;
	}; 
end;

program define fgt; * syntax is fgt var1 wgt z alpha;
	version 6.0;

	local var1		 `1';
	local wgt	 	 `2';
	local z			=`3';
	local alpha		=`4';
	local s			= `alpha' + 1;
	local afac 		= round(exp(lnfact(`alpha')),1); //a!

	tempvar 		N ind gap ngap;
	quietly gen 		`gap' = `z' - `var1';
	quietly gen 		`ind' = 0;
		quietly replace `ind' = 1 if `gap' >= 0;
	quietly gen 		`ngap' = `gap'/`z';
		quietly replace `gap' = (`gap'^`alpha')	  * `ind';
		quietly replace `ngap' = (`ngap'^`alpha') * `ind';

	summarize `gap' [aw=`wgt'], meanonly;
		local dhat = r(mean)/`afac';
	summarize `ngap' [aw=`wgt'], meanonly;
		local phat = r(mean);
	quietly replace `gap' = `gap' ^ 2;
	summarize `gap' [aw=`wgt'], meanonly;
		local vdhat= (1/r(N))*((r(mean)/(`afac'^2)) - (`dhat'^2));

	global P`alpha' = `phat';
	global D`s'	= `dhat';
	global VD`s' 	= `vdhat';

	display "P"`alpha' 	" = " `phat';
	display "D"`s' 		" = " `dhat';
	display "VD"`s' 	" = " `vdhat';
end;
exit;
#delimit cr
