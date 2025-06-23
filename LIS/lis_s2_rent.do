/*호출변수 목록 생성*/
    local datalist fr se kr jp uk us
    /*rent scalars{{{*/
        scalar frrtt1 = .0955954005576132
        scalar frrtt2 = .0673757796727971
        scalar frrtt3 = .106221864674548
        scalar frrtt4 = .076172861566712
        scalar frrtt5 = .0673277554758118
        scalar frrtt6 = .2129530120660742
        scalar frrtt7 = .1152311693293606
        scalar frrtt8 = .1029741403437064
        scalar frrtt9 = .129364465627337
        scalar jprtt1 = .0955954005576132
        scalar jprtt2 = .0673757796727971
        scalar jprtt3 = .106221864674548
        scalar jprtt4 = .076172861566712
        scalar jprtt5 = .0673277554758118
        scalar jprtt6 = .2129530120660742
        scalar jprtt7 = .1152311693293606
        scalar jprtt8 = .1029741403437064
        scalar jprtt9 = .129364465627337
        scalar krrtt1 = .0955954005576132
        scalar krrtt2 = .0673757796727971
        scalar krrtt3 = .106221864674548
        scalar krrtt4 = .076172861566712
        scalar krrtt5 = .0673277554758118
        scalar krrtt6 = .2129530120660742
        scalar krrtt7 = .1152311693293606
        scalar krrtt8 = .1029741403437064
        scalar krrtt9 = .129364465627337
        scalar sertt1 = .0955954005576132
        scalar sertt2 = .0673757796727971
        scalar sertt3 = .106221864674548
        scalar sertt4 = .076172861566712
        scalar sertt5 = .0673277554758118
        scalar sertt6 = .2129530120660742
        scalar sertt7 = .1152311693293606
        scalar sertt8 = .1029741403437064
        scalar sertt9 = .129364465627337
        scalar ukrtt1 = .0955954005576132
        scalar ukrtt2 = .0673757796727971
        scalar ukrtt3 = .106221864674548
        scalar ukrtt4 = .076172861566712
        scalar ukrtt5 = .0673277554758118
        scalar ukrtt6 = .2129530120660742
        scalar ukrtt7 = .1152311693293606
        scalar ukrtt8 = .1029741403437064
        scalar ukrtt9 = .129364465627337
        scalar usrtt1 = .0955954005576132
        scalar usrtt2 = .0673757796727971
        scalar usrtt3 = .106221864674548
        scalar usrtt4 = .076172861566712
        scalar usrtt5 = .0673277554758118
        scalar usrtt6 = .2129530120660742
        scalar usrtt7 = .1152311693293606
        scalar usrtt8 = .1029741403437064
        scalar usrtt9 = .129364465627337
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
