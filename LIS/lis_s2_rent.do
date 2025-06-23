/*호출변수 목록 생성*/
    local datalist fr se kr jp uk us
    /*rent scalars{{{*/
        scalar frrtt1 = .075872277138972
        scalar frrtt2 = .0505772625631705
        scalar frrtt3 = .0939171342688496
        scalar frrtt4 = .0625146647038751
        scalar frrtt5 = .0506440835628642
        scalar frrtt6 = .1934378254276063
        scalar frrtt7 = .0966367010570528
        scalar frrtt8 = .0845973910437741
        scalar frrtt9 = .1081751823762066
        scalar jprtt1 = .075872277138972
        scalar jprtt2 = .0505772625631705
        scalar jprtt3 = .0939171342688496
        scalar jprtt4 = .0625146647038751
        scalar jprtt5 = .0506440835628642
        scalar jprtt6 = .1934378254276063
        scalar jprtt7 = .0966367010570528
        scalar jprtt8 = .0845973910437741
        scalar jprtt9 = .1081751823762066
        scalar krrtt1 = .075872277138972
        scalar krrtt2 = .0505772625631705
        scalar krrtt3 = .0939171342688496
        scalar krrtt4 = .0625146647038751
        scalar krrtt5 = .0506440835628642
        scalar krrtt6 = .1934378254276063
        scalar krrtt7 = .0966367010570528
        scalar krrtt8 = .0845973910437741
        scalar krrtt9 = .1081751823762066
        scalar sertt1 = .075872277138972
        scalar sertt2 = .0505772625631705
        scalar sertt3 = .0939171342688496
        scalar sertt4 = .0625146647038751
        scalar sertt5 = .0506440835628642
        scalar sertt6 = .1934378254276063
        scalar sertt7 = .0966367010570528
        scalar sertt8 = .0845973910437741
        scalar sertt9 = .1081751823762066
        scalar ukrtt1 = .075872277138972
        scalar ukrtt2 = .0505772625631705
        scalar ukrtt3 = .0939171342688496
        scalar ukrtt4 = .0625146647038751
        scalar ukrtt5 = .0506440835628642
        scalar ukrtt6 = .1934378254276063
        scalar ukrtt7 = .0966367010570528
        scalar ukrtt8 = .0845973910437741
        scalar ukrtt9 = .1081751823762066
        scalar usrtt1 = .075872277138972
        scalar usrtt2 = .0505772625631705
        scalar usrtt3 = .0939171342688496
        scalar usrtt4 = .0625146647038751
        scalar usrtt5 = .0506440835628642
        scalar usrtt6 = .1934378254276063
        scalar usrtt7 = .0966367010570528
        scalar usrtt8 = .0845973910437741
scalar usrt4t9 = .1081751823762066
    /*}}}*/
    foreach k of local datalist {
        qui {
        /*자료호출*/
            use $`k'20h, clear
        /*변수조작*/
            /*변수 생성*/
                gen min     = hitotal - hpublic
                gen pwgt    = hpopwgt * nhhmem
                gen nhhmem1864 = nhhmem - nhhmem65 - nhhmem17
            /*변수 생성 : 균등화 소득*/
                gen ehhmen    = sqrt(nhhmem)
                gen emin      = min / ehhmen
            /*변수생성 : 가구유형*/
                capture drop hhtype
                gen hhtype = .
                replace hhtype = 1 if nhhmem == 1 & nhhmem65 == 1 // 노인 1인
                replace hhtype = 2 if nhhmem >= 2 & nhhmem == nhhmem65 // 노인만 2인 이상
                replace hhtype = 3 if nhhmem == 1 & nhhmem1864 == 1 // 근로연령 1인
                replace hhtype = 4 if nhhmem == 2 & nhhmem1864 == 2 //근로연령만 2인 
                replace hhtype = 5 if missing(hhtype) & ((nhhmem65 + nhhmem1864) >= 1 & nhhmem17 == 0) 
                    // 노인+ 근로연령(아동없음). missing 안걸면 1-4 유형 가구를 덮어씀.
                replace hhtype = 6 if (nhhmem65 >=1 & nhhmem1864 == 0 & nhhmem17 >= 1) | (nhhmem65 == 0 & nhhmem1864 == 1 & nhhmem17 >= 1) 
                    // 조손가구 또는 한부모가구 : 정의가 튄다.
                replace hhtype = 7 if nhhmem65 == 0 & nhhmem1864 == 2 & nhhmem17 >= 1 // 근로연령 2인 + 아동
                replace hhtype = 8 if nhhmem1864 >= 3 // 근로연령 3인 이상 + 아동(노인 무관)
                replace hhtype = 9 if missing(hhtype) //기타
            /*변수 생성 : 가중 분위수 집단*/
                xtile dcgroup = emin [aw=hpopwgt], nq(10)
        /*중위소득 계산 (weighted median)*/
            _pctile emin [aw=hpopwgt], p(50)
            scalar p50 = r(r1)
        /*빈곤위험도 할당 (수치는 예시)*/
            gen rent = .
                replace rent = `k'rtt1 if hhtype==1
                replace rent = `k'rtt2 if hhtype==2
                replace rent = `k'rtt3 if hhtype==3
                replace rent = `k'rtt4 if hhtype==4
                replace rent = `k'rtt5 if hhtype==5
                replace rent = `k'rtt6 if hhtype==6
                replace rent = `k'rtt7 if hhtype==7
                replace rent = `k'rtt8 if hhtype==8
                replace rent = `k'rtt9 if hhtype==9
        /*소득분위별 빈곤위험도 평rt계산*/
            forvalue i = 1/10 {
                summarize rent [aw=hpopwgt] if dcgroup == `i' , meanonly
                local rentd`i' = r(mean)
            }
        }
        /*결과 출력*/
            /*국가명 년도*/
                local cname = cname[1]
                local iso2 = iso2[1]
                local iso3 = iso3[1]
            if "`k'" == "fr" {
                di as text "cname,iso2,iso3,dcgroup,rent"
            }
            forvalue i = 1/10 {
                di as text "`cname',`iso2',`iso3',`i',`rentd`i''"
            }
    }
