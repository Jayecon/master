/*호출변수 목록 생성*/
    local datalist fr se kr jp uk us
    /*rent scalars{{{*/
        scalar frcaret1 = 1
        scalar frcaret2 = 1
        scalar frcaret3 = 0
        scalar frcaret4 = 0
        scalar frcaret5 = .4993387881134237
        scalar frcaret6 = .1565525475224214
        scalar frcaret7 = .1762034461966583
        scalar frcaret8 = .062470450831045
        scalar frcaret9 = .3444701289491994
        scalar jpcaret1 = 1
        scalar jpcaret2 = 1
        scalar jpcaret3 = 0
        scalar jpcaret4 = 0
        scalar jpcaret5 = .4993387881134237
        scalar jpcaret6 = .1565525475224214
        scalar jpcaret7 = .1762034461966583
        scalar jpcaret8 = .062470450831045
        scalar jpcaret9 = .3444701289491994
        scalar krcaret1 = 1
        scalar krcaret2 = 1
        scalar krcaret3 = 0
        scalar krcaret4 = 0
        scalar krcaret5 = .4993387881134237
        scalar krcaret6 = .1565525475224214
        scalar krcaret7 = .1762034461966583
        scalar krcaret8 = .062470450831045
        scalar krcaret9 = .3444701289491994
        scalar secaret1 = 1
        scalar secaret2 = 1
        scalar secaret3 = 0
        scalar secaret4 = 0
        scalar secaret5 = .4993387881134237
        scalar secaret6 = .1565525475224214
        scalar secaret7 = .1762034461966583
        scalar secaret8 = .062470450831045
        scalar secaret9 = .3444701289491994
        scalar ukcaret1 = 1
        scalar ukcaret2 = 1
        scalar ukcaret3 = 0
        scalar ukcaret4 = 0
        scalar ukcaret5 = .4993387881134237
        scalar ukcaret6 = .1565525475224214
        scalar ukcaret7 = .1762034461966583
        scalar ukcaret8 = .062470450831045
        scalar ukcaret9 = .3444701289491994
        scalar uscaret1 = 1
        scalar uscaret2 = 1
        scalar uscaret3 = 0
        scalar uscaret4 = 0
        scalar uscaret5 = .4993387881134237
        scalar uscaret6 = .1565525475224214
        scalar uscaret7 = .1762034461966583
        scalar uscaret8 = .062470450831045
        scalar uscaret9 = .3444701289491994
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
            gen care = .
                replace care = `k'caret1 if hhtype==1
                replace care = `k'caret2 if hhtype==2
                replace care = `k'caret3 if hhtype==3
                replace care = `k'caret4 if hhtype==4
                replace care = `k'caret5 if hhtype==5
                replace care = `k'caret6 if hhtype==6
                replace care = `k'caret7 if hhtype==7
                replace care = `k'caret8 if hhtype==8
                replace care = `k'caret9 if hhtype==9
        /*소득분위별 빈곤위험도 평rt계산*/
            forvalue i = 1/10 {
                summarize care [aw=hpopwgt] if dcgroup == `i' , meanonly
                local cared`i' = r(mean)
            }
        }
        /*결과 출력*/
            /*국가명 년도*/
                local cname = cname[1]
                local iso2 = iso2[1]
                local iso3 = iso3[1]
            if "`k'" == "fr" {
                di as text "cname,iso2,iso3,dcgroup,care"
            }
            forvalue i = 1/10 {
                di as text "`cname',`iso2',`iso3',`i',`cared`i''"
            }
    }
