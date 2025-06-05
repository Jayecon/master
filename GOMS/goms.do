set more off
clear
cd ~/dropbox/goms
    /*List 개인변수 {{{*/
        /*local demolablelist PID 본분교 국공사립 학위과정유형 주야간 전공계열 전공소분류CODE 전공세분류CODE/전공명 ///
            학교유형 학교소재권역 학교소재지역 성별 출생년 출생월 연령(조사기준일_당시) 졸업년 졸업월*/
        local demovarlist pid branch found course daynight majorcat dpmt major ///
            school province area sex birthy birthm age graduy gradum
            /*}}}*/
    /*List 고교 및 대입 변수 {{{*/
        /*local edulabellist 출신고교_졸업년 출신고교_졸업월 출신고교(국내외) 출신고교(국가명) 출신고교시도(특별시/광역시/도)CODE 출신고교시군구(구/시/군)CODE ///
            고교/검정고시 고교계열 졸업대학(입학/편입) 졸업대학_입학/편입년 졸업대학_입학/편입월 대입모집(정시/수시) 입학전형(일반/특별) 입학전형세부유형 */
        local eduvarlist f001 f002 f004 f005 f006 f007 f008 f009 f010 f011 f012 f013 ///
            f014 f170 
            /*}}}*/
    /*List 환경변수 {{{*/
        /*local envlabellist 출생지역(국내외) 출생지역(국외국가명) 출생지역(특별시/광역시/도)CODE 출생지역(구/시/군)CODE ///
            아버님_최종학력 아버님_최종학력이수여부 아버님_최종학력_생성변수 어머님_최종학력 어머님_최종학력이수여부 어머님_최종학력_생성변수 ///
            아버님직업_대학입학(편입)당시 어머님직업_대학입학(편입)당시 부모님_월평균소득_대학입학(편입)당시 부모님_월평균소득_현재 부모님_자산규모_현재 가중치*/
        local envvarlist p018 p019 p020 p021 p026 p027 p028z p029 p030 p031z ///
            p032 p033 p034 p035 p036 wt
            /*}}}*/
    /*List 직업력변수 {{{*/
        /*local econlabellist 산업10차대분류 산업10차중분류 산업10차소분류 직업2018대분류 직업*/
        local econvarlist  a004_10 a005_10 a006_10 a007_2018 a008_2018 a009_2018 a010 ///
            a011 a021 a022 a059 a122 a356 a366 a376 a386
        /*}}}*/
    /*List 조사변수 변화를 해결하기 위한 결측변수 {{{*/
        local misvarlist07 branch daynight a059 a356 a366 a376 a386 f007 f008 f013 f014 f170 p021 p036 
        local misvarlist08 daynight a059 f013 f014 f170 p021 p036
        local misvarlist09 f013 a059 f170 p036
        local misvarlist10 f013 a059 f170 p036
        local misvarlist11 f013 a059 f170 p036
        local misvarlist12 f013 a059 f170 p021 p036
        local misvarlist13 f013 f170 p019 p036
        local misvarlist14 f005 f013 f170 p019 p036
        local misvarlist15 f170
        local misvarlist16 f014 
        local misvarlist17 f014 /*}}}*/
    /*List 년도별 value label {{{*/
        local labelist07 V6_A LABO 
        local labelist08 V13_A LABB LABBD LABCG LABCH LABCI LABCJ LABCK
        local labelist09 LABCD LABCE LABN LABO LABBT LABEP LABEN LABEO LABEQ LABER LABES
        local labelist10 LABA V14_A LABJ LABF LABG
        local labelist11 LABE LABF LABN LABAC
        local labelist12 LABF LABR LABE LABAW
        local labelist13 LABE LABF LABJ
        local labelist14 LABE 
        local labelist15 LABE LABF
        local labelist16 LABAS LABK LABBR LABBS LABDM LABDN LABDO
        local labelist17 LABCC LABEI LABEJ LABEL LABEM LABEK LABEN LABEO/*}}}*/
    /*년도별 파일을 goms??.dta 로 각각 저장하기{{{*/
        forvalue x = 7/17 {
            local yr : disp %02.0f  = `x'
            use ~/dropbox/GOMS/rawdata/GP`yr'.dta
            rename g`yr'1* *
            drop if missing(sex)
            foreach i of local misvarlist`yr' {
                gen `i' = .
            }
            keep `demovarlist' `eduvarlist' `envvarlist' `econvarlist'
            drop `misvarlist`yr''
            di "year = " 2000+`x'
            foreach i of local labelist`yr'{
                label copy `i' G`yr'1`i'
            }
        /*년도별 변수 value label{{{*/ 
            if "`x'" == "7" {
                label value major G071V6_A
                label value p032 G071LABO
                label value p033 G071LABO
            }
            else if "`x'" == "8" {
                label value birthm G081V13_A
                label value f001 G081LABB
                label value f002 G081LABB
                label value f011 G081LABBD
                label value f012 G081LABBD
                label value p026 G081LABCG
                label value p027 G081LABCH
                label value p028 zG081LABCI
                label value p029 G081LABCG
                label value p030 G081LABCH
                label value p031 zG081LABCI
                label value p032 G081LABCJ
                label value p033 G081LABCJ
                label value p034 G081LABCK
                label value p035 G081LABCK
            }
            else if "`x'" == "9" {
                label value f001 G091LABCD
                label value f002 G091LABCE
                label value f006 G091LABN
                label value f007 G091LABO
                label value f011 G091LABCD
                label value f012 G091LABCE
                label value p018 G091LABBT
                label value p019 G091LABEP
                label value p020 G091LABN 
                label value p021 G091LABO 
                label value p026 G091LABEN
                label value p027 G091LABEO
                label value p028 zG091LABEQ
                label value p029 G091LABEN
                label value p030 G091LABEO
                label value p031 zG091LABEQ
                label value p032 G091LABER
                label value p033 G091LABER
                label value p034 G091LABES
                label value p035 G091LABES
            }
            else if "`x'" == "10" {
                label value area G101LABA 
                label value birthm G101V14_A
                label value f002 G101LABJ 
                label value f004 G101LABF 
                label value f006 G101LABA 
                label value f007 G101LABG 
                label value p020 G101LABA 
                label value p021 G101LABG 
            }
            else if "`x'" == "11" {
                label value f006 G111LABE 
                label value f007 G111LABF 
                label value f011 G111LABN 
                label value f012 G111LABN 
                label value p020 G111LABE 
                label value p021 G111LABF 
                label value p028z G111LABAC
                label value p031z G111LABAC
            }
            else if "`x'" == "12" {
                label value f002 G121LABF 
                label value f006 G121LABR 
                label value f007 G121LABE 
                label value p020 G121LABAW
            }
            else if "`x'" == "13" {
                label value f007 G131LABE 
                label value f011 G131LABF 
                label value f012 G131LABF 
                label value p021 G131LABE 
                label value p028 zG131LABJ 
                label value p031 zG131LABJ 
            }
            else if "`x'" == "14" {
                label value f007 G141LABE 
                label value p021 G141LABE 
            }
            else if "`x'" == "15" {
                label value f006 G151LABE 
                label value f007 G151LABF 
                label value p021 G151LABF 
            }
            else if "`x'" == "16" {
                label value f001 G161LABAS
                label value f002 G161LABAS
                label value f004 G161LABK 
                label value f006 G161LABBR
                label value f007 G161LABBS
                label value p018 G161LABK 
                label value p021 G161LABDM
                label value p027 G161LABDN
                label value p028 zG161LABDO
                label value p030 G161LABDN
                label value p031 zG161LABDO
            }
            else if "`x'" == "17" {
                label value f001 G171LABCC
                label value p020 G171LABEI
                label value p021 G171LABEJ
                label value p026 G171LABEK
                label value p027 G171LABEL
                label value p028 zG171LABEM
                label value p029 G171LABEK
                label value p030 G171LABEL
                label value p031 zG171LABEM
                label value p032 G171LABEN
                label value p033 G171LABEN
                label value p034 G171LABEO
                label value p035 G171LABEO
            }
        /*}}}*/
        /*년도별 전공 선별{{{*/ 
            gen byte majtyp = .
            label define MAJTYP 1 "의학" 2 "치의학" 3 "한의학" 4 "수의학" 5 "약학"  6 "경영" 7 "경제" 8 "법" 9 "기타 문과"
            label value majtyp MAJTYP
            if ("`x'" == "7") {
                replace majtyp = 1 if inlist(major , 1798 , 1799 )
                replace majtyp = 2 if inlist(major , 2362 )
                replace majtyp = 3 if inlist(major , 2632 )
                replace majtyp = 4 if inlist(major , 1306 , 1307 )
                replace majtyp = 5 if inlist(major , 1516 , 1517 , 1518 , 2173 , 2174 ) 
                replace majtyp = 6 if inrange(major , 118 , 150 )
                replace majtyp = 7 if inrange(major , 151 , 165 )
                replace majtyp = 8 if inrange(major , 905 , 912 )
                replace majtyp = 9 if missing(majtyp) & inlist(majorcat , 1 , 2, 3 )
            }
            else {
                replace majtyp = 1 if inlist(major , "U06010100003", "U06010100004" , "U06010100005" , "U06010100017" , "U06010100021"  )
                replace majtyp = 2 if inlist(major , "U06010200005" )
                replace majtyp = 3 if inlist(major , "U06010300002" )
                replace majtyp = 4 if inlist(major , "U05020300003" , "U05020300015" )
                replace majtyp = 5 if strpos(major , "U060301" ) 
                replace majtyp = . if inlist(major , "U06030100021" ) 
                replace majtyp = 6 if strpos(major , "U020102" )
                replace majtyp = 7 if strpos(major , "U020101" )
                replace majtyp = 8 if strpos(major , "U020201" )
                replace majtyp = 9 if missing(majtyp) & inlist(majorcat , 1 , 2, 3 )
            }
        /*}}}*/
            gen year = `x' +2000
                label var year "조사년도"
            gen wave = `x' - 6
                label var wave "조사회차"
        /* 대학, 고교정보 합치기{{{*/
            rename pid g`yr'1pid
            merge 1:1 g`yr'1pid using ~/dropbox/goms/rawdata/goms_gu`yr' , nogen
            rename g`yr'1* * 
            capture label var uniname "출신대학명"
            capture label var unicode "출신대학code"
            if (`x' >= 9 ){
                merge 1:1 pid using ~/dropbox/goms/rawdata/goms_gh`yr' , nogen
                replace hsname = "" if strpos(hsname, "-1")
                replace hsname = "" if strpos(hsname, "-2")
                replace hsname = "" if strpos(hsname, "모름")
                replace hsname = "" if strpos(hsname, "무응답")
                replace hsname = "" if strpos(hsname, "비공개")
                replace hsname = "" if strpos(hsname, "거절")
                replace hsname = "" if strpos(hsname, "탁송")
                capture label var hsname "출신고교명"
                capture label var hscode "출신고교code"
            }
            rename * *`yr'
        /*}}}*/
            if ("`x'" == "15" ){
                destring school15 , replace
            }
            if (`x' >= 9 ){
                rename hs????`yr' hs????
            }
            rename uni????`yr' uni????
            mvdecode _all , mv(-1, -3)
            mvdecode p034* , mv(9, 10)
            mvdecode p026* , mv(8)
            mvdecode p029* , mv(8)
            if ("`x'" == "7") {
                rename unibran branch07
                label var branch "본분교"
                save ~/dropbox/goms/goms_master.dta , replace
            }
            else {
                append using ~/dropbox/goms/goms_master.dta
                save ~/dropbox/goms/goms_master.dta , replace
            }
        }
    /*}}}*/
/*데이터 정리작업 {{{*/
#delimit ;
        egen wave = rowtotal(wave??) ;				label var wave "조사회차" ;
        egen year = rowtotal(year??) ;				label var year "조사년도" ;
        egen majcat = rowtotal(majorcat??) , missing ;label var majcat "전공계열" ; label value majcat G071MAJO ;
        egen majtyp = rowtotal(majtyp??) , missing ;label var majtyp "전공구분" ; label value majtyp MAJTYP ;
        egen a004 = rowtotal(a004_10??) , missing ;	label var a004 "현직장 산업대분류(10차)" ; label value a004 LABD ;
        egen a005 = rowtotal(a005_10??) , missing ;	label var a005 "현직장 산업중분류(10차)" ; label value a005 LABE ;
        egen a006 = rowtotal(a006_10??) , missing ;	label var a006 "현직장 산업소분류(10차)" ; label value a006 G171A006 ;
        egen a007 = rowtotal(a007_2018??) , missing;label var a007 "현직장 직업중분류(2018)" ; label value a007 LABG ;
        egen a008 = rowtotal(a008_2018??) , missing;label var a008 "현직장 직업소분류(2018)" ; label value a008 LABH ;
        egen a009 = rowtotal(a009_2018??) , missing;label var a009 "현직장 직업세분류(2018)" ; label value a009 G171A009 ;
        egen a010 = rowtotal(a010??) , missing;		label var a010 "기업체 종사자수" ; label value a010 LABI ;
        egen a011 = rowtotal(a011??) , missing;		label var a011 "사업체 종사자수" ; label value a011 LABI ;
        egen a021 = rowtotal(a021??) , missing;		label var a021 "현직장 종사상지위" ; label value a021 G171A021 ;
        egen a022 = rowtotal(a022??) , missing;		label var a022 "계약기간 존재여부" ; label value a022 G171A022 ;
        egen a059 = rowtotal(a059??) , missing;		label var a059 "현직장 정규직(응답자판단)" ; label value a059 G171A059 ;
        egen a122 = rowtotal(a122??) , missing;		label var a122 "현직장 월평균근로소득(만원)" ; label value a122 LABA ;
        egen a356 = rowtotal(a356??) , missing;		label var a356 "주직장외 동시직장여부" ; label value a356 LABAF ; 
        egen a366 = rowtotal(a366??) , missing;		label var a366 "동시1직장 월평균근로소득(만원)" ; label value a366 LABAG ;
        egen a376 = rowtotal(a376??) , missing;		label var a376 "동시2직장 월평균근로소득(만원)" ; label value a376 LABAG ;
        egen a386 = rowtotal(a386??) , missing;		label var a386 "동시3직장 월평균근로소득(만원)" ; label value a386 LABAG ;
        egen f001 = rowtotal(f001??) , missing ;	label var f001 "출신고 졸업년" ;
        egen f002 = rowtotal(f002??) , missing ;	label var f002 "출신고 졸업월" ;
        egen f006 = rowtotal(f006??) , missing ;	label var f006 "출신고 소재지" ; label value f006 G171F006 ;
        egen f007 = rowtotal(f007??) , missing ;	label var f007 "출신고 소재지(시군구)" ; label value f007 G171F007 ;
        egen f010 = rowtotal(f010??) , missing ;	label var f010 "편입여부" ; label value f010 G171F010 ;
        egen f011 = rowtotal(f011??) , missing ;	label var f011 "출신대 입학년" ;
        egen f012 = rowtotal(f012??) , missing ;	label var f012 "출신대 입학월" ;
        egen p026 = rowtotal(p026??) , missing ;	label var p026 "아버지 최종학력" ; label value p026 G171LABEK ;
            label define G171LABEK 4 "고등학교" , modify ;
        egen p027 = rowtotal(p027??) , missing ;	label var p027 "아버지 최종학력 이수여부" ; label value p027 G151P027 ;
        egen p029 = rowtotal(p029??) , missing ;	label var p029 "어머니 최종학력" ; label value p029 G171LABEK ;
        egen p030 = rowtotal(p030??) , missing ;	label var p030 "어머니 최종학력 이수여부" ; label value p030 G151P030 ;
        egen p034 = rowtotal(p034??) , missing ;	label var p034 "대학입학당시 월평균 부모소득" ; label value p034 G171LABEO ;
        egen age = rowtotal(age??) , missing ;		label var age "만나이" ;
        egen birthy = rowtotal(birthy??) , missing ;label var birthy "출생년" ;
        egen birthm = rowtotal(birthm??) , missing ;label var birthm "출생월" ;
        egen graduy = rowtotal(graduy??) , missing ;label var graduy "대학졸업년" ;
        egen gradum = rowtotal(gradum??) , missing ;label var gradum "대학졸업월" ;
        egen sex = rowtotal(sex??) , missing ;		label var sex "성별" ;
        egen wgt = rowtotal(wt??) , missing ;		label var wgt "개인가중치" ;
        egen branch = rowtotal(branch??) , missing ;label var branch "본분교" ; label value branch G081BRAN ;
        egen school = rowtotal(school??) , missing ;label var school "출신대학유형" ; label value school G071SCHO ;
        egen pid = rowtotal(pid??) , missing ;		label var pid "id" ;
#delimit cr
merge m:1 uniname using ~/dropbox/goms/rawdata/uniranking.dta , nogen
	label var unirank "QS2018순위"
	/* 07-17까지 뒷자리 제거 {{{*/
        rename f009?? f009??mark
        rename f013?? f013??mark
        rename f014?? f014??mark
        rename f170?? f170??mark
        rename (f007 f010 f011 f012) (f007mark f010mark f011mark f012mark)
        rename (a007 a008 a009 a010 a011) (a007mark a008mark a009mark a010mark a011mark)
        forvalue i = 7/17 {
            local yr : disp %02.0f = `i'
            drop *`yr'
        }
        drop unibran
        rename *mark *
	/*}}}*/
/*}}}*/
label data "GOMS 07-17"
	order _all , alpha
	order pid wave year , first
	sort wave pid
save ~/dropbox/goms/goms_master.dta , replace
