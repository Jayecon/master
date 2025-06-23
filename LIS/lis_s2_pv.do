/*호출변수 목록 생성*/
    local datalist fr se kr jp uk us
    /*pv5 scalars{{{*/
       scalar frpv5t1 = .8816488
       scalar frpv5t2 = .8433593
       scalar frpv5t3 = .3681224
       scalar frpv5t4 = .2070214
       scalar frpv5t5 = .5563224
       scalar frpv5t6 =  .468692
       scalar frpv5t7 =  .138381
       scalar frpv5t8 = .1382159
       scalar frpv5t9 =  .453088
       scalar jppv5t1 = .4337619
       scalar jppv5t2 = .1329838
       scalar jppv5t3 = .1896487
       scalar jppv5t4 = .0815655
       scalar jppv5t5 =  .153579
       scalar jppv5t6 = .3874441
       scalar jppv5t7 = .0657317
       scalar jppv5t8 = .1218169
       scalar jppv5t9 = .1536845
       scalar krpv5t1 = .8278773
       scalar krpv5t2 = .6444494
       scalar krpv5t3 = .3139249
       scalar krpv5t4 = .1559182
       scalar krpv5t5 = .3012785
       scalar krpv5t6 = .4409389
       scalar krpv5t7 = .0900566
       scalar krpv5t8 = .0658904
       scalar krpv5t9 = .1875302
       scalar sepv5t1 = .8524451
       scalar sepv5t2 = .6773954
       scalar sepv5t3 = .3655054
       scalar sepv5t4 = .0976373
       scalar sepv5t5 = .2285705
       scalar sepv5t6 = .3811003
       scalar sepv5t7 =  .125797
       scalar sepv5t8 = .1123294
       scalar sepv5t9 = .3634622
       scalar ukpv5t1 = .7663694
       scalar ukpv5t2 = .5764393
       scalar ukpv5t3 = .3664132
       scalar ukpv5t4 = .1213666
       scalar ukpv5t5 =  .354507
       scalar ukpv5t6 = .7525712
       scalar ukpv5t7 = .2143728
       scalar ukpv5t8 = .1347636
       scalar ukpv5t9 = .4493011
       scalar uspv5t1 = .7570057
       scalar uspv5t2 = .5969391
       scalar uspv5t3 = .3257299
       scalar uspv5t4 = .1619416
       scalar uspv5t5 = .3820016
       scalar uspv5t6 = .5901708
       scalar uspv5t7 = .2057767
       scalar uspv5t8 = .1703371
       scalar uspv5t9 = .3550777
    /*}}}*/
    /*pv6 scalars{{{*/
       scalar frpv6t1 =  .9005428
       scalar frpv6t2 =  .8670316
       scalar frpv6t3 =   .394942
       scalar frpv6t4 =  .2314689
       scalar frpv6t5 =  .5988412
       scalar frpv6t6 =   .523896
       scalar frpv6t7 =  .1792162
       scalar frpv6t8 =  .1715363
       scalar frpv6t9 =   .526179
       scalar jppv6t1 =  .5516194
       scalar jppv6t2 =  .2359618
       scalar jppv6t3 =  .2712241
       scalar jppv6t4 =  .1159561
       scalar jppv6t5 =  .2217394
       scalar jppv6t6 =   .445351
       scalar jppv6t7 =  .1249777
       scalar jppv6t8 =  .1669528
       scalar jppv6t9 =  .2171809
       scalar krpv6t1 =  .8753084
       scalar krpv6t2 =  .7245206
       scalar krpv6t3 =   .381684
       scalar krpv6t4 =  .2153718
       scalar krpv6t5 =     .3841
       scalar krpv6t6 =  .5393026
       scalar krpv6t7 =  .1420441
       scalar krpv6t8 =  .1032079
       scalar krpv6t9 =  .2502481
       scalar sepv6t1 =  .8784977
       scalar sepv6t2 =  .7281815
       scalar sepv6t3 =  .4005274
       scalar sepv6t4 =  .1163115
       scalar sepv6t5 =  .2704058
       scalar sepv6t6 =  .4389558
       scalar sepv6t7 =  .1629089
       scalar sepv6t8 =  .1344756
       scalar sepv6t9 =  .4122738
       scalar ukpv6t1 =  .8101631
       scalar ukpv6t2 =  .6333486
       scalar ukpv6t3 =  .3955784
       scalar ukpv6t4 =  .1446654
       scalar ukpv6t5 =  .4076565
       scalar ukpv6t6 =  .7957186
       scalar ukpv6t7 =  .2626974
       scalar ukpv6t8 =  .1661728
       scalar ukpv6t9 =  .4921428
       scalar uspv6t1 =  .7859545
       scalar uspv6t2 =  .6371976
       scalar uspv6t3 =   .359273
       scalar uspv6t4 =  .1909776
       scalar uspv6t5 =  .4289521
       scalar uspv6t6 =  .6559113
       scalar uspv6t7 =  .2590077
       scalar uspv6t8 =  .2160763
       scalar uspv6t9 =  .4178836
    /*}}}*/
    foreach k of local datalist {
        qui {
        /*자료호출*/
            use $`k'20h, clear
        /*변수조작*/
            /*변수 생성*/
                gen min     = hitotal - hpublic
                gen pwgt    = hpopwgt * nhhmem
                gen nhhmem1864 = nhhmem - nhhmem65 - nhhmem17
            /*변수 생성 : 균등화 소득*/
                gen ehhmen    = sqrt(nhhmem)
                gen emin      = min / ehhmen
            /*변수생성 : 가구유형*/
                capture drop hhtype
                gen hhtype = .
                replace hhtype = 1 if nhhmem == 1 & nhhmem65 == 1 // 노인 1인
                replace hhtype = 2 if nhhmem >= 2 & nhhmem == nhhmem65 // 노인만 2인 이상
                replace hhtype = 3 if nhhmem == 1 & nhhmem1864 == 1 // 근로연령 1인
                replace hhtype = 4 if nhhmem == 2 & nhhmem1864 == 2 //근로연령만 2인 
                replace hhtype = 5 if missing(hhtype) & ((nhhmem65 + nhhmem1864) >= 1 & nhhmem17 == 0) 
                    // 노인+ 근로연령(아동없음). missing 안걸면 1-4 유형 가구를 덮어씀.
                replace hhtype = 6 if (nhhmem65 >=1 & nhhmem1864 == 0 & nhhmem17 >= 1) | (nhhmem65 == 0 & nhhmem1864 == 1 & nhhmem17 >= 1) 
                    // 조손가구 또는 한부모가구 : 정의가 튄다.
                replace hhtype = 7 if nhhmem65 == 0 & nhhmem1864 == 2 & nhhmem17 >= 1 // 근로연령 2인 + 아동
                replace hhtype = 8 if nhhmem1864 >= 3 // 근로연령 3인 이상 + 아동(노인 무관)
                replace hhtype = 9 if missing(hhtype) //기타
            /*변수 생성 : 가중 분위수 집단*/
                xtile dcgroup = emin [aw=hpopwgt], nq(10)
        /*중위소득 계산 (weighted median)*/
            _pctile emin [aw=hpopwgt], p(50)
            scalar p50 = r(r1)
            gen pv5 = emin < 0.5 * p50
            gen pv6 = emin < 0.6 * p50
        /*빈곤위험도 할당 (수치는 예시)*/
            gen rpv5 = .
                replace rpv5 = `k'pv5t1 if hhtype==1
                replace rpv5 = `k'pv5t2 if hhtype==2
                replace rpv5 = `k'pv5t3 if hhtype==3
                replace rpv5 = `k'pv5t4 if hhtype==4
                replace rpv5 = `k'pv5t5 if hhtype==5
                replace rpv5 = `k'pv5t6 if hhtype==6
                replace rpv5 = `k'pv5t7 if hhtype==7
                replace rpv5 = `k'pv5t8 if hhtype==8
                replace rpv5 = `k'pv5t9 if hhtype==9
            gen rpv6 = .
                replace rpv6 = `k'pv6t1 if hhtype==1
                replace rpv6 = `k'pv6t2 if hhtype==2
                replace rpv6 = `k'pv6t3 if hhtype==3
                replace rpv6 = `k'pv6t4 if hhtype==4
                replace rpv6 = `k'pv6t5 if hhtype==5
                replace rpv6 = `k'pv6t6 if hhtype==6
                replace rpv6 = `k'pv6t7 if hhtype==7
                replace rpv6 = `k'pv6t8 if hhtype==8
                replace rpv6 = `k'pv6t9 if hhtype==9
        /*소득분위별 빈곤위험도 평균 계산*/
            forvalue i = 1/10 {
                summarize rpv5 [aw=hpopwgt] if dcgroup == `i' , meanonly
                local mrpv5d`i' = r(mean)
                summarize rpv6 [aw=hpopwgt] if dcgroup == `i' , meanonly
                local mrpv6d`i' = r(mean)
            }
        }
        /*결과 출력*/
            /*국가명 년도*/
                local cname = cname[1]
                local iso2 = iso2[1]
                local iso3 = iso3[1]
            if "`k'" == "fr" {
                di as text "cname,iso2,iso3,dcgroup,mrpv5,mrpv6"
            }
            forvalue i = 1/10 {
                di as text "`cname',`iso2',`iso3',`i',`mrpv5d`i'',`mrpv6d`i''"
            }
    }
