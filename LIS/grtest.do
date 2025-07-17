capture drop p rl se kx ky ucl lcl kxx

svyset [pw=hpopwgt]

kdensity hitotal [aw=hpopwgt] , n(100) gen(kx ky) nograph
xtile kxx = kx , nq(100)
replace kxx = kxx / 100

svylorenz hitotal , ngp(100) pvar(p) lvar(rl) selvar(se)
	local half_alpha = (1 - `c(level)' / 100) / 2
	gen lcl = rl + invnorm(`half_alpha') * se
	gen ucl = rl + invnorm(1-`half_alpha') * se
	
graph twoway ///
	(connect rl p, sort yaxis(1 1) msymbol(none)) ///
	(function y = x, range(0 1) yaxis(1 1) ) ///
	(rspike lcl ucl p, blcolor(black) sort ) ///
	(connect ky kxx, sort yaxis(2 2) msymbol(none)) ///
	, aspect(1) xtitle("Cumulative population share, p") ///
	ytitle("Cumulative income share, poorest 100p%", axis(1)) ytitle(" ",axis(2)) ///
	legend(label (1 "Lorenz") label(2 "Equality") label(4 "Density") label(3 "95%CI") ///
		size(small) region(lstyle(none)) ) ///
		saving(svylorenz81_91, replace)	
