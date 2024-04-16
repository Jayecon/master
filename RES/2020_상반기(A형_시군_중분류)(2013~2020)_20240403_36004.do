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

import delimited "2020_상반기(A형_시군_중분류)(2013~2020)_20240403_36004.csv", delimiter(",") numericcols(5, 18, 19, 20, 29, 36, 46) stringcols(1, 26, 43) varnames(nonames) rowrange(2)

        label variable v1 "조사연월"
        label variable v2 "행정구역시군코드"
        label variable v3 "가구주관계코드"
        label variable v4 "성별코드"
        label variable v5 "만연령"
        label variable v6 "교육정도코드"
        label variable v7 "만연령변환코드"
        label variable v8 "교육정도_고등학교계열코드"
        label variable v9 "교육정도_전문대이상계열코드"
        label variable v10 "교육정도_수학구분코드"
        label variable v11 "교육정도변환코드"
        label variable v12 "혼인상태코드"
        label variable v13 "조사대상주간수입목적종사여부"
        label variable v14 "조사대상주간_무급종사여부"
        label variable v15 "조사대상주간일시휴직여부"
        label variable v16 "조사대상주간일시휴직_사유코드"
        label variable v17 "조사대상주간부업여부"
        label variable v18 "조사대상주간주업근무시간수"
        label variable v19 "조사대상주간부업근무시간수"
        label variable v20 "조사대상주간근무총계시간수"
        label variable v21 "주업부업총계시간구분코드"
        label variable v22 "10차산업중분류코드"
        label variable v23 "근무사업체소재지코드"
        label variable v24 "7차_2자리직업중분류코드"
        label variable v25 "종사상지위코드"
        label variable v26 "조사대상주간직장시작연월"
        label variable v27 "고용계약기간정함여부"
        label variable v28 "고용계약기간코드"
        label variable v29 "최근3개월간평균급여"
        label variable v30 "4주간구직활동여부"
        label variable v31 "조사대상주간취업가능여부"
        label variable v32 "1순위구직방법코드"
        label variable v33 "2순위구직방법코드"
        label variable v34 "1순위구직경로코드"
        label variable v35 "2순위구직경로코드"
        label variable v36 "구직활동기간월수"
        label variable v37 "조사대상주간취업희망여부"
        label variable v38 "지난4주간비구직사유코드"
        label variable v39 "지난1년간구직경험여부"
        label variable v40 "주활동상태_조사대상주간주활동상태코드"
        label variable v41 "수입목적직업경험여부"
        label variable v42 "퇴직기간코드"
        label variable v43 "1년미만전직장퇴직연월"
        label variable v44 "퇴직사유코드"
        label variable v45 "경제활동구분코드"
        label variable v46 "시군가중값"

        label define v3CD 1"가구주" 2"배우자" 3"미혼자녀" 4"기혼자녀(배우자)" 5"손자녀(배우자)" 6"부모(장인,장모)" 7"조부모" 8"미혼형제자매" 9"기타"
        label define v4CD 1"남자" 2"여자"
        label define v6CD 0"안받았음(무학)" 1"초등학교" 2"중학교" 3"고등학교" 4"전문대(초급대, 2년·3년제 대학 포함)" 5"대학교(4년제 이상 대학 포함)" 6"대학원(석사)" 7"대학원(박사)"
        label define v7CD 1"15세이상 30세미만" 2"30세이상 50세미만" 3"50세이상 55세미만" 4"55세이상"
        label define v8CD 1"인문계열" 2"예술·체육계열" 3"상농공수산계열 등"
        label define v9CD 1"교육" 2"예술" 3"인문학" 4"사회과학, 언론·정보학" 5"경영, 행정·법학" 6"자연과학, 수학·통계학" 7"정보통신기술" 8"공학, 제조·건설" 9"농림어업··수의학" 10"보건" 11"복지" 12"서비스"
        label define v10CD 1"졸업" 2"재학" 3"중퇴" 4"휴학" 5"수료"
        label define v11CD 1"중졸이하" 2"고졸" 3"전문대졸이상"
        label define v12CD 1"미혼" 2"유배우" 3"사별" 4"이혼"
        label define v13CD 1"예" 2"아니오"
        label define v14CD 1"예" 2"아니오"
        label define v15CD 1"있었음" 2"없었음"
        label define v16CD 1"일시적 병, 사고" 2"휴가ㆍ연가" 3"교육ㆍ훈련" 4"육아" 5"가족적 이유" 6"노사분규" 7"사업부진ㆍ조업중단" 8"기타"
        label define v17CD 1"있었음" 2"없었음"
        label define v21CD 1"1~17시간 무급가족종사자" 2"1~35시간" 3"36시간 이상"
        label define v22CD 01"농업" 02"임업" 03"어업" 05"석탄, 원유 및 천연가스 광업" 06"금속 광업" 07"비금속광물 광업; 연료용 제외" 08"광업 지원 서비스업" 10"식료품 제조업" 11"음료 제조업" 12"담배 제조업" 13"섬유제품 제조업; 의복 제외" 14"의복, 의복 액세서리 및 모피제품 제조업" 15"가죽, 가방 및 신발 제조업" 16"목재 및 나무제품 제조업; 가구 제외" 17"펄프, 종이 및 종이제품 제조업" 18"인쇄 및 기록매체 복제업" 19"코크스, 연탄 및 석유정제품 제조업" 20"화학 물질 및 화학제품 제조업; 의약품 제외" 21"의료용 물질 및 의약품 제조업" 22"고무 및 플라스틱제품 제조업" 23"비금속 광물제품 제조업" 24"1차 금속 제조업" 25"금속 가공제품 제조업; 기계 및 가구 제외" 26"전자 부품, 컴퓨터, 영상, 음향 및 통신장비 제조업" 27"의료, 정밀, 광학 기기 및 시계 제조업" 28"전기장비 제조업" 29"기타 기계 및 장비 제조업" 30"자동차 및 트레일러 제조업" 31"기타 운송장비 제조업" 32"가구 제조업" 33"기타 제품 제조업" 34"산업용 기계 및 장비 수리업" 35"전기, 가스, 증기 및 공기 조절 공급업" 36"수도업" 37"하수, 폐수 및 분뇨 처리업" 38"폐기물 수집, 운반, 처리 및 원료 재생업" 39"환경 정화 및 복원업" 41"종합 건설업" 42"전문직별 공사업" 45"자동차 및 부품 판매업" 46"도매 및 상품 중개업" 47"소매업; 자동차 제외" 49"육상 운송 및 파이프라인 운송업" 50"수상 운송업" 51"항공 운송업" 52"창고 및 운송관련 서비스업" 55"숙박업" 56"음식점 및 주점업" 58"출판업" 59"영상？오디오 기록물 제작 및 배급업" 60"방송업" 61"우편 및 통신업" 62"컴퓨터 프로그래밍, 시스템 통합 및 관리업" 63"정보서비스업" 64"금융업" 65"보험 및 연금업" 66"금융 및 보험관련 서비스업" 68"부동산업" 70"연구개발업" 71"전문 서비스업" 72"건축 기술, 엔지니어링 및 기타 과학기술 서비스업" 73"기타 전문, 과학 및 기술 서비스업" 74"사업시설 관리 및 조경 서비스업" 75"사업 지원 서비스업" 76"임대업; 부동산 제외" 84"공공 행정, 국방 및 사회보장 행정" 85"교육 서비스업" 86"보건업" 87"사회복지 서비스업" 90"창작, 예술 및 여가관련 서비스업" 91"스포츠 및 오락관련 서비스업" 94"협회 및 단체" 95"개인 및 소비용품 수리업" 96"기타 개인 서비스업" 97"가구 내 고용활동" 98"달리 분류되지 않은 자가 소비를 위한 가구의 재화 및 서비스 생산활동" 99"국제 및 외국기관"
        label define v25CD 1"상용근로자" 2"임시근로자" 3"일용근로자" 4"고용원이 있는 자영업자" 5"고용원이 없는 자영업자" 6"무급가족종사자"
        label define v27CD 1"정하였음" 2"정하지 않았음(정년제 포함)"
        label define v28CD 1"1개월미만" 2"1개월~6개월미만" 3"6개월~1년미만" 4"1년" 5"1년 초과~2년" 6"2년 초과~3년" 7"3년 초과"
        label define v30CD 1"구해 보았음" 2"구해 보지 않았음"
        label define v31CD 1"있었음" 2"없었음"
        label define v32CD 1"시험 접수, 시험 응시" 2"구직 등록, 구직 응모" 3"사업체에 문의, 방문, 원서제출" 4"자영업 준비" 5"친척, 친구, 동료에게 소개 부탁" 6"기타"
        label define v33CD 1"시험 접수, 시험 응시" 2"구직 등록, 구직 응모" 3"사업체에 문의, 방문, 원서제출" 4"자영업 준비" 5"친척, 친구, 동료에게 소개 부탁" 6"기타"
        label define v34CD 1"공공 취업알선기관" 2"민간 취업알선기관" 3"대중매체(신문, 잡지, 광고 등)" 4"학교, 학원" 5"친척, 친구, 동료" 6"기타"
        label define v35CD 1"공공 취업알선기관" 2"민간 취업알선기관" 3"대중매체(신문, 잡지, 광고 등)" 4"학교, 학원" 5"친척, 친구, 동료" 6"기타"
        label define v37CD 1"원하였음" 2"원하지 않았음"
        label define v38CD 1"전공이나 경력에 맞는 일거리가 없을것 같아서" 2"원하는 임금수준이나 근로조건이 맞는 일거리가 없을것 같아서" 3"근처(주변)에 일거리가 없을것 같아서" 4"교육, 기술, 경험이 부족해서" 5"나이가 너무 어리거나 많다고 고용주가 생각할것 같아서" 6"이전에 찾아보았지만 일거리가 없었기 때문에" 7"육아" 8"가사" 9"통학" 10"심신장애" 11"기타"
        label define v39CD 1"있었음" 2"없었음"
        label define v40CD 1"육아" 2"가사" 3"정규교육기관 통학" 4"입시학원 통학" 5"취업을 위한 학원, 기관 통학(고시학원, 직업훈련기관 등)" 6"취업준비" 7"진학준비" 8"연로" 9"심신장애" 10"군입대 대기" 11"쉬었음" 12"기타"
        label define v41CD 1"있었음" 2"없었음"
        label define v42CD 1"1년 미만" 2"1년 이상"
        label define v44CD 1"개인, 가족관련 이유" 2"육아" 3"가사" 4"심신장애" 5"정년퇴직, 연로" 6"작업여건(시간, 보수등) 불만족" 7"직장의 휴업, 폐업" 8"명예, 조기퇴직, 정리해고" 9"임시 또는 계절적 일의 완료" 10"일거리가 없어서 또는 사업부진" 11"기타"
        label define v45CD 1"취업자" 2"실업자" 3"비경제활동인구"

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
        label values v25 v25CD
        label values v27 v27CD
        label values v28 v28CD
        label values v30 v30CD
        label values v31 v31CD
        label values v32 v32CD
        label values v33 v33CD
        label values v34 v34CD
        label values v35 v35CD
        label values v37 v37CD
        label values v38 v38CD
        label values v39 v39CD
        label values v40 v40CD
        label values v41 v41CD
        label values v42 v42CD
        label values v44 v44CD
        label values v45 v45CD
