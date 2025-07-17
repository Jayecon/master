/*호출변수 목록 생성*/
    local datalist fr se kr jp uk us
    /*care scalars{{{*/
        scalar frcaret1 = 1
        scalar frcaret2 = 1
        scalar frcaret3 = .4611448287963867
        scalar frcaret4 = .4550919115543365
        scalar frcaret5 = .5561168223619462
        scalar frcaret6 = .6233498275279998
        scalar frcaret7 = .6178294807672501
        scalar frcaret8 = .5213052481412888
        scalar frcaret9 = .6967645972967148
        scalar jpcaret1 = 1
        scalar jpcaret2 = 1
        scalar jpcaret3 = .0066880993545055
        scalar jpcaret4 = .0059683538973331
        scalar jpcaret5 = .2723953694105148
        scalar jpcaret6 = .0783497218042612
        scalar jpcaret7 = .1422820642590523
        scalar jpcaret8 = .1521899148821831
        scalar jpcaret9 = .3696594178676605
        scalar krcaret1 = 1
        scalar krcaret2 = 1
        scalar krcaret3 = .0433342730005582
        scalar krcaret4 = .0295297553141912
        scalar krcaret5 = .1547366008162498
        scalar krcaret6 = .1498523118595282
        scalar krcaret7 = .1610824689269066
        scalar krcaret8 = .0900116475919883
        scalar krcaret9 = .3411561697721481
        scalar secaret1 = 1
        scalar secaret2 = 1
        scalar secaret3 = 0
        scalar secaret4 = 0
        scalar secaret5 = .165203632414341
        scalar secaret6 = .1507546432316303
        scalar secaret7 = .1931678116321564
        scalar secaret8 = .0351481642574072
        scalar secaret9 = .2967714369297028
        scalar ukcaret1 = 1
        scalar ukcaret2 = 1
        scalar ukcaret3 = .2100686281919479
        scalar ukcaret4 = .091829140484333
        scalar ukcaret5 = .2106072276830673
        scalar ukcaret6 = .291060084104538
        scalar ukcaret7 = .233658792078495
        scalar ukcaret8 = .1385171443223953
        scalar ukcaret9 = .4000605583190918
        scalar uscaret1 = 1
        scalar uscaret2 = 1
        scalar uscaret3 = .1762365162372589
        scalar uscaret4 = .0905464462935925
        scalar uscaret5 = .248006908595562
        scalar uscaret6 = .6132831871509552
        scalar uscaret7 = .4741199791431427
        scalar uscaret8 = .31909219622612
        scalar uscaret9 = .6049211204051972
    /*}}}*/
    foreach k of local datalist {
        qui {
        /*자료호출*/
            use $`k'20h, clear
        /*변수조작*/
            /*변수생성 : 국가별 예외*/
                if "`k'" == "jp" | "`k'" == "kr" {
                    drop hpublic
                    egen hpublic = rowtotal(hipubsoc hi31 hi32)
                        label var hpublic "Public tasfers(replaced)"
                }
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
                replace hhtype = 6 if missing(hhtype) & (nhhmem65 >=1 & nhhmem1864 == 0 & nhhmem17 >= 1) | (nhhmem65 == 0 & nhhmem1864 == 1 & nhhmem17 >= 1) 
                    // 조손가구 또는 한부모가구 : 정의가 튄다.
                replace hhtype = 7 if missing(hhtype) & nhhmem65 == 0 & nhhmem1864 == 2 & nhhmem17 >= 1 // 근로연령 2인 + 아동
                replace hhtype = 8 if missing(hhtype) & nhhmem1864 >= 3 // 근로연령 3인 이상 + 아동(노인 무관)
                replace hhtype = 9 if missing(hhtype) //기타
        /*위험도 할당*/
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
        /*변수 생성 : 가중 분위수 집단*/
            xtile dcgroup = emin [aw=hpopwgt], nq(10)
            xtile pcgroup = emin [aw=hpopwgt], nq(100)
        /*소득분위별 위험도 평균계산*/
            forvalue i = 1/10 {
                summarize care [aw=hpopwgt] if dcgroup == `i' , meanonly
                local cared`i' = r(mean)
            }
            forvalue i = 1/100 {
                summarize care [aw=hpopwgt] if pcgroup == `i' , meanonly
                local carep`i' = r(mean)
            }
        }
        /*결과 출력*/
            local cname = cname[1]
            local iso2 = iso2[1]
            local iso3 = iso3[1]
            if "`k'" == "fr" {
                di as text "cname,iso2,iso3,group,grtype,care"
            }
            forvalue i = 1/10 {
                di as text "`cname',`iso2',`iso3',`i',1,`cared`i''"
            }
            forvalue i = 1/100 {
                di as text "`cname',`iso2',`iso3',`i',2,`carep`i''"
            }
    }
