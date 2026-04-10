*******************************************************
* 0. 기본 설정
*******************************************************
tempfile tfile
local flist1 101_DT_1ES3A01S_20260408165543.csv ///
        101_DT_1ES3C01S_20260408165459.csv

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
    drop v* *rse
    
    if "`k'" == "101_DT_1ES3A01S_20260408165543.csv"{
        drop v* *rse
        rename 행정구역별      id
        rename 시점            year
        rename 세이상인구천명  pop15u
        rename 경제활동인구    ecnpop
        rename 취업자천명      emppop
        rename 실업자천명      umppop
        rename 비경제활동인    necpop
        rename 경제활동참가율  ptcrat
        rename 고용률          emprat
        rename 세고용률        corrat
        rename 실업률          umprat

        gen qt = ""
            replace qt = "q1" if strpos(year,"1/2")
            replace qt = "q2" if strpos(year,"2/2")
            replace year = subinstr(year , ".1/2", "", .)
            replace year = subinstr(year , ".2/2", "", .)


        gen ctry = ""
            replace ctry = "서울특별시" if strpos(id,"서울")
            replace ctry = "부산광역시" if strpos(id,"부산")
            replace ctry = "대구광역시" if strpos(id,"대구")
            replace ctry = "인천광역시" if strpos(id,"인천")
            replace ctry = "대전광역시" if strpos(id,"대전")
            replace ctry = "울산광역시" if strpos(id,"울산")
            replace ctry = "광주광역시" if strpos(id,"광주")
            replace ctry = "경기도" in 767/1573
            replace ctry = "강원도" in 1574/2041
            replace ctry = "충청북도" in 2042/2337
            replace ctry = "충청남도" in 2338/2742
            replace ctry = "전라북도" in 2743/3106
            replace ctry = "전라남도" in 3107/3678
            replace ctry = "경상북도" in 3679/4250
            replace ctry = "경상남도" in 4251/4718
            replace ctry = "제주도" in 4719/l

        replace id = subinstr(id, "서울 ", "", .)
        replace id = subinstr(id, "부산 ", "", .)
        replace id = subinstr(id, "대구 ", "", .)
        replace id = subinstr(id, "인천 ", "", .)
        replace id = subinstr(id, "대전 ", "", .)
        replace id = subinstr(id, "울산 ", "", .)
        replace id = subinstr(id, "광주 ", "", .)

        destring year , replace
        reshape wide pop15u-umprat , i(ctry id year) j(qt) string
            egen pop15u = rowmean(pop15u??)
            egen ecnpop = rowmean(ecnpop??)
            egen emppop = rowmean(emppop??)
            egen umppop = rowmean(umppop??)
            egen necpop = rowmean(necpop??)
            egen ptcrat = rowmean(ptcrat??)
            egen emprat = rowmean(emprat??)
            egen corrat = rowmean(corrat??)
            egen umprat = rowmean(umprat??)
            drop pop15u?? ecnpop?? emppop?? umppop?? necpop?? ptcrat?? emprat?? corrat?? umprat??
            label var pop15u "15세이상인구 (천명)"
            label var ecnpop "경제활동인구 (천명)"
            label var emppop "취업자 (천명)"
            label var umppop "실업자 (천명)"
            label var necpop "비경제활동인구 (천명)"
            label var ptcrat "경제활동참가율 (％)"
            label var emprat "고용률 (%)"
            label var corrat "15~64세 고용률 (%)"
            label var umprat "실업률 (％)"
    }
    else if "`k'" == " 101_DT_1ES3C01S_20260408165459.csv" {
        drop v?
        rename 행정구역별     id
        rename 시점           year
        rename 취업자천명     emppop
        rename 성별남자       empmal
        rename 성별여자       empfml
        rename 연령별1529세   emp29u
        rename 연령별3049세   emp49u
        rename 연령별50세이상 emp50v
    }

    *******************************************************
    * 4. 종사자규모별 → numeric category + value label
    *******************************************************

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
    order _all ,alpha
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
    foreach v of varlist _all {
        capture assert missing(`v')
        if !_rc drop `v'
    }
}
