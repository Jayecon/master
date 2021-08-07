cd ~/dropbox
use "~/Dropbox/PNT/raw_pnt_index.dta" , clear
	label data "불평등지수 환경:소유,도서,부모교육,이민"
	drop ??2?
	keep if group == 2
	rename ??1? ???
	drop group
save  ~/dropbox/pnt/pnt_index , replace

drop wave

replace subject = subject + 90
reshape wide goi-bje , i(dbname cntab3 year) j(subject)
rename *91 *math
rename *92 *scie
rename *93 *read
rename *94 *masc
rename *95 *mrsc

replace dbname = dbname + 90
reshape wide goimath-bjemrsc , i(cntab3 year) j(dbname)
rename *91 *p
rename *92 *t

order cntab3 contcode year cntcod cntab2 country continent , first

foreach i of varlist goimathp - bjemrsct {
	label var `i' ""
}

drop ???readt ???mrsct

save "~/Dropbox/PNT/pnt_index.dta" , replace

use data/pwt100
rename countrycode cntab3
merge 1:1 cntab3 year using pnt/pnt_index
bys cntab3 : egen temp3 = max(cntcod)
replace cntcod = temp3
egen temp1 = rownonmiss(goimath?)
bys cntcod : egen temp2 = max(temp1)
drop if !temp2

xtset cntcod year

gen pcgdp = rgdpo/pop
	label var pcgdp "Output-side per capita real GDP at chained PPPs (in mil. 2017US$)"
gen lnpcgdp = ln(pcgdp)
	label var pcgdp "log of per capita GDP"
gen lngdp = ln(rgdpo)
	label var pcgdp "log of GDP"
gen pcgrowth = lnpcgdp - l.lnpcgdp
	label var pcgrowth "Per capita GDP growth rate"
gen growth = lngdp - l.lngdp
	label var growth "GDP growth rate"
gen lnpop = ln(pop)
	label var lnpop "log of Population"
	
qui reg goimathp goimatht
	gen ypnt = e(sample)
	label var ypnt "TIMSS&PISA year"
qui reg goimathp
	gen ypisa = e(sample)
	label var ypisa "PISA year"
qui reg goimatht
	gen ytimss = e(sample)
	label var ytimss "TIMSS year"
drop if !inrange(year , 1994 ,  2019)
drop _merge
drop temp?

	
save "~/Dropbox/PNT/pnt_regdata.dta" , replace
