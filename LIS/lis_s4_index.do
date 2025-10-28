    /*호출자료 목록 생성*/
    local datalist fr se kr jp uk us
    foreach k of local datalist {
        qui{
        /*자료호출*/
            use $`k'20h, clear
        /*변수조작*/
            /*변수생성 : 국가별 예외*/
                if "`k'" == "jp" | "`k'" == "kr" {
                    drop hpublic
                    egen hpublic = rowtotal(hipubsoc hi31 hi32)
                        label var hpublic "Public tasfers(replaced)"
                }
            /*변수생성*/
                gen min        = hitotal - hpublic - hxvcont - hxiht
                    label var min "Market Income"
                gen cin        = hitotal  - hxvcont - hxiht
                    label var cin "Current Income"
                gen hpwgt      = hpopwgt * nhhmem
                    label var hpwgt "Weight" 
                gen nhhmem1864 = nhhmem - nhhmem65 - nhhmem17
                    label var nhhmem1864 "Number of Household member, age 18-64"
                gen tax = hxitax + hxptax
                    label var tax "Tax"
                gen sct = hxscont
                    label var sct "Social Security"
            /*변수생성 : 균등화 소득*/
                gen ehhmen = sqrt(nhhmem)
                gen edhi   = dhi / ehhmen
                    label var edhi "Equiv. disposable Income"
                gen emin   = min / ehhmen
                    label var emin "Equiv. Market Income"
                gen ecin   = cin / ehhmen
                    label var ecin "Equiv. Current Income"
                gen ebnf   = hpublic / ehhmen
                    label var ebnf "Equiv. Benefit"
                gen etax   = tax / ehhmen
                    label var etax "Equiv. Tax"
                gen esct   = sct / ehhmen
                    label var esct "Equiv. Social Secutiry"
                gen ebdn   = etax + esct
                    label var esct "Equiv. Burden"
                gen ebfn   = ebnf - ebdn
                    label var esct "Equiv. net Benefit"
                gen ebf0   = 0
                replace ebf0 = ebfn if ebfn >= 0
                    label var esct "Equiv. net Benefit(zero min)"
        /*변수 생성 : 가중 분위수 집단*/
            xtile dcgroup = emin [aw=hpwgt], nq(10)
            xtile pcgroup = emin [aw=hpwgt], nq(100)
        /*가구할당 위험도 지수 계산{{{*/
            local vset emin ebnf etax esct ebdn ebfn ebf0 
            foreach i of local vset {
                conindex `i' [pw=hpwgt] , truezero
                local gini`i' = r(CI)
                conindex `i' [pw=hpwgt] , rank(emin) truezero
                local ci`i' = r(CI)
            }
            /*}}}*/
    }
        /*결과 출력{{{*/
            local cname = cname[1]
            local iso2 = iso2[1]
            local iso3 = iso3[1]
            if "`k'" == "fr" {
                di as text "???"
                di as text "cname,iso2,var,ci,gini"
            }
                di as text "`cname',`iso1',emin,`ciemin',`giniemin'"    
                di as text "`cname',`iso1',ebnf,`ciebnf',`giniebnf'"    
                di as text "`cname',`iso1',etax,`cietax',`ginietax'"    
                di as text "`cname',`iso1',esct,`ciesct',`giniesct'"    
                di as text "`cname',`iso1',ebdn,`ciebdn',`giniebdn'"    
                di as text "`cname',`iso1',ebfn,`ciebfn',`giniebfn'"    
                di as text "`cname',`iso1',ebf0,`ciebf0',`giniebf0'"    
        /*}}}*/
    }
    di as text "???"
