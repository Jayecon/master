cd ~/dropbox/data/khp
set tr off
set traced 1

tempfile tfile

forvalue i = 8/18 {
    local yr : disp %02.0f  = `i'
    local year = 2000 + `i'

	di as text "YEAR == `year'"
   
    use rawdata1/t`yr'hh , clear
        rename _all , upper
        isid HHID
        gen YEAR = `year'
    if `i' == 8 {
        save `tfile' , replace
    }
    else {
        append using `tfile'
        save `tfile' , replace
    }
}

label var YEAR "조사년도"
label data "KHP Wave1 Household Data"
rename _all , low
compress
save khp_hh.dta , replace
