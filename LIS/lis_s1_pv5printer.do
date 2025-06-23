import delimited "~/GitHub/master/LIS/pv5_s1.csv", encoding(ISO-8859-1)
    levelsof iso2 , local(clist)
    local vlist pv5t1 pv5t2 pv5t3 pv5t4 pv5t5 pv5t6 pv5t7 pv5t8 pv5t9

    foreach i of local clist { 
        foreach j of local vlist {
            sum `j' , meanonly
            local v`j' = r(mean)
            di "scalar `i'`j' = `v`j''"
        }
    }
