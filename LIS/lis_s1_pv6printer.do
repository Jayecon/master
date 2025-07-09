import delimited "~/GitHub/master/LIS/pv6_s1.csv", encoding(ISO-8859-1)
    levelsof iso2 , local(clist)
    local vlist pv6t1 pv6t2 pv6t3 pv6t4 pv6t5 pv6t6 pv6t7 pv6t8 pv6t9

    foreach i of local clist { 
        foreach j of local vlist {
            sum `j' if iso2 == "`i'" , meanonly
            local v`j' = r(mean)
            di "scalar `i'`j' = `v`j''"
        }
    }
