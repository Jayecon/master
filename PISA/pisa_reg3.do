use pisa_reg3masc.dta , clear

keep dbname - bj1e rgdpe pop pl_i

merge 1:1 cntcod year using "/Users/jay/git/etc/oecdlist_long.dta"
drop if _merge == 2
drop _merge
replace oecd = 0 if missing(oecd)

rename pl_i pli
rename rgdpe  gdp

gen date = ceil((year-1999)/3)
gen pkgdp = gdp/pop
gen lnpkgdp = ln(pkgdp)
gen lnpop = ln(pop)
gen lngdp = ln(gdp)
gen t = mod(year-2000,3) 
*replace date = . if t != 0

capture drop *_l* 
capture drop *_f*

xtset cntcod year

foreach i of varlist goi-bj1e {
	forvalue j =1/2 {
		gen `i'_f`j'= f`j'.`i'
	}
	egen `i'_f = rowfirst(`i'_f?)
	replace `i'_f = . if inlist(year, 2000, 2003, 2006, 2009, 2012, 2015, 2018)
}

foreach i of varlist goi-bj1e {
	forvalue j =1/2{
		gen `i'_l`j'= l`j'.`i'
	}
	egen `i'_l = rowfirst(`i'_l?)
	replace `i'_f = . if inlist(year, 2000, 2003, 2006, 2009, 2012, 2015, 2018)
}
foreach i of varlist goi-bj1e {
		gen `i'_n = `i'_l + (`i'_f - `i'_l)*t/3
		replace `i'_n = `i' if t == 0
}
keep if inlist(year, 2000, 2003, 2006, 2009, 2012, 2015, 2018)

foreach i of varlist goi_n-bj1e_n {
	gen oecdx`i' = oecd*`i'
	gen noecdx`i' = (1-oecd)*`i'
}

xtset cntcod date

eststo: quietly xi: reg      	   lnpkgdp L.(lnpkgdp fg1t_n pli lnpop) i.date, rob
eststo: quietly xi: xtreg      	   lnpkgdp L.(lnpkgdp fg1t_n pli lnpop) i.date, fe
eststo: quietly xi: xtdpdsys 	   lnpkgdp L.(		  fg1t_n pli lnpop) i.date, vce(robust)
esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) 
eststo clear

eststo: quietly xi: reg      	   lnpkgdp L.(lnpkgdp fg1c_n fg1e_n pli lnpop) i.date, rob
eststo: quietly xi: xtreg      	   lnpkgdp L.(lnpkgdp fg1c_n fg1e_n pli lnpop) i.date, fe
eststo: quietly xi: xtdpdsys 	   lnpkgdp L.(		  fg1c_n fg1e_n pli lnpop) i.date, vce(robust)
esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) 
eststo clear

eststo: quietly xi: reg      	   lnpkgdp L.(lnpkgdp oecdxfg1c_n oecdxfg1e_n noecdxfg1c_n noecdxfg1e_n pli lnpop) i.date, rob
eststo: quietly xi: xtreg      	   lnpkgdp L.(lnpkgdp oecdxfg1c_n oecdxfg1e_n noecdxfg1c_n noecdxfg1e_n pli lnpop) i.date, fe
eststo: quietly xi: xtdpdsys 	   lnpkgdp L.(		  oecdxfg1c_n oecdxfg1e_n noecdxfg1c_n noecdxfg1e_n pli lnpop) i.date, vce(robust)
esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) 
eststo clear

eststo: quietly xi: reg      	   lnpkgdp L.(lnpkgdp bj1t_n pli lnpop) i.date, rob
eststo: quietly xi: xtreg      	   lnpkgdp L.(lnpkgdp bj1t_n pli lnpop) i.date, fe
eststo: quietly xi: xtdpdsys 	   lnpkgdp L.(		  bj1t_n pli lnpop) i.date, vce(robust)
esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) 
eststo clear

eststo: quietly xi: reg      	   lnpkgdp L.(lnpkgdp bj1c_n bj1e_n pli lnpop) i.date, rob
eststo: quietly xi: xtreg      	   lnpkgdp L.(lnpkgdp bj1c_n bj1e_n pli lnpop) i.date, fe
eststo: quietly xi: xtdpdsys 	   lnpkgdp L.(		  bj1c_n bj1e_n pli lnpop) i.date, vce(robust)
esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) 
eststo clear

eststo: quietly xi: reg      	   lnpkgdp L.(lnpkgdp oecdxbj1c_n oecdxbj1e_n noecdxbj1c_n noecdxbj1e_n pli lnpop) i.date, rob
eststo: quietly xi: xtreg      	   lnpkgdp L.(lnpkgdp oecdxbj1c_n oecdxbj1e_n noecdxbj1c_n noecdxbj1e_n pli lnpop) i.date, fe
eststo: quietly xi: xtdpdsys 	   lnpkgdp L.(		  oecdxbj1c_n oecdxbj1e_n noecdxbj1c_n noecdxbj1e_n pli lnpop) i.date, vce(robust)
esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) 
eststo clear


