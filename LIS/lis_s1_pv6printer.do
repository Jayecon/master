import delimited "~/GitHub/master/LIS/s1.csv", encoding(ISO-8859-1)
    levelsof iso2 , local(cset)
    levelsof rname , local(rset)

    foreach k of local rset{
        foreach i of local cset { 
            forvalue j = 1/9 {
                sum t`j' if iso2 == "`i'" & rname == "`k'" , meanonly
                local v`k'`j' = r(mean)
                di "scalar `i'`k't`j' = `v`k'`j''"
            }
        }
    }
