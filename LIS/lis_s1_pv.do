    /*set of country-year data{{{*/
    local dataset fr10 fr11 fr12 fr13 fr14 fr15 fr16 fr17 fr18 fr19 fr20 /// France
        jp10 jp11 jp12 jp13 jp14 jp15 jp16 jp17 jp18 jp19 jp20 /// Japan
        kr12 kr14 kr16 kr17 kr18 kr19 kr20                    /// South Korea
        se10 se11 se12 se13 se14 se15 se16 se17 se18 se19 se20 /// Sweden
        uk10 uk11 uk12 uk13 uk14 uk15 uk16 uk17 uk18 uk19 uk20 /// United Kingdom
        us10 us11 us12 us13 us14 us15 us16 us17 us18 us19 us20 /*United States*/
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
        /*빈곤위험도 계산*/
            summarize emin [aw=pwgt], detail
            scalar p50 = r(p50)
            gen pv5 = emin < 0.5 * p50
                label var pv5 "1==if under 50% of median"
            gen pv6 = emin < 0.6 * p50
                label var pv6 "1==if under 60% of median"
                summarize pv5 [aw=pwgt] , meanonly
                local pv5t0 = r(mean)
                summarize pv6 [aw=pwgt] , meanonly
                local pv6t0 = r(mean)
        }
        /*결과 출력*/
            local cname = cname[1]
            local iso2 = iso2[1]
            local iso3 = iso3[1]
            local year = year[1] -1
            if "`k'" == "fr10" {
                di as text "???"
                di as text "cname,iso2,rname,year,t0"
            }
            di as text "`cname',`iso2',pv5,`year',`pv5t0'"
            di as text "`cname',`iso2',pv6,`year',`pv6t0'"
    }
    di as text "???"
