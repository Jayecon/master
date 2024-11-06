    doedit abc.do
    do abc.do

    /*local; number case*/
        local x 1
        local y = 1
        local z1 `x' + 1
        local z2 "`y' + 1"
        local z3 `x' + `y' +1
        local z4 `x' `y'
        di "macro x = `x' and marco y = `y'" 
        di "macro x = " `x' " and marco y = "`y' 
        di "macro z1 = `z1', macro z2 = `z2' and macro z3 = `z3'" 
        di "macro z1 = "`z1', "macro z2 = "`z2' " and macro z3 = "`z3' 
        di "macro z4 = "`z4' 

    /*local; 07-09 표현 만들기*/
        local yr : disp %02.0f  = 7
        di "`yr'"

    /*local; string case*/
        local x = foo
        local y bar
        di "macro x = `x' and marco y = `y'" 
        di "macro x = " `x' " and marco y = "`y' 
        di "macro z1 = `z1', macro z2 = `z2' and macro z3 = `z3'" 
        di "macro z1 = "`z1', "macro z2 = "`z2' " and macro z3 = "`z3' 
        di "macro z4 = "`z4' 

    /*levelsof; local for a value of a var*/
        levelsof rep78 , local(r78list)
        di `r78list'

    /*factor variables*/
        reg price rep78
        reg price i.rep78
        reg price weight#weight
        reg price weight##weight

    /*appending*/
        sysuse auto , clear
        tempfile tfile //임시파일
        preserve
            gen tag = 1
            save `tfile'
        restore
        append using `tfile' //파일간 수직결합
        de

    /*if: variable logical*/
        di p
        di p[1]
        if p >= 3000 {
            sum
        }
        sum if p >= 3000
        if p >= 6000 {
            sum
        }
        sum if p >= 6000

    /*if: variable logical*/
        local year = 2007
        if "`year'" == "2007" {
            sum 
        }
        if "`year'" == "2006" {
            sum 
        }

    /*else*/
        if "`year'" == "2006" {
            sum 
        }
        else{
        di "local year != 2006"
        }

    /*else if*/
        if "`year'" == "2006" {
            sum 
        }
        else if "`year'" < "2006" {
        di "local year < 2006"
        }
        else {
        di "local year > 2006"
        }

    /*foreach: varlist*/
        sysuse auto , clear
        foreach i of varlist p-f {
            di `i'
            di "`i'"
        }

    /*foreach: simple strings*/
        foreach i in foo bar{
            di "`i'"
        }

    /*foreach: local*/
        local mylist foo bar
        foreach i of local mylist {
            di "`i'"
        }
        foreach i of local mylist {
            di `i'
        }

    /*forvalue: simple*/
        forvalue i = 1/5 {
            di "`i'"
        }
        forvalue i = 1(2)9 {
            di "`i'"
        }

    /*nested loof: forvalue and foreach*/
        forvalue i = 7/9 {
            local yr : disp %02.0f  = `i'
            foreach j in foo bar {
                di "`j'`i'"
                di "`j'`yr'"
                di as text "Year == " as result "`yr'"
                }
        }

    /*nested loof: forvalue, foreach, and if*/
    forvalue i = 7/9 {
        foreach j in foo bar {
            if `i' == 7 {
                di "`j'`i'"
            }
            else {
                di "nope"
            }
        }
    }

    /*rename vars and wildcard char*/
        rename a004_10 a004
        rename a004??? a004
        rename a004* a004

    /*Simple architecture for generate a *.dta file*/
        /*settings*/
            set more off
            set maxvar 30000
            tempfile tfile
            cd // your datapat
            clear
        /*list of common variables */
            local varlist00 foo /// your variables
                bar
        /*loop from 2007 to 2019*/
            forvalue i = 7/19 {
                local yr : disp %02.0f  = `x' // if year format is 01 02 03 etc.
                /*list of year varing variables*/
                    local varlist `varlist00'
                    if `x' >= 8 {
                        local varlist `varlist' // add your year varing variables
                    }
                    if `x' >= 9 & `x' <= 18 {
                        local varlist `varlist' // add your year varing variables
                    }
                    if `x' == 7 | `x' >= 11 {
                        local varlist `varlist' // add your year varing variables
                    }
                use rawdata/GP`yr'.dta // use your rawfiles
                /*control commons*/
                    keep `varlist'
                    rename * *`yr'
                    gen year = 2000 + `x'
                /*control string|numeric*/
                    if ("`x'" == "7") {
                        tostring major07, replace force
                    }
                /*control missings */
                    if ("`x'" == "18" ){
                        mvdecode l01618 l04218 l06818 , mv(-1 , 99999)
                    }
                /*creating the save file*/
                    if ("`x'" == "7") {
                        save `tfile', replace
                    }
                    else {
                        append using `tfile'
                        save `tfile' , replace
                    }
            }
        /*save the file*/
            label data "foo bar"
            save foobar_raw.dta , replace

    /*Simple architecture for generate a *.dta file*/
        pause on // For debug your do file
        numlabel , add // Improve readability of the tab command
        use goms_eq_raw.dta , clear
        /* Gen vars to convert data from wide to long*/
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

        pause

        /*merge*/
            merge 1:1 year pid using `path'rawdata/goms_hs.dta , nogen
            merge 1:1 year pid using `path'rawdata/goms_univ.dta
            drop if _merge != 3
            drop _merge

    /*labeling*/
        /*labeling a variable*/
            label var pid        "개인ID"
        /*labeling a value of a variable*/
            label define F078 1 "부모" 2 "형제·자매" 3 "친척" 4 "장학금" 5 "본인" 6 "배우자" 7 "조부모" 8 "학자금 융자" 9 "기타";
            label value f078 F078 ;
        /*labeling a variable from another variable*/
            de a001??
            local temp : var label a00119 
            label var a001  "`temp'" 
        /*labeling a value of variable from another variable*/
            label copy G191A001 A001 
            label value a001 A001 ;
        /*labeling a data*/
            label data "foobar"

    /*recoding variables{{{*/
        recode d006 (2=1) (1=2)                    if inlist(year,  2007 , 2008)
        recode f009 (3/4=3) (5=4) (9=10)           if inrange(year, 2007 , 2013)
        recode f009 (4=6) (5=7) (6=8) (7=4) (8=10) if inlist(year,  2007)
        recode p026 (8=.)                          if inlist(year,  2012 , 2013)
        recode p027 (8=.)                          if inrange(year, 2012 , 2015)
        recode p032 (1/3=1) (4=2) (5 7 24=3) (6=4) (8=5) (11/13=6) (9/10=7) ///
            (14=8) (15/22=9) (23=10) (25=11) (26=12) ///
            if inrange(year , 2007 , 2016)
    /*egen*/
        de n096 n113 n130
            egen n999 = rowtotal(n096 n113 n130) , mis
            label var n999 "시험준비_총 시험 응시 횟수_회"
        de a157 a158 a159
            tab1 a157 a158 a159
            egen a999 = rowlast(a157 a158 a159)
            list a157 a158 a159 a999 in 1/10
        de f079-f085
            tab1 f079-f085
            egen temp1 = rowtotal(f079-f085)
            egen temp2 = rowmax(f079-f085)
            list f079-f085 temp1 temp2 in 1/10
    /*gen*/
        capture drop gen f997
        gen f997 =  .
            replace f997 = 1 if temp2 == f079 | f078 == 1
            replace f997 = 2 if temp2 == f080 | f078 == 8
            replace f997 = 3 if temp2 == f081 | f078 == 5
            replace f997 = 4 if temp2 == f082 | f078 == 3
            replace f997 = 5 if temp2 == f083 | f078 == 6
            replace f997 = 6 if temp2 == f084 | inlist(f078 , 2 , 3)
            replace f997 = 7 if temp2 == f085 | f078 == 8
            replace f997 = . if !inlist(temp1 , 0 , 100)
            list f079-f085 temp1 temp2 f997 in 1/10
        drop temp1 temp2
    /*replace */
        de n083 n001 n045
        tab1 n08307 n00107 n04507
        replace n083 = 1 if year == 2007 & (n00107 == 1 | n04507 == 1)
        replace n083 = 2 if year == 2007 & (n00107 == 2 & n04507 == 2)
        replace n083 = . if year == 2007 & missing(n00107) & missing(n04507)

    /*ordering variables: optional*/
        order _all , alpha
        order pid year branch branchdtl distance latitude longitude major medtyp ///
            school schooldtl found founddate foundname hsname hsnamec innoarea birthy ///
            majorcat province provincedtl area areadtl sex age graduy gradum address ///
            rhsname status unimain uniname unirank uniscr20 uniscr50 wave wt zipcode ///
            , first
    /*drop vars {{{*/
        foreach i of local numvarlist {
            drop `i'??
        }
        foreach i of local strvarlist {
            drop `i'??
        }
        drop n001 n010 n024 n038 n045

compress
save ~/dropbox/goms_test.dta
