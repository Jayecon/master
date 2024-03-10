local grplist sex hscgrp majgrp f013

set more off
set matsize 10000
cd ~/dropbox/goms/results
use ~/dropbox/goms/goms , clear

tempname temp1 temp2
matrix `temp1' = J(1,8,.)

forvalue i = 2000/2011 {
foreach j in score3 score4 score5 income scorei scorej {
foreach k of local grplist {
	/*incometyep {{{*/
	if ("`j'" == "income") {
		local scoretype = 6
		local rri rri(percent,2.8)
	}
	else if ("`j'" == "scorei") {
		local scoretype = 1
		local rri rri(score,5)
	} 
	else if ("`j'" == "scorej") {
		local scoretype = 2
		local rri rri(score,5)
	} 
	else if ("`j'" == "score3") {
		local scoretype = 4
		local rri rri(score,3)
	} 
	else if ("`j'" == "score4") {
		local scoretype = 4
		local rri rri(score,4)
	} 
	else if ("`j'" == "score5") {
		local scoretype = 5
		local rri rri(score,5)
	} /*}}}*/
	/*grouptyep {{{*/
	if ("`k'" == "sex") {
		local grouptype = 7
	}
	else if ("`k'" == "hscgrp") {
		local grouptype = 8
	} 
	else if ("`k'" == "majgrp") {
		local grouptype = 9
	} 
	else if ("`k'" == "f013") {
		local grouptype = 10
	} /*}}}*/
	eopcal `j' [aw=wgt] if f001 == `i' , env(`k') goi b(2)
	matrix `temp1'[1,1] = 1			 
	matrix `temp1'[1,2] = 3          
	matrix `temp1'[1,3] = `i'        
	matrix `temp1'[1,4] = `grouptype'        
	matrix `temp1'[1,5] = `scoretype'
	matrix `temp1'[1,6] = r(index)   
	matrix `temp1'[1,7] = r(l95)     
	matrix `temp1'[1,8] = r(u95)     
	matrix `temp2' = (nullmat(`temp2') \ `temp1' )
}
}
}


forvalue i = 2000/2011 {
foreach j in score3 score4 score5 income scorei scorej {
foreach k of local grplist {
	/*incometyep {{{*/
	if ("`j'" == "income") {
		local scoretype = 6
		local rri rri(percent,2.8)
	}
	else if ("`j'" == "scorei") {
		local scoretype = 1
		local rri rri(score,5)
	} 
	else if ("`j'" == "scorej") {
		local scoretype = 2
		local rri rri(score,5)
	} 
	else if ("`j'" == "score3") {
		local scoretype = 4
		local rri rri(score,3)
	} 
	else if ("`j'" == "score4") {
		local scoretype = 4
		local rri rri(score,4)
	} 
	else if ("`j'" == "score5") {
		local scoretype = 5
		local rri rri(score,5)
	} /*}}}*/
	/*grouptyep {{{*/
	if ("`k'" == "sex") {
		local grouptype = 7
	}
	else if ("`k'" == "hscgrp") {
		local grouptype = 8
	} 
	else if ("`k'" == "majgrp") {
		local grouptype = 9
	} 
	else if ("`k'" == "f013") {
		local grouptype = 10
	} /*}}}*/
	eopcal `j' [aw=wgt] if f001 == `i' , env(`k') `rri' b(2)
	matrix `temp1'[1,1] = 2			 
	matrix `temp1'[1,2] = 3          
	matrix `temp1'[1,3] = `i'        
	matrix `temp1'[1,4] = `grouptype'        
	matrix `temp1'[1,5] = `scoretype'
	matrix `temp1'[1,6] = r(index)   
	matrix `temp1'[1,7] = r(l95)     
	matrix `temp1'[1,8] = r(u95)     
	matrix `temp2' = (nullmat(`temp2') \ `temp1' )
}
}
}

matrix colname `temp2' = indextype wavetype wave envtype scoretype index lci95 uci95 
svmat `temp2' , names(matcol)
	keep `temp2'*
	rename `temp2'* *
	keep if !missing(index)
	label var indextype "지수유형"
		label define INDEXTYPE 1 "GOI" 2 "RRI"
		label value indextype INDEXTYPE
	label var wavetype "년도기준"
		label define WAVETYPE 1 "조사회차" 2 "출생년도" 3 "고졸년도" 
		label value wavetype WAVETYPE
	label var envtype "환경유형"
		label define ENVTYP 1 "부모학력환경" 2 "부모소득환경" 3 "지역환경" 4 "PCA(학력, 소득, 지역)" 5 "PCA(학력, 소득)" 6 "PCA(학력, 소득, 성별)" 7 "성별" 8 "고교유형" 9 "대학계열" 10 "대입유형" 
		label value envtyp ENVTYP
	label var scoretype "성취유형"
		label define SCORETYPE 1 "소득5등급(0포함)" 2 "소득5등급" 3 "대학3등급" 4 "대학4등급" 5 "대학5등급" 6 "월평균소득"
		label value scoretype SCORETYPE
save goms_extraindicies.dta , replace
