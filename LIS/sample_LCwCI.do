svylorenz hitotal , pvar(p) lvar(rl) selvar(se)
local half_alpha = (1 - `c(level)' / 100) / 2
gen lcl = rl + invnorm(`half_alpha') * se

graph twoway (connect rl p, sort yaxis(1 2) ) ///
 (function y = x, range(0 1) yaxis(1 2) ) ///
 (rspike lcl ucl p, blcolor(black) sort ) ///
 , aspect(1) xtitle("Cumulative population share, p") ///
 ytitle("Cumulative income share, poorest 100p%", axis(1)) ytitle(" ",axis(2)) ///
 legend(label (1 "1981") label(2 "Equality") ///
 label(3 "95%CI") size(small) ///
 region(lstyle(none)) ) saving(svylorenz81_91, replace)
