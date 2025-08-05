    local dataset fr jp kr se uk us

    foreach k of local dataset {
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
                gen min        = hitotal - hpublic - hxvcont - hxiht
                    label var min "Market Income"
                gen hpwgt       = hpopwgt * nhhmem
                    label var hpwgt "Weight" 
                gen nhhmem1864 = nhhmem - nhhmem65 - nhhmem17
                    label var nhhmem1864 "Number of Household member, age 18-64"
                gen tax        = hxitax + hxptax + hxotax
                    label var tax "Household Tax"
            /*변수 생성 : 균등화 소득*/
                gen ehhmen = sqrt(nhhmem)
                gen edhi   = dhi / ehhmen
                    label var edhi "Equiv. disposable Income"
                gen emin   = min / ehhmen
                    label var emin "Equiv. Market Income"
            /*변수생성 : 가구유형*/
                capture drop hht
                gen hht = .
                label var hht "Household Category"
                replace hht = 1 if nhhmem == 1 & nhhmem65 == 1 // 노인 1인
                replace hht = 2 if nhhmem >= 2 & nhhmem == nhhmem65 // 노인만 2인 이상
                replace hht = 3 if nhhmem == 1 & nhhmem1864 == 1 // 근로연령 1인
                replace hht = 4 if nhhmem == 2 & nhhmem1864 == 2 //근로연령만 2인 
                replace hht = 5 if missing(hht) & ((nhhmem65 + nhhmem1864) >= 1 & nhhmem17 == 0) 
                    // 노인+ 근로연령(아동없음). missing 안걸면 1-4 유형 가구를 덮어씀.
                replace hht = 6 if missing(hht) & (nhhmem65 >=1 & nhhmem1864 == 0 & nhhmem17 >= 1) | (nhhmem65 == 0 & nhhmem1864 == 1 & nhhmem17 >= 1) 
                    // 조손가구 또는 한부모가구 : 정의가 튄다.
                replace hht = 7 if missing(hht) & nhhmem65 == 0 & nhhmem1864 == 2 & nhhmem17 >= 1 // 근로연령 2인 + 아동
                replace hht = 8 if missing(hht) & nhhmem1864 >= 3 // 근로연령 3인 이상 + 아동(노인 무관)
                replace hht = 9 if missing(hht) //기타
        /*변수 생성 : 가중 분위수 집단*/
            xtile dcgroup = emin [aw=hpwgt], nq(10)
        /*기초통계량 생산*/
            /*유형별 가구수*/
                gen one = 1
                    sum one [aw = hpwgt] , meanonly
                    local numhq11 = round(r(sum_w))
                    forvalue i = 1/10 {
                        sum one [aw = hpwgt] if dcgroup == `i' , meanonly
                        local numhq`i' = round(r(sum_w))
                    }
                merge 1:m hid using $`k'20p, nogen 
                replace one = 1 if missing(one)
                    sum one [aw = hpopwgt] if sex == 1 ,meanonly
                    local nummq11 = round(r(sum_w))/`numhq11'
                    sum one [aw = hpopwgt] if sex == 2 ,meanonly
                    local numfq11 = round(r(sum_w))/`numhq11'
                    sum one [aw = hpopwgt] if inrange(age , 0, 17) , meanonly
                    local num17q11 = round(r(sum_w))/`numhq11'
                    sum one [aw = hpopwgt] if inrange(age , 18, 64) , meanonly
                    local num1864q11 = round(r(sum_w))/`numhq11'
                    sum one [aw = hpopwgt] if inrange(age , 65, 999) , meanonly
                    local num65q11 = round(r(sum_w))/`numhq11'
                    forvalue i = 1/10 {
                        sum one [aw = hpopwgt] if sex == 1 & dcgroup == `i' ,meanonly
                        local nummq`i' = round(r(sum_w))/`numhq`i''
                        sum one [aw = hpopwgt] if sex == 2 & dcgroup == `i' ,meanonly
                        local numfq`i' = round(r(sum_w))/`numhq`i''
                        sum one [aw = hpopwgt] if inrange(age , 0, 17) & dcgroup == `i' , meanonly
                        local num17q`i' = round(r(sum_w))/`numhq`i''
                        sum one [aw = hpopwgt] if inrange(age , 18, 64) & dcgroup == `i' , meanonly
                        local num1864q`i' = round(r(sum_w))/`numhq`i''
                        sum one [aw = hpopwgt] if inrange(age , 65, 999) & dcgroup == `i' , meanonly
                        local num65q`i' = round(r(sum_w))/`numhq`i''
                    }
        }
        /*결과 출력*/
            local cname = cname[1]
            local iso2 = iso2[1]
            local year = year[1]
            if "`k'" == "fr" {
                di as text "???"
                di as text "cname,iso2,dcgroup,hunm,numm,numf,num17,num1864,num65"
            }
            forvalue i = 1/11 {
                di as text "`cname',`iso2',`i',`numhq`i'',`nummq`i'',`numfq`i'',`num17q`i'',`num1864q`i'',`num65q`i''"
            }
    }
    di as text "???"
