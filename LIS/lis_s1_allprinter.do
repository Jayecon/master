cd  ~/GitHub/master/LIS
import delimited "s1.csv", encoding(ISO-8859-1)
    levelsof iso2 , local(clist)
    levelsof rname , local(vlist)

    foreach j of local vlist {
        foreach i of local clist { 
            forvalue k =1/9 {
                sum t`k' if iso2 == "`i'" & rname == "`j'" , meanonly
                local v`j' = r(mean)
                di "scalar `i'`j't`k' = `v`j''"
            }
        }
        di ""
    }

    collapse t? , by(cname rname)
    drop if rname == "rent"

save riskmean.dta , replace
