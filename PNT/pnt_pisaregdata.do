cd ~/dropbox
use pnt/pnt_regdata , clear

merge 1:1 cntcod year using "~/dropbox/data_extras/oecdlist_long.dta"

drop if _merge == 2
drop _merge
replace oecd = 0 if missing(oecd)

gen wpisa = ceil((year-1999)/3)
gen t = mod(year-2000,3) 
replace wpisa = . if t != 0
replace wpisa = . if wpisa <= 0

xtset cntcod year

foreach i of varlist goimathp-bjemrscp {
	forvalue j =1/2 {
		gen `i'_f`j'= f`j'.`i'
	}
	egen `i'_f = rowfirst(`i'_f?)
	replace `i'_f = . if ypisa
}

foreach i of varlist goimathp-bjemrscp {
	forvalue j =1/2{
		gen `i'_l`j'= l`j'.`i'
	}
	egen `i'_l = rowfirst(`i'_l?)
	replace `i'_f = . if ypisa
}
foreach i of varlist goimathp-bjemrscp {
		gen `i'_n = `i'_l + (`i'_f - `i'_l)*t/3
		replace `i'_n = `i' if t == 0
}
keep if wpisa

foreach i of varlist goimathp_n-bjemrscp_n {
	gen oecdx`i' = oecd*`i'
	gen noecdx`i' = (1-oecd)*`i'
}
