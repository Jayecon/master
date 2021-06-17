cd ~/dropbox
capture label drop GROUP
label define GROUP 1 "장서, 소유물, 부모교육" 2 "장서, 소유물, 부모교육, 가족이민" 3 "장서, 소유물, 부모교육, 가족이민, 거주지 규모"
foreach i in pisa timss {
	foreach j in goi rri fg bj {
		forvalue k = 1/3 {
			use `i'_`j'_pcagrp`k' , clear
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
				capture rename (index1 index2 index3) (fg1a fg1r fg2r)
				label var fg1a "FG기회불평등지수;절대치 mld"
				label var fg1r "FG기회불평등지수;상대치 var"
				label var fg2r "FG기회불평등지수;상대치 var"
			}
			else if "`j'" == "bj" {
				capture rename (index1 index2 index3) (bj1a bj1r bj2r)
				label var bj1a "BJ기회불평등지수;절대치 mld"
				label var bj1r "BJ기회불평등지수;상대치 var"
				label var bj2r "BJ기회불평등지수;상대치 var"
			}
			/*}}}*/
			/*Group specific control{{{*/
			capture drop group
			gen group = `k'
				label var group "환경변수"
				label value group GROUP
			/*}}}*/
			/*drop if subject == 3*/
			save , replace
		}	
	}	
}	
/*Append each data set with pcagrp{{{*/ local count = 1
foreach i in pisa timss {
	foreach j in goi rri fg bj {
		use `i'_`j'_pcagrp1 , clear
		append using `i'_`j'_pcagrp2
		append using `i'_`j'_pcagrp3
		save temp`count' , replace
		local Maxcount = `count'
		local ++count
	}
}
/*}}}*/
tempfile temp temp2 temp3
/*merge TIMSS{{{*/
forvalue i = 1/4 {
	if `i' == 1 {
		use temp1 , clear
		save `temp' , replace
	}
	else {
		use `temp' , clear
		merge m:m datatype wave cntcod using temp`i' , nogen
		save `temp' , replace
	}
	if "`c(os)'" == "MacOSX" {
		rm temp`i'.dta
	}
	else {
		erase temp`i'.dta
	}
}
/*}}}*/
/*merge PISA{{{*/
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
append using `temp'
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
merge m:1 cntcod using ~/git/etc/countrycode_1.dta 
	drop if _merge == 2
	drop _merge
compress
/*}}}*/
/*Labeling and Ordering Variables{{{*/
label var wave "조사회차"
label var cntcod "ISO 3166-1 Numeric Code"
label var cntabc2 "ISO 3166-1 alpha-2 Code"
label var cntabc3 "ISO 3166-1 alpha-3 Code"
rename cntabc? cntab?
rename datatype dbname
order dbname wave year cntcod country cntab2 cntab3 continent contcode group , first
/*}}}*/
save pnt_index.dta , replace
/*Merge with the pwt91{{{*/
reshape wide goi-bj2r , i(wave cntcod subject dbname ) j(group)
order dbname wave year cntcod country cntab2 cntab3 continent contcode , first
rename cntab3 countrycode
preserve 
	keep countrycode cntcod
	duplicates drop
	merge 1:m countrycode using "/Users/jay/Dropbox/Z_Extra Datas/pwt91.dta"
		drop if _merge == 1
		drop _merge
	save `temp3' , replace
restore 
merge m:1 countrycode year using `temp3'
	drop if year < 1995
	levelsof countrycode if inlist(_merge , 1 ,3) , local(clist)
	gen _temp = 0
	foreach i of local clist { 
		replace _temp = 1 if countrycode == "`i'"
	}
	drop if !_temp
	drop _*
	rename countrycode cntabc3 
	compress
/*}}}*/
save pnt_regress.dta , replace
