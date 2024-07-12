*GOMS_eqn1.do GOMS_eqn2.do 를 실행하여 goms_eq.dta 가 만들어진 후에 실행

set more off

use ~/dropbox/data/goms/goms_eq.dta , clear

    tempvar one gr
    tempfile tfile1 tfile2

    gen `one' = 1
    gen `gr' = p034 if p034 <= 8

    preserve

        forvalue j=2001/2015 {
            keep if f011 == `j'

            levelsof `gr', local(grlevels)
            local grcount : word count `grlevels'
            local grmid = `grcount' - 1

            qui sum `one' [aw=wt] if !missing(`gr')
            scalar totnum = r(sum_w)

            local grlist ""
            foreach i of local grlevels {
                sum `one' [aw=wt] if !missing(`gr') & `gr' <= `i' , meanonly
                scalar gr`i' = (r(sum_w)*100)/totnum
                if gr`i' != 100 {
                    local grlist `grlist' `=gr`i''
                }
            }

            scalar pctile0 = 0
            scalar pctile`grcount' = 9999999
            _pctile a121 , p(`grlist')
            forvalue i = 1/`grmid' {
                scalar pctile`i' = r(r`i')
            }
            gen a121_p034 = .
            foreach i of local grlevels {
                local im = `i' - 1
                replace a121_p034 = `i' if inrange(a121 , pctile`im' , pctile`i')
            }

            keep pid year a121_p034
            if `j' != 2001 {
                append using `tfile1'
            }
            save `tfile1' , replace
            restore, preserve
        }

    merge 1:1 pid year using `tfile1'
    drop _*
    label var a121_p034 "Group of a121 by p034 in f011"

save ~/dropbox/data/goms/goms_igm.dta , replace
save ~/Dropbox/HL_SJHO/GOMS_IGM/goms_igm.dta , replace
