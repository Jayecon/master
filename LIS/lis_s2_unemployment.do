    local datalist fr se kr jp uk us
        /*코호트별 성별, 연령대별 실업률 2009~2018년 10년간 평균 *단위: %{{{*/
            /*예 : krfu2024 한국 20-24세 여성 실업률*/
            scalar frfu1519 = 3.908951187
            scalar frfu2024 = 11.875231056
            scalar frfu2529 = 10.431302297
            scalar frfu3034 = 8.101644173
            scalar frfu3539 = 7.243635937
            scalar frfu4044 = 6.641109127
            scalar frfu4549 = 6.168259056
            scalar frfu5054 = 5.204677247
            scalar frfu5559 = 4.339535160
            scalar frfu6064 = 1.393997599
            scalar frfu6599 = 0.038284294
            scalar frmu1519 = 5.032558904
            scalar frmu2024 = 14.814230286
            scalar frmu2529 = 12.056956691
            scalar frmu3034 = 8.934188966
            scalar frmu3539 = 7.468146442
            scalar frmu4044 = 6.884069826
            scalar frmu4549 = 6.371975153
            scalar frmu5054 = 5.591450798
            scalar frmu5559 = 5.489551510
            scalar frmu6064 = 1.850348477
            scalar frmu6599 = 0.074374889
            scalar jpfu1519 = 0.889630264
            scalar jpfu2024 = 4.229806256
            scalar jpfu2529 = 3.927955091
            scalar jpfu3034 = 3.000587695
            scalar jpfu3539 = 2.673367565
            scalar jpfu4044 = 2.608023321
            scalar jpfu4549 = 2.417166486
            scalar jpfu5054 = 2.113157363
            scalar jpfu5559 = 1.710542252
            scalar jpfu6064 = 1.372600869
            scalar jpfu6599 = 0.168896189
            scalar jpmu1519 = 1.074091660
            scalar jpmu2024 = 5.071661078
            scalar jpmu2529 = 5.712458601
            scalar jpmu3034 = 4.180587320
            scalar jpmu3539 = 3.467456737
            scalar jpmu4044 = 3.131950819
            scalar jpmu4549 = 3.001328900
            scalar jpmu5054 = 2.988093116
            scalar jpmu5559 = 3.395420747
            scalar jpmu6064 = 3.791381374
            scalar jpmu6599 = 0.831747858
            scalar krfu1519 = 0.835039742
            scalar krfu2024 = 5.024797787
            scalar krfu2529 = 4.280903767
            scalar krfu3034 = 2.053749160
            scalar krfu3539 = 1.511367456
            scalar krfu4044 = 1.634895694
            scalar krfu4549 = 1.413395193
            scalar krfu5054 = 1.204121191
            scalar krfu5559 = 1.102333423
            scalar krfu6064 = 0.795804230
            scalar krfu6599 = 0.439646793
            scalar krmu1519 = 0.772241247
            scalar krmu2024 = 4.804209592
            scalar krmu2529 = 7.295020407
            scalar krmu3034 = 3.704995340
            scalar krmu3539 = 2.599939308
            scalar krmu4044 = 2.143588736
            scalar krmu4549 = 1.988076616
            scalar krmu5054 = 2.130348845
            scalar krmu5559 = 2.335320449
            scalar krmu6064 = 2.600171191
            scalar krmu6599 = 1.006220317
            scalar sefu1519 = 11.662318413
            scalar sefu2024 = 10.596789587
            scalar sefu2529 = 6.868328090
            scalar sefu3034 = 5.606936079
            scalar sefu3539 = 5.411771785
            scalar sefu4044 = 4.514332684
            scalar sefu4549 = 4.390832365
            scalar sefu5054 = 3.684165120
            scalar sefu5559 = 3.554602430
            scalar sefu6064 = 3.018547808
            scalar sefu6599 = 0.360853449
            scalar semu1519 = 10.428136232
            scalar semu2024 = 13.591092456
            scalar semu2529 = 8.031279582
            scalar semu3034 = 5.798753630
            scalar semu3539 = 4.862275061
            scalar semu4044 = 4.683334657
            scalar semu4549 = 4.772620745
            scalar semu5054 = 4.549934861
            scalar semu5559 = 5.126115211
            scalar semu6064 = 4.468835352
            scalar semu6599 = 0.379164567
            scalar ukfu1519 = 10.038748928
            scalar ukfu2024 = 7.946265187
            scalar ukfu2529 = 5.043770604
            scalar ukfu3034 = 4.214227357
            scalar ukfu3539 = 3.792663782
            scalar ukfu4044 = 3.605680505
            scalar ukfu4549 = 3.199824891
            scalar ukfu5054 = 2.602627668
            scalar ukfu5559 = 2.454607587
            scalar ukfu6064 = 1.145755869
            scalar ukfu6599 = 0.120902173
            scalar ukmu1519 = 12.635397616
            scalar ukmu2024 = 11.934262472
            scalar ukmu2529 = 6.735666109
            scalar ukmu3034 = 4.806694173
            scalar ukmu3539 = 4.038376216
            scalar ukmu4044 = 3.801010483
            scalar ukmu4549 = 3.882064001
            scalar ukmu5054 = 3.847435836
            scalar ukmu5559 = 3.981827815
            scalar ukmu6064 = 2.846767102
            scalar ukmu6599 = 0.292062787
            scalar usfu1519 = 6.263673827
            scalar usfu2024 = 6.868306644
            scalar usfu2529 = 5.414742245
            scalar usfu3034 = 4.725152422
            scalar usfu3539 = 4.265124237
            scalar usfu4044 = 3.960839027
            scalar usfu4549 = 3.826685103
            scalar usfu5054 = 3.544558404
            scalar usfu5559 = 3.077932942
            scalar usfu6064 = 2.308569304
            scalar usfu6599 = 0.731550183
            scalar usmu1519 = 7.728743894
            scalar usmu2024 = 9.444337739
            scalar usmu2529 = 7.098962202
            scalar usmu3034 = 5.836306562
            scalar usmu3539 = 5.150355690
            scalar usmu4044 = 4.862875009
            scalar usmu4549 = 4.682795110
            scalar usmu5054 = 4.530512606
            scalar usmu5559 = 4.071122277
            scalar usmu6064 = 3.228427267
            scalar usmu6599 = 1.168823749
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
        /*변수 생성 : 가중 분위수 집단*/
            keep if relation == 1000
            xtile dcgroup = emin [aw=hpopwgt], nq(10)
            xtile pcgroup = emin [aw=hpopwgt], nq(100)
        /*소득분위별 빈곤위험도 평균 계산*/
            forvalue i = 1/10 {
                summarize aunemp  [aw=hpopwgt] if dcgroup == `i' , meanonly
                local aunempd`i' = r(mean)
                summarize xunemp  [aw=hpopwgt] if dcgroup == `i' , meanonly
                local xunempd`i' = r(mean)
            }
            forvalue i = 1/100 {
                summarize aunemp  [aw=hpopwgt] if pcgroup == `i' , meanonly
                local aunempp`i' = r(mean)
                summarize xunemp  [aw=hpopwgt] if pcgroup == `i' , meanonly
                local xunempp`i' = r(mean)
            }
        }
        /*결과 출력*/
            local cname = cname[1]
            local iso2 = iso2[1]
            local iso3 = iso3[1]
            if "`k'" == "fr" {
                di as text "cname,iso2,iso3,group,grtype,aunemp,xunemp"
            }
            forvalue i = 1/10 {
                di as text "`cname',`iso2',`iso3',`i',1,`aunempd`i'',`xunempd`i''"
            }
            forvalue i = 1/100 {
                di as text "`cname',`iso2',`iso3',`i',2,`aunempp`i'',`xunempp`i''"
            }
    }
