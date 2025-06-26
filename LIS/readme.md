1. 09-18년 년도별 집단별 위험도 계산(LIS 과거자료 사용)
   lis_s1_care.do 돌봄위험,              결과 텍스트는 care_s1.csv 로 수동저장 필요.
   lis_s1_pv5.do  빈곤(중위소득50%)위험, 결과 텍스트는 pv5_s1.csv  로 수동저장 필요.
   lis_s1_pv6.do  빈곤(중위소득60%)위험, 결과 텍스트는 pv6_s1.csv  로 수동저장 필요.
   lis_s1_rent.do 주거비 위험,           결과 텍스트는 rent_s1.csv 로 수동저장 필요.

2. 위에서 계산된 집단별 위험도의 년도 평균값 계산 및 19년 자료에 할당하는 코드 생성
   lis_s1_rentprinter.do 결과 텍스트는 lis_s2_rent.do 의 상단에 붙이기.
   lis_s1_careprinter.do 결과 텍스트는 lis_s2_care.do 의 상단에 붙이기.
   lis_s1_pv5printer.do  결과 텍스트는 lis_s2_pv5.do  의 상단에 붙이기.
   lis_s1_pv6printer.do  결과 텍스트는 lis_s2_pv6.do  의 상단에 붙이기.

3. 할당된 집단별 위험도를 이용해 10분위 위험도 도출

   lis_s2_care.do         결과 텍스트는 care.csv         로 수동저장 필요.
   lis_s2_health.do       결과 텍스트는 health.csv       로 수동저장 필요.
   lis_s2_noemployment.do 결과 텍스트는 noemployment.csv 로 수동저장 필요.
   lis_s2_ptjob.do        결과 텍스트는 ptjob.csv        로 수동저장 필요.
   lis_s2_pv.do           결과 텍스트는 pv.csv           로 수동저장 필요.
   lis_s2_rent.do         결과 텍스트는 rent.csv         로 수동저장 필요.
   lis_s2_support.do      결과 텍스트는 support.csv      로 수동저장 필요.
   lis_s2_unemployment.do 결과 텍스트는 unemployment.csv 로 수동저장 필요.

4. 3.에서 생성한 csv 파일들을 이용해 dta 파일 생성.
    lis_cvsmerge.do 결과 socailisk.dta 파일 생성.
