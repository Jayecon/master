import delimited "~/GitHub/master/LIS/care_s1.csv", encoding(ISO-8859-1) clear
    levelsof iso2 , local(clist)
    local vlist caret1  caret2  caret3  caret4  caret5  caret6  caret7  caret8  caret9
    foreach i of local clist { 
        foreach j of local vlist {
            sum `j' , meanonly
            local v`j' = r(mean)
            di "scalar `i'`j' = `v`j''"
        }
    }

