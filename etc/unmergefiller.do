// 데이터셋에 대한 정보 수집
ds
local maxcol : word count `r(varlist)'
di "`maxcol'"

// 각 행별로 누락된 값 확인
egen rmiss = rowmiss(_all)
qui tab rmiss
local maxrow = r(r) - 1 // r(r)은 누락된 값이 있는 행의 개수이므로 1을 빼서 올바른 행 개수를 얻습니다.
di "`maxrow'"

// 누락된 값을 이전 열에서 복사하여 채움
forvalue i = 1/`maxcol' {
    forvalue j = 1/`maxrow' {
        if C`i'[`j'] == "" {
            local box = `i' - 1
            if  C`i'[`maxrow'] != "" { 
                local temp C`box'[`j']
                replace C`i' = `temp' in `j' 
            }
        }
    }
}

