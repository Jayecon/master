/*호출변수 목록 생성*/
    local datalist fr se kr jp uk us
    /*pv5 scalars{{{*/
        scalar frpv5t1 = .8822435557842254
        scalar frpv5t2 = .8466526627540588
        scalar frpv5t3 = .3658936202526092
        scalar frpv5t4 = .2019227802753449
        scalar frpv5t5 = .2847796976566315
        scalar frpv5t6 = .4661048591136933
        scalar frpv5t7 = .1401366144418716
        scalar frpv5t8 = .1584531769156456
        scalar frpv5t9 = .461115825176239
        scalar jppv5t1 = .4234922736883163
        scalar jppv5t2 = .1373156324028969
        scalar jppv5t3 = .1848604097962379
        scalar jppv5t4 = .0785118963569403
        scalar jppv5t5 = .1365521863102913
        scalar jppv5t6 = .3620704412460327
        scalar jppv5t7 = .0617576409131289
        scalar jppv5t8 = .1276022106409073
        scalar jppv5t9 = .1496874570846558
        scalar krpv5t1 = .8126856784025828
        scalar krpv5t2 = .5979460974534353
        scalar krpv5t3 = .3121382296085358
        scalar krpv5t4 = .1516160716613134
        scalar krpv5t5 = .117493304113547
        scalar krpv5t6 = .4581379294395447
        scalar krpv5t7 = .0931216043730577
        scalar krpv5t8 = .0884350767980019
        scalar krpv5t9 = .1724237824479739
        scalar sepv5t1 = .8455428540706634
        scalar sepv5t2 = .6720898389816284
        scalar sepv5t3 = .3624374836683273
        scalar sepv5t4 = .0971292622387409
        scalar sepv5t5 = .1418916836380958
        scalar sepv5t6 = .3769566655158997
        scalar sepv5t7 = .1269379481673241
        scalar sepv5t8 = .149249979108572
        scalar sepv5t9 = .3819241836667061
        scalar ukpv5t1 = .7635461807250976
        scalar ukpv5t2 = .5710752785205842
        scalar ukpv5t3 = .3612029850482941
        scalar ukpv5t4 = .1184371829032898
        scalar ukpv5t5 = .17129046022892
        scalar ukpv5t6 = .7529336094856263
        scalar ukpv5t7 = .2112693592905998
        scalar ukpv5t8 = .1997040539979935
        scalar ukpv5t9 = .4313078492879868
        scalar uspv5t1 = .7544791877269745
        scalar uspv5t2 = .5865679442882538
        scalar uspv5t3 = .325478258728981
        scalar uspv5t4 = .1600376799702644
        scalar uspv5t5 = .2240241140127182
        scalar uspv5t6 = .5889186978340148
        scalar uspv5t7 = .2039042830467224
        scalar uspv5t8 = .2034007161855698
        scalar uspv5t9 = .3543424665927887
    /*}}}*/
    /*pv6 scalars{{{*/
        scalar frpv6t1 = .9008320212364197
        scalar frpv6t2 = .8700130343437195
        scalar frpv6t3 = .3925652384757995
        scalar frpv6t4 = .2262740626931191
        scalar frpv6t5 = .315827864408493
        scalar frpv6t6 = .5204449146986008
        scalar frpv6t7 = .1807365253567696
        scalar frpv6t8 = .1997570812702179
        scalar frpv6t9 = .5318299442529678
        scalar jppv6t1 = .5435693442821503
        scalar jppv6t2 = .2412948355078697
        scalar jppv6t3 = .2639788746833801
        scalar jppv6t4 = .110128266364336
        scalar jppv6t5 = .1892142787575722
        scalar jppv6t6 = .4267252624034882
        scalar jppv6t7 = .1195139169692993
        scalar jppv6t8 = .1806850209832191
        scalar jppv6t9 = .206596414744854
        scalar krpv6t1 = .8633189102013906
        scalar krpv6t2 = .6834552983442942
        scalar krpv6t3 = .3841019968191783
        scalar krpv6t4 = .2107924794157346
        scalar krpv6t5 = .1653599664568901
        scalar krpv6t6 = .5723810444275538
        scalar krpv6t7 = .1481623401244481
        scalar krpv6t8 = .1343461287518342
        scalar krpv6t9 = .2317810182770093
        scalar sepv6t1 = .8716694951057434
        scalar sepv6t2 = .7242617785930634
        scalar sepv6t3 = .3970932722091675
        scalar sepv6t4 = .1156138099730015
        scalar sepv6t5 = .1695046126842499
        scalar sepv6t6 = .4317498177289963
        scalar sepv6t7 = .1639791741967201
        scalar sepv6t8 = .1759012952446938
        scalar sepv6t9 = .4320654809474945
        scalar ukpv6t1 = .8080550611019135
        scalar ukpv6t2 = .6289283692836761
        scalar ukpv6t3 = .391408109664917
        scalar ukpv6t4 = .14179353043437
        scalar ukpv6t5 = .2055666238069534
        scalar ukpv6t6 = .7956693291664123
        scalar ukpv6t7 = .2596901804208755
        scalar ukpv6t8 = .2411232426762581
        scalar ukpv6t9 = .4771475315093994
        scalar uspv6t1 = .7841616094112396
        scalar uspv6t2 = .6267612993717193
        scalar uspv6t3 = .3604522466659546
        scalar uspv6t4 = .1895810797810555
        scalar uspv6t5 = .2624601721763611
        scalar uspv6t6 = .6558062553405761
        scalar uspv6t7 = .2574362307786942
        scalar uspv6t8 = .2601524576544761
        scalar uspv6t9 = .4187516689300537
    /*}}}*/
    foreach k of local datalist {
        qui {
        /*자료호출*/
            use $`k'20h, clear
        /*변수조작*/
            /*변수생성 : 국가별 예외*/
                if "`k'" == "jp" | "`k'" == "kr" {
                    drop hpublic
                    egen hpublic = rowtotal(hipubsoc hi31 hi32)
                        label var hpublic "Public tasfers(replaced)"
                }
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
                replace hhtype = 6 if missing(hhtype) & (nhhmem65 >=1 & nhhmem1864 == 0 & nhhmem17 >= 1) | (nhhmem65 == 0 & nhhmem1864 == 1 & nhhmem17 >= 1) 
                    // 조손가구 또는 한부모가구 : 정의가 튄다.
                replace hhtype = 7 if missing(hhtype) & nhhmem65 == 0 & nhhmem1864 == 2 & nhhmem17 >= 1 // 근로연령 2인 + 아동
                replace hhtype = 8 if missing(hhtype) & nhhmem1864 >= 3 // 근로연령 3인 이상 + 아동(노인 무관)
                replace hhtype = 9 if missing(hhtype) //기타
        /*위험도 할당*/
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
        /*변수 생성 : 가중 분위수 집단*/
            xtile dcgroup = emin [aw=hpopwgt], nq(10)
            xtile pcgroup = emin [aw=hpopwgt], nq(100)
        /*소득분위별 위험도 평균계산*/
            forvalue i = 1/10 {
                summarize rpv5 [aw=hpopwgt] if dcgroup == `i' , meanonly
                local mrpv5d`i' = r(mean)
                summarize rpv6 [aw=hpopwgt] if dcgroup == `i' , meanonly
                local mrpv6d`i' = r(mean)
            }
            forvalue i = 1/100 {
                summarize rpv5 [aw=hpopwgt] if pcgroup == `i' , meanonly
                local mrpv5p`i' = r(mean)
                summarize rpv6 [aw=hpopwgt] if pcgroup == `i' , meanonly
                local mrpv6p`i' = r(mean)
            }
        }
        /*결과 출력*/
            local cname = cname[1]
            local iso2 = iso2[1]
            local iso3 = iso3[1]
            if "`k'" == "fr" {
                di as text "cname,iso2,iso3,group,grtype,mrpv5,mrpv6"
            }
            forvalue i = 1/10 {
                di as text "`cname',`iso2',`iso3',`i',1,`mrpv5d`i'',`mrpv6d`i''"
            }
            forvalue i = 1/100 {
                di as text "`cname',`iso2',`iso3',`i',2,`mrpv5p`i'',`mrpv6p`i''"
            }
    }
