local path ~/dropbox/data/
tempfile tfile1 tfile2 tfile3

use `path'goms_eq.dta , clear
    local eqvars uniname uniarea unizone unibran unifoun school
    keep `eqvars'
    foreach i of local eqvars {
        drop if missing(`i')
    }
    duplicates drop uniarea uniname unibran , force
    compress
save `tfile1' , replace

    /*merge geoinfo{{{*/
    use `path'ALIMI_list_231214_4y_geoinfo.dta , clear
        /*destring branch*/
        label define BRANCH 1 "본교" 2 "분교" 3 "캠퍼스"
            replace branch = "1" if branch == "본교"
            replace branch = "2" if branch == "분교"
            replace branch = "3" if strpos(branch , "캠퍼스")
            destring branch , replace
            rename branch unibran
        /*exception conrtol*/
            drop if uniname == "가톨릭대학교" & address == "서울특별시 종로구 창경궁로 296-12"
            drop if uniname == "경동대학교"   & address == "경기도 양주시 경동대학로 27"
            drop if uniname == "경동대학교"   & address == "강원특별자치도 원주시 문막읍 견훤로 815"
            drop if uniname == "을지대학교"   & address == "경기도 성남시 수정구 산성대로 553"
            drop unicode
            label var address   "대학주소"
            label var latitude  "대학위치(위도)"
            label var longitude "대학위치(경도)"
            label var distance  "대학의 거리(남산타워 기준)"
        /*gen uniarea*/
        gen byte uniarea = .
            replace uniarea = 1  if strpos( address , "서울특별시")
            replace uniarea = 2  if strpos( address , "부산광역시")
            replace uniarea = 3  if strpos( address , "대구광역시")
            replace uniarea = 4  if strpos( address , "대전광역시")
            replace uniarea = 5  if strpos( address , "인천광역시")
            replace uniarea = 6  if strpos( address , "광주광역시")
            replace uniarea = 7  if strpos( address , "울산광역시")
            replace uniarea = 8  if strpos( address , "경기도")
            replace uniarea = 9  if strpos( address , "강원특별자치도")
            replace uniarea = 10 if strpos( address , "충청북도")
            replace uniarea = 11 if strpos( address , "충청남도")
            replace uniarea = 12 if strpos( address , "전라북도")
            replace uniarea = 13 if strpos( address , "전라남도")
            replace uniarea = 14 if strpos( address , "경상북도")
            replace uniarea = 15 if strpos( address , "경상남도")
            replace uniarea = 16 if strpos( address , "제주특별자치도")
            replace uniarea = 17 if strpos( address , "세종특별자치시")
            label define AREA -1 "모름/무응답" 1 "서울" 2 "부산" 3 "대구" 4 "대전" ///
                5 "인천" 6 "광주" 7 "울산" 8 "경기" 9 "강원" 10 "충북" 11 "충남" ///
                12 "전북" 13 "전남" 14 "경북" 15 "경남" 16 "제주" 17 "세종"
            label value uniarea AREA
    save `tfile2' , replace
    /*}}}*/

merge 1:1 uniarea uniname unibran using `tfile1'

sort uniname
    order _merge , first
    order uniarea , after(unibran)
    keec if _merge == 3
    drop _merge
save `path'goms_eq_geoinfo.dta , replace
save ~/dropbox/HL_SJHO/goms_eq_geoinfo.dta , replace

