tempfile tfile1

cd  ~/GitHub/master/LIS

    import delimited "s2.csv",       delimiter(",") encoding(ISO-8859-1)clear

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

    /*label define DCGROUP 1  "1분위" 2  "2분위" 3  "3분위" 4  "4분위" 5  "5분위" 6  "6분위" 7  "7분위" 8  "8분위" 9  "9분위" 10 "10분위"*/
    /*label value dcgroup DCGROUP*/

save socialrisk.dta , replace
