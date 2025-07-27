cd ~/dropbox/data/khp/rawdata1

local dset ahph bhph aphi bphi aphr bphr       cd er hh in income_ind ind     md ou //08
local dset  hph       phi       phr      appen cd er hh in income_ind ind ltc md ou //09
local dset           aphi bphi aphr bphr appen cd er hh in income_ind ind ltc md ou //10
local dset            phi       phr      appen cd er hh in income_ind ind ltc md ou //11-18

tempfile tfile

foravlue i = 8/18 {
    local yr : disp %02.0f  = `x'
    local year = 2000 + `i'
    use mt`yr'_h , clear
        isid HHID
        gen YEAR = `year'
        merge 1:m HHID using mt`yr'_i , nogen
        save `tfile' , replace
    foreach j of local dset {
        if `i' == 8 | `i' == 10 {
            use t`yr'aphi , clear
        }
        else {
            use t`yr'phi , clear
        }
        rename _all , low
        /*get case numbers*/
        bys hhid pid : gen vnum = _n
            sum vnum , meanonly
            local vmax = r(max)
        /*get var labels*/
        local vset num e1_1 e2 e3 e4 e5 e6 e7
        foreach k of local vset {
            local l`k'   : var label `k'
            forvalue l = 1/`vmax' {
                local l`k'`l' `l`k''(`l')
            }
        }
        reshape wide num e1_1-e7 , i(hhid pid) j(vnum)
        /*labeling new vars*/
        foreach k of local vset {
            forvalue l = 1/`vmax' {
                label var `k'`l' "`l`k'`l''"
            }
        }
    }
}
