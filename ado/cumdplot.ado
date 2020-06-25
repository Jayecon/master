#delimit ;
capture program drop cumdplot;
program define cumdplot, byable(recall);
	syntax varname [if] [in] [fw aw] 
		, BYgroup(varname) [ XRange(numlist min=2 max=2) YRange(numlist min=2 max=2) options] ;

	marksample touse ;
	markout `touse' `bygroup' ;

	preserve;
	quietly keep if `touse';

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
	foreach i of local levels {;
		local cv  c`bygroup'`i';
		local cvlist `cvlist' `cv';
		local cvvlist `cvvlist' `cv' `1';
		cumul `1' [`weight' `exp'] if `bygroup'==`i', equal gen(c`bygroup'`i');
		label variable `cv' `"`lbv`i''"'; 
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
			
	stack `cvvlist', into (c c`bygroup') wide;

/******************************** Drawing ******************************/
	if `"`xrange'"' != "" {;
		gettoken xmin xmax : xrange ;
		qui drop if  c`bygroup'< `xmin' | c`bygroup'> `xmax' ; 
	}; 

	line `cvlist' c`bygroup',
		sort ylab(, grid) ytitle("CDF") 
		xlab(, grid) xtitle("`lbs'", size(vlarge))
		legend( region(lpattern(blank) color(none)) pos(5) ring(0) col(1) `labels' );		

/******************************** Saving ******************************/
	local i = _byindex();
	capture mkdir figure;
	if _by() {;
		graph save "`c(pwd)'`c(dirsep)'figure`c(dirsep)'cum_`1'_`bygroup'_`_byvars'_`i'",replace;
		graph export "`c(pwd)'`c(dirsep)'figure`c(dirsep)'cum_`1'_`bygroup'_`_byvars'_`i'.png", as(png) replace;
	};
	else if _by() == 0 {;
		graph save "`c(pwd)'`c(dirsep)'figure`c(dirsep)'cum_`1'_`bygroup'",replace;
		graph export "`c(pwd)'`c(dirsep)'figure`c(dirsep)'cum_`1'_`bygroup'.png", as(png) replace;
	};
end;

exit;
#delimit cr
