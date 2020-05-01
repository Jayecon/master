cd C:\170818sci 
discard 
set more off 
capture log close 
timer clear 1 
log using timss_sci , replace 
timer on 1 

forvalues i = 5/6 {
	use timssw`i' , clear 
	if `i' == 1{
		drop if idcntry == 414 
	}
	else if `i' == 3{
		drop if idcntry == 702 
	}
	else if `i' == 4{
		drop if idcntry == 702 
	}
	else if `i' == 5{
		drop if idcntry == 702 
		drop if idcntry == 752 

	}
	else  if `i' == 6{
		drop if idcntry == 702 
	}
	bys idcntry: eopgen sci01 [aw=totwgt], by(stdsex hombok ftredu comsiz homcom ) miindex i(20)
	matrix report = r(miindex)
	svmat report , name(matcol)
	keep report* 
	rename report* * 
	drop if missing(itrnum) 
		save mi_sci01w`i' , replace

}
use timssw1 , clear 
	eopgen sci01 if idcntry == 414 [aw=totwgt], by(stdsex hombok ftredu homcom ) miindex i(20)
	matrix report = r(miindex)
	svmat report , name(matcol)
	keep report* 
	rename report* * 
	drop if missing(itrnum) 
		save mi_sci01w1c414 , replace
use timssw3 , clear 
	eopgen sci01 if idcntry == 702 [aw=totwgt], by(stdsex hombok ftredu homcom ) miindex i(20)
	matrix report = r(miindex)
	svmat report , name(matcol)
	keep report* 
	rename report* * 
	drop if missing(itrnum) 
		save mi_sci01w3c702 , replace
use timssw4 , clear 
	eopgen sci01 if idcntry == 702 [aw=totwgt], by(stdsex hombok ftredu homcom ) miindex i(20)
	matrix report = r(miindex)
	svmat report , name(matcol)
	keep report* 
	rename report* * 
	drop if missing(itrnum) 
		save mi_sci01w4c702 , replace
use timssw5 , clear 
	eopgen sci01 if idcntry == 702 [aw=totwgt], by(stdsex hombok ftredu homcom ) miindex i(20)
	matrix report = r(miindex)
	svmat report , name(matcol)
	keep report* 
	rename report* * 
	drop if missing(itrnum) 
		save mi_sci01w5c702 , replace
use timssw5 , clear 
	eopgen sci01 if idcntry == 752 [aw=totwgt], by(stdsex hombok ftredu comsiz ) miindex i(20)
	matrix report = r(miindex)
	svmat report , name(matcol)
	keep report* 
	rename report* * 
	drop if missing(itrnum) 
		save mi_sci01w5c752 , replace
use timssw6 , clear 
	eopgen sci01 if idcntry == 702 [aw=totwgt], by(stdsex hombok ftredu homcom ) miindex i(20)
	matrix report = r(miindex)
	svmat report , name(matcol)
	keep report* 
	rename report* * 
	drop if missing(itrnum) 
		save mi_sci01w6c702 , replace


timer off 1 
timer list 1 
log close 
