    local datalist fr se kr jp uk us
    /*코호트별 성별, 연령대별 실업률 2009~2018년 10년간 평균 *단위: %{{{*/
        /*예 : krfu2024 한국 20-24세 여성 실업률*/
        scalar frfu1519 = 33.6991
        scalar frfu2024 = 20.8979
        scalar frfu2529 = 12.9933
        scalar frfu3034 = 10.04
        scalar frfu3539 = 8.6916
        scalar frfu4044 = 7.7813
        scalar frfu4549 = 7.2341
        scalar frfu5054 = 6.4193
        scalar frfu5559 = 6.3803
        scalar frfu6064 = 5.4713
        scalar frfu6599 = 2.1327
        scalar frmu1519 = 29.1197
        scalar frmu2024 = 22.4877
        scalar frmu2529 = 13.1768
        scalar frmu3034 = 9.4813
        scalar frmu3539 = 7.8924
        scalar frmu4044 = 7.2871
        scalar frmu4549 = 6.8506
        scalar frmu5054 = 6.2032
        scalar frmu5559 = 7.2101
        scalar frmu6064 = 6.6647
        scalar frmu6599 = 2.3087
        scalar jpfu1519 = 5.4940
        scalar jpfu2024 = 6.0372
        scalar jpfu2529 = 4.9636
        scalar jpfu3034 = 4.2738
        scalar jpfu3539 = 3.8663
        scalar jpfu4044 = 3.5540
        scalar jpfu4549 = 3.1495
        scalar jpfu5054 = 2.8242
        scalar jpfu5559 = 2.5596
        scalar jpfu6064 = 2.8208
        scalar jpfu6599 = 1.1555
        scalar jpmu1519 = 7.0571
        scalar jpmu2024 = 7.4048
        scalar jpmu2529 = 6.0926
        scalar jpmu3034 = 4.3618
        scalar jpmu3539 = 3.5947
        scalar jpmu4044 = 3.2479
        scalar jpmu4549 = 3.1194
        scalar jpmu5054 = 3.1358
        scalar jpmu5559 = 3.6578
        scalar jpmu6064 = 4.8942
        scalar jpmu6599 = 2.7541
        scalar krfu1519 = 9.1974
        scalar krfu2024 = 9.2656
        scalar krfu2529 = 5.8779
        scalar krfu3034 = 3.4712
        scalar krfu3539 = 2.6508
        scalar krfu4044 = 2.5299
        scalar krfu4549 = 2.0606
        scalar krfu5054 = 1.8537
        scalar krfu5559 = 1.9269
        scalar krfu6064 = 1.7501
        scalar krfu6599 = 1.8870
        scalar krmu1519 = 11.4767
        scalar krmu2024 = 10.9416
        scalar krmu2529 = 9.4729
        scalar krmu3034 = 4.0281
        scalar krmu3539 = 2.7589
        scalar krmu4044 = 2.2699
        scalar krmu4549 = 2.1264
        scalar krmu5054 = 2.3415
        scalar krmu5559 = 2.7287
        scalar krmu6064 = 3.5472
        scalar krmu6599 = 2.4060
        scalar sefu1519 = 31.9983
        scalar sefu2024 = 15.2600
        scalar sefu2529 = 8.3800
        scalar sefu3034 = 6.4477
        scalar sefu3539 = 6.0534
        scalar sefu4044 = 4.9704
        scalar sefu4549 = 4.8731
        scalar sefu5054 = 4.2087
        scalar sefu5559 = 4.2431
        scalar sefu6064 = 4.6472
        scalar sefu6599 = 3.1275
        scalar semu1519 = 35.9745
        scalar semu2024 = 18.2728
        scalar semu2529 = 9.0582
        scalar semu3034 = 6.1586
        scalar semu3539 = 5.0978
        scalar semu4044 = 4.9128
        scalar semu4549 = 5.0658
        scalar semu5054 = 4.9447
        scalar semu5559 = 5.7331
        scalar semu6064 = 6.0905
        scalar semu6599 = 1.9078
        scalar ukfu1519 = 21.5234
        scalar ukfu2024 = 11.4214
        scalar ukfu2529 = 6.5183
        scalar ukfu3034 = 5.4726
        scalar ukfu3539 = 4.8752
        scalar ukfu4044 = 4.4841
        scalar ukfu4549 = 3.8960
        scalar ukfu5054 = 3.2678
        scalar ukfu5559 = 3.5292
        scalar ukfu6064 = 2.8049
        scalar ukfu6599 = 1.7387
        scalar ukmu1519 = 27.5711
        scalar ukmu2024 = 15.3014
        scalar ukmu2529 = 7.3308
        scalar ukmu3034 = 5.1294
        scalar ukmu3539 = 4.3360
        scalar ukmu4044 = 4.1211
        scalar ukmu4549 = 4.2547
        scalar ukmu5054 = 4.3700
        scalar ukmu5559 = 4.9712
        scalar ukmu6064 = 4.7933
        scalar ukmu6599 = 2.3247
        scalar usfu1519 = 17.7892
        scalar usfu2024 = 10.0754
        scalar usfu2529 = 7.2325
        scalar usfu3034 = 6.4040
        scalar usfu3539 = 5.7614
        scalar usfu4044 = 5.2438
        scalar usfu4549 = 5.0388
        scalar usfu5054 = 4.8127
        scalar usfu5559 = 4.5769
        scalar usfu6064 = 4.5858
        scalar usfu6599 = 4.9928
        scalar usmu1519 = 22.3088
        scalar usmu2024 = 12.7121
        scalar usmu2529 = 8.0745
        scalar usmu3034 = 6.4274
        scalar usmu3539 = 5.6328
        scalar usmu4044 = 5.3721
        scalar usmu4549 = 5.3123
        scalar usmu5054 = 5.3519
        scalar usmu5559 = 5.2233
        scalar usmu6064 = 5.3057
        scalar usmu6599 = 5.0702
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
                gen nhhmem1864 = nhhmem - nhhmem65 - nhhmem17
            /*변수 생성 : 균등화 소득*/
                gen ehhmen    = sqrt(nhhmem)
                gen emin      = min / ehhmen
            /*변수생성 : 집단별 실업률*/
                gen unemp = .
                /*입력받은 수치를 국가별 성별 연령별 집단에게 부여{{{*/
                    if "`k'" == "fr" {
                    /*{{{*/
                        replace unemp = frfu1519 if inrange(age , 15 , 19)  & sex == 2
                        replace unemp = frfu2024 if inrange(age , 20 , 24)  & sex == 2
                        replace unemp = frfu2529 if inrange(age , 25 , 29)  & sex == 2
                        replace unemp = frfu3034 if inrange(age , 30 , 34)  & sex == 2
                        replace unemp = frfu3539 if inrange(age , 35 , 39)  & sex == 2
                        replace unemp = frfu4044 if inrange(age , 40 , 44)  & sex == 2
                        replace unemp = frfu4549 if inrange(age , 45 , 49)  & sex == 2
                        replace unemp = frfu5054 if inrange(age , 50 , 54)  & sex == 2
                        replace unemp = frfu5559 if inrange(age , 55 , 59)  & sex == 2
                        replace unemp = frfu6064 if inrange(age , 60 , 64)  & sex == 2
                        replace unemp = frfu6599 if inrange(age , 65 , 999) & sex == 2
                        replace unemp = frmu1519 if inrange(age , 15 , 19)  & sex == 1
                        replace unemp = frmu2024 if inrange(age , 20 , 24)  & sex == 1
                        replace unemp = frmu2529 if inrange(age , 25 , 29)  & sex == 1
                        replace unemp = frmu3034 if inrange(age , 30 , 34)  & sex == 1
                        replace unemp = frmu3539 if inrange(age , 35 , 39)  & sex == 1
                        replace unemp = frmu4044 if inrange(age , 40 , 44)  & sex == 1
                        replace unemp = frmu4549 if inrange(age , 45 , 49)  & sex == 1
                        replace unemp = frmu5054 if inrange(age , 50 , 54)  & sex == 1
                        replace unemp = frmu5559 if inrange(age , 55 , 59)  & sex == 1
                        replace unemp = frmu6064 if inrange(age , 60 , 64)  & sex == 1
                        replace unemp = frmu6599 if inrange(age , 65 , 999) & sex == 1
                    /*}}}*/
                    }
                    else if "`k'" == "se" {
                    /*{{{*/
                        replace unemp = sefu1519 if inrange(age , 15 , 19)  & sex == 2
                        replace unemp = sefu2024 if inrange(age , 20 , 24)  & sex == 2
                        replace unemp = sefu2529 if inrange(age , 25 , 29)  & sex == 2
                        replace unemp = sefu3034 if inrange(age , 30 , 34)  & sex == 2
                        replace unemp = sefu3539 if inrange(age , 35 , 39)  & sex == 2
                        replace unemp = sefu4044 if inrange(age , 40 , 44)  & sex == 2
                        replace unemp = sefu4549 if inrange(age , 45 , 49)  & sex == 2
                        replace unemp = sefu5054 if inrange(age , 50 , 54)  & sex == 2
                        replace unemp = sefu5559 if inrange(age , 55 , 59)  & sex == 2
                        replace unemp = sefu6064 if inrange(age , 60 , 64)  & sex == 2
                        replace unemp = sefu6599 if inrange(age , 65 , 999) & sex == 2
                        replace unemp = semu1519 if inrange(age , 15 , 19)  & sex == 1
                        replace unemp = semu2024 if inrange(age , 20 , 24)  & sex == 1
                        replace unemp = semu2529 if inrange(age , 25 , 29)  & sex == 1
                        replace unemp = semu3034 if inrange(age , 30 , 34)  & sex == 1
                        replace unemp = semu3539 if inrange(age , 35 , 39)  & sex == 1
                        replace unemp = semu4044 if inrange(age , 40 , 44)  & sex == 1
                        replace unemp = semu4549 if inrange(age , 45 , 49)  & sex == 1
                        replace unemp = semu5054 if inrange(age , 50 , 54)  & sex == 1
                        replace unemp = semu5559 if inrange(age , 55 , 59)  & sex == 1
                        replace unemp = semu6064 if inrange(age , 60 , 64)  & sex == 1
                        replace unemp = semu6599 if inrange(age , 65 , 999) & sex == 1
                    /*}}}*/
                    }
                    else if "`k'" == "uk" {
                    /*{{{*/
                        replace unemp = ukfu1519 if inrange(age , 15 , 19)  & sex == 2
                        replace unemp = ukfu2024 if inrange(age , 20 , 24)  & sex == 2
                        replace unemp = ukfu2529 if inrange(age , 25 , 29)  & sex == 2
                        replace unemp = ukfu3034 if inrange(age , 30 , 34)  & sex == 2
                        replace unemp = ukfu3539 if inrange(age , 35 , 39)  & sex == 2
                        replace unemp = ukfu4044 if inrange(age , 40 , 44)  & sex == 2
                        replace unemp = ukfu4549 if inrange(age , 45 , 49)  & sex == 2
                        replace unemp = ukfu5054 if inrange(age , 50 , 54)  & sex == 2
                        replace unemp = ukfu5559 if inrange(age , 55 , 59)  & sex == 2
                        replace unemp = ukfu6064 if inrange(age , 60 , 64)  & sex == 2
                        replace unemp = ukfu6599 if inrange(age , 65 , 999) & sex == 2
                        replace unemp = ukmu1519 if inrange(age , 15 , 19)  & sex == 1
                        replace unemp = ukmu2024 if inrange(age , 20 , 24)  & sex == 1
                        replace unemp = ukmu2529 if inrange(age , 25 , 29)  & sex == 1
                        replace unemp = ukmu3034 if inrange(age , 30 , 34)  & sex == 1
                        replace unemp = ukmu3539 if inrange(age , 35 , 39)  & sex == 1
                        replace unemp = ukmu4044 if inrange(age , 40 , 44)  & sex == 1
                        replace unemp = ukmu4549 if inrange(age , 45 , 49)  & sex == 1
                        replace unemp = ukmu5054 if inrange(age , 50 , 54)  & sex == 1
                        replace unemp = ukmu5559 if inrange(age , 55 , 59)  & sex == 1
                        replace unemp = ukmu6064 if inrange(age , 60 , 64)  & sex == 1
                        replace unemp = ukmu6599 if inrange(age , 65 , 999) & sex == 1
                    /*}}}*/
                    }
                    else if "`k'" == "kr" {
                    /*{{{*/
                        replace unemp = krfu1519 if inrange(age , 15 , 19)  & sex == 2
                        replace unemp = krfu2024 if inrange(age , 20 , 24)  & sex == 2
                        replace unemp = krfu2529 if inrange(age , 25 , 29)  & sex == 2
                        replace unemp = krfu3034 if inrange(age , 30 , 34)  & sex == 2
                        replace unemp = krfu3539 if inrange(age , 35 , 39)  & sex == 2
                        replace unemp = krfu4044 if inrange(age , 40 , 44)  & sex == 2
                        replace unemp = krfu4549 if inrange(age , 45 , 49)  & sex == 2
                        replace unemp = krfu5054 if inrange(age , 50 , 54)  & sex == 2
                        replace unemp = krfu5559 if inrange(age , 55 , 59)  & sex == 2
                        replace unemp = krfu6064 if inrange(age , 60 , 64)  & sex == 2
                        replace unemp = krfu6599 if inrange(age , 65 , 999) & sex == 2
                        replace unemp = krmu1519 if inrange(age , 15 , 19)  & sex == 1
                        replace unemp = krmu2024 if inrange(age , 20 , 24)  & sex == 1
                        replace unemp = krmu2529 if inrange(age , 25 , 29)  & sex == 1
                        replace unemp = krmu3034 if inrange(age , 30 , 34)  & sex == 1
                        replace unemp = krmu3539 if inrange(age , 35 , 39)  & sex == 1
                        replace unemp = krmu4044 if inrange(age , 40 , 44)  & sex == 1
                        replace unemp = krmu4549 if inrange(age , 45 , 49)  & sex == 1
                        replace unemp = krmu5054 if inrange(age , 50 , 54)  & sex == 1
                        replace unemp = krmu5559 if inrange(age , 55 , 59)  & sex == 1
                        replace unemp = krmu6064 if inrange(age , 60 , 64)  & sex == 1
                        replace unemp = krmu6599 if inrange(age , 65 , 999) & sex == 1
                    /*}}}*/
                    }
                    else if "`k'" == "us" {
                    /*{{{*/
                        replace unemp = usfu1519 if inrange(age , 15 , 19)  & sex == 2
                        replace unemp = usfu2024 if inrange(age , 20 , 24)  & sex == 2
                        replace unemp = usfu2529 if inrange(age , 25 , 29)  & sex == 2
                        replace unemp = usfu3034 if inrange(age , 30 , 34)  & sex == 2
                        replace unemp = usfu3539 if inrange(age , 35 , 39)  & sex == 2
                        replace unemp = usfu4044 if inrange(age , 40 , 44)  & sex == 2
                        replace unemp = usfu4549 if inrange(age , 45 , 49)  & sex == 2
                        replace unemp = usfu5054 if inrange(age , 50 , 54)  & sex == 2
                        replace unemp = usfu5559 if inrange(age , 55 , 59)  & sex == 2
                        replace unemp = usfu6064 if inrange(age , 60 , 64)  & sex == 2
                        replace unemp = usfu6599 if inrange(age , 65 , 999) & sex == 2
                        replace unemp = usmu1519 if inrange(age , 15 , 19)  & sex == 1
                        replace unemp = usmu2024 if inrange(age , 20 , 24)  & sex == 1
                        replace unemp = usmu2529 if inrange(age , 25 , 29)  & sex == 1
                        replace unemp = usmu3034 if inrange(age , 30 , 34)  & sex == 1
                        replace unemp = usmu3539 if inrange(age , 35 , 39)  & sex == 1
                        replace unemp = usmu4044 if inrange(age , 40 , 44)  & sex == 1
                        replace unemp = usmu4549 if inrange(age , 45 , 49)  & sex == 1
                        replace unemp = usmu5054 if inrange(age , 50 , 54)  & sex == 1
                        replace unemp = usmu5559 if inrange(age , 55 , 59)  & sex == 1
                        replace unemp = usmu6064 if inrange(age , 60 , 64)  & sex == 1
                        replace unemp = usmu6599 if inrange(age , 65 , 999) & sex == 1
                    /*}}}*/
                    }
                    else if "`k'" == "jp" {
                    /*{{{*/
                        replace unemp = jpfu1519 if inrange(age , 15 , 19)  & sex == 2
                        replace unemp = jpfu2024 if inrange(age , 20 , 24)  & sex == 2
                        replace unemp = jpfu2529 if inrange(age , 25 , 29)  & sex == 2
                        replace unemp = jpfu3034 if inrange(age , 30 , 34)  & sex == 2
                        replace unemp = jpfu3539 if inrange(age , 35 , 39)  & sex == 2
                        replace unemp = jpfu4044 if inrange(age , 40 , 44)  & sex == 2
                        replace unemp = jpfu4549 if inrange(age , 45 , 49)  & sex == 2
                        replace unemp = jpfu5054 if inrange(age , 50 , 54)  & sex == 2
                        replace unemp = jpfu5559 if inrange(age , 55 , 59)  & sex == 2
                        replace unemp = jpfu6064 if inrange(age , 60 , 64)  & sex == 2
                        replace unemp = jpfu6599 if inrange(age , 65 , 999) & sex == 2
                        replace unemp = jpmu1519 if inrange(age , 15 , 19)  & sex == 1
                        replace unemp = jpmu2024 if inrange(age , 20 , 24)  & sex == 1
                        replace unemp = jpmu2529 if inrange(age , 25 , 29)  & sex == 1
                        replace unemp = jpmu3034 if inrange(age , 30 , 34)  & sex == 1
                        replace unemp = jpmu3539 if inrange(age , 35 , 39)  & sex == 1
                        replace unemp = jpmu4044 if inrange(age , 40 , 44)  & sex == 1
                        replace unemp = jpmu4549 if inrange(age , 45 , 49)  & sex == 1
                        replace unemp = jpmu5054 if inrange(age , 50 , 54)  & sex == 1
                        replace unemp = jpmu5559 if inrange(age , 55 , 59)  & sex == 1
                        replace unemp = jpmu6064 if inrange(age , 60 , 64)  & sex == 1
                        replace unemp = jpmu6599 if inrange(age , 65 , 999) & sex == 1
                    /*}}}*/
                    }
                /*}}}*/
                drop if missing(unemp)
                replace unemp = unemp/100
                drop temp1
            /*변수 생성 : 모두실업*/
                gen temp1  = ln(unemp) 
                bys hid : egen temp2 = total(temp1)
                gen aunemp = exp(temp2)
            /*변수 생성 : 실업있음*/
                gen temp3  = 1 - unemp
                gen temp4  = ln(temp3) 
                bys hid : egen temp5 = total(temp4)
                gen xunemp = 1 - exp(temp5)
        /*소득분위별 빈곤위험도 평균 계산*/
            keep if relation == 1000
            xtile dcgroup = emin [aw=hpopwgt], nq(10)
            forvalue i = 1/10 {
                summarize aunemp  [aw=hpopwgt] if dcgroup == `i' , meanonly
                local aunempd`i' = r(mean)
                summarize xunemp  [aw=hpopwgt] if dcgroup == `i' , meanonly
                local xunempd`i' = r(mean)
            }
        }
        /*결과 출력*/
            /*국가명 년도*/
                local cname = cname[1]
                local iso2 = iso2[1]
                local iso3 = iso3[1]
            if "`k'" == "fr" {
                di as text "cname,iso2,iso3,dcgroup,aunemp,xunemp"
            }
            forvalue i = 1/10 {
                di as text "`cname',`iso2',`iso3',`i',`aunempd`i'',`xunempd`i''"
            }
    }
