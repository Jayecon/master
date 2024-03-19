/*! PANDAS unmerged dta file에 대한 후처리*/
    //Reshape files to wide
    destring level_1 , replace
    levelsof level_0 , local(list0)
        local fword0 : word 1 of `list0'
        local varmax : word count `list0'
        local varmax = `varmax' -1
        label data "`fword0'"
    drop if level_0 == "`fword0'"
        replace level_0  = subinstr(level_0 , "Unnamed: ", "", .)
        destring level_0  , replace
            reshape wide C , i(level_1) j(level_0)
    egen temp = rowmiss(_all)
        drop if temp == `varmax'
        drop temp
    drop level_1

    // 열의 갯수 확인
    qui ds
        local maxcol : word count `r(varlist)'

    // Header행(누락된 값이 존재하는 행) 확인
    capture gen tag = 1 if strpos(C5 , "대학교")
	 if _rc != 0 {
            gen tag = 1 if strpos(C1 , "대학교")
        }
    capture qui tab tag
        if  r(N) == 0 {
            replace tag = 1 if strpos(C1 , "대학교")
        }
        replace tag = sum(tag)
        qui count if tag == 0
        local maxrow = r(N)
		di `maxrow'
        drop tag
    /*egen rmiss = rowmiss(_all)*/
        /*qui tab rmiss*/
        /*local maxrow = r(r)*/
        /*qui levelsof rmiss , local(temp)*/
        /*foreach i of local temp {*/
            /*qui count if rmiss == `i'*/
            /*if r(N) > 1 {*/
                /*local maxrow = `maxrow' -1*/
            /*}*/
        /*}*/
        /*tab rmiss*/
        /*drop rmiss*/

    // unmerge 과정에서 누락된 값을 이전 열에서 복사하여 채움
    local numhead = `maxrow'
    while `numhead' > 1 {
        forvalue i = 1/`maxcol' {
            forvalue j = 1/`numhead' {
                if C`i'[`j'] == "" {
                    local box = `i' - 1
                    if  C`i'[`numhead'] != "" {
                        local temp C`box'[`j']
                        replace C`i' = `temp' in `j'
                    }
                }
            }
        }
        local numhead = `numhead' -1
    }

    //각 변수로 라벨링
    forvalue i = 1/`maxcol' {
        qui sum C`i'
        local varlabel`i' = C`i'[1]
        forvalue j = 2/`maxrow' {
                if  C`i'[`j'] != "" {
                    qui sum C`i'
                    local temp = C`i'[`j']
                    local varlabel`i' = `"`varlabel`i''_`temp'"'
                }
        }
        qui sum C`i'
        label var C`i' "`varlabel`i''"
    }

    //변수가 잘 붙었는지 체크
    qui ds
    local varlist =  r(varlist)
    foreach i of local varlist {
        local temp : var label `i'
        if "`temp'" == "" {
                di as error "Error: Variable `var' does not have a label."
                exit
        }
    }
    drop in 1/`maxrow'
