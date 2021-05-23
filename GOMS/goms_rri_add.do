local grplist incgrp2 edugrp2 

set more off
set matsize 10000
cd ~/dropbox/goms/results
use ~/dropbox/goms/goms , clear

tempname temp1 temp2
matrix `temp1' = J(1,12,.)

/*RRI 교육 고졸년도 {{{*/
forvalue i = 2000/2011 {
forvalue j = 3/5 {
foreach k of local grplist {
	/*incometype {{{*/
	if ("`j'" == "3") {
		local rri rri(score,3)
	}
	else if ("`j'" == "4") {
		local rri rri(score,4)

	} 
	else if ("`j'" == "5") {
		local rri rri(score,5)
	} /*}}}*/
	/*grouptype {{{*/
	if ("`k'" == "edugrp") {
		local grouptype = 1
	}
	else if ("`k'" == "incgrp") {
		local grouptype = 2
	} 
	else if ("`k'" == "rgngrp") {
		local grouptype = 3
	} 
	else if ("`k'" == "pcagrp") {
		local grouptype = 4
	} 
	else if ("`k'" == "pcagrp2") {
		local grouptype = 5
	} 
	else if ("`k'" == "pcagrp3") {
		local grouptype = 6
	}
	else if ("`k'" == "edugrp2") {
		local grouptype = 7
	}
	else if ("`k'" == "incgrp2") {
		local grouptype = 8
	} /*}}}*/
	eopcal score`j' [aw=wgt] if f001 == `i' , env(`k') `rri' b(2)
	matrix `temp1'[1,1] = 2			 
	matrix `temp1'[1,2] = 3          
	matrix `temp1'[1,3] = `i'        
	matrix `temp1'[1,4] = `grouptype'        
	matrix `temp1'[1,5] = -1         
	matrix `temp1'[1,6] = -1         
	matrix `temp1'[1,7] = r(index)   
	matrix `temp1'[1,8] = r(l95)     
	matrix `temp1'[1,9] = r(u95)     
	matrix `temp1'[1,10] = `j'
	matrix `temp1'[1,11] = -1
	matrix `temp1'[1,12] = -1
	matrix `temp2' = (nullmat(`temp2') \ `temp1' )
}
}
} /*}}}*/
/*RRI 교육 고졸년도 성별{{{*/
forvalue m = 1/2 {
forvalue i = 2000/2011 {
forvalue j = 3/5 {
foreach k of local grplist {
	/*incometype {{{*/
	if ("`j'" == "3") {
		local rri rri(score,3)
	}
	else if ("`j'" == "4") {
		local rri rri(score,4)

	} 
	else if ("`j'" == "5") {
		local rri rri(score,5)
	} /*}}}*/
	/*grouptype {{{*/
	if ("`k'" == "edugrp") {
		local grouptype = 1
	}
	else if ("`k'" == "incgrp") {
		local grouptype = 2
	} 
	else if ("`k'" == "rgngrp") {
		local grouptype = 3
	} 
	else if ("`k'" == "pcagrp") {
		local grouptype = 4
	} 
	else if ("`k'" == "pcagrp2") {
		local grouptype = 5
	} 
	else if ("`k'" == "pcagrp3") {
		local grouptype = 6
	}
	else if ("`k'" == "edugrp2") {
		local grouptype = 7
	}
	else if ("`k'" == "incgrp2") {
		local grouptype = 8
	} /*}}}*/
	eopcal score`j' [aw=wgt] if f001 == `i' & sex == `m' , env(`k') `rri' b(2)
	matrix `temp1'[1,1] = 2			 
	matrix `temp1'[1,2] = 3          
	matrix `temp1'[1,3] = `i'        
	matrix `temp1'[1,4] = `grouptype'        
	matrix `temp1'[1,5] = -1         
	matrix `temp1'[1,6] = `m'		
	matrix `temp1'[1,7] = r(index)   
	matrix `temp1'[1,8] = r(l95)     
	matrix `temp1'[1,9] = r(u95)     
	matrix `temp1'[1,10] = `j'
	matrix `temp1'[1,11] = -1
	matrix `temp1'[1,12] = -1
	matrix `temp2' = (nullmat(`temp2') \ `temp1' )
}
}
}
} /*}}}*/
/*RRI 교육 고졸년도 전형별 {{{*/
forvalue l = 1/2 {
forvalue i = 2000/2011 {
forvalue j = 3/5 {
foreach k of local grplist {
	/*incometype {{{*/
	if ("`j'" == "3") {
		local rri rri(score,3)
	}
	else if ("`j'" == "4") {
		local rri rri(score,4)

	} 
	else if ("`j'" == "5") {
		local rri rri(score,5)
	} /*}}}*/
	/*grouptype {{{*/
	if ("`k'" == "edugrp") {
		local grouptype = 1
	}
	else if ("`k'" == "incgrp") {
		local grouptype = 2
	} 
	else if ("`k'" == "rgngrp") {
		local grouptype = 3
	} 
	else if ("`k'" == "pcagrp") {
		local grouptype = 4
	} 
	else if ("`k'" == "pcagrp2") {
		local grouptype = 5
	} 
	else if ("`k'" == "pcagrp3") {
		local grouptype = 6
	}
	else if ("`k'" == "edugrp2") {
		local grouptype = 7
	}
	else if ("`k'" == "incgrp2") {
		local grouptype = 8
	} /*}}}*/
	eopcal score`j' [aw=wgt] if f001 == `i' & f013 == `l' , env(`k') `rri' b(2)
	matrix `temp1'[1,1] = 2			 
	matrix `temp1'[1,2] = 3          
	matrix `temp1'[1,3] = `i'        
	matrix `temp1'[1,4] = `grouptype'        
	matrix `temp1'[1,5] = `l'        
	matrix `temp1'[1,6] = -1         
	matrix `temp1'[1,7] = r(index)   
	matrix `temp1'[1,8] = r(l95)     
	matrix `temp1'[1,9] = r(u95)     
	matrix `temp1'[1,10] = `j'
	matrix `temp1'[1,11] = -1
	matrix `temp1'[1,12] = -1
	matrix `temp2' = (nullmat(`temp2') \ `temp1' )
}
}
}
} /*}}}*/
/*RRI 교육 고졸년도 고교유형별 {{{*/
forvalue p = 1/3 {
forvalue i = 2000/2011 {
forvalue j = 3/5 {
foreach k of local grplist {
	/*incometype {{{*/
	if ("`j'" == "3") {
		local rri rri(score,3)
	}
	else if ("`j'" == "4") {
		local rri rri(score,4)

	} 
	else if ("`j'" == "5") {
		local rri rri(score,5)
	} /*}}}*/
	/*grouptype {{{*/
	if ("`k'" == "edugrp") {
		local grouptype = 1
	}
	else if ("`k'" == "incgrp") {
		local grouptype = 2
	} 
	else if ("`k'" == "rgngrp") {
		local grouptype = 3
	} 
	else if ("`k'" == "pcagrp") {
		local grouptype = 4
	} 
	else if ("`k'" == "pcagrp2") {
		local grouptype = 5
	} 
	else if ("`k'" == "pcagrp3") {
		local grouptype = 6
	}
	else if ("`k'" == "edugrp2") {
		local grouptype = 7
	}
	else if ("`k'" == "incgrp2") {
		local grouptype = 8
	} /*}}}*/
	eopcal score`j' [aw=wgt] if f001 == `i' & hscgrp == `p' , env(`k') `rri' b(2)
	matrix `temp1'[1,1] = 2			 
	matrix `temp1'[1,2] = 3          
	matrix `temp1'[1,3] = `i'        
	matrix `temp1'[1,4] = `grouptype'        
	matrix `temp1'[1,5] = -1       
	matrix `temp1'[1,6] = -1         
	matrix `temp1'[1,7] = r(index)   
	matrix `temp1'[1,8] = r(l95)     
	matrix `temp1'[1,9] = r(u95)     
	matrix `temp1'[1,10] = `j'
	matrix `temp1'[1,11] = `p'
	matrix `temp1'[1,12] = -1
	matrix `temp2' = (nullmat(`temp2') \ `temp1' )
}
}
}
} /*}}}*/
/*RRI 교육 고졸년도 대학계열별 {{{*/
forvalue q = 1/3 {
forvalue i = 2000/2011 {
forvalue j = 3/5 {
foreach k of local grplist {
	/*incometype {{{*/
	if ("`j'" == "3") {
		local rri rri(score,3)
	}
	else if ("`j'" == "4") {
		local rri rri(score,4)

	} 
	else if ("`j'" == "5") {
		local rri rri(score,5)
	} /*}}}*/
	/*grouptype {{{*/
	if ("`k'" == "edugrp") {
		local grouptype = 1
	}
	else if ("`k'" == "incgrp") {
		local grouptype = 2
	} 
	else if ("`k'" == "rgngrp") {
		local grouptype = 3
	} 
	else if ("`k'" == "pcagrp") {
		local grouptype = 4
	} 
	else if ("`k'" == "pcagrp2") {
		local grouptype = 5
	} 
	else if ("`k'" == "pcagrp3") {
		local grouptype = 6
	}
	else if ("`k'" == "edugrp2") {
		local grouptype = 7
	}
	else if ("`k'" == "incgrp2") {
		local grouptype = 8
	} /*}}}*/
	eopcal score`j' [aw=wgt] if f001 == `i' & majgrp == `q' , env(`k') `rri' b(2)
	matrix `temp1'[1,1] = 2			 
	matrix `temp1'[1,2] = 3          
	matrix `temp1'[1,3] = `i'        
	matrix `temp1'[1,4] = `grouptype'        
	matrix `temp1'[1,5] = -1       
	matrix `temp1'[1,6] = -1         
	matrix `temp1'[1,7] = r(index)   
	matrix `temp1'[1,8] = r(l95)     
	matrix `temp1'[1,9] = r(u95)     
	matrix `temp1'[1,10] = `j'
	matrix `temp1'[1,11] = -1
	matrix `temp1'[1,12] = `q'
	matrix `temp2' = (nullmat(`temp2') \ `temp1' )
}
}
}
} /*}}}*/
/*RRI 소득 고졸년도 {{{*/
forvalue i = 2000/2011 {
foreach j in income scorei scorej {
foreach k of local grplist {
	/*incometype {{{*/
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
	} /*}}}*/
	/*grouptype {{{*/
	if ("`k'" == "edugrp") {
		local grouptype = 1
	}
	else if ("`k'" == "incgrp") {
		local grouptype = 2
	} 
	else if ("`k'" == "rgngrp") {
		local grouptype = 3
	} 
	else if ("`k'" == "pcagrp") {
		local grouptype = 4
	} 
	else if ("`k'" == "pcagrp2") {
		local grouptype = 5
	} 
	else if ("`k'" == "pcagrp3") {
		local grouptype = 6
	}
	else if ("`k'" == "edugrp2") {
		local grouptype = 7
	}
	else if ("`k'" == "incgrp2") {
		local grouptype = 8
	} /*}}}*/
	eopcal `j' [aw=wgt] if f001 == `i' , env(`k') `rri' b(2)
	matrix `temp1'[1,1] = 2			 
	matrix `temp1'[1,2] = 3          
	matrix `temp1'[1,3] = `i'        
	matrix `temp1'[1,4] = `grouptype'        
	matrix `temp1'[1,5] = -1         
	matrix `temp1'[1,6] = -1         
	matrix `temp1'[1,7] = r(index)   
	matrix `temp1'[1,8] = r(l95)     
	matrix `temp1'[1,9] = r(u95)     
	matrix `temp1'[1,10] = `scoretype'
	matrix `temp1'[1,11] = -1
	matrix `temp1'[1,12] = -1
	matrix `temp2' = (nullmat(`temp2') \ `temp1' )
}
}
} /*}}}*/
/*RRI 소득 고졸년도 성별{{{*/
forvalue m = 1/2 {
forvalue i = 2000/2011 {
foreach j in income scorei scorej {
foreach k of local grplist {
	/*incometype {{{*/
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
	} /*}}}*/
	/*grouptype {{{*/
	if ("`k'" == "edugrp") {
		local grouptype = 1
	}
	else if ("`k'" == "incgrp") {
		local grouptype = 2
	} 
	else if ("`k'" == "rgngrp") {
		local grouptype = 3
	} 
	else if ("`k'" == "pcagrp") {
		local grouptype = 4
	} 
	else if ("`k'" == "pcagrp2") {
		local grouptype = 5
	} 
	else if ("`k'" == "pcagrp3") {
		local grouptype = 6
	}
	else if ("`k'" == "edugrp2") {
		local grouptype = 7
	}
	else if ("`k'" == "incgrp2") {
		local grouptype = 8
	} /*}}}*/
	eopcal `j' [aw=wgt] if f001 == `i' & sex == `m' , env(`k') `rri' b(2)
	matrix `temp1'[1,1] = 2			 
	matrix `temp1'[1,2] = 3          
	matrix `temp1'[1,3] = `i'        
	matrix `temp1'[1,4] = `grouptype'        
	matrix `temp1'[1,5] = -1         
	matrix `temp1'[1,6] = `m'		
	matrix `temp1'[1,7] = r(index)   
	matrix `temp1'[1,8] = r(l95)     
	matrix `temp1'[1,9] = r(u95)     
	matrix `temp1'[1,10] = `scoretype'
	matrix `temp1'[1,11] = -1
	matrix `temp1'[1,12] = -1
	matrix `temp2' = (nullmat(`temp2') \ `temp1' )
}
}
}
} /*}}}*/
/*RRI 소득 고졸년도 전형별 {{{*/
forvalue l = 1/2 {
forvalue i = 2000/2011 {
foreach j in income scorei scorej {
foreach k of local grplist {
	/*incometype {{{*/
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
	} /*}}}*/
	/*grouptype {{{*/
	if ("`k'" == "edugrp") {
		local grouptype = 1
	}
	else if ("`k'" == "incgrp") {
		local grouptype = 2
	} 
	else if ("`k'" == "rgngrp") {
		local grouptype = 3
	} 
	else if ("`k'" == "pcagrp") {
		local grouptype = 4
	} 
	else if ("`k'" == "pcagrp2") {
		local grouptype = 5
	} 
	else if ("`k'" == "pcagrp3") {
		local grouptype = 6
	}
	else if ("`k'" == "edugrp2") {
		local grouptype = 7
	}
	else if ("`k'" == "incgrp2") {
		local grouptype = 8
	} /*}}}*/
	eopcal `j' [aw=wgt] if f001 == `i' & f013 == `l' , env(`k') `rri' b(2)
	matrix `temp1'[1,1] = 2			 
	matrix `temp1'[1,2] = 3          
	matrix `temp1'[1,3] = `i'        
	matrix `temp1'[1,4] = `grouptype'        
	matrix `temp1'[1,5] = `l'        
	matrix `temp1'[1,6] = -1         
	matrix `temp1'[1,7] = r(index)   
	matrix `temp1'[1,8] = r(l95)     
	matrix `temp1'[1,9] = r(u95)     
	matrix `temp1'[1,10] = `scoretype'
	matrix `temp1'[1,11] = -1
	matrix `temp1'[1,12] = -1
	matrix `temp2' = (nullmat(`temp2') \ `temp1' )
}
}
}
} /*}}}*/
/*RRI 소득 고졸년도 고교유형별 {{{*/
forvalue p = 1/3 {
forvalue i = 2000/2011 {
foreach j in income scorei scorej {
foreach k of local grplist {
	/*incometype {{{*/
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
	} /*}}}*/
	/*grouptype {{{*/
	if ("`k'" == "edugrp") {
		local grouptype = 1
	}
	else if ("`k'" == "incgrp") {
		local grouptype = 2
	} 
	else if ("`k'" == "rgngrp") {
		local grouptype = 3
	} 
	else if ("`k'" == "pcagrp") {
		local grouptype = 4
	} 
	else if ("`k'" == "pcagrp2") {
		local grouptype = 5
	} 
	else if ("`k'" == "pcagrp3") {
		local grouptype = 6
	}
	else if ("`k'" == "edugrp2") {
		local grouptype = 7
	}
	else if ("`k'" == "incgrp2") {
		local grouptype = 8
	} /*}}}*/
	eopcal `j' [aw=wgt] if f001 == `i' & hscgrp == `p' , env(`k') `rri' b(2)
	matrix `temp1'[1,1] = 2			 
	matrix `temp1'[1,2] = 3          
	matrix `temp1'[1,3] = `i'        
	matrix `temp1'[1,4] = `grouptype'        
	matrix `temp1'[1,5] = -1       
	matrix `temp1'[1,6] = -1         
	matrix `temp1'[1,7] = r(index)   
	matrix `temp1'[1,8] = r(l95)     
	matrix `temp1'[1,9] = r(u95)     
	matrix `temp1'[1,10] = `scoretype'
	matrix `temp1'[1,11] = `p'
	matrix `temp1'[1,12] = -1
	matrix `temp2' = (nullmat(`temp2') \ `temp1' )
}
}
}
} /*}}}*/
/*RRI 소득 고졸년도 대학계열별 {{{*/
forvalue q = 1/3 {
forvalue i = 2000/2011 {
foreach j in income scorei scorej {
foreach k of local grplist {
	/*incometype {{{*/
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
	} /*}}}*/
	/*grouptype {{{*/
	if ("`k'" == "edugrp") {
		local grouptype = 1
	}
	else if ("`k'" == "incgrp") {
		local grouptype = 2
	} 
	else if ("`k'" == "rgngrp") {
		local grouptype = 3
	} 
	else if ("`k'" == "pcagrp") {
		local grouptype = 4
	} 
	else if ("`k'" == "pcagrp2") {
		local grouptype = 5
	} 
	else if ("`k'" == "pcagrp3") {
		local grouptype = 6
	}
	else if ("`k'" == "edugrp2") {
		local grouptype = 7
	}
	else if ("`k'" == "incgrp2") {
		local grouptype = 8
	} /*}}}*/
	eopcal `j' [aw=wgt] if f001 == `i' & majgrp == `q' , env(`k') `rri' b(2)
	matrix `temp1'[1,1] = 2			 
	matrix `temp1'[1,2] = 3          
	matrix `temp1'[1,3] = `i'        
	matrix `temp1'[1,4] = `grouptype'        
	matrix `temp1'[1,5] = -1       
	matrix `temp1'[1,6] = -1         
	matrix `temp1'[1,7] = r(index)   
	matrix `temp1'[1,8] = r(l95)     
	matrix `temp1'[1,9] = r(u95)     
	matrix `temp1'[1,10] = `scoretype'
	matrix `temp1'[1,11] = -1
	matrix `temp1'[1,12] = `q'
	matrix `temp2' = (nullmat(`temp2') \ `temp1' )
}
}
}
} /*}}}*/

matrix colname `temp2' = indextype wavetype wave envtype enttype sex index lci95 uci95 scoretype hstype majtype

svmat `temp2' , names(matcol)
	keep `temp2'*
	rename `temp2'* *
	keep if !missing(index)
	label drop _all
	label var indextype "지수유형"
		label define INDEXTYPE 1 "GOI" 2 "RRI"
		label value indextype INDEXTYPE
	label var wavetype "년도기준"
		label define WAVETYPE 1 "조사회차" 2 "출생년도" 3 "고졸년도" 
		label value wavetype WAVETYPE
	label var envtype "환경유형"
		label define ENVTYP 1 "부모학력환경(년도조정)" 2 "부모소득환경(년도조정)" 3 "지역환경" 4 "PCA(학력, 소득, 지역)" ///
			5 "PCA(학력, 소득)" 6 "PCA(학력, 소득, 성별)" 7 "부모학력환경" 8 "부모소득환경" 
		label value envtyp ENVTYP
	label var enttype "입시유형"
		label define ENTTYPE -1 "전체" 1 "일반정시" 2 "일반수시" 3 "특별전형" 4 "기타"
		label value enttype ENTTYPE
	label var sex "성별"
		label define SEX -1 "전체" 1 "남성" 2 "여성"
		label value sex SEX
	label var hstype "출신고유형"
		label define HSTYPE -1 "전체" 1 "특성화/기타" 2 "일반" 3 "특목/자율/강남3고"
		label value hstype HSTYPE
	label var majtype "대학계열"
		label define MAJTYPE -1 "전체" 1 "예체능" 2 "인문계" 3 " 자연계"
		label value majtype MAJTYPE
	label var scoretype "성취유형"
		label define SCORETYPE 1 "소득5등급(0포함)" 2 "소득5등급" 3 "대학3등급" 4 "대학4등급" 5 "대학5등급" 6 "월평균소득"
		label value scoretype SCORETYPE
save goms_rri_add.dta , replace
