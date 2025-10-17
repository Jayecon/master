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
        /*소득분위별 가구위험도 평균계산{{{*/
            forvalue i = 1/10 {
                summarize emin [aw=hpwgt] if dcgroup == `i' , meanonly
                    local memind`i' = r(mean)
                summarize ebnf [aw=hpwgt] if dcgroup == `i' , meanonly
                    local mebnfd`i' = r(mean)
                summarize etax [aw=hpwgt] if dcgroup == `i' , meanonly
                    local metaxd`i' = r(mean)
                summarize esct [aw=hpwgt] if dcgroup == `i' , meanonly
                    local mesctd`i' = r(mean)
                summarize ebdn [aw=hpwgt] if dcgroup == `i' , meanonly
                    local mebdnd`i' = r(mean)
                summarize ebfn [aw=hpwgt] if dcgroup == `i' , meanonly
                    local mebfnd`i' = r(mean)
                summarize ebf0 [aw=hpwgt] if dcgroup == `i' , meanonly
                    local mebf0d`i' = r(mean)
            }
            forvalue i = 1/100 {
                summarize emin [aw=hpwgt] if pcgroup == `i' , meanonly
                    local meminp`i' = r(mean)
                summarize ebnf [aw=hpwgt] if pcgroup == `i' , meanonly
                    local mebnfp`i' = r(mean)
                summarize etax [aw=hpwgt] if pcgroup == `i' , meanonly
                    local metaxp`i' = r(mean)
                summarize esct [aw=hpwgt] if pcgroup == `i' , meanonly
                    local mesctp`i' = r(mean)
                summarize ebdn [aw=hpwgt] if pcgroup == `i' , meanonly
                    local mebdnp`i' = r(mean)
                summarize ebfn [aw=hpwgt] if pcgroup == `i' , meanonly
                    local mebfnp`i' = r(mean)
                summarize ebf0 [aw=hpwgt] if pcgroup == `i' , meanonly
                    local mebf0p`i' = r(mean)
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
                di as text "`cname',`iso2',min,`i',1,`memind`i''"
                di as text "`cname',`iso2',bnf,`i',1,`mebnfd`i''"
                di as text "`cname',`iso2',tax,`i',1,`metaxd`i''"
                di as text "`cname',`iso2',sct,`i',1,`mesctd`i''"
                di as text "`cname',`iso2',bdn,`i',1,`mebdnd`i''"
                di as text "`cname',`iso2',bfn,`i',1,`mebfnd`i''"
                di as text "`cname',`iso2',bf0,`i',1,`mebf0d`i''"
            }
            forvalue i = 1/100 {
                di as text "`cname',`iso2',min,`i',2,`meminp`i''"
                di as text "`cname',`iso2',bnf,`i',2,`mebnfp`i''"
                di as text "`cname',`iso2',tax,`i',2,`metaxp`i''"
                di as text "`cname',`iso2',sct,`i',2,`mesctp`i''"
                di as text "`cname',`iso2',bdn,`i',2,`mebdnp`i''"
                di as text "`cname',`iso2',bfn,`i',2,`mebfnp`i''"
                di as text "`cname',`iso2',bf0,`i',2,`mebf0p`i''"
            }
        /*}}}*/
    }
    di as text "???"
