clear
if "`anything'" == ""{ local anything 1 2 3 4 5 6 }
local fwave : word 1 of `anything'
foreach k of local anything {
	if `k' == 1 {
		local clist1 aus aut can col cyp csk dnk fra deu grc hkg hun isl irn irl isr kor kwt lva ltu nld nzl nor prt rom rus sgp slv svn esp swe che tha usa
		local fcntry1 : word 1 of `clist1'
	}		
	else if `k' == 2 {
		local clist2 aus bgr can chl twn cyp cze fin hkg hun idn irn isr ita jor kor lva ltu mkd mda mar mys nld nzl phl rom rus sgp svk svn tha tun tur usa
		local fcntry2 : word 1 of `clist2'
	}		
 	else if `k' == 3 {
		local clist3 arm aus bhr bwa bgr chl twn cyp egy eng est gha hkg hun idn irn isr ita jpn jor kor lva lbn ltu mkd mys mda mar nld nzl nor pse phl rom rus sau scg sgp svk svn zaf swe syr tun usa
		local fcntry3 : word 1 of `clist3'
	}
	else if `k' == 4 {
		local clist4 dza arm aus bhr bih bwa bgr twn col cyp cze egy slv geo gha hkg hun idn irn isr ita jpn jor kor kwt lbn ltu mys mlt mng mar nor omn pse qat rom rus sau scg sgp svn swe syr tha tun ukr usa
		local fcntry4 : word 1 of `clist4'
	}
	else if `k' == 5 {
		local clist5 arm aus bhr chl twn eng fin geo gha hkg hun idn irn isr ita jpn jor kaz kor lbn ltu mkd mys mar nzl nor omn pse qat rom rus sau sgp svn swe syr tha tun tur ukr are usa
		local fcntry5 : word 1 of `clist5'
	}
	else if `k' == 6 {
		local clist6 aus bhr bwa can chl twn egy eng geo hkg hun irn irl isr ita jpn jor kaz kor kwt lbn ltu mys mlt mar nzl nor omn qat rus sau sgp svn zaf swe tha tur are usa
		local fcntry6 : word 1 of `clist6'
	}
}
gen edugrp = mtredu
	mvdecode edugrp, mv(7=. \ 8=. \ 9=. \98=. \99=.)
gen bokgrp = stdbok
	mvdecode bokgrp, mv( 8=. \ 9=.)
mvdecode itsex, mv( 8=. \ 9=.)

gen group=.
foreach k of local anything {
	foreach y of local clist`k' {
	disp "Country: `y' Wave: `k'"
	preserve
	keep if cntry == "`y'" & wave == `k'
	_pctile edugrp [aw=totwgt] , nq(3)
	local q1 = `r(r1)'  local q2 = `r(r2)'
	if `q1' == 1 & `q1' == `q2'{
		replace edugrp = 3 if inrange(edugrp, 3, 99)
	}
	if `q1' == 1 & `q1' != `q2'{
		replace edugrp = 3 if inrange(edugrp, `q2', 99)
	}
	if `q1' > 1 & `q1' == `q2' {
		replace edugrp = 2 if inrange(edugrp, `q1' ,`q2'-.1)
		replace edugrp = 3 if inrange(edugrp, `q2', 99)
	}
	if `q1' > 1 & `q1' != `q2' {
		replace edugrp = 1 if inrange(edugrp, 0 ,`q1'-.1)
		replace edugrp = 2 if inrange(edugrp, `q1' ,`q2'-.1)
		replace edugrp = 3 if inrange(edugrp, `q2', 99)
	}
	_pctile bokgrp [aw=totwgt] , nq(3)
	local q1 = `r(r1)'  local q2 = `r(r2)'
	if `q1' > 1 {
		replace bokgrp = 1 if inrange(bokgrp , 0, `q1'-.1)
	}
	if `q1' == 1 & `q1' == `q2'{
		replace bokgrp = 3 if inrange(bokgrp, 3, 99)
	}
	if `q1' > 1 & `q1' == `q2' {
		replace bokgrp = 2 if inrange(bokgrp, `q1' ,`q2'-.1)
		replace bokgrp = 3 if inrange(bokgrp, `q2', 99)
	}
	if `q1' > 1 & `q1' != `q2' {
		replace bokgrp = 2 if inrange(bokgrp, `q1' ,`q2'-.1)
		replace bokgrp = 3 if inrange(bokgrp, `q2', 99)
	}
	
		replace group = 1 if inlist(itsex , 1) & inlist(edugrp, 1 ) & inlist(bokgrp, 1 )
		replace group = 2 if inlist(itsex , 1) & inlist(edugrp, 1 ) & inlist(bokgrp, 2 )
		replace group = 3 if inlist(itsex , 1) & inlist(edugrp, 1 ) & inlist(bokgrp, 3 )
		replace group = 4 if inlist(itsex , 1) & inlist(edugrp, 2 ) & inlist(bokgrp, 1 )
		replace group = 5 if inlist(itsex , 1) & inlist(edugrp, 2 ) & inlist(bokgrp, 2 )
		replace group = 6 if inlist(itsex , 1) & inlist(edugrp, 2 ) & inlist(bokgrp, 3 )
		replace group = 7 if inlist(itsex , 1) & inlist(edugrp, 3 ) & inlist(bokgrp, 1 )
		replace group = 8 if inlist(itsex , 1) & inlist(edugrp, 3 ) & inlist(bokgrp, 2 )
		replace group = 9 if inlist(itsex , 1) & inlist(edugrp, 3 ) & inlist(bokgrp, 3 )
		replace group = 10 if inlist(itsex , 2) & inlist(edugrp, 1 ) & inlist(bokgrp, 1 )
		replace group = 11 if inlist(itsex , 2) & inlist(edugrp, 1 ) & inlist(bokgrp, 2 )
		replace group = 12 if inlist(itsex , 2) & inlist(edugrp, 1 ) & inlist(bokgrp, 3 )
		replace group = 13 if inlist(itsex , 2) & inlist(edugrp, 2 ) & inlist(bokgrp, 1 )
		replace group = 14 if inlist(itsex , 2) & inlist(edugrp, 2 ) & inlist(bokgrp, 2 )
		replace group = 15 if inlist(itsex , 2) & inlist(edugrp, 2 ) & inlist(bokgrp, 3 )
		replace group = 16 if inlist(itsex , 2) & inlist(edugrp, 3 ) & inlist(bokgrp, 1 )
		replace group = 17 if inlist(itsex , 2) & inlist(edugrp, 3 ) & inlist(bokgrp, 2 )
		replace group = 18 if inlist(itsex , 2) & inlist(edugrp, 3 ) & inlist(bokgrp, 3 )
		capture label variable group "ENVIRONMENT TYPE"
		capture label define groupvalue 1 "girl&ledu&lbok" 2 "girl&ledu&mbok" 3 "girl&ledu&hbok" 
			4 "girl&medu&lbok" 5 "girl&medu&mbok" 6 "girl&medu&hbok" 7 "girl&hedu&lbok" 
			8 "girl&hedu&mbok" 9 "girl&hedu&hbok" 10 "boy&ledu&lbok" 11 "boy&ledu&mbok" 
			12 "boy&ledu&hbok" 13 "boy&medu&lbok" 14 "boy&medu&mbok" 15 "boy&medu&hbok" 
			16 "boy&hedu&lbok" 17 "boy&hedu&mbok" 18 "boy&hedu&hbok" 
		capture label values group groupvalue
		rename group cgrp

		order _all, alphabetic
		compress
	local timss_`y'`k' : tempfile
	save "`timss_`y'`k''", replace 
	restore
	}
}

foreach k of local anything {
	foreach y of local clist`k' {
		if "`k'" == "`fwave'" & "`y'" == "`fcntry`k''" { 
			use "`timss_`y'`k''", replace
			save "`path_input'timss.dta", replace
			saveold "`path_input'timss_v11.dta", replace }
		else { 
			use "`path_input'timss.dta", clear
			append using "`timss_`y'`k''"
			save "`path_input'timss.dta", replace
			saveold "`path_input'timss_v11.dta", replace }
	}
}

end
exit
