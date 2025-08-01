    /*호출변수 목록 생성*/
    local datalist fr se kr jp uk us
    foreach k of local datalist {
        /*자료호출*/
            use $`k'20h, clear
        /*변수조작*/
            /*변수 생성*/
                gen min     = hitotal - hpublic
                    label var min "Market Income"
                gen pwgt    = hpopwgt * nhhmem
                    label var pwgt "Weight" 
                gen nhhmem1864 = nhhmem - nhhmem65 - nhhmem17
                    label var nhhmem1864 "Number of Household member, age 18-64"
                gen tax = hxitax + hxptax + hxotax
                    label var tax "Household Tax"
            /*변수 생성 : 균등화 소득*/
                gen ehhmen    = sqrt(nhhmem)
                gen emin      = min / ehhmen
            /*변수생성 : 가구유형*/
                capture drop hhtype
                gen hhtype = .
                    label var hhtype "Household Type"
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
            /*그래프 그리기*/
                local cname = cname[1]
                local hklist dhi min hitotal hpublic pwgt tax hxitax hxptax hxotax hxscont hipension hipubsoc hi31 hi32
                local hblist nhhmem1864 nhhmem nhhmem65 nhhmem17 hhtype
                foreach i of local hklist {
                    gen ln`i' = ln(`i')
                    local temp : var label `i'
                    kdensity ln`i' , title("log of `i'(`temp'), `cname'")
                    graphexportpdf $mypdf/`k'_`i'_kdensity.pdf
                }
                foreach i of local hblist {
                    local temp : var label `i'
                    histogram `i' , title("`i'(`temp'), `cname'")
                    graphexportpdf $mypdf/`k'_`i'_histogram.pdf
                }
    }
