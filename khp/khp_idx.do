cd ~/dropbox/data/khp
use khp , clear

    levelsof year , local(yset)
    foreach i of local yset {
        conindex etotal if year == `i' [pw=wgt] , truezero
        local ginit`i' = r(CI)
    }
    foreach i of local yset {
        conindex eminc if year == `i' [pw=wgt] , truezero
        local ginim`i' = r(CI)
    }
    foreach i of local yset {
        conindex etotal5 if year == `i' [pw=wgt] , truezero
        local ginit5`i' = r(CI)
    }
    foreach i of local yset {
        conindex eminc5 if year == `i' [pw=wgt] , truezero
        local ginim5`i' = r(CI)
    }
    foreach i of local yset {
        conindex etotal1 if year == `i' [pw=wgt] , truezero
        local ginit1`i' = r(CI)
    }
    foreach i of local yset {
        conindex eminc1 if year == `i' [pw=wgt] , truezero
        local ginim1`i' = r(CI)
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

    di as text "year,ginit,ginim,ginit1,ginim1,ginit5,ginim5,cim1t,cim5t,cim1m,cim5m"
    foreach i of local yset {
        di as text "`i',`ginit`i'' ,`ginim`i'' ,`ginit1`i'' ,`ginim1`i'' ,`ginit5`i'' ,`ginim5`i'' ,`cim1t`i'' ,`cim5t`i'' ,`cim1m`i'' ,`cim5m`i''"
    }
