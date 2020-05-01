#delimit ; 
program ineqgen2, rclass;
	//version 13.1;
	syntax [varlist][if][in][fw aw]
		[, Bygroup(varname) Year(numlist) Welfare Summarize FName(string)];
	tempvar touse;
	mark `touse' `if' `in';
	
	preserve;
	tokenize `varlist';

	if "`year'" == "" {; local year 1 2 3 4 5 6; };

	if "`c(os)'" == "Windows" { ;
		local path_input C:\Users`c(dirsep)'`c(username)'\Dropbox\Stata\TIMSS\data`c(dirsep)' ; };
	else if "`c(os)'" == "MacOSX" { ;
		local path_input /Users/`c(username)'/Dropbox/Stata/TIMSS/data`c(dirsep)' ; };

	if `"`fname'"' == "" {; local fname ineqdata; };

	if "`c(os)'" == "Windows" {; capture erase `fname'.xlsx; };
	else if "`c(os)'" == "MacOSX" {; capture rm `fname'.xlsx; };

	local fvar : word 1 of `varlist';
	local fyer : word 1 of `year';
	levelsof `bygroup' , local(glist);

foreach k of local varlist {;
	tempvar `k'_c;
	gen ``k'_c' = .;
	foreach i of local year{;
		if `i' == 1 {;
		local clist aus aut can col cyp csk 
					dnk fra deu grc hkg 
					hun isl irn irl isr kor 
					kwt lva ltu nld nzl nor 
					prt rom rus sgp slv 
					svn esp swe che tha usa;  };		
		else if `i' == 2 {;
			local clist aus bgr can chl twn 
				cyp cze fin hkg hun 
				idn irn isr ita jor 
				kor lva ltu mkd mda 
				mar mys nld nzl phl 
				rom rus sgp svk svn 
				tha tun tur usa; };		
		else if `i' == 3 {;
			local clist arm aus bhr bwa bgr
				chl twn cyp egy eng 
				est gha hkg hun idn
				irn isr ita jpn jor
				kor lva lbn ltu mkd
				mys mda mar nld nzl
				nor pse phl rom rus
				sau scg sgp svk
				svn zaf swe syr tun
				usa; };
		else if `i' == 4 {;
			local clist dza arm aus bhr bih
				bwa bgr twn col cyp cze 
				egy slv geo gha hkg 
				hun idn irn isr ita jpn 
				jor kor kwt lbn ltu mys 
				mlt mng mar nor omn pse 
				qat rom rus sau scg 
				sgp svn swe syr tha tun 
				ukr usa; };
		else if `i' == 5 {;
			local clist arm aus bhr chl twn 
				eng fin geo gha hkg 
				hun idn irn isr ita 
				jpn jor kaz kor lbn
				ltu mkd mys mar nzl 
				nor omn pse qat rom 
				rus sau sgp svn swe 
				syr tha tun tur ukr 
				are usa; };
		else if `i' == 6 {;
			local clist aus bhr bwa can chl 
				twn egy eng geo hkg 
				hun irn irl isr ita 
				jpn jor kaz kor kwt
				lbn ltu mys mlt mar 
				nzl nor omn qat rus 
				sau sgp svn zaf swe 
				tha tur are usa; };
		local excnt 2;
		foreach j of local clist {;
			disp "`j'm`i'_`k'";
			reg `k' dsex cbok cedu if inlist(cntry, `"`j'"') & inlist(wave, `i')  [`weight' `exp'];
			predict yhat if e(sample) , xb;
			predict uhat if e(sample) , residual;
			local beff = e(rmse)^2;
			mat reg`j'`i' = e(b);
			local bsex = reg`j'`i'[1,1]; capture local bbok = reg`j'`i'[1,2]; capture local bedu = reg`j'`i'[1,3]; capture local coef = reg`j'`i'_`z'[1,4];
			
			capture			 sum dsex [`weight' `exp'] if inlist(cntry, `"`j'"') & inlist(wave, `i') , meanonly; local msex = r(sum_w);
			capture			 sum cbok [`weight' `exp'] if inlist(cntry, `"`j'"') & inlist(wave, `i') , meanonly; local mbok = r(sum_w);
			capture			 sum cedu [`weight' `exp'] if inlist(cntry, `"`j'"') & inlist(wave, `i') , meanonly; local medu = r(sum_w);
			capture		replace  ``k'_c' = `coef' + `bsex'*`msex' + `bbok'*`mbok' + `bedu'*`medu'  if inlist(cntry, `"`j'"') & inlist(wave, `i') & inlist(`bygroup' , `z');
			sum yhat if inlist(cntry, `"`j'"') & inlist(wave, `i') ; local vyhat = r(Var);
			sum `k' if inlist(cntry, `"`j'"') & inlist(wave, `i') ; local v`k' = r(Var);
			
			local index = `vyhat' /`v`k'';
			disp `index';
			qui putexcel 
				A1=("cntry") B1=("wave") C1=("variable") 
					D1=("index")  
				A`excnt'=("`j'")  B`excnt'=("`i'") C`excnt'=("``k'_c'") 
					D`excnt'=(`index')  
				using `fname', sheet(`"`k'-`i'"') modify colwise;
			drop yhat; drop uhat;
			local ++excnt; }; 
		local abc : tempfile;
		import excel using `fname', firstrow clear sheet(`"`k'-`i'"') ;
			if "`k'" == "`fvar'" & "`i'" == "`fyer'" {; 
				save "`path_input'`fname'.dta", replace; 
				use "`path_input'timss.dta", clear; };
			else {; 
				save "`abc'" , replace;
				use "`path_input'`fname'.dta", clear;
				append using "`abc'";
				save "`path_input'`fname'.dta", replace;
				use "`path_input'timss.dta", clear; };
	}; 
};

use "`path_input'`fname'.dta", clear;
encode wave , gen(aaa);
drop wave;
rename aaa wave;
save "`path_input'`fname'.dta", replace; 
saveold "`path_input'`fname'_v11.dta", replace; 
order wave , after(variable);

end;
exit;

#delimit cr
	
