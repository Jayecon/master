cd ~/dropbox

use wdi , clear


separate v1 if v1e1960 , by(kname) gen(tmp) short
ds, has(varl *==*)
local vset = r(varlist)
foreach i of local vset {
    local aaa : var label `i'
    local aaa : subinstr local aaa "kname ==" "", all
    label var `i' "`aaa'"
}

local yl : var label v1
line tmp* year, lwidth(medthick) legend(col(1)) ytitle(`yl')
