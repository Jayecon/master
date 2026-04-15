*******************************************************
* 1. 데이터 불러오기
*******************************************************
import delimited "~/dropbox/data/kosis/101_DT_1IN1503_20260413151129.csv", clear varnames(1)

*******************************************************
* 2. Id = 시군, year = 시점
*******************************************************
drop v*

rename 행정구역별읍 id
rename 연령별       age
rename 시점         year
rename 총인구명     totpop
rename 내국인명     natpop

replace year = subinstr(year, " 년", "", .)
replace age = subinstr(age, "세", "", .)
replace totpop = subinstr(totpop, "X", "", .)
replace natpop = subinstr(natpop, "X", "", .)
destring age year totpop natpop, replace
drop if inlist(id, "전국", "읍부", "면부", "동부")

local sidolist 서울특별시 부산광역시 대구광역시 인천광역시 광주광역시 대전광역시 ///
    울산광역시 세종특별자치시 경기도 강원특별자치도 충청북도 충청남도 ///
    전북특별자치도 전라남도 경상북도 경상남도 제주특별자치도
local wnum : word count of `sidolist'
gen ctry = ""
gen t1 = _n
bys id :gen t2 = year == 2017 & age == 0
sort t1

forvalue j = 2/`wnum' {
    local cnum = `j' - 1
    local cname : word `cnum' of `sidolist'
    local pname : word `j' of `sidolist'
    levelsof t1 if t2 == 1 & id == "`pname'" , local(num)
    local nume = `num' -1
        if `j' == 2 {
            replace ctry = "`cname'" in 1/`nume'
            local numb = `num'
        }
        else if inrange(`j' , 3 , 17) {
            replace ctry = "`cname'" in `numb'/`nume'
            local numb = `num'
        }
        else {
            replace ctry = "`cname'" in `numb'/l
        }
}
drop t?
foreach i of local sidolist {
    drop if id == "`i'"
}

reshape wide totpop natpop , i(ctry id year) j(age)
    forvalue i = 1/9{
        rename totpop`i' totpop0`i'
        rename natpop`i' natpop0`i'
    }
    order _all , alpha
    egen tp0099 = rowtotal(totpop*)
    egen np0099 = rowtotal(natpop*)
    egen tp1865 = rowtotal(totpop18-totpop65)
    egen np1865 = rowtotal(natpop18-natpop65)

    label var  ctry   "행정구역(시도)" 
    label var  id     "행정구역(시군구)" 
    label var  year   "시점"           
    label var  tp0099 "총인구(명)"         
    label var  np0099 "내국인(명)"
    label var  tp1865 "총인구18-65세(명)"         
    label var  np1865 "내국인18-65세(명)"

*******************************************************
* 6. 확인
*******************************************************
drop totpop* natpop*
label data "통계청_주민등록인구현황_행정구역(시군구)별/1세별 주민등록인구"
compress
describe

