cd ~/GitHub/master/YFCenter

use yfc_raw , clear
    rename _all , lower
    keep if inlist(ab ,2 ,3)
    drop t maxt
    /*covert sample to dummy*/
        gen t = sample == "적격"
        drop sample
        rename t sample
        label var sample "적격여부"
    /*gen numt*/
        sort nid m
        bys nid : gen nx = _n 
        label var nx "응답횟수"
        bys nid : gen mx = _N 
        label var mx "최대응답횟수"
    drop if !sample & sty == 2025
    /*clean ab*/
        label var ab "참가프로그램 유형" 
        label define AB 2 "중첩" , modify
    /*rename m dset*/
        rename m dset
    /*lsns*/
        /*foreach i in 1 2 3 5 6 7 {*/
            /*replace lsns`i' = "1" if lsns`i' == "1명"*/
            /*replace lsns`i' = "2" if lsns`i' == "2명"*/
            /*replace lsns`i' = "3" if lsns`i' == "3-4명"*/
            /*replace lsns`i' = "4" if lsns`i' == "5-8명"*/
            /*replace lsns`i' = "5" if lsns`i' == "9명이상"*/
            /*replace lsns`i' = "0" if lsns`i' == "없다"*/
        /*}*/
        /*foreach i in 4 8 {*/
            /*replace lsns`i' = "1" if lsns`i' == "가끔있다"*/
            /*replace lsns`i' = "2" if lsns`i' == "거의없다"*/
            /*replace lsns`i' = "3" if lsns`i' == "매우자주있다"*/
            /*replace lsns`i' = "4" if lsns`i' == "자주있다"*/
            /*replace lsns`i' = "5" if lsns`i' == "전혀없다"*/
            /*replace lsns`i' = "0" if lsns`i' == "항상있다"*/
        /*}*/
        /*forvalue i = 1/8 {*/
            /*destring lsns`i', replace*/
        /*}*/
        egen lsnsfam = rowtotal(lsns1 lsns2 lsns3) , missing
            label var lsnsfam "사회적유대 가족"
        egen lsnsfrd = rowtotal(lsns5 lsns6 lsns7) , missing
            label var lsnsfrd "사회적유대 친구"
        egen lsnsspt = rowtotal(lsns4 lsns8 ) , missing
            label var lsnsspt "사회적지지"
    /*hq25*/
        label define HQ 1 "전혀아니다" 2 "아니다" 3 "보통이다" 4 "그렇다" 5 "매우그렇다"
        gen fhq4  = 4 - hq4
        gen fhq8  = 4 - hq8
        gen fhq10 = 4 - hq10
        gen fhq15 = 4 - hq15
        gen fhq21 = 4 - hq21
        gen fhq22 = 4 - hq22
        gen fhq25 = 4 - hq25
        forvalue i = 1/8 {
            label value hq`i' HQ
        }
        egen thqsec = rowtotal(hq2 hq5) , missing
            label var thqsec "물리적 은둔"
        egen thqsoc = rowtotal(hq1 fhq4 hq6 fhq8 hq11 fhq15 hq18 hq20 hq23 fhq25) , missing
            label var thqsec "사회성"
        egen thqiso = rowtotal(hq9 hq12 hq13 hq16 hq19 fhq22 hq24) , missing
            label var thqsec "고립"
        egen thqspt = rowtotal(hq3 hq7 fhq10 hq14 hq17 fhq21) , missing
            label var thqsec "사회적 지지"
    /*c2*/
        egen c2pos = rowtotal(c2a c2b c2c ) , missing
            label var c2pos "삶의 통제감(긍적적)"
        egen c2neg = rowtotal(c2d c2e c2f) , missing
            label var c2neg "삶의 통제감(부정적)"
    /*c4*/
        replace c4 = "1" if strpos(c4 , "전혀")
        replace c4 = "2" if strpos(c4 , "어느")
        replace c4 = "3" if strpos(c4 , "완벽")
        destring c4 , replace
        label define C4 1 "실현불가" 2 "부분가능" 3 "완벽실현"
        label values c4 C4    
save yfc , replace
