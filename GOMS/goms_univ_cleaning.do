local path ~/dropbox/data/
tempfile tfile1 tfile2 tfile3

    use `path'dta/kesslist , clear
        gen kess_uniname = uniname
        gen kess_zipcode = zipcode
        /*exception control for merging*/
            replace uniname = "가야대학교" if strpos(uniname , "가야대학교")
            replace uniname = "건국대학교" if strpos(uniname , "건국대학교")
            replace uniname = "고려대학교" if strpos(uniname , "고려대학교")
            replace uniname = "동국대학교" if strpos(uniname , "동국대학교")
            replace uniname = "명지대학교" if strpos(uniname , "명지대학교")
            replace uniname = "연세대학교" if strpos(uniname , "연세대학교")
            replace uniname = "한양대학교" if strpos(uniname , "한양대학교")
            replace uniname = "홍익대학교" if strpos(uniname , "홍익대학교")
        save `tfile1' , replace

    use `path'dta/alimilist , clear
        gen alimi_uniname = uniname
        gen alimi_zipcode = zipcode
        /*exception control for merging*/
            replace uniname = "가야대학교" if strpos(uniname , "가야대학교")
            replace uniname = "건국대학교" if strpos(uniname , "건국대학교")
            replace uniname = "고려대학교" if strpos(uniname , "고려대학교")
            replace uniname = "동국대학교" if strpos(uniname , "동국대학교")
            replace uniname = "명지대학교" if strpos(uniname , "명지대학교")
            replace uniname = "연세대학교" if strpos(uniname , "연세대학교")
            replace uniname = "한양대학교" if strpos(uniname , "한양대학교")
            replace uniname = "홍익대학교" if strpos(uniname , "홍익대학교")
        save `tfile2' , replace

    /*gen aklist.dta by merging alimilist.dta and kesslist.dta*/
        merge 1:1 uniname zipcode using `tfile1'
            label data "대학명부 from ALIMI and KESS"
            label define AKMERGE 1 "ALIMI only(1)" 2 "KESS only(2)" 3 "matched(3)"
            label value _merge AKMERGE 
            rename _merge akmerge
            sort uniname
            order _all , alpha
            order uniname zipcode  br* school* , first
        save `path'dta/aklist , replace

    use `path'dta/gomslist , clear
        gen area = uniarea
        label value area AREA
        /*검색불가로 삭제*/
            replace uniname = "" if uniname == "강원전문대학교" 
        /*자료정정*/
        /*충청남도 연기군의 세종시 전환*/
            replace area = 17 if area == 11 &( uniname == "고려대학교" |     ///
                                               uniname == "홍익대학교" |     ///
                                               uniname == "대전가톨릭대학교" ///
                                             )
        /*동국대 바이오메디캠*/
            replace area = 8 if uniname == "동국대학교" & rawarea == 8
        /*단국대 서울캠의 경기 죽전 이전*/
            replace area = 8 if uniname == "단국대학교" & rawarea == 1
        /* 4년제대학 단순변경 : 현재대학명으로 변경{{{*/
            replace uniname = "가톨릭관동대학교" if uniname == "관동대학교"
                /*관동대학교 1989-2014 4년제*/
                /*가톨릭관동대학교 2014- 4년제*/
            replace uniname = "광주대학교" if uniname == "광주대학교(산업대)"
                /*광주대학교 4년제*/
            replace uniname = "강서대학교" if uniname == "그리스도대학교"
                /*그리스도대학교 2004- 4년제*/
                /*케이씨대학교 2015- 4년제*/
                /*강서대학교 2022- 4년제*/
            replace uniname = "가톨릭꽃동네대학교" if uniname == "꽃동네현도사회복지대학교"
                /*꽃동네현도사회복지대학교 1999- 4년제*/
                /*꽃동네대학교 2011- 4년제*/
                /*가톨릭꽃동네대학교 2021- 4년제*/
            replace uniname = "세한대학교" if uniname == "대불대학교"
                /*대불대학교 1996- 4년제*/
                /*세한대학교 2013- 4년제*/
            replace uniname = "동명대학교" if uniname == "동명정보대학교"
                /*동명정보대학교1996- 4년제*/
                /*동명대학교 2006- 4년제*/
            replace uniname = "경북대학교" if uniname == "상주대학교"
                /*상주대학교1980- 4년제 국립대*/
                /*경북대학교 상주캠퍼스 2008- 4년제*/
            replace uniname = "선교청대학교" if uniname == "성민대학교"
                /*성민대학교 2002- 4년제*/
                /*선교청대학교 2011-2012 4년제*/
            replace uniname = "화성의과학대학교" if uniname == "신경대학교"
                /*신경대학교 2005- 4년제*/
                /*화성의과학대학교 2022- 4년제*/
            replace uniname = "아신대학교" if uniname == "아세아연합신학대학교"
                /*아세아연합신학대학교 1981- 4년제*/
                /*아신대학교 2021- 4년제*/
            replace uniname = "한국국제대학교" if uniname == "진주국제대학교"
                /*진주국제대학교 2003- 4년제*/
                /*한국국제대학교 2008- 4년제*/
            replace uniname = "한국교통대학교" if uniname == "충주대학교"
                /*충주대학교 1999- 산업대학*/
                /*한국철도대학 통합 2011-*/
                /*한국교통대학교 2012-*/
            replace uniname = "한국침례신학대학교" if uniname == "침례신학대학교"
                /*침례신학대학교 1993-*/
                /*한국침례신학대학교 2020*/
            replace uniname = "강서대학교" if uniname == "케이씨대학교"
                /*케이씨대학교 2015-*/
                /*강서대학교 2022-*/
            replace uniname = "차의과학대학교" if uniname == "포천중문의과대학교"
                /*포천중문의과대학교 1997- 4년제*/
                /*차의과학대학교 2009- 4년제*/
            replace uniname = "한국과학기술원" if uniname == "한국정보통신대학교"
                /*한국정보통신대학교 2002- 4년제*/
                /*한국과학기술원 2009-*/
            replace uniname = "서울한영대학교" if uniname == "한영신학대학교"
                /*한영신학대학교 1996- 4년제 서울시*/
                /*서울한영대학교 2017-*/
        /*}}}*/
        /* 4년제대학 복잡변경 : 캠퍼스 매칭{{{*/
            replace uniname = "강릉원주대학교" if uniname == "강릉대학교"
                /*강릉대학교 1979- 4년제*/
                /*강릉원주대학교 강릉캠퍼스 2009- 4년제*/
            replace area = 8 if uniname == "경원대학교"
            replace uniname = "가천대학교" if uniname == "경원대학교"
                /*경원대학 1982- 4년제*/
                /*경원대학교 1987- 4년제*/
                /*가천대학교 글로벌캠퍼스 2008-*/
            replace uniname = "선문대학교" if uniname == "성화대학교" & area == 11
                /*성화대학교 1989- 4년제*/
                /*선문대학교 1986- 4년제*/
                /*충남 천안시*/
                /*충남 아산시*/
            replace area = 13 if uniname == "여수대학교"
            replace uniname = "전남대학교" if uniname == "여수대학교"
                /*여수대학교 1998- 4년제*/
                /*전남대학교 여수캠퍼스 2006-*/
            replace uniname = "제주대학교" if uniname == "제주교육대학교"
                /*제주교육대학교 1984- 4년제*/
                /*제주대학교 교육대학 2008- 4년제*/
            replace uniname = "경상국립대학교" if uniname == "진주산업대학교"
            replace uniname = "경상국립대학교" if uniname == "경상대학교"
                /*진주산업대학교 1993- 4년제 산업대학*/
                /*경남과학기술대학교 2011- 일반대학*/
                /*경상대학교 1980-2021 4년제 산업대학*/
                /*경상국립대학교 칠암캠퍼스 2021-*/
                /*경상국립대학교 진주캠퍼스 2021-*/
        /*}}}*/
        save `tfile3' , replace

    /*gen akglist.dta by merging gomslist.dta and aklist.dta*/
    use `path'dta/aklist , clear
        merge m:m uniname area using `tfile3'
        label data "GOMS 4년제 대학정보 cleaned by ALIMI and KESS"
        gen byte akgmerge = . 
        replace akgmerge = 4 if _merge == 3
        replace akgmerge = 3 if _merge == 1 & akmerge == 2
        replace akgmerge = 2 if _merge == 1 & akmerge == 1
        replace akgmerge = 1 if _merge == 2 
        drop _merge
        label define AKGMERGE 1 "GOMS only(1)" 2 "ALIMI only(2)" 3 "KESS only(3)" 4 "matched(4)"
        label value akgmerge AKGMERGE
        /*자료정정*/
            replace school = 1 if uniname == "성화대학교" & area == 13
        /* 전문대학 : 전문대학으로 지정{{{*/
            replace schooldtl = 15 if uniname == "경기공업대학교"
                /*경기공업대학교 1999- 전문대학*/
                /*경기과학기술대학교 2011- 전문대학*/
            replace schooldtl = 15 if uniname == "경동정보대학교"
                /*경동전문대학 1992- 전문대학*/
                /*경산1대학 2009- 전문대학*/
                /*호산대학교2015- 전문대학*/
            replace schooldtl = 15 if uniname == "경산1대학교" 
                /*경동전문대학 1992- 전문대학*/
                /*경산1대학 2009- 전문대학*/
                /*호산대학교2015- 전문대학*/
            replace schooldtl = 15 if uniname == "경원전문대학교"
                /*경원전문대학 1990-*/
                /*경원대학교 2007- 4년제*/
                /*가천대학교 글로벌캠퍼스 2008- 4년제*/
            replace schooldtl = 15 if uniname == "계원디자인예술대학교"
                /*계원조형예술학교1993-1994*/
                /*계원조형예술전문대학 1995-1997*/
                /*계원조형예술대학 1998-2007*/
                /*계원디자인예술대학 2008-2011*/
                /*계원예술대학교 2012-현재*/
            replace schooldtl = 15 if uniname == "계원조형예술대학교"
                /*계원조형예술학교1993-1994*/
                /*계원조형예술전문대학 1995-1997*/
                /*계원조형예술대학 1998-2007*/
                /*계원디자인예술대학 2008-2011*/
            replace schooldtl = 15 if uniname == "공주영상대학교"
                /*공주영상대학교 2011-*/
                /*한국영상대학교 2013-*/
            replace schooldtl = 15 if uniname == "극동정보대학"
                /*극동정보대학1998- 전문대학*/
                /*강동대학 2011- 전문대학*/
                /*강동대학교 2011- 전문대학*/
            replace schooldtl = 15 if uniname == "김천과학대학교"
                /*김천과학대학교 2012- 전문대학*/
                /*경북보건대학교 2015- 전문대학*/
            replace schooldtl = 15 if uniname == "나주대학"
                /*나주대학 1998- 전문대학*/
                /*고구려대학 2012- 전문대학*/
            replace schooldtl = 15 if uniname == "대구미래대학교"
                /*대구미래대학교 2012-2018 전문대학*/
            replace schooldtl = 15 if uniname == "동부산대학교"
                /*동부산대학교 2012-2020 전문대학*/
            replace schooldtl = 15 if uniname == "동아인재대학교"
                /*동아인재대학교 2012- 전문대학*/
                /*동아보건대학교 2016- 전문대학*/
            replace schooldtl = 15 if uniname == "동양공업전문대학"
                /*동양공업전문대학 1978- 전문대학*/
                /*동양미래대학교 2010- 전문대학*/
            replace schooldtl = 15 if uniname == "동우대학"
                /*동우대학 1983- 전문대학*/
                /*경동대학교 2012- 4년제*/
            replace schooldtl = 15 if uniname == "동주대학교"
                /*동주대학교 2011- 전문대학*/
                /*부산보건대학교 2022- 전문대학*/
            replace schooldtl = 15 if uniname == "벽성대학"
                /*벽성대학 1998-2014 전문대학*/
            replace schooldtl = 15 if uniname == "부산정보대학"
                /*부산정보대학 1998- 전문대학*/
                /*부산과학기술대학교 2012- 전문대학*/
            replace schooldtl = 15 if uniname == "삼육간호보건대학"
                /*삼육간호보건대학 1998- 전문대학*/
                /*삼육보건대학 2007- 전문대학*/
                /*삼육보건대학교 2012- 전문대학*/
            replace schooldtl = 15 if uniname == "삼육의명대학"
                /*삼육의명대학 1998- 전문대학 경기도 남양주*/
                /*삼육대학교 2006- 4년제*/
            replace schooldtl = 15 if uniname == "서강정보대학"
                /*서강정보대학 1998- 전문대학*/
                /*서영대학교 2011- 전문대학*/
                /*광주특별시*/
                /*경기도 파주시*/
            replace schooldtl = 15 if uniname == "서울보건대학교"
                /*서울보건대학교 1998- 전문대학*/
                /*을지대학교 성남캠퍼스 2006- 4년제*/
            replace schooldtl = 15 if uniname == "서해대학교"
                /*서해대학교 1998-2021 전문대학*/
            replace schooldtl = 15 if uniname == "성덕대학교"
                /*성덕대학교 2012- 전문대학*/
                /*성운대학교 2020- 전문대학*/
            replace schooldtl = 15 if uniname == "순천청암대학교"
                /*순천청암대학 1998- 전문대학*/
                /*청암대학 2010- 전문대학*/
                /*청암대학교 2012- 전문대학*/
            replace schooldtl = 15 if uniname == "신흥대학교"
                /*신흥대학교 2011- 전문대학*/
                /*신한대학교 제1캠퍼스(의정부) 2014- 4년제*/
            replace schooldtl = 15 if uniname == "안동정보대학"
                /*안동정보대학 1998- 전문대학*/
                /*건동대학교 2006- 4년제*/
            replace schooldtl = 15 if uniname == "안산공과대학"
                /*안산공과대학 1998- 전문대학*/
                /*신안산대학교 2011- 전문대학*/
            replace schooldtl = 15 if uniname == "안양과학대학"
                /*안양과학대학 1998- 전문대학*/
                /*연성대학교 2012- 전문대학*/
            replace schooldtl = 15 if uniname == "양산대학교"
                /*양산대학 1998- 전문대학*/
                /*양산대학교 2012- 전문대학*/
                /*동원과학기술대학교 2013- 전문대학*/
            replace schooldtl = 15 if uniname == "연암공업대학"
                /*연암공업대학 1998- 전문대학*/
                /*연암공과대학교 2016- 전문대학*/
            replace schooldtl = 15 if uniname == "영동대학교"
                /*영동대학교 1998- 전문대학*/
                /*유원대학교 2016- 전문대학*/
                /*충북 영동군*/
                /*충남 아산시*/
            replace schooldtl = 15 if uniname == "용인송담대학교"
                /*용인송담대학교 1995- 전문대학*/
                /*용인예술과학대학교 2021- 전문대학*/
            replace schooldtl = 15 if uniname == "우송공업대학"
                /*우송공업대학 1998- 전문대학*/
                /*우송대학교 서캠퍼스 2009- 4년제*/
            replace schooldtl = 15 if uniname == "원주대학"
                /*원주대학 1999- 국립전문대학*/
                /*강릉원주대학 원주캠퍼스 2007- 4년제*/
            replace uniname   = "익산대학" if uniname == "익산대학교"
            replace schooldtl = 15         if uniname == "익산대학"
                /*익산대학 1998- 전문대학*/
                /*전북대학교 익산캠퍼스 2008- 4년제*/
            replace schooldtl = 15 if uniname == "인천전문대학"
                /*인천전문대학 1981- 전문대학*/
                /*인천대학교 2010- 4년제*/
            replace schooldtl = 15 if uniname == "적십자간호대학"
                /*적십자간호대학 1998- 전문대학*/
                /*중앙대학교 적십자간호대학 2012- 4년제*/
            replace schooldtl = 15 if uniname == "제주산업정보대학"
                /*제주산업정보대학 1998- 전문대학*/
                /*제주국제대학교 2012- 4년제*/
            replace uniname   = "주성대학" if uniname == "주성대학교"
            replace schooldtl = 15         if uniname == "주성대학"
                /*주성대학 1998- 전문대학*/
                /*충북보건과학대학 2012- 전문대학*/
            replace schooldtl = 15 if uniname == "창원전문대학"
                /*창원전문대학 1983- 전문대학*/
                /*창원문성대학 2011- 전문대학*/
                /*창원문성대학교 2016- 전문대학*/
            replace schooldtl = 15 if uniname == "천안공업대학"
                /*천안공업대학 1999- 국립전문대학*/
                /*공주대학교 공과대학 2005- 4년제*/
            replace schooldtl = 15 if uniname == "천안연암대학"
                /*천안연암대학 2003- 전문대학*/
                /*연암대학교 2016- 전문대학*/
            replace schooldtl = 15 if uniname == "청양대학"
                /*청양대학 1998- 공립전문대학*/
                /*충남도립청양대학 2009- 공립전문대학*/
                /*충남도립대학 2015- 공립전문대학*/
            replace schooldtl = 15 if uniname == "청주과학대학"
                /*청주과학대학 1999- 국립전문대학*/
                /*국립충추대학교 통합 2006-*/
                /*한국철도대학 통합 2012-*/
                /*한국교통대학교 증평캠퍼스 2012- 국립 4년제*/
            replace schooldtl = 15 if uniname == "춘해대학"
                /*춘해대학 1988- 사립전문대학*/
                /*춘해보건대학 2008- 사립전문대학*/
                /*춘해보건대학교 2012- 사립전문대학*/
            replace schooldtl = 15 if uniname == "충북과학대학"
                /*충북과학대학 2000- 공립전문대학*/
                /*충북도립대학 2008-*/
                /*충북도립대학교 2019-*/
            replace schooldtl = 15 if uniname == "탐라대학교"
                /*탐라대학교 1998- 전문대학*/
                /*제주국제대학교 2012- 4년제*/
            replace schooldtl = 15 if uniname == "한국국제대학교"
                /*한국국제대학교 2008-2023 전문대학*/
            replace schooldtl = 15 if uniname == "한국농수산대학"
                /*한국농수산대학 2009- 전문대학*/
            replace schooldtl = 15 if uniname == "한국재활복지대학"
                /*한국재활복지대학 2001- 국립전문대학*/
                /*한국복지대학교 2012- 국립전문대학*/
            replace schooldtl = 15 if uniname == "한영대학"
                /*한영대학 2002- 전문대학 전남 여수시*/
                /*한영대학교 2019- 전문대학*/
            replace schooldtl = 15 if uniname == "혜천대학교"
                /*혜천대학교 2011- 전문대학*/
                /*대전과학기술대학교 2014- 전문대학*/
        /*}}}*/
        /* 폐지대학 : 결측치{{{*/
            replace status = 3 if uniname == "건동대학교"
                /*안동공업전문대학 1992- 전문대학*/
                /*안동정보대학 1998- 전문대학*/
                /*건동대학교 2006-2012 4년제 폐교*/
            replace status = 3 if uniname == "경북외국어대학교"
                /*경북외국어대학교 2005-2013*/
            replace status = 3 if uniname == "국립의료원간호대학"
                /*국립의료원간호대학1998-2006 전문대학 성신여대와 통합*/
            replace status = 3 if uniname == "대구외국어대학교"
                /*대구외국어대학교2002-2018 4년제*/
            replace status = 3 if uniname == "명신대학교"
                /*명신대학교 2000-2012 4년제*/
            replace status = 3 if uniname == "서남대학교"
                    /*서남대학교 1991-2018 4년제*/
                    /*전북 남원시*/
                    /*충남 아산시*/
            replace status = 3 if uniname == "선교청대학교"
                    /*성민대학교 2002- 4년제*/
                    /*선교청대학교 2011-2012 4년제*/
            replace status = 3 if uniname == "아시아대학교"
                /*아시아대학교 2003-2008 4년제*/
            replace status = 3 if uniname == "한경대학교"
                    /*한경대학교(산업대) 1999-폐교 */
            replace status = 3 if uniname == "한려대학교"
                    /*한려대학교 1994-2021 4년제*/
            replace status = 3 if uniname == "한중대학교"
                    /*한중대학교 2005-2018 4년제*/
        /*}}}*/
        /* 4년제대학 기존 : 기타지역=결측 | 4년제로 정정{{{*/
            replace uniname = ""               if uniname == "건국대학교"             & missing(area)
            replace school  = 2                if uniname == "건양대학교"
            replace uniname = ""               if uniname == "건양대학교"             & missing(area)
            replace uniname = ""               if uniname == "경인교육대학교"         & missing(area)
            replace uniname = ""               if uniname == "경희대학교"             & missing(area)
            replace school  = 2                if uniname == "경희대학교"             & !missing(area)
            replace uniname = ""               if uniname == "고려대학교"             & missing(area)
            replace school  = 2                if uniname == "고려대학교"             & !missing(area)
            replace school  = 1                if uniname == "고려대학교병설보건대학" & !missing(area)
            replace uniname = ""               if uniname == "단국대학교"             & missing(area)
            replace school  = 2                if uniname == "단국대학교"             & !missing(area)
            replace area    = rawarea          if uniname == "동국대학교"
            replace uniname = ""               if uniname == "동국대학교"             & !inlist(rawarea , 1 , 8 , 14)
            replace school  = 2                if uniname == "동국대학교"             & !missing(area)
            replace uniname = ""               if uniname == "명지대학교"             & missing(area)
            replace uniname = ""               if uniname == "상명대학교"             & missing(area)
            replace uniname = ""               if uniname == "연세대학교"             & !inlist(rawarea , 1 , 9)
            replace uniname = ""               if uniname == "영산대학교"             & !inlist(rawarea , 2 , 15)
            replace uniname = ""               if uniname == "중앙대학교"             & missing(area)
            replace uniname = ""               if uniname == "한국체육대학교"         & !inlist(rawarea ,1)
            replace uniname = ""               if uniname == "홍익대학교"             & !inlist(rawarea , 1 , 11 , 17)
            replace uniname = ""               if uniname == "한양대학교"             & missing(area)
            replace uniname = ""               if uniname == "한국외국어대학교"       & !inlist(rawarea ,1 , 8)
        /*}}}*/
        /*matching school and schooldtl*/
            replace school = 1 if !inlist(schooldtl , 2 , 5) & !missing(schooldtl)
            replace school = 2 if schooldtl == 5
            replace school = 3 if schooldtl == 2
            replace schooldtl = 2 if school == 3
            replace schooldtl = 5 if school == 2
        /*matching branch and branchdtl*/
            replace branch = 1 if branchdtl == 1
            replace branch = 2 if branchdtl == 5
            replace branch = 3 if inlist(branchdtl , 2 , 3 , 4)
            replace branchdtl = 1 if branch == 1
            replace branchdtl = 5 if branch == 2
        drop if missing(pid) | missing(uniname) | status == 3 | school == 1
        /*merge with geoinfo*/
            drop address
            merge m:1 uniname zipcode using akggeoinfo 
            drop _merge
        save `path'dta/akglist , replace

    /*gen goms_univ.dta*/
        keep uniname-schooldtl area* found* status unimain-uniscr50 address-distance pid year
        save `path'goms/rawdata/goms_univ , replace 
