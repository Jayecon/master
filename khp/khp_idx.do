cd ~/dropbox/data/khp
use khp , clear

    levelsof year , local(yset)
    foreach i of local yset {
        conindex total if year == `i' [pw=wgt] , truezero
        local ginit`i' = r(CI)
    }
    foreach i of local yset {
        conindex minc if year == `i' [pw=wgt] , truezero
        local ginim`i' = r(CI)
    }
    foreach i of local yset {
        conindex mexp1 if year == `i' [pw=wgt] , truezero rank(total)
        local cim1t`i' = r(CI)
    }
    foreach i of local yset {
        conindex mexp5 if year == `i' [pw=wgt] , truezero rank(total)
        local cim5t`i' = r(CI)
    }
    foreach i of local yset {
        conindex mexp1 if year == `i' [pw=wgt] , truezero rank(minc)
        local cim1m`i' = r(CI)
    }
    foreach i of local yset {
        conindex mexp5 if year == `i' [pw=wgt] , truezero rank(minc)
        local cim5m`i' = r(CI)
    }
