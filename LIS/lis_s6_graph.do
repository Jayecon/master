    local datalist fr se kr jp uk us
    foreach k of local datalist {
        use sr if iso == "`k'" & pcvalue, clear

        sort group
        set obs 101
        gen tgrp = group[_n-1]
        label var tgrp ""
        replace tgrp = 0 in 1
        replace tgrp = tgrp / 100

        local vset household individual
        foreach i of local vset {
            if "`i'" == "household" {
                local v1 pv6
                local v2 pv5
                local v3 care
                local l1 "중위60%빈곤위험"
                local l2 "중위50%빈곤위험"
                local l3 "돌봄위험"
            }
            else if "`i'" == "individual" {
                local v1 aunemp
                local v2 anoemp
                local v3 aptjob
                local v4 abhlth
                local v5 aisolt
                local l1 "실업위험"
                local l2 "미취업위험"
                local l3 "불완전고용위험"
                local l4 "건강위험"
                local l5 "사회적지지 부재 위험"
            }
            if "`v1'" == "pv6" {
                glcurve `v1', sortvar(group) glvar(l`v1') lorenz nograph
                glcurve `v2', sortvar(group) glvar(l`v2') lorenz nograph
                glcurve `v3', sortvar(group) glvar(l`v3') lorenz nograph
                gen t`v1' = l`v1'[_n-1]
                replace t`v1' = 0 in 1
                gen t`v2' = l`v2'[_n-1]
                replace t`v2' = 0 in 1
                gen t`v3' = l`v3'[_n-1]
                replace t`v3' = 0 in 1
                graph twoway ///
                    (connect t`v1' tgrp, sort       lcolor(red)  lpattern(line) msymbol(none)) ///
                    (connect t`v2' tgrp, sort       lcolor(blue) lpattern(line) msymbol(none)) ///
                    (connect t`v3' tgrp, sort       lcolor(green) lpattern(line) msymbol(none)) ///
                    (function y = x     , range(0 1) lcolor(gray) lpattern(shortdash)) ///
                    , ///
                    xtitle("") ///
                    ytitle("") ///
                    ylabel(0 "0%" 0.1 "10%" 0.2 "20%" 0.3 "30%" 0.4 "40%" 0.5 "50%" 0.6 "60%" 0.7 "70%" 0.8 "80%" 0.9 "90%" 1 "100%", angle(0)) ///
                    legend(order(1 "`l1'" 2 "`l2'" 3 "`l3'" 4 "균등분포" ) ///
                    size(vsmall) region(lstyle(none)) row(1) pos(6)) graphregion(color(white)) ///
                    aspectratio(1) xsize(5) ysize(5) yscale(alt)
                graph export "`k'_fam.png", replace
            }
            else {
                glcurve `v1', sortvar(group) glvar(l`v1') lorenz nograph
                glcurve `v2', sortvar(group) glvar(l`v2') lorenz nograph
                glcurve `v3', sortvar(group) glvar(l`v3') lorenz nograph
                glcurve `v4', sortvar(group) glvar(l`v4') lorenz nograph
                glcurve `v5', sortvar(group) glvar(l`v5') lorenz nograph
                gen t`v1' = l`v1'[_n-1]
                replace t`v1' = 0 in 1
                gen t`v2' = l`v2'[_n-1]
                replace t`v2' = 0 in 1
                gen t`v3' = l`v3'[_n-1]
                replace t`v3' = 0 in 1
                gen t`v4' = l`v4'[_n-1]
                replace t`v4' = 0 in 1
                gen t`v5' = l`v5'[_n-1]
                replace t`v5' = 0 in 1
                graph twoway ///
                    (connect t`v1' tgrp, sort       lcolor(red)  lpattern(line) msymbol(none)) ///
                    (connect t`v2' tgrp, sort       lcolor(blue) lpattern(line) msymbol(none)) ///
                    (connect t`v3' tgrp, sort       lcolor(green) lpattern(line) msymbol(none)) ///
                    (connect t`v4' tgrp, sort       lcolor(orange) lpattern(line) msymbol(none)) ///
                    (connect t`v5' tgrp, sort       lcolor(purple) lpattern(line) msymbol(none)) ///
                    (function y = x     , range(0 1) lcolor(gray) lpattern(shortdash)) ///
                    , ///
                    xtitle("") ///
                    ytitle("") ///
                    ylabel(0 "0%" 0.1 "10%" 0.2 "20%" 0.3 "30%" 0.4 "40%" 0.5 "50%" 0.6 "60%" 0.7 "70%" 0.8 "80%" 0.9 "90%" 1 "100%", angle(0)) ///
                    legend(order(1 "`l1'" 2 "`l2'" 3 "`l3'" 4 "`l4'" 5 "`l5'" 6 "균등분포" ) ///
                    size(vsmall) region(lstyle(none)) row(2) pos(6)) graphregion(color(white)) ///
                    aspectratio(1) xsize(5) ysize(5) yscale(alt)
                graph export "`k'_idv.png", replace
            }
        }
    }
