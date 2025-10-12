/*호출변수 목록 생성*/
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
                gen sct = hsxcont
                    label var ssc "Social Security"
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
        /*변수 생성 : 가중 분위수 집단*/
            xtile dcgroup = emin [aw=hpwgt], nq(10)
            xtile pcgroup = emin [aw=hpwgt], nq(100)
        /*소득분위별 가구위험도 평균계산{{{*/
            forvalue i = 1/10 {
                summarize rpv5 [aw=hpwgt] if dcgroup == `i' , meanonly
                    local mrpv5d`i' = r(mean)
                summarize rpv6 [aw=hpwgt] if dcgroup == `i' , meanonly
                    local mrpv6d`i' = r(mean)
                summarize care [aw=hpwgt] if dcgroup == `i' , meanonly
                    local cared`i' = r(mean)
            }
            forvalue i = 1/100 {
                summarize rpv5 [aw=hpwgt] if pcgroup == `i' , meanonly
                    local mrpv5p`i' = r(mean)
                summarize rpv6 [aw=hpwgt] if pcgroup == `i' , meanonly
                    local mrpv6p`i' = r(mean)
                summarize care [aw=hpwgt] if pcgroup == `i' , meanonly
                    local carep`i' = r(mean)
            }
            /*}}}*/
    }
        /*결과 출력{{{*/
            local cname = cname[1]
            local iso2 = iso2[1]
            local iso3 = iso3[1]
            if "`k'" == "fr" {
                di as text "???"
                di as text "cname,iso2,name,group,grcat,value"
            }
            forvalue i = 1/10 {
                di as text "`cname',`iso2',pv5,`i',1,`mrpv5d`i''"
                di as text "`cname',`iso2',pv6,`i',1,`mrpv6d`i''"
                di as text "`cname',`iso2',care,`i',1,`cared`i''"
            }
            forvalue i = 1/100 {
                di as text "`cname',`iso2',pv5,`i',2,`mrpv5p`i''"
                di as text "`cname',`iso2',pv6,`i',2,`mrpv6p`i''"
                di as text "`cname',`iso2',care,`i',2,`carep`i''"
            }
        /*}}}*/
    }
    di as text "???"
