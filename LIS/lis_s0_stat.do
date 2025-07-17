    /*호출변수 목록 생성*/
    local datalist fr se kr jp uk us

    /*qui {*/
        foreach k of local datalist {
            /*가구자료호출*/
                use $`k'20h, clear
            /*변수조작*/
                /*변수 생성*/
                    gen min     = hitotal - hpublic
                        label var min "Market Income"
                    gen pwgt    = hpopwgt * nhhmem
                        label var pwgt "Weight" 
                    gen nhhmem1864 = nhhmem - nhhmem65 - nhhmem17
                        label var nhhmem1864 "Number of Household member, age 18-64"
                    gen tax = hxitax + hxptax + hxotax
                        label var tax "Household Tax"
                /*변수 생성 : 균등화 소득*/
                    gen ehhmen    = sqrt(nhhmem)
                    gen emin      = min / ehhmen
                        label var emin "Equiv. Market Income"
            /*가구통계량 생성*/
                local hlist dhi min hitotal hpublic htax xitax hxptax hxotax hxscont ///
                    hipension hi31 hi32 hipubsoc dhi ///
                    pwgt nhhmem1864 nhhmem nhhmem65 nhhmem17 
                foreach i of local hlist {
                    qui summarize `i' 
                    local `k'`i'N    = r(N)
                    local `k'`i'mean = r(mean)
                    local `k'`i'sd   = r(sd)
                    local `k'`i'min  = r(min)
                    local `k'`i'max  = r(max)
                }
                local `k'cname = cname[1]
                local `k'currency = currency[1]
            /*개인자료결합*/
                merge 1:m hid using $`k'20p, nogen 
            /*개인통계량 생성*/
                local plist pitotal pxitax pxscont ///
                    pipension pi31 pi32 ///
                    ppopwgt disabled age
                foreach i of local plist {
                    qui summarize `i' 
                    local `k'`i'N    = r(N)
                    local `k'`i'mean = r(mean)
                    local `k'`i'sd   = r(sd)
                    local `k'`i'min  = r(min)
                    local `k'`i'max  = r(max)
                }
        }
    /*}*/

    /*결과 출력*/
        foreach k of local datalist {
            if "`k'" == "fr" {
                di as text "cname,currency,varname,N,mean,sd,min,max"
            }
            foreach i of local hlist {
                di as text "``k'cname',``k'currency',`i',``k'`i'N',``k'`i'mean',``k'`i'sd',``k'`i'min',``k'`i'max'"
            }
            foreach i of local plist {
                di as text "``k'cname',``k'currency',`i',``k'`i'N',``k'`i'mean',``k'`i'sd',``k'`i'min',``k'`i'max'"
            }
        }
