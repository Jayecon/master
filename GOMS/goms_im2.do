set more off
set maxvar 30000
local path ~/dropbox/data/goms/
use `path'goms_eq_raw , clear
    /* gen vars to convert data from wide to long{{{*/
        /*num vars*/
            local numvarlist ///
                pid birthy majorcat province sex age graduy gradum ///
                a001 a002 a003 a004_10 a005_10 a006_10 a007a_2018 a007_2018 a008_2018 ///
                a009_2018 a010 a011 a012 a014 a020 a021 a022 a023 a024 a116 a117 a118 a120 ///
                    a121 a122 a142 a143 a144 a157 a158 a159 a160 a161 a162 a163 a164 a165 ///
                d001 d002 d003 d004 d005 d006 d110 d111 d112 ///
                e001 e002 e003 e004 e005 e006 e078 e079 e080 e081 e153 e154 e155 e156 ///
                f001 f002 f006 f007 f008 f009 f010 f011 f012 f073 f074 f036 f037 f038 f039 ///
                    f040 f041 f078 f079 f080 f081 f082 f083 f084 f085 f101 f102 f104 f108 f112 f116 f120 ///
                h001 h002 h006 h007 h008 h009 h020 h026 h027 h028 h029 h040 h046 h047 h048 h049 h060 ///
                i002 i004 i009 i014 i018 i019 i050 ///
                l001 l003 l016 l030 l042 l056 l068 l082 ///
                n001 n010 n024 n038 n045 n083 n096 n113 n130 ///
                m001 m002 ///
                p014 p026 p027 p028z p029 p030 p031z p032 p033 p034 p035 p041 p042 p043 p044 p045 ///
                wt
            foreach i of local numvarlist {
                di "VAR : `i'"
                egen `i' = rowlast(`i'??)
            }
        /*str vars*/
            local strvarlist major
            foreach i of local strvarlist {
                tostring `i'?? , replace force
                gen str1 `i' = ""
                replace `i' = `i'07 if year == 2007
                replace `i' = `i'08 if year == 2008
                replace `i' = `i'09 if year == 2009
                replace `i' = `i'10 if year == 2010
                replace `i' = `i'11 if year == 2011
                replace `i' = `i'12 if year == 2012
                replace `i' = `i'13 if year == 2013
                replace `i' = `i'14 if year == 2014
                replace `i' = `i'15 if year == 2015
                replace `i' = `i'16 if year == 2016
                replace `i' = `i'17 if year == 2017
                replace `i' = `i'18 if year == 2018
                replace `i' = `i'19 if year == 2019
            }
    /*}}}*/
    /*merge with hs and univ data*/
        merge 1:1 year pid using `path'rawdata/goms_hs.dta , nogen
        merge 1:1 year pid using `path'rawdata/goms_univ.dta
        drop if _merge != 3
        drop _merge
    /*labeling all vars {{{*/
        # delimit ;
        label var pid        "개인ID"              ;
        label var major      "전공 세분류 "        ;
        label var majorcat   "전공 대분류"         ; label copy G191MAJO MAJORCAT ; label value majorcat MAJORCAT ;
        label var province   "졸업대학교 소재권역" ; label copy G191PROV PROVINCE ; label value province PROVINCE ;
        label var sex        "성별"                ; label copy G191SEX SEX       ; label value sex SEX ;
        label var birthy     "출생년"              ;
        label var age        "연령(조사기준일)"    ;
        label var graduy     "졸업년"              ;
        label var gradum     "졸업월"              ;
        label var wt         "가중치"              ;
        local temp : var label a00119 ; label var a001  "`temp'" ; label copy G191A001 A001 ; label value a001 A001 ;
        local temp : var label a00219 ; label var a002  "`temp'" ; label copy G191A002 A002 ; label value a002 A002 ;
        local temp : var label a00319 ; label var a003  "`temp'" ; label copy G191A003 A003 ; label value a003 A003 ;
        local temp : var label a004_1019 ; label var a004_10 "`temp'" ; label copy G191A004 A004_10 ; label value a004_10 A004_10 ;
        local temp : var label a005_1019 ; label var a005_10 "`temp'" ; label copy G191A005 A005 ; label value a005_10 A005 ;
        local temp : var label a006_1019 ; label var a006_10 "`temp'" ; label copy G191A006 A006 ; label value a006_10 A006 ;
        local temp : var label a007a_201819 ; label var a007a_2018 "`temp'" ; label copy LABA A007A ; label value a007a_2018 A007A ;
        local temp : var label a007_201819 ; label var a007_2018 "`temp'" ; label copy LABB A007 ; label value a007_2018 A007 ;
        local temp : var label a008_201819 ; label var a008_2018 "`temp'" ; label copy LABC A008 ; label value a008_2018 A008 ;
        local temp : var label a009_201819 ; label var a009_2018 "`temp'" ; label copy LABD A009 ; label value a009_2018 A009 ;
        local temp : var label a01019 ; label var a010  "`temp'" ; label copy G191A010 A010 ; label value a010 A010 ;
        local temp : var label a01119 ; label var a011  "`temp'" ; label copy G191A011 A011 ; label value a011 A011 ;
        local temp : var label a01219 ; label var a012  "`temp'" ; label copy G191A012 A012 ; label value a012 A012 ;
        local temp : var label a01419 ; label var a014  "`temp'" ; label copy LABE A014     ; label value a014 A014 ;
        local temp : var label a02319 ; label var a023  "`temp'" ; label copy G191A023 A023 ; label value a023 A023 ;
        local temp : var label a02419 ; label var a024  "`temp'" ; label copy G191A024 A024 ; label value a024 A024 ;
        local temp : var label a11619 ; label var a116  "`temp'" ; label copy G191A116 A116 ; label value a116 A116 ;
        local temp : var label a11719 ; label var a117  "`temp'" ; label copy G191A117 A117 ; label value a117 A117 ;
        local temp : var label a11819 ; label var a118  "`temp'" ; label copy G191A118 A118 ; label value a118 A118 ;
        local temp : var label a14219 ; label var a142  "`temp'" ; label copy G191A142 A142 ; label value a142 A142 ;
        local temp : var label a14319 ; label var a143  "`temp'" ; label copy G191A143 A143 ; label value a143 A143 ;
        local temp : var label a14419 ; label var a144  "`temp'" ; label copy G191A144 A144 ; label value a144 A144 ;
        local temp : var label a15707 ; label var a157  "`temp'" ; label copy G071A157 A157 ; label value a157 A157 ;
        local temp : var label a15819 ; label var a158  "`temp'" ; label copy G191A158 A158 ; label value a158 A158 ;
        local temp : var label a15919 ; label var a159  "`temp'" ; label copy G191A159 A159 ; label value a159 A159 ;
        local temp : var label a16019 ; label var a160  "`temp'" ; label copy G191A160 A160 ; label value a160 A160 ;
        local temp : var label a16119 ; label var a161  "`temp'" ; label copy G191A161 A161 ; label value a161 A161 ;
        local temp : var label a16219 ; label var a162  "`temp'" ; label copy G191A162 A162 ; label value a162 A162 ;
        local temp : var label a16307 ; label var a163  "`temp'" ; label copy G071A163 A163 ; label value a163 A163 ;
        local temp : var label a16419 ; label var a164  "`temp'" ; label copy G191A164 A164 ; label value a164 A164 ;
        local temp : var label a16519 ; label var a165  "`temp'" ; label copy G191A165 A165 ; label value a165 A165 ;
        local temp : var label a02019 ; label var a020  "`temp'" ; label copy G191A020 A020 ; label value a020 A020 ;
        local temp : var label a02119 ; label var a021  "`temp'" ; label copy G191A021 A021 ; label value a021 A021 ;
        local temp : var label a02219 ; label var a022  "`temp'" ; label copy G191A022 A022 ; label value a022 A022 ;
        local temp : var label a12019 ; label var a120  "`temp'" ; label copy G191A120 A120 ; label value a120 A120 ;
        local temp : var label a12119 ; label var a121  "`temp'" ; label copy G191A121 A121 ; label value a121 A121 ;
        local temp : var label a12219 ; label var a122  "`temp'" ; label copy G191A122 A122 ; label value a122 A122 ;
        local temp : var label d00119 ; label var d001  "`temp'" ; label copy G191D001 D001 ; label value d001 D001 ;
        local temp : var label d00219 ; label var d002  "`temp'" ;
        local temp : var label d00319 ; label var d003  "`temp'" ;
        local temp : var label d00419 ; label var d004  "`temp'" ;
        local temp : var label d00519 ; label var d005  "`temp'" ;
        local temp : var label d00619 ; label var d006  "`temp'" ; label copy G191D006 D006 ; label value d006 D006 ;
        local temp : var label d11019 ; label var d110  "`temp'" ; label copy G191D110 D110 ; label value d110 D110 ;
        local temp : var label d11119 ; label var d111  "`temp'" ; label copy G191D111 D111 ; label value d111 D111 ;
        local temp : var label d11219 ; label var d112  "`temp'" ; label copy G191D112 D112 ; label value d112 D112 ;
        local temp : var label e00119 ; label var e001  "`temp'" ; label copy G191E001 E001 ; label value e001 E001 ;
        local temp : var label e00219 ; label var e002  "`temp'" ;
        local temp : var label e00319 ; label var e003  "`temp'" ;
        local temp : var label e00419 ; label var e004  "`temp'" ;
        local temp : var label e00519 ; label var e005  "`temp'" ;
        local temp : var label e00619 ; label var e006  "`temp'" ;
        local temp : var label e07819 ; label var e078  "`temp'" ;
        local temp : var label e07919 ; label var e079  "`temp'" ;
        local temp : var label e08019 ; label var e080  "`temp'" ;
        local temp : var label e08119 ; label var e081  "`temp'" ;
        local temp : var label e15319 ; label var e153  "`temp'" ;
        local temp : var label e15419 ; label var e154  "`temp'" ;
        local temp : var label e15519 ; label var e155  "`temp'" ;
        local temp : var label e15619 ; label var e156  "`temp'" ;
        local temp : var label f00119 ; label var f001  "`temp'" ; label copy G191F001 F001 ; label value f001 f001 ;
        local temp : var label f00219 ; label var f002  "`temp'" ; label copy G191F002 F002 ; label value f002 f002 ;
        local temp : var label f00619 ; label var f006  "`temp'" ; label copy G191F006 F006 ; label value f006 F006 ;
        local temp : var label f00719 ; label var f007  "`temp'" ; label copy LABF F007     ; label value f007 F007 ;
        local temp : var label f00819 ; label var f008  "`temp'" ; label copy G191F008 F008 ; label value f008 F008 ;
        local temp : var label f00919 ; label var f009  "`temp'" ; label copy G191F009 F009 ; label value f009 F009 ;
        local temp : var label f01019 ; label var f010  "`temp'" ;
        local temp : var label f01119 ; label var f011  "`temp'" ;
        local temp : var label f01219 ; label var f012  "`temp'" ;
        local temp : var label f07319 ; label var f073  "`temp'" ; label copy G191F073 F073 ; label value f073 F073 ;
        local temp : var label f07419 ; label var f074  "`temp'" ;
        local temp : var label f07810 ; label var f078  "`temp'" ;
            label define F078 1 "부모" 2 "형제·자매" 3 "친척" 4 "장학금" 5 "본인" 6 "배우자" 7 "조부모" 8 "학자금 융자" 9 "기타";
            label value f078 F078 ;
        local temp : var label f07919 ; label var f079  "`temp'" ;
        local temp : var label f08019 ; label var f080  "`temp'" ;
        local temp : var label f08119 ; label var f081  "`temp'" ;
        local temp : var label f08219 ; label var f082  "`temp'" ;
        local temp : var label f08319 ; label var f083  "`temp'" ;
        local temp : var label f08419 ; label var f084  "`temp'" ;
        local temp : var label f08519 ; label var f085  "`temp'" ;
        local temp : var label f03619 ; label var f036  "`temp'" ; label copy G191F036 F036 ; label value f036 F036 ;
        local temp : var label f03719 ; label var f037  "`temp'" ; label copy G191F037 F037 ; label value f037 F037 ;
        local temp : var label f03819 ; label var f038  "`temp'" ; label copy G191F038 F038 ; label value f038 F038 ;
        local temp : var label f03919 ; label var f039  "`temp'" ; label copy G191F039 F039 ; label value f039 F039 ;
        local temp : var label f04019 ; label var f040  "`temp'" ; label copy G191F040 F040 ; label value f040 F040 ;
        local temp : var label f04119 ; label var f041  "`temp'" ; label copy G191F041 F041 ; label value f041 F041 ;
        local temp : var label f10119 ; label var f101  "`temp'" ; label copy G141F101 F101 ; label value f101 F101 ;
        local temp : var label f10219 ; label var f102  "`temp'" ;
        local temp : var label f10414 ; label var f104  "`temp'" ; label copy G141F104 F104 ; label value f104 F104 ;
        local temp : var label f10814 ; label var f108  "`temp'" ; label copy G141F108 F108 ; label value f108 F108 ;
        local temp : var label f11214 ; label var f112  "`temp'" ; label copy G141F112 F112 ; label value f112 F112 ;
        local temp : var label f11614 ; label var f116  "`temp'" ; label copy G141F116 F116 ; label value f116 F116 ;
        local temp : var label f12014 ; label var f120  "`temp'" ; label copy G141F120 F120 ; label value f120 F120 ;
        local temp : var label h00119 ; label var h001  "`temp'" ; label copy G191H001 H001 ; label value h001 H001 ;
        local temp : var label h00219 ; label var h002  "`temp'" ;
        local temp : var label h00619 ; label var h006  "`temp'" ; label copy G191H006 H006 ; label value h006 H006 ;
        local temp : var label h00719 ; label var h007  "`temp'" ; label copy G191H007 H007 ; label value h007 H007 ;
        local temp : var label h00819 ; label var h008  "`temp'" ; label copy G191H008 H008 ; label value h008 H008 ;
        local temp : var label h00919 ; label var h009  "`temp'" ; label copy G191H009 H009 ; label value h009 H009 ;
        local temp : var label h02019 ; label var h020  "`temp'" ; label copy G191H020 H020 ; label value h020 H020 ;
        local temp : var label h02619 ; label var h026  "`temp'" ; label copy G191H026 H026 ; label value h026 H026 ;
        local temp : var label h02719 ; label var h027  "`temp'" ; label copy G191H027 H027 ; label value h027 H027 ;
        local temp : var label h02819 ; label var h028  "`temp'" ; label copy G191H028 H028 ; label value h028 H028 ;
        local temp : var label h02919 ; label var h029  "`temp'" ; label copy G191H029 H029 ; label value h029 H029 ;
        local temp : var label h04019 ; label var h040  "`temp'" ; label copy G191H040 H040 ; label value h040 H040 ;
        local temp : var label h04619 ; label var h046  "`temp'" ; label copy G191H046 H046 ; label value h046 H046 ;
        local temp : var label h04719 ; label var h047  "`temp'" ; label copy G191H047 H047 ; label value h047 H047 ;
        local temp : var label h04819 ; label var h048  "`temp'" ; label copy G191H048 H048 ; label value h048 H048 ;
        local temp : var label h04919 ; label var h049  "`temp'" ; label copy G191H049 H049 ; label value h049 H049 ;
        local temp : var label h06019 ; label var h060  "`temp'" ; label copy G191H060 H060 ; label value h060 H060 ;
        local temp : var label i00219 ; label var i002  "`temp'" ; 
        local temp : var label i01819 ; label var i018  "`temp'" ; label copy G191I018 I018 ; label value i018 I018 ;
        local temp : var label i05019 ; label var i050  "`temp'" ; label copy G191I050 I050 ; label value i050 I050 ;
        local temp : var label l00119 ; label var l001  "`temp'" ; label copy G191L001 L001 ; label value l001 L001 ;
        local temp : var label l00319 ; label var l003  "`temp'" ;
        local temp : var label l01619 ; label var l016  "`temp'" ;
        local temp : var label l03019 ; label var l030  "`temp'" ;
        local temp : var label l04219 ; label var l042  "`temp'" ;
        local temp : var label l05619 ; label var l056  "`temp'" ;
        local temp : var label l06819 ; label var l068  "`temp'" ;
        local temp : var label l08219 ; label var l082  "`temp'" ;
        local temp : var label m00119 ; label var m001  "`temp'" ; label copy G191M001 M001 ; label value m001 M001 ;
        local temp : var label m00219 ; label var m002  "`temp'" ;
        local temp : var label n08319 ; label var n083  "`temp'" ; label copy G191N083 N083 ; label value n083 N083 ;
        local temp : var label n09619 ; label var n096  "`temp'" ; label copy G191N096 N096 ; label value n096 N096 ;
        local temp : var label n11319 ; label var n113  "`temp'" ; label copy G191N113 N113 ; label value n113 N113 ;
        local temp : var label n13019 ; label var n130  "`temp'" ; label copy G191N130 N130 ; label value n130 N130 ;
        local temp : var label p01419 ; label var p014  "`temp'" ; label copy G191P014 P014 ; label value p014 P014 ;
        local temp : var label p02619 ; label var p026  "`temp'" ; label copy G191P026 P026 ; label value p026 P026 ;
        local temp : var label p02719 ; label var p027  "`temp'" ; label copy G191P027 P027 ; label value p027 P027 ;
        local temp : var label p028z19 ; label var p028z  "`temp'" ; label copy G191P028 P028z ; label value p028z P028z ;
        local temp : var label p02919 ; label var p029  "`temp'" ; label copy G191P029 P029 ; label value p029 P029 ;
        local temp : var label p03019 ; label var p030  "`temp'" ; label copy G191P030 P030 ; label value p030 P030 ;
        local temp : var label p031z19 ; label var p031z  "`temp'" ; label copy G191P031 P031z ; label value p031z P031z ;
        local temp : var label p03219 ; label var p032  "`temp'" ; label copy G191P032 P032 ; label value p032 P032 ;
        local temp : var label p03319 ; label var p033  "`temp'" ; label copy G191P033 P033 ; label value p033 P033 ;
        local temp : var label p03419 ; label var p034  "`temp'" ; label copy G191P034 P034 ; label value p034 P034 ;
        local temp : var label p03519 ; label var p035  "`temp'" ; label copy G191P035 P035 ; label value p035 P035 ;
        local temp : var label p04118 ; label var p041  "`temp'" ; label copy G181P041 P041 ; label value p041 P041 ;
        local temp : var label p04218 ; label var p042  "`temp'" ;
        local temp : var label p04318 ; label var p043  "`temp'" ; label copy G181P043 P043 ; label value p043 P043 ;
        local temp : var label p04418 ; label var p044  "`temp'" ;
        local temp : var label p04519 ; label var p045  "`temp'" ; label copy G191P045 P045 ; label value p045 P045 ;
        #delimit cr
    /*}}}*/
    /*rename vars {{{*/
        rename a004_10 a004
        rename a005_10 a005
        rename a006_10 a006
        rename a007a_2018 a007a
        rename a007_2018 a007
        rename a008_2018 a008
        rename a009_2018 a009
    /*}}}*/
    /*recoding variables to fix year varing value problems{{{*/
        recode a003 (2=1) (1=2)                    if inlist(year,  2007)
        recode a023 (4=5) (5=7)                    if inlist(year,  2007)
        recode d006 (2=1) (1=2)                    if inlist(year,  2007 , 2008)
        recode f009 (3/4=3) (5=4) (9=10)           if inrange(year, 2007 , 2013)
        recode f009 (4=6) (5=7) (6=8) (7=4) (8=10) if inlist(year,  2007)
        recode f104 (9=1) (10=9)                   if inrange(year, 2015 , 2019)
        recode f108 (9=1) (10=9)                   if inrange(year, 2015 , 2019)
        recode f112 (9=1) (10=9)                   if inrange(year, 2015 , 2019)
        recode f116 (9=1) (10=9)                   if inrange(year, 2015 , 2019)
        recode f120 (9=1) (10=9)                   if inrange(year, 2015 , 2019)
        recode l001 (1/2=1) (3=2)                  if inlist(year,  2009 , 2010)
        recode p026 (8=.)                          if inlist(year,  2012 , 2013)
        recode p027 (8=.)                          if inrange(year, 2012 , 2015)
        recode p028z (8=.)                         if inrange(year, 2012 , 2013)
        recode p029 (8=.)                          if inlist(year,  2012 , 2013)
        recode p030 (8=.)                          if inrange(year, 2012 , 2015)
        recode p031z (8=.)                         if inrange(year, 2012 , 2013)
        recode p032 (1/3=1) (4=2) (5 7 24=3) (6=4) (8=5) (11/13=6) (9/10=7) ///
            (14=8) (15/22=9) (23=10) (25=11) (26=12) ///
            if inrange(year , 2007 , 2016)
        recode p033 (1/3=1) (4=2) (5 7 24=3) (6=4) (8=5) (11/13=6) (9/10=7) ///
            (14=8) (15/22=9) (23=10) (25=11) (26=12) ///
            if inrange(year , 2007 , 2016)
    /*}}}*/
    /*gen : a998 a999 {{{*/
        capture drop a999
        egen a999 = rowlast(a157 a158 a159)
        local temp : var label a157
            label var a999  "`temp'"
            label copy A157 A999
            label value a999 A999
        capture drop a998
        egen a998 = rowlast(a163 a164 )
        local temp : var label a163
            label var a998  "`temp'"
            label copy A163 A998
            label value a998 A998
    /*}}}*/
    /*gen : f997 {{{*/
        capture drop f997 temp1 temp2
        egen temp1 = rowtotal(f079-f085)
        egen temp2 = rowmax(f079-f085)
        gen f997 =  .
            replace f997 = 1 if temp2 == f079 | f078 == 1
            replace f997 = 2 if temp2 == f080 | f078 == 8
            replace f997 = 3 if temp2 == f081 | f078 == 5
            replace f997 = 4 if temp2 == f082 | f078 == 3
            replace f997 = 5 if temp2 == f083 | f078 == 6
            replace f997 = 6 if temp2 == f084 | inlist(f078 , 2 , 3)
            replace f997 = 7 if temp2 == f085 | f078 == 8
            replace f997 = . if !inlist(temp1 , 0 , 100)
        drop temp1 temp2
        label var f997 "대학학비조달방법"
        label define F997 1 "부모" 2 "학자금 대출" 3 "본인" 4 "장학금" 5 "배우자" 6 "형제·자매 등 친인척" 7 "기타"
        label value f997 F997
    /*}}}*/
    /*gen : f999 {{{*/
        capture drop f999
        gen f999 = 0
            replace f999 = f999 + 1 if f104 == 7
            replace f999 = f999 + 1 if f108 == 7
            replace f999 = f999 + 1 if f112 == 7
            replace f999 = f999 + 1 if f116 == 7
            replace f999 = f999 + 1 if f120 == 7
        label var f999 "경제적인 이유의 휴학횟수"
    /*}}}*/
    /*modify : i002 {{{*/
        capture drop i00209
        egen i00209 = rowtotal(i00409  i00909  i01409)
        replace i002 = i00209 if year == 2009
        drop i004 i009 i014
    /*}}}*/
    /*modify : i018 {{{*/
        replace i018 = i019 if inrange(year, 2013, 2015)
        drop i019
        label var i018 "I6. 최근 2년동안(13-15는 입학후부터) 영어 시험을 본 경험 유무"
    /*}}}*/
    /*modify : n083 {{{*/
        replace n083 = 1 if year == 2007 & (n00107 == 1 | n04507 == 1)
        replace n083 = 2 if year == 2007 & (n00107 == 2 & n04507 == 2)
        replace n083 = . if year == 2007 & missing(n00107) & missing(n04507)
    /*}}}*/
    /*modify : n096 {{{*/
        replace n096 = n01007 if year == 2007
    /*}}}*/
    /*modify : n113 {{{*/
        replace n113 = n02407 if year == 2007
    /*}}}*/
    /*modify : n130 {{{*/
        replace n130 = n03807 if year == 2007
    /*}}}*/
    /*gen : n999{{{*/
        egen n999 = rowtotal(n096 n113 n130) , mis
        label var n999 "시험준비_총 시험 응시 횟수_회"
    /*}}}*/
    /*gen : l999{{{*/
        egen l999 = rowtotal(l016 l042 l068) , mis
        label var l999 "직업 교육/훈련기간_총 시간"
    /*}}}*/
    /*gen : p999 {{{*/
        capture drop p999
        gen p999 = . 
            replace p999 = p042        if p041 == 1 & p043 == 2
            replace p999 =      - p044 if p041 == 2 & p043 == 1
            replace p999 = p042 - p044 if p041 == 1 & p043 == 1
        label var p999 "순 월평균 지원액(가족에게 받는, 원)"
    /*}}}*/
    /*gen : expm? {{{*/
        capture drop expm?
        gen expm1 = (d004*12 +d005) - (d002*12 +d003) +1 if d001 == 1
        label var expm1 "첫일자리근무(월)"
        gen expm2 = (e005*12 +e006) - (e003*12 +e004) +1 if e001 == 1 & e002 == 1
        label var expm2 "경험일자리1근무(월)"
        gen expm3 = (e080*12 +e081) - (e078*12 +e079) +1 if e001 == 1 & e002 == 2
        label var expm3 "경험일자리2근무(월)"
        gen expm4 = (e155*12 +e156) - (e153*12 +e154) +1 if e001 == 1 & e002 == 3
        label var expm4 "경험일자리3근무(월)"
        gen expm5 = (h008*12 +h009) - (h006*12 +h007) +1 if h001 == 1 & h002 == 1
        label var expm5 "재학일자리1근무(월)"
        gen expm6 = (h028*12 +h029) - (h026*12 +h027) +1 if h001 == 1 & h002 == 2
        label var expm6 "재학일자리2근무(월)"
        gen expm7 = (h048*12 +h049) - (h046*12 +h047) +1 if h001 == 1 & h002 == 3
        label var expm7 "재학일자리3근무(월)"
        forvalue i = 1/7 {
        replace expm`i' = . if expm`i' < 0
        }
    /*}}}*/
    /*gen : medtyp {{{*/
        gen byte medtyp = .
        label var medtyp "의예계열전공"
        label define MEDTYP 1 "의학" 2 "치의학" 3 "한의학" 4 "수의학" 5 "약학"
        label value medtyp MEDTYP
            replace medtyp = 1 if year == 2007 & inlist(major , "1798" , "1799" )
            replace medtyp = 2 if year == 2007 & inlist(major , "2362" )
            replace medtyp = 3 if year == 2007 & inlist(major , "2632" )
            replace medtyp = 4 if year == 2007 & inlist(major , "1306" , "1307" )
            replace medtyp = 5 if year == 2007 & inlist(major , "1516" , "1517" , ///
                "1518" , "2173" , "2174" )
            replace medtyp = 1 if year != 2007 & inlist(major , "U06010100003", ///
                "U06010100004" , "U06010100005" , "U06010100017" , "U06010100021"  )
            replace medtyp = 2 if year != 2007 & inlist(major , "U06010200005" )
            replace medtyp = 3 if year != 2007 & inlist(major , "U06010300002" )
            replace medtyp = 4 if year != 2007 & inlist(major , "U05020300003" , ///
                "U05020300015" )
            replace medtyp = 5 if year != 2007 & strpos(major , "U060301" )
            replace medtyp = . if year != 2007 & inlist(major , "U06030100021" )
    /*}}}*/
    /*gen : innoarea {{{*/
        gen byte innoarea = .
        label var innoarea "혁신도시지역"
            replace innoarea = 1  if area == 2
            replace innoarea = 2  if area == 3
            replace innoarea = 3  if area == 7
            replace innoarea = 4  if area == 9
            replace innoarea = 5  if area == 10
            replace innoarea = 6  if area == 12
            replace innoarea = 7  if inlist(area , 6 , 13)
            replace innoarea = 8  if area == 14
            replace innoarea = 9  if area == 15
            replace innoarea = 10 if area == 16
            replace innoarea = 97 if area == 17
            replace innoarea = 98 if inlist(area , 1 , 5 , 8)
        destring innoarea , replace
        label define innoarea 1 "부산" 2 "대구" 3 "울산" 4 "강원" 5 "충북" 6 "전북" ///
            7 "광주전남" 8 "경북" 9 "경남" 10 "제주" 97 "세종" 98 "수도권" 99 "개별"
        label value innoarea innoarea
    /*}}}*/
    /*drop vars {{{*/
        foreach i of local numvarlist {
            drop `i'??
        }
        foreach i of local strvarlist {
            drop `i'??
        }
        drop n001 n010 n024 n038 n045
        /*현재나이 답변이상 사례 제거*/
            gen temp1 = age + birthy
            gen temp2 = year - temp1
            drop if !inrange(temp2 , -2 , 0 )
            drop temp?
    /*}}}*/
    /*통계청 지역벌 산업조사*/
        /*merge m:1 year area using `path'KOSIS/kosis_ind_gomseq.dta*/
        /*drop if _merge != 3*/
        /*drop _merge*/
    /*통계청 지역벌 인구조사*/
        /*merge m:1 year area using `path'KOSIS/kosis_pop_gomseq.dta*/
        /*drop if _merge != 3*/
        /*drop _merge*/
    order _all , alpha
    order pid year branch branchdtl distance latitude longitude major medtyp school schooldtl ///
        found founddate foundname hsname hsnamec innoarea birthy majorcat province provincedtl ///
        area areadtl sex age graduy gradum address rhsname status ///
        unimain uniname unirank uniscr20 uniscr50 wave wt zipcode , first
    
compress
save `path'goms_im.dta , replace
save ~/dropbox/HL_SJHO/GOMS_IGM/goms_im.dta , replace
