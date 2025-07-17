/*호출변수 목록 생성*/
    #delimit ;
    local datalist
        /*{{{*/
        /*France*/
            fr10 fr11 fr12 fr13 fr14 fr15 fr16 fr17 fr18 fr19
        /*Japan*/
            jp10 jp11 jp12 jp13 jp14 jp15 jp16 jp17 jp18 jp19
        /*South Korea*/
            kr12 kr14 kr16 kr17 kr18 kr19
        /*Sweden*/
            se10 se11 se12 se13 se14 se15 se16 se17 se18 se19
        /*United Kingdom*/
            uk10 uk11 uk12 uk13 uk14 uk15 uk16 uk17 uk18 uk19
        /*United States*/
            us10 us11 us12 us13 us14 us15 us16 us17 us18 us19
        /*}}}*/ ;
    #delimit cr
    foreach k of local datalist {
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
                gen min        = hitotal - hpublic
                gen pwgt       = hpopwgt * nhhmem
                gen nhhmem1864 = nhhmem - nhhmem65 - nhhmem17
            /*변수 생성 : 균등화 소득*/
                gen ehhmen = sqrt(nhhmem)
                gen emin   = min / ehhmen
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
        /*중위소득 계산 (weighted median)*/
            summarize emin [aw=pwgt], detail
            scalar p50 = r(p50)
            gen pv5 = emin < 0.5 * p50
        /*빈곤위험도 계산*/
            forvalue i=1/9 {
                summarize pv5 if hhtype == `i' [aw=pwgt] , meanonly
                local pv5t`i' = r(mean)
            }
        }
        /*결과 출력*/
           /*국가명 년도*/
                local cname = cname[1]
                local iso2 = iso2[1]
                local iso3 = iso3[1]
                local year = year[1]
            if "`k'" == "fr10" {
                di as text "cname,iso2,iso3,year,pv5t1,pv5t2,pv5t3,pv5t4,pv5t5,pv5t6,pv5t7,pv5t8,pv5t9"
            }
            di as text "`cname',`iso2',`iso3',`year',`pv5t1',`pv5t2',`pv5t3',`pv5t4',`pv5t5',`pv5t6',`pv5t7',`pv5t8',`pv5t9'"
    }
