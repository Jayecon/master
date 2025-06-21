import delimited "~/GitHub/master/LIS/rentss1.csv", encoding(ISO-8859-1)
    levelsof iso2 , local(clist)
    local vlist rt4t1  rt4t2  rt4t3  rt4t4  rt4t5  rt4t6  rt4t7  rt4t8  rt4t9

    foreach i of local clist { 
        foreach j of local vlist {
            sum `j' , meanonly
            local v`j' = r(mean)
            di "scalar `i'`j' = `v`j''"
        }
    }
