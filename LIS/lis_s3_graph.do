    local datalist fr se kr jp uk us
    foreach k of local datalist {
        use sr if iso == "`k'" & pcvalue, clear

        sort group
        set obs 101
        gen tgrp = group[_n-1]
        label var tgrp ""
        replace tgrp = 0 in 1
        replace tgrp = tgrp / 100

        local vset poverty unemployment noemployment underemployment health care isolation
        foreach i of local vset {
            if "`i'" == "poverty" {
                local v1 pv5
                local v2 pv6
                local l2 "중위50%선 빈곤위험 누적점유율(우축)"
                local l3 "중위60%선 빈곤위험 누적점유율(우축)"
                local l4 "중위50%빈곤위험"
                local l5 "중위60%빈곤위험"
            }
            else if "`i'" == "unemployment" {
                local v1 aunemp
                local v2 xunemp
                local l2 "실업위험도 누적점유율(우축)"
                local l3 "일부실업 누적분포"
                local l4 "실업위험도"
                local l5 "일부실업(우축)"
            }
            else if "`i'" == "noemployment" {
                local v1 anoemp
                local v2 xnoemp
                local l2 "미취업위험 누적점유율(우축)"
                local l3 "일부미취업 누적분포"
                local l4 "미취업 위험도"
                local l5 "일부미취업(우축)"
            }
            else if "`i'" == "underemployment" {
                local v1 aptjob
                local v2 xptjob
                local l2 "불완전고용위험 누적 점유율(우축)"
                local l3 "일부시간제 누적분포"
                local l4 "불완전고용 위험도"
                local l5 "일부시간제(우축)"
            }
            else if "`i'" == "health" {
                local v1 abhlth
                local v2 xbhlth
                local l2 "건강위험도 누적점유율(우축)"
                local l3 "일부나쁨 누적분포"
                local l4 "건강위험도"
                local l5 "일부나쁨(우축)"
            }
            else if "`i'" == "isolation" {
                local v1 aisolt
                local v2 xisolt
                local l2 "사회적지지 부재 위험 누적비율(우축)"
                local l3 "일부지지없음 누적분포"
                local l4 "사회적지지 부재 위험"
                local l5 "일부지지없음(우축)"
            }
            else if "`i'" == "care" {
                local v1 care
                local v2
                local l2 "돌봄위험 누적점유율(우축)"
                local l4 "돌봄위험도"
            }
            if "`v2'" == "pv6" {
                glcurve `v1', sortvar(group) glvar(l`v1') lorenz nograph
                glcurve `v2', sortvar(group) glvar(l`v2') lorenz nograph
                    gen t`v1' = l`v1'[_n-1]
                    replace t`v1' = 0 in 1
                    gen t`v2' = l`v2'[_n-1]
                    replace t`v2' = 0 in 1
                    gen tl`v1' = `v1'*100
                    gen tl`v2' = `v2'*100
                    nicelabels tl`v2' , local(v2ylab)
                    mylabels `v2ylab' , suffix(%) local(v2ylab)
                graph twoway ///
                    (connect tl`v1' tgrp, sort  yaxis(2) lcolor(red)  msymbol(none) lwidth(medthick) lpattern(dot) ) ///
                    (connect tl`v2' tgrp, sort  yaxis(2) lcolor(blue) msymbol(none) lwidth(medthick) lpattern(dot) ) ///
                    (function y = x, range(0 1) yaxis(1) lcolor(gray) lpattern(shortdash)) ///
                    (connect t`v1'  tgrp, sort  yaxis(1) lcolor(red)  msymbol(none)) ///
                    (connect t`v2'  tgrp, sort  yaxis(1) lcolor(blue) msymbol(none)) ///
                    , ///
                    ylabel(0 "0%" 0.1 "10%" 0.2 "20%" 0.3 "30%" 0.4 "40%" 0.5 "50%" 0.6 "60%" 0.7 "70%" 0.8 "80%" 0.9 "90%" 1 "100%", axis(1) angle(0)) ///
                    xlabel(0 "0" 0.1 "10" 0.2 "20" 0.3 "30" 0.4 "40" 0.5 "50" 0.6 "60" 0.7 "70" 0.8 "80" 0.9 "90" 1 "100", angle(0)) ///
                    ylabel(`v2ylab', axis(2) angle(0)) ///
                    xtitle("") ///
                    ytitle("",axis(1)) ///
                    ytitle("",axis(2)) ///
                    legend(order(1 "`l4'" 2 "`l5'" 3 "위험의 균등분포" 4 "`l2'" 5 "`l3'" ) ///
                    size(vsmall) region(lstyle(none)) col(2) pos(6)) graphregion(color(white)) ///
                    aspectratio(1) xsize(5) ysize(5)
                graph export "`k'_`i'.png", replace
            }
            else {
                glcurve `v1', sortvar(group) glvar(l`v1') lorenz nograph
                    gen t`v1' = l`v1'[_n-1]
                    replace t`v1' = 0 in 1
                    gen tl`v1' = `v1'*100
                    nicelabels tl`v1' , local(v1ylab)
                    mylabels `v1ylab' , suffix(%) local(v1ylab)
                graph twoway ///
                    (connect tl`v1' tgrp, sort  yaxis(2) lcolor(red) msymbol(none)  lpattern(dot) lwidth(medthick)) ///
                    (function y = x, range(0 1) yaxis(1) lcolor(gray)               lpattern(shortdash)) ///
                    (connect t`v1'  tgrp, sort  yaxis(1) lcolor(red) msymbol(none)) ///
                    , ///
                    ylabel(0 "0%" 0.1 "10%" 0.2 "20%" 0.3 "30%" 0.4 "40%" 0.5 "50%" 0.6 "60%" 0.7 "70%" 0.8 "80%" 0.9 "90%" 1 "100%", axis(1) angle(0)) ///
                    xlabel(0 "0" 0.1 "10" 0.2 "20" 0.3 "30" 0.4 "40" 0.5 "50" 0.6 "60" 0.7 "70" 0.8 "80" 0.9 "90" 1 "100", angle(0)) ///
                    ylabel(`v1ylab', axis(2) angle(0)) ///
                    xtitle("") ///
                    ytitle("",axis(1)) ///
                    ytitle("",axis(2)) ///
                    legend(order(1 "`l4'" 2 "균등분포"  3 "`l2'") ///
                    size(small) region(lstyle(none)) row(2) pos(6)) graphregion(color(white)) ///
                    aspectratio(1) xsize(5) ysize(5)
                graph export "`k'_`i'.png", replace
            }
        }
    }
