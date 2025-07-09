    local datalist fr se kr jp uk us
        /*rent scalars{{{*/
            scalar frrtt1 = .1501409855067322
            scalar frrtt2 = .1818442763920757
            scalar frrtt3 = .1182751992018893
            scalar frrtt4 = .1391242563950073
            scalar frrtt5 = .1638426387500658
            scalar frrtt6 = .1553707281098468
            scalar frrtt7 = .1677285788289737
            scalar frrtt8 = .1699936509132385
            scalar frrtt9 = .1561719009303488
            scalar jprtt1 = .147425701469183
            scalar jprtt2 = .1162389807403088
            scalar jprtt3 = .1180476047098637
            scalar jprtt4 = .1099310882389545
            scalar jprtt5 = .1379492312669754
            scalar jprtt6 = .2180543426424265
            scalar jprtt7 = .1438057027757168
            scalar jprtt8 = .1401426926255226
            scalar jprtt9 = .1475979946553707
            scalar krrtt1 = .0007139500618602
            scalar krrtt2 = .0001565348587368
            scalar krrtt3 = .0010929139680229
            scalar krrtt4 = .0002361008373555
            scalar krrtt5 = .0000398090730111
            scalar krrtt6 = 0
            scalar krrtt7 = .0000155394069831
            scalar krrtt8 = .0000853161133515
            scalar krrtt9 = 0
            scalar sertt1 = .1645832359790802
            scalar sertt2 = .0495460584759712
            scalar sertt3 = .1344752181961667
            scalar sertt4 = .0611648671329021
            scalar sertt5 = .051773127168417
            scalar sertt6 = .2926333218812943
            scalar sertt7 = .1341796860098839
            scalar sertt8 = .152448220551014
            scalar sertt9 = .2821669429540634
            scalar ukrtt1 = .0614068694412708
            scalar ukrtt2 = .0231423530727625
            scalar ukrtt3 = .2010756507515907
            scalar ukrtt4 = .1087394431233406
            scalar ukrtt5 = .1128127112984657
            scalar ukrtt6 = .5216966480016708
            scalar ukrtt7 = .1979364678263664
            scalar ukrtt8 = .1581566087901592
            scalar ukrtt9 = .1370696105062962
            scalar usrtt1 = .0113490806892514
            scalar usrtt2 = .0064387765713036
            scalar usrtt3 = .0223130209371448
            scalar usrtt4 = .0074667093809694
            scalar usrtt5 = .0047223703702912
            scalar usrtt6 = .0047818269347772
            scalar usrtt7 = .0016347891592886
            scalar usrtt8 = .001254449330736
            scalar usrtt9 = .0014345584670082
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
                replace hhtype = 6 if missing(hhtype) & (nhhmem65 >=1 & nhhmem1864 == 0 & nhhmem17 >= 1) | (nhhmem65 == 0 & nhhmem1864 == 1 & nhhmem17 >= 1) 
                    // 조손가구 또는 한부모가구 : 정의가 튄다.
                replace hhtype = 7 if missing(hhtype) & nhhmem65 == 0 & nhhmem1864 == 2 & nhhmem17 >= 1 // 근로연령 2인 + 아동
                replace hhtype = 8 if missing(hhtype) & nhhmem1864 >= 3 // 근로연령 3인 이상 + 아동(노인 무관)
                replace hhtype = 9 if missing(hhtype) //기타
        /*위험도 할당*/
            gen rent = .
                replace rent = `k'rtt1 if hhtype==1
                replace rent = `k'rtt2 if hhtype==2
                replace rent = `k'rtt3 if hhtype==3
                replace rent = `k'rtt4 if hhtype==4
                replace rent = `k'rtt5 if hhtype==5
                replace rent = `k'rtt6 if hhtype==6
                replace rent = `k'rtt7 if hhtype==7
                replace rent = `k'rtt8 if hhtype==8
                replace rent = `k'rtt9 if hhtype==9
        /*변수 생성 : 가중 분위수 집단*/
            xtile dcgroup = emin [aw=hpopwgt], nq(10)
            xtile pcgroup = emin [aw=hpopwgt], nq(100)
        /*소득분위별 위험도 평균계산*/
            forvalue i = 1/10 {
                summarize rent [aw=hpopwgt] if dcgroup == `i' , meanonly
                local rentd`i' = r(mean)
            }
            forvalue i = 1/100 {
                summarize rent [aw=hpopwgt] if pcgroup == `i' , meanonly
                local rentp`i' = r(mean)
            }
        }
        /*결과 출력*/
            local cname = cname[1]
            local iso2 = iso2[1]
            local iso3 = iso3[1]
            if "`k'" == "fr" {
                di as text "cname,iso2,iso3,group,grtype,rent"
            }
            forvalue i = 1/10 {
                di as text "`cname',`iso2',`iso3',`i',1,`rentd`i''"
            }
            forvalue i = 1/100 {
                di as text "`cname',`iso2',`iso3',`i',2,`rentp`i''"
            }
    }
