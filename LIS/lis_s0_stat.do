    /*호출변수 목록 생성*/
    local datalist fr se kr jp uk us

    foreach k of local datalist {
        /*자료호출*/
            use $`k'20h, clear
            /*merge 1:m hid using $`k'20p, nogen */
        /*변수조작*/
            /*변수 생성*/
                gen min     = hitotal - hpublic
                gen pwgt    = hpopwgt * nhhmem
                gen nhhmem1864 = nhhmem - nhhmem65 - nhhmem17
                gen htax = hxitax + hxptax + hxotax
            /*변수 생성 : 균등화 소득*/
                gen ehhmen    = sqrt(nhhmem)
                gen emin      = min / ehhmen
            /*그래프 그리기*/
                local vlist min hitotal hpublic htax hxitax hxptax hxotax ///
                    hxscont hipension hi31 hi32 hipubsoc ///
                    pwgt nhhmem1864 nhhmem nhhmem65 nhhmem17 
                foreach i of local vlist {
                    qui summarize `i'
                    local `k'`i'N    = r(N)
                    local `k'`i'mean = r(mean)
                    local `k'`i'sd   = r(sd)
                    local `k'`i'min  = r(min)
                    local `k'`i'max  = r(max)
                }
            local `k'cname = cname[1]
            local `k'currency = currency[1]
    }

    /*결과 출력*/
        di as text "cname,currency,varname,N,mean,sd,min,max"
        foreach k of local datalist {
            foreach i of local vlist {
                di as text "``k'cname',``k'currency',`i',``k'`i'N',``k'`i'mean',``k'`i'sd',``k'`i'min',``k'`i'max'"
            }
        }
