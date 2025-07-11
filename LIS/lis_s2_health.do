    local datalist fr se kr jp uk us
    /*나쁜건강 국가별 상이{{{*/
        /*유럽 2009-2018 10개년 평균*/
        scalar frmh1624 = 1.48
        scalar frfh1624 = 1.74
        scalar semh1624 = 2.00
        scalar sefh1624 = 1.93
        scalar ukmh1624 = 1.89
        scalar ukfh1624 = 2.24
        scalar frmh2534 = 2.40
        scalar frfh2534 = 2.68
        scalar semh2534 = 2.81
        scalar sefh2534 = 3.27
        scalar ukmh2534 = 2.59
        scalar ukfh2534 = 3.15
        scalar frmh3544 = 3.78
        scalar frfh3544 = 5.08
        scalar semh3544 = 2.72
        scalar sefh3544 = 5.08
        scalar ukmh3544 = 4.82
        scalar ukfh3544 = 5.18
        scalar frmh4554 = 7.00
        scalar frfh4554 = 8.34
        scalar semh4554 = 4.09
        scalar sefh4554 = 7.85
        scalar ukmh4554 = 7.53
        scalar ukfh4554 = 8.29
        scalar frmh5564 = 9.45
        scalar frfh5564 = 10.73
        scalar semh5564 = 5.72
        scalar sefh5564 = 8.34
        scalar ukmh5564 = 11.33
        scalar ukfh5564 = 10.22
        scalar frmh6599 = 18.39
        scalar frfh6599 = 19.65
        scalar semh6599 = 7.10
        scalar sefh6599 = 8.33
        scalar ukmh6599 = 12.87
        scalar ukfh6599 = 13.14
        /*일본 2007, 2010, 2013, 2016 4개년 평균*/
        scalar jpmh0609 = 1.54583959771375
        scalar jpfh0609 = 1.39412536331388
        scalar jpmh1014 = 2.58769323591735
        scalar jpfh1014 = 2.70703294193909
        scalar jpmh1519 = 4.27198946411184
        scalar jpfh1519 = 4.79763681535052
        scalar jpmh2024 = 5.66441296147314
        scalar jpfh2024 = 7.35577525259576
        scalar jpmh2529 = 7.07544075212125
        scalar jpfh2529 = 9.05561032580394
        scalar jpmh3034 = 7.95773159575809
        scalar jpfh3034 = 9.89535451469436
        scalar jpmh3539 = 8.66867551791789
        scalar jpfh3539 = 10.86886802686620
        scalar jpmh4044 = 9.32492875435358
        scalar jpfh4044 = 11.45805228569610
        scalar jpmh4549 = 10.57740513206120
        scalar jpfh4549 = 13.26214454968820
        scalar jpmh5054 = 11.34607864304990
        scalar jpfh5054 = 14.26203570107000
        scalar jpmh5559 = 12.85388706791140
        scalar jpfh5559 = 13.56326029750160
        scalar jpmh6064 = 13.71121311633790
        scalar jpfh6064 = 13.73477317270630
        scalar jpmh6599 = 21.70216097915450
        scalar jpfh6599 = 23.91201242743420
        /*한국 사회조사 2010, 12, 14, 16, 18 5개년 평균*/
        scalar krmh0014 = 0.2272
        scalar krfh0014 = 0.1583
        scalar krmh1519 = 3.0147
        scalar krfh1519 = 3.3752
        scalar krmh2024 = 4.2672
        scalar krfh2024 = 5.2606
        scalar krmh2529 = 4.0621
        scalar krfh2529 = 5.6739
        scalar krmh3034 = 5.8890
        scalar krfh3034 = 5.5262
        scalar krmh3539 = 6.6652
        scalar krfh3539 = 6.6100
        scalar krmh4044 = 7.6626
        scalar krfh4044 = 9.2097
        scalar krmh4549 = 9.7464
        scalar krfh4549 = 12.4363
        scalar krmh5054 = 12.6669
        scalar krfh5054 = 17.0596
        scalar krmh5559 = 16.7327
        scalar krfh5559 = 22.8564
        scalar krmh6064 = 21.1793
        scalar krfh6064 = 31.2565
        scalar krmh6599 = 37.5120
        scalar krfh6599 = 53.2992
        /*미국 2009-2018 10년간 평균 주관적 건강상태가 fair 또는 poor인 응답자 비율*/
        scalar usmh0005 = 1.34412181380564
        scalar usfh0005 = 1.43587818619436
        scalar usmh0617 = 1.93509328205812
        scalar usfh0617 = 2.06490671794188
        scalar usmh1824 = 3.72632868327130
        scalar usfh1824 = 3.97367131672870
        scalar usmh2544 = 6.86075235515809
        scalar usfh2544 = 7.31924764484192
        scalar usmh4554 = 13.0046433001660
        scalar usfh4554 = 13.8753566998340
        scalar usmh5564 = 18.1333267165388
        scalar usfh5564 = 19.3466732834612
        scalar usmh6599 = 22.0517214261255
        scalar usfh6599 = 23.5282785738745
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
            gen health = .
            /*입력받은 수치를 국가별 성별 연령별 집단에게 부여{{{*/
                if "`k'" == "fr" {
                /*{{{*/
                    replace health = frmh1624 if inrange(age , 16 , 24)  & sex == 1
                    replace health = frfh1624 if inrange(age , 16 , 24)  & sex == 2
                    replace health = frmh2534 if inrange(age , 25 , 34)  & sex == 1
                    replace health = frfh2534 if inrange(age , 25 , 34)  & sex == 2
                    replace health = frmh3544 if inrange(age , 35 , 44)  & sex == 1
                    replace health = frfh3544 if inrange(age , 35 , 44)  & sex == 2
                    replace health = frmh4554 if inrange(age , 45 , 54)  & sex == 1
                    replace health = frfh4554 if inrange(age , 45 , 54)  & sex == 2
                    replace health = frmh5564 if inrange(age , 55 , 64)  & sex == 1
                    replace health = frfh5564 if inrange(age , 55 , 64)  & sex == 2
                    replace health = frmh6599 if inrange(age , 65 , 999) & sex == 1
                    replace health = frfh6599 if inrange(age , 65 , 999) & sex == 2
                /*}}}*/
                }
                else if "`k'" == "jp" {
                /*{{{*/
                    replace health = jpfh0609 if inrange(age , 06 , 09)  & sex == 2
                    replace health = jpfh1014 if inrange(age , 10 , 14)  & sex == 2
                    replace health = jpfh1519 if inrange(age , 15 , 19)  & sex == 2
                    replace health = jpfh2024 if inrange(age , 20 , 24)  & sex == 2
                    replace health = jpfh2529 if inrange(age , 25 , 29)  & sex == 2
                    replace health = jpfh3034 if inrange(age , 30 , 34)  & sex == 2
                    replace health = jpfh3539 if inrange(age , 35 , 39)  & sex == 2
                    replace health = jpfh4044 if inrange(age , 40 , 44)  & sex == 2
                    replace health = jpfh4549 if inrange(age , 45 , 49)  & sex == 2
                    replace health = jpfh5054 if inrange(age , 50 , 54)  & sex == 2
                    replace health = jpfh5559 if inrange(age , 55 , 59)  & sex == 2
                    replace health = jpfh6064 if inrange(age , 60 , 64)  & sex == 2
                    replace health = jpfh6599 if inrange(age , 65 , 999)  & sex == 2
                    replace health = jpmh0609 if inrange(age , 06 , 09)  & sex == 1
                    replace health = jpmh1014 if inrange(age , 10 , 14)  & sex == 1
                    replace health = jpmh1519 if inrange(age , 15 , 19)  & sex == 1
                    replace health = jpmh2024 if inrange(age , 20 , 24)  & sex == 1
                    replace health = jpmh2529 if inrange(age , 25 , 29)  & sex == 1
                    replace health = jpmh3034 if inrange(age , 30 , 34)  & sex == 1
                    replace health = jpmh3539 if inrange(age , 35 , 39)  & sex == 1
                    replace health = jpmh4044 if inrange(age , 40 , 44)  & sex == 1
                    replace health = jpmh4549 if inrange(age , 45 , 49)  & sex == 1
                    replace health = jpmh5054 if inrange(age , 50 , 54)  & sex == 1
                    replace health = jpmh5559 if inrange(age , 55 , 59)  & sex == 1
                    replace health = jpmh6064 if inrange(age , 60 , 64)  & sex == 1
                    replace health = jpmh6599 if inrange(age , 65 , 999)  & sex == 1
                /*}}}*/
                }
                else if "`k'" == "kr" {
                /*{{{*/
                    replace health = krmh0014 if inrange(age , 00 , 14)  & sex == 1
                    replace health = krfh0014 if inrange(age , 00 , 14)  & sex == 2
                    replace health = krmh1519 if inrange(age , 15 , 19)  & sex == 1
                    replace health = krfh1519 if inrange(age , 15 , 19)  & sex == 2
                    replace health = krmh2024 if inrange(age , 20 , 24)  & sex == 1
                    replace health = krfh2024 if inrange(age , 20 , 24)  & sex == 2
                    replace health = krmh2529 if inrange(age , 25 , 29)  & sex == 1
                    replace health = krfh2529 if inrange(age , 25 , 29)  & sex == 2
                    replace health = krmh3034 if inrange(age , 30 , 34)  & sex == 1
                    replace health = krfh3034 if inrange(age , 30 , 34)  & sex == 2
                    replace health = krmh3539 if inrange(age , 35 , 39) & sex == 1
                    replace health = krfh3539 if inrange(age , 35 , 39) & sex == 2
                    replace health = krmh4044 if inrange(age , 40 , 44)  & sex == 1
                    replace health = krfh4044 if inrange(age , 40 , 44)  & sex == 2
                    replace health = krmh4549 if inrange(age , 45 , 49) & sex == 1
                    replace health = krfh4549 if inrange(age , 45 , 49) & sex == 2
                    replace health = krmh5054 if inrange(age , 50 , 54)  & sex == 1
                    replace health = krfh5054 if inrange(age , 50 , 54)  & sex == 2
                    replace health = krmh5559 if inrange(age , 55 , 59) & sex == 1
                    replace health = krfh5559 if inrange(age , 55 , 59) & sex == 2
                    replace health = krmh6064 if inrange(age , 60 , 64)  & sex == 1
                    replace health = krfh6064 if inrange(age , 60 , 64)  & sex == 2
                    replace health = krmh6599 if inrange(age , 65 , 999) & sex == 1
                    replace health = krfh6599 if inrange(age , 65 , 999) & sex == 2
                /*}}}*/
                }
                else if "`k'" == "se" {
                /*{{{*/
                    replace health = semh1624 if inrange(age , 16 , 24)  & sex == 1
                    replace health = sefh1624 if inrange(age , 16 , 24)  & sex == 2
                    replace health = semh2534 if inrange(age , 25 , 34)  & sex == 1
                    replace health = sefh2534 if inrange(age , 25 , 34)  & sex == 2
                    replace health = semh3544 if inrange(age , 35 , 44)  & sex == 1
                    replace health = sefh3544 if inrange(age , 35 , 44)  & sex == 2
                    replace health = semh4554 if inrange(age , 45 , 54)  & sex == 1
                    replace health = sefh4554 if inrange(age , 45 , 54)  & sex == 2
                    replace health = semh5564 if inrange(age , 55 , 64)  & sex == 1
                    replace health = sefh5564 if inrange(age , 55 , 64)  & sex == 2
                    replace health = semh6599 if inrange(age , 65 , 999) & sex == 1
                    replace health = sefh6599 if inrange(age , 65 , 999) & sex == 2
                /*}}}*/
                }
                else if "`k'" == "uk" {
                /*{{{*/
                    replace health = ukmh1624 if inrange(age , 16 , 24)  & sex == 1
                    replace health = ukfh1624 if inrange(age , 16 , 24)  & sex == 2
                    replace health = ukmh2534 if inrange(age , 25 , 34)  & sex == 1
                    replace health = ukfh2534 if inrange(age , 25 , 34)  & sex == 2
                    replace health = ukmh3544 if inrange(age , 35 , 44)  & sex == 1
                    replace health = ukfh3544 if inrange(age , 35 , 44)  & sex == 2
                    replace health = ukmh4554 if inrange(age , 45 , 54)  & sex == 1
                    replace health = ukfh4554 if inrange(age , 45 , 54)  & sex == 2
                    replace health = ukmh5564 if inrange(age , 55 , 64)  & sex == 1
                    replace health = ukfh5564 if inrange(age , 55 , 64)  & sex == 2
                    replace health = ukmh6599 if inrange(age , 65 , 999) & sex == 1
                    replace health = ukfh6599 if inrange(age , 65 , 999) & sex == 2
                /*}}}*/
                }
                else if "`k'" == "us" {
                /*{{{*/
                    replace health = usmh0005 if inrange(age , 00 , 05)  & sex == 1
                    replace health = usfh0005 if inrange(age , 00 , 05)  & sex == 2
                    replace health = usmh0617 if inrange(age , 06 , 17)  & sex == 1
                    replace health = usfh0617 if inrange(age , 06 , 17)  & sex == 2
                    replace health = usmh1824 if inrange(age , 18 , 24)  & sex == 1
                    replace health = usfh1824 if inrange(age , 18 , 24)  & sex == 2
                    replace health = usmh2544 if inrange(age , 25 , 44)  & sex == 1
                    replace health = usfh2544 if inrange(age , 25 , 44)  & sex == 2
                    replace health = usmh4554 if inrange(age , 45 , 54)  & sex == 1
                    replace health = usfh4554 if inrange(age , 45 , 54)  & sex == 2
                    replace health = usmh5564 if inrange(age , 55 , 64)  & sex == 1
                    replace health = usfh5564 if inrange(age , 55 , 64)  & sex == 2
                    replace health = usmh6599 if inrange(age , 65 , 999) & sex == 1
                    replace health = usfh6599 if inrange(age , 65 , 999) & sex == 2
                /*}}}*/
                }
            /*}}}*/
            replace health = health/100
            drop temp1
        /*변수 생성 : 모두나쁨*/
            gen temp1  = ln(health) 
            bys hid : egen temp2 = total(temp1)
            gen abhlth = exp(temp2)
        /*변수 생성 : 나쁜사람있음*/
            gen temp3  = 1 - health
            gen temp4  = ln(temp3) 
            bys hid : egen temp5 = total(temp4)
            gen xbhlth = 1 - exp(temp5)
        /*변수 생성 : 가중 분위수 집단*/
            keep if relation == 1000
            xtile dcgroup = emin [aw=hpopwgt], nq(10)
            xtile pcgroup = emin [aw=hpopwgt], nq(100)
        /*소득분위별 위험도 평균계산*/
            forvalue i = 1/10 {
                summarize abhlth  [aw=hpopwgt] if dcgroup == `i' , meanonly
                local abhlthd`i' = r(mean)
                summarize xbhlth  [aw=hpopwgt] if dcgroup == `i' , meanonly
                local xbhlthd`i' = r(mean)
            }
            forvalue i = 1/100 {
                summarize abhlth  [aw=hpopwgt] if pcgroup == `i' , meanonly
                local abhlthp`i' = r(mean)
                summarize xbhlth  [aw=hpopwgt] if pcgroup == `i' , meanonly
                local xbhlthp`i' = r(mean)
            }
        }
        /*결과 출력*/
            local cname = cname[1]
            local iso2 = iso2[1]
            local iso3 = iso3[1]
            if "`k'" == "fr" {
                di as text "cname,iso2,iso3,group,grtype,abhlth,xbhlth"
            }
            forvalue i = 1/10 {
                di as text "`cname',`iso2',`iso3',`i',1,`abhlthd`i'',`xbhlthd`i''"
            }
            forvalue i = 1/100 {
                di as text "`cname',`iso2',`iso3',`i',2,`abhlthp`i'',`xbhlthp`i''"
            }
    }
