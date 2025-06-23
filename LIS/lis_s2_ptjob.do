    local datalist fr se kr jp uk us
        /*비자발적 시간제 근로자비율(%) {{{*/
            /* 전체 인구 대비 연령대 구분에 주의*/
            /*예 : krfv2029 한국 20-29세 여성 전체인구대비 비자발적 시간제 근로자비율(%)*/
            scalar frfv1524 = 4.7
            scalar frmv1524 = 2.1
            scalar jpfv1524 = 3.4
            scalar jpmv1524 = 2.8
            scalar sefv1524 = 8.7
            scalar semv1524 = 4.5
            scalar ukfv1524 = 4.4
            scalar ukmv1524 = 3.9
            scalar usfv1524 = 2.0
            scalar usmv1524 = 1.9
            scalar frfv2554 = 7.6
            scalar frmv2554 = 2.1
            scalar jpfv2554 = 5.9
            scalar jpmv2554 = 1.9
            scalar sefv2554 = 6.9
            scalar semv2554 = 2.4
            scalar ukfv2554 = 3.2
            scalar ukmv2554 = 2.4
            scalar usfv2554 = 1.1
            scalar usmv2554 = 0.7
            scalar frfv5564 = 5.1
            scalar frmv5564 = 1.3
            scalar jpfv5564 = 3.6
            scalar jpmv5564 = 2.7
            scalar sefv5564 = 4.9
            scalar semv5564 = 1.5
            scalar ukfv5564 = 2.3
            scalar ukmv5564 = 1.9
            scalar usfv5564 = 0.7
            scalar usmv5564 = 0.4
            scalar frfv6599 = 0.1
            scalar frmv6599 = 0.1
            scalar jpfv6599 = 0.7
            scalar jpmv6599 = 1.7
            scalar sefv6599 = 0.4
            scalar semv6599 = 0.5
            scalar ukfv6599 = 0.1
            scalar ukmv6599 = 0.2
            scalar usfv6599 = 0.1
            scalar usmv6599 = 0.1
            /*한국은 연령대 구분이 다름*/
            scalar krfv1519 = 2.9
            scalar krmv1519 = 1.8
            scalar krfv2029 = 3.8
            scalar krmv2029 = 2.8
            scalar krfv3039 = 3.0
            scalar krmv3039 = 0.6
            scalar krfv4049 = 3.9
            scalar krmv4049 = 0.7
            scalar krfv5059 = 3.6
            scalar krmv5059 = 1.0
            scalar krfv6099 = 3.8
            scalar krmv6099 = 2.4
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
            /*변수생성 : 집단별 건강위험*/
                gen ptjob = .
                /*입력받은 수치를 국가별 성별 연령별 집단에게 부여{{{*/
                    if "`k'" == "fr" {
                    /*{{{*/
                    replace ptjob = frmv1524 if inrange(age , 15 , 24)  & sex == 1
                    replace ptjob = frfv1524 if inrange(age , 15 , 24)  & sex == 2
                    replace ptjob = frmv2554 if inrange(age , 25 , 54)  & sex == 1
                    replace ptjob = frfv2554 if inrange(age , 25 , 54)  & sex == 2
                    replace ptjob = frmv5564 if inrange(age , 55 , 64)  & sex == 1
                    replace ptjob = frfv5564 if inrange(age , 55 , 64)  & sex == 2
                    replace ptjob = frmv6599 if inrange(age , 65 , 999) & sex == 1
                    replace ptjob = frfv6599 if inrange(age , 65 , 999) & sex == 2
                    /*}}}*/
                    }
                    else if "`k'" == "jp" {
                    /*{{{*/
                    replace ptjob = jpmv1524 if inrange(age , 15 , 24)  & sex == 1
                    replace ptjob = jpfv1524 if inrange(age , 15 , 24)  & sex == 2
                    replace ptjob = jpmv2554 if inrange(age , 25 , 54)  & sex == 1
                    replace ptjob = jpfv2554 if inrange(age , 25 , 54)  & sex == 2
                    replace ptjob = jpmv5564 if inrange(age , 55 , 64)  & sex == 1
                    replace ptjob = jpfv5564 if inrange(age , 55 , 64)  & sex == 2
                    replace ptjob = jpmv6599 if inrange(age , 65 , 999) & sex == 1
                    replace ptjob = jpfv6599 if inrange(age , 65 , 999) & sex == 2
                    /*}}}*/
                    }
                    else if "`k'" == "kr" {
                    /*{{{*/
                    replace ptjob = krmv1519 if inrange(age , 15 , 19)  & sex == 1
                    replace ptjob = krfv1519 if inrange(age , 15 , 19)  & sex == 2
                    replace ptjob = krmv2029 if inrange(age , 20 , 29)  & sex == 1
                    replace ptjob = krfv2029 if inrange(age , 20 , 29)  & sex == 2
                    replace ptjob = krmv3039 if inrange(age , 30 , 39)  & sex == 1
                    replace ptjob = krfv3039 if inrange(age , 30 , 39)  & sex == 2
                    replace ptjob = krmv4049 if inrange(age , 40 , 49) & sex == 1
                    replace ptjob = krfv4049 if inrange(age , 40 , 49) & sex == 2
                    replace ptjob = krmv5059 if inrange(age , 50 , 59) & sex == 1
                    replace ptjob = krfv5059 if inrange(age , 50 , 59) & sex == 2
                    replace ptjob = krmv6099 if inrange(age , 60 , 999) & sex == 1
                    replace ptjob = krfv6099 if inrange(age , 60 , 999) & sex == 2
                    /*}}}*/
                    }
                    else if "`k'" == "se" {
                    /*{{{*/
                    replace ptjob = semv1524 if inrange(age , 15 , 24)  & sex == 1
                    replace ptjob = sefv1524 if inrange(age , 15 , 24)  & sex == 2
                    replace ptjob = semv2554 if inrange(age , 25 , 54)  & sex == 1
                    replace ptjob = sefv2554 if inrange(age , 25 , 54)  & sex == 2
                    replace ptjob = semv5564 if inrange(age , 55 , 64)  & sex == 1
                    replace ptjob = sefv5564 if inrange(age , 55 , 64)  & sex == 2
                    replace ptjob = semv6599 if inrange(age , 65 , 999) & sex == 1
                    replace ptjob = sefv6599 if inrange(age , 65 , 999) & sex == 2
                    /*}}}*/
                    }
                    else if "`k'" == "uk" {
                    /*{{{*/
                    replace ptjob = ukmv1524 if inrange(age , 15 , 24)  & sex == 1
                    replace ptjob = ukmv1524 if inrange(age , 15 , 24)  & sex == 1
                    replace ptjob = ukfv1524 if inrange(age , 15 , 24)  & sex == 2
                    replace ptjob = ukmv2554 if inrange(age , 25 , 54)  & sex == 1
                    replace ptjob = ukfv2554 if inrange(age , 25 , 54)  & sex == 2
                    replace ptjob = ukmv5564 if inrange(age , 55 , 64)  & sex == 1
                    replace ptjob = ukfv5564 if inrange(age , 55 , 64)  & sex == 2
                    replace ptjob = ukmv6599 if inrange(age , 65 , 999) & sex == 1
                    replace ptjob = ukfv6599 if inrange(age , 65 , 999) & sex == 2
                    replace ptjob = ukfv1524 if inrange(age , 15 , 24)  & sex == 2
                    replace ptjob = ukmv2554 if inrange(age , 25 , 54)  & sex == 1
                    replace ptjob = ukfv2554 if inrange(age , 25 , 54)  & sex == 2
                    replace ptjob = ukmv5564 if inrange(age , 55 , 64)  & sex == 1
                    replace ptjob = ukfv5564 if inrange(age , 55 , 64)  & sex == 2
                    replace ptjob = ukmv6599 if inrange(age , 65 , 999) & sex == 1
                    replace ptjob = ukfv6599 if inrange(age , 65 , 999) & sex == 2
                    /*}}}*/
                    }
                    else if "`k'" == "us" {
                    /*{{{*/
                    replace ptjob = usmv1524 if inrange(age , 15 , 24)  & sex == 1
                    replace ptjob = usfv1524 if inrange(age , 15 , 24)  & sex == 2
                    replace ptjob = usmv2554 if inrange(age , 25 , 54)  & sex == 1
                    replace ptjob = usfv2554 if inrange(age , 25 , 54)  & sex == 2
                    replace ptjob = usmv5564 if inrange(age , 55 , 64)  & sex == 1
                    replace ptjob = usfv5564 if inrange(age , 55 , 64)  & sex == 2
                    replace ptjob = usmv6599 if inrange(age , 65 , 999) & sex == 1
                    replace ptjob = usfv6599 if inrange(age , 65 , 999) & sex == 2
                    /*}}}*/
                    }
                /*}}}*/
                drop if missing(ptjob)
                replace ptjob = ptjob/100
                drop temp1
            /*변수 생성 : 모두나쁨*/
                gen temp1  = ln(ptjob) 
                bys hid : egen temp2 = total(temp1)
                gen aptjob = exp(temp2)
            /*변수 생성 : 나쁜사람 있음*/
                gen temp3  = 1 - ptjob
                gen temp4  = ln(temp3) 
                bys hid : egen temp5 = total(temp4)
                gen xptjob = 1 - exp(temp5)
        /*소득분위별 위험도 평균 계산*/
            keep if relation == 1000
            xtile dcgroup = emin [aw=hpopwgt], nq(10)
            forvalue i = 1/10 {
                summarize aptjob  [aw=hpopwgt] if dcgroup == `i' , meanonly
                local aptjobd`i' = r(mean)
                summarize xptjob  [aw=hpopwgt] if dcgroup == `i' , meanonly
                local xptjobd`i' = r(mean)
            }
        }
        /*결과 출력*/
            /*국가명 년도*/
                local cname = cname[1]
                local iso2 = iso2[1]
                local iso3 = iso3[1]
            if "`k'" == "fr" {
                di as text "cname,iso2,iso3,dcgroup,aptjob,xptjob"
            }
            forvalue i = 1/10 {
                di as text "`cname',`iso2',`iso3',`i',`aptjobd`i'',`xptjobd`i''"
            }
    }
