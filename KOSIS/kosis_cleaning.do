global path "~/github/master/kosis/"

import delimited $path/kosis_all_panel.csv , clear

drop prd_se
keep if 종류 == "종사자규모별"

ds c1*
local vlist `r(varlist)'
foreach i of local vlist {
    replace `i' = subinstr(`i', "~", "-", .)
    replace `i' = subinstr(`i', " - ", "-", .)
}
ds c2*
local vlist `r(varlist)'
foreach i of local vlist {
    replace `i' = subinstr(`i', "~", "-", .)
    replace `i' = subinstr(`i', " - ", "-", .)
}


tbl_id = DT_215N_D05
tbl_id = DT_21802_D001002
tbl_id = DT_402
tbl_id = DT_D20001

`"DT_1D05000"'장소
`"DT_20402_D000002"'장소
`"DT_20503_D001002"'장소
`"DT_20603_D001002"'성별
`"DT_2071D02"'장소
`"DT_20802N_036"'장소
`"DT_211002_D004"'장소
`"DT_21303_D000005"'장소
`"DT_215N_D05"'규모별 
`"DT_21603_D001002"'장소
`"DT_217003N_D002"'장소
`"DT_21802_D001002"'규모별 
`"DT_402"'규모별 
`"DT_D20001"'규모별 
`"DT_E13"'장소

`"DT_1D05000"'규모별
`"DT_20402_D000002"'성별
`"DT_20503_D001002"'성별
`"DT_20603_D001002"'장소
`"DT_2071D02"'규모별
`"DT_20802N_036"'규모별
`"DT_211002_D004"'규모별
`"DT_21303_D000005"'규모별
`"DT_215N_D05"'장소
`"DT_21603_D001002"'규모별
`"DT_217003N_D002"'규모별
`"DT_21802_D001002"'장소
`"DT_402"'장소
`"DT_D20001"'장소
`"DT_E13"'성별
