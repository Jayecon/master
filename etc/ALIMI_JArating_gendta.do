cd /Users/jay/Library/CloudStorage/Dropbox/Data/ALIMI/JArating/cleaned
    tempfile tfile1 tfile2

    /*4-다{{{*/
        use "대학_4-다_2009.dta" /*(2010년_ [4-다. 졸업생의 취업 현황_])*/
            keep C1 C2 C16 C17
            gen year = 2009
            destring C2 C16 C17 , replace
                label var C1 "학교명"
                label var C2  "입학정원 (A)"
                label var C16 "정원내 신입생 충원율(%) (D/B) × 100"
                label var C17 "경쟁률 (C/B)"
            rename C1 uniname
            rename (C2 C16 C17) (v4_da_1 v4_da_2 v4_da_3)
            save `tfile1' , replace
        use "대학_4-다_2010.dta" /*(2010년_ [4-다. 졸업생의 취업 현황_])*/
            keep C1 C2 C16 C17
            gen year = 2010
            destring C2 C16 C17 , replace
                label var C1 "학교명"
                label var C2  "입학정원 (A)"
                label var C16 "정원내 신입생 충원율(%) (D/B) × 100"
                label var C17 "경쟁률 (C/B)"
            rename C1 uniname
            rename (C2 C16 C17) (v4_da_1 v4_da_2 v4_da_3)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-다_2011.dta" /*(2011년_ [4-다. 졸업생의 취업 현황_])*/
            keep C1 C2 C14 C15
            gen year = 2011
            destring C2 C14 C15 , replace
                label var C1 "학교명"
                label var C2  "입학정원 (A)"
                label var C14 "정원내 신입생 충원율(%) (D/B) × 100"
                label var C15 "경쟁률 (C/B)"
            rename C1 uniname
            rename (C2 C14 C15) (v4_da_1 v4_da_2 v4_da_3)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-다_2012.dta" /*(2012년_ [4-다. 졸업생의 취업 현황_])*/
            keep C1 C2 C14 C15
            gen year = 2012
            destring C2 C14 C15 , replace
                label var C1 "학교명"
                label var C2  "입학정원 (A)"
                label var C14 "정원내 신입생 충원율(%) (D/B) × 100"
                label var C15 "경쟁률 (C/B)"
            rename C1 uniname
            rename (C2 C14 C15) (v4_da_1 v4_da_2 v4_da_3)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-다_2013.dta" /*(2013년_ [4-다. 졸업생의 취업 현황_])*/
            keep C5 C6 C18 C19
            gen year = 2013
            destring C6 C18 C19 , replace
                label var C5 "학교명"
                label var C6  "입학정원 (A)"
                label var C18 "정원내 신입생 충원율(%) (D/B) × 100"
                label var C19 "경쟁률 (C/B)"
            rename C5 uniname
            rename (C6 C18 C19) (v4_da_1 v4_da_2 v4_da_3)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-다_2014.dta" /*(2014년_ [4-다. 졸업생의 취업 현황_])*/
            keep C5 C6 C18 C19
            gen year = 2014
            destring C6 C18 C19 , replace
                label var C5 "학교명"
                label var C6  "입학정원 (A)"
                label var C18 "정원내 신입생 충원율(%) (D/B) × 100"
                label var C19 "경쟁률 (C/B)"
            rename C5 uniname
            rename (C6 C18 C19) (v4_da_1 v4_da_2 v4_da_3)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-다_2015.dta" /*(2015년_ [4-다. 졸업생의 취업 현황_])*/
            keep C5 C6 C18 C19
            gen year = 2015
            destring C6 C18 C19 , replace
                label var C5 "학교명"
                label var C6  "입학정원 (A)"
                label var C18 "정원내 신입생 충원율(%) (D/B) × 100"
                label var C19 "경쟁률 (C/B)"
            rename C5 uniname
            rename (C6 C18 C19) (v4_da_1 v4_da_2 v4_da_3)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-다_2016.dta" /*(2016년_ [4-다. 졸업생의 취업 현황_])*/
            keep C5 C6 C18 C19
            gen year = 2016
            destring C6 C18 C19 , replace
                label var C5 "학교명"
                label var C6  "입학정원 (A)"
                label var C18 "정원내 신입생 충원율(%) (D/B) × 100"
                label var C19 "경쟁률 (C/B)"
            rename C5 uniname
            rename (C6 C18 C19) (v4_da_1 v4_da_2 v4_da_3)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-다_2017.dta" /*(2017년_ [4-다. 졸업생의 취업 현황_])*/
            keep C5 C6 C18 C19
            gen year = 2017
            destring C6 C18 C19 , replace
                label var C5 "학교명"
                label var C6  "입학정원 (A)"
                label var C18 "정원내 신입생 충원율(%) (D/B) × 100"
                label var C19 "경쟁률 (C/B)"
            rename C5 uniname
            rename (C6 C18 C19) (v4_da_1 v4_da_2 v4_da_3)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-다_2018.dta" /*(2018년_ [4-다. 졸업생의 취업 현황_])*/
            keep C5 C6 C18 C19
            gen year = 2018
            destring C6 C18 C19 , replace
                label var C5 "학교명"
                label var C6  "입학정원 (A)"
                label var C18 "정원내 신입생 충원율(%) (D/B) × 100"
                label var C19 "경쟁률 (C/B)"
            rename C5 uniname
            rename (C6 C18 C19) (v4_da_1 v4_da_2 v4_da_3)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-다_2019.dta" /*(2019년_ [4-다. 졸업생의 취업 현황_])*/
            keep C5 C6 C18 C19
            gen year = 2019
            destring C6 C18 C19 , replace
                label var C5 "학교명"
                label var C6  "입학정원 (A)"
                label var C18 "정원내 신입생 충원율(%) (D/B) × 100"
                label var C19 "경쟁률 (C/B)"
            rename C5 uniname
            rename (C6 C18 C19) (v4_da_1 v4_da_2 v4_da_3)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-다_2020.dta" /*(2020년_ [4-다. 졸업생의 취업 현황_])*/
            keep C5 C6 C18 C19
            gen year = 2020
            destring C6 C18 C19 , replace
                label var C5 "학교명"
                label var C6  "입학정원 (A)"
                label var C18 "정원내 신입생 충원율(%) (D/B) × 100"
                label var C19 "경쟁률 (C/B)"
            rename C5 uniname
            rename (C6 C18 C19) (v4_da_1 v4_da_2 v4_da_3)
            append using `tfile1'
            save `tfile1' , replace
        replace uniname = subinstr(uniname, " _", "_", .)
        replace uniname = trim(uniname)
        drop if strpos(uniname , "폐교")
        save `tfile2' , replace
    /*}}}*/
    /*4-바-1{{{*/
        use "대학_4-바-1_2009.dta" /*(2009년_ [4-바-1. 외국학생 현황_])*/
            keep C1 C12
            gen year = 2009
            destring C12 , replace
                label var C1 "학교"
                label var C12 "총계"
            rename C1 uniname
            rename (C12) (v4_ba_1)
            save `tfile1' , replace
        use "대학_4-바-1_2010.dta" /*(2010년_ [4-바-1. 외국학생 현황_])*/
            keep C1 C12
            gen year = 2010
            destring C12 , replace
                label var C1 "학교"
                label var C12 "총계"
            rename C1 uniname
            rename (C12) (v4_ba_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-바-1_2011.dta" /*(2011년_ [4-바-1. 외국학생 현황_])*/
            keep C1 C12
            gen year = 2011
            destring C12 , replace
                label var C1 "학교"
                label var C12 "총계"
            rename C1 uniname
            rename (C12) (v4_ba_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-바-1_2012.dta" /*(2012년_ [4-바-1. 외국학생 현황_])*/
            keep C1 C12
            gen year = 2012
            destring C12 , replace
                label var C1 "학교"
                label var C12 "총계"
            rename C1 uniname
            rename (C12) (v4_ba_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-바-1_2013.dta" /*(2013년_ [4-바-1. 외국학생 현황_])*/
            keep C5 C17
            gen year = 2013
            destring C17 , replace
                label var C5 "학교"
                label var C17 "총계(D=A+B+C)"
            rename C5 uniname
            rename (C17) (v4_ba_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-바-1_2014.dta" /*(2014년_ [4-바-1. 외국학생 현황_])*/
            keep C5 C6
            gen year = 2014
            destring C6 , replace
                label var C5 "학교"
                label var C6 "계 (D=A+B+C)"
            rename C5 uniname
            rename (C6) (v4_ba_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-바-1_2015.dta" /*(2015년_ [4-바-1. 외국학생 현황_])*/
            keep C5 C6
            gen year = 2015
            destring C6 , replace
                label var C5 "학교"
                label var C6 "계 (D=A+B+C)"
            rename C5 uniname
            rename (C6) (v4_ba_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-바-1_2016.dta" /*(2016년_ [4-바-1. 외국학생 현황_])*/
            keep C5 C6
            gen year = 2016
            destring C6 , replace
                label var C5 "학교"
                label var C6 "계 (D=A+B+C)"
            rename C5 uniname
            rename (C6) (v4_ba_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-바-1_2017.dta" /*(2017년_ [4-바-1. 외국학생 현황_])*/
            keep C5 C6
            gen year = 2017
            destring C6 , replace
                label var C5 "학교"
                label var C6 "계 (D=A+B+C)"
            rename C5 uniname
            rename (C6) (v4_ba_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-바-1_2018.dta" /*(2018년_ [4-바-1. 외국학생 현황_])*/
            keep C5 C6
            gen year = 2018
            destring C6 , replace
                label var C5 "학교"
                label var C6 "계 (D=A+B+C)"
            rename C5 uniname
            rename (C6) (v4_ba_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-바-1_2019.dta" /*(2019년_ [4-바-1. 외국학생 현황_])*/
            keep C5 C6
            gen year = 2019
            destring C6 , replace
                label var C5 "학교"
                label var C6 "계 (D=A+B+C)"
            rename C5 uniname
            rename (C6) (v4_ba_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-바-1_2020.dta" /*(2020년_ [4-바-1. 외국학생 현황_])*/
            keep C5 C6
            gen year = 2020
            destring C6 , replace
                label var C5 "학교"
                label var C6 "계 (D=A+B+C)"
            rename C5 uniname
            rename (C6) (v4_ba_1)
            append using `tfile1'
            save `tfile1' , replace
        replace uniname = subinstr(uniname, " _", "_", .)
        replace uniname = trim(uniname)
        drop if strpos(uniname , "폐교")
save temp , replace
        merge 1:1 year uniname using `tfile2' , nogen
        save `tfile2' , replace
    /*}}}*/
    /*4-바-2{{{*/
        use "대학_4-바-2_2009.dta" /*(2009년_ [4-바-2. 외국학생 중도탈락 현황_])*/
            keep C1 C10
            gen year = 2009
            destring C10 , replace
                label var C1 "학교"
                label var C10 "외국인 학생 중도탈락률 (%) (B/A)×100"
            rename C1 uniname
            rename (C10) (v4_ba_2)
            save `tfile1' , replace
        use "대학_4-바-2_2010.dta" /*(2010년_ [4-바-2. 외국학생 중도탈락 현황_])*/
            keep C1 C10
            gen year = 2010
            destring C10 , replace
                label var C1 "학교"
                label var C10 "외국인 학생 중도탈락률 (%) (B/A)×100"
            rename C1 uniname
            rename (C10) (v4_ba_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-바-2_2011.dta" /*(2011년_ [4-바-2. 외국학생 중도탈락 현황_])*/
            keep C1 C10
            gen year = 2011
            destring C10 , replace
                label var C1 "학교"
                label var C10 "외국인 학생 중도탈락률 (%) (B/A)×100"
            rename C1 uniname
            rename (C10) (v4_ba_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-바-2_2012.dta" /*(2012년_ [4-바-2. 외국학생 중도탈락 현황_])*/
            keep C1 C10
            gen year = 2012
            destring C10 , replace
                label var C1 "학교"
                label var C10 "외국인 학생 중도탈락률 (%) (B/A)×100"
            rename C1 uniname
            rename (C10) (v4_ba_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-바-2_2013.dta" /*(2013년_ [4-바-2. 외국학생 중도탈락 현황_])*/
            keep C5 C14
            gen year = 2013
            destring C14 , replace
                label var C5 "학교"
                label var C14 "외국인유학생 중도탈락률(%) (B/A)×100"
            rename C5 uniname
            rename (C14) (v4_ba_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-바-2_2014.dta" /*(2014년_ [4-바-2. 외국학생 중도탈락 현황_])*/
            keep C5 C18
            gen year = 2014
            destring C18 , replace
                label var C5 "학교"
                label var C18 "외국인유학생 중도탈락률(%) (B/A)×100"
            rename C5 uniname
            rename (C18) (v4_ba_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-바-2_2015.dta" /*(2015년_ [4-바-2. 외국학생 중도탈락 현황_])*/
            keep C5 C20
            gen year = 2015
            destring C20 , replace
                label var C5 "학교"
                label var C20 "외국인유학생중도탈락률(%)(B/A)×100"
            rename C5 uniname
            rename (C20) (v4_ba_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-바-2_2016.dta" /*(2016년_ [4-바-2. 외국학생 중도탈락 현황_])*/
            keep C5 C20
            gen year = 2016
            destring C20 , replace
                label var C5 "학교"
                label var C20 "외국인유학생중도탈락률(%)(B/A)×100"
            rename C5 uniname
            rename (C20) (v4_ba_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-바-2_2017.dta" /*(2017년_ [4-바-2. 외국학생 중도탈락 현황_])*/
            keep C5 C20
            gen year = 2017
            destring C20 , replace
                label var C5 "학교"
                label var C20 "외국인유학생중도탈락률(%)(B/A)×100"
            rename C5 uniname
            rename (C20) (v4_ba_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-바-2_2018.dta" /*(2018년_ [4-바-2. 외국학생 중도탈락 현황_])*/
            keep C5 C20
            gen year = 2018
            destring C20 , replace
                label var C5 "학교"
                label var C20 "외국인유학생중도탈락률(%)(B/A)×100"
            rename C5 uniname
            rename (C20) (v4_ba_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-바-2_2019.dta" /*(2019년_ [4-바-2. 외국학생 중도탈락 현황_])*/
            keep C5 C20
            gen year = 2019
            destring C20 , replace
                label var C5 "학교"
                label var C20 "외국인유학생중도탈락률(%)(B/A)×100"
            rename C5 uniname
            rename (C20) (v4_ba_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-바-2_2020.dta" /*(2020년_ [4-바-2. 외국학생 중도탈락 현황_])*/
            keep C5 C20
            gen year = 2020
            destring C20 , replace
                label var C5 "학교"
                label var C20 "외국인유학생중도탈락률(%)(B/A)×100"
            rename C5 uniname
            rename (C20) (v4_ba_2)
            append using `tfile1'
            save `tfile1' , replace
        replace uniname = subinstr(uniname, " _", "_", .)
        replace uniname = trim(uniname)
        drop if strpos(uniname , "폐교")
        merge 1:1 year uniname using `tfile2' , nogen
        save `tfile2' , replace
    /*}}}*/
    /*4-사{{{*/
        use "대학_4-사_2008.dta" /*(2008년_ [4-사. 중도탈락 학생 현황_])*/
            keep C1 C12
            gen year = 2008
            destring C12 , replace
                label var C1 "학교"
                label var C12 "중도탈락학생비율(%) (B/A) × 100"
            rename C1 uniname
            rename (C12) (v4_sa)
            save `tfile1' , replace
        use "대학_4-사_2009.dta" /*(2009년_ [4-사. 중도탈락 학생 현황_])*/
            keep C1 C12
            gen year = 2009
            destring C12 , replace
                label var C1 "학교"
                label var C12 "중도탈락학생비율(%) (B/A) × 100"
            rename C1 uniname
            rename (C12) (v4_sa)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-사_2010.dta" /*(2010년_ [4-사. 중도탈락 학생 현황_])*/
            keep C1 C12
            gen year = 2010
            destring C12 , replace
                label var C1 "학교"
                label var C12 "중도탈락학생비율(%) (B/A) × 100"
            rename C1 uniname
            rename (C12) (v4_sa)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-사_2011.dta" /*(2011년_ [4-사. 중도탈락 학생 현황_])*/
            keep C1 C12
            gen year = 2011
            destring C12 , replace
                label var C1 "학교"
                label var C12 "중도탈락학생비율(%) (B/A) × 100"
            rename C1 uniname
            rename (C12) (v4_sa)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-사_2012.dta" /*(2012년_ [4-사. 중도탈락 학생 현황_])*/
            keep C1 C12
            gen year = 2012
            destring C12 , replace
                label var C1 "학교"
                label var C12 "중도탈락학생비율(%) (B/A) × 100"
            rename C1 uniname
            rename (C12) (v4_sa)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-사_2013.dta" /*(2013년_ [4-사. 중도탈락 학생 현황_])*/
            keep C5 C16
            gen year = 2013
            destring C16 , replace
                label var C5 "학교"
                label var C16 "중도탈락학생비율(%) (B/A) × 100"
            rename C5 uniname
            rename (C16) (v4_sa)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-사_2014.dta" /*(2014년_ [4-사. 중도탈락 학생 현황_])*/
            keep C5 C16
            gen year = 2014
            destring C16 , replace
                label var C5 "학교"
                label var C16 "중도탈락학생비율(%) (B/A) × 100"
            rename C5 uniname
            rename (C16) (v4_sa)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-사_2015.dta" /*(2015년_ [4-사. 중도탈락 학생 현황_])*/
            keep C5 C16
            gen year = 2015
            destring C16 , replace
                label var C5 "학교"
                label var C16 "중도탈락학생비율(%) (B/A) × 100"
            rename C5 uniname
            rename (C16) (v4_sa)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-사_2016.dta" /*(2016년_ [4-사. 중도탈락 학생 현황_])*/
            keep C5 C16
            gen year = 2016
            destring C16 , replace
                label var C5 "학교"
                label var C16 "중도탈락학생비율(%) (B/A) × 100"
            rename C5 uniname
            rename (C16) (v4_sa)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-사_2017.dta" /*(2017년_ [4-사. 중도탈락 학생 현황_])*/
            keep C5 C16
            gen year = 2017
            destring C16 , replace
                label var C5 "학교"
                label var C16 "중도탈락학생비율(%) (B/A) × 100"
            rename C5 uniname
            rename (C16) (v4_sa)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-사_2018.dta" /*(2018년_ [4-사. 중도탈락 학생 현황_])*/
            keep C5 C16
            gen year = 2018
            destring C16 , replace
                label var C5 "학교"
                label var C16 "중도탈락학생비율(%) (B/A) × 100"
            rename C5 uniname
            rename (C16) (v4_sa)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-사_2019.dta" /*(2019년_ [4-사. 중도탈락 학생 현황_])*/
            keep C5 C16
            gen year = 2019
            destring C16 , replace
                label var C5 "학교"
                label var C16 "중도탈락학생비율(%) (B/A) × 100"
            rename C5 uniname
            rename (C16) (v4_sa)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_4-사_2020.dta" /*(2020년_ [4-사. 중도탈락 학생 현황_])*/
            keep C5 C16
            gen year = 2020
            destring C16 , replace
                label var C5 "학교"
                label var C16 "중도탈락학생비율(%) (B/A) × 100"
            rename C5 uniname
            rename (C16) (v4_sa)
            append using `tfile1'
            save `tfile1' , replace
        replace uniname = subinstr(uniname, " _", "_", .)
        replace uniname = trim(uniname)
        drop if strpos(uniname , "폐교")
        merge 1:1 year uniname using `tfile2' , nogen
        save `tfile2' , replace
    /*}}}*/
    /*5-나-(1){{{*/
        use "대학_5-나-(1)_2008.dta" /*(2008년_ [5-나-(1). 졸업생의 진학 현황_])*/
            keep C1 C18
            gen year = 2008
            destring C18 , replace
                label var C1 "학교명"
                label var C18 "진학률(%) (B/A)*100"
            rename C1 uniname
            rename (C18) (v5_na_1)
            save `tfile1' , replace
        use "대학_5-나-(1)_2009.dta" /*(2009년_ [5-나-(1). 졸업생의 진학 현황_])*/
            keep C1 C18
            gen year = 2009
            destring C18 , replace
                label var C1 "학교명"
                label var C18 "진학률(%) (B/A)*100"
            rename C1 uniname
            rename (C18) (v5_na_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_5-나-(1)_2010.dta" /*(2010년_ [5-나-(1). 졸업생의 진학 현황_])*/
            keep C1 C18
            gen year = 2010
            destring C18 , replace
                label var C1 "학교명"
                label var C18 "진학률(%) (B/A)*100"
            rename C1 uniname
            rename (C18) (v5_na_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_5-나-(1)_2011.dta" /*(2011년_ [5-나-(1). 졸업생의 진학 현황_])*/
            keep C1 C18
            gen year = 2011
            destring C18 , replace
                label var C1 "학교명"
                label var C18 "진학률(%) (B/A)*100"
            rename C1 uniname
            rename (C18) (v5_na_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_5-나-(1)_2012.dta" /*(2012년_ [5-나-(1). 졸업생의 진학 현황_])*/
            keep C1 C18
            gen year = 2012
            destring C18 , replace
                label var C1 "학교명"
                label var C18 "진학률(%) (B/A)*100"
            rename C1 uniname
            rename (C18) (v5_na_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_5-나-(1)_2013.dta" /*(2013년_ [5-나-(1). 졸업생의 진학 현황_])*/
            keep C5 C22
            gen year = 2013
            destring C22 , replace
                label var C5 "학교명"
                label var C22 "진학률(%) (B/A)*100"
            rename C5 uniname
            rename (C22) (v5_na_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_5-나-(1)_2014.dta" /*(2014년_ [5-나-(1). 졸업생의 진학 현황_])*/
            keep C5 C22
            gen year = 2014
            destring C22 , replace
                label var C5 "학교명"
                label var C22 "진학률(%) (B/A)*100"
            rename C5 uniname
            rename (C22) (v5_na_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_5-나-(1)_2015.dta" /*(2015년_ [5-나-(1). 졸업생의 진학 현황_])*/
            keep C5 C22
            gen year = 2015
            destring C22 , replace
                label var C5 "학교명"
                label var C22 "진학률(%) (B/A)*100"
            rename C5 uniname
            rename (C22) (v5_na_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_5-나-(1)_2016.dta" /*(2016년_ [5-나-(1). 졸업생의 진학 현황_])*/
            keep C5 C22
            gen year = 2016
            destring C22 , replace
                label var C5 "학교명"
                label var C22 "진학률(%) (B/A)*100"
            rename C5 uniname
            rename (C22) (v5_na_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_5-나-(1)_2017.dta" /*(2017년_ [5-나-(1). 졸업생의 진학 현황_])*/
            keep C5 C22
            gen year = 2017
            destring C22 , replace
                label var C5 "학교명"
                label var C22 "진학률(%) (B/A)*100"
            rename C5 uniname
            rename (C22) (v5_na_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_5-나-(1)_2018.dta" /*(2018년_ [5-나-(1). 졸업생의 진학 현황_])*/
            keep C5 C22
            gen year = 2018
            destring C22 , replace
                label var C5 "학교명"
                label var C22 "진학률(%) (B/A)*100"
            rename C5 uniname
            rename (C22) (v5_na_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_5-나-(1)_2019.dta" /*(2019년_ [5-나-(1). 졸업생의 진학 현황_])*/
            keep C5 C22
            gen year = 2019
            destring C22 , replace
                label var C5 "학교명"
                label var C22 "진학률(%) (B/A)*100"
            rename C5 uniname
            rename (C22) (v5_na_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_5-나-(1)_2020.dta" /*(2020년_ [5-나-(1). 졸업생의 진학 현황_])*/
            keep C5 C22
            gen year = 2020
            destring C22 , replace
                label var C5 "학교명"
                label var C22 "진학률(%) (B/A)*100"
            rename C5 uniname
            rename (C22) (v5_na_1)
            append using `tfile1'
            save `tfile1' , replace
        replace uniname = subinstr(uniname, " _", "_", .)
        replace uniname = trim(uniname)
        drop if strpos(uniname , "폐교")
        merge 1:1 year uniname using `tfile2' , nogen
        save `tfile2' , replace
    /*}}}*/
    /*5-다{{{*/
        use "대학_5-다_2010.dta" /*(2010년_ [5-다. 졸업생의 취업 현황_])*/
            keep C1 C18
            gen year = 2010
            destring C18 , replace
                label var C1 "학교명"
                label var C18 "(건강보험DB연계) 취업률(%)"
            rename C1 uniname
            rename (C18) (v5_da)
            save `tfile1' , replace
        use "대학_5-다_2011.dta" /*(2011년_ [5-다. 졸업생의 취업 현황_])*/
            keep C1 C21
            gen year = 2011
            destring C21 , replace
                label var C1 "학교명"
                label var C21 "취업률(%)"
            rename C1 uniname
            rename (C21) (v5_da)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_5-다_2012.dta" /*(2012년_ [5-다. 졸업생의 취업 현황_])*/
            keep C1 C29
            gen year = 2012
            destring C29 , replace
                label var C1 "학교명"
                label var C29 "취업률(%)"
            rename C1 uniname
            rename (C29) (v5_da)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_5-다_2013.dta" /*(2013년_ [5-다. 졸업생의 취업 현황_])*/
            keep C5 C33
            gen year = 2013
            destring C33 , replace
                label var C5 "학교명"
                label var C33 "취업률(%)"
            rename C5 uniname
            rename (C33) (v5_da)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_5-다_2014.dta" /*(2014년_ [5-다. 졸업생의 취업 현황_])*/
            keep C5 C33
            gen year = 2014
            destring C33 , replace
                label var C5 "학교명"
                label var C33 "취업률(%)"
            rename C5 uniname
            rename (C33) (v5_da)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_5-다_2015.dta" /*(2015년_ [5-다. 졸업생의 취업 현황_])*/
            keep C5 C33
            gen year = 2015
            replace C33 = "" if C33 == "-"
            destring C33 , replace
                label var C5 "학교명"
                label var C33 "취업률(%)"
            rename C5 uniname
            rename (C33) (v5_da)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_5-다_2016.dta" /*(2016년_ [5-다. 졸업생의 취업 현황_])*/
            keep C5 C33
            gen year = 2016
            replace C33 = "" if C33 == "-"
            destring C33 , replace
                label var C5 "학교명"
                label var C33 "취업률(%)"
            rename C5 uniname
            rename (C33) (v5_da)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_5-다_2017.dta" /*(2017년_ [5-다. 졸업생의 취업 현황_])*/
            keep C5 C33
            gen year = 2017
            replace C33 = "" if C33 == "-"
            destring C33 , replace
                label var C5 "학교명"
                label var C33 "취업률(%)"
            rename C5 uniname
            rename (C33) (v5_da)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_5-다_2018.dta" /*(2018년_ [5-다. 졸업생의 취업 현황_])*/
            keep C5 C33
            gen year = 2018
            replace C33 = "" if C33 == "-"
            destring C33 , replace
                label var C5 "학교명"
                label var C33 "취업률(%)"
            rename C5 uniname
            rename (C33) (v5_da)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_5-다_2019.dta" /*(2019년_ [5-다. 졸업생의 취업 현황_])*/
            keep C5 C33
            gen year = 2019
            replace C33 = "" if C33 == "-"
            destring C33 , replace
                label var C5 "학교명"
                label var C33 "취업률(%)"
            rename C5 uniname
            rename (C33) (v5_da)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_5-다_2020.dta" /*(2020년_ [5-다. 졸업생의 취업 현황_])*/
            keep C5 C33
            gen year = 2020
            replace C33 = "" if C33 == "-"
            destring C33 , replace
                label var C5 "학교명"
                label var C33 "취업률(%)"
            rename C5 uniname
            rename (C33) (v5_da)
            append using `tfile1'
            save `tfile1' , replace
        replace uniname = subinstr(uniname, " _", "_", .)
        replace uniname = trim(uniname)
        drop if strpos(uniname , "폐교")
        merge 1:1 year uniname using `tfile2' , nogen
        save `tfile2' , replace
    /*}}}*/
    /*6-가-1{{{*/
        use "대학_6-가-1_2009.dta" /*(2009년_ [6-가-1. 전체 교원 대비 전임교원 현황_])*/
            keep C1 C4 C5 C14 C15
            gen year = 2009
            destring C4 C5 C14 C15 , replace
                label var C1 "학교"
                label var C4 "학부_전임교원_계_남"
                label var C5 "학부_전임교원_계_여"
                label var C14 "학부_비전임교원_계_남"
                label var C15 "학부_비전임교원_계_여"
            rename C1 uniname
            rename (C4 C5 C14 C15) (v6_ga_1_1 v6_ga_1_2 v6_ga_1_3 v6_ga_1_4)
            save `tfile1' , replace
        use "대학_6-가-1_2010.dta" /*(2010년_ [6-가-1. 전체 교원 대비 전임교원 현황_])*/
            keep C1 C4 C5 C14 C15
            gen year = 2010
            destring C4 C5 C14 C15 , replace
                label var C1 "학교"
                label var C4 "학부_전임교원_계_남"
                label var C5 "학부_전임교원_계_여"
                label var C14 "학부_비전임교원_계_남"
                label var C15 "학부_비전임교원_계_여"
            rename C1 uniname
            rename (C4 C5 C14 C15) (v6_ga_1_1 v6_ga_1_2 v6_ga_1_3 v6_ga_1_4)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_6-가-1_2011.dta" /*(2011년_ [6-가-1. 전체 교원 대비 전임교원 현황_])*/
            keep C1 C4 C5 C14 C15
            gen year = 2011
            destring C4 C5 C14 C15 , replace
                label var C1 "학교"
                label var C4 "학부_전임교원_계_남"
                label var C5 "학부_전임교원_계_여"
                label var C14 "학부_비전임교원_계_남"
                label var C15 "학부_비전임교원_계_여"
            rename C1 uniname
            rename (C4 C5 C14 C15) (v6_ga_1_1 v6_ga_1_2 v6_ga_1_3 v6_ga_1_4)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_6-가-1_2012.dta" /*(2012년_ [6-가-1. 전체 교원 대비 전임교원 현황_])*/
            keep C1 C4 C5 C14 C15
            gen year = 2012
            destring C4 C5 C14 C15 , replace
                label var C1 "학교"
                label var C4 "학부_전임교원_계_남"
                label var C5 "학부_전임교원_계_여"
                label var C14 "학부_비전임교원_계_남"
                label var C15 "학부_비전임교원_계_여"
            rename C1 uniname
            rename (C4 C5 C14 C15) (v6_ga_1_1 v6_ga_1_2 v6_ga_1_3 v6_ga_1_4)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_6-가-1_2013.dta" /*(2013년_ [6-가-1. 전체 교원 대비 전임교원 현황_])*/
            keep C5 C8 C9 C16 C17
            gen year = 2013
            destring C8 C9 C16 C17 , replace
                label var C5 "학교"
                label var C8 "학부_전임교원_계_남"
                label var C9 "학부_전임교원_계_여"
                label var C16 "학부_비전임교원_계_남"
                label var C17 "학부_비전임교원_계_여"
            rename C5 uniname
            rename (C8 C9 C16 C17) (v6_ga_1_1 v6_ga_1_2 v6_ga_1_3 v6_ga_1_4)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_6-가-1_2014.dta" /*(2014년_ [6-가-1. 전체 교원 대비 전임교원 현황_])*/
            keep C5 C8 C9 C16 C17
            gen year = 2014
            destring C8 C9 C16 C17 , replace
                label var C5 "학교"
                label var C8 "학부_전임교원_계_남"
                label var C9 "학부_전임교원_계_여"
                label var C16 "학부_비전임교원_계_남"
                label var C17 "학부_비전임교원_계_여"
            rename C5 uniname
            rename (C8 C9 C16 C17) (v6_ga_1_1 v6_ga_1_2 v6_ga_1_3 v6_ga_1_4)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_6-가-1_2015.dta" /*(2015년_ [6-가-1. 전체 교원 대비 전임교원 현황_])*/
            keep C5 C8 C9 C16 C17
            gen year = 2015
            destring C8 C9 C16 C17 , replace
                label var C5 "학교"
                label var C8 "학부_전임교원_계_남"
                label var C9 "학부_전임교원_계_여"
                label var C16 "학부_비전임교원_계_남"
                label var C17 "학부_비전임교원_계_여"
            rename C5 uniname
            rename (C8 C9 C16 C17) (v6_ga_1_1 v6_ga_1_2 v6_ga_1_3 v6_ga_1_4)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_6-가-1_2016.dta" /*(2016년_ [6-가-1. 전체 교원 대비 전임교원 현황_])*/
            keep C5 C8 C9 C16 C17
            gen year = 2016
            destring C8 C9 C16 C17 , replace
                label var C5 "학교"
                label var C8 "학부_전임교원_계_남"
                label var C9 "학부_전임교원_계_여"
                label var C16 "학부_비전임교원_계_남"
                label var C17 "학부_비전임교원_계_여"
            rename C5 uniname
            rename (C8 C9 C16 C17) (v6_ga_1_1 v6_ga_1_2 v6_ga_1_3 v6_ga_1_4)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_6-가-1_2017.dta" /*(2017년_ [6-가-1. 전체 교원 대비 전임교원 현황_])*/
            keep C5 C8 C9 C16 C17
            gen year = 2017
            destring C8 C9 C16 C17 , replace
                label var C5 "학교"
                label var C8 "학부_전임교원_계_남"
                label var C9 "학부_전임교원_계_여"
                label var C16 "학부_비전임교원_계_남"
                label var C17 "학부_비전임교원_계_여"
            rename C5 uniname
            rename (C8 C9 C16 C17) (v6_ga_1_1 v6_ga_1_2 v6_ga_1_3 v6_ga_1_4)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_6-가-1_2018.dta" /*(2018년_ [6-가-1. 전체 교원 대비 전임교원 현황_])*/
            keep C5 C8 C9 C16 C17
            gen year = 2018
            destring C8 C9 C16 C17 , replace
                label var C5 "학교"
                label var C8 "학부_전임교원_계_남"
                label var C9 "학부_전임교원_계_여"
                label var C16 "학부_비전임교원_계_남"
                label var C17 "학부_비전임교원_계_여"
            rename C5 uniname
            rename (C8 C9 C16 C17) (v6_ga_1_1 v6_ga_1_2 v6_ga_1_3 v6_ga_1_4)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_6-가-1_2019.dta" /*(2019년_ [6-가-1. 전체 교원 대비 전임교원 현황_])*/
            keep C5 C8 C9 C16 C17
            gen year = 2019
            destring C8 C9 C16 C17 , replace
                label var C5 "학교"
                label var C8 "학부_전임교원_계_남"
                label var C9 "학부_전임교원_계_여"
                label var C16 "학부_비전임교원_계_남"
                label var C17 "학부_비전임교원_계_여"
            rename C5 uniname
            rename (C8 C9 C16 C17) (v6_ga_1_1 v6_ga_1_2 v6_ga_1_3 v6_ga_1_4)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_6-가-1_2020.dta" /*(2020년_ [6-가-1. 전체 교원 대비 전임교원 현황_])*/
            keep C5 C8 C9 C16 C17
            gen year = 2020
            destring C8 C9 C16 C17 , replace
                label var C5 "학교"
                label var C8 "학부_전임교원_계_남"
                label var C9 "학부_전임교원_계_여"
                label var C16 "학부_비전임교원_계_남"
                label var C17 "학부_비전임교원_계_여"
            rename C5 uniname
            rename (C8 C9 C16 C17) (v6_ga_1_1 v6_ga_1_2 v6_ga_1_3 v6_ga_1_4)
            append using `tfile1'
            save `tfile1' , replace
        replace uniname = subinstr(uniname, " _", "_", .)
        replace uniname = trim(uniname)
        drop if strpos(uniname , "폐교")
        merge 1:1 year uniname using `tfile2' , nogen
        save `tfile2' , replace
    /*}}}*/
    /*6-다-2 : 외국인 전임교원 현황 계산불가{{{*/
        /*use "대학_6-다-2_2008.dta" [>(2008년_ [6-다-2. 전공계열별 외국인 전임교원 현황_])<]*/
            /*keep C1 C2 C3*/
            /*gen year = 2008*/
            /*destring C2 C3 , replace*/
                /*label var C1 "학교"*/
                /*label var C2 "전임교원_계_남"*/
                /*label var C3 "전임교원_계_여"*/
            /*rename C1 uniname*/
            /*rename (C2 C3) (v6_da_2_1 v6_da_2_2)*/
            /*save `tfile1' , replace*/
        /*use "대학_6-다-2_2009.dta" [>(2009년_ [6-다-2. 전공계열별 외국인 전임교원 현황_])<]*/
            /*keep C1 C2 C3*/
            /*gen year = 2009*/
            /*destring C2 C3 , replace*/
                /*label var C1 "학교"*/
                /*label var C2 "전임교원_계_남"*/
                /*label var C3 "전임교원_계_여"*/
            /*rename C1 uniname*/
            /*rename (C2 C3) (v6_da_2_1 v6_da_2_2)*/
            /*append using `tfile1'*/
            /*save `tfile1' , replace*/
        /*use "대학_6-다-2_2010.dta" [>(2010년_ [6-다-2. 전공계열별 외국인 전임교원 현황_])<]*/
            /*keep C1 C2 C3*/
            /*gen year = 2010*/
            /*destring C2 C3 , replace*/
                /*label var C1 "학교"*/
                /*label var C2 "전임교원_계_남"*/
                /*label var C3 "전임교원_계_여"*/
            /*rename C1 uniname*/
            /*rename (C2 C3) (v6_da_2_1 v6_da_2_2)*/
            /*append using `tfile1'*/
            /*save `tfile1' , replace*/
        /*use "대학_6-다-2_2011.dta" [>(2011년_ [6-다-2. 전공계열별 외국인 전임교원 현황_])<]*/
            /*keep C1 C2 C3*/
            /*gen year = 2011*/
            /*destring C2 C3 , replace*/
                /*label var C1 "학교"*/
                /*label var C2 "전임교원_계_남"*/
                /*label var C3 "전임교원_계_여"*/
            /*rename C1 uniname*/
            /*rename (C2 C3) (v6_da_2_1 v6_da_2_2)*/
            /*append using `tfile1'*/
            /*save `tfile1' , replace*/
        /*use "대학_6-다-2_2012.dta" [>(2012년_ [6-다-2. 전공계열별 외국인 전임교원 현황_])<]*/
            /*keep C1 C2 C3*/
            /*gen year = 2012*/
            /*destring C2 C3 , replace*/
                /*label var C1 "학교"*/
                /*label var C2 "전임교원_계_남"*/
                /*label var C3 "전임교원_계_여"*/
            /*rename C1 uniname*/
            /*rename (C2 C3) (v6_da_2_1 v6_da_2_2)*/
            /*append using `tfile1'*/
            /*save `tfile1' , replace*/
        /*use "대학_6-다-2_2013.dta" [>(2013년_ [6-다-2. 전공계열별 외국인 전임교원 현황_])<]*/
            /*keep C5 C7 C8*/
            /*gen year = 2013*/
            /*destring C7 C8 , replace*/
                /*label var C5 "학교"*/
                /*label var C7 "전임교원_계_남"*/
                /*label var C8 "전임교원_계_여"*/
            /*rename C5 uniname*/
            /*rename (C7 C8) (v6_da_2_1 v6_da_2_2)*/
            /*append using `tfile1'*/
            /*save `tfile1' , replace*/
        /*use "대학_6-다-2_2014.dta" [>(2014년_ [6-다-2. 전공계열별 외국인 전임교원 현황_])<]*/
            /*keep C5 C7 C8*/
            /*gen year = 2014*/
            /*destring C7 C8 , replace*/
                /*label var C5 "학교"*/
                /*label var C7 "전임교원_계_남"*/
                /*label var C8 "전임교원_계_여"*/
            /*rename C5 uniname*/
            /*rename (C7 C8) (v6_da_2_1 v6_da_2_2)*/
            /*append using `tfile1'*/
            /*save `tfile1' , replace*/
        /*use "대학_6-다-2_2015.dta" [>(2015년_ [6-다-2. 전공계열별 외국인 전임교원 현황_])<]*/
            /*keep C5 C7 C8*/
            /*gen year = 2015*/
            /*destring C7 C8 , replace*/
                /*label var C5 "학교"*/
                /*label var C7 "전임교원_계_남"*/
                /*label var C8 "전임교원_계_여"*/
            /*rename C5 uniname*/
            /*rename (C7 C8) (v6_da_2_1 v6_da_2_2)*/
            /*append using `tfile1'*/
            /*save `tfile1' , replace*/
        /*use "대학_6-다-2_2016.dta" [>(2016년_ [6-다-2. 전공계열별 외국인 전임교원 현황_])<]*/
            /*keep C5 C7 C8*/
            /*gen year = 2016*/
            /*destring C7 C8 , replace*/
                /*label var C5 "학교"*/
                /*label var C7 "전임교원_계_남"*/
                /*label var C8 "전임교원_계_여"*/
            /*rename C5 uniname*/
            /*rename (C7 C8) (v6_da_2_1 v6_da_2_2)*/
            /*append using `tfile1'*/
            /*save `tfile1' , replace*/
        /*use "대학_6-다-2_2017.dta" [>(2017년_ [6-다-2. 전공계열별 외국인 전임교원 현황_])<]*/
            /*keep C5 C7 C8*/
            /*gen year = 2017*/
            /*destring C7 C8 , replace*/
                /*label var C5 "학교"*/
                /*label var C7 "전임교원_계_남"*/
                /*label var C8 "전임교원_계_여"*/
            /*rename C5 uniname*/
            /*rename (C7 C8) (v6_da_2_1 v6_da_2_2)*/
            /*append using `tfile1'*/
            /*save `tfile1' , replace*/
        /*use "대학_6-다-2_2018.dta" [>(2018년_ [6-다-2. 전공계열별 외국인 전임교원 현황_])<]*/
            /*keep C5 C7 C8*/
            /*gen year = 2018*/
            /*destring C7 C8 , replace*/
                /*label var C5 "학교"*/
                /*label var C7 "전임교원_계_남"*/
                /*label var C8 "전임교원_계_여"*/
            /*rename C5 uniname*/
            /*rename (C7 C8) (v6_da_2_1 v6_da_2_2)*/
            /*append using `tfile1'*/
            /*save `tfile1' , replace*/
        /*use "대학_6-다-2_2019.dta" [>(2019년_ [6-다-2. 전공계열별 외국인 전임교원 현황_])<]*/
            /*keep C5 C7 C8*/
            /*gen year = 2019*/
            /*destring C7 C8 , replace*/
                /*label var C5 "학교"*/
                /*label var C7 "전임교원_계_남"*/
                /*label var C8 "전임교원_계_여"*/
            /*rename C5 uniname*/
            /*rename (C7 C8) (v6_da_2_1 v6_da_2_2)*/
            /*append using `tfile1'*/
            /*save `tfile1' , replace*/
        /*use "대학_6-다-2_2020.dta" [>(2020년_ [6-다-2. 전공계열별 외국인 전임교원 현황_])<]*/
            /*keep C5 C7 C8*/
            /*gen year = 2020*/
            /*destring C7 C8 , replace*/
                /*label var C5 "학교"*/
                /*label var C7 "전임교원_계_남"*/
                /*label var C8 "전임교원_계_여"*/
            /*rename C5 uniname*/
            /*rename (C7 C8) (v6_da_2_1 v6_da_2_2)*/
            /*append using `tfile1'*/
            /*save `tfile1' , replace*/
        /*replace uniname = subinstr(uniname, " _", "_", .)*/
        /*replace uniname = trim(uniname)*/
        /*drop if strpos(uniname , "폐교")*/
        /*merge 1:1 year uniname using `tfile2' , nogen*/
        /*save `tfile2' , replace*/
    /*}}}*/
    /*7-가{{{*/
        use "대학_7-가_2008.dta" /*(2008년_ [7-가. 전임교원의 연구 실적_])*/
            keep C1 C2 C3
            gen year = 2008
            destring C2 C3 , replace
                label var C1 "학교"
                label var C2 "전임 교원"
                label var C3 "연구실적 (논문)_총계"
            rename C1 uniname
            rename (C2 C3) (v7_ga_1 v7_ga_2)
            save `tfile1' , replace
        use "대학_7-가_2009.dta" /*(2009년_ [7-가. 전임교원의 연구 실적_])*/
            keep C1 C2 C3
            gen year = 2009
            destring C2 C3 , replace
                label var C1 "학교"
                label var C2 "전임 교원"
                label var C3 "연구실적 (논문)_총계"
            rename C1 uniname
            rename (C2 C3) (v7_ga_1 v7_ga_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_7-가_2010.dta" /*(2010년_ [7-가. 전임교원의 연구 실적_])*/
            keep C1 C2 C3
            gen year = 2010
            destring C2 C3 , replace
                label var C1 "학교"
                label var C2 "전임 교원"
                label var C3 "연구실적 (논문)_총계"
            rename C1 uniname
            rename (C2 C3) (v7_ga_1 v7_ga_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_7-가_2011.dta" /*(2011년_ [7-가. 전임교원의 연구 실적_])*/
            keep C1 C2 C3
            gen year = 2011
            destring C2 C3 , replace
                label var C1 "학교"
                label var C2 "전임 교원"
                label var C3 "연구실적 (논문)_총계"
            rename C1 uniname
            rename (C2 C3) (v7_ga_1 v7_ga_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_7-가_2012.dta" /*(2012년_ [7-가. 전임교원의 연구 실적_])*/
            keep C1 C2 C3
            gen year = 2012
            destring C2 C3 , replace
                label var C1 "학교"
                label var C2 "전임 교원"
                label var C3 "연구실적 (논문)_총계"
            rename C1 uniname
            rename (C2 C3) (v7_ga_1 v7_ga_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_7-가_2013.dta" /*(2013년_ [7-가. 전임교원의 연구 실적_])*/
            keep C5 C6 C7
            gen year = 2013
            destring C6 C7 , replace
                label var C5 "학교"
                label var C6 "전임 교원"
                label var C7 "연구실적 (논문)_총계"
            rename C5 uniname
            rename (C6 C7) (v7_ga_1 v7_ga_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_7-가_2014.dta" /*(2014년_ [7-가. 전임교원의 연구 실적_])*/
            keep C5 C6 C7
            gen year = 2014
            destring C6 C7 , replace
                label var C5 "학교"
                label var C6 "전임교원"
                label var C7 "논문 실적"
            rename C5 uniname
            rename (C6 C7) (v7_ga_1 v7_ga_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_7-가_2015.dta" /*(2015년_ [7-가. 전임교원의 연구 실적_])*/
            keep C5 C6 C7
            gen year = 2015
            destring C6 C7 , replace
                label var C5 "학교"
                label var C6 "전임교원"
                label var C7 "논문 실적"
            rename C5 uniname
            rename (C6 C7) (v7_ga_1 v7_ga_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_7-가_2016.dta" /*(2016년_ [7-가. 전임교원의 연구 실적_])*/
            keep C5 C6 C7
            gen year = 2016
            destring C6 C7 , replace
                label var C5 "학교"
                label var C6 "전임교원"
                label var C7 "논문 실적"
            rename C5 uniname
            rename (C6 C7) (v7_ga_1 v7_ga_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_7-가_2017.dta" /*(2017년_ [7-가. 전임교원의 연구 실적_])*/
            keep C5 C6 C9 C10
            gen year = 2017
            destring C6 C9 C10 , replace
                label var C5 "학교"
                label var C6 "전임 교원"
                label var C9 "논문 실적_총계_남"
                label var C10 "논문 실적_총계_여"
            rename C5 uniname
            rename (C6 C9 C10) (v7_ga_1 v7_ga_3 v7_ga_4)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_7-가_2018.dta" /*(2018년_ [7-가. 전임교원의 연구 실적_])*/
            keep C5 C6 C9
            gen year = 2018
            destring C6 C9 , replace
                label var C5 "학교"
                label var C6 "전임 교원_계"
                label var C9 "논문 실적_총계_계"
            rename C5 uniname
            rename (C6 C9) (v7_ga_1 v7_ga_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_7-가_2019.dta" /*(2019년_ [7-가. 전임교원의 연구 실적_])*/
            keep C5 C6 C9
            gen year = 2019
            destring C6 C9 , replace
                label var C5 "학교"
                label var C6 "전임 교원_계"
                label var C9 "논문 실적_총계_계"
            rename C5 uniname
            rename (C6 C9) (v7_ga_1 v7_ga_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_7-가_2020.dta" /*(2020년_ [7-가. 전임교원의 연구 실적_])*/
            keep C5 C6 C9
            gen year = 2020
            destring C6 C9 , replace
                label var C5 "학교"
                label var C6 "전임 교원_계"
                label var C9 "논문 실적_총계_계"
            rename C5 uniname
            rename (C6 C9) (v7_ga_1 v7_ga_2)
            append using `tfile1'
            save `tfile1' , replace
        replace uniname = subinstr(uniname, " _", "_", .)
        replace uniname = trim(uniname)
        drop if strpos(uniname , "폐교")
        merge 1:1 year uniname using `tfile2' , nogen
        save `tfile2' , replace
    /*}}}*/
    /*8-아{{{*/
        use "대학_8-아_2008.dta" /*(2008년_ [8-아. 기부금 현황_])*/
            keep C1 C5
            gen year = 2008
            destring C5 , replace
                label var C1 "학교명"
                label var C5 "당해연도 합계 (D=A+B+C)"
            rename C1 uniname
            rename (C5) (v8_ah)
            save `tfile1' , replace
        use "대학_8-아_2009.dta" /*(2009년_ [8-아. 기부금 현황_])*/
            keep C1 C5
            gen year = 2009
            destring C5 , replace
                label var C1 "학교명"
                label var C5 "당해연도 합계 (D=A+B+C)"
            rename C1 uniname
            rename (C5) (v8_ah)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_8-아_2010.dta" /*(2010년_ [8-아. 기부금 현황_])*/
            keep C1 C5
            gen year = 2010
            destring C5 , replace
                label var C1 "학교명"
                label var C5 "당해연도 합계 (D=A+B+C)"
            rename C1 uniname
            rename (C5) (v8_ah)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_8-아_2011.dta" /*(2011년_ [8-아. 기부금 현황_])*/
            keep C1 C5
            gen year = 2011
            destring C5 , replace
                label var C1 "학교명"
                label var C5 "당해연도 합계 (D=A+B+C)"
            rename C1 uniname
            rename (C5) (v8_ah)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_8-아_2012.dta" /*(2012년_ [8-아. 기부금 현황_])*/
            keep C1 C5
            gen year = 2012
            destring C5 , replace
                label var C1 "학교명"
                label var C5 "당해연도 합계 (D=A+B+C)"
            rename C1 uniname
            rename (C5) (v8_ah)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_8-아_2013.dta" /*(2013년_ [8-아. 기부금 현황_])*/
            keep C5 C9
            gen year = 2013
            destring C9 , replace
                label var C5 "학교"
                label var C9 "당해연도 합계 (D=A+B+C)"
            rename C5 uniname
            rename (C9) (v8_ah)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_8-아_2014.dta" /*(2014년_ [8-아. 기부금 현황_])*/
            keep C5 C9
            gen year = 2014
            destring C9 , replace
                label var C5 "학교"
                label var C9 "당해연도 합계 (D=A+B+C)"
            rename C5 uniname
            rename (C9) (v8_ah)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_8-아_2015.dta" /*(2015년_ [8-아. 기부금 현황_])*/
            keep C5 C9
            gen year = 2015
            destring C9 , replace
                label var C5 "학교"
                label var C9 "당해연도 합계 (D=A+B+C)"
            rename C5 uniname
            rename (C9) (v8_ah)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_8-아_2016.dta" /*(2016년_ [8-아. 기부금 현황_])*/
            keep C5 C9
            gen year = 2016
            destring C9 , replace
                label var C5 "학교"
                label var C9 "당해연도 합계 (D=A+B+C)"
            rename C5 uniname
            rename (C9) (v8_ah)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_8-아_2017.dta" /*(2017년_ [8-아. 기부금 현황_])*/
            keep C5 C9
            gen year = 2017
            destring C9 , replace
                label var C5 "학교"
                label var C9 "당해연도 합계 (D=A+B+C)"
            rename C5 uniname
            rename (C9) (v8_ah)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_8-아_2018.dta" /*(2018년_ [8-아. 기부금 현황_])*/
            keep C5 C9
            gen year = 2018
            destring C9 , replace
                label var C5 "학교"
                label var C9 "당해연도 합계 (D=A+B+C)"
            rename C5 uniname
            rename (C9) (v8_ah)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_8-아_2019.dta" /*(2019년_ [8-아. 기부금 현황_])*/
            keep C5 C9
            gen year = 2019
            destring C9 , replace
                label var C5 "학교"
                label var C9 "당해연도 합계 (D=A+B+C)"
            rename C5 uniname
            rename (C9) (v8_ah)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_8-아_2020.dta" /*(2020년_ [8-아. 기부금 현황_])*/
            keep C5 C9
            gen year = 2020
            destring C9 , replace
                label var C5 "학교"
                label var C9 "당해연도 합계 (D=A+B+C)"
            rename C5 uniname
            rename (C9) (v8_ah)
            append using `tfile1'
            save `tfile1' , replace
        replace uniname = subinstr(uniname, " _", "_", .)
        replace uniname = trim(uniname)
        drop if strpos(uniname , "폐교")
        merge 1:1 year uniname using `tfile2' , nogen
        save `tfile2' , replace
    /*}}}*/
    /*8-차-1{{{*/
        use "대학_8-차-1_2010.dta" /*(2010년_ [8-차-1. 등록금 현황_])*/
            keep C1 C5
            gen year = 2010
            destring C5 , replace
                label var C1 "학교명"
                label var C5 "등록금 (D=B+C)"
            rename C1 uniname
            rename (C5) (v8_cha_1)
            save `tfile1' , replace
        use "대학_8-차-1_2011.dta" /*(2011년_ [8-차-1. 등록금 현황_])*/
            keep C1 C5
            gen year = 2011
            destring C5 , replace
                label var C1 "학교명"
                label var C5 "등록금 (D=B+C)"
            rename C1 uniname
            rename (C5) (v8_cha_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_8-차-1_2012.dta" /*(2012년_ [8-차-1. 등록금 현황_])*/
            keep C1 C5
            gen year = 2012
            destring C5 , replace
                label var C1 "학교명"
                label var C5 "등록금 (D=B+C)"
            rename C1 uniname
            rename (C5) (v8_cha_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_8-차-1_2013.dta" /*(2013년_ [8-차-1. 등록금 현황_])*/
            keep C5 C9
            gen year = 2013
            destring C9 , replace
                label var C5 "학교"
                label var C9 "등록금 (D=B+C)"
            rename C5 uniname
            rename (C9) (v8_cha_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_8-차-1_2014.dta" /*(2014년_ [8-차-1. 등록금 현황_])*/
            keep C5 C9
            gen year = 2014
            destring C9 , replace
                label var C5 "학교"
                label var C9 "등록금 (D=B+C)"
            rename C5 uniname
            rename (C9) (v8_cha_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_8-차-1_2015.dta" /*(2015년_ [8-차-1. 등록금 현황_])*/
            keep C5 C9
            gen year = 2015
            destring C9 , replace
                label var C5 "학교"
                label var C9 "등록금 (D=B+C)"
            rename C5 uniname
            rename (C9) (v8_cha_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_8-차-1_2016.dta" /*(2016년_ [8-차-1. 등록금 현황_])*/
            keep C5 C9
            gen year = 2016
            destring C9 , replace
                label var C5 "학교"
                label var C9 "등록금 (D=B+C)"
            rename C5 uniname
            rename (C9) (v8_cha_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_8-차-1_2017.dta" /*(2017년_ [8-차-1. 등록금 현황_])*/
            keep C5 C8
            gen year = 2017
            destring C8 , replace
                label var C5 "학교"
                label var C8 "등록금 (D=B)"
            rename C5 uniname
            rename (C8) (v8_cha_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_8-차-1_2018.dta" /*(2018년_ [8-차-1. 등록금 현황_])*/
            keep C5 C8
            gen year = 2018
            destring C8 , replace
                label var C5 "학교"
                label var C8 "등록금 (D=B)"
            rename C5 uniname
            rename (C8) (v8_cha_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_8-차-1_2019.dta" /*(2019년_ [8-차-1. 등록금 현황_])*/
            keep C5 C8
            gen year = 2019
            destring C8 , replace
                label var C5 "학교"
                label var C8 "등록금 (D=B)"
            rename C5 uniname
            rename (C8) (v8_cha_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_8-차-1_2020.dta" /*(2020년_ [8-차-1. 등록금 현황_])*/
            keep C5 C8
            gen year = 2020
            destring C8 , replace
                label var C5 "학교"
                label var C8 "등록금 (D=B)"
            rename C5 uniname
            rename (C8) (v8_cha_1)
            append using `tfile1'
            save `tfile1' , replace
        replace uniname = subinstr(uniname, " _", "_", .)
        replace uniname = trim(uniname)
        drop if strpos(uniname , "폐교")
        merge 1:1 year uniname using `tfile2' , nogen
        save `tfile2' , replace
    /*}}}*/
    /*12-다-1{{{*/
        use "대학_12-다-1_2009.dta" /*(2009년_ [12-다-1. 장학금 수혜 현황_])*/
            keep C1 C21
            gen year = 2009
            destring C21 , replace
                label var C1 "학교명"
                label var C21 "재학생 1인당 장학금"
            rename C1 uniname
            rename (C21) (v12_da_1)
            save `tfile1' , replace
        use "대학_12-다-1_2010.dta" /*(2010년_ [12-다-1. 장학금 수혜 현황_])*/
            keep C1 C21
            gen year = 2010
            destring C21 , replace
                label var C1 "학교명"
                label var C21 "재학생 1인당 장학금"
            rename C1 uniname
            rename (C21) (v12_da_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-다-1_2011.dta" /*(2011년_ [12-다-1. 장학금 수혜 현황_])*/
            keep C1 C21
            gen year = 2011
            destring C21 , replace
                label var C1 "학교명"
                label var C21 "재학생 1인당 장학금"
            rename C1 uniname
            rename (C21) (v12_da_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-다-1_2012.dta" /*(2012년_ [12-다-1. 장학금 수혜 현황_])*/
            keep C1 C25
            gen year = 2012
            destring C25 , replace
                label var C1 "학교명"
                label var C25 "재학생 1인당 장학금"
            rename C1 uniname
            rename (C25) (v12_da_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-다-1_2013.dta" /*(2013년_ [12-다-1. 장학금 수혜 현황_])*/
            keep C5 C29
            gen year = 2013
            destring C29 , replace
                label var C5 "학교명"
                label var C29 "재학생 1인당 장학금"
            rename C5 uniname
            rename (C29) (v12_da_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-다-1_2014.dta" /*(2014년_ [12-다-1. 장학금 수혜 현황_])*/
            keep C5 C18
            gen year = 2014
            destring C18 , replace
                label var C5 "학교명"
                label var C18 "재학생 1인당 장학금"
            rename C5 uniname
            rename (C18) (v12_da_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-다-1_2015.dta" /*(2015년_ [12-다-1. 장학금 수혜 현황_])*/
            keep C5 C18
            gen year = 2015
            destring C18 , replace
                label var C5 "학교명"
                label var C18 "재학생 1인당 장학금"
            rename C5 uniname
            rename (C18) (v12_da_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-다-1_2016.dta" /*(2016년_ [12-다-1. 장학금 수혜 현황_])*/
            keep C5 C19
            gen year = 2016
            destring C19 , replace
                label var C5 "학교명"
                label var C19 "재학생 1인당 장학금"
            rename C5 uniname
            rename (C19) (v12_da_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-다-1_2017.dta" /*(2017년_ [12-다-1. 장학금 수혜 현황_])*/
            keep C5 C19
            gen year = 2017
            destring C19 , replace
                label var C5 "학교명"
                label var C19 "재학생 1인당 장학금"
            rename C5 uniname
            rename (C19) (v12_da_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-다-1_2018.dta" /*(2018년_ [12-다-1. 장학금 수혜 현황_])*/
            keep C5 C19
            gen year = 2018
            destring C19 , replace
                label var C5 "학교명"
                label var C19 "재학생 1인당 장학금"
            rename C5 uniname
            rename (C19) (v12_da_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-다-1_2019.dta" /*(2019년_ [12-다-1. 장학금 수혜 현황_])*/
            keep C5 C19
            gen year = 2019
            destring C19 , replace
                label var C5 "학교명"
                label var C19 "재학생 1인당 장학금"
            rename C5 uniname
            rename (C19) (v12_da_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-다-1_2020.dta" /*(2020년_ [12-다-1. 장학금 수혜 현황_])*/
            keep C5 C19
            gen year = 2020
            destring C19 , replace
                label var C5 "학교명"
                label var C19 "재학생 1인당 장학금"
            rename C5 uniname
            rename (C19) (v12_da_1)
            append using `tfile1'
            save `tfile1' , replace
        replace uniname = subinstr(uniname, " _", "_", .)
        replace uniname = trim(uniname)
        drop if strpos(uniname , "폐교")
        merge 1:1 year uniname using `tfile2' , nogen
        save `tfile2' , replace
    /*}}}*/
    /*12-라-2{{{*/
        use "대학_12-라-2_2008.dta" /*(2008년_ [12-라-2. 외국대학과 학점 교류 현황_])*/
            keep C1 C2 C3
            gen year = 2008
            destring C2 C3 , replace
                label var C1 "학교명"
                label var C2 "파견인원 (자대학교 → 타대학교)"
                label var C3 "유치인원 (타대학교 → 자대학교)"
            rename C1 uniname
            rename (C2 C3) (v12_ra_2_1 v12_ra_2_2)
            save `tfile1' , replace
        use "대학_12-라-2_2009.dta" /*(2009년_ [12-라-2. 외국대학과 학점 교류 현황_])*/
            keep C1 C2 C3
            gen year = 2009
            destring C2 C3 , replace
                label var C1 "학교명"
                label var C2 "파견인원 (자대학교 → 타대학교)"
                label var C3 "유치인원 (타대학교 → 자대학교)"
            rename C1 uniname
            rename (C2 C3) (v12_ra_2_1 v12_ra_2_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-라-2_2010.dta" /*(2010년_ [12-라-2. 외국대학과 학점 교류 현황_])*/
            keep C1 C2 C3
            gen year = 2010
            destring C2 C3 , replace
                label var C1 "학교명"
                label var C2 "파견인원 (자대학교 → 타대학교)"
                label var C3 "유치인원 (타대학교 → 자대학교)"
            rename C1 uniname
            rename (C2 C3) (v12_ra_2_1 v12_ra_2_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-라-2_2011.dta" /*(2011년_ [12-라-2. 외국대학과 학점 교류 현황_])*/
            keep C1 C2 C3
            gen year = 2011
            destring C2 C3 , replace
                label var C1 "학교명"
                label var C2 "파견인원 (자대학교 → 타대학교)"
                label var C3 "유치인원 (타대학교 → 자대학교)"
            rename C1 uniname
            rename (C2 C3) (v12_ra_2_1 v12_ra_2_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-라-2_2012.dta" /*(2012년_ [12-라-2. 외국대학과 학점 교류 현황_])*/
            keep C1 C2 C3
            gen year = 2012
            destring C2 C3 , replace
                label var C1 "학교명"
                label var C2 "파견인원 (자대학교 → 타대학교)"
                label var C3 "유치인원 (타대학교 → 자대학교)"
            rename C1 uniname
            rename (C2 C3) (v12_ra_2_1 v12_ra_2_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-라-2_2013.dta" /*(2013년_ [12-라-2. 외국대학과 학점 교류 현황_])*/
            keep C5 C6 C7
            gen year = 2013
            destring C6 C7 , replace
                label var C5 "학교명"
                label var C6 "파견인원 (자대학교 → 타대학교)"
                label var C7 "유치인원 (타대학교 → 자대학교)"
            rename C5 uniname
            rename (C6 C7) (v12_ra_2_1 v12_ra_2_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-라-2_2014.dta" /*(2014년_ [12-라-2. 외국대학과 학점 교류 현황_])*/
            keep C5 C6 C7
            gen year = 2014
            destring C6 C7 , replace
                label var C5 "학교명"
                label var C6 "파견인원 (자대학교 → 타대학교)"
                label var C7 "유치인원 (타대학교 → 자대학교)"
            rename C5 uniname
            rename (C6 C7) (v12_ra_2_1 v12_ra_2_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-라-2_2015.dta" /*(2015년_ [12-라-2. 외국대학과 학점 교류 현황_])*/
            keep C5 C6 C7
            gen year = 2015
            destring C6 C7 , replace
                label var C5 "학교명"
                label var C6 "파견인원 (자대학교 → 타대학교)"
                label var C7 "유치인원 (타대학교 → 자대학교)"
            rename C5 uniname
            rename (C6 C7) (v12_ra_2_1 v12_ra_2_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-라-2_2016.dta" /*(2016년_ [12-라-2. 외국대학과 학점 교류 현황_])*/
            keep C5 C6 C7
            gen year = 2016
            destring C6 C7 , replace
                label var C5 "학교명"
                label var C6 "파견인원 (자대학교 → 타대학교)"
                label var C7 "유치인원 (타대학교 → 자대학교)"
            rename C5 uniname
            rename (C6 C7) (v12_ra_2_1 v12_ra_2_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-라-2_2017.dta" /*(2017년_ [12-라-2. 외국대학과 학점 교류 현황_])*/
            keep C5 C6 C7
            gen year = 2017
            destring C6 C7 , replace
                label var C5 "학교명"
                label var C6 "파견인원 (자대학교 → 타대학교)"
                label var C7 "유치인원 (타대학교 → 자대학교)"
            rename C5 uniname
            rename (C6 C7) (v12_ra_2_1 v12_ra_2_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-라-2_2018.dta" /*(2018년_ [12-라-2. 외국대학과 학점 교류 현황_])*/
            keep C5 C6 C7
            gen year = 2018
            destring C6 C7 , replace
                label var C5 "학교명"
                label var C6 "파견인원 (자대학교 → 타대학교)"
                label var C7 "유치인원 (타대학교 → 자대학교)"
            rename C5 uniname
            rename (C6 C7) (v12_ra_2_1 v12_ra_2_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-라-2_2019.dta" /*(2019년_ [12-라-2. 외국대학과 학점 교류 현황_])*/
            keep C5 C6 C7
            gen year = 2019
            destring C6 C7 , replace
                label var C5 "학교명"
                label var C6 "파견인원 (자대학교 → 타대학교)"
                label var C7 "유치인원 (타대학교 → 자대학교)"
            rename C5 uniname
            rename (C6 C7) (v12_ra_2_1 v12_ra_2_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-라-2_2020.dta" /*(2020년_ [12-라-2. 외국대학과 학점 교류 현황_])*/
            keep C5 C6 C7
            gen year = 2020
            destring C6 C7 , replace
                label var C5 "학교명"
                label var C6 "파견인원 (자대학교 → 타대학교)"
                label var C7 "유치인원 (타대학교 → 자대학교)"
            rename C5 uniname
            rename (C6 C7) (v12_ra_2_1 v12_ra_2_2)
            append using `tfile1'
            save `tfile1' , replace
        replace uniname = subinstr(uniname, " _", "_", .)
        replace uniname = trim(uniname)
        drop if strpos(uniname , "폐교")
        merge 1:1 year uniname using `tfile2' , nogen
        save `tfile2' , replace
    /*}}}*/
    /*12-아{{{*/
        use "대학_12-아_2008.dta" /*(2008년_ [12-아. 산업체 경력 전임교원 현황_])*/
            keep C1 C2 C3 C4 C5
            gen year = 2008
            destring C2 C3 C4 C5 , replace
                label var C1 "학교"
                label var C2 "산업체 경력 전임교원_1년 미만"
                label var C3 "산업체 경력 전임교원_1년 ~ 3년 미만"
                label var C4 "산업체 경력 전임교원_3년 ~ 5년 미만"
                label var C5 "산업체 경력 전임교원_5년 이상"
            rename C1 uniname
            rename (C2 C3 C4 C5) (v12_ah_1 v12_ah_2 v12_ah_3 v12_ah_4)
            save `tfile1' , replace
        use "대학_12-아_2009.dta" /*(2009년_ [12-아. 산업체 경력 전임교원 현황_])*/
            keep C1 C2 C3 C4 C5
            gen year = 2009
            destring C2 C3 C4 C5 , replace
                label var C1 "학교"
                label var C2 "산업체 경력 전임교원_1년 미만"
                label var C3 "산업체 경력 전임교원_1년 ~ 3년 미만"
                label var C4 "산업체 경력 전임교원_3년 ~ 5년 미만"
                label var C5 "산업체 경력 전임교원_5년 이상"
            rename C1 uniname
            rename (C2 C3 C4 C5) (v12_ah_1 v12_ah_2 v12_ah_3 v12_ah_4)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-아_2011.dta" /*(2011년_ [12-아. 산업체 경력 전임교원 현황_])*/
            keep C1 C2 C3 C4 C5
            gen year = 2011
            destring C2 C3 C4 C5 , replace
                label var C1 "학교"
                label var C2 "산업체 경력 전임교원_1년 미만"
                label var C3 "산업체 경력 전임교원_1년 ~ 3년 미만"
                label var C4 "산업체 경력 전임교원_3년 ~ 5년 미만"
                label var C5 "산업체 경력 전임교원_5년 이상"
            rename C1 uniname
            rename (C2 C3 C4 C5) (v12_ah_1 v12_ah_2 v12_ah_3 v12_ah_4)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-아_2012.dta" /*(2012년_ [12-아. 산업체 경력 전임교원 현황_])*/
            keep C1 C2 C3 C4 C5 C6 C7
            gen year = 2012
            destring C2 C3 C4 C5 C6 C7 , replace
                label var C1 "학교"
                label var C2 "학교_경력없음"
                label var C3 "산업체 경력 전임교원_1년 미만"
                label var C4 "산업체 경력 전임교원_1년 ~ 3년 미만"
                label var C5 "산업체 경력 전임교원_3년 ~ 5년 미만"
                label var C6 "산업체 경력 전임교원_5년~10년미만"
                label var C7 "산업체 경력 전임교원_10년 이상"
            rename C1 uniname
            rename (C2 C3 C4 C5 C6 C7) (v12_ah_6 v12_ah_1 v12_ah_2 v12_ah_3 v12_ah_4 v12_ah_5)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-아_2013.dta" /*(2013년_ [12-아. 산업체 경력 전임교원 현황_])*/
            keep C5 C6 C7 C8 C9 C10 C11
            gen year = 2013
            destring C6 C7 C8 C9 C10 C11 , replace
                label var C5 "학교"
                label var C6 "5년 이내 신규임용 전임교원_경력없음"
                label var C7 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_1년 미만"
                label var C8 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_1년 ~ 3년 미만"
                label var C9 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_3년 ~ 5년 미만"
                label var C10 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_5년~10년미만"
                label var C11 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_10년 이상"
            rename C5 uniname
            rename (C6 C7 C8 C9 C10 C11) (v12_ah_6 v12_ah_1 v12_ah_2 v12_ah_3 v12_ah_4 v12_ah_5)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-아_2014.dta" /*(2014년_ [12-아. 산업체 경력 전임교원 현황_])*/
            keep C5 C6 C7 C8 C9 C10 C11
            gen year = 2014
            destring C6 C7 C8 C9 C10 C11 , replace
                label var C5 "학교"
                label var C6 "5년 이내 신규임용 전임교원_경력없음"
                label var C7 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_1년 미만"
                label var C8 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_1년 ~ 3년 미만"
                label var C9 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_3년 ~ 5년 미만"
                label var C10 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_5년~10년미만"
                label var C11 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_10년 이상"
            rename C5 uniname
            rename (C6 C7 C8 C9 C10 C11) (v12_ah_6 v12_ah_1 v12_ah_2 v12_ah_3 v12_ah_4 v12_ah_5)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-아_2015.dta" /*(2015년_ [12-아. 산업체 경력 전임교원 현황_])*/
            keep C5 C6 C7 C8 C9 C10 C11
            gen year = 2015
            destring C6 C7 C8 C9 C10 C11 , replace
                label var C5 "학교"
                label var C6 "5년 이내 신규임용 전임교원_경력없음"
                label var C7 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_1년 미만"
                label var C8 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_1년 ~ 3년 미만"
                label var C9 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_3년 ~ 5년 미만"
                label var C10 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_5년~10년미만"
                label var C11 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_10년 이상"
            rename C5 uniname
            rename (C6 C7 C8 C9 C10 C11) (v12_ah_6 v12_ah_1 v12_ah_2 v12_ah_3 v12_ah_4 v12_ah_5)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-아_2016.dta" /*(2016년_ [12-아. 산업체 경력 전임교원 현황_])*/
            keep C5 C6 C7 C8 C9 C10 C11
            gen year = 2016
            destring C6 C7 C8 C9 C10 C11 , replace
                label var C5 "학교"
                label var C6 "5년 이내 신규임용 전임교원_경력없음"
                label var C7 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_1년 미만"
                label var C8 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_1년 ~ 3년 미만"
                label var C9 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_3년 ~ 5년 미만"
                label var C10 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_5년~10년미만"
                label var C11 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_10년 이상"
            rename C5 uniname
            rename (C6 C7 C8 C9 C10 C11) (v12_ah_6 v12_ah_1 v12_ah_2 v12_ah_3 v12_ah_4 v12_ah_5)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-아_2017.dta" /*(2017년_ [12-아. 산업체 경력 전임교원 현황_])*/
            keep C5 C6 C7 C8 C9 C10 C11
            gen year = 2017
            destring C6 C7 C8 C9 C10 C11 , replace
                label var C5 "학교"
                label var C6 "5년 이내 신규임용 전임교원_경력없음"
                label var C7 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_1년 미만"
                label var C8 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_1년 ~ 3년 미만"
                label var C9 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_3년 ~ 5년 미만"
                label var C10 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_5년~10년미만"
                label var C11 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_10년 이상"
            rename C5 uniname
            rename (C6 C7 C8 C9 C10 C11) (v12_ah_6 v12_ah_1 v12_ah_2 v12_ah_3 v12_ah_4 v12_ah_5)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-아_2018.dta" /*(2018년_ [12-아. 산업체 경력 전임교원 현황_])*/
            keep C5 C6 C7 C8 C9 C10 C11
            gen year = 2018
            destring C6 C7 C8 C9 C10 C11 , replace
                label var C5 "학교"
                label var C6 "5년 이내 신규임용 전임교원_경력없음"
                label var C7 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_1년 미만"
                label var C8 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_1년 ~ 3년 미만"
                label var C9 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_3년 ~ 5년 미만"
                label var C10 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_5년~10년미만"
                label var C11 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_10년 이상"
            rename C5 uniname
            rename (C6 C7 C8 C9 C10 C11) (v12_ah_6 v12_ah_1 v12_ah_2 v12_ah_3 v12_ah_4 v12_ah_5)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-아_2019.dta" /*(2019년_ [12-아. 산업체 경력 전임교원 현황_])*/
            keep C5 C6 C7 C8 C9 C10 C11
            gen year = 2019
            destring C6 C7 C8 C9 C10 C11 , replace
                label var C5 "학교"
                label var C6 "5년 이내 신규임용 전임교원_경력없음"
                label var C7 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_1년 미만"
                label var C8 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_1년 ~ 3년 미만"
                label var C9 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_3년 ~ 5년 미만"
                label var C10 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_5년~10년미만"
                label var C11 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_10년 이상"
            rename C5 uniname
            rename (C6 C7 C8 C9 C10 C11) (v12_ah_6 v12_ah_1 v12_ah_2 v12_ah_3 v12_ah_4 v12_ah_5)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-아_2020.dta" /*(2020년_ [12-아. 산업체 경력 전임교원 현황_])*/
            keep C5 C6 C7 C8 C9 C10 C11
            gen year = 2020
            destring C6 C7 C8 C9 C10 C11 , replace
                label var C5 "학교"
                label var C6 "5년 이내 신규임용 전임교원_경력없음"
                label var C7 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_1년 미만"
                label var C8 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_1년 ~ 3년 미만"
                label var C9 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_3년 ~ 5년 미만"
                label var C10 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_5년~10년미만"
                label var C11 "5년 이내 신규임용 전임교원_산업체 경력 전임교원_10년 이상"
            rename C5 uniname
            rename (C6 C7 C8 C9 C10 C11) (v12_ah_6 v12_ah_1 v12_ah_2 v12_ah_3 v12_ah_4 v12_ah_5)
            append using `tfile1'
            save `tfile1' , replace
        replace uniname = subinstr(uniname, " _", "_", .)
        replace uniname = trim(uniname)
        drop if strpos(uniname , "폐교")
        merge 1:1 year uniname using `tfile2' , nogen
        save `tfile2' , replace
    /*}}}*/
    /*12-카-1{{{*/
        use "대학_12-카-1_2008.dta" /*(2008년_ [12-카-1. 현장실습 운영 현황_])*/
            keep C1 C2
            gen year = 2008
            destring C2 , replace
                label var C1 "학교"
                label var C2 "현장실습 이수 학생수(B)"
            rename C1 uniname
            rename (C2) (v12_ka_1_1)
            save `tfile1' , replace
        use "대학_12-카-1_2009.dta" /*(2009년_ [12-카-1. 현장실습 운영 현황_])*/
            keep C1 C2
            gen year = 2009
            destring C2 , replace
                label var C1 "학교"
                label var C2 "현장실습 이수 학생수(B)"
            rename C1 uniname
            rename (C2) (v12_ka_1_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-카-1_2010.dta" /*(2010년_ [12-카-1. 현장실습 운영 현황_])*/
            keep C1 C2
            gen year = 2010
            destring C2 , replace
                label var C1 "학교"
                label var C2 "현장실습 이수 학생수(B)"
            rename C1 uniname
            rename (C2) (v12_ka_1_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-카-1_2011.dta" /*(2011년_ [12-카-1. 현장실습 운영 현황_])*/
            keep C1 C2
            gen year = 2011
            destring C2 , replace
                label var C1 "학교"
                label var C2 "현장실습 이수 학생수(B)"
            rename C1 uniname
            rename (C2) (v12_ka_1_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-카-1_2012.dta" /*(2012년_ [12-카-1. 현장실습 운영 현황_])*/
            keep C1 C2
            gen year = 2012
            destring C2 , replace
                label var C1 "학교"
                label var C2 "현장실습 이수 학생수(B)"
            rename C1 uniname
            rename (C2) (v12_ka_1_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-카-1_2013.dta" /*(2013년_ [12-카-1. 현장실습 운영 현황_])*/
            keep C5 C6
            gen year = 2013
            destring C6 , replace
                label var C5 "학교"
                label var C6 "현장실습 이수 학생수(B)"
            rename C5 uniname
            rename (C6) (v12_ka_1_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-카-1_2014.dta" /*(2014년_ [12-카-1. 현장실습 운영 현황_])*/
            keep C5 C6
            gen year = 2014
            destring C6 , replace
                label var C5 "학교"
                label var C6 "현장실습 이수 학생수(B)"
            rename C5 uniname
            rename (C6) (v12_ka_1_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-카-1_2015.dta" /*(2015년_ [12-카-1. 현장실습 운영 현황_])*/
            keep C5 C7 C9 C11
            gen year = 2015
            destring C7 C9 C11 , replace
                label var C5 "학교"
                label var C7 "실습기간_4주 이상(160~320시간)_현장실습 이수학생 수"
                label var C9 "실습기간_8주 이상(320~480시간)_현장실습 이수학생 수"
                label var C11 "실습기간_12주 이상(480시간 이상)_현장실습 이수학생 수"
            rename C5 uniname
            rename (C7 C9 C11) (v12_ka_1_2 v12_ka_1_3 v12_ka_1_4)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-카-1_2016.dta" /*(2016년_ [12-카-1. 현장실습 운영 현황_])*/
            keep C1 C7 C11 C15
            gen year = 2016
            destring C7 C11 C15 , replace
                label var C1 "학교"
                label var C7 "실습기간_4주 이상(160~320시간)_현장실습 이수학생 수"
                label var C11 "실습기간_8주 이상(320~480시간)_현장실습 이수학생 수"
                label var C15 "실습기간_12주 이상(480시간 이상)_현장실습 이수학생 수"
            rename C1 uniname
            rename (C7 C11 C15) (v12_ka_1_2 v12_ka_1_3 v12_ka_1_4)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-카-1_2017.dta" /*(2017년_ [12-카-1. 현장실습 운영 현황_])*/
            keep C1 C7 C11 C15
            gen year = 2017
            destring C7 C11 C15 , replace
                label var C1 "학교"
                label var C7 "실습기간_4주 이상(160~320시간)_이수학생 수"
                label var C11 "실습기간_8주 이상(320~480시간)_이수학생 수"
                label var C15 "실습기간_12주 이상(480시간 이상)_이수학생 수"
            rename C1 uniname
            rename (C7 C11 C15) (v12_ka_1_2 v12_ka_1_3 v12_ka_1_4)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-카-1_2018.dta" /*(2018년_ [12-카-1. 현장실습 운영 현황_])*/
            keep C1 C6 C13 C20
            gen year = 2018
            destring C6 C13 C20 , replace
                label var C6 "str46 %46s 실습기간_4주 이상(120시간 이상~240시간 미만)_이수학생 수"
                label var C13 "str46 %46s 실습기간_8주 이상(240시간 이상~360시간 미만)_이수학생 수"
                label var C20 "str46 %46s 실습기간_12주 이상(360시간 이상)_이수학생 수"
            rename C1 uniname
            rename (C6 C13 C20) (v12_ka_1_2 v12_ka_1_3 v12_ka_1_4)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-카-1_2019.dta" /*(2019년_ [12-카-1. 현장실습 운영 현황_])*/
            keep C1 C6 C13 C20
            gen year = 2019
            destring C6 C13 C20 , replace
                label var C1 "str46 %46s 학교"
                label var C6 "str46 %46s 실습기간_4주 이상(120시간 이상~240시간 미만)_이수학생 수"
                label var C13 "str46 %46s 실습기간_8주 이상(240시간 이상~360시간 미만)_이수학생 수"
                label var C20 "str46 %46s 실습기간_12주 이상(360시간 이상)_이수학생 수"
            rename C1 uniname
            rename (C6 C13 C20) (v12_ka_1_2 v12_ka_1_3 v12_ka_1_4)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-카-1_2020.dta" /*(2020년_ [12-카-1. 현장실습 운영 현황_])*/
            keep C1 C6 C15 C24
            gen year = 2020
            destring C6 C15 C24 , replace
                label var C1 "학교"
                label var C6 "실습기간_4주 이상(실제출석일 기준 20일 이상)_이수학생 수"
                label var C15 "실습기간_8주 이상(실제출석일 기준 40일 이상)_이수학생 수"
                label var C24 "실습기간_12주 이상(실제출석일 기준 60일 이상)_이수학생 수"
            rename C1 uniname
            rename (C6 C15 C24) (v12_ka_1_2 v12_ka_1_3 v12_ka_1_4)
            append using `tfile1'
            save `tfile1' , replace
        replace uniname = subinstr(uniname, " _", "_", .)
        replace uniname = trim(uniname)
        drop if strpos(uniname , "폐교")
        merge 1:1 year uniname using `tfile2' , nogen
        save `tfile2' , replace
    /*}}}*/
    /*12-타{{{*/
        use "대학_12-타_2009.dta" /*(2009년_ [12-타. 기술이전 수입료 및 계약 실적_])*/
            keep C1 C2 C3
            gen year = 2009
            destring C2 C3 , replace
                label var C1 "학교명"
                label var C2 "건수"
                label var C3 "수입료 (천원)"
            rename C1 uniname
            rename (C2 C3) (v12_ta_1 v12_ta_2)
            save `tfile1' , replace
        use "대학_12-타_2010.dta" /*(2010년_ [12-타. 기술이전 수입료 및 계약 실적_])*/
            keep C1 C2 C3
            gen year = 2010
            destring C2 C3 , replace
                label var C1 "학교명"
                label var C2 "건수"
                label var C3 "수입료 (천원)"
            rename C1 uniname
            rename (C2 C3) (v12_ta_1 v12_ta_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-타_2011.dta" /*(2011년_ [12-타. 기술이전 수입료 및 계약 실적_])*/
            keep C1 C2 C3
            gen year = 2011
            destring C2 C3 , replace
                label var C1 "학교명"
                label var C2 "건수"
                label var C3 "수입료 (천원)"
            rename C1 uniname
            rename (C2 C3) (v12_ta_1 v12_ta_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-타_2012.dta" /*(2012년_ [12-타. 기술이전 수입료 및 계약 실적_])*/
            keep C1 C2 C3
            gen year = 2012
            destring C2 C3 , replace
                label var C1 "학교명"
                label var C2 "건수"
                label var C3 "수입료 (천원)"
            rename C1 uniname
            rename (C2 C3) (v12_ta_1 v12_ta_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-타_2013.dta" /*(2013년_ [12-타. 기술이전 수입료 및 계약 실적_])*/
            keep C5 C6 C7
            gen year = 2013
            destring C6 C7 , replace
                label var C5 "학교명"
                label var C6 "건수"
                label var C7 "수입료 (천원)"
            rename C5 uniname
            rename (C6 C7) (v12_ta_1 v12_ta_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-타_2014.dta" /*(2014년_ [12-타. 기술이전 수입료 및 계약 실적_])*/
            keep C5 C6 C7
            gen year = 2014
            destring C6 C7 , replace
                label var C5 "학교명"
                label var C6 "건수"
                label var C7 "수입료 (천원)"
            rename C5 uniname
            rename (C6 C7) (v12_ta_1 v12_ta_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-타_2015.dta" /*(2015년_ [12-타. 기술이전 수입료 및 계약 실적_])*/
            keep C5 C6 C7
            gen year = 2015
            destring C6 C7 , replace
                label var C5 "학교명"
                label var C6 "건수"
                label var C7 "수입료 (천원)"
            rename C5 uniname
            rename (C6 C7) (v12_ta_1 v12_ta_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-타_2016.dta" /*(2016년_ [12-타. 기술이전 수입료 및 계약 실적_])*/
            keep C5 C6 C7
            gen year = 2016
            destring C6 C7 , replace
                label var C5 "학교명"
                label var C6 "건수"
                label var C7 "수입료 (천원)"
            rename C5 uniname
            rename (C6 C7) (v12_ta_1 v12_ta_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-타_2017.dta" /*(2017년_ [12-타. 기술이전 수입료 및 계약 실적_])*/
            keep C5 C6 C7
            gen year = 2017
            destring C6 C7 , replace
                label var C5 "학교명"
                label var C6 "건수"
                label var C7 "수입료 (천원)"
            rename C5 uniname
            rename (C6 C7) (v12_ta_1 v12_ta_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-타_2018.dta" /*(2018년_ [12-타. 기술이전 수입료 및 계약 실적_])*/
            keep C5 C6 C7
            gen year = 2018
            destring C6 C7 , replace
                label var C5 "학교명"
                label var C6 "건수"
                label var C7 "수입료 (천원)"
            rename C5 uniname
            rename (C6 C7) (v12_ta_1 v12_ta_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-타_2019.dta" /*(2019년_ [12-타. 기술이전 수입료 및 계약 실적_])*/
            keep C5 C6 C7
            gen year = 2019
            destring C6 C7 , replace
                label var C5 "학교명"
                label var C6 "건수"
                label var C7 "수입료 (원)"
                replace C7 = C7/1000
            rename C5 uniname
            rename (C6 C7) (v12_ta_1 v12_ta_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-타_2020.dta" /*(2020년_ [12-타. 기술이전 수입료 및 계약 실적_])*/
            keep C5 C6 C7
            gen year = 2020
            destring C6 C7 , replace
                label var C5 "학교명"
                label var C6 "건수"
                label var C7 "수입료 (원)"
                replace C7 = C7/1000
            rename C5 uniname
            rename (C6 C7) (v12_ta_1 v12_ta_2)
            append using `tfile1'
            save `tfile1' , replace
        replace uniname = subinstr(uniname, " _", "_", .)
        replace uniname = trim(uniname)
        drop if strpos(uniname , "폐교")
        merge 1:1 year uniname using `tfile2' , nogen
        save `tfile2' , replace
    /*}}}*/
    /*12-하-1-(1){{{*/
        use "대학_12-하-1-(1)_2009.dta" /*(2009년_ [12-하-1-(1). 교원의 창업 및 창업지원 현황_])*/
            keep C1 C4
            gen year = 2009
            destring C4 , replace
                label var C1 "학교"
                label var C4 "교원창업현황 (현재실제 사업을 하고 있는 교원수)"
            rename C1 uniname
            rename (C4) (v12_ha_1_1)
            save `tfile1' , replace
        use "대학_12-하-1-(1)_2010.dta" /*(2010년_ [12-하-1-(1). 교원의 창업 및 창업지원 현황_])*/
            keep C1 C4
            gen year = 2010
            destring C4 , replace
                label var C1 "학교"
                label var C4 "교원창업현황 (현재실제 사업을 하고 있는 교원수)"
            rename C1 uniname
            rename (C4) (v12_ha_1_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-1-(1)_2011.dta" /*(2011년_ [12-하-1-(1). 교원의 창업 및 창업지원 현황_])*/
            keep C1 C4
            gen year = 2011
            destring C4 , replace
                label var C1 "학교"
                label var C4 "교원창업현황 (현재실제 사업을 하고 있는 교원수)"
            rename C1 uniname
            rename (C4) (v12_ha_1_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-1-(1)_2012.dta" /*(2012년_ [12-하-1-(1). 교원의 창업 및 창업지원 현황_])*/
            keep C1 C2
            gen year = 2012
            destring C2 , replace
                label var C1 "학교"
                label var C2 "교원 창업 현황"
            rename C1 uniname
            rename (C2) (v12_ha_1_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-1-(1)_2013.dta" /*(2013년_ [12-하-1-(1). 교원의 창업 및 창업지원 현황_])*/
            keep C5 C6
            gen year = 2013
            destring C6 , replace
                label var C5 "학교"
                label var C6 "교원 창업 현황_창업자 수"
            rename C5 uniname
            rename (C6) (v12_ha_1_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-1-(1)_2014.dta" /*(2014년_ [12-하-1-(1). 교원의 창업 및 창업지원 현황_])*/
            keep C5 C6
            gen year = 2014
            destring C6 , replace
                label var C5 "학교"
                label var C6 "교원 창업 현황"
            rename C5 uniname
            rename (C6) (v12_ha_1_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-1-(1)_2015.dta" /*(2015년_ [12-하-1-(1). 교원의 창업 및 창업지원 현황_])*/
            keep C5 C6
            gen year = 2015
            destring C6 , replace
                label var C5 "학교"
                label var C6 "교원 창업 현황"
            rename C5 uniname
            rename (C6) (v12_ha_1_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-1-(1)_2016.dta" /*(2016년_ [12-하-1-(1). 교원의 창업 및 창업지원 현황_])*/
            keep C5 C6
            gen year = 2016
            destring C6 , replace
                label var C5 "학교"
                label var C6 "교원 창업 현황_창업자 수"
            rename C5 uniname
            rename (C6) (v12_ha_1_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-1-(1)_2017.dta" /*(2017년_ [12-하-1-(1). 교원의 창업 및 창업지원 현황_])*/
            keep C5 C6
            gen year = 2017
            destring C6 , replace
                label var C5 "학교"
                label var C6 "교원 창업 현황_창업자 수"
            rename C5 uniname
            rename (C6) (v12_ha_1_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-1-(1)_2018.dta" /*(2018년_ [12-하-1-(1). 교원의 창업 및 창업지원 현황_])*/
            keep C5 C6
            gen year = 2018
            destring C6 , replace
                label var C5 "학교"
                label var C6 "교원 창업 현황"
            rename C5 uniname
            rename (C6) (v12_ha_1_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-1-(1)_2019.dta" /*(2019년_ [12-하-1-(1). 교원의 창업 및 창업지원 현황_])*/
            keep C5 C6
            gen year = 2019
            destring C6 , replace
                label var C5 "학교"
                label var C6 "교원 창업 현황"
            rename C5 uniname
            rename (C6) (v12_ha_1_1)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-1-(1)_2020.dta" /*(2020년_ [12-하-1-(1). 교원의 창업 및 창업지원 현황_])*/
            keep C5 C6
            gen year = 2020
            destring C6 , replace
                label var C5 "학교"
                label var C6 "교원 창업 현황"
            rename C5 uniname
            rename (C6) (v12_ha_1_1)
            append using `tfile1'
            save `tfile1' , replace
        replace uniname = subinstr(uniname, " _", "_", .)
        replace uniname = trim(uniname)
        drop if strpos(uniname , "폐교")
        merge 1:1 year uniname using `tfile2' , nogen
        save `tfile2' , replace
    /*}}}*/
    /*12-하-1-(2){{{*/
        use "대학_12-하-1-(2)_2009.dta" /*(2009년_ [12-하-1-(2). 학생의 창업 및 창업지원 현황_])*/
            keep C1 C2 C3
            gen year = 2009
            destring C2 C3 , replace
                label var C1 "학교"
                label var C2 "학생창업현황(2009)_창업자수"
                label var C3 "학생창업현황(2009)_창업기업수"
            rename C1 uniname
            rename (C2 C3) (v12_ha_1_2_1 v12_ha_1_2_2)
            save `tfile1' , replace
        use "대학_12-하-1-(2)_2010.dta" /*(2010년_ [12-하-1-(2). 학생의 창업 및 창업지원 현황_])*/
            keep C1 C2 C3
            gen year = 2010
            destring C2 C3 , replace
                label var C1 "학교"
                label var C2 "학생창업현황(2009)_창업자수"
                label var C3 "학생창업현황(2009)_창업기업수"
            rename C1 uniname
            rename (C2 C3) (v12_ha_1_2_1 v12_ha_1_2_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-1-(2)_2011.dta" /*(2011년_ [12-하-1-(2). 학생의 창업 및 창업지원 현황_])*/
            keep C1 C2 C3
            gen year = 2011
            destring C2 C3 , replace
                label var C1 "학교"
                label var C2 "학생창업현황(2010)_창업자수"
                label var C3 "학생창업현황(2010)_창업기업수"
            rename C1 uniname
            rename (C2 C3) (v12_ha_1_2_1 v12_ha_1_2_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-1-(2)_2012.dta" /*(2012년_ [12-하-1-(2). 학생의 창업 및 창업지원 현황_])*/
            keep C1 C2 C3
            gen year = 2012
            destring C2 C3 , replace
                label var C1 "학교"
                label var C2 "학생창업현황_창업자수"
                label var C3 "학생창업현황_창업기업수"
            rename C1 uniname
            rename (C2 C3) (v12_ha_1_2_1 v12_ha_1_2_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-1-(2)_2013.dta" /*(2013년_ [12-하-1-(2). 학생의 창업 및 창업지원 현황_])*/
            keep C5 C6 C7
            gen year = 2013
            destring C6 C7 , replace
                label var C5 "학교"
                label var C6 "학생창업현황_창업자수"
                label var C7 "학생창업현황_창업기업수"
            rename C5 uniname
            rename (C6 C7) (v12_ha_1_2_1 v12_ha_1_2_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-1-(2)_2014.dta" /*(2014년_ [12-하-1-(2). 학생의 창업 및 창업지원 현황_])*/
            keep C5 C6 C7
            gen year = 2014
            destring C6 C7 , replace
                label var C5 "학교"
                label var C6 "학생창업현황_창업자수"
                label var C7 "학생창업현황_창업기업수"
            rename C5 uniname
            rename (C6 C7) (v12_ha_1_2_1 v12_ha_1_2_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-1-(2)_2015.dta" /*(2015년_ [12-하-1-(2). 학생의 창업 및 창업지원 현황_])*/
            keep C5 C6 C7
            gen year = 2015
            destring C6 C7 , replace
                label var C5 "학교"
                label var C6 "학생창업현황_창업자수"
                label var C7 "학생창업현황_창업기업수"
            rename C5 uniname
            rename (C6 C7) (v12_ha_1_2_1 v12_ha_1_2_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-1-(2)_2016.dta" /*(2016년_ [12-하-1-(2). 학생의 창업 및 창업지원 현황_])*/
            keep C5 C6 C7
            gen year = 2016
            destring C6 C7 , replace
                label var C5 "학교"
                label var C6 "학생창업현황_창업자수"
                label var C7 "학생창업현황_창업기업수"
            rename C5 uniname
            rename (C6 C7) (v12_ha_1_2_1 v12_ha_1_2_2)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-1-(2)_2017.dta" /*(2017년_ [12-하-1-(2). 학생의 창업 및 창업지원 현황_])*/
            keep C5 C6 C7 C8
            gen year = 2017
            destring C6 C7 C8 , replace
                label var C5 "학교"
                label var C6 "학생창업현황_창업자 수"
                label var C7 "학생창업현황_창업기업 수_교내"
                label var C8 "학생창업현황_창업기업 수_교외"
            rename C5 uniname
            rename (C6 C7 C8) (v12_ha_1_2_1 v12_ha_1_2_3 v12_ha_1_2_4)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-1-(2)_2018.dta" /*(2018년_ [12-하-1-(2). 학생의 창업 및 창업지원 현황_])*/
            keep C5 C6 C7 C8
            gen year = 2018
            destring C6 C7 C8 , replace
                label var C5 "학교"
                label var C6 "학생창업현황_창업자 수"
                label var C7 "학생창업현황_창업기업 수_교내"
                label var C8 "학생창업현황_창업기업 수_교외"
            rename C5 uniname
            rename (C6 C7 C8) (v12_ha_1_2_1  v12_ha_1_2_3 v12_ha_1_2_4)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-1-(2)_2019.dta" /*(2019년_ [12-하-1-(2). 학생의 창업 및 창업지원 현황_])*/
            keep C5 C6 C7 C8
            gen year = 2019
            destring C6 C7 C8 , replace
                label var C5 "학교"
                label var C6 "학생창업현황_창업자 수"
                label var C7 "학생창업현황_창업기업 수_교내"
                label var C8 "학생창업현황_창업기업 수_교외"
            rename C5 uniname
            rename (C6 C7 C8) (v12_ha_1_2_1 v12_ha_1_2_3 v12_ha_1_2_4)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-1-(2)_2020.dta" /*(2020년_ [12-하-1-(2). 학생의 창업 및 창업지원 현황_])*/
            keep C5 C6 C7 C8
            gen year = 2020
            destring C6 C7 C8 , replace
                label var C5 "학교"
                label var C6 "학생창업현황_창업자 수"
                label var C7 "학생창업현황_창업기업 수_교내"
                label var C8 "학생창업현황_창업기업 수_교외"
            rename C5 uniname
            rename (C6 C7 C8) (v12_ha_1_2_1  v12_ha_1_2_3 v12_ha_1_2_4)
            append using `tfile1'
            save `tfile1' , replace
        replace uniname = subinstr(uniname, " _", "_", .)
        replace uniname = trim(uniname)
        drop if strpos(uniname , "폐교")
        merge 1:1 year uniname using `tfile2' , nogen
        save `tfile2' , replace
    /*}}}*/
    /*12-하-2{{{*/
        use "대학_12-하-2_2009.dta" /*(2009년_ [12-하-2. 창업교육 지원 현황_])*/
            keep C1 C2 C4 C6
            gen year = 2009
            destring C2 C4 C6 , replace
                label var C1 "학교"
                label var C2 "창업강좌 현황_교양과목_강좌 수"
                label var C4 "창업강좌 현황_전공과목_강좌 수"
                label var C6 "창업강좌 현황_실습과목_강좌 수"
            rename C1 uniname
            rename (C2 C4 C6) (v12_ha_2_1 v12_ha_2_2 v12_ha_2_3)
            save `tfile1' , replace
        use "대학_12-하-2_2010.dta" /*(2010년_ [12-하-2. 창업교육 지원 현황_])*/
            keep C1 C2 C4 C6
            gen year = 2010
            destring C2 C4 C6 , replace
                label var C1 "학교"
                label var C2 "창업강좌 현황_교양과목_강좌 수"
                label var C4 "창업강좌 현황_전공과목_강좌 수"
                label var C6 "창업강좌 현황_실습과목_강좌 수"
            rename C1 uniname
            rename (C2 C4 C6) (v12_ha_2_1 v12_ha_2_2 v12_ha_2_3)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-2_2011.dta" /*(2011년_ [12-하-2. 창업교육 지원 현황_])*/
            keep C1 C2 C4 C6
            gen year = 2011
            destring C2 C4 C6 , replace
                label var C1 "학교"
                label var C2 "창업강좌 현황_교양과목_강좌 수"
                label var C4 "창업강좌 현황_전공과목_강좌 수"
                label var C6 "창업강좌 현황_실습과목_강좌 수"
            rename C1 uniname
            rename (C2 C4 C6) (v12_ha_2_1 v12_ha_2_2 v12_ha_2_3)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-2_2012.dta" /*(2012년_ [12-하-2. 창업교육 지원 현황_])*/
            keep C1 C2 C4 C6
            gen year = 2012
            destring C2 C4 C6 , replace
                label var C1 "학교"
                label var C2 "창업강좌 현황_교양과목_강좌 수"
                label var C4 "창업강좌 현황_전공과목_강좌 수"
                label var C6 "창업강좌 현황_실습과목_강좌 수"
            rename C1 uniname
            rename (C2 C4 C6) (v12_ha_2_1 v12_ha_2_2 v12_ha_2_3)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-2_2013.dta" /*(2013년_ [12-하-2. 창업교육 지원 현황_])*/
            keep C5 C6 C8 C10 C12
            gen year = 2013
            destring C6 C8 C10 C12 , replace
                label var C5 "학교"
                label var C6 "창업강좌 현황_교양과목_이론형 과목_강좌 수"
                label var C8 "창업강좌 현황_교양과목_실습형 과목_강좌 수"
                label var C10 "창업강좌 현황_전공과목_이론형 과목_강좌 수"
                label var C12 "창업강좌 현황_전공과목_실습형 과목_강좌 수"
            rename C5 uniname
            rename (C6 C8 C10 C12) (v12_ha_2_4 v12_ha_2_5 v12_ha_2_6 v12_ha_2_7)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-2_2014.dta" /*(2014년_ [12-하-2. 창업교육 지원 현황_])*/
            keep C5 C6 C8 C10 C12
            gen year = 2014
            destring C6 C8 C10 C12 , replace
                label var C5 "학교"
                label var C6 "창업강좌 현황_교양과목_이론형 과목_강좌 수"
                label var C8 "창업강좌 현황_교양과목_실습형 과목_강좌 수"
                label var C10 "창업강좌 현황_전공과목_이론형 과목_강좌 수"
                label var C12 "창업강좌 현황_전공과목_실습형 과목_강좌 수"
            rename C5 uniname
            rename (C6 C8 C10 C12) (v12_ha_2_4 v12_ha_2_5 v12_ha_2_6 v12_ha_2_7)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-2_2015.dta" /*(2015년_ [12-하-2. 창업교육 지원 현황_])*/
            keep C5 C6 C8 C10 C12
            gen year = 2015
            destring C6 C8 C10 C12 , replace
                label var C5 "학교"
                label var C6 "창업강좌 현황_교양과목_이론형 과목_강좌 수"
                label var C8 "창업강좌 현황_교양과목_실습형 과목_강좌 수"
                label var C10 "창업강좌 현황_전공과목_이론형 과목_강좌 수"
                label var C12 "창업강좌 현황_전공과목_실습형 과목_강좌 수"
            rename C5 uniname
            rename (C6 C8 C10 C12) (v12_ha_2_4 v12_ha_2_5 v12_ha_2_6 v12_ha_2_7)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-2_2016.dta" /*(2016년_ [12-하-2. 창업교육 지원 현황_])*/
            keep C5 C6 C8 C10 C12
            gen year = 2016
            destring C6 C8 C10 C12 , replace
                label var C5 "학교"
                label var C6 "창업강좌 현황_교양과목_이론형 과목_강좌 수"
                label var C8 "창업강좌 현황_교양과목_실습형 과목_강좌 수"
                label var C10 "창업강좌 현황_전공과목_이론형 과목_강좌 수"
                label var C12 "창업강좌 현황_전공과목_실습형 과목_강좌 수"
            rename C5 uniname
            rename (C6 C8 C10 C12) (v12_ha_2_4 v12_ha_2_5 v12_ha_2_6 v12_ha_2_7)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-2_2017.dta" /*(2017년_ [12-하-2. 창업교육 지원 현황_])*/
            keep C5 C6 C8 C10 C12
            gen year = 2017
            destring C6 C8 C10 C12 , replace
                label var C5 "학교"
                label var C6 "창업강좌 현황_교양과목_이론형 과목_강좌 수"
                label var C8 "창업강좌 현황_교양과목_실습형 과목_강좌 수"
                label var C10 "창업강좌 현황_전공과목_이론형 과목_강좌 수"
                label var C12 "창업강좌 현황_전공과목_실습형 과목_강좌 수"
            rename C5 uniname
            rename (C6 C8 C10 C12) (v12_ha_2_4 v12_ha_2_5 v12_ha_2_6 v12_ha_2_7)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-2_2018.dta" /*(2018년_ [12-하-2. 창업교육 지원 현황_])*/
            keep C5 C6 C8 C10 C12
            gen year = 2018
            destring C6 C8 C10 C12 , replace
                label var C5 "학교"
                label var C6 "창업강좌 현황_교양과목_이론형 과목_강좌 수"
                label var C8 "창업강좌 현황_교양과목_실습형 과목_강좌 수"
                label var C10 "창업강좌 현황_전공과목_이론형 과목_강좌 수"
                label var C12 "창업강좌 현황_전공과목_실습형 과목_강좌 수"
            rename C5 uniname
            rename (C6 C8 C10 C12) (v12_ha_2_4 v12_ha_2_5 v12_ha_2_6 v12_ha_2_7)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-2_2019.dta" /*(2019년_ [12-하-2. 창업교육 지원 현황_])*/
            keep C5 C6 C8 C10 C12
            gen year = 2019
            destring C6 C8 C10 C12 , replace
                label var C5 "학교"
                label var C6 "창업강좌 현황_교양과목_이론형 과목_강좌 수"
                label var C8 "창업강좌 현황_교양과목_실습형 과목_강좌 수"
                label var C10 "창업강좌 현황_전공과목_이론형 과목_강좌 수"
                label var C12 "창업강좌 현황_전공과목_실습형 과목_강좌 수"
            rename C5 uniname
            rename (C6 C8 C10 C12) (v12_ha_2_4 v12_ha_2_5 v12_ha_2_6 v12_ha_2_7)
            append using `tfile1'
            save `tfile1' , replace
        use "대학_12-하-2_2020.dta" /*(2020년_ [12-하-2. 창업교육 지원 현황_])*/
            keep C5 C6 C8 C10 C12
            gen year = 2020
            destring C6 C8 C10 C12 , replace
                label var C5 "학교"
                label var C6 "창업강좌 현황_교양과목_이론형 과목_강좌 수"
                label var C8 "창업강좌 현황_교양과목_실습형 과목_강좌 수"
                label var C10 "창업강좌 현황_전공과목_이론형 과목_강좌 수"
                label var C12 "창업강좌 현황_전공과목_실습형 과목_강좌 수"
            rename C5 uniname
            rename (C6 C8 C10 C12) (v12_ha_2_4 v12_ha_2_5 v12_ha_2_6 v12_ha_2_7)
            append using `tfile1'
            save `tfile1' , replace
        replace uniname = subinstr(uniname, " _", "_", .)
        replace uniname = trim(uniname)
        drop if strpos(uniname , "폐교")
        merge 1:1 year uniname using `tfile2' , nogen
        save `tfile2' , replace
    /*}}}*/

    label data "중앙일보 대학평가 평가항목 from 대학알리미"
    order _all , alpha
    order uniname year  , first
    sort uniname year
        label var uniname      "학교명"
        label var year         "조사년도"
        egen v12_ah = rowtotal(v12_ah_?)
            label var v12_ah "산업체 전임교원수"
            drop v12_ah_?
        label var v12_da_1     "재학생 1인당 장학금"
        label var v12_ha_1_1   "교원 창업자 수"
        label var v12_ha_1_2_1 "학생 창업자 수"
            drop v12_ha_1_2_2 v12_ha_1_2_3 v12_ha_1_2_4
        egen v12_ha_2 = rowtotal(v12_ha_2_?)
            label var v12_ha_2 "창업강좌 수"
            drop v12_ha_2_?
        egen v12_ka_1 = rowtotal(v12_ka_1_?)
            label var v12_ka_1 "현장실습 학생 수"
            drop v12_ka_1_?
        egen v12_ra_2 = rowtotal(v12_ra_2_?)
            label var v12_ra_2 "외국대학 교류인원(파견+유치)"
            drop v12_ra_2_?
        label var v12_ta_1     "기술이전 건수"
        label var v12_ta_2     "기술이전 수입료(천원)"
        label var v4_ba_1      "외국인유학생 계"
        label var v4_ba_2      "외국인유학생 중도탈락률(%)"
        label var v4_da_1      "입학정원"
        label var v4_da_2      "정원내 신입생 충원율(%)"
        label var v4_da_3      "입시 경쟁률"
        label var v4_sa        "중도탈락학생비율(%)"
        label var v5_da        "졸업생 취업률(%)"
        label var v5_na_1      "졸업생 진학률(%)"
        egen v6_ga_1_8 = rowtotal(v6_ga_1_1 v6_ga_1_2)
            label var v6_ga_1_8 "학부 전임교원수"
            drop v6_ga_1_1 v6_ga_1_2
        egen v6_ga_1_9 = rowtotal(v6_ga_1_3 v6_ga_1_4)
            label var v6_ga_1_9 "학부 비전임교원수"
            drop v6_ga_1_3 v6_ga_1_4
        gen v7_ga  = (v7_ga_2 + v7_ga_3 + v7_ga_4)/v7_ga_1
            label var v7_ga "전임교원당 총 논문 실적"
            drop v7_ga_?
        label var v8_ah        "기부금 합계"
        label var v8_cha_1     "등록금"
save ~/dropbox/data/dta/ALIMI_Jarating , replace

