cd  ~/GitHub/master/LIS
    import delimited "s4.csv",       delimiter(",") encoding(ISO-8859-1)clear

    tempfile tfile1
    preserve
    local itr = 1
    levelsof name , local(vset)
    foreach i of local vset {
        keep if name == "`i'"
        rename value `i'
        if `itr' == 1 {
            save `tfile1'
        }
        else {
            merge 1:1 cname grcat group using `tfile1' , nogen
            save `tfile1' , replace
        }
        restore , preserve
        local ++itr
    }

    use `tfile1' , clear
        drop name
        label data "순수혜 from LIS"
        label var cname   "국가명(영문)"
        label var group   "분위 집단"
        label var grcat  "분위 유형"
            label define GRCAT 1 "10분위" 2 "100분위"
            label value grcat GRCAT
            gen dcvalue = grcat == 1
            label var dcvalue "10분위수치"
            gen pcvalue = grcat == 2
            label var pcvalue "100분위수치"
        label var iso2    "국가명(iso2)"
        label var tax "조세"
        label var sct "사회보험료"
        label var min "시장소득"
        label var bnf "수혜"
        label var bdn "부담"
        label var bfn "순수혜"
        label var bf0 "순수혜(음수==0)"
        sort cname  grcat  group
        forvalue i = 1/660 {
            foreach j of varlist tax-bf0 {
                replace `j' = `j'[_n-1] if missing(`j') in `i'
            }
        }
save bf.dta , replace

use bf if dcvalue
    sort iso2 group
    foreach i of local vset {
        bys iso2 : egen t1`i' = total(`i')
        gen t2`i' = `i'/t1`i'
        bys iso2 : gen c`i' = sum(t2`i')
    }
    drop t1* dcvalue pcvalue grcat
    rename t2* r*

    order cname iso2 group min bnf tax sct bdn rmin cmin rbnf cbnf rtax ctax rsct csct rbdn cbdn bfn rbfn cbfn bf0 rbf0 cbf0 , first

    foreach i of varlist min-cbf0 {
        replace `i' = `i' * 100
        format `i' %13.1f
    }
save bfcum.dta , replace
