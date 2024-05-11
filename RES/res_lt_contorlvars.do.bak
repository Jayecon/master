 import excel "/Users/jay/Library/CloudStorage/Dropbox/Data/RES/kosis/110_DT_11001N_2013_A001_20240422180451.xls", ///
	sheet("110_DT_11001N_2013_A001_2024042") firstrow clear
    rename ? v# , addnumber(2009)
    rename DO001* area
	rename 인구현황별 type
    /*destring*/
        foreach i in 2009 2010 2011 2012 2014 {
            replace v`i' = "." if v`i' == "-"
        }
        replace area = subinstr(area , "A", "", .)
        destring _all , replace
    /*area cleaning*/
        drop if !inlist(area , 2 , 28 , 45 , 54 , 65 , 71 , 77 , 83 , 84 , 116 , 135 , ///
            148 , 164 , 179 , 202 , 226 , 245)
        recode area  (2 = 1) (28= 2) (45 = 3) (71 = 4) (54 = 5) (65 = 6) (77 = 7) (84 = 8) ///
            (116 = 9) (135 = 10) (148 = 11) (164 = 12) (179 = 13) (202 = 14) (226 = 15) ///
            (245 = 16) (83 = 17) 
        label define AREA -1 "모름/무응답" 1 "서울" 2 "부산" 3 "대구" 4 "대전" 5 "인천" ///
            6 "광주" 7 "울산" 8 "경기" 9 "강원" 10 "충북" 11 "충남" 12 "전북" 13 "전남" ///
            14 "경북" 15 "경남" 16 "제주" 17 "세종"
        label value area AREA
        label var area "시도"
	replace type = type + "(" + 단위 + ")" if 단위 != ""
	drop if area == 1
	drop Item항목 항목 A02인구현황별 단위 행정구역별
	compress
