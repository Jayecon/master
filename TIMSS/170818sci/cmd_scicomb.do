cd C:\170818sci
discard 
set more off 
capture log close 
timer clear 1 
log using timss_scicomb , replace 
timer on 1 

forvalues i = 1/6 {
	use  mi_sci01w`i' , clear
	keep idcntry idxmean idxsd
	rename (idxmean idxsd) (idxw`i' sdw`i')
	if `i' == 1 {
		save mi_sci , replace
		continue
	}
	merge 1:1 idcntry using mi_sci , nogen
	save mi_sci , replace
}
use mi_sci01w1c414
	gen idcntry = 414
	keep idcntry idxmean idxsd
	rename (idxmean idxsd) (idxw1 sdw1)
	merge 1:1 idcntry using mi_sci , nogen
	save mi_sci , replace
use mi_sci01w4c702
	gen idcntry = 702
	keep idcntry idxmean idxsd
	rename (idxmean idxsd) (idxw4 sdw4)
	merge 1:1 idcntry using mi_sci , nogen
	save mi_sci , replace
use mi_sci01w5c702
	gen idcntry = 702
	keep idcntry idxmean idxsd
	rename (idxmean idxsd) (idxw5 sdw5)
	merge 1:1 idcntry using mi_sci , nogen
	save mi_sci , replace
use mi_sci01w5c752
	gen idcntry = 752
	keep idcntry idxmean idxsd
	rename (idxmean idxsd) (idxw5 sdw5)
	merge 1:1 idcntry using mi_sci , nogen
	save mi_sci , replace
use mi_sci01w6c702
	gen idcntry = 702
	keep idcntry idxmean idxsd
	rename (idxmean idxsd) (idxw6 sdw6)
	merge 1:1 idcntry using mi_sci , nogen
	save mi_sci , replace


merge 1:m idcntry using timss_cntry , nogen 
keep in 1/76 
order _all, alpha
order cntry idcntry idxw? , first

save mi_sci , replace

timer off 1 
timer list 1 
log close 
