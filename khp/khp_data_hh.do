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

    forvalue i = 1/5 {
        gen mexp`i' = h_medicalexp`i' / 10000
    }
    local vset total inc3 inc5
    foreach i of local vset {
        mvdecode `i' , mv(-9)
    }
    gen minc = total - inc3 - inc5
        label var minc "시장소득(만원)"
    gen wgt = h_wgc
        replace wgt = h_wgc_tot if missing(wgt)
        label var wgt "가구가중치(년도별 횡단)"

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
    label var year "자료년도"
    label var mexp1 "가구의료비(응급,입원,외래;만원)"
    label var mexp2 "가구의료비(1+교통+간병;만원)"
    label var mexp3 "가구의료비(2+산후;만원)"
    label var mexp4 "가구의료비(3+한약+건기식;만원)"
    label var mexp5 "가구의료비(4+장기요양;만원)"
    label var h_medicalexp1 "가구의료비(응급,입원,외래;원)"
    label var h_medicalexp2 "가구의료비(1+교통+간병;원)"
    label var h_medicalexp3 "가구의료비(2+산후;원)"
    label var h_medicalexp4 "가구의료비(3+한약+건기식;원)"
    label var h_medicalexp5 "가구의료비(4+장기요양;원)"
    label var total_q5      "총 가구소득5분위"
    label var total_q10     "총 가구소득10분위"
    label var w_total_q5    "총 가구소득5분위(가중치적용)"
    label var w_total_q10   "총 가구소득10분위(가중치적용)"
    label define P 11 "서울특별시" 26 "부산광역시" 27 "대구광역시" 28 "인천광역시" ///
        28 "광주광역시" 30 "대전광역시" 31 "울산광역시" 36 "세종시" 41 "경기도" ///
        42 "강원도" 43 "충청북도" 44 "충청남도" 45 "전라북도" 46 "전라남도" ///
        47 "경상북도" 48 "경상남도" 50 "제주도"
    label value p P
    label define P1 1 "동부" 2 "읍면부"
    label value p2 P2

label data "KHP Wave1 Household Data(09-18)"
drop if year == 2007
rename _all , low
compress
save khp.dta , replace
