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

local vset TOTAL INC3 INC5

foreach i of local vset {
    local temp : var label `i'
    local temp `temp'(원)
    gen `i'W = `i' * 10000
    label var `i'W "`temp'"
    mvdecode `i'W , mv(-90000)
}

gen MINCW = TOTALW - INC3W - INC5W
    label var MINCW "시장소득(원)"

label var YEAR          "조사년도"
label var H_MEDICALEXP1 "가구의료비(응급,입원,외래)"
label var H_MEDICALEXP2 "가구의료비(1+교통+간병)"
label var H_MEDICALEXP3 "가구의료비(2+산후)"
label var H_MEDICALEXP4 "가구의료비(3+한약+건기식)"
label var H_MEDICALEXP5 "가구의료비(4+장기요양)"
label var TOTAL_Q5      "총 가구소득5분위"
label var TOTAL_Q10     "총 가구소득10분위"
label var W_TOTAL_Q5    "총 가구소득5분위(가중치적용)"
label var W_TOTAL_Q10   "총 가구소득10분위(가중치적용)"

label data "KHP Wave1 Household Data(09-18)"
drop if YEAR == 2008
rename _all , low
compress
save khp_hh.dta , replace
