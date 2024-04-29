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

    /*labeling*/
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
    /*extra*/
        order _all , alpha
        order area aread sdate , first
        sort area aread sdate
save `path'res_lt , replace
