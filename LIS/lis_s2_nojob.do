    local datalist fr se kr jp uk us
    /*코호트별 변수 수치{{{*/
        /*성별, 연령대별 실업률 2009~2018년 10년간 평균 *단위: %{{{*/
            /*예 : krfu2024 한국 20-24세 여성 실업률*/
            scalar frfu1519 = 33.6991
            scalar frmu1519 = 29.1197
            scalar jpfu1519 = 5.4940
            scalar jpmu1519 = 7.0571
            scalar krfu1519 = 9.1974
            scalar krmu1519 = 11.4767
            scalar sefu1519 = 31.9983
            scalar semu1519 = 35.9745
            scalar ukfu1519 = 21.5234
            scalar ukmu1519 = 27.5711
            scalar usfu1519 = 17.7892
            scalar usmu1519 = 22.3088
            scalar frfu2024 = 20.8979
            scalar frmu2024 = 22.4877
            scalar jpfu2024 = 6.0372
            scalar jpmu2024 = 7.4048
            scalar krfu2024 = 9.2656
            scalar krmu2024 = 10.9416
            scalar sefu2024 = 15.2600
            scalar semu2024 = 18.2728
            scalar ukfu2024 = 11.4214
            scalar ukmu2024 = 15.3014
            scalar usfu2024 = 10.0754
            scalar usmu2024 = 12.7121
            scalar frfu2529 = 12.9933
            scalar frmu2529 = 13.1768
            scalar jpfu2529 = 4.9636
            scalar jpmu2529 = 6.0926
            scalar krfu2529 = 5.8779
            scalar krmu2529 = 9.4729
            scalar sefu2529 = 8.3800
            scalar semu2529 = 9.0582
            scalar ukfu2529 = 6.5183
            scalar ukmu2529 = 7.3308
            scalar usfu2529 = 7.2325
            scalar usmu2529 = 8.0745
            scalar frfu3034 = 10.04
            scalar frmu3034 = 9.4813
            scalar jpfu3034 = 4.2738
            scalar jpmu3034 = 4.3618
            scalar krfu3034 = 3.4712
            scalar krmu3034 = 4.0281
            scalar sefu3034 = 6.4477
            scalar semu3034 = 6.1586
            scalar ukfu3034 = 5.4726
            scalar ukmu3034 = 5.1294
            scalar usfu3034 = 6.4040
            scalar usmu3034 = 6.4274
            scalar frfu3539 = 8.6916
            scalar frmu3539 = 7.8924
            scalar jpfu3539 = 3.8663
            scalar jpmu3539 = 3.5947
            scalar krfu3539 = 2.6508
            scalar krmu3539 = 2.7589
            scalar sefu3539 = 6.0534
            scalar semu3539 = 5.0978
            scalar ukfu3539 = 4.8752
            scalar ukmu3539 = 4.3360
            scalar usfu3539 = 5.7614
            scalar usmu3539 = 5.6328
            scalar frfu4044 = 7.7813
            scalar frmu4044 = 7.2871
            scalar jpfu4044 = 3.5540
            scalar jpmu4044 = 3.2479
            scalar krfu4044 = 2.5299
            scalar krmu4044 = 2.2699
            scalar sefu4044 = 4.9704
            scalar semu4044 = 4.9128
            scalar ukfu4044 = 4.4841
            scalar ukmu4044 = 4.1211
            scalar usfu4044 = 5.2438
            scalar usmu4044 = 5.3721
            scalar frfu4549 = 7.2341
            scalar frmu4549 = 6.8506
            scalar jpfu4549 = 3.1495
            scalar jpmu4549 = 3.1194
            scalar krfu4549 = 2.0606
            scalar krmu4549 = 2.1264
            scalar sefu4549 = 4.8731
            scalar semu4549 = 5.0658
            scalar ukfu4549 = 3.8960
            scalar ukmu4549 = 4.2547
            scalar usfu4549 = 5.0388
            scalar usmu4549 = 5.3123
            scalar frfu5054 = 6.4193
            scalar frmu5054 = 6.2032
            scalar jpfu5054 = 2.8242
            scalar jpmu5054 = 3.1358
            scalar krfu5054 = 1.8537
            scalar krmu5054 = 2.3415
            scalar sefu5054 = 4.2087
            scalar semu5054 = 4.9447
            scalar ukfu5054 = 3.2678
            scalar ukmu5054 = 4.3700
            scalar usfu5054 = 4.8127
            scalar usmu5054 = 5.3519
            scalar frfu5559 = 6.3803
            scalar frmu5559 = 7.2101
            scalar jpfu5559 = 2.5596
            scalar jpmu5559 = 3.6578
            scalar krfu5559 = 1.9269
            scalar krmu5559 = 2.7287
            scalar sefu5559 = 4.2431
            scalar semu5559 = 5.7331
            scalar ukfu5559 = 3.5292
            scalar ukmu5559 = 4.9712
            scalar usfu5559 = 4.5769
            scalar usmu5559 = 5.2233
            scalar frfu6064 = 5.4713
            scalar frmu6064 = 6.6647
            scalar jpfu6064 = 2.8208
            scalar jpmu6064 = 4.8942
            scalar krfu6064 = 1.7501
            scalar krmu6064 = 3.5472
            scalar sefu6064 = 4.6472
            scalar semu6064 = 6.0905
            scalar ukfu6064 = 2.8049
            scalar ukmu6064 = 4.7933
            scalar usfu6064 = 4.5858
            scalar usmu6064 = 5.3057
            scalar frfu6599 = 2.1327
            scalar frmu6599 = 2.3087
            scalar jpfu6599 = 1.1555
            scalar jpmu6599 = 2.7541
            scalar krfu6599 = 1.8870
            scalar krmu6599 = 2.4060
            scalar sefu6599 = 3.1275
            scalar semu6599 = 1.9078
            scalar ukfu6599 = 1.7387
            scalar ukmu6599 = 2.3247
            scalar usfu6599 = 4.9928
            scalar usmu6599 = 5.0702
        /*}}}*/
        /*성별, 연령대별 고용률 2009~2018년 10년간 평균 단위: % {{{*/
            /*예 : krfe2024 한국 20-24세 여성 고용률*/
            scalar frfe1519 = 7.6789
            scalar frme1519 = 12.2998
            scalar jpfe1519 = 14.6186
            scalar jpme1519 = 15.6482
            scalar krfe1519 = 6.1005
            scalar krme1519 = 8.2738
            scalar sefe1519 = 18.6158
            scalar seme1519 = 24.9001
            scalar ukfe1519 = 36.3601
            scalar ukme1519 = 32.8862
            scalar usfe1519 = 28.9796
            scalar usme1519 = 26.8722
            scalar frfe2024 = 45.0071
            scalar frme2024 = 51.0702
            scalar jpfe2024 = 63.9015
            scalar jpme2024 = 66.1866
            scalar krfe2024 = 39.0651
            scalar krme2024 = 49.0904
            scalar sefe2024 = 60.7147
            scalar seme2024 = 58.9158
            scalar ukfe2024 = 61.8477
            scalar ukme2024 = 65.8524
            scalar usfe2024 = 61.3465
            scalar usme2024 = 64.6607
            scalar frfe2529 = 69.8718
            scalar frme2529 = 79.4649
            scalar jpfe2529 = 88.0342
            scalar jpme2529 = 75.5869
            scalar krfe2529 = 69.6843
            scalar krme2529 = 68.2103
            scalar sefe2529 = 80.5837
            scalar seme2529 = 75.1690
            scalar ukfe2529 = 72.6592
            scalar ukme2529 = 85.1634
            scalar usfe2529 = 69.5725
            scalar usme2529 = 80.6905
            scalar frfe3034 = 72.5928
            scalar frme3034 = 85.3187
            scalar jpfe3034 = 91.6307
            scalar jpme3034 = 67.8361
            scalar krfe3034 = 88.3238
            scalar krme3034 = 56.8871
            scalar sefe3034 = 88.3495
            scalar seme3034 = 81.3827
            scalar ukfe3034 = 72.9973
            scalar ukme3034 = 88.9204
            scalar usfe3034 = 69.1027
            scalar usme3034 = 84.8391
            scalar frfe3539 = 76.0998
            scalar frme3539 = 87.1739
            scalar jpfe3539 = 92.9532
            scalar jpme3539 = 67.1954
            scalar krfe3539 = 91.6678
            scalar krme3539 = 55.5084
            scalar sefe3539 = 90.5365
            scalar seme3539 = 84.0018
            scalar ukfe3539 = 74.2170
            scalar ukme3539 = 89.1866
            scalar usfe3539 = 69.7795
            scalar usme3539 = 86.0896
            scalar frfe4044 = 78.7099
            scalar frme4044 = 87.5980
            scalar jpfe4044 = 93.2577
            scalar jpme4044 = 71.4645
            scalar krfe4044 = 92.3090
            scalar krme4044 = 62.9904
            scalar sefe4044 = 90.6535
            scalar seme4044 = 86.3573
            scalar ukfe4044 = 76.9028
            scalar ukme4044 = 88.5152
            scalar usfe4044 = 71.4806
            scalar usme4044 = 85.6291
            scalar frfe4549 = 79.1084
            scalar frme4549 = 86.7412
            scalar jpfe4549 = 93.1522
            scalar jpme4549 = 74.6261
            scalar krfe4549 = 91.5390
            scalar krme4549 = 67.0612
            scalar sefe4549 = 89.4958
            scalar seme4549 = 85.8679
            scalar ukfe4549 = 79.0179
            scalar ukme4549 = 87.4308
            scalar usfe4549 = 72.0052
            scalar usme4549 = 83.4384
            scalar frfe5054 = 75.8279
            scalar frme5054 = 84.5620
            scalar jpfe5054 = 92.2505
            scalar jpme5054 = 73.1254
            scalar krfe5054 = 88.9088
            scalar krme5054 = 63.5269
            scalar sefe5054 = 87.5833
            scalar seme5054 = 83.9629
            scalar ukfe5054 = 77.1077
            scalar ukme5054 = 84.3269
            scalar usfe5054 = 69.9449
            scalar usme5054 = 80.0309
            scalar frfe5559 = 63.4956
            scalar frme5559 = 70.2800
            scalar jpfe5559 = 89.5150
            scalar jpme5559 = 65.6771
            scalar krfe5559 = 83.2880
            scalar krme5559 = 55.7670
            scalar sefe5559 = 84.3473
            scalar seme5559 = 80.2784
            scalar ukfe5559 = 67.2521
            scalar ukme5559 = 76.2591
            scalar usfe5559 = 63.9354
            scalar usme5559 = 73.8184
            scalar frfe6064 = 23.2804
            scalar frme6064 = 24.9126
            scalar jpfe6064 = 74.3281
            scalar jpme6064 = 48.0206
            scalar krfe6064 = 70.5655
            scalar krme6064 = 44.8177
            scalar sefe6064 = 68.9585
            scalar seme6064 = 62.1104
            scalar ukfe6064 = 38.9905
            scalar ukme6064 = 56.7719
            scalar usfe6064 = 48.1063
            scalar usme6064 = 57.9534
            scalar frfe6599 = 1.6985
            scalar frme6599 = 3.1314
            scalar jpfe6599 = 29.5733
            scalar jpme6599 = 14.4992
            scalar krfe6599 = 40.8423
            scalar krme6599 = 22.7363
            scalar sefe6599 = 19.2672
            scalar seme6599 = 11.1281
            scalar ukfe6599 = 6.8115
            scalar ukme6599 = 12.5145
            scalar usfe6599 = 14.0949
            scalar usme6599 = 22.0444
        /*}}}*/
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
    /*}}}*/
        }
    foreach k of local datalist {
        /*qui {*/
        /*자료호출*/
            use $`k'19h, clear
            merge 1:m hid using $`k'19p, nogen 
        /*변수조작*/
            /*변수 생성*/
                gen min     = hitotal - hpublic
                capture drop pwgt
                gen pwgt    = hpopwgt * nhhmem
                gen nhhmem1864 = nhhmem - nhhmem65 - nhhmem17
            /*변수 생성 : 균등화 소득*/
                gen ehhmen    = sqrt(nhhmem)
                gen emin      = min / ehhmen
            /*변수생성*/
                gen unemp = .
                gen emplo = .
                gen isolt = .
                gen tmpjb = .
                gen health = .
            /*입력받은 수치를 국가별 성별 연령별 집단에게 부여{{{*/
                if "`k'" == "fr" {
                /*{{{*/
                    replace unemp = frmu1519 if inrange(age , 15 , 19)  & sex == 1
                    replace unemp = frfu1519 if inrange(age , 15 , 19)  & sex == 2
                    replace unemp = frmu2024 if inrange(age , 20 , 24)  & sex == 1
                    replace unemp = frfu2024 if inrange(age , 20 , 24)  & sex == 2
                    replace unemp = frmu2529 if inrange(age , 25 , 29)  & sex == 1
                    replace unemp = frfu2529 if inrange(age , 25 , 29)  & sex == 2
                    replace unemp = frmu3034 if inrange(age , 30 , 34)  & sex == 1
                    replace unemp = frfu3034 if inrange(age , 30 , 34)  & sex == 2
                    replace unemp = frmu3539 if inrange(age , 35 , 39)  & sex == 1
                    replace unemp = frfu3539 if inrange(age , 35 , 39)  & sex == 2
                    replace unemp = frmu4044 if inrange(age , 40 , 44)  & sex == 1
                    replace unemp = frfu4044 if inrange(age , 40 , 44)  & sex == 2
                    replace unemp = frmu4549 if inrange(age , 45 , 49)  & sex == 1
                    replace unemp = frfu4549 if inrange(age , 45 , 49)  & sex == 2
                    replace unemp = frmu5054 if inrange(age , 50 , 54)  & sex == 1
                    replace unemp = frfu5054 if inrange(age , 50 , 54)  & sex == 2
                    replace unemp = frmu5559 if inrange(age , 55 , 59)  & sex == 1
                    replace unemp = frfu5559 if inrange(age , 55 , 59)  & sex == 2
                    replace unemp = frmu6064 if inrange(age , 60 , 64)  & sex == 1
                    replace unemp = frfu6064 if inrange(age , 60 , 64)  & sex == 2
                    replace unemp = frmu6599 if inrange(age , 65 , 999) & sex == 1
                    replace unemp = frfu6599 if inrange(age , 65 , 999) & sex == 2
                    replace emplo = frme1519 if inrange(age , 15 , 19)  & sex == 1
                    replace emplo = frfe1519 if inrange(age , 15 , 19)  & sex == 2
                    replace emplo = frme2024 if inrange(age , 20 , 24)  & sex == 1
                    replace emplo = frfe2024 if inrange(age , 20 , 24)  & sex == 2
                    replace emplo = frme2529 if inrange(age , 25 , 29)  & sex == 1
                    replace emplo = frfe2529 if inrange(age , 25 , 29)  & sex == 2
                    replace emplo = frme3034 if inrange(age , 30 , 34)  & sex == 1
                    replace emplo = frfe3034 if inrange(age , 30 , 34)  & sex == 2
                    replace emplo = frme3539 if inrange(age , 35 , 39)  & sex == 1
                    replace emplo = frfe3539 if inrange(age , 35 , 39)  & sex == 2
                    replace emplo = frme4044 if inrange(age , 40 , 44)  & sex == 1
                    replace emplo = frfe4044 if inrange(age , 40 , 44)  & sex == 2
                    replace emplo = frme4549 if inrange(age , 45 , 49)  & sex == 1
                    replace emplo = frfe4549 if inrange(age , 45 , 49)  & sex == 2
                    replace emplo = frme5054 if inrange(age , 50 , 54)  & sex == 1
                    replace emplo = frfe5054 if inrange(age , 50 , 54)  & sex == 2
                    replace emplo = frme5559 if inrange(age , 55 , 59)  & sex == 1
                    replace emplo = frfe5559 if inrange(age , 55 , 59)  & sex == 2
                    replace emplo = frme6064 if inrange(age , 60 , 64)  & sex == 1
                    replace emplo = frfe6064 if inrange(age , 60 , 64)  & sex == 2
                    replace emplo = frme6599 if inrange(age , 65 , 999) & sex == 1
                    replace emplo = frfe6599 if inrange(age , 65 , 999) & sex == 2
                    replace isolt = frms1529 if inrange(age , 15 , 29)  & sex == 1
                    replace isolt = frfs1529 if inrange(age , 15 , 29)  & sex == 2
                    replace isolt = frms3049 if inrange(age , 30 , 44)  & sex == 1
                    replace isolt = frfs3049 if inrange(age , 30 , 44)  & sex == 2
                    replace isolt = frms5099 if inrange(age , 50 , 999) & sex == 1
                    replace isolt = frfs5099 if inrange(age , 50 , 999) & sex == 2
                    replace isolt = frmv1524 if inrange(age , 15 , 24)  & sex == 1
                    replace isolt = frfv1524 if inrange(age , 15 , 24)  & sex == 2
                    replace isolt = frmv2554 if inrange(age , 25 , 54)  & sex == 1
                    replace isolt = frfv2554 if inrange(age , 25 , 54)  & sex == 2
                    replace isolt = frmv5564 if inrange(age , 55 , 64)  & sex == 1
                    replace isolt = frfv5564 if inrange(age , 55 , 64)  & sex == 2
                    replace isolt = frmv6599 if inrange(age , 65 , 999) & sex == 1
                    replace isolt = frfv6599 if inrange(age , 65 , 999) & sex == 2
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
                else if "`k'" == "se" {
                /*{{{*/
                    replace unemp = semu1519 if inrange(age , 15 , 19)  & sex == 1
                    replace unemp = sefu1519 if inrange(age , 15 , 19)  & sex == 2
                    replace unemp = semu2024 if inrange(age , 20 , 24)  & sex == 1
                    replace unemp = sefu2024 if inrange(age , 20 , 24)  & sex == 2
                    replace unemp = semu2529 if inrange(age , 25 , 29)  & sex == 1
                    replace unemp = sefu2529 if inrange(age , 25 , 29)  & sex == 2
                    replace unemp = semu3034 if inrange(age , 30 , 34)  & sex == 1
                    replace unemp = sefu3034 if inrange(age , 30 , 34)  & sex == 2
                    replace unemp = semu3539 if inrange(age , 35 , 39)  & sex == 1
                    replace unemp = sefu3539 if inrange(age , 35 , 39)  & sex == 2
                    replace unemp = semu4044 if inrange(age , 40 , 44)  & sex == 1
                    replace unemp = sefu4044 if inrange(age , 40 , 44)  & sex == 2
                    replace unemp = semu4549 if inrange(age , 45 , 49)  & sex == 1
                    replace unemp = sefu4549 if inrange(age , 45 , 49)  & sex == 2
                    replace unemp = semu5054 if inrange(age , 50 , 54)  & sex == 1
                    replace unemp = sefu5054 if inrange(age , 50 , 54)  & sex == 2
                    replace unemp = semu5559 if inrange(age , 55 , 59)  & sex == 1
                    replace unemp = sefu5559 if inrange(age , 55 , 59)  & sex == 2
                    replace unemp = semu6064 if inrange(age , 60 , 64)  & sex == 1
                    replace unemp = sefu6064 if inrange(age , 60 , 64)  & sex == 2
                    replace unemp = semu6599 if inrange(age , 65 , 999) & sex == 1
                    replace unemp = sefu6599 if inrange(age , 65 , 999) & sex == 2
                    replace emplo = seme1519 if inrange(age , 15 , 19)  & sex == 1
                    replace emplo = sefe1519 if inrange(age , 15 , 19)  & sex == 2
                    replace emplo = seme2024 if inrange(age , 20 , 24)  & sex == 1
                    replace emplo = sefe2024 if inrange(age , 20 , 24)  & sex == 2
                    replace emplo = seme2529 if inrange(age , 25 , 29)  & sex == 1
                    replace emplo = sefe2529 if inrange(age , 25 , 29)  & sex == 2
                    replace emplo = seme3034 if inrange(age , 30 , 34)  & sex == 1
                    replace emplo = sefe3034 if inrange(age , 30 , 34)  & sex == 2
                    replace emplo = seme3539 if inrange(age , 35 , 39)  & sex == 1
                    replace emplo = sefe3539 if inrange(age , 35 , 39)  & sex == 2
                    replace emplo = seme4044 if inrange(age , 40 , 44)  & sex == 1
                    replace emplo = sefe4044 if inrange(age , 40 , 44)  & sex == 2
                    replace emplo = seme4549 if inrange(age , 45 , 49)  & sex == 1
                    replace emplo = sefe4549 if inrange(age , 45 , 49)  & sex == 2
                    replace emplo = seme5054 if inrange(age , 50 , 54)  & sex == 1
                    replace emplo = sefe5054 if inrange(age , 50 , 54)  & sex == 2
                    replace emplo = seme5559 if inrange(age , 55 , 59)  & sex == 1
                    replace emplo = sefe5559 if inrange(age , 55 , 59)  & sex == 2
                    replace emplo = seme6064 if inrange(age , 60 , 64)  & sex == 1
                    replace emplo = sefe6064 if inrange(age , 60 , 64)  & sex == 2
                    replace emplo = seme6599 if inrange(age , 65 , 999) & sex == 1
                    replace emplo = sefe6599 if inrange(age , 65 , 999) & sex == 2
                    replace isolt = sems1529 if inrange(age , 15 , 29)  & sex == 1
                    replace isolt = sefs1529 if inrange(age , 15 , 29)  & sex == 2
                    replace isolt = sems3049 if inrange(age , 30 , 44)  & sex == 1
                    replace isolt = sefs3049 if inrange(age , 30 , 44)  & sex == 2
                    replace isolt = sems5099 if inrange(age , 50 , 999) & sex == 1
                    replace isolt = sefs5099 if inrange(age , 50 , 999) & sex == 2
                    replace isolt = semv1524 if inrange(age , 15 , 24)  & sex == 1
                    replace isolt = sefv1524 if inrange(age , 15 , 24)  & sex == 2
                    replace isolt = semv2554 if inrange(age , 25 , 54)  & sex == 1
                    replace isolt = sefv2554 if inrange(age , 25 , 54)  & sex == 2
                    replace isolt = semv5564 if inrange(age , 55 , 64)  & sex == 1
                    replace isolt = sefv5564 if inrange(age , 55 , 64)  & sex == 2
                    replace isolt = semv6599 if inrange(age , 65 , 999) & sex == 1
                    replace isolt = sefv6599 if inrange(age , 65 , 999) & sex == 2
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
                    replace unemp = ukmu1519 if inrange(age , 15 , 19)  & sex == 1
                    replace unemp = ukfu1519 if inrange(age , 15 , 19)  & sex == 2
                    replace unemp = ukmu2024 if inrange(age , 20 , 24)  & sex == 1
                    replace unemp = ukfu2024 if inrange(age , 20 , 24)  & sex == 2
                    replace unemp = ukmu2529 if inrange(age , 25 , 29)  & sex == 1
                    replace unemp = ukfu2529 if inrange(age , 25 , 29)  & sex == 2
                    replace unemp = ukmu3034 if inrange(age , 30 , 34)  & sex == 1
                    replace unemp = ukfu3034 if inrange(age , 30 , 34)  & sex == 2
                    replace unemp = ukmu3539 if inrange(age , 35 , 39)  & sex == 1
                    replace unemp = ukfu3539 if inrange(age , 35 , 39)  & sex == 2
                    replace unemp = ukmu4044 if inrange(age , 40 , 44)  & sex == 1
                    replace unemp = ukfu4044 if inrange(age , 40 , 44)  & sex == 2
                    replace unemp = ukmu4549 if inrange(age , 45 , 49)  & sex == 1
                    replace unemp = ukfu4549 if inrange(age , 45 , 49)  & sex == 2
                    replace unemp = ukmu5054 if inrange(age , 50 , 54)  & sex == 1
                    replace unemp = ukfu5054 if inrange(age , 50 , 54)  & sex == 2
                    replace unemp = ukmu5559 if inrange(age , 55 , 59)  & sex == 1
                    replace unemp = ukfu5559 if inrange(age , 55 , 59)  & sex == 2
                    replace unemp = ukmu6064 if inrange(age , 60 , 64)  & sex == 1
                    replace unemp = ukfu6064 if inrange(age , 60 , 64)  & sex == 2
                    replace unemp = ukmu6599 if inrange(age , 65 , 999) & sex == 1
                    replace unemp = ukfu6599 if inrange(age , 65 , 999) & sex == 2
                    replace emplo = ukme1519 if inrange(age , 15 , 19)  & sex == 1
                    replace emplo = ukfe1519 if inrange(age , 15 , 19)  & sex == 2
                    replace emplo = ukme2024 if inrange(age , 20 , 24)  & sex == 1
                    replace emplo = ukfe2024 if inrange(age , 20 , 24)  & sex == 2
                    replace emplo = ukme2529 if inrange(age , 25 , 29)  & sex == 1
                    replace emplo = ukfe2529 if inrange(age , 25 , 29)  & sex == 2
                    replace emplo = ukme3034 if inrange(age , 30 , 34)  & sex == 1
                    replace emplo = ukfe3034 if inrange(age , 30 , 34)  & sex == 2
                    replace emplo = ukme3539 if inrange(age , 35 , 39)  & sex == 1
                    replace emplo = ukfe3539 if inrange(age , 35 , 39)  & sex == 2
                    replace emplo = ukme4044 if inrange(age , 40 , 44)  & sex == 1
                    replace emplo = ukfe4044 if inrange(age , 40 , 44)  & sex == 2
                    replace emplo = ukme4549 if inrange(age , 45 , 49)  & sex == 1
                    replace emplo = ukfe4549 if inrange(age , 45 , 49)  & sex == 2
                    replace emplo = ukme5054 if inrange(age , 50 , 54)  & sex == 1
                    replace emplo = ukfe5054 if inrange(age , 50 , 54)  & sex == 2
                    replace emplo = ukme5559 if inrange(age , 55 , 59)  & sex == 1
                    replace emplo = ukfe5559 if inrange(age , 55 , 59)  & sex == 2
                    replace emplo = ukme6064 if inrange(age , 60 , 64)  & sex == 1
                    replace emplo = ukfe6064 if inrange(age , 60 , 64)  & sex == 2
                    replace emplo = ukme6599 if inrange(age , 65 , 999) & sex == 1
                    replace emplo = ukfe6599 if inrange(age , 65 , 999) & sex == 2
                    replace isolt = ukms1529 if inrange(age , 15 , 29)  & sex == 1
                    replace isolt = ukfs1529 if inrange(age , 15 , 29)  & sex == 2
                    replace isolt = ukms3049 if inrange(age , 30 , 44)  & sex == 1
                    replace isolt = ukfs3049 if inrange(age , 30 , 44)  & sex == 2
                    replace isolt = ukms5099 if inrange(age , 50 , 999) & sex == 1
                    replace isolt = ukfs5099 if inrange(age , 50 , 999) & sex == 2
                    replace isolt = ukmv1524 if inrange(age , 15 , 24)  & sex == 1
                    replace isolt = ukfv1524 if inrange(age , 15 , 24)  & sex == 2
                    replace isolt = ukmv2554 if inrange(age , 25 , 54)  & sex == 1
                    replace isolt = ukfv2554 if inrange(age , 25 , 54)  & sex == 2
                    replace isolt = ukmv5564 if inrange(age , 55 , 64)  & sex == 1
                    replace isolt = ukfv5564 if inrange(age , 55 , 64)  & sex == 2
                    replace isolt = ukmv6599 if inrange(age , 65 , 999) & sex == 1
                    replace isolt = ukfv6599 if inrange(age , 65 , 999) & sex == 2
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
                else if "`k'" == "kr" {
                /*{{{*/
                    replace unemp = krmu1519 if inrange(age , 15 , 19)  & sex == 1
                    replace unemp = krfu1519 if inrange(age , 15 , 19)  & sex == 2
                    replace unemp = krmu2024 if inrange(age , 20 , 24)  & sex == 1
                    replace unemp = krfu2024 if inrange(age , 20 , 24)  & sex == 2
                    replace unemp = krmu2529 if inrange(age , 25 , 29)  & sex == 1
                    replace unemp = krfu2529 if inrange(age , 25 , 29)  & sex == 2
                    replace unemp = krmu3034 if inrange(age , 30 , 34)  & sex == 1
                    replace unemp = krfu3034 if inrange(age , 30 , 34)  & sex == 2
                    replace unemp = krmu3539 if inrange(age , 35 , 39)  & sex == 1
                    replace unemp = krfu3539 if inrange(age , 35 , 39)  & sex == 2
                    replace unemp = krmu4044 if inrange(age , 40 , 44)  & sex == 1
                    replace unemp = krfu4044 if inrange(age , 40 , 44)  & sex == 2
                    replace unemp = krmu4549 if inrange(age , 45 , 49)  & sex == 1
                    replace unemp = krfu4549 if inrange(age , 45 , 49)  & sex == 2
                    replace unemp = krmu5054 if inrange(age , 50 , 54)  & sex == 1
                    replace unemp = krfu5054 if inrange(age , 50 , 54)  & sex == 2
                    replace unemp = krmu5559 if inrange(age , 55 , 59)  & sex == 1
                    replace unemp = krfu5559 if inrange(age , 55 , 59)  & sex == 2
                    replace unemp = krmu6064 if inrange(age , 60 , 64)  & sex == 1
                    replace unemp = krfu6064 if inrange(age , 60 , 64)  & sex == 2
                    replace unemp = krmu6599 if inrange(age , 65 , 999) & sex == 1
                    replace unemp = krfu6599 if inrange(age , 65 , 999) & sex == 2
                    replace emplo = krme1519 if inrange(age , 15 , 19)  & sex == 1
                    replace emplo = krfe1519 if inrange(age , 15 , 19)  & sex == 2
                    replace emplo = krme2024 if inrange(age , 20 , 24)  & sex == 1
                    replace emplo = krfe2024 if inrange(age , 20 , 24)  & sex == 2
                    replace emplo = krme2529 if inrange(age , 25 , 29)  & sex == 1
                    replace emplo = krfe2529 if inrange(age , 25 , 29)  & sex == 2
                    replace emplo = krme3034 if inrange(age , 30 , 34)  & sex == 1
                    replace emplo = krfe3034 if inrange(age , 30 , 34)  & sex == 2
                    replace emplo = krme3539 if inrange(age , 35 , 39)  & sex == 1
                    replace emplo = krfe3539 if inrange(age , 35 , 39)  & sex == 2
                    replace emplo = krme4044 if inrange(age , 40 , 44)  & sex == 1
                    replace emplo = krfe4044 if inrange(age , 40 , 44)  & sex == 2
                    replace emplo = krme4549 if inrange(age , 45 , 49)  & sex == 1
                    replace emplo = krfe4549 if inrange(age , 45 , 49)  & sex == 2
                    replace emplo = krme5054 if inrange(age , 50 , 54)  & sex == 1
                    replace emplo = krfe5054 if inrange(age , 50 , 54)  & sex == 2
                    replace emplo = krme5559 if inrange(age , 55 , 59)  & sex == 1
                    replace emplo = krfe5559 if inrange(age , 55 , 59)  & sex == 2
                    replace emplo = krme6064 if inrange(age , 60 , 64)  & sex == 1
                    replace emplo = krfe6064 if inrange(age , 60 , 64)  & sex == 2
                    replace emplo = krme6599 if inrange(age , 65 , 999) & sex == 1
                    replace emplo = krfe6599 if inrange(age , 65 , 999) & sex == 2
                    replace isolt = krms1529 if inrange(age , 15 , 29)  & sex == 1
                    replace isolt = krfs1529 if inrange(age , 15 , 29)  & sex == 2
                    replace isolt = krms3049 if inrange(age , 30 , 44)  & sex == 1
                    replace isolt = krfs3049 if inrange(age , 30 , 44)  & sex == 2
                    replace isolt = krms5099 if inrange(age , 50 , 999) & sex == 1
                    replace isolt = krfs5099 if inrange(age , 50 , 999) & sex == 2
                    replace isolt = krmv1519 if inrange(age , 15 , 19)  & sex == 1
                    replace isolt = krfv1519 if inrange(age , 15 , 19)  & sex == 2
                    replace isolt = krmv2029 if inrange(age , 20 , 29)  & sex == 1
                    replace isolt = krfv2029 if inrange(age , 20 , 29)  & sex == 2
                    replace isolt = krmv3039 if inrange(age , 30 , 39)  & sex == 1
                    replace isolt = krfv3039 if inrange(age , 30 , 39)  & sex == 2
                    replace isolt = krmv4049 if inrange(age , 40 , 49) & sex == 1
                    replace isolt = krfv4049 if inrange(age , 40 , 49) & sex == 2
                    replace isolt = krmv5059 if inrange(age , 50 , 59) & sex == 1
                    replace isolt = krfv5059 if inrange(age , 50 , 59) & sex == 2
                    replace isolt = krmv6099 if inrange(age , 60 , 999) & sex == 1
                    replace isolt = krfv6099 if inrange(age , 60 , 999) & sex == 2
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
                else if "`k'" == "us" {
                /*{{{*/
                    replace unemp = usmu1519 if inrange(age , 15 , 19)  & sex == 1
                    replace unemp = usfu1519 if inrange(age , 15 , 19)  & sex == 2
                    replace unemp = usmu2024 if inrange(age , 20 , 24)  & sex == 1
                    replace unemp = usfu2024 if inrange(age , 20 , 24)  & sex == 2
                    replace unemp = usmu2529 if inrange(age , 25 , 29)  & sex == 1
                    replace unemp = usfu2529 if inrange(age , 25 , 29)  & sex == 2
                    replace unemp = usmu3034 if inrange(age , 30 , 34)  & sex == 1
                    replace unemp = usfu3034 if inrange(age , 30 , 34)  & sex == 2
                    replace unemp = usmu3539 if inrange(age , 35 , 39)  & sex == 1
                    replace unemp = usfu3539 if inrange(age , 35 , 39)  & sex == 2
                    replace unemp = usmu4044 if inrange(age , 40 , 44)  & sex == 1
                    replace unemp = usfu4044 if inrange(age , 40 , 44)  & sex == 2
                    replace unemp = usmu4549 if inrange(age , 45 , 49)  & sex == 1
                    replace unemp = usfu4549 if inrange(age , 45 , 49)  & sex == 2
                    replace unemp = usmu5054 if inrange(age , 50 , 54)  & sex == 1
                    replace unemp = usfu5054 if inrange(age , 50 , 54)  & sex == 2
                    replace unemp = usmu5559 if inrange(age , 55 , 59)  & sex == 1
                    replace unemp = usfu5559 if inrange(age , 55 , 59)  & sex == 2
                    replace unemp = usmu6064 if inrange(age , 60 , 64)  & sex == 1
                    replace unemp = usfu6064 if inrange(age , 60 , 64)  & sex == 2
                    replace unemp = usmu6599 if inrange(age , 65 , 999) & sex == 1
                    replace unemp = usfu6599 if inrange(age , 65 , 999) & sex == 2
                    replace emplo = usme1519 if inrange(age , 15 , 19)  & sex == 1
                    replace emplo = usfe1519 if inrange(age , 15 , 19)  & sex == 2
                    replace emplo = usme2024 if inrange(age , 20 , 24)  & sex == 1
                    replace emplo = usfe2024 if inrange(age , 20 , 24)  & sex == 2
                    replace emplo = usme2529 if inrange(age , 25 , 29)  & sex == 1
                    replace emplo = usfe2529 if inrange(age , 25 , 29)  & sex == 2
                    replace emplo = usme3034 if inrange(age , 30 , 34)  & sex == 1
                    replace emplo = usfe3034 if inrange(age , 30 , 34)  & sex == 2
                    replace emplo = usme3539 if inrange(age , 35 , 39)  & sex == 1
                    replace emplo = usfe3539 if inrange(age , 35 , 39)  & sex == 2
                    replace emplo = usme4044 if inrange(age , 40 , 44)  & sex == 1
                    replace emplo = usfe4044 if inrange(age , 40 , 44)  & sex == 2
                    replace emplo = usme4549 if inrange(age , 45 , 49)  & sex == 1
                    replace emplo = usfe4549 if inrange(age , 45 , 49)  & sex == 2
                    replace emplo = usme5054 if inrange(age , 50 , 54)  & sex == 1
                    replace emplo = usfe5054 if inrange(age , 50 , 54)  & sex == 2
                    replace emplo = usme5559 if inrange(age , 55 , 59)  & sex == 1
                    replace emplo = usfe5559 if inrange(age , 55 , 59)  & sex == 2
                    replace emplo = usme6064 if inrange(age , 60 , 64)  & sex == 1
                    replace emplo = usfe6064 if inrange(age , 60 , 64)  & sex == 2
                    replace emplo = usme6599 if inrange(age , 65 , 999) & sex == 1
                    replace emplo = usfe6599 if inrange(age , 65 , 999) & sex == 2
                    replace isolt = usms1529 if inrange(age , 15 , 29)  & sex == 1
                    replace isolt = usfs1529 if inrange(age , 15 , 29)  & sex == 2
                    replace isolt = usms3049 if inrange(age , 30 , 44)  & sex == 1
                    replace isolt = usfs3049 if inrange(age , 30 , 44)  & sex == 2
                    replace isolt = usms5099 if inrange(age , 50 , 999) & sex == 1
                    replace isolt = usfs5099 if inrange(age , 50 , 999) & sex == 2
                    replace isolt = usmv1524 if inrange(age , 15 , 24)  & sex == 1
                    replace isolt = usfv1524 if inrange(age , 15 , 24)  & sex == 2
                    replace isolt = usmv2554 if inrange(age , 25 , 54)  & sex == 1
                    replace isolt = usfv2554 if inrange(age , 25 , 54)  & sex == 2
                    replace isolt = usmv5564 if inrange(age , 55 , 64)  & sex == 1
                    replace isolt = usfv5564 if inrange(age , 55 , 64)  & sex == 2
                    replace isolt = usmv6599 if inrange(age , 65 , 999) & sex == 1
                    replace isolt = usfv6599 if inrange(age , 65 , 999) & sex == 2
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
                else if "`k'" == "jp" {
                /*{{{*/
                    replace unemp = jpmu1519 if inrange(age , 15 , 19)  & sex == 1
                    replace unemp = jpfu1519 if inrange(age , 15 , 19)  & sex == 2
                    replace unemp = jpmu2024 if inrange(age , 20 , 24)  & sex == 1
                    replace unemp = jpfu2024 if inrange(age , 20 , 24)  & sex == 2
                    replace unemp = jpmu2529 if inrange(age , 25 , 29)  & sex == 1
                    replace unemp = jpfu2529 if inrange(age , 25 , 29)  & sex == 2
                    replace unemp = jpmu3034 if inrange(age , 30 , 34)  & sex == 1
                    replace unemp = jpfu3034 if inrange(age , 30 , 34)  & sex == 2
                    replace unemp = jpmu3539 if inrange(age , 35 , 39)  & sex == 1
                    replace unemp = jpfu3539 if inrange(age , 35 , 39)  & sex == 2
                    replace unemp = jpmu4044 if inrange(age , 40 , 44)  & sex == 1
                    replace unemp = jpfu4044 if inrange(age , 40 , 44)  & sex == 2
                    replace unemp = jpmu4549 if inrange(age , 45 , 49)  & sex == 1
                    replace unemp = jpfu4549 if inrange(age , 45 , 49)  & sex == 2
                    replace unemp = jpmu5054 if inrange(age , 50 , 54)  & sex == 1
                    replace unemp = jpfu5054 if inrange(age , 50 , 54)  & sex == 2
                    replace unemp = jpmu5559 if inrange(age , 55 , 59)  & sex == 1
                    replace unemp = jpfu5559 if inrange(age , 55 , 59)  & sex == 2
                    replace unemp = jpmu6064 if inrange(age , 60 , 64)  & sex == 1
                    replace unemp = jpfu6064 if inrange(age , 60 , 64)  & sex == 2
                    replace unemp = jpmu6599 if inrange(age , 65 , 999) & sex == 1
                    replace unemp = jpfu6599 if inrange(age , 65 , 999) & sex == 2
                    replace emplo = jpme1519 if inrange(age , 15 , 19)  & sex == 1
                    replace emplo = jpfe1519 if inrange(age , 15 , 19)  & sex == 2
                    replace emplo = jpme2024 if inrange(age , 20 , 24)  & sex == 1
                    replace emplo = jpfe2024 if inrange(age , 20 , 24)  & sex == 2
                    replace emplo = jpme2529 if inrange(age , 25 , 29)  & sex == 1
                    replace emplo = jpfe2529 if inrange(age , 25 , 29)  & sex == 2
                    replace emplo = jpme3034 if inrange(age , 30 , 34)  & sex == 1
                    replace emplo = jpfe3034 if inrange(age , 30 , 34)  & sex == 2
                    replace emplo = jpme3539 if inrange(age , 35 , 39)  & sex == 1
                    replace emplo = jpfe3539 if inrange(age , 35 , 39)  & sex == 2
                    replace emplo = jpme4044 if inrange(age , 40 , 44)  & sex == 1
                    replace emplo = jpfe4044 if inrange(age , 40 , 44)  & sex == 2
                    replace emplo = jpme4549 if inrange(age , 45 , 49)  & sex == 1
                    replace emplo = jpfe4549 if inrange(age , 45 , 49)  & sex == 2
                    replace emplo = jpme5054 if inrange(age , 50 , 54)  & sex == 1
                    replace emplo = jpfe5054 if inrange(age , 50 , 54)  & sex == 2
                    replace emplo = jpme5559 if inrange(age , 55 , 59)  & sex == 1
                    replace emplo = jpfe5559 if inrange(age , 55 , 59)  & sex == 2
                    replace emplo = jpme6064 if inrange(age , 60 , 64)  & sex == 1
                    replace emplo = jpfe6064 if inrange(age , 60 , 64)  & sex == 2
                    replace emplo = jpme6599 if inrange(age , 65 , 999) & sex == 1
                    replace emplo = jpfe6599 if inrange(age , 65 , 999) & sex == 2
                    replace isolt = jpms1529 if inrange(age , 15 , 29)  & sex == 1
                    replace isolt = jpfs1529 if inrange(age , 15 , 29)  & sex == 2
                    replace isolt = jpms3049 if inrange(age , 30 , 44)  & sex == 1
                    replace isolt = jpfs3049 if inrange(age , 30 , 44)  & sex == 2
                    replace isolt = jpms5099 if inrange(age , 50 , 999) & sex == 1
                    replace isolt = jpfs5099 if inrange(age , 50 , 999) & sex == 2
                    replace isolt = jpmv1524 if inrange(age , 15 , 24)  & sex == 1
                    replace isolt = jpfv1524 if inrange(age , 15 , 24)  & sex == 2
                    replace isolt = jpmv2554 if inrange(age , 25 , 54)  & sex == 1
                    replace isolt = jpfv2554 if inrange(age , 25 , 54)  & sex == 2
                    replace isolt = jpmv5564 if inrange(age , 55 , 64)  & sex == 1
                    replace isolt = jpfv5564 if inrange(age , 55 , 64)  & sex == 2
                    replace isolt = jpmv6599 if inrange(age , 65 , 999) & sex == 1
                    replace isolt = jpfv6599 if inrange(age , 65 , 999) & sex == 2
                    replace health = jpmh0609 if inrange(age , 06 , 09)  & sex == 1
                    replace health = jpfh0609 if inrange(age , 06 , 09)  & sex == 2
                    replace health = jpmh1014 if inrange(age , 10 , 14)  & sex == 1
                    replace health = jpfh1014 if inrange(age , 10 , 14)  & sex == 2
                    replace health = jpmh1519 if inrange(age , 15 , 19)  & sex == 1
                    replace health = jpfh1519 if inrange(age , 15 , 19)  & sex == 2
                    replace health = jpmh2024 if inrange(age , 20 , 24)  & sex == 1
                    replace health = jpfh2024 if inrange(age , 20 , 24)  & sex == 2
                    replace health = jpmh2529 if inrange(age , 25 , 29)  & sex == 1
                    replace health = jpfh2529 if inrange(age , 25 , 29)  & sex == 2
                    replace health = jpmh3034 if inrange(age , 30 , 34)  & sex == 1
                    replace health = jpfh3034 if inrange(age , 30 , 34)  & sex == 2
                    replace health = jpmh3539 if inrange(age , 35 , 39)  & sex == 1
                    replace health = jpfh3539 if inrange(age , 35 , 39)  & sex == 2
                    replace health = jpmh4044 if inrange(age , 40 , 44)  & sex == 1
                    replace health = jpfh4044 if inrange(age , 40 , 44)  & sex == 2
                    replace health = jpmh4549 if inrange(age , 45 , 49)  & sex == 1
                    replace health = jpfh4549 if inrange(age , 45 , 49)  & sex == 2
                    replace health = jpmh5054 if inrange(age , 50 , 54)  & sex == 1
                    replace health = jpfh5054 if inrange(age , 50 , 54)  & sex == 2
                    replace health = jpmh5559 if inrange(age , 55 , 59)  & sex == 1
                    replace health = jpfh5559 if inrange(age , 55 , 59)  & sex == 2
                    replace health = jpmh6064 if inrange(age , 60 , 64)  & sex == 1
                    replace health = jpfh6064 if inrange(age , 60 , 64)  & sex == 2
                    replace health = jpmh6599 if inrange(age , 65 , 999)  & sex == 1
                    replace health = jpfh6599 if inrange(age , 65 , 999)  & sex == 2
                /*}}}*/
                }
            /*}}}*/
            /*변수 생성 : 가중 분위수 집단*/
                gen temp1  = ln(unemp)  if !missing(unemp)
                egen temp2 = total(temp1) if !missing(unemp)
                gen aunemp = exp(temp2) if !missing(unemp)
                drop temp1 temp2
            /*변수 생성 : 실업있음*/
                gen temp1  = 1 - unemp  if !missing(unemp)
                gen temp2  = ln(temp1)  if !missing(unemp)
                egen temp3 = total(temp2) if !missing(unemp)
                gen xunemp = exp(temp3) if !missing(unemp)
                drop temp1 temp2 temp3
            /*변수 생성 : 모두실업*/
                gen temp1  = ln(emplo)  if !missing(emplo)
                egen temp2 = total(temp1) if !missing(emplo)
                gen anojob  = exp(temp2) if !missing(emplo)
                drop temp1 temp2
            /*변수 생성 : 실업있음*/
                gen temp1  = 1 - emplo  if !missing(emplo)
                gen temp2  = ln(temp1)  if !missing(emplo)
                egen temp3 = total(temp2) if !missing(emplo)
                gen xnojob  = exp(temp3) if !missing(emplo)
                drop temp1 temp2 temp3
        /*소득분위별 빈곤위험도 평균 계산*/
            keep if relation == 1000
            xtile dcgroup = emin [aw=hpopwgt], nq(10)
            forvalue i = 1/10 {
                summarize aunemp  if dcgroup == `i' , meanonly
                local aunempd`i' = r(mean)
                summarize xunemp  if dcgroup == `i' , meanonly
                local xunempd`i' = r(mean)
                summarize anojob  if dcgroup == `i' , meanonly
                local anojob`i' = r(mean)
                summarize xnojob  if dcgroup == `i' , meanonly
                local xnojob`i' = r(mean)
            }
        /*}*/
        /*결과 출력*/
            /*국가명 년도*/
                local cname = cname[1]
                local iso2 = iso2[1]
                local iso3 = iso3[1]
            if "`k'" == "fr" {
                di as text "cname,iso2,iso3,dcgroup,aunemp,anojob,xnuemp,xnojob"
            }
            forvalue i = 1/10 {
                di as text "`cname',`iso2',`iso3',`i',`anuemp`i'',`anojob`i'',`xnuemp`i'',`xnojob`i''"
            }
    }
