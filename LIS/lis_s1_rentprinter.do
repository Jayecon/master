import delimited "~/GitHub/master/LIS/rent_s1.csv", encoding(ISO-8859-1)
    levelsof iso2 , local(clist)
    local vlist rtt1  rtt2  rtt3  rtt4  rtt5  rtt6  rtt7  rtt8  rtt9

    foreach i of local clist { 
        foreach j of local vlist {
            sum `j' , meanonly
            local v`j' = r(mean)
            di "scalar `i'`j' = `v`j''"
        }
    }
