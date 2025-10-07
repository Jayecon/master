cd ~/dropbox/data/cohesion

use cohesion , clear
svyset [pw=wpg]

local idvar1 d13
local idvar2 d8
local idvar3 c12_1 c12_2 c12_3 c12_4 
local idvar4 d10_1 d10_2 d10_3 d10_4 c16
local idvar5 d18_1 d18_2 d18_3

local dvar1 e2 e3 
local dvar2 e4_1 e4_2 e4_3 e4_4 e4_5 e4_6 e4_7

global control pa0_sido sq1 sq2_1 a3_1_1 a4 c.f3 


label var e2   "e2.복지확대"
label var e3   "e3.추가징수"
label var e4_1 "e4_1.근로·사업소득세"
label var e4_2 "e4_2.소비세(부가가치세)"
label var e4_3 "e4_3.법인세"
label var e4_4 "e4_4.재산세·종부세"
label var e4_5 "e4_5.상속세·증여세"
label var e4_6 "e4_6.사회보장세"
label var e4_7 "e4_7.탄소세"


foreach i of local dvar1 {
    qui {
        eststo : svy : reg `i' `idvar1' $control
    }
}
esttab , label

foreach i of local dvar2 {
    qui {
        eststo : svy : reg `i' `idvar1' $control
    }
}
esttab , label
