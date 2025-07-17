        /*set of countrty-year data{{{*/
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
            /*merge 1:m hid using $`k'p, nogen */
        /*변수조작*/
            /*변수 생성*/
                gen min        = hitotal - hpublic
                capture drop pwgt
                gen pwgt       = hpopwgt * nhhmem
                gen nhhmem1864 = nhhmem - nhhmem65 - nhhmem17
            /*변수 생성 : 균등화 소득*/
                gen ehhmen = sqrt(nhhmem)
                gen emin   = min / ehhmen
            /*변수생성 : 가구유형*/
                capture drop hht
                gen hht = .
                replace hht = 1 if nhhmem == 1 & nhhmem65 == 1 // 노인 1인
                replace hht = 2 if nhhmem >= 2 & nhhmem == nhhmem65 // 노인만 2인 이상
                replace hht = 3 if nhhmem == 1 & nhhmem1864 == 1 // 근로연령 1인
                replace hht = 4 if nhhmem == 2 & nhhmem1864 == 2 //근로연령만 2인 
                replace hht = 5 if missing(hht) & ((nhhmem65 + nhhmem1864) >= 1 & nhhmem17 == 0) 
                    // 노인+ 근로연령(아동없음). missing 안걸면 1-4 유형 가구를 덮어씀.
                replace hht = 6 if missing(hht) & (nhhmem65 >=1 & nhhmem1864 == 0 & nhhmem17 >= 1) | (nhhmem65 == 0 & nhhmem1864 == 1 & nhhmem17 >= 1) // 조손가구 또는 한부모가구 : 정의가 튄다.
                replace hht = 7 if missing(hht) & nhhmem65 == 0 & nhhmem1864 == 2 & nhhmem17 >= 1 // 근로연령 2인 + 아동
                replace hht = 8 if missing(hht) & nhhmem1864 >= 3 // 근로연령 3인 이상 + 아동(노인 무관)
                replace hht = 9 if missing(hht) //기타
        /*기초통계량 생산*/
            /*유형별 가구수*/
                gen one = 1
                sum one [aw=pwgt] , meanonly
                local hnum = round(r(sum_w))
                forvalue i = 1/9 {
                    sum one [aw=pwgt] if hht == `i'
                    local numt`i' = round(r(sum_w))
                }
        }
        /*결과 출력*/
            local cname = cname[1]
            local iso2 = iso2[1]
            local iso3 = iso3[1]
            local year = year[1]
            if "`k'" == "fr10" {
                di as text "cname,iso2,iso3,year,hnum,numt1,numt2,numt3,numt4,numt5,numt6,numt7,numt8,numt9"
            }
            di as text "`cname',`iso2',`iso3',`year',`hnum',`numt1',`numt2',`numt3',`numt4',`numt5',`numt6',`numt7',`numt8',`numt9'"
    }
