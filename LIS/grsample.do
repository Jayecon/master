cdgit lis 

local datalist fr se kr jp uk us
    foreach k of local datalist {
        use socialrisk if iso == "kr" & pcvalue, clear

        sort group
        replace group = group / 100

        glcurve xunemp, sortvar(group) glvar(lxe) lorenz nograph
        glcurve aunemp, sortvar(group) glvar(lae) lorenz nograph
        graph twoway ///
            (function y = x,     range(0 1) yaxis (1 2) lcolor(gray) lpattern(shortdash)) ///
            (connect lpv5 group, sort       yaxis (1 2) lcolor(red)                     msymbol(none)) ///
            (connect lpv6 group, sort       yaxis (1 2) lcolor(blue)                    msymbol(none)) ///
            (connect pv5 group,  sort       yaxis (1 2) lcolor(red)  lpattern(dash_dot) msymbol(none)) ///
            (connect pv6 group,  sort       yaxis (1 2) lcolor(blue) lpattern(dash_dot) msymbol(none)) ///
            , ///
            legend(order(1 "균등분포" 2 "중위50%빈곤 누적분포" 3 "중위60%빈곤 누적분포" 4 "중위50%빈곤(우축) " 5 "중위60%빈곤(우축)") ///	
            size(small) region(lstyle(none)) row(2))
        graph export "`k'_unemployment.png", replace

        glcurve pv5, sortvar(group) glvar(lpv5) lorenz nograph
        glcurve pv6, sortvar(group) glvar(lpv6) lorenz nograph
        graph twoway ///
            (function y = x,     range(0 1) yaxis (1 2) lcolor(gray) lpattern(shortdash)) ///
            (connect lpv5 group, sort       yaxis (1 2) lcolor(red)                     msymbol(none)) ///
            (connect lpv6 group, sort       yaxis (1 2) lcolor(blue)                    msymbol(none)) ///
            (connect pv5 group,  sort       yaxis (1 2) lcolor(red)  lpattern(dash_dot) msymbol(none)) ///
            (connect pv6 group,  sort       yaxis (1 2) lcolor(blue) lpattern(dash_dot) msymbol(none)) ///
            , ///
            ylabel(,axis(1) angle(0)) ///
            ylabel(0 "0%" 0.1 "10%" 0.2 "20%" 0.3 "30%" 0.4 "40%" 0.5 "50%" 0.6 "60%" 0.7 "70%" 0.8 "80%" 0.9 "90%" 1 "100%", axis(2) angle(0)) ///
            legend(order(1 "균등분포" 2 "중위50%빈곤 누적분포" 3 "중위60%빈곤 누적분포" 4 "중위50%빈곤(우축) " 5 "중위60%빈곤(우축)") ///	
            size(small) region(lstyle(none)) row(2))
        graph export "`k'_poverty.png", replace
