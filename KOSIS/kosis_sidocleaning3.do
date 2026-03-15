*******************************************************
* 0. 기본 설정
*******************************************************
/*pause on*/
tempfile tfile

local flist3 광주_종사자규모별_사업체수_및_종사자수_20260215053330.csv ///
    서울_사업체현황_종사자규모별_동별__20260215055736.csv ///
        인천_종사자_규모별_사업체수_및_종사자수_20260214182327.csv 
foreach l of local flist3 {
	import delimited $path`l',clear
    di "loading `l'"
    if strpos("`l'","서울"){
        drop v1
    }
    ds
    local vlist `r(varlist)'
    foreach i of local vlist {
        replace `i' = subinstr(`i' , " " , "" , .)
        replace `i' = subinstr(`i' , "~" , "-" , .)
        replace `i' = subinstr(`i' , "9명" , "9" , .)
        replace `i' = subinstr(`i' , "0명" , "0" , .)
        replace `i' = subinstr(`i' , "이상" , "" , .)
    }
    foreach i of local vlist {
        local k `i'[1]
        local j `i'[2]
        local m `i'[3]
        if strpos(`j',"시군"){
            local vname id
        }
        if strpos(`j',"구군"){
            local vname id
        }
        if strpos(`j',"군구"){
            local vname id
        }
        if strpos(`j',"행정"){
            local vname id
        }
        if strpos(`j',"동별"){
            local vname id
        }
        if strpos(`j',"시점"){
            local vname year
        }
        if strpos(`j',"사업체"){
            if strpos(`m',"여성대표"){
                local vname wop
            }
            else if strpos(`m',"남성대표"){
                local vname mop
            }
            else{
                local vname cop
            }
        }
        if strpos(`j',"종사자수"){
            if strpos(`m',"남"){
                local vname mmp
            }
            else if strpos(`m',"여"){
                local vname fmp
            }
            else {
                local vname emp
            }
        }
        if strpos(`j',"합계"){
            local vname tot
        }
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
        else {
            local snum
        }
        rename `i' `vname'`snum'
    }
    order id year ,first
    drop in 1/3
    destring , replace
    ds , has(type string)
    local vslist `r(varlist)'
    foreach i of local vslist {
        replace `i' = subinstr(`i', ",", "", .)
        replace `i' = subinstr(`i', "-", "", .)
        replace `i' = subinstr(`i', "x", "", .)
        replace `i' = subinstr(`i', "X", "", .)
        destring `i', replace
    }
    if strpos("`l'","광주"){
        gen ctry = "광주"
    }
    else if strpos("`l'","서울"){
        gen ctry = "서울"
    }
    else if strpos("`l'","인천"){
        gen ctry = "인천"
    }
    if "`l'" == "광주_종사자규모별_사업체수_및_종사자수_20260215053330.csv" {
        save `tfile'
    }
    else {
        append using `tfile'
        save `tfile' , replace
    }
}

compress
order _all , alpha
order ctry id year , first
