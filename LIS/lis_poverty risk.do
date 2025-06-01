* 1. LIS 데이터 불러오기
    use $au20h, clear

* 2. 추가 변수 정의
    gen min     = hitotal - hpublic
    gen pwgt    = hpopwgt * nhhmem
    gen nhhmem1864 = nhhmem - nhhmem65 - nhhmem17

* 3. 균등화 소득 변수
    gen ehhmen    = sqrt(nhhmem)
    gen emin      = min      / ehhmen
    gen ehitotal  = hitotal  / ehhmen
    gen edhi      = dhi      / ehhmen
    gen ehpublic  = hpublic  / ehhmen
    gen ehi31     = hi31     / ehhmen
    gen ehipubsoc = hipubsoc / ehhmen
    gen ehxitsc   = hxitsc   / ehhmen

* 4. 가구유형 구분
    capture drop hhtype
        gen hhtype = .
        replace hhtype = 1 if nhhmem == 1                  & nhhmem65 == 1
        replace hhtype = 2 if nhhmem == nhhmem65
        replace hhtype = 3 if nhhmem == 1                  & nhhmem1864 == 1
        replace hhtype = 4 if nhhmem == 2                  & nhhmem1864 == 2
        replace hhtype = 5 if (nhhmem65 + nhhmem1864) >= 1 & nhhmem17 == 0
        replace hhtype = 6 if nhhmem65 > 0                 & nhhmem1864 == 0 & nhhmem17 > 0
        replace hhtype = 6 if nhhmem65 == 0                & nhhmem1864 == 1 & nhhmem17 > 0
        replace hhtype = 7 if nhhmem65 == 0                & nhhmem1864 == 2 & nhhmem17 > 0
        replace hhtype = 8 if nhhmem1864 >= 3
        replace hhtype = 9 if missing(hhtype)

* 5. 가중 분위수 계산
    xtile dcgroup = emin [aw=hpopwgt], nq(10)
    xtile qtgroup = emin [aw=hpopwgt], nq(5)

* 6. 중위소득 계산 (weighted median)
    _pctile emin [aw=hpopwgt], p(50)
    scalar p50 = r(r1)
    gen pv5 = emin < 0.5 * p50
    gen pv6 = emin < 0.6 * p50

* 7. 빈곤위험도 할당 (수치는 예시)
    gen rpv5 = .
        replace rpv5 = 0.824 if hhtype==1
        replace rpv5 = 0.715 if hhtype==2
        replace rpv5 = 0.326 if hhtype==3
        replace rpv5 = 0.141 if hhtype==4
        replace rpv5 = 0.197 if hhtype==5
        replace rpv5 = 0.704 if hhtype==6
        replace rpv5 = 0.185 if hhtype==7
        replace rpv5 = 0.163 if hhtype==8
        replace rpv5 = 0.481 if hhtype==9
    gen rpv6 = .
        replace rpv6 = 0.835 if hhtype==1
        replace rpv6 = 0.745 if hhtype==2
        replace rpv6 = 0.317 if hhtype==3
        replace rpv6 = 0.142 if hhtype==4
        replace rpv6 = 0.193 if hhtype==5
        replace rpv6 = 0.720 if hhtype==6
        replace rpv6 = 0.193 if hhtype==7
        replace rpv6 = 0.143 if hhtype==8
        replace rpv6 = 0.542 if hhtype==9

* 8. 소득분위별 빈곤위험도 평균 계산
    local cname = cname[1]
    local iso2 = iso2[1]
    local iso3 = iso3[1]
    local year = year[1]

* 9. 소득분위별 빈곤위험도 평균 계산
    forvalue i = 1/5 {
        summarize rpv5 , meanonly
        local mrpv5q`i' = r(mean)
    }
    forvalue i = 1/5 {
        summarize rpv6 , meanonly
        local mrpv6q`i' = r(mean)
    }
    local varlist ehpublic ehi31 ehipubsoc ehxitsc emin ehitotal edhi
    foreach j of local varlist {
        summarize `j' [aw=pwgt], meanonly
        local `j'q0 = r(sum)
        forvalue i = 1/5 {
            summarize `j' if qtgroup == `i' [aw=pwgt] , meanonly
            local `j'q`i' = r(sum)
        }
    }
/** 9. 결과 출력*/
    /*tabstat rpv5 [aw=hpopwgt], by(qtgroup) stats(mean)*/
    /*tabstat rpv6 [aw=hpopwgt], by(qtgroup) stats(mean)*/

/** 10. 전체 및 분위별 소득항목별 총액 (가중치 적용)*/
    /*collapse (sum) ehpublic ehi31 ehipubsoc ehxitsc emin ehitotal edhi [pweight=pwgt], by(qtgroup)*/
    /*tabstat ehpublic ehi31 ehipubsoc ehxitsc emin ehitotal edhi , by(qtgroup) stats(sum) format(%13.0f)*/

di as text "`cname'; `iso2'; `iso3'; `year'; `mrpv5q1'; `mrpv5q2'; `mrpv5q3'; `mrpv5q4'; `mrpv5q5'; `mrpv6q1'; `mrpv6q2'; `mrpv6q3'; `mrpv6q4'; `mrpv6q5'; `ehpublicq0'; `ehpublicq1'; `ehpublicq2'; `ehpublicq3'; `ehpublicq4'; `ehpublicq5'; `ehi31q0'; `ehi31q1'; `ehi31q2'; `ehi31q3'; `ehi31q4'; `ehi31q5'; `ehipubsocq0'; `ehipubsocq1'; `ehipubsocq2'; `ehipubsocq3'; `ehipubsocq4'; `ehipubsocq5'; `ehxitscq0'; `ehxitscq1'; `ehxitscq2'; `ehxitscq3'; `ehxitscq4'; `ehxitscq5'; `eminq0'; `eminq1'; `eminq2'; `eminq3'; `eminq4'; `eminq5'; `ehitotalq0'; `ehitotalq1'; `ehitotalq2'; `ehitotalq3'; `ehitotalq4'; `ehitotalq5'; `edhiq0'; `edhiq1'; `edhiq2'; `edhiq3'; `edhiq4'; `edhiq5';"
