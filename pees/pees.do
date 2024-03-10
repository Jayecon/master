pause off
cd ~/dropbox/pees
tempfile temp
    /*Gen pees_c.dta{{{*/
        local varrenamec area region school grade totexp sex childnum ///
            childord score agepap edupap agemom edumom jobstat income wt
        use rawdata/2019_c
            keep v1 v2 v3 v4 v10 v11 v13 v15 v17 v19 v21 v23 v24 v25 v26 v29
            rename (v1-v29) (`varrenamec')
            gen year = 2019
            save `temp' , replace
        use rawdata/2020_c
            keep v1-v4 v7-v17 v20
            rename (v1-v20) (`varrenamec')
            gen year = 2020
            append using `temp' 
            save `temp' , replace
        use rawdata/2021_c
            keep v1-v4 v10 v11 v13 v15 v17-v23 v26 
            rename (v1-v26) (`varrenamec')
            gen year = 2021
            append using `temp' 
            save `temp' , replace
        merge m:m region year using rawdata/corona.dta , nogen
            drop if region == 99
            drop if year == 2022
            foreach i of var confirmed-hdeath {
                replace `i' = 0  if year == 2019
            }
        merge m:m region year using rawdata/pisummary.dta , nogen
        merge m:m region year using rawdata/rgnpop.dta , nogen
        label var year "조사년도"
        gen pinumpop = pinum / totpop * 100000
            label var pinumpop "지역별학원수(십만명)"
        gen insnumpop = insnum / totpop * 100000
            label var insnumpop "지역별강사수(십만명)"
        /*물가지수 반영*/
        local explist totexp 
        foreach i of local explist { 
            replace `i' = (`i'/99.5)*100 if year == 2019
            replace `i' = (`i'/100)*100 if year == 2020
            replace `i' = (`i'/102.5)*100 if year == 2021
        }
        save pees_c.dta , replace
    /*}}}*/
    /*Gen pees_a.dta{{{*/
        local varrenamea area region school ebsbook tothour genrsn1 genrsn2 ///
            genhour axrsn1 axrsn2 axhour jobhour totexp genexp korexp engexp ///
            matexp sciexp wrtexp comexp etcexp idvexp grpexp istexp visexp netexp /// 
            sex childnum childord score agepap edupap agemom edumom jobstat income wt
        use rawdata/2019_a
            keep v1-v3 v5 v7 v9 v10 v12 v14 v16 v18 v20 v21 v23-v35 v49-v58 v61
            rename (v1-v61) (`varrenamea')
            gen year = 2019
            save `temp' , replace
        use rawdata/2020_a
            keep v1-v26 v40-v49 v52
            rename (v1-v52) (`varrenamea')
            gen year = 2020
            append using `temp' 
            save `temp' , replace
        use rawdata/2021_a
            keep v1-v3 v5 v7 v9 v10 v12 v14 v16-v32 v46-v55 v58
            rename (v1-v58) (`varrenamea')
            gen year = 2021
            append using `temp' 
            save `temp' , replace
        merge m:m region year using rawdata/corona.dta , nogen
            drop if region == 99
            drop if year == 2022
            foreach i of var confirmed-hdeath {
                replace `i' = 0  if year == 2019
            }
        merge m:m region year using rawdata/pisummary.dta , nogen
        merge m:m region year using rawdata/rgnpop.dta , nogen
        label var year "조사년도"
        gen pinumpop = pinum / totpop * 100000
            label var pinumpop "지역별학원수(십만명)"
        gen insnumpop = insnum / totpop * 100000
            label var insnumpop "지역별강사수(십만명)"
        /*물가지수 반영*/
        local explist totexp genexp korexp engexp matexp sciexp wrtexp comexp ///
            etcexp idvexp grpexp istexp visexp netexp
        foreach i of local explist { 
            replace `i' = (`i'/99.5)*100 if year == 2019
            replace `i' = (`i'/100)*100 if year == 2020
            replace `i' = (`i'/102.5)*100 if year == 2021
        }
        save pees_a.dta , replace
    /*}}}*/
