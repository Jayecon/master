    doedit abc.do
    do abc.do

    /*local; number case*/
        local x 1
        local y = 1
        local z1 `x' + 1
        local z2 "`y' + 1"
        local z3 `x' + `y' +1
        local z4 `x' `y'
        di "macro x = `x' and marco y = `y'" 
        di "macro x = " `x' " and marco y = "`y' 
        di "macro z1 = `z1', macro z2 = `z2' and macro z3 = `z3'" 
        di "macro z1 = "`z1', "macro z2 = "`z2' " and macro z3 = "`z3' 
        di "macro z4 = "`z4' 

    /*local; 07-09 표현 만들기*/
        local yr : disp %02.0f  = 7
        di "`yr'"

    /*local; string case*/
        local x = foo
        local y bar
        di "macro x = `x' and marco y = `y'" 
        di "macro x = " `x' " and marco y = "`y' 
        di "macro z1 = `z1', macro z2 = `z2' and macro z3 = `z3'" 
        di "macro z1 = "`z1', "macro z2 = "`z2' " and macro z3 = "`z3' 
        di "macro z4 = "`z4' 

    /*appending*/
        sysuse auto , clear
        tempfile tfile //임시파일
        preserve
            gen tag = 1
            save `tfile'
        restore
        append using `tfile' //파일간 수직결합
        de

    /*if: variable logical*/
        di p
        di p[1]
        if p >= 3000 {
            sum
        }
        sum if p >= 3000
        if p >= 6000 {
            sum
        }
        sum if p >= 6000

    /*if: variable logical*/
        local year = 2007
        if "`year'" == "2007" {
            sum 
        }
        if "`year'" == "2006" {
            sum 
        }

    /*else*/
        if "`year'" == "2006" {
            sum 
        }
        else{
        di "local year != 2006"
        }

    /*else if*/
        if "`year'" == "2006" {
            sum 
        }
        else if "`year'" < "2006" {
        di "local year < 2006"
        }
        else {
        di "local year > 2006"
        }

    /*foreach: varlist*/
        sysuse auto , clear
        foreach i of varlist p-f {
            di `i'
            di "`i'"
        }

    /*foreach: simple strings*/
        foreach i in foo bar{
            di "`i'"
        }

    /*foreach: local*/
        local mylist foo bar
        foreach i of local mylist {
            di "`i'"
        }
        foreach i of local mylist {
            di `i'
        }

    /*forvalue: simple*/
        forvalue i = 1/5 {
            di "`i'"
        }
        forvalue i = 1(2)9 {
            di "`i'"
        }

    /*nested loof: forvalue and foreach*/
        forvalue i = 7/9 {
            local yr : disp %02.0f  = `i'
            foreach j in foo bar {
                di "`j'`i'"
                di "`j'`yr'"
                di as text "Year == " as result "`yr'"
                }
        }

    /*nested loof: forvalue, foreach, and if*/
    forvalue i = 7/9 {
        foreach j in foo bar {
            if `i' == 7 {
                di "`j'`i'"
            }
            else {
                di "nope"
            }
        }
    }

/*Simple architecture for generate a *.dta file*/
set more off
set maxvar 30000
tempfile tfile
cd // your datapat
clear
    /*list of common variables */
    local varlist00 // your variables
    forvalue i = 7/19 {
        local yr : disp %02.0f  = `x' // if year format is 01 02 03 etc.
        /*list of year varing variables*/
            local varlist `varlist00'
            if `x' >= 8 {
                local varlist `varlist' // add your year varing variables
            }
            if `x' >= 9 & `x' <= 18 {
                local varlist `varlist' // add your year varing variables
            }
            if `x' == 7 | `x' >= 11 {
                local varlist `varlist' // add your year varing variables
            }
        }
        use rawdata/GP`yr'.dta // use your rawfiles
        /*control commons*/
            keep `varlist'
        /*control string|numeric*/
            if ("`x'" == "7") {
                tostring major07, replace force
            }
        /*control missings */
            if ("`x'" == "18" ){
                mvdecode l01618 l04218 l06818 , mv(-1 , 99999)
            }
        /*creating the save file*/
            if ("`x'" == "7") {
                save `tfile', replace
            }
            else {
                append using `tfile'
                save `tfile' , replace
            }
    }
label data "GOMS 07-19"
save goms_eq_raw.dta , replace
