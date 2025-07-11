    local datalist fr se kr jp uk us
    /*성별, 연령대별 고용률 2009~2018년 10년간 평균 단위: % {{{*/
        /*예 : krfe2024 한국 20-24세 여성 고용률*/
        scalar frfe1519 = 7.6789
        scalar frfe2024 = 45.0071
        scalar frfe2529 = 69.8718
        scalar frfe3034 = 72.5928
        scalar frfe3539 = 76.0998
        scalar frfe4044 = 78.7099
        scalar frfe4549 = 79.1084
        scalar frfe5054 = 75.8279
        scalar frfe5559 = 63.4956
        scalar frfe6064 = 23.2804
        scalar frfe6599 = 1.6985
        scalar frme1519 = 12.2998
        scalar frme2024 = 51.0702
        scalar frme2529 = 79.4649
        scalar frme3034 = 85.3187
        scalar frme3539 = 87.1739
        scalar frme4044 = 87.5980
        scalar frme4549 = 86.7412
        scalar frme5054 = 84.5620
        scalar frme5559 = 70.2800
        scalar frme6064 = 24.9126
        scalar frme6599 = 3.1314
        scalar jpfe1519 = 14.6186
        scalar jpfe2024 = 63.9015
        scalar jpfe2529 = 88.0342
        scalar jpfe3034 = 91.6307
        scalar jpfe3539 = 92.9532
        scalar jpfe4044 = 93.2577
        scalar jpfe4549 = 93.1522
        scalar jpfe5054 = 92.2505
        scalar jpfe5559 = 89.5150
        scalar jpfe6064 = 74.3281
        scalar jpfe6599 = 29.5733
        scalar jpme1519 = 15.6482
        scalar jpme2024 = 66.1866
        scalar jpme2529 = 75.5869
        scalar jpme3034 = 67.8361
        scalar jpme3539 = 67.1954
        scalar jpme4044 = 71.4645
        scalar jpme4549 = 74.6261
        scalar jpme5054 = 73.1254
        scalar jpme5559 = 65.6771
        scalar jpme6064 = 48.0206
        scalar jpme6599 = 14.4992
        scalar krfe1519 = 6.1005
        scalar krfe2024 = 39.0651
        scalar krfe2529 = 69.6843
        scalar krfe3034 = 88.3238
        scalar krfe3539 = 91.6678
        scalar krfe4044 = 92.3090
        scalar krfe4549 = 91.5390
        scalar krfe5054 = 88.9088
        scalar krfe5559 = 83.2880
        scalar krfe6064 = 70.5655
        scalar krfe6599 = 40.8423
        scalar krme1519 = 8.2738
        scalar krme2024 = 49.0904
        scalar krme2529 = 68.2103
        scalar krme3034 = 56.8871
        scalar krme3539 = 55.5084
        scalar krme4044 = 62.9904
        scalar krme4549 = 67.0612
        scalar krme5054 = 63.5269
        scalar krme5559 = 55.7670
        scalar krme6064 = 44.8177
        scalar krme6599 = 22.7363
        scalar sefe1519 = 18.6158
        scalar sefe2024 = 60.7147
        scalar sefe2529 = 80.5837
        scalar sefe3034 = 88.3495
        scalar sefe3539 = 90.5365
        scalar sefe4044 = 90.6535
        scalar sefe4549 = 89.4958
        scalar sefe5054 = 87.5833
        scalar sefe5559 = 84.3473
        scalar sefe6064 = 68.9585
        scalar sefe6599 = 19.2672
        scalar seme1519 = 24.9001
        scalar seme2024 = 58.9158
        scalar seme2529 = 75.1690
        scalar seme3034 = 81.3827
        scalar seme3539 = 84.0018
        scalar seme4044 = 86.3573
        scalar seme4549 = 85.8679
        scalar seme5054 = 83.9629
        scalar seme5559 = 80.2784
        scalar seme6064 = 62.1104
        scalar seme6599 = 11.1281
        scalar ukfe1519 = 36.3601
        scalar ukfe2024 = 61.8477
        scalar ukfe2529 = 72.6592
        scalar ukfe3034 = 72.9973
        scalar ukfe3539 = 74.2170
        scalar ukfe4044 = 76.9028
        scalar ukfe4549 = 79.0179
        scalar ukfe5054 = 77.1077
        scalar ukfe5559 = 67.2521
        scalar ukfe6064 = 38.9905
        scalar ukfe6599 = 6.8115
        scalar ukme1519 = 32.8862
        scalar ukme2024 = 65.8524
        scalar ukme2529 = 85.1634
        scalar ukme3034 = 88.9204
        scalar ukme3539 = 89.1866
        scalar ukme4044 = 88.5152
        scalar ukme4549 = 87.4308
        scalar ukme5054 = 84.3269
        scalar ukme5559 = 76.2591
        scalar ukme6064 = 56.7719
        scalar ukme6599 = 12.5145
        scalar usfe1519 = 28.9796
        scalar usfe2024 = 61.3465
        scalar usfe2529 = 69.5725
        scalar usfe3034 = 69.1027
        scalar usfe3539 = 69.7795
        scalar usfe4044 = 71.4806
        scalar usfe4549 = 72.0052
        scalar usfe5054 = 69.9449
        scalar usfe5559 = 63.9354
        scalar usfe6064 = 48.1063
        scalar usfe6599 = 14.0949
        scalar usme1519 = 26.8722
        scalar usme2024 = 64.6607
        scalar usme2529 = 80.6905
        scalar usme3034 = 84.8391
        scalar usme3539 = 86.0896
        scalar usme4044 = 85.6291
        scalar usme4549 = 83.4384
        scalar usme5054 = 80.0309
        scalar usme5559 = 73.8184
        scalar usme6064 = 57.9534
        scalar usme6599 = 22.0444
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
            gen employ = .
            /*입력받은 수치를 국가별 성별 연령별 집단에게 부여{{{*/
                if "`k'" == "fr" {
                /*{{{*/
                    replace employ = frfe1519 if inrange(age , 15 , 19)  & sex == 2
                    replace employ = frfe2024 if inrange(age , 20 , 24)  & sex == 2
                    replace employ = frfe2529 if inrange(age , 25 , 29)  & sex == 2
                    replace employ = frfe3034 if inrange(age , 30 , 34)  & sex == 2
                    replace employ = frfe3539 if inrange(age , 35 , 39)  & sex == 2
                    replace employ = frfe4044 if inrange(age , 40 , 44)  & sex == 2
                    replace employ = frfe4549 if inrange(age , 45 , 49)  & sex == 2
                    replace employ = frfe5054 if inrange(age , 50 , 54)  & sex == 2
                    replace employ = frfe5559 if inrange(age , 55 , 59)  & sex == 2
                    replace employ = frfe6064 if inrange(age , 60 , 64)  & sex == 2
                    replace employ = frfe6599 if inrange(age , 65 , 999) & sex == 2
                    replace employ = frme1519 if inrange(age , 15 , 19)  & sex == 1
                    replace employ = frme2024 if inrange(age , 20 , 24)  & sex == 1
                    replace employ = frme2529 if inrange(age , 25 , 29)  & sex == 1
                    replace employ = frme3034 if inrange(age , 30 , 34)  & sex == 1
                    replace employ = frme3539 if inrange(age , 35 , 39)  & sex == 1
                    replace employ = frme4044 if inrange(age , 40 , 44)  & sex == 1
                    replace employ = frme4549 if inrange(age , 45 , 49)  & sex == 1
                    replace employ = frme5054 if inrange(age , 50 , 54)  & sex == 1
                    replace employ = frme5559 if inrange(age , 55 , 59)  & sex == 1
                    replace employ = frme6064 if inrange(age , 60 , 64)  & sex == 1
                    replace employ = frme6599 if inrange(age , 65 , 999) & sex == 1
                /*}}}*/
                }
                else if "`k'" == "jp" {
                /*{{{*/
                    replace employ = jpfe1519 if inrange(age , 15 , 19)  & sex == 2
                    replace employ = jpfe2024 if inrange(age , 20 , 24)  & sex == 2
                    replace employ = jpfe2529 if inrange(age , 25 , 29)  & sex == 2
                    replace employ = jpfe3034 if inrange(age , 30 , 34)  & sex == 2
                    replace employ = jpfe3539 if inrange(age , 35 , 39)  & sex == 2
                    replace employ = jpfe4044 if inrange(age , 40 , 44)  & sex == 2
                    replace employ = jpfe4549 if inrange(age , 45 , 49)  & sex == 2
                    replace employ = jpfe5054 if inrange(age , 50 , 54)  & sex == 2
                    replace employ = jpfe5559 if inrange(age , 55 , 59)  & sex == 2
                    replace employ = jpfe6064 if inrange(age , 60 , 64)  & sex == 2
                    replace employ = jpfe6599 if inrange(age , 65 , 999) & sex == 2
                    replace employ = jpme1519 if inrange(age , 15 , 19)  & sex == 1
                    replace employ = jpme2024 if inrange(age , 20 , 24)  & sex == 1
                    replace employ = jpme2529 if inrange(age , 25 , 29)  & sex == 1
                    replace employ = jpme3034 if inrange(age , 30 , 34)  & sex == 1
                    replace employ = jpme3539 if inrange(age , 35 , 39)  & sex == 1
                    replace employ = jpme4044 if inrange(age , 40 , 44)  & sex == 1
                    replace employ = jpme4549 if inrange(age , 45 , 49)  & sex == 1
                    replace employ = jpme5054 if inrange(age , 50 , 54)  & sex == 1
                    replace employ = jpme5559 if inrange(age , 55 , 59)  & sex == 1
                    replace employ = jpme6064 if inrange(age , 60 , 64)  & sex == 1
                    replace employ = jpme6599 if inrange(age , 65 , 999) & sex == 1
                /*}}}*/
                }
                else if "`k'" == "kr" {
                /*{{{*/
                    replace employ = krfe1519 if inrange(age , 15 , 19)  & sex == 2
                    replace employ = krfe2024 if inrange(age , 20 , 24)  & sex == 2
                    replace employ = krfe2529 if inrange(age , 25 , 29)  & sex == 2
                    replace employ = krfe3034 if inrange(age , 30 , 34)  & sex == 2
                    replace employ = krfe3539 if inrange(age , 35 , 39)  & sex == 2
                    replace employ = krfe4044 if inrange(age , 40 , 44)  & sex == 2
                    replace employ = krfe4549 if inrange(age , 45 , 49)  & sex == 2
                    replace employ = krfe5054 if inrange(age , 50 , 54)  & sex == 2
                    replace employ = krfe5559 if inrange(age , 55 , 59)  & sex == 2
                    replace employ = krfe6064 if inrange(age , 60 , 64)  & sex == 2
                    replace employ = krfe6599 if inrange(age , 65 , 999) & sex == 2
                    replace employ = krme1519 if inrange(age , 15 , 19)  & sex == 1
                    replace employ = krme2024 if inrange(age , 20 , 24)  & sex == 1
                    replace employ = krme2529 if inrange(age , 25 , 29)  & sex == 1
                    replace employ = krme3034 if inrange(age , 30 , 34)  & sex == 1
                    replace employ = krme3539 if inrange(age , 35 , 39)  & sex == 1
                    replace employ = krme4044 if inrange(age , 40 , 44)  & sex == 1
                    replace employ = krme4549 if inrange(age , 45 , 49)  & sex == 1
                    replace employ = krme5054 if inrange(age , 50 , 54)  & sex == 1
                    replace employ = krme5559 if inrange(age , 55 , 59)  & sex == 1
                    replace employ = krme6064 if inrange(age , 60 , 64)  & sex == 1
                    replace employ = krme6599 if inrange(age , 65 , 999) & sex == 1
                /*}}}*/
                }
                else if "`k'" == "se" {
                /*{{{*/
                    replace employ = sefe1519 if inrange(age , 15 , 19)  & sex == 2
                    replace employ = sefe2024 if inrange(age , 20 , 24)  & sex == 2
                    replace employ = sefe2529 if inrange(age , 25 , 29)  & sex == 2
                    replace employ = sefe3034 if inrange(age , 30 , 34)  & sex == 2
                    replace employ = sefe3539 if inrange(age , 35 , 39)  & sex == 2
                    replace employ = sefe4044 if inrange(age , 40 , 44)  & sex == 2
                    replace employ = sefe4549 if inrange(age , 45 , 49)  & sex == 2
                    replace employ = sefe5054 if inrange(age , 50 , 54)  & sex == 2
                    replace employ = sefe5559 if inrange(age , 55 , 59)  & sex == 2
                    replace employ = sefe6064 if inrange(age , 60 , 64)  & sex == 2
                    replace employ = sefe6599 if inrange(age , 65 , 999) & sex == 2
                    replace employ = seme1519 if inrange(age , 15 , 19)  & sex == 1
                    replace employ = seme2024 if inrange(age , 20 , 24)  & sex == 1
                    replace employ = seme2529 if inrange(age , 25 , 29)  & sex == 1
                    replace employ = seme3034 if inrange(age , 30 , 34)  & sex == 1
                    replace employ = seme3539 if inrange(age , 35 , 39)  & sex == 1
                    replace employ = seme4044 if inrange(age , 40 , 44)  & sex == 1
                    replace employ = seme4549 if inrange(age , 45 , 49)  & sex == 1
                    replace employ = seme5054 if inrange(age , 50 , 54)  & sex == 1
                    replace employ = seme5559 if inrange(age , 55 , 59)  & sex == 1
                    replace employ = seme6064 if inrange(age , 60 , 64)  & sex == 1
                    replace employ = seme6599 if inrange(age , 65 , 999) & sex == 1
                /*}}}*/
                }
                else if "`k'" == "uk" {
                /*{{{*/
                    replace employ = ukfe1519 if inrange(age , 15 , 19)  & sex == 2
                    replace employ = ukfe2024 if inrange(age , 20 , 24)  & sex == 2
                    replace employ = ukfe2529 if inrange(age , 25 , 29)  & sex == 2
                    replace employ = ukfe3034 if inrange(age , 30 , 34)  & sex == 2
                    replace employ = ukfe3539 if inrange(age , 35 , 39)  & sex == 2
                    replace employ = ukfe4044 if inrange(age , 40 , 44)  & sex == 2
                    replace employ = ukfe4549 if inrange(age , 45 , 49)  & sex == 2
                    replace employ = ukfe5054 if inrange(age , 50 , 54)  & sex == 2
                    replace employ = ukfe5559 if inrange(age , 55 , 59)  & sex == 2
                    replace employ = ukfe6064 if inrange(age , 60 , 64)  & sex == 2
                    replace employ = ukfe6599 if inrange(age , 65 , 999) & sex == 2
                    replace employ = ukme1519 if inrange(age , 15 , 19)  & sex == 1
                    replace employ = ukme2024 if inrange(age , 20 , 24)  & sex == 1
                    replace employ = ukme2529 if inrange(age , 25 , 29)  & sex == 1
                    replace employ = ukme3034 if inrange(age , 30 , 34)  & sex == 1
                    replace employ = ukme3539 if inrange(age , 35 , 39)  & sex == 1
                    replace employ = ukme4044 if inrange(age , 40 , 44)  & sex == 1
                    replace employ = ukme4549 if inrange(age , 45 , 49)  & sex == 1
                    replace employ = ukme5054 if inrange(age , 50 , 54)  & sex == 1
                    replace employ = ukme5559 if inrange(age , 55 , 59)  & sex == 1
                    replace employ = ukme6064 if inrange(age , 60 , 64)  & sex == 1
                    replace employ = ukme6599 if inrange(age , 65 , 999) & sex == 1
                /*}}}*/
                }
                else if "`k'" == "us" {
                /*{{{*/
                    replace employ = usfe1519 if inrange(age , 15 , 19)  & sex == 2
                    replace employ = usfe2024 if inrange(age , 20 , 24)  & sex == 2
                    replace employ = usfe2529 if inrange(age , 25 , 29)  & sex == 2
                    replace employ = usfe3034 if inrange(age , 30 , 34)  & sex == 2
                    replace employ = usfe3539 if inrange(age , 35 , 39)  & sex == 2
                    replace employ = usfe4044 if inrange(age , 40 , 44)  & sex == 2
                    replace employ = usfe4549 if inrange(age , 45 , 49)  & sex == 2
                    replace employ = usfe5054 if inrange(age , 50 , 54)  & sex == 2
                    replace employ = usfe5559 if inrange(age , 55 , 59)  & sex == 2
                    replace employ = usfe6064 if inrange(age , 60 , 64)  & sex == 2
                    replace employ = usfe6599 if inrange(age , 65 , 999) & sex == 2
                    replace employ = usme1519 if inrange(age , 15 , 19)  & sex == 1
                    replace employ = usme2024 if inrange(age , 20 , 24)  & sex == 1
                    replace employ = usme2529 if inrange(age , 25 , 29)  & sex == 1
                    replace employ = usme3034 if inrange(age , 30 , 34)  & sex == 1
                    replace employ = usme3539 if inrange(age , 35 , 39)  & sex == 1
                    replace employ = usme4044 if inrange(age , 40 , 44)  & sex == 1
                    replace employ = usme4549 if inrange(age , 45 , 49)  & sex == 1
                    replace employ = usme5054 if inrange(age , 50 , 54)  & sex == 1
                    replace employ = usme5559 if inrange(age , 55 , 59)  & sex == 1
                    replace employ = usme6064 if inrange(age , 60 , 64)  & sex == 1
                    replace employ = usme6599 if inrange(age , 65 , 999) & sex == 1
                /*}}}*/
                }
            /*}}}*/
            gen noemp = 1 - employ/100
            drop temp1
        /*변수 생성 : 모두미취업*/
            gen temp1  = ln(noemp) 
            bys hid : egen temp2 = total(temp1)
            gen anoemp = exp(temp2)
        /*변수 생성 : 미취업있음*/
            gen temp3  = 1 - noemp
            gen temp4  = ln(temp3) 
            bys hid : egen temp5 = total(temp4)
            gen xnoemp = 1 - exp(temp5)
        /*변수 생성 : 가중 분위수 집단*/
            keep if relation == 1000
            xtile dcgroup = emin [aw=hpopwgt], nq(10)
            xtile pcgroup = emin [aw=hpopwgt], nq(100)
        /*소득분위별 위험도 평균계산*/
            forvalue i = 1/10 {
                summarize anoemp  [aw=hpopwgt] if dcgroup == `i' , meanonly
                local anoempd`i' = r(mean)
                summarize xnoemp  [aw=hpopwgt] if dcgroup == `i' , meanonly
                local xnoempd`i' = r(mean)
            }
            forvalue i = 1/100 {
                summarize anoemp  [aw=hpopwgt] if pcgroup == `i' , meanonly
                local anoempp`i' = r(mean)
                summarize xnoemp  [aw=hpopwgt] if pcgroup == `i' , meanonly
                local xnoempp`i' = r(mean)
            }
        }
        /*결과 출력*/
            local cname = cname[1]
            local iso2 = iso2[1]
            local iso3 = iso3[1]
            if "`k'" == "fr" {
                di as text "cname,iso2,iso3,group,grtype,anoemp,xnoemp"
            }
            forvalue i = 1/10 {
                di as text "`cname',`iso2',`iso3',`i',1,`anoempd`i'',`xnoempd`i''"
            }
            forvalue i = 1/100 {
                di as text "`cname',`iso2',`iso3',`i',2,`anoempp`i'',`xnoempp`i''"
            }
    }
