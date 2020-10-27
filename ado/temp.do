preserve ;
tempvar temp1 temp2 temp3 temp4 ;
tempfile tempdata ;
/* 자료수가 가장 적은 환경유형 및 자료수 찾기{{{*/
qui levelsof `environment' , local(typlist) ; 
local typnum : word count `typlist' ;
local mintyp = . ;
forvalue i of local typlist { ;
	count if `environment' == `i' ;
	if (r(N) < `mintyp' ) { ;
		local mintyp = `i' ;
		local minnum = r(N) ;
	} ;
} ; 
/*}}}*/
/* 상이한 환경에서 동일한 노력(분위)을 한 집단 표시{{{*/
bys `environment' : gen `temp1' = _n ;
foreach i of local typlist {;
	xtile temp`i' = `temp1' if `environment' == `i' , n(`minnum') ;
};
egen `temp2' = rowmax(temp?) ;
/*}}}*/
/* 상이한 환경에서 동일한 노력을 한 집단에게 동일소득 부여{{{*/
gen `temp3' = . ;
forvalue i = 1/`minnum' { ;
	sum `varlist' if `temp2' == `i' , meanonly ;
	replace `temp3' = r(mean) if `temp2' == `i' ;
};
/*}}}*/
bys `temp2' : egen `temp4' = total(`weight') ; /*기회평등 집단에 대한 가중치 생성*/
keep `temp3' `temp4' `environment' ; /*성취변수 환경변수 가중치만 남김*/
keep if `environmnet' == `mintyp' ;
replace `environment' = -9 ;
local venvlabel : value label `environment' ;
label define `venvlabel' -9 "기회평등" , add ;
rename `temp3' `varlist' ;
rename `temp4' `weight' ;
save `tempdata' ;
restore ;
