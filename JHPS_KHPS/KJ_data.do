cd ~/dropbox/data/JHPS_KHPS/

use jhps_khps.dta , clear

qui ds 
local varlist `r(varlist)'
foreach i of local varlist {
    sum `i' , meanonly
    scalar max = `r(max)'
    if max == 999999 {
        replace `i' = . if `i' == 999999
    }
    else if max == 99999 {
        replace `i' = . if `i' == 99999
    }
    else if max == 9999 {
        replace `i' = . if `i' == 9999
    }
    else if max == 999 {
        replace `i' = . if `i' == 999
    }
    else if max == 99 {
        replace `i' = . if `i' == 99
    }
    else if max == 9 {
        replace `i' = . if `i' == 9
    }
}

/*v8 missing*/
qui ds 
local varlist `r(varlist)'
foreach i of local varlist {
    sum `i' , meanonly
    scalar max = `r(max)'
    if max == 888888 {
        replace `i' = . if `i' == 888888
    }
    else if max == 88888 {
        replace `i' = . if `i' == 88888
    }
    else if max == 8888 {
        replace `i' = . if `i' == 8888
    }
    else if max == 888 {
        replace `i' = . if `i' == 888
    }
    else if max == 88 {
        replace `i' = . if `i' == 88
    }
    else if max == 8 {
        replace `i' = . if `i' == 8
    }
}
save jk.dta , replace
