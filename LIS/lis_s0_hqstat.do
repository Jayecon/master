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
                forvalue i = 1/10 {
                    sum one [aw = hpwgt] if dcgroup == `i' , meanonly
                    local hnumt`i' = round(r(sum_w))
                }
                forvalue i = 1/10 {
                    forvalue j = 1/9 {
                        sum one [aw = hpwgt] if hht == `j' & dcgroup == `i' ,meanonly
                        local numq`i't`j' = round(r(sum_w))
                    }
                }
        }
        /*결과 출력*/
            local cname = cname[1]
            local iso2 = iso2[1]
            local year = year[1]
            if "`k'" == "fr" {
                di as text "cname,iso2,ft,hunm,numq1,numq2,numq3,numq4,numq5,numq6,numq7,numq8,numt9"
            }
            forvalue i = 1/9 {
                di as text "`cname',`iso2',`i',`hnumt`i'',`numq1t`i'',`numq2t`i'',`numq3t`i'',`numq4t`i'',`numq5t`i'',`numq6t`i'',`numq7t`i'',`numq8t`i'',`numq9t`i''"
            }
    }
