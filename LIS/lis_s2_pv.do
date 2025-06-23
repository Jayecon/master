/*호출변수 목록 생성*/
    local datalist fr se kr jp uk us
    /*pv5 scalars{{{*/
        scalar frpv5t1 = .7423063319708619
        scalar frpv5t2 = .5665123241820506
        scalar frpv5t3 = .3191349455820663
        scalar frpv5t4 = .1333943651323872
        scalar frpv5t5 = .3259320888402207
        scalar frpv5t6 = .503904826939106
        scalar frpv5t7 = .1428355015149074
        scalar frpv5t8 = .1271109993436507
        scalar frpv5t9 = .3360414377280644
        scalar jppv5t1 = .7423063319708619
        scalar jppv5t2 = .5665123241820506
        scalar jppv5t3 = .3191349455820663
        scalar jppv5t4 = .1333943651323872
        scalar jppv5t5 = .3259320888402207
        scalar jppv5t6 = .503904826939106
        scalar jppv5t7 = .1428355015149074
        scalar jppv5t8 = .1271109993436507
        scalar jppv5t9 = .3360414377280644
        scalar krpv5t1 = .7423063319708619
        scalar krpv5t2 = .5665123241820506
        scalar krpv5t3 = .3191349455820663
        scalar krpv5t4 = .1333943651323872
        scalar krpv5t5 = .3259320888402207
        scalar krpv5t6 = .503904826939106
        scalar krpv5t7 = .1428355015149074
        scalar krpv5t8 = .1271109993436507
        scalar krpv5t9 = .3360414377280644
        scalar sepv5t1 = .7423063319708619
        scalar sepv5t2 = .5665123241820506
        scalar sepv5t3 = .3191349455820663
        scalar sepv5t4 = .1333943651323872
        scalar sepv5t5 = .3259320888402207
        scalar sepv5t6 = .503904826939106
        scalar sepv5t7 = .1428355015149074
        scalar sepv5t8 = .1271109993436507
        scalar sepv5t9 = .3360414377280644
        scalar ukpv5t1 = .7423063319708619
        scalar ukpv5t2 = .5665123241820506
        scalar ukpv5t3 = .3191349455820663
        scalar ukpv5t4 = .1333943651323872
        scalar ukpv5t5 = .3259320888402207
        scalar ukpv5t6 = .503904826939106
        scalar ukpv5t7 = .1428355015149074
        scalar ukpv5t8 = .1271109993436507
        scalar ukpv5t9 = .3360414377280644
        scalar uspv5t1 = .7423063319708619
        scalar uspv5t2 = .5665123241820506
        scalar uspv5t3 = .3191349455820663
        scalar uspv5t4 = .1333943651323872
        scalar uspv5t5 = .3259320888402207
        scalar uspv5t6 = .503904826939106
        scalar uspv5t7 = .1428355015149074
        scalar uspv5t8 = .1271109993436507
        scalar uspv5t9 = .3360414377280644
    /*}}}*/
    /*pv6 scalars{{{*/
        scalar frpv6t1 = .7904069423675537
        scalar frpv6t2 = .6252379457333258
        scalar frpv6t3 = .363564096391201
        scalar frpv6t4 = .1624761137313076
        scalar frpv6t5 = .3797788734414748
        scalar frpv6t6 = .5667543224990368
        scalar frpv6t7 = .1911166842494692
        scalar frpv6t8 = .162866076055382
        scalar frpv6t9 = .3938320805983884
        scalar jppv6t1 = .7904069423675537
        scalar jppv6t2 = .6252379457333258
        scalar jppv6t3 = .363564096391201
        scalar jppv6t4 = .1624761137313076
        scalar jppv6t5 = .3797788734414748
        scalar jppv6t6 = .5667543224990368
        scalar jppv6t7 = .1911166842494692
        scalar jppv6t8 = .162866076055382
        scalar jppv6t9 = .3938320805983884
        scalar krpv6t1 = .7904069423675537
        scalar krpv6t2 = .6252379457333258
        scalar krpv6t3 = .363564096391201
        scalar krpv6t4 = .1624761137313076
        scalar krpv6t5 = .3797788734414748
        scalar krpv6t6 = .5667543224990368
        scalar krpv6t7 = .1911166842494692
        scalar krpv6t8 = .162866076055382
        scalar krpv6t9 = .3938320805983884
        scalar sepv6t1 = .7904069423675537
        scalar sepv6t2 = .6252379457333258
        scalar sepv6t3 = .363564096391201
        scalar sepv6t4 = .1624761137313076
        scalar sepv6t5 = .3797788734414748
        scalar sepv6t6 = .5667543224990368
        scalar sepv6t7 = .1911166842494692
        scalar sepv6t8 = .162866076055382
        scalar sepv6t9 = .3938320805983884
        scalar ukpv6t1 = .7904069423675537
        scalar ukpv6t2 = .6252379457333258
        scalar ukpv6t3 = .363564096391201
        scalar ukpv6t4 = .1624761137313076
        scalar ukpv6t5 = .3797788734414748
        scalar ukpv6t6 = .5667543224990368
        scalar ukpv6t7 = .1911166842494692
        scalar ukpv6t8 = .162866076055382
        scalar ukpv6t9 = .3938320805983884
        scalar uspv6t1 = .7904069423675537
        scalar uspv6t2 = .6252379457333258
        scalar uspv6t3 = .363564096391201
        scalar uspv6t4 = .1624761137313076
        scalar uspv6t5 = .3797788734414748
        scalar uspv6t6 = .5667543224990368
        scalar uspv6t7 = .1911166842494692
        scalar uspv6t8 = .162866076055382
        scalar uspv6t9 = .3938320805983884
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
