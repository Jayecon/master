clear
#delimit ;
capture program drop timss_merge;
program timss_merge;
syntax [anything];

if "`anything'" == ""{; local anything 1 2 3 4 5 6; };

local fwave : word 1 of `anything';

if "`c(os)'" == "Windows" { ;
	local path_output C:\Users`c(dirsep)'`c(username)'\Dropbox\Stata\TIMSS\Stata_original`c(dirsep)' ;
	local path_input C:\Users`c(dirsep)'`c(username)'\Dropbox\Stata\TIMSS\data`c(dirsep)' ; };
else if "`c(os)'" == "MacOSX" { ;
	local path_output /Users/`c(username)'/Dropbox/Stata/TIMSS/Stata_original`c(dirsep)' ;
	local path_input /Users/`c(username)'/Dropbox/Stata/TIMSS/data`c(dirsep)' ; };

foreach k of local anything {;
	if `k' == 1 {;
		local clist aus aut can col cyp csk 
					dnk fra deu grc hkg 
					hun isl irn irl isr kor 
					kwt lva ltu nld nzl nor 
					prt rom rus sgp slv 
					svn esp swe che tha usa;
	};		
	else if `k' == 2 {;
		local clist aus bgr can chl twn 
			cyp cze fin hkg hun 
			idn irn isr ita jor 
			kor lva ltu mkd mda 
			mar mys nld nzl phl 
			rom rus sgp svk svn 
			tha tun tur usa;
	};		
 	else if `k' == 3 {;
		local clist arm aus bhr bwa bgr
			chl twn cyp egy eng 
			est gha hkg hun idn
			irn isr ita jpn jor
			kor lva lbn ltu mkd
			mys mda mar nld nzl
			nor pse phl rom rus
			sau scg sgp svk
			svn zaf swe syr tun
			usa;
	};
	else if `k' == 4 {;
		local clist dza arm aus bhr bih
			bwa bgr twn col cyp cze 
			egy slv geo gha hkg 
			hun idn irn isr ita jpn 
			jor kor kwt lbn ltu mys 
			mlt mng mar nor omn pse 
			qat rom rus sau scg 
			sgp svn swe syr tha tun 
			ukr usa;
	};
	else if `k' == 5 {;
		local clist arm aus bhr chl twn 
			eng fin geo gha hkg 
			hun idn irn isr ita 
			jpn jor kaz kor lbn
			ltu mkd mys mar nzl 
			nor omn pse qat rom 
			rus sau sgp svn swe 
			syr tha tun tur ukr 
			are usa;
	};
	else if `k' == 6 {;
		local clist aus bhr bwa can chl 
			twn egy eng geo hkg 
			hun irn irl isr ita 
			jpn jor kaz kor kwt
			lbn ltu mys mlt mar 
			nzl nor omn qat rus 
			sau sgp svn zaf swe 
			tha tur are usa;
	};
	local fcntry : word 1 of `clist';
	foreach y of local clist {;
	disp "Country: `y' Wave: `k'";
		use "`path_input'bcg`y'm`k'.dta", clear;
		local rlist schpop ;
		foreach z of local rlist {;
			local lbv`z' : value label `z';
			local lbn`z' : variable label `z';
		};
		merge 1:m idschool using "`path_input'bsa`y'm`k'.dta" ; drop _merge;
		drop if idstud == .;
		merge 1:1 idstud using "`path_input'bsg`y'm`k'.dta" ; drop _merge;
		save "`path_input'`y'm`k'.dta", replace; 

		use "`path_input'bst`y'm`k'.dta", clear;
		merge m:m idteach using "`path_input'btm`y'm`k'.dta"; drop _merge;
		merge m:m idteach using "`path_input'bts`y'm`k'.dta"; drop _merge;
		local klist stcqul stcpop mtcqul mtcpop ;
		foreach z of local klist {;
			local lbv`z' : value label `z';
			local lbn`z' : variable label `z';
		};
		drop if missing(idstud);
		bys idstud: gen num = _n;
		qui sum num;
		local max = r(max);
		keep idstud num `klist' ;
		reshape wide `klist' , i(idstud) j(num);
		order _all, alphabetic;
		foreach z of local klist {;
			egen `z' = rowmax(`z'1-`z'`max');
			drop `z'1-`z'`max';
			label variable `z' `"`lbn`z''"';
			label values `z' `lbv`z'';
		};

		merge 1:1 idstud using "`path_input'`y'm`k'.dta" ; drop _merge;
		gen group = .;
			replace group = 1 if inlist(itsex , 1) & inrange(mtredu, 1 ,1) & inrange(stdbok, 1 ,1);
			replace group = 2 if inlist(itsex , 1) & inrange(mtredu, 1 ,1) & inrange(stdbok, 2 ,3);
			replace group = 3 if inlist(itsex , 1) & inrange(mtredu, 1 ,1) & inrange(stdbok, 4 ,5);
			replace group = 4 if inlist(itsex , 1) & inrange(mtredu, 2 ,4) & inrange(stdbok, 1 ,1);
			replace group = 5 if inlist(itsex , 1) & inrange(mtredu, 2 ,4) & inrange(stdbok, 2 ,3);
			replace group = 6 if inlist(itsex , 1) & inrange(mtredu, 2 ,4) & inrange(stdbok, 4 ,5);
			replace group = 7 if inlist(itsex , 1) & inrange(mtredu, 5 ,6) & inrange(stdbok, 1 ,1);
			replace group = 8 if inlist(itsex , 1) & inrange(mtredu, 5 ,6) & inrange(stdbok, 2 ,3);
			replace group = 9 if inlist(itsex , 1) & inrange(mtredu, 5 ,6) & inrange(stdbok, 4 ,5);
			replace group = 10 if inlist(itsex , 2) & inrange(mtredu, 1 ,1) & inrange(stdbok, 1 ,1);
			replace group = 11 if inlist(itsex , 2) & inrange(mtredu, 1 ,1) & inrange(stdbok, 2 ,3);
			replace group = 12 if inlist(itsex , 2) & inrange(mtredu, 1 ,1) & inrange(stdbok, 4 ,5);
			replace group = 13 if inlist(itsex , 2) & inrange(mtredu, 2 ,4) & inrange(stdbok, 1 ,1);
			replace group = 14 if inlist(itsex , 2) & inrange(mtredu, 2 ,4) & inrange(stdbok, 2 ,3);
			replace group = 15 if inlist(itsex , 2) & inrange(mtredu, 2 ,4) & inrange(stdbok, 4 ,5);
			replace group = 16 if inlist(itsex , 2) & inrange(mtredu, 5 ,6) & inrange(stdbok, 1 ,1);
			replace group = 17 if inlist(itsex , 2) & inrange(mtredu, 5 ,6) & inrange(stdbok, 2 ,3);
			replace group = 18 if inlist(itsex , 2) & inrange(mtredu, 5 ,6) & inrange(stdbok, 4 ,5);
			label variable group "GROUP BY MOTHER'S EDU AND SEX";
			label define groupvalue 1 "girl&ledu&lbok" 2 "girl&ledu&mbok" 3 "girl&ledu&hbok" 4 "girl&medu&lbok" 5 "girl&medu&mbok" 6 "girl&medu&hbok" 
									7 "girl&hedu&lbok" 8 "girl&hedu&mbok" 9 "girl&hedu&hbok" 10 "boy&ledu&lbok" 11 "boy&ledu&mbok" 12 "boy&ledu&hbok"
									13 "boy&medu&lbok" 14 "boy&medu&mbok" 15 "boy&medu&hbok" 16 "boy&hedu&lbok" 17 "boy&hedu&mbok" 18 "boy&hedu&hbok" ;
			label values group groupvalue;
			rename group cgrp;

		//forvalue z = 1(1)18{;
		//	xtile megrp`z' = bsmmat01 [aw = totwgt] if cgrp == `z' , nq(3);
		//	xtile segrp`z' = bsssci01 [aw = totwgt] if cgrp == `z' , nq(3);
		//};
		//order _all, alphabetic;
		//egen megrp = rowmax(megrp1-megrp9);
			//label variable megrp "MATH EFFORT GROUP";
		//egen segrp = rowmax(segrp1-segrp9);
			//label variable segrp "SCIENCE EFFORT GROUP";
		//drop megrp1-megrp9;
		//drop segrp1-segrp9;

		gen cntry = "`y'";
			label variable cntry "COUNTRY 3CHAR";
		gen byte wave = `k';
			label variable wave "WAVE NUMBER";
		order _all, alphabetic;
		capture drop bsmmat02-bsssci05;
		compress;
		save "`path_input'`y'm`k'.dta", replace; 

		local abc : tempfile;
		if "`k'" == "`fwave'" & "`y'" == "`fcntry'" {; 
			save "`path_input'timss.dta", replace;
			saveold "`path_input'timss_v11.dta", replace; };
		else {; 
			save "`abc'" , replace;
			use "`path_input'timss.dta", clear;
			append using "`abc'";
			save "`path_input'timss.dta", replace;
			saveold "`path_input'timss_v11.dta", replace; };
	};
};

end;
exit;
#delimit cr
