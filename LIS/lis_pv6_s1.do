import delimited "/Users/jay/GitHub/master/LIS/lis_pv6Ps1.txt", delimiter(";") encoding(UTF-8) clear
drop v14
drop if cname == "> "
reshape wide pv6* , i(cname) j(year)
forvalue i = 1/9 {
    egen pv6t`i'avg = rowmean(pv6t`i'2010-pv6t`i'2019)
}
