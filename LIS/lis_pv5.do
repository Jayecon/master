/*호출변수 목록 생성*/
    local datalist fr se kr jp uk us
    foreach k of local datalist {
        qui {
        /*자료호출*/
            use $`k'19h, clear
        /*변수조작*/
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
                replace hhtype = 6 if (nhhmem65 >=1 & nhhmem1864 == 0 & nhhmem17 >= 1) | (nhhmem65 == 0 & nhhmem1864 == 1 & nhhmem17 >= 1) 
                    // 조손가구 또는 한부모가구 : 정의가 튄다.
                replace hhtype = 7 if nhhmem65 == 0 & nhhmem1864 == 2 & nhhmem17 >= 1 // 근로연령 2인 + 아동
                replace hhtype = 8 if nhhmem1864 >= 3 // 근로연령 3인 이상 + 아동(노인 무관)
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
            if "`k'" == "fr09" {
                di as text "cname,iso2,iso3,year,pv5t1,pv5t2,pv5t3,pv5t4,pv5t5,pv5t6,pv5t7,pv5t8,pv5t9"
            }
            di as text "`cname',`iso2',`iso3',`year',`pv5t1',`pv5t2',`pv5t3',`pv5t4',`pv5t5',`pv5t6',`pv5t7',`pv5t8',`pv5t9'"
    }
