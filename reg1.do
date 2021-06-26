use pisa_reg1mrsc.dta , clear

keep dbname - bj1e rgdpe pop pl_i

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

/*foreach x in ge be we {
gen     new_`x'0avg=`x'0avg1995+(`x'0avg1999-`x'0avg1995)*(year-1995)/4 if 1995<=year & year<=1999 
replace new_`x'0avg=`x'0avg1999+(`x'0avg2003-`x'0avg1999)*(year-1999)/4 if 1999<=year & year<=2003
replace new_`x'0avg=`x'0avg2003+(`x'0avg2007-`x'0avg2003)*(year-2003)/4 if 2003<=year & year<=2007
replace new_`x'0avg=`x'0avg2007+(`x'0avg2011-`x'0avg2007)*(year-2007)/4 if 2007<=year & year<=2011

replace new_`x'0avg=`x'0avg1995 if year==1995
replace new_`x'0avg=`x'0avg1999 if year==1999
replace new_`x'0avg=`x'0avg2003 if year==2003
replace new_`x'0avg=`x'0avg2007 if year==2007
replace new_`x'0avg=`x'0avg2011 if year==2011

}*/
/*
eststo: quietly xi: reg      	   lnpkgdp L.(lnpkgdp fg1c_n fg1e_n pli lnpop) i.year, rob
eststo: quietly xi: xtreg      	   lnpkgdp L.(lnpkgdp fg1c_n fg1e_n pli lnpop) i.year, fe
eststo: /* quietly */ xi: xtdpdsys lnpkgdp L.(		  fg1c_n fg1e_n pli lnpop) i.year, vce(robust)
esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) 
eststo clear
*/

xtset cntcod date

eststo: quietly xi: reg      	   lnpkgdp L.(lnpkgdp fg1t_n pli lnpop) i.date, rob
eststo: quietly xi: xtreg      	   lnpkgdp L.(lnpkgdp fg1t_n pli lnpop) i.date, fe
eststo: quietly xi: xtdpdsys lnpkgdp L.(		  fg1t_n pli lnpop) i.date, vce(robust)
esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) 
eststo clear

eststo: quietly xi: reg      	   lnpkgdp L.(lnpkgdp fg1c_n fg1e_n pli lnpop) i.date, rob
eststo: quietly xi: xtreg      	   lnpkgdp L.(lnpkgdp fg1c_n fg1e_n pli lnpop) i.date, fe
eststo: quietly xi: xtdpdsys lnpkgdp L.(		  fg1c_n fg1e_n pli lnpop) i.date, vce(robust)
esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) 
eststo clear

eststo: quietly xi: reg      	   lnpkgdp L.(lnpkgdp bj1t_n pli lnpop) i.date, rob
eststo: quietly xi: xtreg      	   lnpkgdp L.(lnpkgdp bj1t_n pli lnpop) i.date, fe
eststo: quietly xi: xtdpdsys lnpkgdp L.(		  bj1t_n pli lnpop) i.date, vce(robust)
esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) 
eststo clear

eststo: quietly xi: reg      	   lnpkgdp L.(lnpkgdp bj1c_n bj1e_n pli lnpop) i.date, rob
eststo: quietly xi: xtreg      	   lnpkgdp L.(lnpkgdp bj1c_n bj1e_n pli lnpop) i.date, fe
eststo: quietly xi: xtdpdsys lnpkgdp L.(		  bj1c_n bj1e_n pli lnpop) i.date, vce(robust)
esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) 
eststo clear



