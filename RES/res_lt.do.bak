local path ~/dropbox/data/res/
tempfile tfile1
save `tfile1' , replace emptyok

    use `path'/res.dta ///
        if (inlist(edulv , 4 , 5 , 6 , 7) | (edulv == 3 & educp == 1)) ////
            & ((inrange(age , 20 , 34) & sex == 1) | (inrange(age , 18 , 34) & sex == 2)) ///
            , clear
    do ~/github/master/res/res_lt_collapse.do
    rename * *_hs
    rename (aread sdate) (aread sdate)
    save `tfile1' , replace

    use `path'/res.dta ///
        if (inlist(edulv , 5 , 6 , 7) | (edulv == 4 & educp == 1)) ///
            & ((inrange(age , 22 , 34) & sex == 1) | (inrange(age , 20 , 34) & sex == 2)) ///
            , clear
    do ~/github/master/res/res_lt_collapse.do
    rename * *_cc
    rename (aread sdate) (aread sdate)
    merge 1:1 aread sdate using `tfile1' , nogen
    save `tfile1' , replace

    use `path'/res.dta ///
        if (inlist(edulv , 6 , 7) | (edulv == 5 & educp == 1)) ///
            & ((inrange(age , 24 , 34) & sex == 1) | (inrange(age , 22 , 34) & sex == 2)) ///
            , clear
    do ~/github/master/res/res_lt_collapse.do
    rename * *_uv
    rename (aread sdate) (aread sdate)
    merge 1:1 aread sdate using `tfile1' , nogen
    save `tfile1' , replace

    /*gen area*/
        recode aread (1100/1199 = 1) (2100/2199 = 2) (2200/2299 = 3) (2500/2599 = 4) ///
            (2300/2399 = 5) (2400/2499 = 6) (2600/2699 = 7) (3100/3199 = 8) (3200/3299 = 9) ///
            (3300/3399 = 10) (3400/3499 = 11) (3500/3599 = 12) (3600/3699 = 13) (3700/3799 = 14) ///
            (3800/3899 = 15) (3900/3999 = 16) (2901 = 17) (8888 9999 = .) ///
            , gen(area)
        capture label define AREA -1 "모름/무응답" 1 "서울" 2 "부산" 3 "대구" 4 "대전" 5 "인천" ///
            6 "광주" 7 "울산" 8 "경기" 9 "강원" 10 "충북" 11 "충남" 12 "전북" 13 "전남" ///
            14 "경북" 15 "경남" 16 "제주" 17 "세종"
        label value area AREA
        label var area "시도"
    /* gen areadk {{{*/
        gen str1 areadk = ""
            replace areadk = "서울특별시"      if aread == 1100
            replace areadk = "서울종로구"      if aread == 1101
            replace areadk = "서울중구"        if aread == 1102
            replace areadk = "서울용산구"      if aread == 1103
            replace areadk = "서울성동구"      if aread == 1104
            replace areadk = "서울광진구"      if aread == 1105
            replace areadk = "서울동대문구"    if aread == 1106
            replace areadk = "서울중랑구"      if aread == 1107
            replace areadk = "서울성북구"      if aread == 1108
            replace areadk = "서울강북구"      if aread == 1109
            replace areadk = "서울도봉구"      if aread == 1110
            replace areadk = "서울노원구"      if aread == 1111
            replace areadk = "서울은평구"      if aread == 1112
            replace areadk = "서울서대문구"    if aread == 1113
            replace areadk = "서울마포구"      if aread == 1114
            replace areadk = "서울양천구"      if aread == 1115
            replace areadk = "서울강서구"      if aread == 1116
            replace areadk = "서울구로구"      if aread == 1117
            replace areadk = "서울금천구"      if aread == 1118
            replace areadk = "서울영등포구"    if aread == 1119
            replace areadk = "서울동작구"      if aread == 1120
            replace areadk = "서울관악구"      if aread == 1121
            replace areadk = "서울서초구"      if aread == 1122
            replace areadk = "서울강남구"      if aread == 1123
            replace areadk = "서울송파구"      if aread == 1124
            replace areadk = "서울강동구"      if aread == 1125
            replace areadk = "부산광역시"      if aread == 2100
            replace areadk = "부산중구"        if aread == 2101
            replace areadk = "부산서구"        if aread == 2102
            replace areadk = "부산동구"        if aread == 2103
            replace areadk = "부산영도구"      if aread == 2104
            replace areadk = "부산부산진구"    if aread == 2105
            replace areadk = "부산동래구"      if aread == 2106
            replace areadk = "부산남구"        if aread == 2107
            replace areadk = "부산북구"        if aread == 2108
            replace areadk = "부산해운대구"    if aread == 2109
            replace areadk = "부산사하구"      if aread == 2110
            replace areadk = "부산금정구"      if aread == 2111
            replace areadk = "부산강서구"      if aread == 2112
            replace areadk = "부산연제구"      if aread == 2113
            replace areadk = "부산수영구"      if aread == 2114
            replace areadk = "부산사상구"      if aread == 2115
            replace areadk = "부산기장군"      if aread == 2151
            replace areadk = "대구광역시"      if aread == 2200
            replace areadk = "대구중구"        if aread == 2201
            replace areadk = "대구동구"        if aread == 2202
            replace areadk = "대구서구"        if aread == 2203
            replace areadk = "대구남구"        if aread == 2204
            replace areadk = "대구북구"        if aread == 2205
            replace areadk = "대구수성구"      if aread == 2206
            replace areadk = "대구달서구"      if aread == 2207
            replace areadk = "대구달성군"      if aread == 2251
            replace areadk = "인천광역시"      if aread == 2300
            replace areadk = "인천중구"        if aread == 2301
            replace areadk = "인천동구"        if aread == 2302
            replace areadk = "인천연수구"      if aread == 2304
            replace areadk = "인천남동구"      if aread == 2305
            replace areadk = "인천부평구"      if aread == 2306
            replace areadk = "인천계양구"      if aread == 2307
            replace areadk = "인천서구"        if aread == 2308
            replace areadk = "인천미추홀구"    if aread == 2309
            replace areadk = "인천강화군"      if aread == 2351
            replace areadk = "인천옹진군"      if aread == 2352
            replace areadk = "광주광역시"      if aread == 2400
            replace areadk = "광주동구"        if aread == 2401
            replace areadk = "광주서구"        if aread == 2402
            replace areadk = "광주남구"        if aread == 2403
            replace areadk = "광주북구"        if aread == 2404
            replace areadk = "광주광산구"      if aread == 2405
            replace areadk = "대전광역시"      if aread == 2500
            replace areadk = "대전동구"        if aread == 2501
            replace areadk = "대전중구"        if aread == 2502
            replace areadk = "대전서구"        if aread == 2503
            replace areadk = "대전유성구"      if aread == 2504
            replace areadk = "대전대덕구"      if aread == 2505
            replace areadk = "울산광역시"      if aread == 2600
            replace areadk = "울산중구"        if aread == 2601
            replace areadk = "울산남구"        if aread == 2602
            replace areadk = "울산동구"        if aread == 2603
            replace areadk = "울산북구"        if aread == 2604
            replace areadk = "울산울주군"      if aread == 2651
            replace areadk = "세종특별자치시"  if aread == 2901
            replace areadk = "경기도"          if aread == 3100
            replace areadk = "경기수원시"      if aread == 3101
            replace areadk = "경기성남시"      if aread == 3102
            replace areadk = "경기의정부시"    if aread == 3103
            replace areadk = "경기안양시"      if aread == 3104
            replace areadk = "경기부천시"      if aread == 3105
            replace areadk = "경기광명시"      if aread == 3106
            replace areadk = "경기평택시"      if aread == 3107
            replace areadk = "경기동두천시"    if aread == 3108
            replace areadk = "경기안산시"      if aread == 3109
            replace areadk = "경기고양시"      if aread == 3110
            replace areadk = "경기과천시"      if aread == 3111
            replace areadk = "경기구리시"      if aread == 3112
            replace areadk = "경기남양주시"    if aread == 3113
            replace areadk = "경기오산시"      if aread == 3114
            replace areadk = "경기시흥시"      if aread == 3115
            replace areadk = "경기군포시"      if aread == 3116
            replace areadk = "경기의왕시"      if aread == 3117
            replace areadk = "경기하남시"      if aread == 3118
            replace areadk = "경기용인시"      if aread == 3119
            replace areadk = "경기파주시"      if aread == 3120
            replace areadk = "경기이천시"      if aread == 3121
            replace areadk = "경기안성시"      if aread == 3122
            replace areadk = "경기김포시"      if aread == 3123
            replace areadk = "경기화성시"      if aread == 3124
            replace areadk = "경기광주시"      if aread == 3125
            replace areadk = "경기양주시"      if aread == 3126
            replace areadk = "경기포천시"      if aread == 3127
            replace areadk = "경기여주시"      if aread == 3128
            replace areadk = "경기연천군"      if aread == 3155
            replace areadk = "경기가평군"      if aread == 3157
            replace areadk = "경기양평군"      if aread == 3158
            replace areadk = "강원도"          if aread == 3200
            replace areadk = "강원춘천시"      if aread == 3201
            replace areadk = "강원원주시"      if aread == 3202
            replace areadk = "강원강릉시"      if aread == 3203
            replace areadk = "강원동해시"      if aread == 3204
            replace areadk = "강원태백시"      if aread == 3205
            replace areadk = "강원속초시"      if aread == 3206
            replace areadk = "강원삼척시"      if aread == 3207
            replace areadk = "강원홍천군"      if aread == 3251
            replace areadk = "강원횡성군"      if aread == 3252
            replace areadk = "강원영월군"      if aread == 3253
            replace areadk = "강원평창군"      if aread == 3254
            replace areadk = "강원정선군"      if aread == 3255
            replace areadk = "강원철원군"      if aread == 3256
            replace areadk = "강원화천군"      if aread == 3257
            replace areadk = "강원양구군"      if aread == 3258
            replace areadk = "강원인제군"      if aread == 3259
            replace areadk = "강원고성군"      if aread == 3260
            replace areadk = "강원양양군"      if aread == 3261
            replace areadk = "충청북도"        if aread == 3300
            replace areadk = "충북충주시"      if aread == 3302
            replace areadk = "충북제천시"      if aread == 3303
            replace areadk = "충북청주시"      if aread == 3304
            replace areadk = "충북보은군"      if aread == 3352
            replace areadk = "충북옥천군"      if aread == 3353
            replace areadk = "충북영동군"      if aread == 3354
            replace areadk = "충북진천군"      if aread == 3355
            replace areadk = "충북괴산군"      if aread == 3356
            replace areadk = "충북음성군"      if aread == 3357
            replace areadk = "충북단양군"      if aread == 3358
            replace areadk = "충북증평군"      if aread == 3359
            replace areadk = "충청남도"        if aread == 3400
            replace areadk = "충남천안시"      if aread == 3401
            replace areadk = "충남공주시"      if aread == 3402
            replace areadk = "충남보령시"      if aread == 3403
            replace areadk = "충남아산시"      if aread == 3404
            replace areadk = "충남서산시"      if aread == 3405
            replace areadk = "충남논산시"      if aread == 3406
            replace areadk = "충남계룡시"      if aread == 3407
            replace areadk = "충남당진시"      if aread == 3408
            replace areadk = "충남금산군"      if aread == 3451
            replace areadk = "충남연기군"      if aread == 3452
            replace areadk = "충남부여군"      if aread == 3453
            replace areadk = "충남서천군"      if aread == 3454
            replace areadk = "충남청양군"      if aread == 3455
            replace areadk = "충남홍성군"      if aread == 3456
            replace areadk = "충남예산군"      if aread == 3457
            replace areadk = "충남태안군"      if aread == 3458
            replace areadk = "전라북도"        if aread == 3500
            replace areadk = "전북전주시"      if aread == 3501
            replace areadk = "전북군산시"      if aread == 3502
            replace areadk = "전북익산시"      if aread == 3503
            replace areadk = "전북정읍시"      if aread == 3504
            replace areadk = "전북남원시"      if aread == 3505
            replace areadk = "전북김제시"      if aread == 3506
            replace areadk = "전북완주군"      if aread == 3551
            replace areadk = "전북진안군"      if aread == 3552
            replace areadk = "전북무주군"      if aread == 3553
            replace areadk = "전북장수군"      if aread == 3554
            replace areadk = "전북임실군"      if aread == 3555
            replace areadk = "전북순창군"      if aread == 3556
            replace areadk = "전북고창군"      if aread == 3557
            replace areadk = "전북부안군"      if aread == 3558
            replace areadk = "전라남도"        if aread == 3600
            replace areadk = "전남목포시"      if aread == 3601
            replace areadk = "전남여수시"      if aread == 3602
            replace areadk = "전남순천시"      if aread == 3603
            replace areadk = "전남나주시"      if aread == 3604
            replace areadk = "전남광양시"      if aread == 3606
            replace areadk = "전남담양군"      if aread == 3651
            replace areadk = "전남곡성군"      if aread == 3652
            replace areadk = "전남구례군"      if aread == 3653
            replace areadk = "전남고흥군"      if aread == 3655
            replace areadk = "전남보성군"      if aread == 3656
            replace areadk = "전남화순군"      if aread == 3657
            replace areadk = "전남장흥군"      if aread == 3658
            replace areadk = "전남강진군"      if aread == 3659
            replace areadk = "전남해남군"      if aread == 3660
            replace areadk = "전남영암군"      if aread == 3661
            replace areadk = "전남무안군"      if aread == 3662
            replace areadk = "전남함평군"      if aread == 3663
            replace areadk = "전남영광군"      if aread == 3664
            replace areadk = "전남장성군"      if aread == 3665
            replace areadk = "전남완도군"      if aread == 3666
            replace areadk = "전남진도군"      if aread == 3667
            replace areadk = "전남신안군"      if aread == 3668
            replace areadk = "경상북도"        if aread == 3700
            replace areadk = "경북포항시"      if aread == 3701
            replace areadk = "경북경주시"      if aread == 3702
            replace areadk = "경북김천시"      if aread == 3703
            replace areadk = "경북안동시"      if aread == 3704
            replace areadk = "경북구미시"      if aread == 3705
            replace areadk = "경북영주시"      if aread == 3706
            replace areadk = "경북영천시"      if aread == 3707
            replace areadk = "경북상주시"      if aread == 3708
            replace areadk = "경북문경시"      if aread == 3709
            replace areadk = "경북경산시"      if aread == 3710
            replace areadk = "경북군위군"      if aread == 3751
            replace areadk = "경북의성군"      if aread == 3752
            replace areadk = "경북청송군"      if aread == 3753
            replace areadk = "경북영양군"      if aread == 3754
            replace areadk = "경북영덕군"      if aread == 3755
            replace areadk = "경북청도군"      if aread == 3756
            replace areadk = "경북고령군"      if aread == 3757
            replace areadk = "경북성주군"      if aread == 3758
            replace areadk = "경북칠곡군"      if aread == 3759
            replace areadk = "경북예천군"      if aread == 3760
            replace areadk = "경북봉화군"      if aread == 3761
            replace areadk = "경북울진군"      if aread == 3762
            replace areadk = "경북울릉군"      if aread == 3763
            replace areadk = "경상남도"        if aread == 3800
            replace areadk = "경남진주시"      if aread == 3803
            replace areadk = "경남통영시"      if aread == 3805
            replace areadk = "경남사천시"      if aread == 3806
            replace areadk = "경남김해시"      if aread == 3807
            replace areadk = "경남밀양시"      if aread == 3808
            replace areadk = "경남거제시"      if aread == 3809
            replace areadk = "경남양산시"      if aread == 3810
            replace areadk = "경남창원시"      if aread == 3811
            replace areadk = "경남의령군"      if aread == 3851
            replace areadk = "경남함안군"      if aread == 3852
            replace areadk = "경남창녕군"      if aread == 3853
            replace areadk = "경남고성군"      if aread == 3854
            replace areadk = "경남남해군"      if aread == 3855
            replace areadk = "경남하동군"      if aread == 3856
            replace areadk = "경남산청군"      if aread == 3857
            replace areadk = "경남함양군"      if aread == 3858
            replace areadk = "경남거창군"      if aread == 3859
            replace areadk = "경남합천군"      if aread == 3860
            replace areadk = "제주특별자치도"  if aread == 3900
            replace areadk = "제주제주시"      if aread == 3901
            replace areadk = "제주서귀포시"    if aread == 3902
            replace areadk = "외국"            if aread == 8888
            replace areadk = "선박"            if aread == 9999
        label var areadk "시군구한글"
    /*}}}*/
    /*labeling*/
        label data "지역별고용조사"
        label var hratep50_cc "중위시급(초대졸이상)"
        label var hratep50_hs "중위시급(고졸이상)"
        label var hratep50_uv "중위시급(대졸이상)"
        label var n_cc        "관측치(초대졸이상)"
        label var n_hs        "관측치(고졸이상)"
        label var n_uv        "관측치(대졸이상)"
        label var prate_cc    "경활참가율(초대졸이상)"
        label var prate_hs    "경활참가율(고졸이상)"
        label var prate_uv    "경활참가율(대졸이상)"
        label var urate_cc    "실업률(초대졸이상)"
        label var urate_hs    "실업률(고졸이상)"
        label var urate_uv    "실업률(대졸이상)"
        label var wagep50_cc  "중위소득(초대졸이상)"
        label var wagep50_hs  "중위소득(고졸이상)"
        label var wagep50_uv  "중위소득(대졸이상)"
        label var ump6_cc     "장기실업자비율(6개월, 초대졸이상)"
        label var ump6_hs     "장기실업자비율(6개월, 고졸이상)"
        label var ump6_uv     "장기실업자비율(6개월, 대졸이상)"
        label var ump9_cc     "장기실업자비율(9개월, 초대졸이상)"
        label var ump9_hs     "장기실업자비율(9개월, 고졸이상)"
        label var ump9_uv     "장기실업자비율(9개월, 대졸이상)"
        label var ump12_cc    "장기실업자비율(12개월, 초대졸이상)"
        label var ump12_hs    "장기실업자비율(12개월, 고졸이상)"
        label var ump12_uv    "장기실업자비율(12개월, 대졸이상)"
        label var disapo_cc   "실망실업자비율(초대졸이상)"
        label var disapo_hs   "실망실업자비율(고졸이상)"
        label var disapo_uv   "실망실업자비율(대졸이상)"
        label var ws_cc       "가중합계(초대졸이상)"
        label var ws_hs       "가중합계(고졸이상)"
        label var ws_uv       "가중합계(대졸이상)"

    /*extra*/
        order _all , alpha
        order area aread sdate , first
        order areadk , last
        sort area aread sdate
save `path'res_lt , replace
