 clear
 import excel "/Users/jay/Library/CloudStorage/Dropbox/Data/KOSIS/KOSIS_기업활동조사_17개시도_2006-2022.xls", ///
    sheet("KOSIS_기업활동조사_17개시도_") firstrow
    rename ? v# , addnumber(2006)
    rename 산업별 ind
    rename 항목 type
    /*area cleaning*/
        rename 시도별 area
        label var area "지역"
        label define AREA 1  "서울" 2  "부산" 3  "대구" 4  "대전" 5  "인천" 6  "광주" ///
        7 "울산" 8  "경기" 9  "강원" 10 "충북" 11 "충남" 12 "전북" 13 "전남" 14 "경북" ///
        15 "경남" 16 "제주" 17 "세종"
        replace area = "1"  if strpos(area , "서울")
        replace area = "2"  if strpos(area , "부산")
        replace area = "3"  if strpos(area , "대구")
        replace area = "4"  if strpos(area , "대전")
        replace area = "5"  if strpos(area , "인천")
        replace area = "6"  if strpos(area , "광주")
        replace area = "7"  if strpos(area , "울산")
        replace area = "8"  if strpos(area , "경기")
        replace area = "9"  if strpos(area , "강원")
        replace area = "10" if strpos(area , "충청북도")
        replace area = "11" if strpos(area , "충청남도")
        replace area = "12" if strpos(area , "전라북도")
        replace area = "13" if strpos(area , "전라남도")
        replace area = "14" if strpos(area , "경상북도")
        replace area = "15" if strpos(area , "경상남도")
        replace area = "16" if strpos(area , "제주")
        replace area = "17" if strpos(area , "세종")
        drop if area == "전 국"
        destring area, replace
        label value area AREA
	/*destring*/
        forvalue i == 2006/2022 {
            replace v`i' = "." if v`i' == "X"
            destring v`i' , replace
            bys area type :  egen t`i' = total(v`i')
        }
    /*산업별제거*/
        drop 단위 ind v????
        duplicates drop area type , force
    /*xtsetting*/
        tempfile tfile1
        levelsof type , local(vlist)
        preserve
        local num = 1
        foreach i of local vlist {
            keep if type == "`i'"
            reshape long t , i(area) j(year)
            rename t ind`num'
            label var ind`num' "`i'"
            if `num' == 1 {
                save `tfile1' , replace
            }
            else {
                merge 1:1 area year using `tfile1'	, nogen		
                save `tfile1' , replace
            }
            local++ num
            restore , preserve
        }
use `tfile1' , clear
    label var year "년도"
    drop type
    order _all , alpha
    order area year , first
    compress
    save ~/dropbox/data/kosis/kosis_ind_gomseq.dta , replace
