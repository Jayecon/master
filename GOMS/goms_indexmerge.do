cd ~/dropbox/goms/results

tempfile temp

use goms_goi_income , clear
	gen sjob = -1
	gen winratio = .
	save `temp'

use goms_goi_income_sjob , clear
	gen sjob = 1
	gen winratio = .
	append using `temp'
	save `temp' , replace

use goms_rri_income_sjob_2p8 , clear
	gen sjob = 1
	gen winratio = 1
	append using `temp'
	save `temp' , replace

use goms_rri_income_sjob_10 , clear
	gen sjob = 1
	gen winratio = 2
	append using `temp'
	save `temp' , replace

use goms_rri_income_all_2p8 , clear
	gen sjob = -1
	gen winratio = 1
	append using `temp'
	save `temp' , replace

use goms_rri_income_all_10 , clear
	gen sjob = -1
	gen winratio = 2
	append using `temp'
	save `temp' , replace

rename sjob jobtype
label var jobtype "직업유형"
label define JOBTYPE 1 "정규직/자영업자" -1 "모든직업"
label value jobtype JOBTYPE

label var winratio "성공기준"
label define WINRATIO 1 "상위 2.8%" 2 "상위 10%"
label value winratio WINRATIO

save goms_index_income.dta
