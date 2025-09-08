cd ~/Dropbox
use wdi , clear
set trace off

/*인접국가범위수*/
local rng = 6

preserve
foreach j of varlist v1-v18 {
    forvalue i =  1/7 {
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

save wdi , replace
