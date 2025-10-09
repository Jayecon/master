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

    replace d18_1 = 5 if d18_1 == 8
    replace d18_2 = 5 if d18_2 == 8
    replace d18_3 = 5 if d18_3 == 8
    egen d18 = rowtotal(d18*) , miss
    egen d10 = rowtotal(d18*) , miss
    egen c12 = rowtotal(d18*) , miss


svyset [pw=wpg]

local idvar1 d13 d8 c16
local idvar2 c12_1 c12_2 c12_3 c12_4 
local idvar3 d10_1 d10_2 d10_3 d10_4
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
foreach j of local idvar1 {
	foreach i of local dvar2 {
        eststo : qui  svy :  reg `i' `j' $ctrl 
    }
	$myesttab
	eststo clear
}

/*eststo clear*/
/*foreach j of local idvar2 {*/
    /*foreach i of local dvar1 {*/
        /*eststo : qui  svy :  reg `i' `j' $ctrl */
    /*}*/
/*}*/
/*$myesttab*/

/*eststo clear*/
/*foreach j of local idvar3 {*/
    /*foreach i of local dvar1 {*/
        /*eststo : qui  svy :  reg `i' `j' $ctrl */
    /*}*/
/*}*/
/*$myesttab*/

/*eststo clear*/
/*foreach j of local idvar4 {*/
    /*foreach i of local dvar1 {*/
        /*eststo : qui  svy :  reg `i' `j' $ctrl */
    /*}*/
/*}*/
/*$myesttab*/
