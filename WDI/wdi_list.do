cd ~/dropbox/data/wdi
use wdi , clear

local yset 1960 1970 1980 1990 2000 2010 2020

forvalue k = 1/19 {
    foreach j of local yset {
        sort v`k'r`j' year
        local lv : var label v`k'
        di as error "`lv' in `j'"
        list kname year v`k' v`k'r`j' if v`k'r`j' & !missing(v`k'r`j'), sepby(kname)
    }
}
