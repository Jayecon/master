    cdgit lis

    local datalist fr se kr jp uk us
    foreach k of local datalist {
        use socialrisk if iso == "`k'" & pcvalue, clear

        sort group
        replace group = group / 100

        local vset poverty unemployment noemployment underemployment health care isolation
        foreach i of local vset {
            if "`i'" == "poverty" {
                local v1 pv5
                local v2 pv6
                local l2 "중위50%빈곤 누적분포"
                local l3 "중위60%빈곤 누적분포"
                local l4 "중위50%빈곤(우축)"
                local l5 "중위60%빈곤(우축)"
            }
            else if "`i'" == "unemployment" {
                local v1 aunemp
                local v2 xunemp
                local l2 "모두실업 누적분포"
                local l3 "일부실업 누적분포"
                local l4 "모두실업(우축)"
                local l5 "일부실업(우축)"
            }
            else if "`i'" == "noemployment" {
                local v1 anoemp
                local v2 xnoemp
                local l2 "모두미취업 누적분포"
                local l3 "일부미취업 누적분포"
                local l4 "모두미취업(우축)"
                local l5 "일부미취업(우축)"
            }
            else if "`i'" == "underemployment" {
                local v1 aptjob
                local v2 xptjob
                local l2 "모두시간제 누적분포"
                local l3 "일부시간제 누적분포"
                local l4 "모두시간제(우축)"
                local l5 "일부시간제(우축)"
            }
            else if "`i'" == "health" {
                local v1 abhlth
                local v2 xbhlth
                local l2 "모두나쁨 누적분포"
                local l3 "일부나쁨 누적분포"
                local l4 "모두나쁨(우축)"
                local l5 "일부나쁨(우축)"
            }
            else if "`i'" == "care" {
                local v1 care
                local v2
                local l2 "돌봄위험 누적분포"
                local l3 "돌봄위험(우축)"
            }
            else if "`i'" == "isolation" {
                local v1 aisolt
                local v2 xisolt
                local l2 "모두지지없음 누적분포"
                local l3 "일부지지없음 누적분포"
                local l4 "모두지지없음(우축)"
                local l5 "일부지지없음(우축)"
            }
            if "`v2'" != "" {
                glcurve `v1', sortvar(group) glvar(l`v1') lorenz nograph
                glcurve `v2', sortvar(group) glvar(l`v2') lorenz nograph
                graph twoway ///
                    (function y = x,      range(0 1) yaxis (1 2) lcolor(gray) lpattern(shortdash)) ///
                    (connect l`v1' group, sort       yaxis (1 2) lcolor(red)                     msymbol(none)) ///
                    (connect l`v2' group, sort       yaxis (1 2) lcolor(blue)                    msymbol(none)) ///
                    (connect `v1'  group, sort       yaxis (1 2) lcolor(red)  lpattern(dash_dot) msymbol(none)) ///
                    (connect `v2'  group, sort       yaxis (1 2) lcolor(blue) lpattern(dash_dot) msymbol(none)) ///
                    , ///
                    ylabel(,axis(1) angle(0)) ///
                    ylabel(0 "0%" 0.1 "10%" 0.2 "20%" 0.3 "30%" 0.4 "40%" 0.5 "50%" 0.6 "60%" 0.7 "70%" 0.8 "80%" 0.9 "90%" 1 "100%", axis(2) angle(0)) ///
                    legend(order(1 "균등분포" 2 "`l2'" 3 "`l3'" 4 "`l4'" 5 "`l5'") ///
                    size(small) region(lstyle(none)) row(2)) graphregion(color(white))
                graph export "`k'_`i'.png", replace
            }
            else {
                glcurve `v1', sortvar(group) glvar(l`v1') lorenz nograph
                graph twoway ///
                    (function y = x,      range(0 1) yaxis (1 2) lcolor(gray) lpattern(shortdash)) ///
                    (connect l`v1' group, sort       yaxis (1 2) lcolor(red)                     msymbol(none)) ///
                    (connect `v1'  group, sort       yaxis (1 2) lcolor(red)  lpattern(dash_dot) msymbol(none)) ///
                    , ///
                    ylabel(,axis(1) angle(0)) ///
                    ylabel(0 "0%" 0.1 "10%" 0.2 "20%" 0.3 "30%" 0.4 "40%" 0.5 "50%" 0.6 "60%" 0.7 "70%" 0.8 "80%" 0.9 "90%" 1 "100%", axis(2) angle(0)) ///
                    legend(order(1 "균등분포" 2 "`l2'" 3 "`l3'") ///
                    size(small) region(lstyle(none)) row(2)) graphregion(color(white))
                graph export "`k'_`i'.png", replace
            }
        }
    }
