*******************************************************
* 0. 기본 설정
*******************************************************
tempfile tfile
local first 1

local flist3 ///
    광주_종사자규모별_사업체수_및_종사자수_20260215053330.csv ///
    서울_사업체현황_종사자규모별_동별__20260215055736.csv ///
    인천_종사자_규모별_사업체수_및_종사자수_20260214182327.csv

*******************************************************
* 1. 매핑 테이블
*******************************************************

* label_text 단독 매핑
local map_label ///
    `"id|시군 구군 군구 행정 동별"' ///
    `"year|시점"' ///
    `"tot|합계"'

* label_text + sub_text 조건 매핑
local map_pair ///
    `"사업체|여성대표|wop"' ///
    `"사업체|남성대표|mop"' ///
    `"사업체||cop"' ///
    `"종사자수|남|mmp"' ///
    `"종사자수|여|fmp"' ///
    `"종사자수||emp"'

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

* 지역명 목록
local regions "광주 서울 인천"

*******************************************************
* 2. 파일 반복
*******************************************************
foreach l of local flist3 {

    import delimited "$path`l'", clear
    di as text "loading `l'"

    * 서울 파일 예외 처리
    if strpos("`l'", "서울") {
        capture drop v1
    }

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
        local sub_text   = `v'[3]

        local vname ""
        local snum  ""

        * ---- 1단계: label_text 단독 매핑 ----
        foreach rule of local map_label {
            gettoken newname rest : rule, parse("|")
            local rest = subinstr(`"`rest'"', "|", "", .)

            foreach kw of local rest {
                if strpos("`label_text'", "`kw'") {
                    local vname "`newname'"
                    continue, break
                }
            }
            if "`vname'" != "" continue, break
        }

        * ---- 2단계: label_text + sub_text 조합 매핑 ----
        if "`vname'" == "" {
            foreach rule of local map_pair {
                gettoken labelkey rest : rule, parse("|")
                local rest = subinstr(`"`rest'"', "|", "", 1)

                gettoken subkey newname : rest, parse("|")
                local newname = subinstr(`"`newname'"', "|", "", 1)

                if strpos("`label_text'", "`labelkey'") {
                    if "`subkey'" == "" {
                        local vname "`newname'"
                        continue, break
                    }
                    else if strpos("`sub_text'", "`subkey'") {
                        local vname "`newname'"
                        continue, break
                    }
                }
            }
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

        * 이름이 비어 있으면 rename 생략
        if "`vname'" == "" continue

        rename `v' `vname'`snum'
    }

    order id year, first
    drop in 1/3

    ***************************************************
    * 2-3. 문자열 숫자형 변환
    ***************************************************
    capture destring, replace

    ds, has(type string)
    local vslist `r(varlist)'

    foreach v of local vslist {
        replace `v' = subinstr(`v', ",", "", .)
        replace `v' = subinstr(`v', "-", "", .)
        replace `v' = subinstr(`v', "x", "", .)
        replace `v' = subinstr(`v', "X", "", .)
        capture destring `v', replace
    }

    ***************************************************
    * 2-4. 지역명 생성
    ***************************************************
    gen ctry = ""
    foreach r of local regions {
        if strpos("`l'", "`r'") replace ctry = "`r'"
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
