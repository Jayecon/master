cd ~/dropbox/data/wdi
use wdi_master , clear

/*인접국가범위수*/
set trace off
set traced 1
local rng = 6

preserve
foreach j of varlist v1-v19 {
    forvalue i =  1/7 {
        /*from 1960s to 2020s*/
            local fyr = 1950 + 10*`i'
            local lyr = 1959 + 10*`i'
            if ( `i' == 7 ) {
                local lyr = 2023
            }
        collapse `j' if inrange(year , `fyr' , `lyr') & cyn , by(ccode cname) 
        gsort -`j'
        gen num = _n
        sum num if ccode == "KOR" , meanonly
            local knum = r(mean)
            local kmin = `knum' - `rng'
            if `kmin' <= 0 {
                local kmin = 1
            }
            local kmax = `knum' + `rng'
        di as text "`j' `fyr' `lyr'"
        list in `kmin'/`kmax' , sep(0)
        levelsof ccode if inrange(num, `kmin', `kmax'), local(`j'cset`i')
        restore , preserve
        di ``j'cset`i''
    }
}

qui{ 
    foreach j of varlist v1-v18 {
        forvalue i =  1/7 {
            local fyr = 1950 + 10*`i'
            local lyr = 1959 + 10*`i'
            if ( `i' == 7 ) {
                local lyr = 2023
            }
            gen `j'e`fyr' = 0
            foreach k of local `j'cset`i' {
                replace `j'e`fyr' = 1 if inrange(year , `fyr' , `lyr') & ccode == "`k'"
            }
        }
    }
}

tempfile tfile tfile2
qui{
    foreach j of varlist v1-v19 {
        forvalue i =  1/7 {
            /*from 1960s to 2020s*/
                local fyr = 1950 + 10*`i'
                local lyr = 1959 + 10*`i'
                if ( `i' == 7 ) {
                    local lyr = 2023
                }
            collapse `j' if inrange(year , `fyr' , `lyr') & cyn , by(ccode) 
            gsort -`j'
            gen `j'r`fyr' = _n
            drop `j'
            save `tfile' , replace
            if "`j'`i'" == "v11" {
                restore , preserve
                merge m:1 ccode using `tfile' , nogen
                replace `j'r`fyr' = 0 if !inrange(year , `fyr' , `lyr') & cyn
                replace `j'r`fyr' = . if missing(`j')
                save `tfile2' , replace
            }
            else {
                use `tfile2' , clear
                merge m:1 ccode using `tfile' , nogen
                replace `j'r`fyr' = 0 if !inrange(year , `fyr' , `lyr') & cyn
                replace `j'r`fyr' = . if missing(`j')
                save `tfile2' , replace
                restore , preserve
            }
        }
    }
}

use `tfile2' , clear
order cyn-v19 , after(ccode)
sort ccode year
save wdi , replace
