cd ~/dropbox/data/khp
tempfile tfile tfile2
/*Wave 1*/
/*가구레벨{{{*/
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
    gen minc    = total  - inc3 - inc5
        label var minc    "시장소득(만원)"
    gen eminc   = minc   / sqrt(b1)
        label var eminc   "균등화 시장소득(만원)"
    gen eminc1  = minc   - mexp1
        label var eminc1  "균등화 시장소득(만원,mexp1 차감)"
    gen eminc5  = minc   - mexp5
        label var eminc5  "균등화 시장소득(만원,mexp5 차감)"
    gen etotal  = total  / sqrt(b1)
        label var etotal  "균등화 총소득(만원)"
    gen etotal1 = etotal - mexp1
        label var etotal1 "균등화 총소득(만원,mexp1 차감)"
    gen etotal5 = etotal - mexp5
        label var etotal5 "균등화 총소득(만원,mexp5 차감)"
    gen wgt     = h_wgc
        replace wgt = h_wgc_tot if missing(wgt)
        label var wgt     "가구가중치(년도별 횡단)"
    recode p (11 41 = 1) (26/36 =2) (42/99 =3) , gen(p9)
        label var p9      "지역구분"
        label define P9 1 "수도권" 2 "광역시" 3 "도"
        label value p9 P9

    label var mexp1         "가구의료비(응급,입원,외래;만원)"
    label var mexp2         "가구의료비(1+교통+간병;만원)"
    label var mexp3         "가구의료비(2+산후;만원)"
    label var mexp4         "가구의료비(3+한약+건기식;만원)"
    label var mexp5         "가구의료비(4+장기요양;만원)"
    label var h_medicalexp1 "가구의료비(응급,입원,외래;원)"
    label var h_medicalexp2 "가구의료비(1+교통+간병;원)"
    label var h_medicalexp3 "가구의료비(2+산후;원)"
    label var h_medicalexp4 "가구의료비(3+한약+건기식;원)"
    label var h_medicalexp5 "가구의료비(4+장기요양;원)"
    label var total_q5      "총 가구소득5분위"
    label var total_q10     "총 가구소득10분위"
    label var w_total_q5    "총 가구소득5분위(가중치적용)"
    label var w_total_q10   "총 가구소득10분위(가중치적용)"
    label define P2 1 "동부" 2 "읍면부"
        label value p2 P2
    label define P 11 "서울특별시" 26 "부산광역시" 27 "대구광역시" 28 "인천광역시" ///
        29 "광주광역시" 30 "대전광역시" 31 "울산광역시" 36 "세종시" 41 "경기도" ///
        42 "강원도" 43 "충청북도" 44 "충청남도" 45 "전라북도" 46 "전라남도" ///
        47 "경상북도" 48 "경상남도" 50 "제주도"
        label value p P

    save `tfile' , replace
/*}}}*/
/*개인레벨{{{*/
    forvalue i = 8/18 {
        local yr : disp %02.0f  = `i'
        local year = 1999 + `i'
        di as error "DATA: `year' "
        use rawdata1/t`yr'ind , clear
        rename _all , lower

        if `i' == 8 {
            keep hhid pid c2 c3 c4_0 c8 c9 c27 c28     c33
            mvdecode c4_0 c9 c27 c28 c33 , mv(-1 -6 -9)
        }
        else {
            keep hhid pid c2 c3 c4_0 c8 c9 c27 c28 c32 c33
            mvdecode c4_0 c9 c27 c28 c32 c33 , mv(-1 -6 -9)
        }
        keep if c2 == 10
        drop c2 pid
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
    label define C3 1 "남" 2 "여"
        label value c3 C3
    label define C8 1 "미취학(만7세이하)" 2 "무학(문자해독불가)" 3 "무학(문자해독가능)" ///
        11 "초등학교 1학년" 12 "초등학교 2학년" 13 "초등학교 3학년" ///
        14 "초등학교 4학년" 15 "초등학교 5학년" 16 "초등학교 6학년" 21 "중학교 1학년" ///
        22 "중학교 2학년" 23 "중학교 3학년" 31 "고등학교 1학년" 32 "고등학교 2학년" ///
        33 "고등학교 3학년" 41 "대학교1학년" 42 "대학교2학년" 43 "대학교3학년" 44 "대학교4학년" ///
        45 "대학교5학년" 46 "대학교6학년" 51 "대학원 석사" 52 "대학원 박사"
        label value c8 C8
    label define C9 1 "졸업" 2 "재학중" 3 "휴학중" 4 "수료" 5 "중퇴" 6 "검정고시 자격취득 "
        label value c9 C9
    label define C27 1 "농임업" 2 "어업" 3 "광업" 4 "제조업" 5 "전기, 가스, 수도업" 6 "건설업" 7 "도소매업" ///
        8 "숙박/음식점업" 9 "운수업" 10 "통신업" 11 "금융·보험업" 12 "부동산·임대업" 13 "사업서비스업" ///
        14 "공공행정·국방, 사회보장행정서비스업" 15 "교육서비스업" 16 "보건 및 사회복지사업" ///
        17 "오락·문화·운동관련서비스" 18 "기타공공·수리, 개인서비스" 19 "가사서비스업" ///
        20 "국제 및 외국기관" 21 "분류 불능직"
        label value c27 C27
    label define C28 1 "군인" 11 "공공 및 기업 고위직" 12 "행정 및 경영지원 관리직" 13 "전문서비스 관리직" ///
        14 "건설·전기 및 생산 관련 관리직" 15 "판매 및 고객서비스 관리직" 21 "과학 전문가 및 관련직" ///
        22 "정보통신 전문가 및 기술직" 23 "공학 전문가 및 기술직" 24 "보건·사회복지 및 종교 관련직" ///
        25 "교육 전문가 및 관련직" 26 "법률 및 행정 전문직" 27 "경영·금융 전문가 및 관련직" ///
        28 "문화·예술·스포츠 전문가 및 관련직" 31 "경영 및 회계 관련 사무직" 32 "금융 및 보험 사무직" ///
        33 "법률 및 감사 사무직" 39 "상담·안내·통계 및 기타 사무직" 41 "경찰·소방 및 보안 관련 서비스직" ///
        42 "이미용·예식 및 의료보조 서비스직" 43 "운송 및 여가 서비스직" 44 "조리 및 음식 서비스직" ///
        51 "영업직" 52 "매장 판매직" 53 "방문·노점 및 통신 판매 관련직" 61 "농·축산 숙련직" 62 "임업 숙련직" ///
        63 "어업 숙련직" 71 "식품가공관련 기능직" 72 "섬유·의복 및 가죽 관련 기능직" ///
        73 "목재·가구·악기 및 간판 관련 기능직" 74 "금속성형관련 기능직" 75 "운송 및 기계 관련 기능직" ///
        76 "전기 및 전자 관련 기능직" 77 "건설 및 채굴 관련 기능직" 78 "영상 및 통신 장비 관련 기능직" ///
        79 "기타 기능 관련직" 80 "상·하수도 및 재활용 처리관련 기계조작직" 81 "식품가공관련 기계조작직" ///
        82 "섬유 및 신발 관련 기계조작직" 83 "화학관련 기계조작직" 84 "금속 및 비금속 관련 기계조작직" ///
        85 "기계제조 및 관련 기계조작직" 86 "전기 및 전자 관련 기계조작직" 87 "운전 및 운송 관련직" ///
        89 "목재·인쇄 및 기타 기계조작직" 91 "건설 및 광업 관련 단순노무직" 92 "운송관련 단순노무직" ///
        93 "제조관련 단순노무직" 94 "청소 및 경비 관련 단순노무직" 95 "가사·음식 및 판매 관련 단순노무직" ///
        99 "농림어업 및 기타 서비스 단순노무직"
        label value c28 C28
    label define C32 0 "자영업자" 1 "1~4명" 2 "5~9명" 3 "10~29명" 4 "30~49명" 5 "50~69명" 6 "70~99명" ///
        7 "100~299명" 8 "300~499명" 9 "500~999명" 10 "1,000명이상"
        label value c32 C32
    label define C33 0 "정규직" 1 "상용직" 2 "임시직" 3 "일용직" 4 "자활근로, 공공근로, 노인일자리" ///
        5 "자영업자" 6 "무급가족종사자" 7 "고용주"
        label value c33 C33
/*}}}*/
/*이벤트레벨{{{*/
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
    label var ertc          "가구 응급실 이용횟수"
    label var ertd          "가구 응급실 이용일수"
    label var intc          "가구 입원 이용횟수"
    label var intd          "가구 입원 이용일수"
    label var outc          "가구 외래 이용횟수"
/*}}}*/
/*후처리{{{*/
    label data     "KHP Wave1 Household Data(08-17)"
    label var year "자료년도"
    recode c4_0 (1900/1939 = 1) (1940/1949 =2) (1950/1959 =3) (1960/1969 =4) (1970/2999 =5)  , gen(c4)
        label var c4 "연령집단"
        label define C4 1 "1939년 이전 출생" 2 "1940년대 출생" 3 "1950년대 출생" ///
            4 "1960년대 출생" 5 "1970년 이후 출생"
        label value c4 C4
    gen data = 1
        label defien DATA 1 "Wave 1" 2 "Wave 2"
        label value data DATA
        label var data "자료 wave"
    drop if year == 2007
    rename _all , low
    compress
/*}}}*/

/*Wave 2*/
/*가구레벨{{{*/
    foreach i in a b c   {
        use rawdata2/`i'_hh , clear
            rename _all , lower
            isid hhid
            gen year = data_y - 1
        if "`i'" == "a" {
            save `tfile' , replace
        }
        else {
            append using `tfile'
            save `tfile' , replace
        }
    }

    rename region1 p
    rename region2 p2
    rename h_inc_tot total
    rename ??? inc3
    rename ??? inc5
    rename h_oop ???

    forvalue i = 1/5 {
        gen mexp`i' = h_medicalexp`i' / 10000
    }
    local vset total inc3 inc5
    foreach i of local vset {
        mvdecode `i' , mv(-9)
    }
    gen minc    = total  - inc3 - inc5
        label var minc    "시장소득(만원)"
    gen eminc   = minc   / sqrt(b1)
        label var eminc   "균등화 시장소득(만원)"
    gen eminc1  = minc   - mexp1
        label var eminc1  "균등화 시장소득(만원,mexp1 차감)"
    gen eminc5  = minc   - mexp5
        label var eminc5  "균등화 시장소득(만원,mexp5 차감)"
    gen etotal  = total  / sqrt(b1)
        label var etotal  "균등화 총소득(만원)"
    gen etotal1 = etotal - mexp1
        label var etotal1 "균등화 총소득(만원,mexp1 차감)"
    gen etotal5 = etotal - mexp5
        label var etotal5 "균등화 총소득(만원,mexp5 차감)"
    gen wgt     = h_wgc
        replace wgt = h_wgc_tot if missing(wgt)
        label var wgt     "가구가중치(년도별 횡단)"
    recode p (11 41 = 1) (26/36 =2) (42/99 =3) , gen(p9)
        label var p9      "지역구분"
        label define P9 1 "수도권" 2 "광역시" 3 "도"
        label value p9 P9

    label var mexp1         "가구의료비(응급,입원,외래;만원)"
    label var mexp2         "가구의료비(1+교통+간병;만원)"
    label var mexp3         "가구의료비(2+산후;만원)"
    label var mexp4         "가구의료비(3+한약+건기식;만원)"
    label var mexp5         "가구의료비(4+장기요양;만원)"
    label var h_medicalexp1 "가구의료비(응급,입원,외래;원)"
    label var h_medicalexp2 "가구의료비(1+교통+간병;원)"
    label var h_medicalexp3 "가구의료비(2+산후;원)"
    label var h_medicalexp4 "가구의료비(3+한약+건기식;원)"
    label var h_medicalexp5 "가구의료비(4+장기요양;원)"
    label var total_q5      "총 가구소득5분위"
    label var total_q10     "총 가구소득10분위"
    label var w_total_q5    "총 가구소득5분위(가중치적용)"
    label var w_total_q10   "총 가구소득10분위(가중치적용)"
    label define P2 1 "동부" 2 "읍면부"
        label value p2 P2
    label define P 11 "서울특별시" 26 "부산광역시" 27 "대구광역시" 28 "인천광역시" ///
        29 "광주광역시" 30 "대전광역시" 31 "울산광역시" 36 "세종시" 41 "경기도" ///
        42 "강원도" 43 "충청북도" 44 "충청남도" 45 "전라북도" 46 "전라남도" ///
        47 "경상북도" 48 "경상남도" 50 "제주도"
        label value p P

    save `tfile' , replace
/*}}}*/
/*개인레벨{{{*/
    foreach i in a b c   {
        use rawdata2/`i'_ind , clear
        rename _all , lower

        if `i' == 8 {
            keep hhid pid c2 c3 c4_0 c8 c9 c27 c28     c33
            mvdecode c4_0 c9 c27 c28 c33 , mv(-1 -6 -9)
        }
        else {
            keep hhid pid c2 c3 c4_0 c8 c9 c27 c28 c32 c33
            mvdecode c4_0 c9 c27 c28 c32 c33 , mv(-1 -6 -9)
        }
        keep if c2 == 10
        drop c2 pid
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
    label define C3 1 "남" 2 "여"
        label value c3 C3
    label define C8 1 "미취학(만7세이하)" 2 "무학(문자해독불가)" 3 "무학(문자해독가능)" ///
        11 "초등학교 1학년" 12 "초등학교 2학년" 13 "초등학교 3학년" ///
        14 "초등학교 4학년" 15 "초등학교 5학년" 16 "초등학교 6학년" 21 "중학교 1학년" ///
        22 "중학교 2학년" 23 "중학교 3학년" 31 "고등학교 1학년" 32 "고등학교 2학년" ///
        33 "고등학교 3학년" 41 "대학교1학년" 42 "대학교2학년" 43 "대학교3학년" 44 "대학교4학년" ///
        45 "대학교5학년" 46 "대학교6학년" 51 "대학원 석사" 52 "대학원 박사"
        label value c8 C8
    label define C9 1 "졸업" 2 "재학중" 3 "휴학중" 4 "수료" 5 "중퇴" 6 "검정고시 자격취득 "
        label value c9 C9
    label define C27 1 "농임업" 2 "어업" 3 "광업" 4 "제조업" 5 "전기, 가스, 수도업" 6 "건설업" 7 "도소매업" ///
        8 "숙박/음식점업" 9 "운수업" 10 "통신업" 11 "금융·보험업" 12 "부동산·임대업" 13 "사업서비스업" ///
        14 "공공행정·국방, 사회보장행정서비스업" 15 "교육서비스업" 16 "보건 및 사회복지사업" ///
        17 "오락·문화·운동관련서비스" 18 "기타공공·수리, 개인서비스" 19 "가사서비스업" ///
        20 "국제 및 외국기관" 21 "분류 불능직"
        label value c27 C27
    label define C28 1 "군인" 11 "공공 및 기업 고위직" 12 "행정 및 경영지원 관리직" 13 "전문서비스 관리직" ///
        14 "건설·전기 및 생산 관련 관리직" 15 "판매 및 고객서비스 관리직" 21 "과학 전문가 및 관련직" ///
        22 "정보통신 전문가 및 기술직" 23 "공학 전문가 및 기술직" 24 "보건·사회복지 및 종교 관련직" ///
        25 "교육 전문가 및 관련직" 26 "법률 및 행정 전문직" 27 "경영·금융 전문가 및 관련직" ///
        28 "문화·예술·스포츠 전문가 및 관련직" 31 "경영 및 회계 관련 사무직" 32 "금융 및 보험 사무직" ///
        33 "법률 및 감사 사무직" 39 "상담·안내·통계 및 기타 사무직" 41 "경찰·소방 및 보안 관련 서비스직" ///
        42 "이미용·예식 및 의료보조 서비스직" 43 "운송 및 여가 서비스직" 44 "조리 및 음식 서비스직" ///
        51 "영업직" 52 "매장 판매직" 53 "방문·노점 및 통신 판매 관련직" 61 "농·축산 숙련직" 62 "임업 숙련직" ///
        63 "어업 숙련직" 71 "식품가공관련 기능직" 72 "섬유·의복 및 가죽 관련 기능직" ///
        73 "목재·가구·악기 및 간판 관련 기능직" 74 "금속성형관련 기능직" 75 "운송 및 기계 관련 기능직" ///
        76 "전기 및 전자 관련 기능직" 77 "건설 및 채굴 관련 기능직" 78 "영상 및 통신 장비 관련 기능직" ///
        79 "기타 기능 관련직" 80 "상·하수도 및 재활용 처리관련 기계조작직" 81 "식품가공관련 기계조작직" ///
        82 "섬유 및 신발 관련 기계조작직" 83 "화학관련 기계조작직" 84 "금속 및 비금속 관련 기계조작직" ///
        85 "기계제조 및 관련 기계조작직" 86 "전기 및 전자 관련 기계조작직" 87 "운전 및 운송 관련직" ///
        89 "목재·인쇄 및 기타 기계조작직" 91 "건설 및 광업 관련 단순노무직" 92 "운송관련 단순노무직" ///
        93 "제조관련 단순노무직" 94 "청소 및 경비 관련 단순노무직" 95 "가사·음식 및 판매 관련 단순노무직" ///
        99 "농림어업 및 기타 서비스 단순노무직"
        label value c28 C28
    label define C32 0 "자영업자" 1 "1~4명" 2 "5~9명" 3 "10~29명" 4 "30~49명" 5 "50~69명" 6 "70~99명" ///
        7 "100~299명" 8 "300~499명" 9 "500~999명" 10 "1,000명이상"
        label value c32 C32
    label define C33 0 "정규직" 1 "상용직" 2 "임시직" 3 "일용직" 4 "자활근로, 공공근로, 노인일자리" ///
        5 "자영업자" 6 "무급가족종사자" 7 "고용주"
        label value c33 C33
/*}}}*/
/*이벤트레벨{{{*/
    foreach j in ms ind {
        foreach i in a b c   {
            use rawdata2/`i'_`j' , clear
            rename _all , lower

            if "`j'" == "ms" {
                keep hhid pid `j'count `j'9
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
    label var ertc          "가구 응급실 이용횟수"
    label var ertd          "가구 응급실 이용일수"
    label var intc          "가구 입원 이용횟수"
    label var intd          "가구 입원 이용일수"
    label var outc          "가구 외래 이용횟수"
/*}}}*/
/*후처리{{{*/
    label data     "KHP Wave1 Household Data(08-17)"
    label var year "자료년도"
    recode c4_0 (1900/1939 = 1) (1940/1949 =2) (1950/1959 =3) (1960/1969 =4) (1970/2999 =5)  , gen(c4)
        label var c4 "연령집단"
        label define C4 1 "1939년 이전 출생" 2 "1940년대 출생" 3 "1950년대 출생" ///
            4 "1960년대 출생" 5 "1970년 이후 출생"
        label value c4 C4
    gen data = 1
        label defien DATA 1 "Wave 1" 2 "Wave 2"
        label value data DATA
        label var data "자료 wave"
    drop if year == 2007
    rename _all , low
    compress
/*}}}*/
save khp.dta , replace
