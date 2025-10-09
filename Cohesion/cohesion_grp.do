use ~/dropbox/data/cohesion/cohesion , clear

    label var e2   "e2.복지확대"
    label var e3   "e3.추가징수"
    label var e4_1 "e4_1.근로·사업소득세"
    label var e4_2 "e4_2.소비세(부가가치세)"
    label var e4_3 "e4_3.법인세"
    label var e4_4 "e4_4.재산세·종부세"
    label var e4_5 "e4_5.상속세·증여세"
    label var e4_6 "e4_6.사회보장세"
    label var e4_7 "e4_7.탄소세"

    /*d18_1 코딩오류*/
        replace d18_1 = 5 if d18_1 == 8
        replace d18_2 = 5 if d18_2 == 8
        replace d18_3 = 5 if d18_3 == 8

    egen d18 = rowtotal(d18*) , miss
        label var d18 "정치효능감"
    egen d10 = rowtotal(d18*) , miss
        label var d10 "법치거부"
    egen c12 = rowtotal(d18*) , miss
        label var c12 "이주민거부"

svyset [pw=wpg]

twoway (scatter e3 d13 [pw=wpg] , mcolor(black%10) msize(tiny) by(dm2 , total legend(pos(6)))) (lfit e3 d13 [pw=wpg]) (qfit e3 d13 [pw=wpg]) 

hist e2,  by(dm2, total) percent ytitle("비율(%)") xlabel(1 "축소" 2 "유지" 3 "확대")
    gr export e2_dm2.png , as(png) replace
hist e2,  by(dm5, total) percent ytitle("비율(%)") xlabel(1 "축소" 2 "유지" 3 "확대")
    gr export e2_dm5.png , as(png) replace
hist e2,  by(dm9, total) percent ytitle("비율(%)") xlabel(1 "축소" 2 "유지" 3 "확대")
    gr export e2_dm9.png , as(png) replace

hist e3,  by(dm2, total) percent ytitle("비율(%)") xlabel(0 "부동의" 10 "강한동의")
    gr export e3_dm2.png , as(png) replace
hist e3,  by(dm5, total) percent ytitle("비율(%)") xlabel(0 "부동의" 10 "강한동의")
    gr export e3_dm5.png , as(png) replace
hist e3,  by(dm9, total) percent ytitle("비율(%)") xlabel(0 "부동의" 10 "강한동의")
    gr export e3_dm9.png , as(png) replace

hist d13, by(dm2, total) percent ytitle("비율(%)") xlabel(0 "강한지도자" 5 "보통" 10 "민주적체제") 
    gr export d13_dm2.png , as(png) replace                                                            
hist d13, by(dm5, total) percent ytitle("비율(%)") xlabel(0 "강한지도자" 5 "보통" 10 "민주적체제") 
    gr export d13_dm5.png , as(png) replace                                                            
hist d13, by(dm9, total) percent ytitle("비율(%)") xlabel(0 "강한지도자" 5 "보통" 10 "민주적체제") 
    gr export d13_dm9.png , as(png) replace

hist d8,  by(dm2, total) percent ytitle("비율(%)") xlabel(1 "자유" 5 "평등") 
    gr export d8_dm2.png , as(png) replace                                       
hist d8,  by(dm5, total) percent ytitle("비율(%)") xlabel(1 "자유" 5 "평등") 
    gr export d8_dm5.png , as(png) replace                                       
hist d8,  by(dm9, total) percent ytitle("비율(%)") xlabel(1 "자유" 5 "평등") 
    gr export d8_dm9.png , as(png) replace

hist c12,  by(dm2, total) percent ytitle("비율(%)")
    gr export c12_dm2.png , as(png) replace
hist c12,  by(dm5, total) percent ytitle("비율(%)")
    gr export c12_dm5.png , as(png) replace
hist c12,  by(dm9, total) percent ytitle("비율(%)")
    gr export c12_dm9.png , as(png) replace

hist d10,  by(dm2, total) percent ytitle("비율(%)")
    gr export d10_dm2.png , as(png) replace
hist d10,  by(dm5, total) percent ytitle("비율(%)")
    gr export d10_dm5.png , as(png) replace
hist d10,  by(dm9, total) percent ytitle("비율(%)")
    gr export d10_dm9.png , as(png) replace

hist d18,  by(dm2, total) percent ytitle("비율(%)")
    gr export d18_dm2.png , as(png) replace
hist d18,  by(dm5, total) percent ytitle("비율(%)")
    gr export d18_dm5.png , as(png) replace
hist d18,  by(dm9, total) percent ytitle("비율(%)")
    gr export d18_dm9.png , as(png) replace
