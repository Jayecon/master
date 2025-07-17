/*호출변수 목록 생성*/
    local datalist fr se kr jp uk us
    /*Scalars{{{*/
        /*pv5 scalars{{{*/
            scalar frpv5t1 = .8825612843036652
            scalar frpv5t2 = .8469465672969818
            scalar frpv5t3 = .3660598695278168
            scalar frpv5t4 = .2025036796927452
            scalar frpv5t5 = .2872826039791107
            scalar frpv5t6 = .4653258562088013
            scalar frpv5t7 = .1400555863976479
            scalar frpv5t8 = .1574170738458633
            scalar frpv5t9 = .4657467633485794
            scalar jppv5t1 = .35573750436306
            scalar jppv5t2 = .1152342602610588
            scalar jppv5t3 = .1631318606436253
            scalar jppv5t4 = .0757832635194063
            scalar jppv5t5 = .1017812207341194
            scalar jppv5t6 = .2928691297769547
            scalar jppv5t7 = .055604850128293
            scalar jppv5t8 = .100756661593914
            scalar jppv5t9 = .1222495377063751
            scalar krpv5t1 = .8185668985048929
            scalar krpv5t2 = .6020206312338511
            scalar krpv5t3 = .3236140956481298
            scalar krpv5t4 = .1556307151913643
            scalar krpv5t5 = .1193511672317982
            scalar krpv5t6 = .4500729689995448
            scalar krpv5t7 = .0951312469939391
            scalar krpv5t8 = .0886109080165625
            scalar krpv5t9 = .1696060175697009
            scalar sepv5t1 = .8450232684612274
            scalar sepv5t2 = .6711944460868835
            scalar sepv5t3 = .3627754122018814
            scalar sepv5t4 = .0971311420202255
            scalar sepv5t5 = .1414916843175888
            scalar sepv5t6 = .3773355275392533
            scalar sepv5t7 = .1273318819701671
            scalar sepv5t8 = .1498006224632263
            scalar sepv5t9 = .3762431487441063
            scalar ukpv5t1 = .7629622757434845
            scalar ukpv5t2 = .5699417769908905
            scalar ukpv5t3 = .3627677321434021
            scalar ukpv5t4 = .1191498592495918
            scalar ukpv5t5 = .1704690784215927
            scalar ukpv5t6 = .7524578630924225
            scalar ukpv5t7 = .2118858695030212
            scalar ukpv5t8 = .1997385486960411
            scalar ukpv5t9 = .4332509458065033
            scalar uspv5t1 = .7694943130016327
            scalar uspv5t2 = .6171998143196106
            scalar uspv5t3 = .3263619571924209
            scalar uspv5t4 = .1621687203645706
            scalar uspv5t5 = .2337624445557594
            scalar uspv5t6 = .584399265050888
            scalar uspv5t7 = .202683687210083
            scalar uspv5t8 = .2024155139923096
            scalar uspv5t9 = .3692317962646484
        /*}}}*/
        /*pv6 scalars{{{*/
            scalar frpv6t1 = .9009915649890899
            scalar frpv6t2 = .8699919641017914
            scalar frpv6t3 = .3930564939975739
            scalar frpv6t4 = .2266863897442818
            scalar frpv6t5 = .3183891445398331
            scalar frpv6t6 = .5197837769985199
            scalar frpv6t7 = .1803509265184403
            scalar frpv6t8 = .1988780423998833
            scalar frpv6t9 = .5345491856336594
            scalar jppv6t1 = .4345595568418503
            scalar jppv6t2 = .2102439492940903
            scalar jppv6t3 = .2314120769500732
            scalar jppv6t4 = .1070369176566601
            scalar jppv6t5 = .1462159648537636
            scalar jppv6t6 = .3483210593461991
            scalar jppv6t7 = .1091445028781891
            scalar jppv6t8 = .1358475655317307
            scalar jppv6t9 = .1683125741779804
            scalar krpv6t1 = .8674003581206003
            scalar krpv6t2 = .6879901091257731
            scalar krpv6t3 = .3970663497845332
            scalar krpv6t4 = .2166199336449305
            scalar krpv6t5 = .1671404441197713
            scalar krpv6t6 = .5679148981968561
            scalar krpv6t7 = .1491746989389261
            scalar krpv6t8 = .1327654160559177
            scalar krpv6t9 = .2365531449516614
            scalar sepv6t1 = .870892059803009
            scalar sepv6t2 = .7229444265365601
            scalar sepv6t3 = .3969927340745926
            scalar sepv6t4 = .1160045772790909
            scalar sepv6t5 = .1698346272110939
            scalar sepv6t6 = .43680459856987
            scalar sepv6t7 = .1634046018123627
            scalar sepv6t8 = .1753537960350514
            scalar sepv6t9 = .429824934899807
            scalar ukpv6t1 = .8078438162803649
            scalar ukpv6t2 = .6270740509033204
            scalar ukpv6t3 = .3929225951433182
            scalar ukpv6t4 = .1423728562891483
            scalar ukpv6t5 = .2045011237263679
            scalar ukpv6t6 = .7949646234512329
            scalar ukpv6t7 = .2595373183488846
            scalar ukpv6t8 = .2407388716936111
            scalar ukpv6t9 = .4795669734477997
            scalar uspv6t1 = .7961133122444153
            scalar uspv6t2 = .6537506580352783
            scalar uspv6t3 = .3599831998348236
            scalar uspv6t4 = .1919577479362488
            scalar uspv6t5 = .2714015424251556
            scalar uspv6t6 = .651655238866806
            scalar uspv6t7 = .2571355566382408
            scalar uspv6t8 = .2579497739672661
            scalar uspv6t9 = .4309220045804977
        /*}}}*/
    /*care scalars{{{*/
        scalar frcaret1 = 1
        scalar frcaret2 = 1
        scalar frcaret3 = .4611448287963867
        scalar frcaret4 = .4550919115543365
        scalar frcaret5 = .5561168223619462
        scalar frcaret6 = .6233498275279998
        scalar frcaret7 = .6178294807672501
        scalar frcaret8 = .5213052481412888
        scalar frcaret9 = .6967645972967148
        scalar jpcaret1 = 1
        scalar jpcaret2 = 1
        scalar jpcaret3 = .0066880993545055
        scalar jpcaret4 = .0059683538973331
        scalar jpcaret5 = .2723953694105148
        scalar jpcaret6 = .0783497218042612
        scalar jpcaret7 = .1422820642590523
        scalar jpcaret8 = .1521899148821831
        scalar jpcaret9 = .3696594178676605
        scalar krcaret1 = 1
        scalar krcaret2 = 1
        scalar krcaret3 = .0433342730005582
        scalar krcaret4 = .0295297553141912
        scalar krcaret5 = .1547366008162498
        scalar krcaret6 = .1498523118595282
        scalar krcaret7 = .1610824689269066
        scalar krcaret8 = .0900116475919883
        scalar krcaret9 = .3411561697721481
        scalar secaret1 = 1
        scalar secaret2 = 1
        scalar secaret3 = 0
        scalar secaret4 = 0
        scalar secaret5 = .165203632414341
        scalar secaret6 = .1507546432316303
        scalar secaret7 = .1931678116321564
        scalar secaret8 = .0351481642574072
        scalar secaret9 = .2967714369297028
        scalar ukcaret1 = 1
        scalar ukcaret2 = 1
        scalar ukcaret3 = .2100686281919479
        scalar ukcaret4 = .091829140484333
        scalar ukcaret5 = .2106072276830673
        scalar ukcaret6 = .291060084104538
        scalar ukcaret7 = .233658792078495
        scalar ukcaret8 = .1385171443223953
        scalar ukcaret9 = .4000605583190918
        scalar uscaret1 = 1
        scalar uscaret2 = 1
        scalar uscaret3 = .1762365162372589
        scalar uscaret4 = .0905464462935925
        scalar uscaret5 = .248006908595562
        scalar uscaret6 = .6132831871509552
        scalar uscaret7 = .4741199791431427
        scalar uscaret8 = .31909219622612
        scalar uscaret9 = .6049211204051972
    /*}}}*/
        /*rent scalars{{{*/
            scalar frrentt1 = .1501754906355927
            scalar frrentt2 = .1818442763920757
            scalar frrentt3 = .1183085360797122
            scalar frrentt4 = .1391242563950073
            scalar frrentt5 = .1638426387500658
            scalar frrentt6 = .1553707281098468
            scalar frrentt7 = .1677285788289737
            scalar frrentt8 = .1699936509132385
            scalar frrentt9 = .1561719009303488
            scalar jprentt1 = .147425701469183
            scalar jprentt2 = .1162389807403088
            scalar jprentt3 = .1180476047098637
            scalar jprentt4 = .1099310882389545
            scalar jprentt5 = .1379492312669754
            scalar jprentt6 = .2180543426424265
            scalar jprentt7 = .1438057027757168
            scalar jprentt8 = .1401426926255226
            scalar jprentt9 = .1475979946553707
            scalar krrentt1 = .0007139500618602
            scalar krrentt2 = .0001565348587368
            scalar krrentt3 = .0010929139680229
            scalar krrentt4 = .0002361008373555
            scalar krrentt5 = .0000398090730111
            scalar krrentt6 = 0
            scalar krrentt7 = .0000155394069831
            scalar krrentt8 = .0000853161133515
            scalar krrentt9 = 0
            scalar serentt1 = .1645832359790802
            scalar serentt2 = .0495460584759712
            scalar serentt3 = .1344752181961667
            scalar serentt4 = .0611648671329021
            scalar serentt5 = .051773127168417
            scalar serentt6 = .2926333218812943
            scalar serentt7 = .1341796860098839
            scalar serentt8 = .152448220551014
            scalar serentt9 = .2821669429540634
            scalar ukrentt1 = .0614068694412708
            scalar ukrentt2 = .0231423530727625
            scalar ukrentt3 = .2013983383774757
            scalar ukrentt4 = .1087394431233406
            scalar ukrentt5 = .1128127112984657
            scalar ukrentt6 = .5216966480016708
            scalar ukrentt7 = .1979364678263664
            scalar ukrentt8 = .1581566087901592
            scalar ukrentt9 = .1370696105062962
            scalar usrentt1 = .0113490806892514
            scalar usrentt2 = .0064387765713036
            scalar usrentt3 = .0223130209371448
            scalar usrentt4 = .0074667093809694
            scalar usrentt5 = .0047223703702912
            scalar usrentt6 = .0047818269347772
            scalar usrentt7 = .0016347891592886
            scalar usrentt8 = .001254449330736
            scalar usrentt9 = .0014345584670082
        /*}}}*/
        /*health scalars{{{*/
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
        /*employment scalars{{{*/
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
        /*ptjob scalars{{{*/
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
        /*support scalars{{{*/
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
        /*unemployment scalars{{{*/
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
    /*}}}*/
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
                gen min        = hitotal - hpublic
                    label var min "Market Income"
                gen hpwgt      = hpopwgt * nhhmem
                    label var hpwgt "Weight" 
                gen nhhmem1864 = nhhmem - nhhmem65 - nhhmem17
                    label var nhhmem1864 "Number of Household member, age 18-64"
            /*변수생성 : 균등화 소득*/
                gen ehhmen = sqrt(nhhmem)
                gen edhi   = dhi / ehhmen
                    label var edhi "Equiv. disposable Income"
                gen emin   = min / ehhmen
                    label var emin "Equiv. Market Income"
            /*변수생성 : 가구유형*/
                capture drop hht
                gen hht = .
                label var hht "Household Category"
                replace hht = 1 if nhhmem == 1 & nhhmem65 == 1 // 노인 1인
                replace hht = 2 if nhhmem >= 2 & nhhmem == nhhmem65 // 노인만 2인 이상
                replace hht = 3 if nhhmem == 1 & nhhmem1864 == 1 // 근로연령 1인
                replace hht = 4 if nhhmem == 2 & nhhmem1864 == 2 //근로연령만 2인 
                replace hht = 5 if missing(hht) & ((nhhmem65 + nhhmem1864) >= 1 & nhhmem17 == 0) 
                    // 노인+ 근로연령(아동없음). missing 안걸면 1-4 유형 가구를 덮어씀.
                replace hht = 6 if missing(hht) & (nhhmem65 >=1 & nhhmem1864 == 0 & nhhmem17 >= 1) | (nhhmem65 == 0 & nhhmem1864 == 1 & nhhmem17 >= 1) 
                    // 조손가구 또는 한부모가구 : 정의가 튄다.
                replace hht = 7 if missing(hht) & nhhmem65 == 0 & nhhmem1864 == 2 & nhhmem17 >= 1 // 근로연령 2인 + 아동
                replace hht = 8 if missing(hht) & nhhmem1864 >= 3 // 근로연령 3인 이상 + 아동(노인 무관)
                replace hht = 9 if missing(hht) //기타
        /*변수 생성 : 가중 분위수 집단*/
            xtile dcgroup = emin [aw=hpwgt], nq(10)
            xtile pcgroup = emin [aw=hpwgt], nq(100)
        /*가구위험도 할당{{{*/
            /*pv 위험도 할당{{{*/
            gen rpv5 = .
                replace rpv5 = `k'pv5t1 if hht==1
                replace rpv5 = `k'pv5t2 if hht==2
                replace rpv5 = `k'pv5t3 if hht==3
                replace rpv5 = `k'pv5t4 if hht==4
                replace rpv5 = `k'pv5t5 if hht==5
                replace rpv5 = `k'pv5t6 if hht==6
                replace rpv5 = `k'pv5t7 if hht==7
                replace rpv5 = `k'pv5t8 if hht==8
                replace rpv5 = `k'pv5t9 if hht==9
            gen rpv6 = .
                replace rpv6 = `k'pv6t1 if hht==1
                replace rpv6 = `k'pv6t2 if hht==2
                replace rpv6 = `k'pv6t3 if hht==3
                replace rpv6 = `k'pv6t4 if hht==4
                replace rpv6 = `k'pv6t5 if hht==5
                replace rpv6 = `k'pv6t6 if hht==6
                replace rpv6 = `k'pv6t7 if hht==7
                replace rpv6 = `k'pv6t8 if hht==8
                replace rpv6 = `k'pv6t9 if hht==9
            /*}}}*/
            /*care 위험도 할당{{{*/
            gen care = .
                replace care = `k'caret1 if hht==1
                replace care = `k'caret2 if hht==2
                replace care = `k'caret3 if hht==3
                replace care = `k'caret4 if hht==4
                replace care = `k'caret5 if hht==5
                replace care = `k'caret6 if hht==6
                replace care = `k'caret7 if hht==7
                replace care = `k'caret8 if hht==8
                replace care = `k'caret9 if hht==9
            /*}}}*/
            /*rent 위험도 할당{{{*/
            gen rent = .
                replace rent = `k'rentt1 if hht==1
                replace rent = `k'rentt2 if hht==2
                replace rent = `k'rentt3 if hht==3
                replace rent = `k'rentt4 if hht==4
                replace rent = `k'rentt5 if hht==5
                replace rent = `k'rentt6 if hht==6
                replace rent = `k'rentt7 if hht==7
                replace rent = `k'rentt8 if hht==8
                replace rent = `k'rentt9 if hht==9
            /*}}}*/
        /*}}}*/
        /*소득분위별 가구위험도 평균계산{{{*/
            forvalue i = 1/10 {
                summarize rpv5 [aw=hpwgt] if dcgroup == `i' , meanonly
                    local mrpv5d`i' = r(mean)
                summarize rpv6 [aw=hpwgt] if dcgroup == `i' , meanonly
                    local mrpv6d`i' = r(mean)
                summarize care [aw=hpwgt] if dcgroup == `i' , meanonly
                    local cared`i' = r(mean)
                summarize rent [aw=hpwgt] if dcgroup == `i' , meanonly
                    local rentd`i' = r(mean)
            }
            forvalue i = 1/100 {
                summarize rpv5 [aw=hpwgt] if pcgroup == `i' , meanonly
                    local mrpv5p`i' = r(mean)
                summarize rpv6 [aw=hpwgt] if pcgroup == `i' , meanonly
                    local mrpv6p`i' = r(mean)
                summarize care [aw=hpwgt] if pcgroup == `i' , meanonly
                    local carep`i' = r(mean)
                summarize rent [aw=hpwgt] if pcgroup == `i' , meanonly
                    local rentp`i' = r(mean)
            }
            /*}}}*/
        merge 1:m hid using $`k'20p, nogen 
        /*개인위험도 할당{{{*/
            /*health 위험도 할당{{{*/
            gen health = .
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
            /*employment 위험도 할당{{{*/
                gen employ = .
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
            /* ptjob 위험도 할당{{{*/
                gen ptjob = .
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
            /*support 위험도 할당{{{*/
                gen isolt = .
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
            /* unemployment 위험도 할당{{{*/
                gen unemp = .
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
        /*}}}*/
        /*개인위험도 기반 가구위험도 계산{{{*/
            /*미취업*/
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
            /*비정규직*/
                replace ptjob = ptjob/100
                drop temp1 temp2 temp3 temp4 temp5
                /*변수 생성 : 모두비정규직*/
                    gen temp1  = ln(ptjob) 
                    bys hid : egen temp2 = total(temp1)
                    gen aptjob = exp(temp2)
                /*변수 생성 : 비정규직 있음*/
                    gen temp3  = 1 - ptjob
                    gen temp4  = ln(temp3) 
                    bys hid : egen temp5 = total(temp4)
                    gen xptjob = 1 - exp(temp5)
            /*사회적 고립*/
                replace isolt = isolt/100
                drop temp1 temp2 temp3 temp4 temp5
                /*변수 생성 : 모두고립*/
                    gen temp1  = ln(isolt) 
                    bys hid : egen temp2 = total(temp1)
                    gen aisolt = exp(temp2)
                /*변수 생성 : 고립자 있음*/
                    gen temp3  = 1 - isolt
                    gen temp4  = ln(temp3) 
                    bys hid : egen temp5 = total(temp4)
                    gen xisolt = 1 - exp(temp5)
            /*실업*/
                replace unemp = unemp/100
                drop temp1 temp2 temp3 temp4 temp5
                /*변수 생성 : 모두실업*/
                    gen temp1  = ln(unemp) 
                    bys hid : egen temp2 = total(temp1)
                    gen aunemp = exp(temp2)
                /*변수 생성 : 실업있음*/
                    gen temp3  = 1 - unemp
                    gen temp4  = ln(temp3) 
                    bys hid : egen temp5 = total(temp4)
                    gen xunemp = 1 - exp(temp5)
            /*건강*/
                replace health = health/100
                drop temp1 temp2 temp3 temp4 temp5
                /*변수 생성 : 모두나쁨*/
                    gen temp1  = ln(health) 
                    bys hid : egen temp2 = total(temp1)
                    gen abhlth = exp(temp2)
                /*변수 생성 : 나쁜사람있음*/
                    gen temp3  = 1 - health
                    gen temp4  = ln(temp3) 
                    bys hid : egen temp5 = total(temp4)
                    gen xbhlth = 1 - exp(temp5)
        /*}}}*/
        /*소득분위별 가구위험도 평균계산{{{*/
            keep if relation == 1000
            forvalue i = 1/10 {
                summarize abhlth  [aw=hpwgt] if dcgroup == `i' , meanonly
                    local abhlthd`i' = r(mean)
                summarize xbhlth  [aw=hpwgt] if dcgroup == `i' , meanonly
                    local xbhlthd`i' = r(mean)
                summarize anoemp  [aw=hpwgt] if dcgroup == `i' , meanonly
                    local anoempd`i' = r(mean)
                summarize xnoemp  [aw=hpwgt] if dcgroup == `i' , meanonly
                    local xnoempd`i' = r(mean)
                summarize aptjob  [aw=hpwgt] if dcgroup == `i' , meanonly
                    local aptjobd`i' = r(mean)
                summarize xptjob  [aw=hpwgt] if dcgroup == `i' , meanonly
                    local xptjobd`i' = r(mean)
                summarize aisolt  [aw=hpwgt] if dcgroup == `i' , meanonly
                    local aisoltd`i' = r(mean)
                summarize xisolt  [aw=hpwgt] if dcgroup == `i' , meanonly
                    local xisoltd`i' = r(mean)
                summarize aunemp  [aw=hpwgt] if dcgroup == `i' , meanonly
                    local aunempd`i' = r(mean)
                summarize xunemp  [aw=hpwgt] if dcgroup == `i' , meanonly
                    local xunempd`i' = r(mean)
            }
            forvalue i = 1/100 {
                summarize abhlth  [aw=hpwgt] if pcgroup == `i' , meanonly
                    local abhlthp`i' = r(mean)
                summarize xbhlth  [aw=hpwgt] if pcgroup == `i' , meanonly
                    local xbhlthp`i' = r(mean)
                summarize anoemp  [aw=hpwgt] if pcgroup == `i' , meanonly
                    local anoempp`i' = r(mean)
                summarize xnoemp  [aw=hpwgt] if pcgroup == `i' , meanonly
                    local xnoempp`i' = r(mean)
                summarize aptjob  [aw=hpwgt] if pcgroup == `i' , meanonly
                    local aptjobp`i' = r(mean)
                summarize xptjob  [aw=hpwgt] if pcgroup == `i' , meanonly
                    local xptjobp`i' = r(mean)
                summarize aisolt  [aw=hpwgt] if pcgroup == `i' , meanonly
                    local aisoltp`i' = r(mean)
                summarize xisolt  [aw=hpwgt] if pcgroup == `i' , meanonly
                    local xisoltp`i' = r(mean)
                summarize aunemp  [aw=hpwgt] if pcgroup == `i' , meanonly
                    local aunempp`i' = r(mean)
                summarize xunemp  [aw=hpwgt] if pcgroup == `i' , meanonly
                    local xunempp`i' = r(mean)
            }
            /*}}}*/
    }
        /*결과 출력{{{*/
            local cname = cname[1]
            local iso2 = iso2[1]
            local iso3 = iso3[1]
            if "`k'" == "fr" {
                di as text "cname,iso2,name,group,grcat,value"
            }
            forvalue i = 1/10 {
                di as text "`cname',`iso2',pv5,`i',1,`mrpv5d`i''"
                di as text "`cname',`iso2',pv6,`i',1,`mrpv6d`i''"
                di as text "`cname',`iso2',care,`i',1,`cared`i''"
                di as text "`cname',`iso2',rent,`i',1,`rentd`i''"
                di as text "`cname',`iso2',abhlth,`i',1,`abhlthd`i''"
                di as text "`cname',`iso2',xbhlth,`i',1,`xbhlthd`i''"
                di as text "`cname',`iso2',anoemp,`i',1,`anoempd`i''"
                di as text "`cname',`iso2',xnoemp,`i',1,`xnoempd`i''"
                di as text "`cname',`iso2',aptjob,`i',1,`aptjobd`i''"
                di as text "`cname',`iso2',xptjob,`i',1,`xptjobd`i''"
                di as text "`cname',`iso2',aisolt,`i',1,`aisoltd`i''"
                di as text "`cname',`iso2',xisolt,`i',1,`xisoltd`i''"
                di as text "`cname',`iso2',aunemp,`i',1,`aunempd`i''"
                di as text "`cname',`iso2',xunemp,`i',1,`xunempd`i''"
            }
            forvalue i = 1/100 {
                di as text "`cname',`iso2',pv5,`i',2,`mrpv5p`i''"
                di as text "`cname',`iso2',pv6,`i',2,`mrpv6p`i''"
                di as text "`cname',`iso2',care,`i',2,`carep`i''"
                di as text "`cname',`iso2',rent,`i',2,`rentp`i''"
                di as text "`cname',`iso2',abhlth,`i',2,`abhlthp`i''"
                di as text "`cname',`iso2',xbhlth,`i',2,`xbhlthp`i''"
                di as text "`cname',`iso2',anoemp,`i',2,`anoempp`i''"
                di as text "`cname',`iso2',xnoemp,`i',2,`xnoempp`i''"
                di as text "`cname',`iso2',aptjob,`i',2,`aptjobp`i''"
                di as text "`cname',`iso2',xptjob,`i',2,`xptjobp`i''"
                di as text "`cname',`iso2',aisolt,`i',2,`aisoltp`i''"
                di as text "`cname',`iso2',xisolt,`i',2,`xisoltp`i''"
                di as text "`cname',`iso2',aunemp,`i',2,`aunempp`i''"
                di as text "`cname',`iso2',xunemp,`i',2,`xunempp`i''"
            }
        /*}}}*/
    }
