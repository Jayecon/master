    local path ~/dropbox/data/goms/
    set more off
    set maxvar 30000
    /*  gen univ data body from rawfiles {{{*/
        tempfile tfile
        forvalue x = 7/19 {
            local yr : disp %02.0f  = `x'
            use `path'rawdata/GP`yr' , clear
            drop if missing(g`yr'1sex)
            /*keep vars*/
                if `x' == 7 {
                    keep g`yr'1pid              g`yr'1province g`yr'1area g`yr'1school g`yr'1found
                }
                else {
                    keep g`yr'1pid g`yr'1branch g`yr'1province g`yr'1area g`yr'1school g`yr'1found
                }
            /*merge with the university file */
                merge 1:1 g`yr'1pid using `path'rawdata/goms_gu`yr' , nogen
                rename g`yr'1* *
                gen year = 2000 + `x'
                    label var year "조사년도"
            /*control exceptions */
                if ("`x'" == "7" ){
                    rename unibran branch
                }
                if ("`x'" == "15" ){
                    destring school, replace
                }
                if ("`x'" >= "18" ){
                    destring unicode, replace force
                }
            /*append files*/
                if `x' == 7 {
                    save `tfile' , replace
                }
                else {
                    append using `tfile'
                    save `tfile' , replace
                }
        }
    /*}}}*/
    /*merge with the QS2018 ranking*/
        use `tfile' , clear
        merge m:1 uniname using `path'rawdata/qs2018korea.dta , nogen
    /*copy original of vars*/
        gen rawschool   = school
        gen rawfound    = found
        gen rawbranch   = branch
        gen rawuniname  = uniname
        gen rawprovince = province
        gen rawarea     = area
        label var rawfound     "rawdata of found"
        label var rawschool    "rawdata of school"
        label var rawbranch    "rawdata of branch"
        label var rawuniname   "rawdata of uniname"
        label var rawprovince  "rawdata of province"
        label var rawarea      "rawdata of area"
    /*cleaning : found{{{*/
        label var found      "국공사립"
            label copy G191FOUN FOUND
            label define FOUND 7 "기타" , add
            label value found FOUND
            recode found (4=7) if year == 2011
            recode found (4=7) if year == 2012
            recode found (4=7) if year == 2013
            recode found (4=7) if year == 2014
    /*}}}*/
    /*cleaning : branch {{{*/
        replace branch = 2 if uniname == "고려대학교세"
        replace branch = 2 if uniname == "고려대학교 세"
        replace branch = 2 if uniname == "고려대학교세종캠퍼스"
        replace branch = 2 if uniname == "고려대학교 세종캠퍼스"
        replace branch = 2 if uniname == "연세대학교원"
        replace branch = 2 if uniname == "연세대학교 원"
        replace branch = 2 if uniname == "연세대학교원주캠퍼스"
        replace branch = 2 if uniname == "연세대학교 원주캠퍼스"
        replace branch = 3 if uniname == "을지대학교성"
        replace branch = 3 if uniname == "을지대학교 성"
        replace branch = 3 if uniname == "을지대학교성남캠퍼스"
        replace branch = 3 if uniname == "을지대학교 성남캠퍼스"
        replace branch = 1 if uniname == "중앙대학교서"
        replace branch = 1 if uniname == "중앙대학교 서"
        replace branch = 1 if uniname == "중앙대학교서울캠퍼스"
        replace branch = 1 if uniname == "중앙대학교 서울캠퍼스"
        replace branch = 1 if uniname == "중앙대학교제1캠퍼스"
        replace branch = 1 if uniname == "중앙대학교 제1캠퍼스"
        replace branch = 1 if uniname == "중앙대학교제1캠퍼스(서울)"
        replace branch = 1 if uniname == "중앙대학교 제1캠퍼스(서울)"
        replace branch = 3 if uniname == "중앙대학교안"
        replace branch = 3 if uniname == "중앙대학교 안"
        replace branch = 3 if uniname == "중앙대학교안성캠퍼스"
        replace branch = 3 if uniname == "중앙대학교 안성캠퍼스"
        replace branch = 3 if uniname == "중앙대학교제2캠퍼스"
        replace branch = 3 if uniname == "중앙대학교 제2캠퍼스"
        replace branch = 3 if uniname == "중앙대학교제2캠퍼스(안성)"
        replace branch = 3 if uniname == "중앙대학교 제2캠퍼스(안성)"
        replace branch = 2 if uniname == "홍익대학교" & branch == 3
        replace branch = 2 if uniname == "홍익대학교세"
        replace branch = 2 if uniname == "홍익대학교 세"
        replace branch = 2 if uniname == "홍익대학교세종캠퍼스"
        replace branch = 2 if uniname == "홍익대학교 세종캠퍼스"
        replace branch = 2 if uniname == "홍익대학교조치원캠퍼스"
        replace branch = 2 if uniname == "홍익대학교 조치원캠퍼스"
        mvdecode branch , mv(4)
    /*}}}*/
    /*cleaning : uniname {{{*/
        replace uniname = "가천대학교" if uniname == "가천길대학"
        replace uniname = "가천대학교" if uniname == "가천의과학대학교"
        replace uniname = "가톨릭상지대학교" if uniname == "가톨릭상지대학"
        replace uniname = "감리교신학대학교" if uniname == "감리교신학대학"
        replace uniname = "강릉영동대학교" if uniname == "강릉영동대학"
        replace uniname = "강원관광대학교" if uniname == "강원관광대학"
        replace uniname = "강원도립대학교" if uniname == "강원도립대학"
        replace uniname = "강원전문대학교" if uniname == "강원전문대학"
        replace uniname = "강동대학교" if uniname == "극동전문대학"
        replace uniname = "거제대학교" if uniname == "거제대학"
        replace uniname = "거창전문대학교" if uniname == "거창전문대학"
        replace uniname = "경기공업대학교" if uniname == "경기공업대학"
        replace uniname = "경기과학기술대학교" if uniname == "경기과학기술대"
        replace uniname = "경남과학기술대학교" if uniname == "경남과학기술대"
        replace uniname = "경남도립거창대학" if uniname == "경남도립거창대"
        replace uniname = "경남도립거창대학" if uniname == "경남도립거창대교"
        replace uniname = "경남도립거창대학" if uniname == "거창전문대학교"
        replace uniname = "경남도립남해대학" if uniname == "경남도립남해대"
        replace uniname = "경남도립남해대학" if uniname == "경남도립남해대교"
        replace uniname = "경남도립남해대학" if uniname == "남해전문대학"
        replace uniname = "경남정보대학교" if uniname == "경남정보대학"
        replace uniname = "경동정보대학교" if uniname == "경동정보대학"
        replace uniname = "경민대학교" if uniname == "경민대학"
        replace uniname = "경복대학교" if uniname == "경복대학"
        replace uniname = "경북과학대학교" if uniname == "경북과학대학"
        replace uniname = "경북대학교" if uniname == "경북대학교상주캠퍼스"
        replace uniname = "경북대학교" if uniname == "경북대학교 상주캠퍼스"
        replace uniname = "경북도립대학교" if uniname == "경도대학"
        replace uniname = "경북도립대학교" if uniname == "경북도립대학"
        replace uniname = "경북외국어대학교" if uniname == "경북외국어대학"
        replace uniname = "경북전문대학교" if uniname == "경북전문대학"
        replace uniname = "경산1대학교" if uniname == "경산1대학"
        replace uniname = "경원전문대학교" if uniname == "경원전문대학"
        replace uniname = "경인여자대학교" if uniname == "경인여자대학"
        replace uniname = "계명문화대학교" if uniname == "계명문화대학"
        replace uniname = "계원디자인예술대학교" if uniname == "계원디자인예술대학"
        replace uniname = "계원조형예술대학교" if uniname == "계원조형예술대학"
        replace uniname = "고구려대학교" if uniname == "고구려대학"
        replace uniname = "고려대학교" if uniname == "고려대학교세"
        replace uniname = "고려대학교" if uniname == "고려대학교 세"
        replace uniname = "고려대학교" if uniname == "고려대학교세종캠퍼스"
        replace uniname = "고려대학교" if uniname == "고려대학교 세종캠퍼스"
        replace uniname = "고려대학교병설보건대학" if uniname == "고려대학교병설보건대"
        replace uniname = "공주영상대학교" if uniname == "공주영상대학"
        replace uniname = "광양보건대학교" if uniname == "광양보건대학"
        replace uniname = "광주대학교(산업대)" if uniname == "광주대학교(산"
        replace uniname = "광주보건대학교" if uniname == "광주보건대학"
        replace uniname = "구미대학교" if uniname == "구미1대학"
        replace uniname = "국제대학교" if uniname == "국제대학"
        replace uniname = "군산간호대학교" if uniname == "군산간호대학"
        replace uniname = "군장대학교" if uniname == "군장대학"
        replace uniname = "기독간호대학교" if uniname == "기독간호대학"
        replace uniname = "김천과학대학교" if uniname == "김천과학대학"
        replace uniname = "김천대학교" if uniname == "김천대학"
        replace uniname = "김포대학교" if uniname == "김포대학"
        replace uniname = "김해대학교" if uniname == "김해대학"
        replace uniname = "가톨릭꽃동네대학교" if uniname == "꽃동네대학교"
        replace uniname = "꽃동네현도사회복지대학교" if uniname == "꽃동네현도사회복지대"
        replace uniname = "전남도립대학교" if uniname == "남도대학"
        replace uniname = "농협대학교" if uniname == "농협대학"
        replace uniname = "대경대학교" if uniname == "대경대학"
        replace uniname = "대구가톨릭대학교" if uniname == "대구가톨릭대학"
        replace uniname = "대구공업대학교" if uniname == "대구공업대학"
        replace uniname = "대구과학대학교" if uniname == "대구과학대학"
        replace uniname = "대구미래대학교" if uniname == "대구미래대학"
        replace uniname = "대구보건대학교" if uniname == "대구보건대학"
        replace uniname = "대구외국어대학교" if uniname == "대구외국어대학"
        replace uniname = "대덕대학교" if uniname == "대덕대학"
        replace uniname = "대동대학교" if uniname == "대동대학"
        replace uniname = "대림대학교" if uniname == "대림대학"
        replace uniname = "대원대학교" if uniname == "대원대학"
        replace uniname = "대원대학교" if uniname == "대원과학대학"
        replace uniname = "대전보건대학교" if uniname == "대전보건대학"
        replace uniname = "동강대학교" if uniname == "동강대학"
        replace uniname = "동남보건대학교" if uniname == "동남보건대학"
        replace uniname = "동명대학교" if uniname == "동명대학"
        replace uniname = "동부산대학교" if uniname == "동부산대학"
        replace uniname = "동서울대학교" if uniname == "동서울대학"
        replace uniname = "동아방송예술대학교" if uniname == "동아방송예술대"
        replace uniname = "동아방송예술대학교" if uniname == "동아방송예술대학"
        replace uniname = "동아인재대학교" if uniname == "동아인재대학"
        replace uniname = "동양미래대학교" if uniname == "동양미래대학"
        replace uniname = "동원과학기술대학교" if uniname == "동원과학기술대"
        replace uniname = "동원대학교" if uniname == "동원대학"
        replace uniname = "동의과학대학교" if uniname == "동의과학대학"
        replace uniname = "동주대학교" if uniname == "동주대학"
        replace uniname = "두원공과대학교" if uniname == "두원공과대학"
        replace uniname = "마산대학교" if uniname == "마산대학"
        replace uniname = "마산대학교" if uniname == "마산대학의령캠퍼스"
        replace uniname = "마산대학교" if uniname == "마산대학 의령캠퍼스"
        replace uniname = "명지대학교" if uniname == "명지대학교인문캠퍼스 "
        replace uniname = "명지대학교" if uniname == "명지대학교 인문캠퍼스"
        replace uniname = "명지대학교" if uniname == "명지대학교인"
        replace uniname = "명지대학교" if uniname == "명지대학교 인"
        replace uniname = "명지대학교" if uniname == "명지대학교자연캠퍼스 "
        replace uniname = "명지대학교" if uniname == "명지대학교 자연캠퍼스"
        replace uniname = "명지대학교" if uniname == "명지대학교자"
        replace uniname = "명지대학교" if uniname == "명지대학교 자"
        replace uniname = "목포가톨릭대학교" if uniname == "목포가톨릭대학"
        replace uniname = "목포과학대학교" if uniname == "목포과학대학"
        replace uniname = "문경대학교" if uniname == "문경대학"
        replace uniname = "배화여자대학교" if uniname == "배화여자대학"
        replace uniname = "백석문화대학교" if uniname == "백석문화대학"
        replace uniname = "백제예술대학교" if uniname == "백제예술대학"
        replace uniname = "부산가톨릭대학교" if uniname == "부산가톨릭대학"
        replace uniname = "부산경상대학교" if uniname == "부산경상대학"
        replace uniname = "부산과학기술대학교" if uniname == "부산과학기술대"
        replace uniname = "부산여자대학교" if uniname == "부산여자대학"
        replace uniname = "부산예술대학교" if uniname == "부산예술대학"
        replace uniname = "부산외국어대학교" if uniname == "부산외국어대학"
        replace uniname = "부천대학교" if uniname == "부천대학"
        replace uniname = "삼육보건대학교" if uniname == "삼육보건대학"
        replace uniname = "상지영서대학교" if uniname == "상지영서대학"
        replace uniname = "서라벌대학교" if uniname == "서라벌대학"
        replace uniname = "서울과학기술대학교" if uniname == "서울과학기술대"
        replace uniname = "서울보건대학교" if uniname == "서울보건대학"
        replace uniname = "서울여자간호대학교" if uniname == "서울여자간호대"
        replace uniname = "서울여자간호대학교" if uniname == "서울여자간호대학"
        replace uniname = "서울예술대학교" if uniname == "서울예술대학"
        replace uniname = "서일대학교" if uniname == "서일대학"
        replace uniname = "서정대학교" if uniname == "서정대학"
        replace uniname = "서해대학교" if uniname == "서해대학"
        replace uniname = "선린대학교" if uniname == "선린대학"
        replace uniname = "성덕대학교" if uniname == "성덕대학"
        replace uniname = "성화대학교" if uniname == "성화대학"
        replace uniname = "세경대학교" if uniname == "세경대학"
        replace uniname = "송곡대학교" if uniname == "송곡대학"
        replace uniname = "송원대학교" if uniname == "송원대학"
        replace uniname = "송호대학교" if uniname == "송호대학"
        replace uniname = "수원가톨릭대학교" if uniname == "수원가톨릭대학"
        replace uniname = "수원과학대학교" if uniname == "수원과학대학"
        replace uniname = "수원여자대학교" if uniname == "수원여자대학"
        replace uniname = "수성대학교" if uniname == "대구산업정보대학"
        replace uniname = "순천제일대학교" if uniname == "순천제일대학"
        replace uniname = "순천청암대학교" if uniname == "순천청암대학"
        replace uniname = "숭의여자대학교" if uniname == "숭의여자대학"
        replace uniname = "신구대학교" if uniname == "신구대학"
        replace uniname = "신성대학교" if uniname == "신성대학"
        replace uniname = "신흥대학교" if uniname == "신흥대학"
        replace uniname = "아세아연합신학대학교" if uniname == "아세아연합신학"
        replace uniname = "아주자동차대학교" if uniname == "아주자동차대학"
        replace uniname = "안동과학대학교" if uniname == "안동과학대학"
        replace uniname = "안산대학교" if uniname == "안산1대학"
        replace uniname = "양산대학교" if uniname == "양산대학"
        replace uniname = "여주대학교" if uniname == "여주대학"
        replace uniname = "연세대학교" if uniname == "연세대학교원"
        replace uniname = "연세대학교" if uniname == "연세대학교 원"
        replace uniname = "연세대학교" if uniname == "연세대학교 원주캠퍼스"
        replace uniname = "영남이공대학교" if uniname == "영남이공대학"
        replace uniname = "영산대학교" if uniname == "영산대학교(산"
        replace uniname = "영산대학교" if uniname == "영산대학교(산업대)"
        replace uniname = "영진전문대학교" if uniname == "영진전문대학"
        replace uniname = "예원예술대학교" if uniname == "예원예술대학교양주캠퍼스"
        replace uniname = "예원예술대학교" if uniname == "예원예술대학교 양주캠퍼스"
        replace uniname = "오산대학교" if uniname == "오산대학"
        replace uniname = "용인송담대학교" if uniname == "용인송담대학"
        replace uniname = "우송대학교" if uniname == "우송대학교(본교)"
        replace uniname = "우송대학교" if uniname == "우송대학교(산업대)"
        replace uniname = "울산과학기술원" if uniname == "울산과학기술대"
        replace uniname = "울산과학기술원" if uniname == "울산과학기술대학교"
        replace uniname = "울산과학대학교" if uniname == "울산과학대학"
        replace uniname = "웅지세무대학교" if uniname == "웅지세무대학"
        replace uniname = "원광보건대학교" if uniname == "원광보건대학"
        replace uniname = "유한대학교" if uniname == "유한대학"
        replace uniname = "을지대학교" if uniname == "을지대학교대"
        replace uniname = "을지대학교" if uniname == "을지대학교 대"
        replace uniname = "을지대학교" if uniname == "을지대학교대전캠퍼스"
        replace uniname = "을지대학교" if uniname == "을지대학교 대전캠퍼스"
        replace uniname = "을지대학교" if uniname == "을지대학교성"
        replace uniname = "을지대학교" if uniname == "을지대학교 성"
        replace uniname = "을지대학교" if uniname == "을지대학교성남캠퍼스"
        replace uniname = "을지대학교" if uniname == "을지대학교 성남캠퍼스"
        replace uniname = "익산대학교" if uniname == "익산대학"
        replace uniname = "인덕대학교" if uniname == "인덕대학"
        replace uniname = "인천가톨릭대학교" if uniname == "인천가톨릭대학"
        replace uniname = "인하공업전문대학" if uniname == "인하공업전문대"
        replace uniname = "장로회신학대학교" if uniname == "장로회신학대학"
        replace uniname = "장안대학교" if uniname == "장안대학"
        replace uniname = "인천재능대학교" if uniname == "재능대학"
        replace uniname = "전남과학대학교" if uniname == "전남과학대학"
        replace uniname = "전남도립대학교" if uniname == "전남도립대학"
        replace uniname = "전북과학대학교" if uniname == "전북과학대학"
        replace uniname = "전주비전대학교" if uniname == "전주비전대학"
        replace uniname = "제주관광대학교" if uniname == "제주관광대학"
        replace uniname = "제주산업정보대학" if uniname == "제주산업정보대"
        replace uniname = "제주한라대학교" if uniname == "제주한라대학"
        replace uniname = "조선간호대학교" if uniname == "조선간호대학"
        replace uniname = "조선이공대학교" if uniname == "조선이공대학"
        replace uniname = "주성대학교" if uniname == "주성대학"
        replace uniname = "중앙대학교" if uniname == "중앙대학교서울캠퍼스"
        replace uniname = "중앙대학교" if uniname == "중앙대학교 서울캠퍼스"
        replace uniname = "중앙대학교" if uniname == "중앙대학교안성캠퍼스"
        replace uniname = "중앙대학교" if uniname == "중앙대학교 안성캠퍼스"
        replace uniname = "중앙대학교" if uniname == "중앙대학교제1캠퍼스(서울)"
        replace uniname = "중앙대학교" if uniname == "중앙대학교 제1캠퍼스(서울)"
        replace uniname = "중앙대학교" if uniname == "중앙대학교제1캠퍼스"
        replace uniname = "중앙대학교" if uniname == "중앙대학교 제1캠퍼스"
        replace uniname = "중앙대학교" if uniname == "중앙대학교제2캠퍼스(안성)"
        replace uniname = "중앙대학교" if uniname == "중앙대학교 제2캠퍼스(안성)"
        replace uniname = "중앙대학교" if uniname == "중앙대학교제2캠퍼스"
        replace uniname = "중앙대학교" if uniname == "중앙대학교 제2캠퍼스"
        replace uniname = "중앙대학교" if uniname == "중앙대학교서"
        replace uniname = "중앙대학교" if uniname == "중앙대학교 서"
        replace uniname = "중앙대학교" if uniname == "중앙대학교안"
        replace uniname = "중앙대학교" if uniname == "중앙대학교 안"
        replace uniname = "진주보건대학교" if uniname == "진주보건대학"
        replace uniname = "차의과학대학교" if uniname == "진주전문대학"
        replace uniname = "창신대학교" if uniname == "창신대학"
        replace uniname = "창원문성대학교" if uniname == "창원문성대학"
        replace uniname = "청강문화산업대학교" if uniname == "청강문화산업대"
        replace uniname = "청강문화산업대학교" if uniname == "청강문화산업대학"
        replace uniname = "청암대학교" if uniname == "청암대학"
        replace uniname = "춘해보건대학교" if uniname == "춘해보건대학"
        replace uniname = "충남도립대학교" if uniname == "충남도립청양대"
        replace uniname = "충남도립대학교" if uniname == "충남도립청양대학"
        replace uniname = "충북도립대학교" if uniname == "충북도립대학"
        replace uniname = "충북보건과학대학교" if uniname == "충북보건과학대"
        replace uniname = "충청대학교" if uniname == "충청대학"
        replace uniname = "포항대학교" if uniname == "포항1대학"
        replace uniname = "포항대학교" if uniname == "포항대학"
        replace uniname = "한경대학교" if uniname == "한경대학교(산업대)"
        replace uniname = "한국골프대학교" if uniname == "한국골프대학"
        replace uniname = "한국관광대학교" if uniname == "한국관광대학"
        replace uniname = "한국기술교육대학교" if uniname == "한국기술교육대"
        replace uniname = "한국산업기술대학교" if uniname == "한국산업기술대"
        replace uniname = "한국승강기대학교" if uniname == "한국승강기대학"
        replace uniname = "한국외국어대학교" if uniname == "한국외국어대학"
        replace uniname = "한국전통문화대학교" if uniname == "한국전통문화대"
        replace uniname = "한국체육대학교" if uniname == "한국철도대학"
        replace uniname = "한림성심대학교" if uniname == "한림성심대학"
        replace uniname = "한양여자대학교" if uniname == "한양여자대학"
        replace uniname = "혜전대학교" if uniname == "혜전대학"
        replace uniname = "혜천대학교" if uniname == "혜천대학"
        replace uniname = "홍익대학교" if uniname == "홍익대학교세"
        replace uniname = "홍익대학교" if uniname == "홍익대학교 세"
        replace uniname = "홍익대학교" if uniname == "홍익대학교세종캠퍼스 "
        replace uniname = "홍익대학교" if uniname == "홍익대학교 세종캠퍼스"
        replace uniname = "홍익대학교" if uniname == "홍익대학교조치원캠퍼스"
        replace uniname = "홍익대학교" if uniname == "홍익대학교 조치원캠퍼스"
    /*}}}*/
    /*gen unimain {{{*/
        recode branch 1=1 2/4=0 , gen(unimain)
        label var unimain "주된캠퍼스"
        label define UNIMAIN 1 "주된캠퍼스" 0 "기타캠퍼스"
        label value unimain UNIMAIN
        replace unimain = 1 if uniname == "가천대학교"
        replace unimain = 1 if uniname == "가톨릭대학교"
        replace unimain = 1 if uniname == "강원대학교"
        replace unimain = 1 if uniname == "건국대학교"      & inlist(branch , 1 )
        replace unimain = 1 if uniname == "경북대학교"
        replace unimain = 1 if uniname == "경상대학교"
        replace unimain = 1 if uniname == "경희대학교"
            /*2011년 이후 국제캠은 본교와 통합*/
        replace unimain = 1 if uniname == "고려대학교"      & inlist(branch , 1 )
        replace unimain = 1 if uniname == "광운대학교"      & inlist(branch , 1 )
        replace unimain = 1 if uniname == "광주과학기술원"  & inlist(branch , 1 )
        replace unimain = 1 if uniname == "국민대학교"      & inlist(branch , 1 )
        replace unimain = 1 if uniname == "단국대학교"      & inlist(branch , 1 , 3 )
            /*2013년 이후 천안캠은 분교에서 이원캠으로 전환*/
        replace unimain = 1 if uniname == "동국대학교"      & inlist(branch , 1 )
        replace unimain = 1 if uniname == "명지대학교"
        replace unimain = 1 if uniname == "부경대학교"
        replace unimain = 1 if uniname == "부산대학교"
        replace unimain = 1 if uniname == "서강대학교"
        replace unimain = 1 if uniname == "서울대학교"
        replace unimain = 1 if uniname == "서울시립대학교"
        replace unimain = 1 if uniname == "성균관대학교"
        replace unimain = 1 if uniname == "세종대학교"
        replace unimain = 1 if uniname == "숙명여자대학교"
        replace unimain = 1 if uniname == "순천향대학교"
        replace unimain = 1 if uniname == "숭실대학교"
        replace unimain = 1 if uniname == "아주대학교"
        replace unimain = 1 if uniname == "연세대학교"      & inlist(branch , 1 )
        replace unimain = 1 if uniname == "영남대학교"
        replace unimain = 1 if uniname == "울산과학기술원"
        replace unimain = 1 if uniname == "울산대학교"
        replace unimain = 1 if uniname == "원광대학교"
        replace unimain = 1 if uniname == "이화여자대학교"
        replace unimain = 1 if uniname == "인제대학교"
        replace unimain = 1 if uniname == "인천대학교"
        replace unimain = 1 if uniname == "인하대학교"
        replace unimain = 1 if uniname == "전남대학교"      & inlist(branch , 1 )
        replace unimain = 1 if uniname == "전북대학교"
        replace unimain = 1 if uniname == "제주대학교"
        replace unimain = 1 if uniname == "조선대학교"
        replace unimain = 1 if uniname == "중앙대학교"
            /*2011년 이후 안성캠은 본교와 통합*/
        replace unimain = 1 if uniname == "충남대학교"
        replace unimain = 1 if uniname == "충북대학교"
        replace unimain = 1 if uniname == "포항공과대학교"
        replace unimain = 1 if uniname == "한국과학기술원"
        replace unimain = 1 if uniname == "한국교원대학교"
        replace unimain = 1 if uniname == "한국외국어대학교" & inlist(branch , 1 )
            /*2013년 이후 글로벌캠은 본교와 통합*/
        replace unimain = 1 if uniname == "한국해양대학교"
        replace unimain = 1 if uniname == "한림대학교"
        replace unimain = 1 if uniname == "한양대학교"
        replace unimain = 1 if uniname == "홍익대학교"      & inlist(branch , 1 )
        replace unimain = 1 if missing(unirank) & branch == 3
    /*}}}*/
    /*gen unifound    : found clean by univ. {{{*/
        gen unifound = .
        label var unifound "설립유형(GOMS cleaned)"
        label value unifound FOUND
        tab found , gen(br_)
        qui levelsof uniname , local(unilist)
        qui levelsof found , local(foundlist)
        local foundn : word count `foundlist'
        foreach i of local unilist {
        forvalue j = 1/`foundn' {
            sum br_`j' if uniname == "`i'" , meanonly
            if inrange(r(mean) , 0.9 ,1) {
            replace unifound = `j' if uniname == "`i'"
            }
        }
        }
        drop br_?
        /*exception*/
            replace unifound = 6 if uniname == "광주과학기술원"
            replace unifound = 4 if uniname == "서울대학교"
            replace unifound = 6 if uniname == "울산과학기술원"
            replace unifound = 4 if uniname == "인천대학교"
            replace unifound = 6 if uniname == "한국과학기술원"
            replace unifound = 1 if uniname == "한국농수산대학"
            replace unifound = 6 if uniname == "한국전통문화대학교"
    /*}}}*/
    /*gen unibranch   : branch clean by univ. {{{*/
        capture drop unibranch
        capture drop br_*
        gen unibranch = .
        label var unibranch "본분교(GOMS cleaned)"
        label value unibranch BRANCH
        tab branch , gen(br_)
        qui levelsof uniname , local(unilist)
        foreach i of local unilist {
        forvalue j = 1/3 {
            sum br_`j' if uniname == "`i'" , meanonly
            if inrange(r(mean) , 0.9 ,1) {
            replace unibranch = `j' if uniname == "`i'"
            }
        }
        }
        label copy G191BRAN BRANCH
        label value unibranch BRANCH
        drop br_?
        /*exception*/
            replace unibranch = branch if uniname == "가야대학교"
            replace unibranch = 3      if uniname == "가야대학교"       & inlist(unibranch , 2)
            replace unibranch = branch if uniname == "가톨릭대학교"
            replace unibranch = 3      if uniname == "가톨릭대학교"     & inlist(unibranch , 2)
            replace unibranch = branch if uniname == "강릉원주대학교"
            replace unibranch = 3      if uniname == "강릉원주대학교"   & inlist(unibranch , 2)
            replace unibranch = branch if uniname == "강원대학교"
            replace unibranch = 3      if uniname == "강원대학교"       & inlist(unibranch , 2)
            replace unibranch = branch if uniname == "강원대학교"
            replace unibranch = 3      if uniname == "강원대학교"       & inlist(unibranch , 2)
            replace unibranch = branch if uniname == "건국대학교"
            replace unibranch = 2      if uniname == "건국대학교"       & inlist(unibranch , 3)
            replace unibranch = branch if uniname == "건양대학교"
            replace unibranch = 3      if uniname == "건양대학교"       & inlist(unibranch , 2)
            replace unibranch = branch if uniname == "경기대학교"
            replace unibranch = 3      if uniname == "경기대학교"       & inlist(unibranch , 2)
            replace unibranch = branch if uniname == "경동대학교"
            replace unibranch = branch if uniname == "경북대학교"
            replace unibranch = 3      if uniname == "경북대학교"       & inlist(unibranch , 2)
            replace unibranch = branch if uniname == "경인교육대학교"
            replace unibranch = 3      if uniname == "경인교육대학교"   & inlist(unibranch , 2)
            replace unibranch = branch if uniname == "경희대학교"
            replace unibranch = 2      if uniname == "경희대학교"       & inlist(unibranch , 3)
            replace unibranch = branch if uniname == "고려대학교"
            replace unibranch = 2      if uniname == "고려대학교"       & inlist(unibranch , 3)
            replace unibranch = branch if uniname == "단국대학교"
            replace unibranch = branch if uniname == "대구대학교"
            replace unibranch = 3      if uniname == "대구대학교"       & inlist(unibranch , 2)
            replace unibranch = branch if uniname == "동국대학교"
            replace unibranch = 2      if uniname == "동국대학교"       & inlist(unibranch , 3)
            replace unibranch = branch if uniname == "명지대학교"
            replace unibranch = 3      if uniname == "명지대학교"       & inlist(unibranch , 2)
            replace unibranch = branch if uniname == "부산대학교"
            replace unibranch = 3      if uniname == "부산대학교"       & inlist(unibranch , 2)
            replace unibranch = branch if uniname == "상명대학교"
            replace unibranch = branch if uniname == "서남대학교"
            replace unibranch = 3      if uniname == "서남대학교"       & inlist(unibranch , 2)
            replace unibranch = branch if uniname == "성균관대학교"
            replace unibranch = 3      if uniname == "성균관대학교"     & inlist(unibranch , 2)
            replace unibranch = branch if uniname == "신한대학교"
            replace unibranch = 3      if uniname == "신한대학교"       & inlist(unibranch , 2)
            replace unibranch = branch if uniname == "안양대학교"
            replace unibranch = 3      if uniname == "안양대학교"       & inlist(unibranch , 2)
            replace unibranch = branch if uniname == "연세대학교"
            replace unibranch = 2      if uniname == "연세대학교"       & inlist(unibranch , 3)
            replace unibranch = branch if uniname == "영남대학교"
            replace unibranch = 3      if uniname == "영남대학교"       & inlist(unibranch , 2)
            replace unibranch = branch if uniname == "영산대학교"
            replace unibranch = 3      if uniname == "영산대학교"       & inlist(unibranch , 2)
            replace unibranch = branch if uniname == "예원예술대학교"
            replace unibranch = 3      if uniname == "예원예술대학교"   & inlist(unibranch , 2)
            replace unibranch = branch if uniname == "을지대학교"
            replace unibranch = 3      if uniname == "을지대학교"       & inlist(unibranch , 2)
            replace unibranch = branch if uniname == "인제대학교"
            replace unibranch = 3      if uniname == "인제대학교"       & inlist(unibranch , 2)
            replace unibranch = branch if uniname == "인천가톨릭대학교"
            replace unibranch = 3      if uniname == "인천가톨릭대학교" & inlist(unibranch , 2)
            replace unibranch = branch if uniname == "전남대학교"
            replace unibranch = 3      if uniname == "전남대학교"       & inlist(unibranch , 2)
            replace unibranch = branch if uniname == "중앙대학교"
            replace unibranch = 3      if uniname == "중앙대학교"       & inlist(unibranch , 2)
            replace unibranch = branch if uniname == "한국외국어대학교"
            replace unibranch = 2      if uniname == "한국외국어대학교" & inlist(unibranch , 3)
            replace unibranch = branch if uniname == "한양대학교"
            replace unibranch = 2      if uniname == "한양대학교"       & inlist(unibranch , 3)
            replace unibranch = branch if uniname == "홍익대학교"
            replace unibranch = 2      if uniname == "홍익대학교"       & inlist(unibranch , 3)
    /*}}}*/
    /* gen uniprovince : province clean by univ. {{{*/
        capture drop uniprovince
        capture drop pr_*
        gen uniprovince = .
        label var uniprovince "대학소재권역(GOMS cleaned)"
        label value uniprovince PROVINCE
        tab province , gen(pr_)
        qui levelsof uniname , local(unilist)
        foreach i of local unilist {
        forvalue j = 1/5 {
            sum pr_`j' if uniname == "`i'" , meanonly
            if inrange(r(mean) , 0.8 ,1) {
            replace uniprovince = `j' if uniname == "`i'"
            }
        }
        }
        drop pr_?
        /*exception*/
            replace uniprovince = province if uniname == "건국대학교"
            replace unibranch   = 2        if uniname == "건국대학교"       & inlist(uniprovince,3)
            replace uniprovince = .        if uniname == "건국대학교"       & inlist(uniprovince,2,4,5)
            replace unibranch   = .        if uniname == "건국대학교"       & inlist(uniprovince,2,4,5)
            replace uniprovince = province if uniname == "경희대학교"
            replace unibranch   = 2        if uniname == "경희대학교"       & inlist(uniprovince,2)
            replace uniprovince = .        if uniname == "경희대학교"       & inlist(uniprovince,3,4,5)
            replace unibranch   = .        if uniname == "경희대학교"       & inlist(uniprovince,3,4,5)
            replace uniprovince = province if uniname == "고려대학교"
            replace unibranch   = 1        if uniname == "고려대학교"       & inlist(uniprovince,1)
            replace unibranch   = 2        if uniname == "고려대학교"       & inlist(uniprovince,3)
            replace uniprovince = .        if uniname == "고려대학교"       & inlist(uniprovince,2,4,5)
            replace unibranch   = .        if uniname == "고려대학교"       & inlist(uniprovince,2,4,5)
            replace uniprovince = province if uniname == "단국대학교"
            replace uniprovince = .        if uniname == "단국대학교"       & inlist(uniprovince,4,5)
            replace unibranch   = .        if uniname == "단국대학교"       & inlist(uniprovince,4,5)
            replace uniprovince = province if uniname == "동국대학교"
            replace unibranch   = 2        if uniname == "동국대학교"       & inlist(uniprovince,4)
            replace uniprovince = .        if uniname == "동국대학교"       & inlist(uniprovince,2,3,5)
            replace unibranch   = .        if uniname == "동국대학교"       & inlist(uniprovince,2,3,5)
            replace uniprovince = province if uniname == "명지대학교"
            replace unibranch   = 1        if uniname == "명지대학교"       & inlist(uniprovince,2)
            replace uniprovince = .        if uniname == "명지대학교"       & inlist(uniprovince,3,4,5)
            replace unibranch   = .        if uniname == "명지대학교"       & inlist(uniprovince,3,4,5)
            replace uniprovince = province if uniname == "상명대학교"
            replace uniprovince = .        if uniname == "상명대학교"       & inlist(uniprovince,2,4,5)
            replace unibranch   = .        if uniname == "상명대학교"       & inlist(uniprovince,2,4,5)
            replace uniprovince = province if uniname == "연세대학교"
            replace unibranch   = 2        if uniname == "연세대학교"       & inlist(uniprovince,2)
            replace uniprovince = .        if uniname == "연세대학교"       & inlist(uniprovince,3,4,5)
            replace unibranch   = .        if uniname == "연세대학교"       & inlist(uniprovince,3,4,5)
            replace uniprovince = province if uniname == "중앙대학교"
            replace uniprovince = .        if uniname == "중앙대학교"       & inlist(uniprovince,3,4,5)
            replace unibranch   = .        if uniname == "중앙대학교"       & inlist(uniprovince,3,4,5)
            replace uniprovince = province if uniname == "한국농수산대학교"
            replace uniprovince = .        if uniname == "한국농수산대학교" & inlist(uniprovince,3,4)
            replace unibranch   = .        if uniname == "한국농수산대학교" & inlist(uniprovince,3,4)
            replace uniprovince = province if uniname == "한국외국어대학교"
            replace unibranch   = 2        if uniname == "한국외국어대학교" & inlist(uniprovince,2)
            replace uniprovince = .        if uniname == "한국외국어대학교" & inlist(uniprovince,3,4,5)
            replace unibranch   = .        if uniname == "한국외국어대학교" & inlist(uniprovince,3,4,5)
            replace uniprovince = province if uniname == "한국체육대학교"
            replace uniprovince = .        if uniname == "한국체육대학교"   & inlist(uniprovince,3,4,5)
            replace unibranch   = .        if uniname == "한국체육대학교"   & inlist(uniprovince,3,4,5)
            replace uniprovince = province if uniname == "한양대학교"
            replace unibranch   = 1        if uniname == "한양대학교"       & inlist(uniprovince,1)
            replace unibranch   = 2        if uniname == "한양대학교"       & inlist(uniprovince,2)
            replace uniprovince = .        if uniname == "한양대학교"       & inlist(uniprovince,3,4,5)
            replace unibranch   = .        if uniname == "한양대학교"       & inlist(uniprovince,3,4,5)
            replace uniprovince = province if uniname == "홍익대학교"
            replace unibranch   = 1        if uniname == "홍익대학교"       & inlist(uniprovince,1)
            replace unibranch   = 2        if uniname == "홍익대학교"       & inlist(uniprovince,3)
            replace uniprovince = .        if uniname == "홍익대학교"       & inlist(uniprovince,2,4,5)
            replace unibranch   = .        if uniname == "홍익대학교"       & inlist(uniprovince,2,4,5)
            replace uniprovince = province if uniname == "한국농수산대학"
            replace uniprovince = .        if uniname == "한국농수산대학"   & inlist(uniprovince,1,3,4)
            replace unibranch   = .        if uniname == "한국농수산대학"   & inlist(uniprovince,1,3,4)
    /*}}}*/
    /* gen uniarea     : area clean by univ. {{{*/
        capture drop uniarea
        capture drop ar_*
        gen uniarea = .
        label var uniarea "대학소재시도(GOMS cleaed)"
        label value uniarea AREA
        tab area , gen(ar_)
        qui levelsof uniname , local(unilist)
        foreach i of local unilist {
        forvalue j = 1/17 {
            sum ar_`j' if uniname == "`i'" , meanonly
            if inrange(r(mean) , 0.8 ,1) {
            replace uniarea = `j' if uniname == "`i'"
            }
        }
        }
        levelsof uniname if missing(uniarea), local(unilist)
        foreach i of local unilist {
        replace uniarea = area if uniname == "`i'"
        forvalue j = 1/17 {
            sum ar_`j' if uniname == "`i'" ,
            if r(mean) <= 0.01  {
            replace uniarea = . if uniname == "`i'" & area == `j'
            }
        }
        }
        drop ar_*
    /*}}}*/
    /* gen uniscr50(QS50) uniscr20(QS20) {{{*/
        gen uniscr50 = .
        label var uniscr50 "QSranking 50 in 2018"
        label define uniscr50 1 "2-3년제" 2 "4년제" 3 "4년제(QS50)" 4 "4년제(QS10)" 5 "4년제(QS05)"
        label value uniscr50 uniscr50
        replace uniscr50 = 1 if school == 1
        replace uniscr50 = 2 if school == 2
        replace uniscr50 = 3 if (!missing(unirank) & unimain ) | school == 3
        replace uniscr50 = 4 if (inrange(unirank , 1 , 10) & unimain) | uniname == "서울교육대학교"
        replace uniscr50 = 5 if (inlist(unirank , 1, 2, 3, 5, 6) & unimain)
        gen uniscr20 = .
        label var uniscr20 "QSranking 20 in 2018"
        label define uniscr20 1 "QS 16-20" 2 "QS 11-15" 3 "QS 6-10" 4 "QS 1-5"
        label value uniscr20 uniscr20
        replace uniscr20 = 1 if inrange(unirank , 16, 20) & unimain
        replace uniscr20 = 2 if inrange(unirank , 11, 15) & unimain
        replace uniscr20 = 3 if inlist(unirank , 4, 7, 8, 9, 10) & unimain
        replace uniscr20 = 4 if (inlist(unirank , 1, 2, 3, 5, 6) & unimain)
    /*}}}*/
    /*misc*/
        label var uniname "출신대학명"
        label var unicode "출신대학코드"
        replace uniprovince = . if missing(uniarea) /*must be here*/
        replace unibranch   = . if missing(uniarea) /*must be here*/
        drop found branch area province school
        order _all , alpha
        order pid year uniname uniarea unibranch , first
    save `path'rawdata/gomslist.dta , replace
    save ~/dropbox/data/dta/gomslist.dta , replace
