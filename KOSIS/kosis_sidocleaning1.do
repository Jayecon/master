*******************************************************
* 0. 기본 설정
*******************************************************
tempfile tfile
local first 1

local flist1 ///
    강원_211_DT_211002_D004_20260215054246.csv ///
    경기_210_DT_21002D002_20260215054050.csv ///
    경남_217_DT_217003N_D002_20260215055312.csv ///
    전남_215_DT_215N_D05_20260215055034.csv

foreach k of local flist1 {

    *******************************************************
    * 1. 데이터 불러오기
    *******************************************************
    import delimited "$path`k'", clear varnames(1)
    di as text "loading `k'"

    * 불필요한 자동 생성 변수 제거
    capture drop v?

    *******************************************************
    * 2. 파일별 원본 변수명 매핑
    *******************************************************
    local id_src   ""
    local year_src ""
    local cop_src  ""
    local wop_src  ""
    local emp_src  ""
    local mmp_src  ""
    local fmp_src  ""
    local ctry     ""

    if strpos("`k'", "강원") {
        local id_src   "시군"
        local year_src "시점"
        local cop_src  "사업체개"
        local wop_src  "여성대표자사업체개"
        local emp_src  "종사자명"
        local mmp_src  "남자종사자명"
        local fmp_src  "여자종사자명"
        local ctry     "강원"
    }
    else if strpos("`k'", "경기") {
        local id_src   "시군"
        local year_src "시점"
        local cop_src  "사업체수개"
        local wop_src  "여성대표자사업체수개"
        local emp_src  "종사자수명"
        local mmp_src  "남성종사자수명"
        local fmp_src  "여성종사자수명"
        local ctry     "경기"
    }
    else if strpos("`k'", "경남") {
        local id_src   "행정구역시군별"
        local year_src "시점"
        local cop_src  "사업체수개"
        local wop_src  "여성대표자사업체수개"
        local emp_src  "종사자수명"
        local mmp_src  "남자종사자수명"
        local fmp_src  "여자종사자수명"
        local ctry     "경남"
    }
    else if strpos("`k'", "전남") {
        local id_src   "행정구역시군별"
        local year_src "시점"
        local cop_src  "사업체수개"
        local wop_src  "여성대표자사업체수개"
        local emp_src  "종사자수명"
        local mmp_src  "남자종사자수명"
        local fmp_src  "여자종사자수명"
        local ctry     "전남"
    }

    rename `id_src'   id
    rename `year_src' year
    rename `cop_src'  cop
    rename `wop_src'  wop
    rename `emp_src'  emp
    rename `mmp_src'  mmp
    rename `fmp_src'  fmp
    gen ctry = "`ctry'"

    *******************************************************
    * 3. year 숫자만 추출
    *******************************************************
    capture confirm string variable year
    if !_rc {
        gen year_num = real(regexs(0)) if regexm(year, "[0-9]+")
        drop year
        rename year_num year
    }

    *******************************************************
    * 4. 종사자규모별 정리
    *******************************************************
    * 변수명 불일치 가능성 대비
    capture confirm variable 종사자규모별
    if _rc {
        capture confirm variable 종사자규모
        if !_rc rename 종사자규모 종사자규모별
    }

    replace 종사자규모별 = subinstr(종사자규모별, "~", "-", .)
    replace 종사자규모별 = subinstr(종사자규모별, " ", "", .)
    replace 종사자규모별 = subinstr(종사자규모별, ",", "", .)
    replace 종사자규모별 = subinstr(종사자규모별, "명", "", .)
    replace 종사자규모별 = subinstr(종사자규모별, "이상", "", .)

    capture confirm string variable 종사자규모별
    if !_rc {
        encode 종사자규모별, gen(size_cat)
        drop 종사자규모별
    }
    else {
        capture confirm numeric variable 종사자규모별
        if !_rc rename 종사자규모별 size_cat
    }

    * value label 없으면 새로 생성
    local vallab : value label size_cat
    if "`vallab'" == "" {
        egen size_cat2 = group(size_cat), label
        drop size_cat
        rename size_cat2 size_cat
    }

    *******************************************************
    * 5. 표준 변수 숫자형 변환
    *******************************************************
    foreach var in cop wop emp mmp fmp {
        capture confirm string variable `var'
        if !_rc {
            replace `var' = subinstr(`var', ",", "", .)
            replace `var' = subinstr(`var', "-", "", .)
            replace `var' = subinstr(`var', "x", "", .)
            replace `var' = subinstr(`var', "X", "", .)
            destring `var', replace
        }
    }

    *******************************************************
    * 6. reshape
    *******************************************************
    levelsof size_cat, local(slist)

    foreach i of local slist {
        local slb`i' : label size_cat `i'
    }

    local vlist cop wop emp mmp fmp
    foreach v of local vlist {
        local vlb`v' : variable label `v'
    }

    reshape wide `vlist', i(id year) j(size_cat)

    foreach v of local vlist {
        foreach s of local slist {
            label var `v'`s' "`vlb`v''_`slb`s''"
        }
    }

    *******************************************************
    * 7. reshape 후 string 정리
    *******************************************************
    ds, has(type string)
    local vslist `r(varlist)'

    foreach v of local vslist {
        replace `v' = subinstr(`v', ",", "", .)
        replace `v' = subinstr(`v', "-", "", .)
        replace `v' = subinstr(`v', "x", "", .)
        replace `v' = subinstr(`v', "X", "", .)
        capture destring `v', replace
    }

    *******************************************************
    * 8. all-missing 변수 제거
    *******************************************************
    foreach v of varlist _all {
        capture assert missing(`v')
        if !_rc drop `v'
    }

    *******************************************************
    * 9. 정렬 및 append
    *******************************************************
    compress
    order _all, alpha
    order ctry id year, first

    if `first' {
        save `tfile', replace
        local first 0
    }
    else {
        append using `tfile'
        save `tfile', replace
    }
}

*******************************************************
* 10. 최종 불러오기
*******************************************************
use `tfile', clear
compress
order _all, alpha
order ctry id year, first
