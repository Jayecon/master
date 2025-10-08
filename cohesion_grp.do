cd ~/dropbox/data/cohesion

use cohesion , clear
    label var e2   "e2.복지확대"
    label var e3   "e3.추가징수"
    label var e4_1 "e4_1.근로·사업소득세"
    label var e4_2 "e4_2.소비세(부가가치세)"
    label var e4_3 "e4_3.법인세"
    label var e4_4 "e4_4.재산세·종부세"
    label var e4_5 "e4_5.상속세·증여세"
    label var e4_6 "e4_6.사회보장세"
    label var e4_7 "e4_7.탄소세"

svyset [pw=wpg]

local idvar1 d13 d8
local idvar2 c12_1 c12_2 c12_3 c12_4 
local idvar3 d10_1 d10_2 d10_3 d10_4 c16
local idvar4 d18_1 d18_2 d18_3

local dvar1 e2 e3 
local dvar2 e4_1 e4_2 e4_3 e4_4 e4_5 e4_6 e4_7

global ctrl    i.pa0_sido i.sq1 c.sq2_1 i.a3_1_1 i.a4 c.f3 i.a3_2
global ctrlage i.pa0_sido i.sq1         i.a3_1_1 i.a4 c.f3 i.a3_2 
global ctrlrgn            i.sq1 c.sq2_1 i.a3_1_1 i.a4 c.f3 i.a3_2
global myesttab esttab , r2 label interaction(" X ") indicate(통제 = *pa0_sido* *sq1* *sq2_1* *a3* *a4* *f3*)

eststo clear
foreach j of local idvar1 {
    foreach i of local dvar1 {
        eststo : qui  svy :  reg `i' `j' $ctrl 
    }
}
$myesttab

eststo clear
foreach i of local dvar2 {
        eststo : qui svy : reg `i' d13 $ctrl
}
$myesttab

eststo clear
foreach i of local dvar2 {
        eststo : qui svy : reg `i' d8 $ctrl
}
$myesttab

eststo clear
foreach j of local idvar1 {
    foreach i of local dvar1 {
        eststo : qui  svy :  reg `i' `j' $ctrl 
    }
}
$myesttab
/*twoway (scatter e3 d13 [pw=wpg] , mcolor(black%10) msize(tiny) by(dm2 , total legend(pos(6)))) (lfit e3 d13 [pw=wpg]) (qfit e3 d13 [pw=wpg]) */

/*hist e2 , by(dm2, total) percent ytitle("비율(%)") xlabel(1 "1" 2 "2" 3 "3")*/
