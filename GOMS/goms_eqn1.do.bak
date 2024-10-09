set more off
set maxvar 30000
tempfile tfile
cd ~/dropbox/data/goms
clear
    /*list of common variables */
    local varlist00 ///
        pid age birthy sex province graduy gradum majorcat major wt                 ///
        a001-a002 a003 a004_10-a006_10 a007a_2018-a009_2018 a010 a011 a012 a014     ///
            a020 a021 a022 a023 a024 a116-a118 a120-a122 a142-a144                  ///
        d001-d006 d110-d112 e001-e006 e078-e081 e153-e156                           ///
        f001-f002 f006-f009 f010-f012 f073-f074 f101 f102 f104 f108 f112 f116 f120  ///
        h001 h002 h020 h040 h060                                                    ///
        l001 l003 m001 m002                                                         ///
        p014 p026-p031z p032-p033 p034 p035 p045
    /*loop*/
        forvalue x = 7/19 {
            local yr : disp %02.0f  = `x'
            di as text "Year == " as result "`yr'"
            /*list of year varing variables {{{*/
                local varlist `varlist00'
                /*employment program*/
                    if `x' >= 8 {
                        local varlist `varlist' f036-f041
                    }
                    if `x' >= 8 {
                        local varlist `varlist' l016 l042 l068
                    }
                    if `x' >= 9 {
                        local varlist `varlist' l030 l056 l082
                    }
                /*within familty transfer*/
                    if `x' >= 9 & `x' <= 18 {
                        local varlist `varlist' p041-p044
                    }
                /*working exp on the univ*/
                    if `x' == 7 | `x' >= 11 {
                        local varlist `varlist' h006-h009 h026-h029 h046-h049
                    }
                /*tuition funding*/
                    if `x' >= 7 & `x' <= 10 {
                        local varlist `varlist' f078
                    }
                    else {
                        local varlist `varlist' f079-f085
                    }
                /*4sure YN*/
                    if `x' >= 7 & `x' <= 10 {
                        local varlist `varlist' a157-a165
                    }
                    else {
                        local varlist `varlist' a158-a165
                    }
                /*어학연수횟수*/
                    if (`x' != 9) {
                        local varlist `varlist' i002
                    }
                /*영어 및 기타 외국어 시험 응시여부*/
                    if ( `x' >= 16 | `x' <= 12) {
                        local varlist `varlist' i018
                    }
                    else {
                        local varlist `varlist' i019
                    }
            /*}}}*/
            use rawdata/GP`yr'.dta
            /*control commons*/
                rename g`yr'1* *
                    drop if missing(sex)
                    keep `varlist'
                    rename * *`yr'
                gen year = `x' +2000
                    label var year "조사년도"
                gen wave = `x' - 6
                    label var wave "조사회차(07==1)"
            /*control excpetions{{{*/
                /*control string|numeric*/
                    if ("`x'" == "7") {
                        tostring major07, replace force
                    }
                    if ("`x'" == "18" ){
                        destring m00218 l01618 l04218 l06818, replace
                    }
                    if ("`x'" == "19" ){
                        destring l01619 l04219 l06819, replace
                    }
                /*control missings */
                    if ("`x'" == "18" ){
                        mvdecode l01618 l04218 l06818 , mv(-1 , 99999)
                    }
                    if ("`x'" == "19" ){
                        mvdecode l01619 l04219 l06819 , mv(-1 , 99999)
                    }
                    mvdecode _all , mv(-1, -3)
            /*}}}*/
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
