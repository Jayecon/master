cd ~/dropbox/data/khp/rawdata1
set tr off
set traced 1

tempfile tfile

forvalue i = 8/18 {
    local yr : disp %02.0f  = `i'
    local year = 2000 + `i'

	di as text "YEAR == `year'"
   
    use mt`yr'_h , clear
        rename _all , upper
        isid HHID
        gen YEAR = `year'
        merge 1:1 HHID using mt`yr'_h , nogen  
        merge 1:m HHID using mt`yr'_i , nogen  
    if `i' == 8 {
        save `tfile' , replace
    }
    else {
        append using `tfile'
        save `tfile' , replace
    }
}

label var YEAR "조사년도"
label data "KHP Wave1 Key data"
save khp_key.dta , replace
