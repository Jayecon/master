cd ~/dropbox
use wdi , clear

local yset 1960 1970 1980 1990 2000 2010 2020
preserve

forvalue k = 1/19 {
    foreach j of local yset {
        keep if v`k'r`j'
        separate v`k' , by(kname) gen(tmp) short
        ds, has(varl *==*)
        local vset = r(varlist)
        foreach i of local vset {
            local aaa : var label `i'
            local aaa : subinstr local aaa "kname ==" "", all
            label var `i' "`aaa'"
        }
        local yl : var label v`k'
        line tmp* year, lwidth(medthick) legend(col(1)) ytitle("`yl'")
        gr save v`k'e`j' , replace
        restore , preserve
    }
}
