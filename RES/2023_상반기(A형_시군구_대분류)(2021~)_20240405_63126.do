//**********************************************************************  
//*	*주의 사항
//*		현재 스크립트 파일은 파일명만 출력되어 있습니다.
//*		따라서, 저장된 추출 결과 파일의 경로를 'delimited' 또는 'using'에 추가하여야 합니다.
//*	예) 다운로드 받은 폴더명 : C:\Download
//*	  ※ 파일 경로 추가 : "[다운로드 받은 폴더명]\기업활동조사_기업활동조사(제공)_2019_20191201_92007.txt"
//* 		delimited "C:\Download\기업활동조사_기업활동조사(제공)_2019_20191201_92007.txt"
//* 		또는
//* 		using "C:\Download\기업활동조사_기업활동조사(제공)_2019_20191201_92007.txt"
//*
//*		STATA 스크립트는 STATA 에서 파일 경로만 수정하시면 바로 실행가능하며,
//*		데이터셋 생성 후에 STATA 의 여러 가지 분석 기능을 사용할 수 있습니다.
//*
//***********************************************************************/

clear
local path ~/dropbox/data/res/rawdata/
import delimited "`path'2023_상반기(A형_시군구_대분류)(2021~)_20240405_63126.csv", delimiter(",") numericcols(5, 18, 19, 20, 30, 46) stringcols(1, 27, 37, 44) varnames(nonames) rowrange(2)

        label variable v1 "조사연월"
        label variable v2 "가구주관계코드"
        label variable v3 "4자리_행정구역분류코드"
        label variable v4 "성별코드"
        label variable v5 "만연령"
        label variable v6 "교육정도코드"
        label variable v7 "만연령변환코드"
        label variable v8 "교육정도_고등학교계열코드"
        label variable v9 "교육정도_전문대이상계열코드"
        label variable v10 "교육정도_수학구분코드"
        label variable v11 "혼인상태코드"
        label variable v12 "조사대상주간수입목적종사여부"
        label variable v13 "교육정도변환코드"
        label variable v14 "조사대상주간_무급종사여부"
        label variable v15 "조사대상주간일시휴직여부"
        label variable v16 "조사대상주간일시휴직_사유코드"
        label variable v17 "조사대상주간부업여부"
        label variable v18 "조사대상주간주업근무시간수"
        label variable v19 "조사대상주간부업근무시간수"
        label variable v20 "조사대상주간근무총계시간수"
        label variable v21 "주업부업총계시간구분코드"
        label variable v22 "근무사업체소재지코드"
        label variable v23 "직장종사자규모코드"
        label variable v24 "10차산업_대분류코드"
        label variable v25 "7차_1자리직업대분류코드"
        label variable v26 "종사상지위코드"
        label variable v27 "조사대상주간직장시작연월"
        label variable v28 "고용계약기간정함여부"
        label variable v29 "고용계약기간코드"
        label variable v30 "최근3개월간평균급여"
        label variable v31 "4주간구직활동여부"
        label variable v32 "조사대상주간취업가능여부"
        label variable v33 "1순위구직방법코드"
        label variable v34 "2순위구직방법코드"
        label variable v35 "1순위구직경로코드"
        label variable v36 "2순위구직경로코드"
        label variable v37 "구직활동기간월수"
        label variable v38 "조사대상주간취업희망여부"
        label variable v39 "지난4주간비구직사유코드"
        label variable v40 "지난1년간구직경험여부"
        label variable v41 "주활동상태_조사대상주간주활동상태코드"
        label variable v42 "수입목적직업경험여부"
        label variable v43 "수입목적직업_퇴직시기구분코드"
        label variable v44 "1년미만전직장퇴직연월"
        label variable v45 "퇴직사유코드"
        label variable v46 "시군구가중값"
        label variable v47 "경제활동구분코드"

        label define v2CD 1"가구주" 2"배우자" 3"미혼자녀" 4"기혼자녀(배우자)" 5"손자녀(배우자)" 6"부모(장인,장모)" 7"조부모" 8"미혼형제자매" 9"기타"
        label define v3CD 1101"서울종로구" 1102"서울중구" 1103"서울용산구" 1104"서울성동구" 1105"서울광진구" 1106"서울동대문구" 1107"서울중랑구" 1108"서울성북구" 1109"서울강북구" 1110"서울도봉구" 1111"서울노원구" 1112"서울은평구" 1113"서울서대문구" 1114"서울마포구" 1115"서울양천구" 1116"서울강서구" 1117"서울구로구" 1118"서울금천구" 1119"서울영등포구" 1120"서울동작구" 1121"서울관악구" 1122"서울서초구" 1123"서울강남구" 1124"서울송파구" 1125"서울강동구" 2101"부산중구" 2102"부산서구" 2103"부산동구" 2104"부산영도구" 2105"부산부산진구" 2106"부산동래구" 2107"부산남구" 2108"부산북구" 2109"부산해운대구" 2110"부산사하구" 2111"부산금정구" 2112"부산강서구" 2113"부산연제구" 2114"부산수영구" 2115"부산사상구" 2151"부산기장군" 2201"대구중구" 2202"대구동구" 2203"대구서구" 2204"대구남구" 2205"대구북구" 2206"대구수성구" 2207"대구달서구" 2251"대구달성군" 2301"인천중구" 2302"인천동구" 2304"인천연수구" 2305"인천남동구" 2306"인천부평구" 2307"인천계양구" 2308"인천서구" 2309"인천미추홀구" 2351"인천강화군" 2352"인천옹진군" 2401"광주동구" 2402"광주서구" 2403"광주남구" 2404"광주북구" 2405"광주광산구" 2501"대전동구" 2502"대전중구" 2503"대전서구" 2504"대전유성구" 2505"대전대덕구" 2601"울산중구" 2602"울산남구" 2603"울산동구" 2604"울산북구" 2651"울산울주군" 2901"세종세종시" 3101"경기수원시" 3102"경기성남시" 3103"경기의정부시" 3104"경기안양시" 3105"경기부천시" 3106"경기광명시" 3107"경기평택시" 3108"경기동두천시" 3109"경기안산시" 3110"경기고양시" 3111"경기과천시" 3112"경기구리시" 3113"경기남양주시" 3114"경기오산시" 3115"경기시흥시" 3116"경기군포시" 3117"경기의왕시" 3118"경기하남시" 3119"경기용인시" 3120"경기파주시" 3121"경기이천시" 3122"경기안성시" 3123"경기김포시" 3124"경기화성시" 3125"경기광주시" 3126"경기양주시" 3127"경기포천시" 3128"경기여주시" 3155"경기연천군" 3157"경기가평군" 3158"경기양평군" 3201"강원춘천시" 3202"강원원주시" 3203"강원강릉시" 3204"강원동해시" 3205"강원태백시" 3206"강원속초시" 3207"강원삼척시" 3251"강원홍천군" 3252"강원횡성군" 3253"강원영월군" 3254"강원평창군" 3255"강원정선군" 3256"강원철원군" 3257"강원화천군" 3258"강원양구군" 3259"강원인제군" 3260"강원고성군" 3261"강원양양군" 3302"충북충주시" 3303"충북제천시" 3304"충북청주시" 3352"충북보은군" 3353"충북옥천군" 3354"충북영동군" 3355"충북진천군" 3356"충북괴산군" 3357"충북음성군" 3358"충북단양군" 3359"충북증평군" 3401"충남천안시" 3402"충남공주시" 3403"충남보령시" 3404"충남아산시" 3405"충남서산시" 3406"충남논산시" 3407"충남계룡시" 3408"충남당진시" 3451"충남금산군" 3453"충남부여군" 3454"충남서천군" 3455"충남청양군" 3456"충남홍성군" 3457"충남예산군" 3458"충남태안군" 3501"전북전주시" 3502"전북군산시" 3503"전북익산시" 3504"전북정읍시" 3505"전북남원시" 3506"전북김제시" 3551"전북완주군" 3552"전북진안군" 3553"전북무주군" 3554"전북장수군" 3555"전북임실군" 3556"전북순창군" 3557"전북고창군" 3558"전북부안군" 3601"전남목포시" 3602"전남여수시" 3603"전남순천시" 3604"전남나주시" 3606"전남광양시" 3651"전남담양군" 3652"전남곡성군" 3653"전남구례군" 3655"전남고흥군" 3656"전남보성군" 3657"전남화순군" 3658"전남장흥군" 3659"전남강진군" 3660"전남해남군" 3661"전남영암군" 3662"전남무안군" 3663"전남함평군" 3664"전남영광군" 3665"전남장성군" 3666"전남완도군" 3667"전남진도군" 3668"전남신안군" 3701"경북포항시" 3702"경북경주시" 3703"경북김천시" 3704"경북안동시" 3705"경북구미시" 3706"경북영주시" 3707"경북영천시" 3708"경북상주시" 3709"경북문경시" 3710"경북경산시" 3751"경북군위군" 3752"경북의성군" 3753"경북청송군" 3754"경북영양군" 3755"경북영덕군" 3756"경북청도군" 3757"경북고령군" 3758"경북성주군" 3759"경북칠곡군" 3760"경북예천군" 3761"경북봉화군" 3762"경북울진군" 3763"경북울릉군" 3803"경남진주시" 3805"경남통영시" 3806"경남사천시" 3807"경남김해시" 3808"경남밀양시" 3809"경남거제시" 3810"경남양산시" 3811"경남창원시" 3851"경남의령군" 3852"경남함안군" 3853"경남창녕군" 3854"경남고성군" 3855"경남남해군" 3856"경남하동군" 3857"경남산청군" 3858"경남함양군" 3859"경남거창군" 3860"경남합천군" 3901"제주제주시" 3902"제주서귀포시" 8888"외국외국" 9999"선박선박"
        label define v4CD 1"남자" 2"여자"
        label define v6CD 0"안받았음(무학)" 1"초등학교" 2"중학교" 3"고등학교" 4"전문대(초급대, 2년·3년제 대학 포함)" 5"대학교(4년제 이상 대학 포함)" 6"대학원(석사)" 7"대학원(박사)"
        label define v7CD 1"15세이상 30세미만" 2"30세이상 50세미만" 3"50세이상 55세미만" 4"55세이상"
        label define v8CD 1"인문계열" 2"예술체육계열" 3"상농공수산계열 등"
        label define v9CD 1"교육" 2"예술" 3"인문학" 4"사회과학, 언론·정보학" 5"경영, 행정·법학" 6"자연과학, 수학·통계학" 7"정보통신기술" 8"공학, 제조·건설" 9"농림어업·수의학" 10"보건" 11"복지" 12"서비스"
        label define v10CD 1"졸업" 2"재학" 3"중퇴" 4"휴학" 5"수료"
        label define v11CD 1"미혼" 2"유배우" 3"사별" 4"이혼"
        label define v12CD 1"예" 2"아니오"
        label define v13CD 1"중졸이하" 2"고졸" 3"전문대졸이상"
        label define v14CD 1"예" 2"아니오"
        label define v15CD 1"있었음" 2"없었음"
        label define v16CD 1"일시적 병, 사고" 2"휴가, 연가" 3"교육, 훈련" 4"육아" 5"가족적 이유" 6"노사분규" 7"사업부진, 조업중단" 8"기타"
        label define v17CD 1"있었음" 2"없었음"
        label define v21CD 1"1~17시간 무급가족종사자" 2"1~35시간" 3"36시간 이상"
        label define v22CD 1101"서울종로구" 1102"서울중구" 1103"서울용산구" 1104"서울성동구" 1105"서울광진구" 1106"서울동대문구" 1107"서울중랑구" 1108"서울성북구" 1109"서울강북구" 1110"서울도봉구" 1111"서울노원구" 1112"서울은평구" 1113"서울서대문구" 1114"서울마포구" 1115"서울양천구" 1116"서울강서구" 1117"서울구로구" 1118"서울금천구" 1119"서울영등포구" 1120"서울동작구" 1121"서울관악구" 1122"서울서초구" 1123"서울강남구" 1124"서울송파구" 1125"서울강동구" 2101"부산중구" 2102"부산서구" 2103"부산동구" 2104"부산영도구" 2105"부산부산진구" 2106"부산동래구" 2107"부산남구" 2108"부산북구" 2109"부산해운대구" 2110"부산사하구" 2111"부산금정구" 2112"부산강서구" 2113"부산연제구" 2114"부산수영구" 2115"부산사상구" 2151"부산기장군" 2201"대구중구" 2202"대구동구" 2203"대구서구" 2204"대구남구" 2205"대구북구" 2206"대구수성구" 2207"대구달서구" 2251"대구달성군" 2301"인천중구" 2302"인천동구" 2304"인천연수구" 2305"인천남동구" 2306"인천부평구" 2307"인천계양구" 2308"인천서구" 2309"인천미추홀구" 2351"인천강화군" 2352"인천옹진군" 2401"광주동구" 2402"광주서구" 2403"광주남구" 2404"광주북구" 2405"광주광산구" 2501"대전동구" 2502"대전중구" 2503"대전서구" 2504"대전유성구" 2505"대전대덕구" 2601"울산중구" 2602"울산남구" 2603"울산동구" 2604"울산북구" 2651"울산울주군" 2901"세종세종시" 3101"경기수원시" 3102"경기성남시" 3103"경기의정부시" 3104"경기안양시" 3105"경기부천시" 3106"경기광명시" 3107"경기평택시" 3108"경기동두천시" 3109"경기안산시" 3110"경기고양시" 3111"경기과천시" 3112"경기구리시" 3113"경기남양주시" 3114"경기오산시" 3115"경기시흥시" 3116"경기군포시" 3117"경기의왕시" 3118"경기하남시" 3119"경기용인시" 3120"경기파주시" 3121"경기이천시" 3122"경기안성시" 3123"경기김포시" 3124"경기화성시" 3125"경기광주시" 3126"경기양주시" 3127"경기포천시" 3128"경기여주시" 3155"경기연천군" 3157"경기가평군" 3158"경기양평군" 3201"강원춘천시" 3202"강원원주시" 3203"강원강릉시" 3204"강원동해시" 3205"강원태백시" 3206"강원속초시" 3207"강원삼척시" 3251"강원홍천군" 3252"강원횡성군" 3253"강원영월군" 3254"강원평창군" 3255"강원정선군" 3256"강원철원군" 3257"강원화천군" 3258"강원양구군" 3259"강원인제군" 3260"강원고성군" 3261"강원양양군" 3302"충북충주시" 3303"충북제천시" 3304"충북청주시" 3352"충북보은군" 3353"충북옥천군" 3354"충북영동군" 3355"충북진천군" 3356"충북괴산군" 3357"충북음성군" 3358"충북단양군" 3359"충북증평군" 3401"충남천안시" 3402"충남공주시" 3403"충남보령시" 3404"충남아산시" 3405"충남서산시" 3406"충남논산시" 3407"충남계룡시" 3408"충남당진시" 3451"충남금산군" 3453"충남부여군" 3454"충남서천군" 3455"충남청양군" 3456"충남홍성군" 3457"충남예산군" 3458"충남태안군" 3501"전북전주시" 3502"전북군산시" 3503"전북익산시" 3504"전북정읍시" 3505"전북남원시" 3506"전북김제시" 3551"전북완주군" 3552"전북진안군" 3553"전북무주군" 3554"전북장수군" 3555"전북임실군" 3556"전북순창군" 3557"전북고창군" 3558"전북부안군" 3601"전남목포시" 3602"전남여수시" 3603"전남순천시" 3604"전남나주시" 3606"전남광양시" 3651"전남담양군" 3652"전남곡성군" 3653"전남구례군" 3655"전남고흥군" 3656"전남보성군" 3657"전남화순군" 3658"전남장흥군" 3659"전남강진군" 3660"전남해남군" 3661"전남영암군" 3662"전남무안군" 3663"전남함평군" 3664"전남영광군" 3665"전남장성군" 3666"전남완도군" 3667"전남진도군" 3668"전남신안군" 3701"경북포항시" 3702"경북경주시" 3703"경북김천시" 3704"경북안동시" 3705"경북구미시" 3706"경북영주시" 3707"경북영천시" 3708"경북상주시" 3709"경북문경시" 3710"경북경산시" 3751"경북군위군" 3752"경북의성군" 3753"경북청송군" 3754"경북영양군" 3755"경북영덕군" 3756"경북청도군" 3757"경북고령군" 3758"경북성주군" 3759"경북칠곡군" 3760"경북예천군" 3761"경북봉화군" 3762"경북울진군" 3763"경북울릉군" 3803"경남진주시" 3805"경남통영시" 3806"경남사천시" 3807"경남김해시" 3808"경남밀양시" 3809"경남거제시" 3810"경남양산시" 3811"경남창원시" 3851"경남의령군" 3852"경남함안군" 3853"경남창녕군" 3854"경남고성군" 3855"경남남해군" 3856"경남하동군" 3857"경남산청군" 3858"경남함양군" 3859"경남거창군" 3860"경남합천군" 3901"제주제주시" 3902"제주서귀포시" 8888"외국외국" 9999"선박선박"
        label define v23CD 1"1~4명" 2"5~9명" 3"10~29명" 4"30~99명" 5"100~299명" 6"300명 이상"
        label define v26CD 1"상용근로자" 2"임시근로자" 3"일용근로자" 4"고용원이 있는 자영업자" 5"고용원이 없는 자영업자" 6"무급가족종사자"
        label define v28CD 1"정하였음" 2"정하지 않았음(정년제 포함)"
        label define v29CD 1"1개월미만" 2"1개월~6개월미만" 3"6개월~1년미만" 4"1년" 5"1년 초과~2년" 6"2년 초과~3년" 7"3년 초과"
        label define v31CD 1"구해 보았음" 2"구해 보지 않았음"
        label define v32CD 1"있었음" 2"없었음"
        label define v33CD 1"시험 접수, 시험 응시" 2"구직 등록, 구직 응모" 3"사업체에 문의, 방문, 원서제출" 4"자영업 준비" 5"친척, 친구, 동료에게 소개 부탁" 6"기타"
        label define v34CD 1"시험 접수, 시험 응시" 2"구직 등록, 구직 응모" 3"사업체에 문의, 방문, 원서제출" 4"자영업 준비" 5"친척, 친구, 동료에게 소개 부탁" 6"기타"
        label define v35CD 1"공공 취업알선기관" 2"민간 취업알선기관" 3"대중매체(신문, 잡지, 광고 등)" 4"학교, 학원" 5"친척, 친구, 동료" 6"기타"
        label define v36CD 1"공공 취업알선기관" 2"민간 취업알선기관" 3"대중매체(신문, 잡지, 광고 등)" 4"학교, 학원" 5"친척, 친구, 동료" 6"기타"
        label define v38CD 1"원하였음" 2"원하지 않았음"
        label define v39CD 1"전공이나 경력에 맞는 일거리가 없을것 같아서" 2"원하는 임금수준이나 근로조건이 맞는 일거리가 없을것 같아서" 3"근처(주변)에 일거리가 없을것 같아서" 4"교육, 기술, 경험이 부족해서" 5"나이가 너무 어리거나 많다고 고용주가 생각할것 같아서" 6"이전에 찾아보았지만 일거리가 없었기 때문에" 7"육아 " 8"가사" 9"통학" 10"심신장애" 11"기타"
        label define v40CD 1"있었음" 2"없었음"
        label define v41CD 1"육아" 2"가사" 3"정규교육기관 통학" 4"입시학원 통학" 5"취업을 위한 학원, 기관 통학(고시학원, 직업훈련기관 등)" 6"취업준비" 7"진학준비" 8"연로" 9"심신장애" 10"군입대 대기" 11"쉬었음" 12"기타"
        label define v42CD 1"있었음" 2"없었음"
        label define v43CD 1"1년 미만" 2"1년 이상"
        label define v45CD 1"개인, 가족관련 이유" 2"육아" 3"가사" 4"심신장애" 5"정년퇴직, 연로" 6"작업여건(시간, 보수등) 불만족" 7"직장의 휴업, 폐업" 8"명예, 조기퇴직, 정리해고" 9"임시 또는 계절적 일의 완료" 10"일거리가 없어서 또는 사업부진" 11"기타"
        label define v47CD 1"취업자" 2"실업자" 3"비경제활동인구"

        label values v2 v2CD
        label values v3 v3CD
        label values v4 v4CD
        label values v6 v6CD
        label values v7 v7CD
        label values v8 v8CD
        label values v9 v9CD
        label values v10 v10CD
        label values v11 v11CD
        label values v12 v12CD
        label values v13 v13CD
        label values v14 v14CD
        label values v15 v15CD
        label values v16 v16CD
        label values v17 v17CD
        label values v21 v21CD
        label values v22 v22CD
        label values v23 v23CD
        label values v26 v26CD
        label values v28 v28CD
        label values v29 v29CD
        label values v31 v31CD
        label values v32 v32CD
        label values v33 v33CD
        label values v34 v34CD
        label values v35 v35CD
        label values v36 v36CD
        label values v38 v38CD
        label values v39 v39CD
        label values v40 v40CD
        label values v41 v41CD
        label values v42 v42CD
        label values v43 v43CD
        label values v45 v45CD
        label values v47 v47CD
save `path'2023_상반기, replace
