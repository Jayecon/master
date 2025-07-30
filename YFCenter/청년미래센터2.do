/* 청년미래센터 성과평가 */

cd "D:\_KIHASA\2025\02.[수탁] 청년미래센터 운영지침 개선 및 성과 모니터링 연구\7.성과평가\1.온라인조사\2.데이터"

use "청년미래센터4.dta", clear
  append using "청년미래센터7.dta", force
  append using "청년미래센터0.dta", force
    destring _all, replace
	sort id stm
	  replace stm=4 if stm==5
    encode id, gen(nid)
	order id nid stm, first
	xtset nid stm
	
	order year_t0 year_t0 month_t0 day_t0, after(fndate)
	label var stm "응답월"
	label var std "응답일"
	label var stmd "응답월일"
	label var stdate "응답 시작일시"
	label var fndate "응답 종료일시"
	label var year_t0 "초기상담 연도"
	label var month_t0 "초기상담 월"
	label var day_t0 "초기상담 일"
  save "청년미래센터047.dta", replace

duplicates r nid

tab Q stm
tab A1 stm  // 가족돌봄청년 사업 참여
tab B1 stm  // 고립은둔청년 사업 참여
bysort stm: tab A1 B1
bysort stm: tab A1 B1, nof cell
tab sido stm
tab sido stm if A1=="그렇다, 참여하였다."
tab sido stm if B1=="그렇다, 참여하였다."
