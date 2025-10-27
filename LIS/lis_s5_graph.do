    local datalist fr se kr jp uk us
    foreach k of local datalist {
        use bf if iso == "`k'" & pcvalue, clear

        sort group
        set obs 101
        gen tgrp = group[_n-1]
        label var tgrp ""
        replace tgrp = 0 in 1
        replace tgrp = tgrp / 100

        local v1 bnf
        local v2 sct
        local v3 bdn
        local v4 tax
        local v5 bf0
        local v6 bfn
        local l1 "수혜"
        local l2 "사회보험료"
        local l3 "부담"
        local l4 "조세"
        local l5 "순수혜(음수=0으로 전환)"
        local l6 "순수혜"

        glcurve `v1', sortvar(group) glvar(l`v1') lorenz nograph
        glcurve `v2', sortvar(group) glvar(l`v2') lorenz nograph
        glcurve `v3', sortvar(group) glvar(l`v3') lorenz nograph
        glcurve `v4', sortvar(group) glvar(l`v4') lorenz nograph
        glcurve `v5', sortvar(group) glvar(l`v5') lorenz nograph
        glcurve `v6', sortvar(group) glvar(l`v6') lorenz nograph
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
        gen t`v6' = l`v6'[_n-1]
        replace t`v6' = 0 in 1

        graph twoway ///
            (function y = x    , range(0 1) lcolor(gray)   lpattern(shortdash)) ///
            (connect t`v1' tgrp , sort      lcolor(red)    lpattern(line) msymbol(none)) ///
            (connect t`v2' tgrp , sort      lcolor(blue)   lpattern(line) msymbol(none)) ///
            (connect t`v3' tgrp , sort      lcolor(green)  lpattern(line) msymbol(none)) ///
            (connect t`v4' tgrp , sort      lcolor(violet) lpattern(line) msymbol(none)) ///
            , ///
            xtitle("") ///
            ytitle("") ///
            ylabel(0 "0%" 0.1 "10%" 0.2 "20%" 0.3 "30%" 0.4 "40%" 0.5 "50%" 0.6 "60%" 0.7 "70%" 0.8 "80%" 0.9 "90%" 1 "100%", angle(0)) ///
            legend(order(1 "균등분포" 2 "`l1'" 3 "`l2'"  4 "`l3'" 5 "`l4'" ) ///
            size(vsmall) region(lstyle(none)) row(1) pos(6)) graphregion(color(white)) ///
            aspectratio(1) xsize(5) ysize(5) yscale(alt)
        graph export "`k'_bdn.png", replace

        sum t`v6' , meanonly
        local ratio = (r(max)-r(min))*5
        di "The ratio is `ratio'"
        gen tl`v6' = t`v6'*100
        nicelabels tl`v6' , nvals(20) local(v6ylab)
        mylabels `v6ylab' , myscale(@/100) suffix(%) local(v6ylab)
        graph twoway ///
            (function y = x     , range(0 1) lcolor(gray) lpattern(shortdash)) ///
            (connect t`v5' tgrp, sort       lcolor(red)  lpattern(line) msymbol(none)) ///
            (connect t`v6' tgrp, sort       lcolor(red) lwidth(thick) lpattern(dot) msymbol(none)) ///
            , ///
            xtitle("") ///
            ytitle("") ///
            ylabel(`v6ylab', angle(0)) ///
            legend(order(1 "균등분포" 2 "`l5'" 3 "`l6'") ///
            size(vsmall) region(lstyle(none)) row(1) pos(6)) graphregion(color(white)) ///
            xsize(5) ysize(`ratio') yscale(alt)
        graph export "`k'_bnf.png", replace
    }
    
