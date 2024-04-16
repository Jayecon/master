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
import delimited "`path'2010_4분기(A형_시군_중분류)_20240403_33170.csv", delimiter(",") numericcols() stringcols(1, 5, 16, 17, 18, 24, 34, 39, 40, 45, 49) varnames(nonames) rowrange(2)

        label variable v1 "조사년,분기"
        label variable v2 "행정구역"
        label variable v3 "가구주와의 관계"
        label variable v4 "성별"
        label variable v5 "연령(만나이)"
        label variable v6 "5-1.교육정도(학력)"
        label variable v7 "5-3.계열"
        label variable v8 "5-4.교육정도(수학여부)"
        label variable v9 "6.혼인상태"
        label variable v10 "7.지난1주간활동상태"
        label variable v11 "8.지난1주간취업여부"
        label variable v12 "9.일시휴직여부"
        label variable v13 "10.4주내 구직활동 여부"
        label variable v14 "11.부업여부"
        label variable v15 "12.취업구분"
        label variable v16 "12-1.주업시간"
        label variable v17 "12-2.부업시간"
        label variable v18 "12-3.총취업시간"
        label variable v19 "13.즉시취업 가능여부(실업)"
        label variable v20 "14.1.1.구직 주요경로1"
        label variable v21 "14.1.2.구직 주요경로2"
        label variable v22 "14.2.1.구직방법1"
        label variable v23 "14.2.2.구직방법2"
        label variable v24 "15.구직활동기간"
        label variable v25 "16.구직희망여부"
        label variable v26 "17.직장구하지않은이유"
        label variable v27 "18.지난 1년간 구직활동여부"
        label variable v28 "19.희망직상 산업"
        label variable v29 "20.희망직상 직업"
        label variable v30 "21.희망직장지위"
        label variable v31 "21.1.근로종류"
        label variable v32 "22.희망월평균소득"
        label variable v33 "23.전직유무"
        label variable v34 "23.1.이직시기"
        label variable v35 "24.직장을그만둔이유"
        label variable v36 "25.산업코드"
        label variable v37 "26.직업코드"
        label variable v38 "27.종사상지위"
        label variable v39 "28.직장시작년월"
        label variable v40 "29.3개월 평균임금"
        label variable v41 "30.고용계약여부"
        label variable v42 "30-1.고용계약기간"
        label variable v43 "31.교육훈련참여여부"
        label variable v44 "31-1-1.주된교육훈련1"
        label variable v45 "31-1-2.주된교육훈련2"
        label variable v46 "31-1-3.직업교육훈련과 관련여부"
        label variable v47 "사업체소재지코드"
        label variable v48 "교육정도컨버전"
        label variable v49 "시군가중치"
        label variable v50 "경제활동구분"

        label define v2CD 1100"서울특별시" 2100"부산광역시" 2200"대구광역시" 2300"인천광역시" 2400"광주광역시" 2500"대전광역시" 2600"울산광역시" 3101"수원시" 3102"성남시" 3103"의정부시" 3104"안양시" 3105"부천시" 3106"광명시" 3107"평택시" 3108"동두천시" 3109"안산시" 3110"고양시" 3111"과천시" 3112"구리시" 3113"남양주시" 3114"오산시" 3115"시흥시" 3116"군포시" 3117"의왕시" 3118"하남시" 3119"용인시" 3120"파주시" 3121"이천시" 3122"안성시" 3123"김포시" 3124"화성시" 3125"광주시" 3126"양주시" 3127"포천시" 3132"여주군" 3135"연천군" 3137"가평군" 3138"양평군" 3201"춘천시" 3202"원주시" 3203"강릉시" 3204"동해시" 3205"태백시" 3206"속초시" 3207"삼척시" 3231"홍천군" 3232"횡성군" 3233"영월군" 3234"평창군" 3235"정선군" 3236"철원군" 3237"화천군" 3238"양구군" 3239"인제군" 3240"고성군" 3241"양양군" 3301"청주시" 3302"충주시" 3303"제천시" 3331"청원군" 3332"보은군" 3333"옥천군" 3334"영동군" 3335"진천군" 3336"괴산군" 3337"음성군" 3338"단양군" 3339"증평군" 3401"천안시" 3402"공주시" 3403"보령시" 3404"아산시" 3405"서산시" 3406"논산시" 3407"계룡시" 3431"금산군" 3432"연기군" 3433"부여군" 3434"서천군" 3435"청양군" 3436"홍성군" 3437"예산군" 3438"태안군" 3439"당진군" 3501"전주시" 3502"군산시" 3503"익산시" 3504"정읍시" 3505"남원시" 3506"김제시" 3531"완주군" 3532"진안군" 3533"무주군" 3534"장수군" 3535"임실군" 3536"순창군" 3537"고창군" 3538"부안군" 3601"목포시" 3602"여수시" 3603"순천시" 3604"나주시" 3606"광양시" 3631"담양군" 3632"곡성군" 3633"구례군" 3635"고흥군" 3636"보성군" 3637"화순군" 3638"장흥군" 3639"강진군" 3640"해남군" 3641"영암군" 3642"무안군" 3643"함평군" 3644"영광군" 3645"장성군" 3646"완도군" 3647"진도군" 3648"신안군" 3701"포항시" 3702"경주시" 3703"김천시" 3704"안동시" 3705"구미시" 3706"영주시" 3707"영천시" 3708"상주시" 3709"문경시" 3710"경산시" 3731"군위군" 3732"의성군" 3733"청송군" 3734"영양군" 3735"영덕군" 3736"청도군" 3737"고령군" 3738"성주군" 3739"칠곡군" 3740"예천군" 3741"봉화군" 3742"울진군" 3743"울릉군" 3803"진주시" 3805"통영시" 3806"사천시" 3807"김해시" 3808"밀양시" 3809"거제시" 3810"양산시" 3811"창원시" 3831"의령군" 3832"함안군" 3833"창녕군" 3834"고성군" 3835"남해군" 3836"하동군" 3837"산청군" 3838"함양군" 3839"거창군" 3840"합천군" 3901"제주시" 3902"서귀포시"
        label define v3CD 1"가구주" 2"배우자" 3"미혼자녀" 4"기혼자녀" 5"손자녀" 6"부모(장인,장모)" 7"조부모" 8"미혼형제자매" 9"기타"
        label define v4CD 1"남자" 2"여자"
        label define v6CD 0"무학" 1"초등학교" 2"중학교" 3"고등학교" 4"전문대(초급대,2ㆍ3년제 대학포함)" 5"대학교(4년제 대학포함)" 6"대학원(석사)" 7"대학원(박사)"
        label define v7CD 1"인문ㆍ사회계열" 2"예술ㆍ체육계열" 3"교육(사범)계열" 4"자연계열" 5"공학계열" 6"의약계열"
        label define v8CD 1"졸업" 2"재학" 3"중퇴" 4"휴학"
        label define v9CD 1"미혼" 2"유배우" 3"사별" 4"이혼"
        label define v10CD 01"일하였음" 02"일시휴직" 03"구직활동" 04"발령대기" 05"육아" 06"가사" 07"정규교육기관 통학" 08"입시학원 통학" 09"취업을 위한 학원,기관통학" 10"취업준비" 11"진학준비" 12"연로" 13"심신장애" 14"군입대 대기" 15"결혼 준비" 16"쉬었음" 17"기타"
        label define v11CD 1"있었음" 2"무급가족종사자" 3"없었음"
        label define v12CD 11"일시적 병, 사고" 12"휴가, 연가" 13"교육" 14"육아, 가족적 이유" 15"노사분규" 16"사업부진, 조업중단" 17"기타" 20"없었음"
        label define v13CD 1"구해보았음" 2"구해보지않았음"
        label define v14CD 1"있었음" 2"없었음"
        label define v15CD 1"18시간 미만 무급가족종사자" 2"1~35시간" 3"36시간 이상"
        label define v19CD 1"있었음" 2"없었음"
        label define v20CD 11"공공 직업알선기관" 12"민간 직업알선기관" 13"대중매체(신문,잡지,광고등)" 14"학교, 학원" 15"친척, 친구, 동료" 16"기타(  )"
        label define v21CD 11"공공 직업알선기관" 12"민간 직업알선기관" 13"대중매체(신문,잡지,광고등)" 14"학교, 학원" 15"친척, 친구, 동료" 16"기타(  )"
        label define v22CD 21"시험응시" 22"구직등록,구직응모(주로 공공,민간알선기관)" 23"사업체 문의, 방문, 원서제출" 24"자영업 준비" 25"기타(  )"
        label define v23CD 21"시험응시" 22"구직등록,구직응모(주로 공공,민간알선기관)" 23"사업체 문의,방문,원서제출" 24"자영업 준비" 25"기타(  )"
        label define v25CD 1"예" 2"아니오"
        label define v26CD 01"전공이나 경력에 맞는 일거리가 없을것 같아서" 02"원하는 임금수준이나 근로조건이 맞는 일거리가 없을것 같아서" 03"근처(주변)에 일거리가 없을것 같아서" 04"교육, 기술, 경험이 부족해서" 05"나이가 너무 어리거나 많다고 고용주가 생각할것 같아서" 06"이전에 찾아보았지만 일거리가 없었기 때문에" 07"육아" 08"가사" 09"통학" 10"심신장애" 11"기타(  )"
        label define v27CD 1"있었음" 2"없었음"
        label define v28CD 1"농업,임업,어업" 2"광업,제조업" 3"건설업" 4"도소매업, 숙박 및 음식점업" 5"전기·가스업, 운수업, 방송통신 및 정보서비스업,금융·보험업" 6"사업·개인·공공서비스업, 보건·교육업 및 기타산업"
        label define v29CD 1"관리자" 2"전문가 및 관련 종사자" 3"사무 종사자" 4"서비스 종사자" 5"판매 종사자" 6"농림어업 숙련 종사자" 7"기능원 및 관련 기능 종사자" 8"장치, 기계조작 및 조립 종사자" 9"단순 노무 종사자" 10"군인"
        label define v30CD 1"임금근로자" 2"비임금 근로자(자영업자, 무급가족종사자)"
        label define v31CD 11"시간제" 12"전일제"
        label define v32CD 1"50만원 미만" 2"50~100만원 미만" 3"100~150만원 미만" 4"150~200만원 미만" 5"200~250만원 미만" 6"250~300만원 미만" 7"300~400만원 미만" 8"400만원 이상"
        label define v33CD 1"1년미만" 2"1년이상" 3"없었음"
        label define v35CD 01"개인, 가족관련 이유" 02"육아" 03"가사" 04"심신장애" 05"정년퇴직, 연로" 06"작업여건(시간, 보수등) 불만족" 07"직장의 휴업, 폐업" 08"명예, 조기퇴직, 정리해고" 09"임시 또는 계절적 일의 완료" 10"일거리가 없어서 또는 사업경영 악화" 11"기타(  )"
        label define v36CD 01"농업" 02"임업" 03"어업" 05"석탄, 원유 및 천연가스 광업" 06"금속 광업" 07"비금속광물 광업;연료용 제외" 08"광업 지원 서비스업" 10"식료품 제조업" 11"음료 제조업" 12"담배 제조업" 13"섬유제품 제조업; 의복제외" 14"의복, 의복액세서리 및 모피제품 제조업" 15"가죽, 가방 및 신발 제조업" 16"목재 및 나무제품 제조업;가구제외" 17"펄프, 종이 및 종이제품 제조업" 18"인쇄 및 기록매체 복제업" 19"코크스, 연탄 및 석유정제품 제조업" 20"화학물질 및 화학제품 제조업;의약품 제외" 21"의료용 물질 및 의약품 제조업" 22"고무제품 및 플라스틱제품 제조업" 23"비금속 광물제품 제조업" 24"1차 금속 제조업" 25"금속가공제품 제조업;기계 및 가구 제외" 26"전자부품, 컴퓨터, 영상, 음향 및 통신장비 제조업" 27"의료, 정밀, 광학기기 및 시계 제조업" 28"전기장비 제조업" 29"기타 기계 및 장비 제조업" 30"자동차 및 트레일러 제조업" 31"기타 운송장비 제조업" 32"가구 제조업" 33"기타 제품 제조업" 35"전기, 가스, 증기 및 공기조절 공급업" 36"수도사업" 37"하수, 폐수 및 분뇨 처리업" 38"폐기물 수집운반, 처리 및 원료재생업" 39"환경 정화 및 복원업" 41"종합 건설업" 42"전문직별 공사업" 45"자동차 및 부품 판매업" 46"도매 및 상품중개업" 47"소매업; 자동차 제외" 49"육상운송 및 파이프라인 운송업" 50"수상 운송업" 51"항공 운송업" 52"창고 및 운송관련 서비스업" 55"숙박업" 56"음식점 및 주점업" 58"출판업" 59"영상·오디오 기록물 제작 및 배급업" 60"방송업" 61"통신업" 62"컴퓨터 프로그래밍, 시스템 통합 및 관리업" 63"정보서비스업" 64"금융업" 65"보험 및 연금업" 66"금융 및 보험 관련 서비스업" 68"부동산업" 69"임대업;부동산 제외" 70"연구개발업" 71"전문서비스업" 72"건축기술, 엔지니어링 및 기타 과학기술 서비스업" 73"기타 전문, 과학 및 기술 서비스업" 74"사업시설 관리 및 조경 서비스업" 75"사업지원 서비스업" 84"공공행정, 국방 및 사회보장 행정" 85"교육 서비스업" 86"보건업" 87"사회복지 서비스업" 90"창작, 예술 및 여가관련 서비스업" 91"스포츠 및 오락관련 서비스업" 94"협회 및 단체" 95"수리업" 96"기타 개인 서비스업" 97"가구내 고용활동" 98"달리 분류되지 않은 자가소비를 위한 가구의 재화 및 서비스 생산활동" 99"국제 및 외국기관"
        label define v38CD 1"상용근로자" 2"임시근로자" 3"일용근로자" 4"고용원이 있는 자영업자" 5"고용원이 없는 자영업자" 6"무급가족종사자"
        label define v41CD 1"정했음" 2"정하지 않았음"
        label define v42CD 1"1개월 미만" 2"1개월 이상~6개월 미만" 3"6개월 이상~1년 미만" 4"1년" 5"1년 초과~2년 이하" 6"2년 초과~3년 이하" 7"3년 초과"
        label define v43CD 1"있다" 2"없다"
        label define v44CD 11"직장연수, 기관(단체) 주관 직업훈련" 12"TV, 라디오, 인터넷 등을 통한 자기주도 학습" 13"학원수강" 14"교양강좌(대학평생교육원, 복지관, 시민회관 등)" 15"기타"
        label define v46CD 1"예" 2"아니오"
        label define v47CD 1100"서울특별시" 2100"부산광역시" 2200"대구광역시" 2300"인천광역시" 2400"광주광역시" 2500"대전광역시" 2600"울산광역시" 3101"수원시" 3102"성남시" 3103"의정부시" 3104"안양시" 3105"부천시" 3106"광명시" 3107"평택시" 3108"동두천시" 3109"안산시" 3110"고양시" 3111"과천시" 3112"구리시" 3113"남양주시" 3114"오산시" 3115"시흥시" 3116"군포시" 3117"의왕시" 3118"하남시" 3119"용인시" 3120"파주시" 3121"이천시" 3122"안성시" 3123"김포시" 3124"화성시" 3125"광주시" 3126"양주시" 3127"포천시" 3132"여주군" 3135"연천군" 3137"가평군" 3138"양평군" 3201"춘천시" 3202"원주시" 3203"강릉시" 3204"동해시" 3205"태백시" 3206"속초시" 3207"삼척시" 3231"홍천군" 3232"횡성군" 3233"영월군" 3234"평창군" 3235"정선군" 3236"철원군" 3237"화천군" 3238"양구군" 3239"인제군" 3240"고성군" 3241"양양군" 3301"청주시" 3302"충주시" 3303"제천시" 3331"청원군" 3332"보은군" 3333"옥천군" 3334"영동군" 3335"진천군" 3336"괴산군" 3337"음성군" 3338"단양군" 3339"증평군" 3401"천안시" 3402"공주시" 3403"보령시" 3404"아산시" 3405"서산시" 3406"논산시" 3407"계룡시" 3431"금산군" 3432"연기군" 3433"부여군" 3434"서천군" 3435"청양군" 3436"홍성군" 3437"예산군" 3438"태안군" 3439"당진군" 3501"전주시" 3502"군산시" 3503"익산시" 3504"정읍시" 3505"남원시" 3506"김제시" 3531"완주군" 3532"진안군" 3533"무주군" 3534"장수군" 3535"임실군" 3536"순창군" 3537"고창군" 3538"부안군" 3601"목포시" 3602"여수시" 3603"순천시" 3604"나주시" 3606"광양시" 3631"담양군" 3632"곡성군" 3633"구례군" 3635"고흥군" 3636"보성군" 3637"화순군" 3638"장흥군" 3639"강진군" 3640"해남군" 3641"영암군" 3642"무안군" 3643"함평군" 3644"영광군" 3645"장성군" 3646"완도군" 3647"진도군" 3648"신안군" 3701"포항시" 3702"경주시" 3703"김천시" 3704"안동시" 3705"구미시" 3706"영주시" 3707"영천시" 3708"상주시" 3709"문경시" 3710"경산시" 3731"군위군" 3732"의성군" 3733"청송군" 3734"영양군" 3735"영덕군" 3736"청도군" 3737"고령군" 3738"성주군" 3739"칠곡군" 3740"예천군" 3741"봉화군" 3742"울진군" 3743"울릉군" 3803"진주시" 3805"통영시" 3806"사천시" 3807"김해시" 3808"밀양시" 3809"거제시" 3810"양산시" 3811"창원시" 3831"의령군" 3832"함안군" 3833"창녕군" 3834"고성군" 3835"남해군" 3836"하동군" 3837"산청군" 3838"함양군" 3839"거창군" 3840"합천군" 3901"제주시" 3902"서귀포시"
        label define v48CD 1"초졸이하" 2"중졸" 3"고졸" 4"대졸이상"
        label define v50CD 1"취업자" 2"실업자" 3"비경제활동인구"

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
        label values v19 v19CD
        label values v20 v20CD
        label values v21 v21CD
        label values v22 v22CD
        label values v23 v23CD
        label values v25 v25CD
        label values v26 v26CD
        label values v27 v27CD
        label values v28 v28CD
        label values v29 v29CD
        label values v30 v30CD
        label values v31 v31CD
        label values v32 v32CD
        label values v33 v33CD
        label values v35 v35CD
        label values v36 v36CD
        label values v38 v38CD
        label values v41 v41CD
        label values v42 v42CD
        label values v43 v43CD
        label values v44 v44CD
        label values v46 v46CD
        label values v47 v47CD
        label values v48 v48CD
        label values v50 v50CD
save `path'2010_4분기, replace
