cd ~/dropbox

capture label drop GROUP
label define GROUP 1 "장서, 소유물, 부모교육" 2 "장서, 소유물, 부모교육, 가족이민" 3 "장서, 소유물, 부모교육, 성별" 4 "장서, 소유물, 부모교육, 가족이민, 성별" 

foreach i in pisa timss {
	foreach j in goi rri fg bj {
		forvalue k = 1/4 {
			use `i'/`i'_`j'_pcagrp`k' , clear
			/*Data specific control{{{*/
			capture drop year
			if "`i'" == "pisa" {
				gen year  = 1997 + 3*wave 
			}
			else if "`i'" == "timss" {
				gen year  = 1991 + 4*wave 
			}
			label var year "조사년도"
			/*}}}*/
			/*Index specific control{{{*/
			if "`j'" == "goi" {
				capture rename index goi
				label var goi "지니기회불평등지수"
			}
			else if "`j'" == "rri" {
				capture rename index rri
				label var rri "개천용기회불평등지수"
			}
			else if "`j'" == "fg" {
				capture drop fg1t fg1e
				capture rename fg1a fg1c
				capture rename (index1 index2 index3) (fg1c fg1r fg2r)
				gen fg1t = fg1c*fg1r^(-1)
				gen fg1e = fg1t - fg1c
				label var fg1e "FG잔여불평등지수;MLD"
				label var fg1c "FG기회불평등지수;MLD"
				label var fg1t "FG결과불평등지수;MLD"
				label var fg1r "FG기회불평등지수;상대치, MLD"
				label var fg2r "FG기회불평등지수;상대치, var"
			}
			else if "`j'" == "bj" {
				capture drop bj1t bj1e
				capture rename bj1a bj1c
				capture rename (index1 index2 index3) (bj1c bj1r bj2r)
				gen bj1t = bj1c*bj1r^(-1)
				gen bj1e = bj1t - bj1c
				label var bj1e "BJ잔여불평등지수;MLD"
				label var bj1c "BJ기회불평등지수;MLD"
				label var bj1t "BJ결과불평등지수;MLD"
				label var bj1r "BJ기회불평등지수;상대치, MLD"
				label var bj2r "BJ기회불평등지수;상대치, var"
			}
			/*}}}*/
			/*Group specific control{{{*/
			capture drop group
			gen group = `k'
				label var group "환경변수"
				label value group GROUP
			/*}}}*/
			save , replace
		}	
	}	
}	

/*Append each data set along with pcagrp{{{*/ 
local count = 1
foreach i in pisa timss {
	foreach j in goi rri fg bj {
		use `i'/`i'_`j'_pcagrp1 , clear
		append using `i'/`i'_`j'_pcagrp2
		append using `i'/`i'_`j'_pcagrp3
		append using `i'/`i'_`j'_pcagrp4
		save temp`count' , replace
		local Maxcount = `count'
		local ++count
	}
}
/*}}}*/
tempfile temp1 temp2 
/*merge PISA{{{*/
forvalue i = 1/4 {
	if `i' == 1 {
		use temp1 , clear
		save `temp1' , replace
	}
	else {
		use `temp1' , clear
		merge 1:1 datatype wave cntcod group subject using temp`i' , nogen
		save `temp1' , replace
	}
	if "`c(os)'" == "MacOSX" {
		rm temp`i'.dta
	}
	else {
		erase temp`i'.dta
	}
}
/*}}}*/
/*merge TIMSS{{{*/
forvalue i = 5/8 {
	if `i' == 5 {
		use temp5 , clear
		save `temp2' , replace
	}
	else {
		use `temp2' , clear
		merge m:m datatype wave cntcod using temp`i' , nogen
		save `temp2' , replace
	}
	if "`c(os)'" == "MacOSX" {
		rm temp`i'.dta
	}
	else {
		erase temp`i'.dta
	}
}
/*}}}*/
append using `temp1'
/*Exception Control{{{*/
replace cntcod = 276 if cntcod == 280 /* Germany code changed */
replace cntcod = 705 if cntcod == 890 /* Slovenia code changed */
replace cntcod = 826 if cntcod == 926 /* England is a large part of the UK */
replace cntcod = 688 if cntcod == 891 /* Serbia code changed*/
drop if inlist(cntcod , 201 , 827 , 927 , 438) 
/*201 = Unknown ; 
827 and 927 = Scotland is a part of the UK
438 Liehitenstein is a small country  */
/*}}}*/
/*Merge with the Country List{{{*/
merge m:1 cntcod using ~/dropbox/data_extras/countrycode_1.dta 
	drop if _merge == 2
	drop _merge
compress
/*}}}*/
/*Labeling Variables{{{*/
rename cntabc? cntab?
rename datatype dbname
label var wave "조사회차"
label var cntcod "ISO 3166-1 Numeric Code"
label var cntab2 "ISO 3166-1 alpha-2 Code"
label var cntab3 "ISO 3166-1 alpha-3 Code"
label var dbname "자료명"
label define GROUP 1 "소유,도서,부모교육" 2 "소유,도서,부모교육,이민" 3 "소유,도서,부모교육,성별" 4 "소유,도서,부모교육,이민,성별"
/*}}}*/
order dbname wave year continent contcode cntcod country cntab2 cntab3 group subject , first
sort dbname wave cntcod group subject
save pnt/pnt_index.dta , replace
