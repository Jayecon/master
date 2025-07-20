use socialrisk.dta , clear

gr bar xunemp aunemp if dcvalue ,over(group) by(cname)

twoway (connect aunemp group if dcvalue ,sort by(cname)) ///
    (connect xunemp group if dcvalue ,sort by(cname))

gr bar pv5 pv6 if pcvalue ,over(group) by(cname)
	
twoway (connect pv5 group if pcvalue ,sort by(cname) msymbol(none)) ///
    (connect pv6 group if pcvalue ,sort by(cname) msymbol(none))
