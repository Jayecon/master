/*지역별고용조사의 회차별 dta 파일을 합쳐서 res.dta 파일을 생성*/
cd ~/dropbox/data/res/rawdata/
clear
tempfile tfile1
save `tfile1' , emptyok replace
    /*list of varlables{{{*/
        local vlist10h2 v1     v3  v4  v5    v8    v17   v42  v47 v48
        local rlist10h2 areadt sex age edulv educp mhour wage wgt eastat
        local vlist11h1 v2     v4  v5  v6    v8    v16   v35  v40 v41    v1
        local rlist11h1 areadt sex age edulv educp mhour wage wgt eastat sdate
        local vlist11h2 v2     v4  v5  v6    v9    v17   v42  v47 v48    v1
        local rlist11h2 areadt sex age edulv educp mhour wage wgt eastat sdate
        local vlist12h1 v2     v4  v5  v6    v9    v17   v36  v41 v42    v1
        local rlist12h1 areadt sex age edulv educp mhour wage wgt eastat sdate
        local vlist12h2 v2     v4  v5  v6    v9    v17   v42  v47 v48    v1
        local rlist12h2 areadt sex age edulv educp mhour wage wgt eastat sdate
        local vlist13h1 v2     v4  v5  v6    v9    v17   v36  v41 v42    v1
        local rlist13h1 areadt sex age edulv educp mhour wage wgt eastat sdate
        local vlist13h2 v2     v4  v5  v6    v9    v18   v39  v42 v43    v1
        local rlist13h2 areadt sex age edulv educp mhour wage wgt eastat sdate
        local vlist14h1 v2     v4  v5  v6    v9    v18   v38  v41 v42    v1
        local rlist14h1 areadt sex age edulv educp mhour wage wgt eastat sdate
        local vlist14h2 v2     v4  v5  v7    v10   v18   v38  v41 v42    v1
        local rlist14h2 areadt sex age edulv educp mhour wage wgt eastat sdate
        local vlist15h1 v2     v4  v5  v6    v9    v17   v28  v45 v44    v1
        local rlist15h1 areadt sex age edulv educp mhour wage wgt eastat sdate
        local vlist15h2 v2     v4  v5  v6    v9    v17   v28  v45 v44    v1
        local rlist15h2 areadt sex age edulv educp mhour wage wgt eastat sdate
        local vlist16h1 v2     v4  v5  v6    v9    v17   v28  v45 v44    v1
        local rlist16h1 areadt sex age edulv educp mhour wage wgt eastat sdate
        local vlist16h2 v2     v4  v5  v6    v9    v17   v28  v45 v44    v1
        local rlist16h2 areadt sex age edulv educp mhour wage wgt eastat sdate
        local vlist17h1 v2     v4  v5  v6    v9    v17   v28  v45 v44    v1
        local rlist17h1 areadt sex age edulv educp mhour wage wgt eastat sdate
        local vlist17h2 v2     v4  v5  v6    v9    v17   v28  v47 v46    v1
        local rlist17h2 areadt sex age edulv educp mhour wage wgt eastat sdate
        local vlist18h1 v2     v4  v5  v6    v9    v17   v28  v45 v44    v1
        local rlist18h1 areadt sex age edulv educp mhour wage wgt eastat sdate
        local vlist18h2 v2     v4  v5  v6    v9    v17   v28  v47 v46    v1
        local rlist18h2 areadt sex age edulv educp mhour wage wgt eastat sdate
        local vlist19h1 v2     v4  v5  v6    v10   v18   v29  v46 v45    v1
        local rlist19h1 areadt sex age edulv educp mhour wage wgt eastat sdate
        local vlist19h2 v2     v4  v5  v6    v9    v17   v28  v47 v46    v1
        local rlist19h2 areadt sex age edulv educp mhour wage wgt eastat sdate
        local vlist20h1 v2     v4  v5  v6    v10   v18   v29  v46 v45    v1
        local rlist20h1 areadt sex age edulv educp mhour wage wgt eastat sdate
        local vlist20h2 v2     v4  v5  v6    v9    v17   v28  v47 v46    v1
        local rlist20h2 areadt sex age edulv educp mhour wage wgt eastat sdate
        local vlist21h1 v3     v4  v5  v6    v10   v18   v30  v46 v47    v1
        local rlist21h1 areadt sex age edulv educp mhour wage wgt eastat sdate
        local vlist21h2 v45    v3  v4  v5    v8    v15   v27  v46 v47    v1
        local rlist21h2 areadt sex age edulv educp mhour wage wgt eastat sdate
        local vlist22h1 v3     v4  v5  v6    v10   v18   v30  v46 v47    v1
        local rlist22h1 areadt sex age edulv educp mhour wage wgt eastat sdate
        local vlist22h2 v45    v3  v4  v5    v8    v15   v27  v46 v47    v1
        local rlist22h2 areadt sex age edulv educp mhour wage wgt eastat sdate
        local vlist23h1 v3     v4  v5  v6    v10   v18   v30  v46 v47    v1
        local rlist23h1 areadt sex age edulv educp mhour wage wgt eastat sdate
    /*}}}*/
/*각 자료별 keep rename destring 하고 append{{{*/
use 2010_연간자료.dta, clear
    keep `vlist10h2'
    rename (`vlist10h2') (`rlist10h2')
    destring _all , replace
    /*exception control*/
        gen sdate = 201009
        label var sdate "조사년월"
    append using `tfile1'
    save `tfile1' , replace

use 2011_1분기.dta, clear
    keep `vlist11h1'
    rename (`vlist11h1') (`rlist11h1')
    destring _all , replace
    append using `tfile1'
    save `tfile1' , replace

use 2011_3분기.dta, clear
    keep `vlist11h2'
    rename (`vlist11h2') (`rlist11h2')
    destring _all , replace
    append using `tfile1'
    save `tfile1' , replace

use 2012_1분기.dta, clear
    keep `vlist12h1'
    rename (`vlist12h1') (`rlist12h1')
    destring _all , replace
    append using `tfile1'
    save `tfile1' , replace

use 2012_3분기.dta, clear
    keep `vlist12h2'
    rename (`vlist12h2') (`rlist12h2')
    destring _all , replace
    append using `tfile1'
    save `tfile1' , replace

use 2013_상반기.dta, clear
    keep `vlist13h1'
    rename (`vlist13h1') (`rlist13h1')
    destring _all , replace
    append using `tfile1'
    save `tfile1' , replace

use 2013_하반기.dta, clear
    keep `vlist13h2'
    rename (`vlist13h2') (`rlist13h2')
    destring _all , replace
    append using `tfile1'
    save `tfile1' , replace

use 2014_상반기.dta, clear
    keep `vlist14h1'
    rename (`vlist14h1') (`rlist14h1')
    destring _all , replace
    append using `tfile1'
    save `tfile1' , replace

use 2014_하반기.dta, clear
    keep `vlist14h2'
    rename (`vlist14h2') (`rlist14h2')
    destring _all , replace
    append using `tfile1'
    save `tfile1' , replace

use 2015_상반기.dta, clear
    keep `vlist15h1'
    rename (`vlist15h1') (`rlist15h1')
    destring _all , replace
    append using `tfile1'
    save `tfile1' , replace

use 2015_하반기.dta, clear
    keep `vlist15h2'
    rename (`vlist15h2') (`rlist15h2')
    destring _all , replace
    append using `tfile1'
    save `tfile1' , replace

use 2016_상반기.dta, clear
    keep `vlist16h1'
    rename (`vlist16h1') (`rlist16h1')
    destring _all , replace
    append using `tfile1'
    save `tfile1' , replace

use 2016_하반기.dta, clear
    keep `vlist16h2'
    rename (`vlist16h2') (`rlist16h2')
    destring _all , replace
    append using `tfile1'
    save `tfile1' , replace

use 2017_상반기.dta, clear
    keep `vlist17h1'
    rename (`vlist17h1') (`rlist17h1')
    destring _all , replace
    append using `tfile1'
    save `tfile1' , replace

use 2017_하반기.dta, clear
    keep `vlist17h2'
    rename (`vlist17h2') (`rlist17h2')
    destring _all , replace
    append using `tfile1'
    save `tfile1' , replace

use 2018_상반기.dta, clear
    keep `vlist18h1'
    rename (`vlist18h1') (`rlist18h1')
    destring _all , replace
    append using `tfile1'
    save `tfile1' , replace

use 2018_하반기.dta, clear
    keep `vlist18h2'
    rename (`vlist18h2') (`rlist18h2')
    destring _all , replace
    append using `tfile1'
    save `tfile1' , replace

use 2019_상반기.dta, clear
    keep `vlist19h1'
    rename (`vlist19h1') (`rlist19h1')
    destring _all , replace
    append using `tfile1'
    save `tfile1' , replace

use 2019_하반기.dta, clear
    keep `vlist19h2'
    rename (`vlist19h2') (`rlist19h2')
    destring _all , replace
    append using `tfile1'
    save `tfile1' , replace

use 2020_상반기.dta, clear
    keep `vlist20h1'
    rename (`vlist20h1') (`rlist20h1')
    destring _all , replace
    append using `tfile1'
    save `tfile1' , replace

use 2020_하반기.dta, clear
    keep `vlist20h2'
    rename (`vlist20h2') (`rlist20h2')
    destring _all , replace
    append using `tfile1'
    save `tfile1' , replace

use 2021_상반기.dta, clear
    keep `vlist21h1'
    rename (`vlist21h1') (`rlist21h1')
    destring _all , replace
    append using `tfile1'
    save `tfile1' , replace

use 2021_하반기.dta, clear
    keep `vlist21h2'
    rename (`vlist21h2') (`rlist21h2')
    destring _all , replace
    append using `tfile1'
    save `tfile1' , replace

use 2022_상반기.dta, clear
    keep `vlist22h1'
    rename (`vlist22h1') (`rlist22h1')
    destring _all , replace
    append using `tfile1'
    save `tfile1' , replace

use 2022_하반기.dta, clear
    keep `vlist22h2'
    rename (`vlist22h2') (`rlist22h2')
    destring _all , replace
    append using `tfile1'
    save `tfile1' , replace

use 2023_상반기.dta, clear
    keep `vlist23h1'
    rename (`vlist23h1') (`rlist23h1')
    destring _all , replace
    append using `tfile1'
    save `tfile1' , replace
/*}}}*/
    /*areadt cleaning*/
    /* label define AREADT{{{*/
        label define AREADT ///
            1100"서울특별시" ///
                1101"서울종로구" ///
                1102"서울중구" ///
                1103"서울용산구" ///
                1104"서울성동구" ///
                1105"서울광진구" ///
                1106"서울동대문구" ///
                1107"서울중랑구" ///
                1108"서울성북구" ///
                1109"서울강북구" ///
                1110"서울도봉구" ///
                1111"서울노원구" ///
                1112"서울은평구" ///
                1113"서울서대문구" ///
                1114"서울마포구" ///
                1115"서울양천구" ///
                1116"서울강서구" ///
                1117"서울구로구" ///
                1118"서울금천구" ///
                1119"서울영등포구" ///
                1120"서울동작구" ///
                1121"서울관악구" ///
                1122"서울서초구" ///
                1123"서울강남구" ///
                1124"서울송파구" ///
                1125"서울강동구" ///
            2100"부산광역시" ///
                2101"부산중구" ///
                2102"부산서구" ///
                2103"부산동구" ///
                2104"부산영도구" ///
                2105"부산부산진구" ///
                2106"부산동래구" ///
                2107"부산남구" ///
                2108"부산북구" ///
                2109"부산해운대구" ///
                2110"부산사하구" ///
                2111"부산금정구" ///
                2112"부산강서구" ///
                2113"부산연제구" ///
                2114"부산수영구" ///
                2115"부산사상구" ///
                2151"부산기장군" ///
            2200"대구광역시" ///
                2201"대구중구" ///
                2202"대구동구" ///
                2203"대구서구" ///
                2204"대구남구" ///
                2205"대구북구" ///
                2206"대구수성구" ///
                2207"대구달서구" ///
                2251"대구달성군" ///
            2300"인천광역시" ///
                2301"인천중구" ///
                2302"인천동구" ///
                2304"인천연수구" ///
                2305"인천남동구" ///
                2306"인천부평구" ///
                2307"인천계양구" ///
                2308"인천서구" ///
                2309"인천미추홀구" ///
                2351"인천강화군" ///
                2352"인천옹진군" ///
            2400"광주광역시" ///
                2401"광주동구" ///
                2402"광주서구" ///
                2403"광주남구" ///
                2404"광주북구" ///
                2405"광주광산구" ///
            2500"대전광역시" ///
                2501"대전동구" ///
                2502"대전중구" ///
                2503"대전서구" ///
                2504"대전유성구" ///
                2505"대전대덕구" ///
            2600"울산광역시" ///
                2601"울산중구" ///
                2602"울산남구" ///
                2603"울산동구" ///
                2604"울산북구" ///
                2651"울산울주군" ///
            2901"세종특별자치시" ///
            3100"경기도" ///
                3101"경기수원시" ///
                3102"경기성남시" ///
                3103"경기의정부시" ///
                3104"경기안양시" ///
                3105"경기부천시" ///
                3106"경기광명시" ///
                3107"경기평택시" ///
                3108"경기동두천시" ///
                3109"경기안산시" ///
                3110"경기고양시" ///
                3111"경기과천시" ///
                3112"경기구리시" ///
                3113"경기남양주시" ///
                3114"경기오산시" ///
                3115"경기시흥시" ///
                3116"경기군포시" ///
                3117"경기의왕시" ///
                3118"경기하남시" ///
                3119"경기용인시" ///
                3120"경기파주시" ///
                3121"경기이천시" ///
                3122"경기안성시" ///
                3123"경기김포시" ///
                3124"경기화성시" ///
                3125"경기광주시" ///
                3126"경기양주시" ///
                3127"경기포천시" ///
                3128"경기여주시" ///
                3155"경기연천군" ///
                3157"경기가평군" ///
                3158"경기양평군" ///
            3200"강원도" ///
                3201"강원춘천시" ///
                3202"강원원주시" ///
                3203"강원강릉시" ///
                3204"강원동해시" ///
                3205"강원태백시" ///
                3206"강원속초시" ///
                3207"강원삼척시" ///
                3251"강원홍천군" ///
                3252"강원횡성군" ///
                3253"강원영월군" ///
                3254"강원평창군" ///
                3255"강원정선군" ///
                3256"강원철원군" ///
                3257"강원화천군" ///
                3258"강원양구군" ///
                3259"강원인제군" ///
                3260"강원고성군" ///
                3261"강원양양군" ///
            3300"충청북도" ///
                3302"충북충주시" ///
                3303"충북제천시" ///
                3304"충북청주시" ///
                3352"충북보은군" ///
                3353"충북옥천군" ///
                3354"충북영동군" ///
                3355"충북진천군" ///
                3356"충북괴산군" ///
                3357"충북음성군" ///
                3358"충북단양군" ///
                3359"충북증평군" ///
            3400"충청남도" ///
                3401"충남천안시" ///
                3402"충남공주시" ///
                3403"충남보령시" ///
                3404"충남아산시" ///
                3405"충남서산시" ///
                3406"충남논산시" ///
                3407"충남계룡시" ///
                3408"충남당진시" ///
                3451"충남금산군" ///
                3452"충남연기군" ///
                3453"충남부여군" ///
                3454"충남서천군" ///
                3455"충남청양군" ///
                3456"충남홍성군" ///
                3457"충남예산군" ///
                3458"충남태안군" ///
            3500"전라북도" ///
                3501"전북전주시" ///
                3502"전북군산시" ///
                3503"전북익산시" ///
                3504"전북정읍시" ///
                3505"전북남원시" ///
                3506"전북김제시" ///
                3551"전북완주군" ///
                3552"전북진안군" ///
                3553"전북무주군" ///
                3554"전북장수군" ///
                3555"전북임실군" ///
                3556"전북순창군" ///
                3557"전북고창군" ///
                3558"전북부안군" ///
            3600"전라남도" ///
                3601"전남목포시" ///
                3602"전남여수시" ///
                3603"전남순천시" ///
                3604"전남나주시" ///
                3606"전남광양시" ///
                3651"전남담양군" ///
                3652"전남곡성군" ///
                3653"전남구례군" ///
                3655"전남고흥군" ///
                3656"전남보성군" ///
                3657"전남화순군" ///
                3658"전남장흥군" ///
                3659"전남강진군" ///
                3660"전남해남군" ///
                3661"전남영암군" ///
                3662"전남무안군" ///
                3663"전남함평군" ///
                3664"전남영광군" ///
                3665"전남장성군" ///
                3666"전남완도군" ///
                3667"전남진도군" ///
                3668"전남신안군" ///
            3700"경상북도" ///
                3701"경북포항시" ///
                3702"경북경주시" ///
                3703"경북김천시" ///
                3704"경북안동시" ///
                3705"경북구미시" ///
                3706"경북영주시" ///
                3707"경북영천시" ///
                3708"경북상주시" ///
                3709"경북문경시" ///
                3710"경북경산시" ///
                3751"경북군위군" ///
                3752"경북의성군" ///
                3753"경북청송군" ///
                3754"경북영양군" ///
                3755"경북영덕군" ///
                3756"경북청도군" ///
                3757"경북고령군" ///
                3758"경북성주군" ///
                3759"경북칠곡군" ///
                3760"경북예천군" ///
                3761"경북봉화군" ///
                3762"경북울진군" ///
                3763"경북울릉군" ///
            3800"경상남도" ///
                3803"경남진주시" ///
                3805"경남통영시" ///
                3806"경남사천시" ///
                3807"경남김해시" ///
                3808"경남밀양시" ///
                3809"경남거제시" ///
                3810"경남양산시" ///
                3811"경남창원시" ///
                3851"경남의령군" ///
                3852"경남함안군" ///
                3853"경남창녕군" ///
                3854"경남고성군" ///
                3855"경남남해군" ///
                3856"경남하동군" ///
                3857"경남산청군" ///
                3858"경남함양군" ///
                3859"경남거창군" ///
                3860"경남합천군" ///
            3900"제주특별자치도" ///
                3901"제주제주시" ///
                3902"제주서귀포시" ///
            8888"외국" ///
            9999"선박"
    /*}}}*/
    /* 자료별 areadt mismatch {{{*/
        replace areadt = 2151 if areadt == 2131
        replace areadt = 2251 if areadt == 2231
        replace areadt = 2309 if areadt == 2303
        replace areadt = 2351 if areadt == 2331
        replace areadt = 2352 if areadt == 2332
        replace areadt = 2651 if areadt == 2631
        replace areadt = 3128 if areadt == 3132
        replace areadt = 3155 if areadt == 3135
        replace areadt = 3157 if areadt == 3137
        replace areadt = 3158 if areadt == 3138
        replace areadt = 3251 if areadt == 3231
        replace areadt = 3252 if areadt == 3232
        replace areadt = 3253 if areadt == 3233
        replace areadt = 3254 if areadt == 3234
        replace areadt = 3255 if areadt == 3235
        replace areadt = 3256 if areadt == 3236
        replace areadt = 3257 if areadt == 3237
        replace areadt = 3258 if areadt == 3238
        replace areadt = 3259 if areadt == 3239
        replace areadt = 3260 if areadt == 3240
        replace areadt = 3261 if areadt == 3241
        replace areadt = 3304 if areadt == 3301
        replace areadt = 3304 if areadt == 3331
        replace areadt = 3352 if areadt == 3332
        replace areadt = 3353 if areadt == 3333
        replace areadt = 3354 if areadt == 3334
        replace areadt = 3355 if areadt == 3335
        replace areadt = 3356 if areadt == 3336
        replace areadt = 3357 if areadt == 3337
        replace areadt = 3358 if areadt == 3338
        replace areadt = 3359 if areadt == 3339
        replace areadt = 3451 if areadt == 3431
        replace areadt = 3452 if areadt == 3432
        replace areadt = 3453 if areadt == 3433
        replace areadt = 3454 if areadt == 3434
        replace areadt = 3455 if areadt == 3435
        replace areadt = 3456 if areadt == 3436
        replace areadt = 3457 if areadt == 3437
        replace areadt = 3458 if areadt == 3438
        replace areadt = 3408 if areadt == 3439
        replace areadt = 3551 if areadt == 3531
        replace areadt = 3552 if areadt == 3532
        replace areadt = 3553 if areadt == 3533
        replace areadt = 3554 if areadt == 3534
        replace areadt = 3555 if areadt == 3535
        replace areadt = 3556 if areadt == 3536
        replace areadt = 3557 if areadt == 3537
        replace areadt = 3558 if areadt == 3538
        replace areadt = 3651 if areadt == 3631
        replace areadt = 3652 if areadt == 3632
        replace areadt = 3653 if areadt == 3633
        replace areadt = 3654 if areadt == 3634
        replace areadt = 3655 if areadt == 3635
        replace areadt = 3656 if areadt == 3636
        replace areadt = 3657 if areadt == 3637
        replace areadt = 3658 if areadt == 3638
        replace areadt = 3659 if areadt == 3639
        replace areadt = 3660 if areadt == 3640
        replace areadt = 3661 if areadt == 3641
        replace areadt = 3662 if areadt == 3642
        replace areadt = 3663 if areadt == 3643
        replace areadt = 3664 if areadt == 3644
        replace areadt = 3665 if areadt == 3645
        replace areadt = 3666 if areadt == 3646
        replace areadt = 3667 if areadt == 3647
        replace areadt = 3668 if areadt == 3648
        replace areadt = 3751 if areadt == 3731
        replace areadt = 3752 if areadt == 3732
        replace areadt = 3753 if areadt == 3733
        replace areadt = 3754 if areadt == 3734
        replace areadt = 3755 if areadt == 3735
        replace areadt = 3756 if areadt == 3736
        replace areadt = 3757 if areadt == 3737
        replace areadt = 3758 if areadt == 3738
        replace areadt = 3759 if areadt == 3739
        replace areadt = 3760 if areadt == 3740
        replace areadt = 3761 if areadt == 3741
        replace areadt = 3762 if areadt == 3742
        replace areadt = 3763 if areadt == 3743
        replace areadt = 3851 if areadt == 3831
        replace areadt = 3852 if areadt == 3832
        replace areadt = 3853 if areadt == 3833
        replace areadt = 3854 if areadt == 3834
        replace areadt = 3855 if areadt == 3835
        replace areadt = 3856 if areadt == 3836
        replace areadt = 3857 if areadt == 3837
        replace areadt = 3858 if areadt == 3838
        replace areadt = 3859 if areadt == 3839
        replace areadt = 3860 if areadt == 3840
    /*}}}*/
        label value areadt AREADT
    /*gen aread : 광역시의 구 단위 조사는 2021년 부터 시행*/
        recode areadt (1100/1199 = 1100) (2100/2199 = 2100) (2200/2299 = 2200) ///
            (2500/2599 = 2500) (2300/2399 = 2300) (2400/2499 = 2400) (2600/2699 = 2600) ///
            , gen(aread)
        label var aread "시군"
        label value aread AREADT
    /*gen area : GOMS의 지역구분으로 맞춤*/
        recode areadt (1100/1199 = 1) (2100/2199 = 2) (2200/2299 = 3) (2500/2599 = 4) ///
            (2300/2399 = 5) (2400/2499 = 6) (2600/2699 = 7) (3100/3199 = 8) (3200/3299 = 9) ///
            (3300/3399 = 10) (3400/3499 = 11) (3500/3599 = 12) (3600/3699 = 13) (3700/3799 = 14) ///
            (3800/3899 = 15) (3900/3999 = 16) (2901 = 17) (8888 9999 = .) ///
            , gen(area)
        label define AREA -1 "모름/무응답" 1 "서울" 2 "부산" 3 "대구" 4 "대전" 5 "인천" ///
            6 "광주" 7 "울산" 8 "경기" 9 "강원" 10 "충북" 11 "충남" 12 "전북" 13 "전남" ///
            14 "경북" 15 "경남" 16 "제주" 17 "세종"
        label value area AREA
        label var area "시도"
save res , replace
