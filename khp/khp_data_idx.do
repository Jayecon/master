cd ~/dropbox/data/khp
tempfile tfile

import delimited "~/GitHub/master/khp/indicies.csv", encoding(ISO-8859-1) clear
    label var year   "년도"
    label var dtfive "5분위배율(가계동향, 가처분소득)"
    label var dtgini "지니계수(가계동향, 가처분소득) "
    label var dtpvty "빈곤율(가계동향, 가처분소득)"
    label var dwfive "5분위배율(가금복, 가처분소득)"
    label var dwgini "지니계수(가금복, 가처분소득)"
    label var dwpvty "빈곤율(가금복, 가처분소득)"
    label var mtgini "지니계수(가계동향, 시장소득)"
    label var mtpvty "빈곤율(가계동향, 시장소득)"
    label var mwgini "지니계수(가금복, 시장소득)"
    label var mwpvty "빈곤율(가금복, 시장소득)"
save `tfile' ,replace

import delimited "~/GitHub/master/khp/khp_idx.csv", encoding(ISO-8859-1) clear
    label var ginit1 "지니계수(의료비1 차감, 총소득)"
    label var ginim1 "지니계수(의료비1 차감, 시장소득)"
    label var ginit5 "지니계수(의료비5 차감, 총소득)"
    label var ginim5 "지니계수(의료비5 차감, 시장소득)"
    label var ginit "지니계수(의료패널, 총소득)"
    label var ginim "지니계수(의료패널, 시장소득)"
    label var cim1t "의료비집중도(협의, 총소득)"
    label var cim5t "의료비집중도(광의, 총소득)"
    label var cim1m "의료비집중도(협의, 시장소득)"
    label var cim5m "의료비집중도(광의, 시장소득)"

merge 1:1 year using `tfile' , nogen
    label data "불평등지수 from 의료패널"
    destring _all , replace
    compress
    order _all , alpha
    order year , first
save khp_idx.dta , replace
