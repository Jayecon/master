set more off
set maxvar 30000
cd ~/dropbox/goms/
use goms_eq_master , clear
  /*자료 변환 : 숫자형 변수를 long type으로 {{{*/
    local numvarlist ///
      pid        /// /*본분교*/
      branch     /// /*본분교*/
      birthy     /// /*출생년*/
      majorcat   /// /*전공계열*/
      school     /// /*학교유형*/
      province   /// /*학교소재권역*/
      area       /// /*학교소재지역*/
      sex        /// /*성별*/
      age        /// /*연령(조사기준일 당시)*/
      graduy     /// /*졸업년*/
      gradum     /// /*졸업월*/
      a001 a002 a003 ///
      a021 a022 ///
      a120 a121 a122 ///
      d001 d002 d003 d004 d005 d006 ///
      e001 e002 ///
      e003 e004 e005 e006 ///
      e078 e079 e080 e081 ///
      e153 e154 e155 e156 ///
      h001 h002 ///
      h006 h007 h008 h009 h010z ///
      h026 h027 h028 h029 h030z ///
      h046 h047 h048 h049 h050z ///
      wt             /*가중치*/
    foreach i of local numvarlist {
      di "VAR : `i'"
      egen `i' = rowlast(`i'??)
    }
  /*}}}*/
  /*자료 변환 : 문자형 변수를 long type으로 {{{*/
    local charvarlist ///
      uniname     /// /*출신대학명*/
      unicode         /*출신대학CODE*/
    foreach i of local charvarlist {
      tostring `i'?? , replace
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
  /*자료 변환 : 모든 변수 labeling {{{*/
    label var pid "개인ID"
    label var branch     "본분교"
      label copy G191BRAN BRANCH
      recode branch (4=3) 
      label value branch BRANCH
    label var majorcat   "전공 대분류"
      label copy G191MAJO MAJORCAT
      label value majorcat MAJORCAT
    label var school     "학교유형"
        label copy G191SCHO SCHOOL
        label value school SCHOOL
    label var province   "졸업대학교 소재권역"
      label copy G191PROV PROVINCE
      label value province PROVINCE
    label var area       "졸업대학교 소재지역"
      label copy G191AREA AREA
      label value area AREA
    label var sex        "성별"
      label copy G191SEX SEX
      label value sex SEX
    label var birthy     "출생년"
    label var age        "연령(조사기준일)"
    label var graduy     "졸업년"
    label var unicode    "졸업대학교 CODE"
    label var uniname    "졸업대학교 이름"
    label var gradum     "졸업월"
    label var wt         "가중치"
    local temp : var label a00119
      label var a001  "`temp'"
      label copy G191A001 A001
      label value a001 A001
    local temp : var label a00219
      label var a002  "`temp'"
      label copy G191A002 A002
      label value a002 A002  
    local temp : var label a00319
      label var a003  "`temp'"
      label copy G191A003 A003
      label value a003 A003  
    local temp : var label a02119
      label var a021  "`temp'"
      label copy G191A021 A021
      label value a021 A021  
    local temp : var label a02219
      label var a022  "`temp'"
      label copy G191A022 A022
      label value a022 A022  
    local temp : var label a12019
      label var a120  "`temp'"
      label copy G191A120 A120
      label value a120 A120  
    local temp : var label a12119
      label var a121  "`temp'"
      label copy G191A121 A121
      label value a121 A121  
    local temp : var label a12219
      label var a122  "`temp'"
      label copy G191A122 A122
      label value a122 A122  
    local temp : var label d00119
      label var d001  "`temp'"
      label copy G191D001 D001
      label value d001 D001  
    local temp : var label d00219
      label var d002  "`temp'"
    local temp : var label d00319
      label var d003  "`temp'"
    local temp : var label d00419
      label var d004  "`temp'"
    local temp : var label d00519
      label var d005  "`temp'"
    local temp : var label d00619
      label var d006  "`temp'"
      label copy G191D006 D006
      label value d006 D006  
    local temp : var label e00119
      label var e001  "`temp'"
      label copy G191E001 E001
      label value e001 E001  
    local temp : var label e00219
      label var e002  "`temp'"
    local temp : var label e00319
      label var e003  "`temp'"
    local temp : var label e00419
      label var e004  "`temp'"
    local temp : var label e00519
      label var e005  "`temp'"
    local temp : var label e00619
      label var e006  "`temp'"
    local temp : var label e07819
      label var e078  "`temp'"
    local temp : var label e07919
      label var e079  "`temp'"
    local temp : var label e08019
      label var e080  "`temp'"
    local temp : var label e08119
      label var e081  "`temp'"
    local temp : var label e15319
      label var e153  "`temp'"
    local temp : var label e15419
      label var e154  "`temp'"
    local temp : var label e15519
      label var e155  "`temp'"
    local temp : var label e15619
      label var e156  "`temp'"
    local temp : var label h00119
      label var h001  "`temp'"
      label copy G191H001 H001
      label value h001 H001  
    local temp : var label h00219
      label var h002  "`temp'"
    local temp : var label h00619
      label var h006  "`temp'"
      label copy G191H006 H006
      label value h006 H006  
    local temp : var label h00719
      label var h007  "`temp'"
      label copy G191H007 H007
      label value h007 H007  
    local temp : var label h00819
      label var h008  "`temp'"
      label copy G191H008 H008
      label value h008 H008  
    local temp : var label h00919
      label var h009  "`temp'"
      label copy G191H009 H009
      label value h009 H009  
    local temp : var label h010z19
      label var h010z "`temp'"
    local temp : var label h02619
      label var h026  "`temp'"
      label copy G191H026 H026
      label value h026 H026  
    local temp : var label h02719
      label var h027  "`temp'"
      label copy G191H027 H027
      label value h027 H027  
    local temp : var label h02819
      label var h028  "`temp'"
      label copy G191H028 H028
      label value h028 H028  
    local temp : var label h02919
      label var h029  "`temp'"
      label copy G191H029 H029
      label value h029 H029  
    local temp : var label h030z19
      label var h030z "`temp'"
    local temp : var label h04619
      label var h046  "`temp'"
      label copy G191H046 H046
      label value h046 H046  
    local temp : var label h04719
      label var h047  "`temp'"
      label copy G191H047 H047
      label value h047 H047  
    local temp : var label h04819
      label var h048  "`temp'"
      label copy G191H048 H048
      label value h048 H048  
    local temp : var label h04919
      label var h049  "`temp'"
      label copy G191H049 H049
      label value h049 H049  
    local temp : var label h050z19 
      label var h050z " `temp'"
  /*}}}*/
  /*변수 교정 : 년도별 응답 불일치 {{{*/
    recode a003 (2=1) (1=2) if year == 2007 
    recode d006 (2=1) (1=2) if inlist(year, 2007, 2008) 
  /*}}}*/
  /*변수 교정 : branch {{{*/
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
  /*}}}*/
  /*변수 교정 : uniname {{{*/
    replace uniname = "가천대학교" if uniname == "가천길대학"
    replace uniname = "가천대학교" if uniname == "가천의과학대학교"
    replace uniname = "가톨릭상지대학교" if uniname == "가톨릭상지대학"
    replace uniname = "감리교신학대학교" if uniname == "감리교신학대학"
    replace uniname = "강릉영동대학교" if uniname == "강릉영동대학"
    replace uniname = "강원관광대학교" if uniname == "강원관광대학"
    replace uniname = "강원도립대학교" if uniname == "강원도립대학"
    replace uniname = "강원전문대학교" if uniname == "강원전문대학"
    replace uniname = "거제대학교" if uniname == "거제대학"
    replace uniname = "거창전문대학교" if uniname == "거창전문대학"
    replace uniname = "경기공업대학교" if uniname == "경기공업대학"
    replace uniname = "경기과학기술대학교" if uniname == "경기과학기술대"
    replace uniname = "경남과학기술대학교" if uniname == "경남과학기술대"
    replace uniname = "경남도립거창대학" if uniname == "경남도립거창대교"
    replace uniname = "경남도립남해대학" if uniname == "경남도립남해대교"
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
    replace uniname = "울산과학기술대학교" if uniname == "울산과학기술대"
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
  /* 자료 결합 : 2019 QS 대학순위 {{{*/
    merge m:1 uniname using rawdata/uniranking.dta , nogen
    label var unirank "QS2018순위"
  /*}}}*/
  /*변수 생성 : main(주된캠퍼스) {{{*/
    gen main =.
    label var main "주된캠퍼스"
    label define MAIN 1 "네" 0 "아니오"
    label value main MAIN
    replace main = 0 if unirank
    replace main = 1 if  uniname == "가천대학교"    
    replace main = 1 if  uniname == "가톨릭대학교" 
    replace main = 1 if  uniname == "강원대학교"  
    replace main = 1 if  uniname == "건국대학교"      & inlist(branch , 1 )
    replace main = 1 if  uniname == "경북대학교" 
    replace main = 1 if  uniname == "경상대학교"
    replace main = 1 if  uniname == "경희대학교" /*2011년 이후 국제캠은 본교와 통합*/
    replace main = 1 if  uniname == "고려대학교"      & inlist(branch , 1 )
    replace main = 1 if  uniname == "광운대학교"      & inlist(branch , 1 )
    replace main = 1 if  uniname == "광주과학기술원"  & inlist(branch , 1 )
    replace main = 1 if  uniname == "국민대학교"      & inlist(branch , 1 )
    replace main = 1 if  uniname == "단국대학교"      & inlist(branch , 1 , 3 ) /*2013년 이후 천안캠은 분교에서 이원캠으로 전환*/
    replace main = 1 if  uniname == "동국대학교"      & inlist(branch , 1 )
    replace main = 1 if  uniname == "명지대학교"     
    replace main = 1 if  uniname == "부경대학교"      
    replace main = 1 if  uniname == "부산대학교"      
    replace main = 1 if  uniname == "서강대학교"      
    replace main = 1 if  uniname == "서울대학교"      
    replace main = 1 if  uniname == "서울시립대학교"  
    replace main = 1 if  uniname == "성균관대학교"   
    replace main = 1 if  uniname == "세종대학교"     
    replace main = 1 if  uniname == "숙명여자대학교"
    replace main = 1 if  uniname == "순천향대학교" 
    replace main = 1 if  uniname == "숭실대학교"  
    replace main = 1 if  uniname == "아주대학교" 
    replace main = 1 if  uniname == "연세대학교"      & inlist(branch , 1 )
    replace main = 1 if  uniname == "영남대학교"
    replace main = 1 if  uniname == "울산과학기술원"  
    replace main = 1 if  uniname == "울산대학교"      
    replace main = 1 if  uniname == "원광대학교"      
    replace main = 1 if  uniname == "이화여자대학교"  
    replace main = 1 if  uniname == "인제대학교"      
    replace main = 1 if  uniname == "인천대학교"      
    replace main = 1 if  uniname == "인하대학교"     
    replace main = 1 if  uniname == "전남대학교"      & inlist(branch , 1 )
    replace main = 1 if  uniname == "전북대학교"      
    replace main = 1 if  uniname == "제주대학교"      
    replace main = 1 if  uniname == "조선대학교"      
    replace main = 1 if  uniname == "중앙대학교"      /*2011년 이후 안성캠은 본교와 통합*/
    replace main = 1 if  uniname == "충남대학교"      
    replace main = 1 if  uniname == "충북대학교"      
    replace main = 1 if  uniname == "포항공과대학교"  
    replace main = 1 if  uniname == "한국과학기술원"  
    replace main = 1 if  uniname == "한국교원대학교"  
    replace main = 1 if  uniname == "한국외국어대학교" & inlist(branch , 1 ) /*2013년 이후 글로벌캠은 본교와 통합*/
    replace main = 1 if  uniname == "한국해양대학교"  
    replace main = 1 if  uniname == "한림대학교"      
    replace main = 1 if  uniname == "한양대학교"      
    replace main = 1 if  uniname == "홍익대학교"      & inlist(branch , 1 )
  /*}}}*/
  /*변수 생성 : uniscr50(QS50) uniscr20(QS20) {{{*/
    gen uniscr50 = .
      label var uniscr50 "대학등급"
      label define uniscr50 1 "2-3년제" 2 "4년제" 3 "4년제(QS50)" 4 "4년제(QS10)" 5 "4년제(QS05)"
      label value uniscr50 uniscr50
      replace uniscr50 = 1 if school == 1
      replace uniscr50 = 2 if school == 2
      replace uniscr50 = 3 if (!missing(unirank) & main ) | school == 3
      replace uniscr50 = 4 if (inrange(unirank , 1 , 10) & main) | uniname == "서울교육대학교"
      replace uniscr50 = 5 if (inlist(unirank , 1, 2, 3, 5, 6) & main)
    gen uniscr20 = .
      label var uniscr20 "대학등급(QS20)"
      label define uniscr20 1 "QS 16-20" 2 "QS 11-15" 3 "QS 6-10" 4 "QS 1-5"
      label value uniscr20 uniscr20
      replace uniscr20 = 1 if inrange(unirank , 16, 20) & main
      replace uniscr20 = 2 if inrange(unirank , 11, 15) & main
      replace uniscr20 = 3 if inlist(unirank , 4, 7, 8, 9, 10) & main
      replace uniscr20 = 4 if (inlist(unirank , 1, 2, 3, 5, 6) & main)
  /*}}}*/
  /*변수 생성 : medtyp {{{*/
  egen medtyp = rowlast(medtyp??)
    label var medtyp "의예계열전공"
    label value medtyp medtyp
    drop medtyp??
    replace unirank = 1 if !missing(medtyp)
    /*}}}*/
  /*자료 정리 : 잔여변수 drop {{{*/
    foreach i of local numvarlist {
      drop `i'??
    }
    foreach i of local charvarlist {
      drop `i'??
    }
    drop major??
  /*}}}*/
  /*자료 정리 : 불성실 응답 drop {{{*/
    /*현재나이 답변이상 사례 제거*/
    gen temp1 = age + birthy
    gen temp2 = year - temp1
    drop if !inrange(temp2 , -2 , 0 )
    drop temp?
  /*}}}*/
save goms_eq.dta , replace
save ~/dropbox/sjho/goms_eq.dta , replace
