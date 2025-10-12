cd  ~/GitHub/master/LIS
    import delimited "s2.csv",       delimiter(",") encoding(ISO-8859-1)clear

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
        label data "사회적 위험 from LIS"
        label var abhlth  "모두나쁜건강"
        label var aisolt  "모두사회적고립"
        label var anoemp  "모두미취업"
        label var aptjob  "모두비자발적임시직"
        label var aunemp  "모두실업"
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
        label var pv5   "빈곤위험:중위소득50%"
        label var pv6   "빈곤위험:중위소득60%"
        label var xbhlth  "나쁜건강존재"
        label var xisolt  "사회적고립존재"
        label var xnoemp  "미취업존재"
        label var xptjob  "비자발적임시직존재"
        label var xunemp  "실업존재"
        label var rent    "주거위험"
        label var care    "돌봄위험"
        sort cname  grcat  group
        forvalue i = 1/660 {
            foreach j of varlist xunemp-abhlth {
                replace `j' = `j'[_n-1] if missing(`j') in `i'
            }
        }
save sr.dta , replace

use sr if dcvalue
    sort iso2 group
    foreach i of local vset {
        bys iso2 : egen t1`i' = total(`i')
        gen t2`i' = `i'/t1`i'
        bys iso2 : gen c`i' = sum(t2`i')
    }
    drop t1* dcvalue pcvalue grcat
    rename t2* r*

    order cname iso2 group pv5 rpv5 cpv5 pv6 rpv6 cpv6 aunemp raunemp caunemp anoemp ranoemp canoemp aptjob raptjob captjob abhlth rabhlth cabhlth care rcare ccare aisolt raisolt caisolt , first
    drop xunemp-cxunemp

    foreach i of varlist pv5-caisolt {
        replace `i' = `i' * 100
        format `i' %3.1f
    }
save srcum.dta , replace
