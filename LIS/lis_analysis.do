use socialrisk.dta , clear

gr bar mrpv5 mrpv6 ,over(dcgroup) by(cname)
gr bar mrpv5 mrpv6 if iso2 == "kr" , over(dcgroup)
