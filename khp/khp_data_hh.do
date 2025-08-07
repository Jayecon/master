cd ~/dropbox/data/khp

    tempfile tfile tfile2
    forvalue i = 8/18 {
        local yr : disp %02.0f  = `i'
        local year = 1999 + `i'
        di as text "YEAR == `year'"
        use rawdata1/t`yr'hh , clear
            rename _all , lower
            isid hhid
            gen year = `year'
        if `i' == 8 {
            save `tfile' , replace
        }
        else {
            append using `tfile'
            save `tfile' , replace
        }
    }

    local vset total inc3 inc5
    foreach i of local vset {
        local temp : var label `i'
        local temp `temp'(원)
        gen `i'w = `i' * 10000
        label var `i'w "`temp'"
        mvdecode `i'w , mv(-90000)
    }
    gen mincw = totalw - inc3w - inc5w
        label var mincw "시장소득(원)"

    label var year          "자료년도"
    label var h_medicalexp1 "가구의료비(응급,입원,외래)"
    label var h_medicalexp2 "가구의료비(1+교통+간병)"
    label var h_medicalexp3 "가구의료비(2+산후)"
    label var h_medicalexp4 "가구의료비(3+한약+건기식)"
    label var h_medicalexp5 "가구의료비(4+장기요양)"
    label var total_q5      "총 가구소득5분위"
    label var total_q10     "총 가구소득10분위"
    label var w_total_q5    "총 가구소득5분위(가중치적용)"
    label var w_total_q10   "총 가구소득10분위(가중치적용)"

    save `tfile' , replace

    foreach j in in er ou {
        forvalue i = 8/18 {
            local yr : disp %02.0f  = `i'
            local year = 1999 + `i'
            di as error "DATA: `year' `j'"
            use rawdata1/t`yr'`j' , clear
            rename _all , lower

            if "`j'" == "in" {
                keep hhid pid `j'count `j'9
            }
            else if "`j'" == "er" {
                keep hhid pid `j'count `j'10
            }
            else { 
                keep hhid pid `j'count
            }
            duplicates drop hhid pid , force

            if "`j'" == "in" {
                mvdecode `j'count `j'9 , mv(-1 -9)
                bys hhid : egen `j'tc = total(`j'count)
                bys hhid : egen `j'td = total(`j'9)
                keep hhid `j'tc `j'td
            }
            else if "`j'" == "er" {
                mvdecode `j'count `j'10 , mv(-9)
                bys hhid : egen `j'tc = total(`j'count)
                bys hhid : egen `j'td = total(`j'10)
                keep hhid `j'tc `j'td
            }
            else { 
                mvdecode `j'count , mv(-9)
                bys hhid : egen `j'tc = total(`j'count)
                keep hhid `j'tc
            }
            duplicates drop hhid , force

            gen year = `year'
            if `i' == 8 {
                save `tfile2' , replace
            }
            else {
                append using `tfile2'
                save `tfile2' , replace
            }
            if `i' == 18 {
                merge 1:1 hhid year using `tfile' , nogen
                save `tfile' , replace
            }
        }
    }
    label var ertc "가구 응급실 이용횟수"
    label var ertd "가구 응급실 이용일수"
    label var intc "가구 입원 이용횟수"
    label var intd "가구 입원 이용일수"
    label var outc "가구 외래 이용횟수"

label data "KHP Wave1 Household Data(09-18)"
drop if year == 2008
rename _all , low
compress
save khp.dta , replace

