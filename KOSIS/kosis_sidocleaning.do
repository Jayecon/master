global path ~/dropbox/
tempfile tfile
do kosis_sidocleaning1.do
    save `tfile'
do kosis_sidocleaning2.do
    append using `tfile'
    save `tfile' , replace
do kosis_sidocleaning3.do
    append using `tfile'
    save `tfile' , replace

label var ctry   "행정구역(시도)별"
label var id     "행정구역(시군구)별"
label var year   "년도"
label var cop1   "사업체수[개]_1-4"
label var cop10  "사업체수[개]_합계"
label var cop2   "사업체수[개]_10-19"
label var cop3   "사업체수[개]_100-299"
label var cop4   "사업체수[개]_1000이상"
label var cop5   "사업체수[개]_20-49"
label var cop6   "사업체수[개]_300-499"
label var cop7   "사업체수[개]_5-9"
label var cop8   "사업체수[개]_50-99"
label var cop9   "사업체수[개]_500-999"
label var emp1   "종사자수[명]_1-4"
label var emp10  "종사자수[명]_합계"
label var emp2   "종사자수[명]_10-19"
label var emp3   "종사자수[명]_100-299"
label var emp4   "종사자수[명]_1000이상"
label var emp5   "종사자수[명]_20-49"
label var emp6   "종사자수[명]_300-499"
label var emp7   "종사자수[명]_5-9"
label var emp8   "종사자수[명]_50-99"
label var emp9   "종사자수[명]_500-999"
label var fmp10  "여자종사자수[명]_합계"
label var mmp10  "남자종사자수[명]_합계"
label var wop10  "여성대표자 사업체수[개]_합계"
label var mop10  "남성대표자 사업체수[개]_합계"
label var cop11  "사업체수[개]_300이상"
label var emp11  "종사자수[명]_300이상"

rename cop10 copttl
label var copttl "총 사업체수"
rename emp10 empttl
label var empttl "총 종사자수"

egen cop300 = rowtotal(cop4 cop6 cop9 cop11) ,missing
label var cop300 "300인이상 사업체수"
egen emp300 = rowtotal(emp4 emp6 emp9 emp11) ,missing
label var emp300 "300인이상 사업체 종사자수" 

replace id = "합계" if id == "소계" | id == "전체"

drop cop? cop?? emp? emp?? fmp?? mmp?? wop?? mop??

save ~/dropbox/kosis_sido.dta
