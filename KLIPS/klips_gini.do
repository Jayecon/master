cd ~/dropbox/klips
set matsize 11000
set more off

use klips_area , clear
preserve

tempname temp1 temp2
matrix `temp1' = J(1,5,.)

levelsof area , local(alist) 

forvalue i = 1998/2018 {
	di "`i' , 0"
	keep if head & men & age1865 & worker & year == `i'
	qui ineqdeco income [aw=wgt] 
	matrix `temp1'[1,1] = `i'
	matrix `temp1'[1,2] = -1
	matrix `temp1'[1,3] = 0
	matrix `temp1'[1,4] = r(gini)
	matrix `temp1'[1,5] = r(p90p10)
	matrix `temp2' = (nullmat(`temp2') \ `temp1' )
	restore , preserve
}

svmat `temp2' , names(matcol)
	keep `temp2'*
	rename `temp2'* *
	drop if missing(c1)
rename (c1 c2 c3 c4 c5) (year period area gini p90p10)

capture label define varea 0"전국" 1 "서울" 2"부산" 3"대구" 5"인천" 6"광주" 4"대전" 7"울산" 19"세종" 8"경기" 9"강원" 10"충북" 11"충남" 12"전북" 13"전남" 14"경북" 15"경남" 16"제주"

label value area varea

save klips_gini_0.dta , replace

restore, preserve

tempname temp1 temp2
matrix `temp1' = J(1,5,.)

levelsof area , local(alist) 

forvalue i = 1998/2018 {
		foreach k of local alist {
			di "`i' , `k'"
			qui count if year  == `i' & area == `k'
			if (r(N) <= 10) {
				continue
			}
			keep if head & men & age1865 & worker & year == `i' & area == `k'
			qui ineqdeco income [aw=wgt] 
			matrix `temp1'[1,1] = `i'
			matrix `temp1'[1,2] = -1
			matrix `temp1'[1,3] = `k'
			matrix `temp1'[1,4] = r(gini)
			matrix `temp1'[1,5] = r(p90p10)
			matrix `temp2' = (nullmat(`temp2') \ `temp1' )
			restore , preserve
	}
}

svmat `temp2' , names(matcol)
	keep `temp2'*
	rename `temp2'* *
	drop if missing(c1)
rename (c1 c2 c3 c4 c5) (year period area gini p90p10)
	
capture label define varea 0"전국" 1 "서울" 2"부산" 3"대구" 5"인천" 6"광주" 4"대전" 7"울산" 19"세종" 8"경기" 9"강원" 10"충북" 11"충남" 12"전북" 13"전남" 14"경북" 15"경남" 16"제주"

label value area varea

save klips_gini_1.dta , replace
