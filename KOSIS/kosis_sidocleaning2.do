*******************************************************
* 0. 기본 설정
*******************************************************
/*pause on*/
tempfile tfile
local ff = 1

local flist2 경북_종사자규모별_사업체수_및_종사자수_20260215055156.csv ///
            대구_종사자규모별_사업체수_및_종사자수_20260214182155.cSv ///
            대전_종사자규모별_사업체수_및_종사자수_20260215053541.csv ///
            부산_종사자_규모별_사업체수_및_종사자수_20260214181920.csv ///
            세종_종사규모별_사업체수_및_종사자수_20260215053907.csv ///
            울산_종사자규모별_사업체수_및_종사자수_20260215053721.csv ///
            전북_종사자규모별_사업체수_및_종사자수_20260215054927.csv ///
            제주_종사자규모별_사업체수_및_종사자수_20260215055429.csv ///
            충남_종사자규모별_사업체수_및_종사자수_20260215054727.csv ///
            충북_종사자_규모별_사업체수_및_종사자수_20260215054452.csv

foreach l of local flist2 {
    import delimited $path`l', clear
    di "loading `l'"
    ds
    local vlist `r(varlist)'
    foreach i of local vlist {
        replace `i' = subinstr(`i' , " " , "" , .)
        replace `i' = subinstr(`i' , "..." , "" , .)
        replace `i' = subinstr(`i' , "~" , "-" , .)
        replace `i' = subinstr(`i' , "9명" , "9" , .)
        replace `i' = subinstr(`i' , "0명" , "0" , .)
        replace `i' = subinstr(`i' , "이상" , "" , .)
    }

    foreach i of local vlist {
        local k `i'[1]
        local j `i'[2]
        local snum
        *vname 확정
        if strpos(`j',"시군"){
            local vname id
        }
        if strpos(`j',"구군"){
            local vname id
        }
        if strpos(`j',"행정"){
            local vname id
        }
        if strpos(`j',"시점"){
            local vname year
        }
        if strpos(`j',"사업체"){
            local vname cop
        }
        if strpos(`j',"여성대표자"){
            local vname wop
            local snum 10
        }
        if strpos(`j',"종사자수"){
            local vname emp
        }
        if strpos(`j',"남자종사"){
            local vname mmp
        }
        if strpos(`j',"남성종사"){
            local vname mmp
        }
        if strpos(`j',"여자종사"){
            local vname fmp
        }
        if strpos(`j',"여성종사"){
            local vname fmp
        }
        if strpos(`j',"소계"){
            if strpos(`k',"사업체"){
                local vname cop
                local snum 10
            }
            if strpos(`k',"종사자"){
                local vname emp
                local snum 10
            }
        }
        if strpos(`j',"남"){
            if strpos(`k',"종사자"){
                local vname mmp
                local snum 10
            }
        }
        if strpos(`j',"여"){
            if strpos(`k',"종사자"){
                local vname fmp
                local snum 10
            }
        }
        if strpos(`j',"합계"){
            local vname tot
        }
		* snum 확정
       if strpos(`k',"1-4") {
            local snum 1
        }
        else if strpos(`k',"10-19"){
            local snum 2
        }
        else if strpos(`k',"100-299"){
            local snum 3
        }
        else if strpos(`k',"1000"){
            local snum 4
        }
        else if strpos(`k',"20-49"){
            local snum 5
        }
        else if strpos(`k',"300-499"){
            local snum 6
        }
        else if strpos(`k',"5-9"){
            local snum 7
        }
        else if strpos(`k',"50-99"){
            local snum 8
        }
        else if strpos(`k',"500-999"){
            local snum 9
        }
        else if strpos(`k',"계"){
            local snum 10
        }
        else if strpos(`k',"300"){
            local snum 11
        }
        else if "`snum'" == "" {
            local snum
        }
		* vname snum 조합으로 rename
       rename `i' `vname'`snum'
    }
    ds , has(type string)
    local vslist `r(varlist)'
    foreach i of local vslist {
        replace `i' = subinstr(`i', ",", "", .)
        replace `i' = subinstr(`i', "-", "", .)
        replace `i' = subinstr(`i', "x", "", .)
        replace `i' = subinstr(`i', "X", "", .)
        destring `i', replace
    }
    if strpos("`l'","경북"){
        gen ctry = "경북"
    }
    else if strpos("`l'","대구"){
        gen ctry = "대구"
    }
    else if strpos("`l'","대전"){
        gen ctry = "대전"
    }
    else if strpos("`l'","부산"){
        gen ctry = "부산"
    }
    else if strpos("`l'","세종"){
        gen ctry = "세종"
    }
    else if strpos("`l'","울산"){
        gen ctry = "울산"
    }
    else if strpos("`l'","전북"){
        gen ctry = "전북"
    }
    else if strpos("`l'","제주"){
        gen ctry = "제주"
    }
    else if strpos("`l'","충남"){
        gen ctry = "충남"
    }
    else if strpos("`l'","충북"){
        gen ctry = "충북"
    }
    order _all ,alpha
    order ctry id year ,first
    drop in 1/2
    destring , replace
    if `ff' == 1 {
        save `tfile'
        local ff = 0
    }
    else {
        append using `tfile'
        save `tfile' , replace
    }
    pause
}

compress
order _all , alpha
order ctry id year , first
