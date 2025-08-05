    /*set of country-year data{{{*/
    local dataset fr10 fr11 fr12 fr13 fr14 fr15 fr16 fr17 fr18 fr19 /// France
        jp10 jp11 jp12 jp13 jp14 jp15 jp16 jp17 jp18 jp19 /// Japan
        kr12 kr14 kr16 kr17 kr18 kr19                     /// South Korea
        se10 se11 se12 se13 se14 se15 se16 se17 se18 se19 /// Sweden
        uk10 uk11 uk12 uk13 uk14 uk15 uk16 uk17 uk18 uk19 /// United Kingdom
        us10 us11 us12 us13 us14 us15 us16 us17 us18 us19 /*United States*/
    /*}}}*/ 

    foreach k of local dataset {
        qui {
        /*자료호출*/
            use $`k'h, clear
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
                gen pwgt       = hpopwgt * nhhmem
                    label var pwgt "Weight" 
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
        /*빈곤위험도 계산*/
            summarize emin [aw=pwgt], detail
            scalar p50 = r(p50)
            gen pv5 = emin < 0.5 * p50
                label var pv5 "1==if under 50% of median"
            gen pv6 = emin < 0.6 * p50
                label var pv6 "1==if under 60% of median"
            forvalue i=1/9 {
                summarize pv5 if hht == `i' [aw=pwgt] , meanonly
                local pv5t`i' = r(mean)
                summarize pv6 if hht == `i' [aw=pwgt] , meanonly
                local pv6t`i' = r(mean)
            }
        /*주거위험 : 주거비가 가처분소득의 40% 이상 */
            gen rt = hc41/edhi >= .4
                label var rt "1==if in rent risk"
            forvalue i=1/9 {
                summarize rt if hht == `i' [aw=pwgt] , meanonly
                local rtt`i' = r(mean)
            }
        /*돌봄위험 계산*/
            merge 1:m hid using $`k'p, nogen 
            drop temp1 
            count if !missing(disabled)
            local numdisabled = r(N)
            if `numdisabled' > 0 {
                gen temp1 = (!missing(age) & ( age <= 5 | age >= 65)) | disabled
            }
            else {
                gen temp1 = (!missing(age) & ( age <= 5 | age >= 65))
            }
            bys hid : egen temp2 = total(temp1)
            gen care = temp2 / nhhmem
            forvalue i=1/9 {
                summarize care if hht == `i' [aw=pwgt] , meanonly
                local caret`i' = r(mean)
            }
        }
        /*결과 출력*/
            local cname = cname[1]
            local iso2 = iso2[1]
            local iso3 = iso3[1]
            local year = year[1]
            if "`k'" == "fr10" {
                di as text "???"
                di as text "cname,iso2,rname,year,t1,t2,t3,t4,t5,t6,t7,t8,t9"
            }
            di as text "`cname',`iso2',pv5,`year',`pv5t1',`pv5t2',`pv5t3',`pv5t4',`pv5t5',`pv5t6',`pv5t7',`pv5t8',`pv5t9'"
            di as text "`cname',`iso2',pv6,`year',`pv6t1',`pv6t2',`pv6t3',`pv6t4',`pv6t5',`pv6t6',`pv6t7',`pv6t8',`pv6t9'"
            di as text "`cname',`iso2',rent,`year',`rtt1',`rtt2',`rtt3',`rtt4',`rtt5',`rtt6',`rtt7',`rtt8',`rtt9'"
            di as text "`cname',`iso2',care,`year',`caret1',`caret2',`caret3',`caret4',`caret5',`caret6',`caret7',`caret8',`caret9'"
    }
    di as text "???"
