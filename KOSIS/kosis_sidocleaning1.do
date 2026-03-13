*******************************************************
* 0. 기본 설정
*******************************************************
global	path ~/dropbox
tempfile tfile
cd "$path"
local flist1 강원_211_DT_211002_D004_20260215054246.csv 경기_210_DT_21002D002_20260215054050.csv 경남_217_DT_217003N_D002_20260215055312.csv 전남_215_DT_215N_D05_20260215055034.csv

    *******************************************************
    * 1. 데이터 불러오기
    *******************************************************
foreach k of local flist1 {
    import delimited "`k'", ///
        clear varnames(1) encoding()
    di "loading `k'"
    *******************************************************
    * 2. Id = 시군, year = 시점
    *******************************************************
    drop v?
    if "`k'" == "강원_211_DT_211002_D004_20260215054246.csv"{
        rename 시군               id
        rename 시점               year
        rename 사업체개           cop
        rename 여성대표자사업체개 wop
        rename 종사자명           emp
        rename 남자종사자명       mmp
        rename 여자종사자명       fmp
        gen ctry = "강원"
    }
    else if "`k'" == "경기_210_DT_21002D002_20260215054050.csv" {
        rename 시군                 id
        rename 시점                 year
        rename 사업체수개           cop
        rename 여성대표자사업체수개 wop
        rename 종사자수명           emp
        rename 남성종사자수명       mmp
        rename 여성종사자수명       fmp
        gen ctry = "경기"
    }
    else if "`k'" == "경남_217_DT_217003N_D002_20260215055312.csv" {
        rename 행정구역시군별       id
        rename 시점                 year
        rename 사업체수개           cop
        rename 여성대표자사업체수개 wop
        rename 종사자수명           emp
        rename 남자종사자수명       mmp
        rename 여자종사자수명       fmp
        gen ctry = "경남"
    }
    else if "`k'" == "전남_215_DT_215N_D05_20260215055034.csv"{
        rename 행정구역시군별       id
        rename 시점                 year
        rename 사업체수개           cop
        rename 여성대표자사업체수개 wop
        rename 종사자수명           emp
        rename 남자종사자수명       mmp
        rename 여자종사자수명       fmp
        gen ctry = "전남"
    }
    *******************************************************
    * 3. year 숫자만 추출
    *******************************************************
    capture confirm string variable year
    if _rc == 0 {
        gen year_num = real(regexs(0)) if regexm(year, "[0-9]+")
        drop year    
        rename year_num year
    }
    *******************************************************
    * 4. 종사자규모별 → numeric category + value label
    *******************************************************
    sort 종사자규모
    replace 종사자규모별 = subinstr(종사자규모별 , "~", "-", .)
    replace 종사자규모별 = subinstr(종사자규모별 , " ", "", .)
    replace 종사자규모별 = subinstr(종사자규모별 , ",", "", .)
    replace 종사자규모별 = subinstr(종사자규모별 , "명", "", .)
    replace 종사자규모별 = subinstr(종사자규모별 , "이상", "", .)

    * 문자열일 경우 encode (자동으로 value label 생성)
    capture confirm string variable 종사자규모별
    if _rc == 0 {
        encode 종사자규모별, gen(size_cat)
        drop 종사자규모별
        rename size_cat size_cat
    }

    * 이미 numeric인 경우 value label이 없으면 새로 생성
    capture confirm numeric variable size_cat
    if _rc != 0 {
        capture confirm numeric variable 종사자규모별
        if _rc == 0 {
            rename 종사자규모별 size_cat
        }
    }

    * value label이 없는 경우 원래 문자열 기준으로 재생성
    capture label list size_cat
    if _rc != 0 {
        * 기존 문자열이 있었다고 가정한 재코딩 예시
        egen size_cat2 = group(size_cat), label
        drop size_cat
        rename size_cat2 size_cat
    }

    ********************************************************
    * 5. 사업체수, 종사자수 numeric 변환
    *******************************************************
    * 쉼표 제거 후 숫자화
    foreach var in 사업체개 종사자명 {
        capture confirm string variable `var'
        if _rc == 0 {
            replace `var' = subinstr(`var', ",", "", .)
            replace `var' = subinstr(`var', "-", "", .)
            replace `var' = subinstr(`var', "x", "", .)
            destring `var', replace
        }
    }

    *******************************************************
    * 6. 확인
    *******************************************************
    compress
    describe
    label list
    tab size_cat

    *******************************************************
    * 7. reshape
    *******************************************************
    levelsof size_cat , local(slist)
    foreach i of local slist {
        local slb`i' : label size_cat `i'
    }
    local vlist cop wop emp mmp fmp 
    foreach i of local vlist {
        local vlb`i' : var label `i'
    }
    reshape wide `vlist' , i(id year) j(size_cat)
    foreach i of local vlist {
        foreach j of local slist {
            label var `i'`j' "`vlb`i''_`slb`j''"
        }
    }
    order ctry id year ,first
    destring cop1-fmp10 , replace
    ds , has(type string)
    local vslist `r(varlist)'
    foreach i of local vslist {
        replace `i' = subinstr(`i', ",", "", .)
        replace `i' = subinstr(`i', "-", "", .)
        replace `i' = subinstr(`i', "x", "", .)
        replace `i' = subinstr(`i', "X", "", .)
        destring `i', replace
        }
    if "`k'" == "강원_211_DT_211002_D004_20260215054246.csv" {
        save `tfile'
    }
    else {
        append using `tfile'
        save `tfile' , replace
    }
}

