#delimit ;
capture program drop kdenplot;
program define kdenplot, byable(recall);
	syntax varname [if] [in] [fw aw] 
		, BYgroup(varname) [  Number(integer 500) YRange(numlist min=2 max=2) XRange(numlist min=2 max=2) options Kernel(string)];
	tempvar touse;
	mark `touse' `if' `in';

	preserve;
	quietly keep if `touse';
	/*local n_by = _byindex();*/
/******************************** Labeling ******************************/
	qui levelsof `bygroup', local(levels);
	local lbg : variable label `bygroup';
	local lbs : variable label `1';
	local lvscnt = 1;	
	qui inspect `bygroup';
	if r(N_undoc) != 0{;	
		foreach l of local levels {;
			local lbv`l' `l';
			local labels `labels' label(`lvscnt' `l') ;
			local ++lvscnt; };
	};
	else if r(N_undoc) == 0{;
		local lbe : value label `bygroup';	
		foreach l of local levels {;
			local lbv`l' : label `lbe' `l';
			local labels `labels' label(`lvscnt' `lbv`l'') ;
			local ++lvscnt; };
	};
	
/******************************** Gen Cumul ******************************/
	kdensity `1' [`weight' `exp'] , n(`number') nograph gen(x c`bygroup') kernel(`kernel');
	
	foreach i of local levels {;
		local cv  c`bygroup'`i';
		local cvlist `cvlist' `cv';
		kdensity `1' [`weight' `exp'] if `bygroup'==`i', nograph gen(c`bygroup'`i') at(x) kernel(`kernel');
		label var c`bygroup'`i' `"`lbv`i''"'; 
		};

		if `"`yrange'"' != "" {;
			gettoken ymin ymax : yrange ;
			local yymin = `ymin'/100 ;
			local yymax = `ymax'/100 ;
			foreach i of local levels {;

			qui drop if `bygroup' == `i' & 
				(c`bygroup'`i' < `yymin' | c`bygroup'`i' > `yymax') ; 
				}; 
		};			

/******************************** Drawing ******************************/
	if `"`xrange'"' != "" {;
		gettoken xmin xmax : xrange ;
		qui drop if  x < `xmin' | x > `xmax' ; }; 

	line `cvlist' x ,
	sort ytitle(Density)
		xtitle("`lbs'", size(vlarge))
		legend( region(lpattern(blank) color(none)) pos(1) ring(0) col(1) `labels'  );		

/******************************** Saving ******************************/
	local i = _byindex();
	capture mkdir figure;
	if _by() {;
		graph save "`c(pwd)'`c(dirsep)'figure`c(dirsep)'kdn_`1'_`bygroup'_`_byvars'_`i'",replace;
		graph export "`c(pwd)'`c(dirsep)'figure`c(dirsep)'kdn_`1'_`bygroup'_`_byvars'_`i'.png", as(png) replace;
	};
	else if _by() == 0 {;
		graph save "`c(pwd)'`c(dirsep)'figure`c(dirsep)'kdn_`1'_`bygroup'",replace;
		graph export "`c(pwd)'`c(dirsep)'figure`c(dirsep)'kdn_`1'_`bygroup'.png", as(png) replace;
	};

end;

exit;
#delimit cr

