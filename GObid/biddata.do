cd ~/dropbox/data/gobid
tempfile tfile1 tfile2

    forvalue year= 2012/2022 {
        import delimited "bid_public_info_goods_`year'.csv", encoding(utf-8) clear

        /*exception control*/
        di as text "Year == " as result "`year'"
        tostring fnlsucsfdate , replace
        tostring fnlsucsfcorpofcl , replace
        tostring linkinsttnm , replace
        if inlist(`year' , 2016, 2018 , 2019) {
            replace sucsfbidrate = "." if strpos(sucsfbidrate , "#")
            destring sucsfbidrate , replace
        }

        label var bidntceno        "입찰공고번호"
        label var bidntceord       "입찰공고차수"
        label var bidclsfcno       "입찰분류번호"
        label var rbidno           "재입찰번호"
        label var ntcedivcd        "공고구분코드"
        label var bidntcenm        "입찰공고명"
        label var prtcptcnum       "참가업체수"
        label var bidwinnrnm       "최종낙찰업체명"
        label var bidwinnrbizno    "최종낙찰업체사업자등록번호"
        label var bidwinnrceonm    "최종낙찰업체대표자명"
        label var bidwinnradrs     "최종낙찰업체주소"
        label var bidwinnrtelno    "최종낙찰업체전화번호"
        label var sucsfbidamt      "최종낙찰금액"
        label var rlopengdt        "실개찰일시"
        label var dminsttcd        "수요기관코드"
        label var dminsttnm        "수요기관명"
        label var rgstdt           "등록일시"
        label var fnlsucsfdate     "최종낙찰일자"
        label var fnlsucsfcorpofcl "최종낙찰업체담당자"
        label var linkinsttnm      "연계기관명"
        if `year' != 2012 {
            append using `tfile1'
        }
        save `tfile1' , replace
    }
    gen bidtype = 1
    save `tfile2' , replace

    forvalue year= 2012/2022 {
        import delimited "bid_public_info_cons_`year'.csv", encoding(utf-8) clear
        /*exception control*/
        di as text "Year == " as result "`year'"
        tostring fnlsucsfdate , replace
        tostring fnlsucsfcorpofcl , replace
        tostring linkinsttnm , replace

        label var bidntceno        "입찰공고번호"
        label var bidntceord       "입찰공고차수"
        label var bidclsfcno       "입찰분류번호"
        label var rbidno           "재입찰번호"
        label var ntcedivcd        "공고구분코드"
        label var bidntcenm        "입찰공고명"
        label var prtcptcnum       "참가업체수"
        label var bidwinnrnm       "최종낙찰업체명"
        label var bidwinnrbizno    "최종낙찰업체사업자등록번호"
        label var bidwinnrceonm    "최종낙찰업체대표자명"
        label var bidwinnradrs     "최종낙찰업체주소"
        label var bidwinnrtelno    "최종낙찰업체전화번호"
        label var sucsfbidamt      "최종낙찰금액"
        label var sucsfbidrate     "최종낙찰률"
        label var rlopengdt        "실개찰일시"
        label var dminsttcd        "수요기관코드"
        label var dminsttnm        "수요기관명"
        label var rgstdt           "등록일시"
        label var fnlsucsfdate     "최종낙찰일자"
        label var fnlsucsfcorpofcl "최종낙찰업체담당자"
        label var linkinsttnm      "연계기관명"
        if `year' != 2012 {
            append using `tfile1'
        }
        save `tfile1' , replace
    }
    gen bidtype = 2
    append using `tfile2'
    save `tfile2' , replace


    forvalue year= 2012/2022 {
        import delimited "bid_public_info_srvc_`year'.csv", encoding(utf-8) clear

        /*exception control*/
        di as text "Year == " as result "`year'"
        tostring fnlsucsfdate , replace
        tostring fnlsucsfcorpofcl , replace
        tostring linkinsttnm , replace

        label var bidntceno        "입찰공고번호"
        label var bidntceord       "입찰공고차수"
        label var bidclsfcno       "입찰분류번호"
        label var rbidno           "재입찰번호"
        label var ntcedivcd        "공고구분코드"
        label var bidntcenm        "입찰공고명"
        label var prtcptcnum       "참가업체수"
        label var bidwinnrnm       "최종낙찰업체명"
        label var bidwinnrbizno    "최종낙찰업체사업자등록번호"
        label var bidwinnrceonm    "최종낙찰업체대표자명"
        label var bidwinnradrs     "최종낙찰업체주소"
        label var bidwinnrtelno    "최종낙찰업체전화번호"
        label var sucsfbidamt      "최종낙찰금액"
        label var sucsfbidrate     "최종낙찰률"
        label var rlopengdt        "실개찰일시"
        label var dminsttcd        "수요기관코드"
        label var dminsttnm        "수요기관명"
        label var rgstdt           "등록일시"
        label var fnlsucsfdate     "최종낙찰일자"
        label var fnlsucsfcorpofcl "최종낙찰업체담당자"
        label var linkinsttnm      "연계기관명"
            if `year' != 2012 {
                append using `tfile1'
            }
            save `tfile1' , replace
    }
    gen bidtype = 3
    append using `tfile2'
    save `tfile2' , replace

    forvalue year= 2012/2022 {
        import delimited "bid_public_info_frgn_`year'.csv", encoding(utf-8) clear

        /*exception control*/
        di as text "Year == " as result "`year'"
        tostring fnlsucsfdate , replace
        tostring fnlsucsfcorpofcl , replace
        tostring linkinsttnm , replace
        drop if strpos(bidwinnrbizno , "F") /*외국업체 제외*/
        destring bidwinnrbizno , replace

        label var bidntceno        "입찰공고번호"
        label var bidntceord       "입찰공고차수"
        label var bidclsfcno       "입찰분류번호"
        label var rbidno           "재입찰번호"
        label var ntcedivcd        "공고구분코드"
        label var bidntcenm        "입찰공고명"
        label var prtcptcnum       "참가업체수"
        label var bidwinnrnm       "최종낙찰업체명"
        label var bidwinnrbizno    "최종낙찰업체사업자등록번호"
        label var bidwinnrceonm    "최종낙찰업체대표자명"
        label var bidwinnradrs     "최종낙찰업체주소"
        label var bidwinnrtelno    "최종낙찰업체전화번호"
        label var sucsfbidamt      "최종낙찰금액"
        label var sucsfbidrate     "최종낙찰률"
        label var rlopengdt        "실개찰일시"
        label var dminsttcd        "수요기관코드"
        label var dminsttnm        "수요기관명"
        label var rgstdt           "등록일시"
        label var fnlsucsfdate     "최종낙찰일자"
        label var fnlsucsfcorpofcl "최종낙찰업체담당자"
        label var linkinsttnm      "연계기관명"
            if `year' != 2012 {
                append using `tfile1'
            }
            save `tfile1' , replace
    }
    gen bidtype = 4
    append using `tfile2'
    save `tfile2' , replace

use `tfile2' , clear
    label var bidtype "거래대상"
    label define bidtype 1 "물품" 2 "건설" 3 "용역" 4 "외자"
    label value bidtype bidtype
    save gobid , replace

