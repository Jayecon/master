*******************************************************
* 0. 기본 설정
*******************************************************
tempfile tfile
local first 1

local flist2 ///
    경북_종사자규모별_사업체수_및_종사자수_20260215055156.csv ///
    대구_종사자규모별_사업체수_및_종사자수_20260214182155.cSv ///
    대전_종사자규모별_사업체수_및_종사자수_20260215053541.csv ///
    부산_종사자_규모별_사업체수_및_종사자수_20260214181920.csv ///
    세종_종사규모별_사업체수_및_종사자수_20260215053907.csv ///
    울산_종사자규모별_사업체수_및_종사자수_20260215053721.csv ///
    전북_종사자규모별_사업체수_및_종사자수_20260215054927.csv ///
    제주_종사자규모별_사업체수_및_종사자수_20260215055429.csv ///
    충남_종사자규모별_사업체수_및_종사자수_20260215054727.csv ///
    충북_종사자_규모별_사업체수_및_종사자수_20260215054452.csv

*******************************************************
* 1. 매핑 테이블
*******************************************************

* label_text -> vname
local map_vname ///
    `"id|시군 구군 행정"' ///
    `"year|시점"' ///
    `"cop|사업체"' ///
    `"wop|여성대표자"' ///
    `"emp|종사자수"' ///
    `"mmp|남자종사 남성종사"' ///
    `"fmp|여자종사 여성종사"' ///
    `"tot|합계"'

* size_text -> snum
local map_snum ///
    `"1|1-4"' ///
    `"2|10-19"' ///
    `"3|100-299"' ///
    `"4|1000"' ///
    `"5|20-49"' ///
    `"6|300-499"' ///
    `"7|5-9"' ///
    `"8|50-99"' ///
    `"9|500-999"' ///
    `"10|계"' ///
    `"11|300"'

*******************************************************
* 2. 파일 반복
*******************************************************
foreach l of local flist2 {

    import delimited "$path`l'", clear
    di "loading `l'"

    ds
    local vlist `r(varlist)'

    ***************************************************
    * 2-1. 문자열 정리
    ***************************************************
    foreach v of local vlist {
        replace `v' = subinstr(`v', " ",   "",  .)
        replace `v' = subinstr(`v', "~",   "-", .)
        replace `v' = subinstr(`v', "9명", "9", .)
        replace `v' = subinstr(`v', "0명", "0", .)
        replace `v' = subinstr(`v', "이상", "", .)
    }

    ***************************************************
    * 2-2. 변수명 변경
    ***************************************************
    foreach v of local vlist {

        local size_text  = `v'[1]
        local label_text = `v'[2]

        local vname ""
        local snum  ""

        * ---- vname 결정: 매핑 테이블 ----
        foreach rule of local map_vname {
            gettoken newname keywords : rule, parse("|")
            local keywords = subinstr(`"`keywords'"', "|", "", .)

            foreach kw of local keywords {
                if strpos("`label_text'", "`kw'") {
                    local vname "`newname'"
                    continue, break
                }
            }
            if "`vname'" != "" continue, break
        }

        * ---- snum 결정: 매핑 테이블 ----
        foreach rule of local map_snum {
            gettoken newnum key : rule, parse("|")
            local key = subinstr(`"`key'"', "|", "", .)

            if strpos("`size_text'", "`key'") {
                local snum "`newnum'"
                continue, break
            }
        }

        * 이름이 비어 있으면 건너뜀
        if "`vname'" == "" continue

        rename `v' `vname'`snum'
    }

    order id year, first
    drop in 1/2

    ***************************************************
    * 2-3. 숫자형 변환
    ***************************************************
    destring, replace

    ds, has(type string)
    local vslist `r(varlist)'

    foreach v of local vslist {
        replace `v' = subinstr(`v', ",", "", .)
        replace `v' = subinstr(`v', "-", "", .)
        replace `v' = subinstr(`v', "x", "", .)
        replace `v' = subinstr(`v', "X", "", .)
        destring `v', replace
    }

    ***************************************************
    * 2-4. 지역명 생성
    ***************************************************
    gen ctry = ""

    foreach region in 경북 대구 대전 부산 세종 울산 전북 제주 충남 충북 {
        if strpos("`l'", "`region'") replace ctry = "`region'"
    }

    ***************************************************
    * 2-5. append
    ***************************************************
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
* 3. 마무리
*******************************************************
use `tfile', clear
compress
order _all, alpha
order ctry id year, first
