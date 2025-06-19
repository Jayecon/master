import delimited "/Users/jay/GitHub/master/LIS/pv.csv", delimiter(",") encoding(ISO-8859-1)clear

gr bar mrpv5 mrpv6 ,over(dcgroup) by(cname)
gr bar mrpv5 mrpv6 if iso2 == "kr" , over(dcgroup)
