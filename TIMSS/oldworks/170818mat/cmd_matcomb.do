cd C:\170818mat 
discard 
set more off 
capture log close 
timer clear 1 
log using timss_matcomb , replace 
timer on 1 

forvalues i = 1/6 {
	use  mi_mat01w`i' , clear
	keep idcntry idxmean idxsd
	rename (idxmean idxsd) (idxw`i' sdw`i')
	if `i' == 1 {
		save mi_mat , replace
		continue
	}
	merge 1:1 idcntry using mi_mat , nogen
	save mi_mat , replace
}
use mi_mat01w1c414
	gen idcntry = 414
	keep idcntry idxmean idxsd
	rename (idxmean idxsd) (idxw1 sdw1)
	merge 1:1 idcntry using mi_mat , nogen
	save mi_mat , replace
use mi_mat01w3c702
	gen idcntry = 702
	keep idcntry idxmean idxsd
	rename (idxmean idxsd) (idxw3 sdw3)
	merge 1:1 idcntry using mi_mat , nogen
	save mi_mat , replace	
use mi_mat01w4c702
	gen idcntry = 702
	keep idcntry idxmean idxsd
	rename (idxmean idxsd) (idxw4 sdw4)
	merge 1:1 idcntry using mi_mat , nogen
	save mi_mat , replace
use mi_mat01w5c702
	gen idcntry = 702
	keep idcntry idxmean idxsd
	rename (idxmean idxsd) (idxw5 sdw5)
	merge 1:1 idcntry using mi_mat , nogen
	save mi_mat , replace
use mi_mat01w6c702
	gen idcntry = 702
	keep idcntry idxmean idxsd
	rename (idxmean idxsd) (idxw6 sdw6)
	merge 1:1 idcntry using mi_mat , nogen
	save mi_mat , replace


merge 1:m idcntry using timss_cntry , nogen 
keep in 1/76 
order _all, alpha
order cntry idcntry idxw? , first

save mi_mat , replace

timer off 1 
timer list 1 
log close 

