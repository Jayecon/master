*******************************************************
* 0. 기본 설정
*******************************************************
tempfile tfile
local flist1 101_DT_1IN1503_20260413151129.csv ///
    *******************************************************
    * 1. 데이터 불러오기
    *******************************************************
foreach k of local flist1 {
    import delimited $path`k', ///
        clear varnames(1) encoding()
    di "loading `k'"

    *******************************************************
    * 2. Id = 시군, year = 시점
    *******************************************************
    drop v*
 
    if "`k'" == "101_DT_1IN1503_20260413151129.csv"{
        drop v* *rse

        rename 행정구역별읍 id
        rename 연령별       age
        rename 시점         year
        rename 총인구명     totpop
        rename 내국인명     natpop
        label var  id     "행정구역별(읍면동)"
        label var  age    "연령별"
        label var  year   "시점"
        label var  totpop "총인구(명)"
        label var  natpop "내국인(명)"

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
        else if inrange(`j' , 3 , 16) {
            replace ctry = "`cname'" in `numb'/`nume'
            local numb = `num'
        }
        else {
            replace ctry = "`pname'" in `numb'/l
        }
    }
    drop t?
    foreach i of local sidolist {
        drop if id == "`i'"
    }

    reshape wide totpop natpop , i(ctry id year) j(age)
    *******************************************************
    * 6. 확인
    *******************************************************
    compress
    describe
    label list
    tab size_cat
