    /*set of country-year data{{{*/
    local dataset fr10 fr11 fr12 fr13 fr14 fr15 fr16 fr17 fr18 fr19 /// France
        jp10 jp11 jp12 jp13 jp14 jp15 jp16 jp17 jp18 jp19 /// Japan
        kr12 kr14 kr16 kr17 kr18 kr19                     /// South Korea
        se10 se11 se12 se13 se14 se15 se16 se17 se18 se19 /// Sweden
        uk10 uk11 uk12 uk13 uk14 uk15 uk16 uk17 uk18 uk19 /// United Kingdom
        us10 us11 us12 us13 us14 us15 us16 us17 us18 us19 /*United States*/
    /*}}}*/ 

    foreach k of local dataset {
        /*가구자료호출*/
            use $`k'h, clear
        /*변수조작*/
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
                gen ehhmen    = sqrt(nhhmem)
                gen emin      = min / ehhmen
                    label var emin "Equiv. Market Income"
        /*가구통계량 생성*/
            local hset dhi min hitotal hpublic tax hxitax hxptax hxotax ///
                hxscont hxvcont hipension hi31 hi32 hipubsoc dhi ///
                pwgt nhhmem1864 nhhmem nhhmem65 nhhmem17 
            foreach i of local hset {
                qui summarize `i' 
                local `k'`i'N    = r(N)
                local `k'`i'mean = r(mean)
                local `k'`i'sd   = r(sd)
                local `k'`i'min  = r(min)
                local `k'`i'max  = r(max)
            }
            local `k'cname = cname[1]
            local `k'year = year[1]
            local `k'currency = currency[1]
        /*개인자료결합*/
            merge 1:m hid using $`k'p, nogen 
        /*개인통계량 생성*/
            local pset pitotal pxitax pxscont pxvcont ///
                pipension pi31 pi32 ///
                ppopwgt disabled age
            foreach i of local pset {
                qui summarize `i' 
                local `k'`i'N    = r(N)
                local `k'`i'mean = r(mean)
                local `k'`i'sd   = r(sd)
                local `k'`i'min  = r(min)
                local `k'`i'max  = r(max)
            }
    }

    /*결과 출력*/
        foreach k of local dataset {
            if "`k'" == "fr10" {
                di as text "cname,year,currency,varname,N,mean,sd,min,max"
            }
            foreach i of local hset {
                di as text "``k'cname',``k'year',``k'currency',`i',``k'`i'N',``k'`i'mean',``k'`i'sd',``k'`i'min',``k'`i'max'"
            }
            foreach i of local pset {
                di as text "``k'cname',``k'year',``k'currency',`i',``k'`i'N',``k'`i'mean',``k'`i'sd',``k'`i'min',``k'`i'max'"
            }
        }
