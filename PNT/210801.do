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

qui reg goimathp goimatht
gen pnt = e(sample)
label var pnt "TIMSS&PISA"
save "~/Dropbox/PNT/pnt_index.dta" , replace

use data/pwt100
rename countrycode cntab3
merge 1:1 cntab3 year using pnt/pnt_index
drop if !inrange(year , 1995 ,  2019)
egen temp1 = rownonmiss(goimath?)
bys cntcod : egen temp2 = max(temp1)
drop if !temp2
bys cntab3 : egen temp3 = max(cntcod)
replace cntcod = temp3

save "~/Dropbox/PNT/pnt_regdata.dta" , replace
