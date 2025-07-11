    local datalist fr se kr jp uk us
    /*사회적지지부족  단위: % {{{*/
        /*2009~2018년 평균 격년 조사의 경우 조사가 없는 해는 이전 조사값을 대입함
            (oecd 원자료 제공상태가 그러함)*/
        /*원자료는 성&연령대별 값을 제공하지 않음.
            * 아래는 성, 연령대 각각의 데이터를 이용하여 계산한 값임.*/
        scalar frms1529 = 6.6
        scalar frms3049 = 8.3
        scalar frms5099 = 10.2
        scalar frfs1529 = 6.1
        scalar frfs3049 = 7.8
        scalar frfs5099 = 9.7
        scalar jpms1529 = 7.7
        scalar jpms3049 = 12.4
        scalar jpms5099 = 13.8
        scalar jpfs1529 = 4.1
        scalar jpfs3049 = 6.6
        scalar jpfs5099 = 7.4
        scalar krms1529 = 6.5
        scalar krms3049 = 19.9
        scalar krms5099 = 39.1
        scalar krfs1529 = 5.4
        scalar krfs3049 = 16.6
        scalar krfs5099 = 32.5
        scalar sems1529 = 2.3
        scalar sems3049 = 6.8
        scalar sems5099 = 9.6
        scalar sefs1529 = 2.3
        scalar sefs3049 = 6.7
        scalar sefs5099 = 9.4
        scalar ukms1529 = 4.9
        scalar ukms3049 = 7.4
        scalar ukms5099 = 7.4
        scalar ukfs1529 = 4.0
        scalar ukfs3049 = 5.9
        scalar ukfs5099 = 5.8
        scalar usms1529 = 6.0
        scalar usms3049 = 11.6
        scalar usms5099 = 9.7
        scalar usfs1529 = 4.6
        scalar usfs3049 = 8.9
        scalar usfs5099 = 7.5
    /*}}}*/
    foreach k of local datalist {
        qui {
        /*자료호출*/
            use $`k'20h, clear
            merge 1:m hid using $`k'20p, nogen 
        /*변수조작*/
            /*변수 생성*/
                gen min     = hitotal - hpublic
                capture drop pwgt
                gen pwgt    = hpopwgt * nhhmem
            /*변수 생성 : 균등화 소득*/
                gen ehhmen    = sqrt(nhhmem)
                gen emin      = min / ehhmen
        /*위험도 할당*/
            gen isolt = .
            /*입력받은 수치를 국가별 성별 연령별 집단에게 부여{{{*/
                if "`k'" == "fr" {
                /*{{{*/
                replace isolt = frms1529 if inrange(age , 15 , 29)  & sex == 1
                replace isolt = frfs1529 if inrange(age , 15 , 29)  & sex == 2
                replace isolt = frms3049 if inrange(age , 30 , 44)  & sex == 1
                replace isolt = frfs3049 if inrange(age , 30 , 44)  & sex == 2
                replace isolt = frms5099 if inrange(age , 50 , 999) & sex == 1
                replace isolt = frfs5099 if inrange(age , 50 , 999) & sex == 2
                /*}}}*/
                }
                else if "`k'" == "jp" {
                /*{{{*/
                replace isolt = jpms1529 if inrange(age , 15 , 29)  & sex == 1
                replace isolt = jpfs1529 if inrange(age , 15 , 29)  & sex == 2
                replace isolt = jpms3049 if inrange(age , 30 , 44)  & sex == 1
                replace isolt = jpfs3049 if inrange(age , 30 , 44)  & sex == 2
                replace isolt = jpms5099 if inrange(age , 50 , 999) & sex == 1
                replace isolt = jpfs5099 if inrange(age , 50 , 999) & sex == 2
                /*}}}*/
                }
                else if "`k'" == "kr" {
                /*{{{*/
                replace isolt = krms1529 if inrange(age , 15 , 29)  & sex == 1
                replace isolt = krfs1529 if inrange(age , 15 , 29)  & sex == 2
                replace isolt = krms3049 if inrange(age , 30 , 44)  & sex == 1
                replace isolt = krfs3049 if inrange(age , 30 , 44)  & sex == 2
                replace isolt = krms5099 if inrange(age , 50 , 999) & sex == 1
                replace isolt = krfs5099 if inrange(age , 50 , 999) & sex == 2
                /*}}}*/
                }
                else if "`k'" == "se" {
                /*{{{*/
                replace isolt = sems1529 if inrange(age , 15 , 29)  & sex == 1
                replace isolt = sefs1529 if inrange(age , 15 , 29)  & sex == 2
                replace isolt = sems3049 if inrange(age , 30 , 44)  & sex == 1
                replace isolt = sefs3049 if inrange(age , 30 , 44)  & sex == 2
                replace isolt = sems5099 if inrange(age , 50 , 999) & sex == 1
                replace isolt = sefs5099 if inrange(age , 50 , 999) & sex == 2
                /*}}}*/
                }
                else if "`k'" == "uk" {
                /*{{{*/
                replace isolt = ukms1529 if inrange(age , 15 , 29)  & sex == 1
                replace isolt = ukfs1529 if inrange(age , 15 , 29)  & sex == 2
                replace isolt = ukms3049 if inrange(age , 30 , 44)  & sex == 1
                replace isolt = ukfs3049 if inrange(age , 30 , 44)  & sex == 2
                replace isolt = ukms5099 if inrange(age , 50 , 999) & sex == 1
                replace isolt = ukfs5099 if inrange(age , 50 , 999) & sex == 2
                /*}}}*/
                }
                else if "`k'" == "us" {
                /*{{{*/
                replace isolt = usms1529 if inrange(age , 15 , 29)  & sex == 1
                replace isolt = usfs1529 if inrange(age , 15 , 29)  & sex == 2
                replace isolt = usms3049 if inrange(age , 30 , 44)  & sex == 1
                replace isolt = usfs3049 if inrange(age , 30 , 44)  & sex == 2
                replace isolt = usms5099 if inrange(age , 50 , 999) & sex == 1
                replace isolt = usfs5099 if inrange(age , 50 , 999) & sex == 2
                /*}}}*/
                }
            /*}}}*/
            replace isolt = isolt/100
            drop temp1
        /*변수 생성 : 모두고립*/
            gen temp1  = ln(isolt) 
            bys hid : egen temp2 = total(temp1)
            gen aisolt = exp(temp2)
        /*변수 생성 : 고립자 있음*/
            gen temp3  = 1 - isolt
            gen temp4  = ln(temp3) 
            bys hid : egen temp5 = total(temp4)
            gen xisolt = 1 - exp(temp5)
        /*변수 생성 : 가중 분위수 집단*/
            keep if relation == 1000
            xtile dcgroup = emin [aw=hpopwgt], nq(10)
            xtile pcgroup = emin [aw=hpopwgt], nq(100)
        /*소득분위별 위험도 평균 계산*/
            forvalue i = 1/10 {
                summarize aisolt  [aw=hpopwgt] if dcgroup == `i' , meanonly
                local aisoltd`i' = r(mean)
                summarize xisolt  [aw=hpopwgt] if dcgroup == `i' , meanonly
                local xisoltd`i' = r(mean)
            }
            forvalue i = 1/100 {
                summarize aisolt  [aw=hpopwgt] if pcgroup == `i' , meanonly
                local aisoltp`i' = r(mean)
                summarize xisolt  [aw=hpopwgt] if pcgroup == `i' , meanonly
                local xisoltp`i' = r(mean)
            }
        }
        /*결과 출력*/
            local cname = cname[1]
            local iso2 = iso2[1]
            local iso3 = iso3[1]
            if "`k'" == "fr" {
                di as text "cname,iso2,iso3,group,grtype,aisolt,xisolt"
            }
            forvalue i = 1/10 {
                di as text "`cname',`iso2',`iso3',`i',1,`aisoltd`i'',`xisoltd`i''"
            }
            forvalue i = 1/100 {
                di as text "`cname',`iso2',`iso3',`i',2,`aisoltp`i'',`xisoltp`i''"
            }
    }
