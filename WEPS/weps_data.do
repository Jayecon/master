cd ~/Library/CloudStorage/dropbox/data/KOWEPS
use wepsh , clear
drop if year <= 2015

rename h_merkey hhid   
rename h01_11aq8    rstype
    label define RSTYPE 0 "해당없음" 1 "임차급여(특례포함)" 3 "수선유지급여(특례포함)"
    label value rstype RSTYPE
rename h06_2        location
    label define LOCATION 1 "지하층" 2 "반지하층" 3 "지상" 4 "옥탑"
    label value location LOCATION
rename h06_5        size
rename h06_21       water
    label define WATER 1 "단독사용" 2 "공동사용" 3 "없음"
    label value water WATER
rename h06_22       kitchen
    label define KITCHEN 1 "단독사용-입식" 2 "단독사용-재래식" 3 "공동사용-입식" ///
        4 "공동사용-재래식" 5 "없음"
    label value kitchen KITCHEN
rename h06_23       toilet
    label define TOILET 1 "단독사용-수세식" 2 "단독사용-재래식" 3 "공동사용-수세식" ///
        4 "공동사용-재래식" 5 "없음"
    label value toilet TOILET
rename h06_24       bath
    label define BATH 1 "단독사용-온수시설 있음" 2 "단독사용-온수시설 없음" ///
        3 "공동사용-온수시설 있음" 4 "공동사용-온수시설 없음" 5 "없음"
    label value bath BATH
rename h06_25       heat
    label define HEAT 1 "연탄 또는 재래식(땔감) 아궁이" 4 "기름보일러" 7 "중앙난방" ///
        2 "연탄보일러" 5 "가스보일러" 8 "전기장판" 3 "나무,석탄보일러" 6 "전기보일러" 9 "기타"
    label value heat HEAT
rename h06_27       prent
    label define PRENT 1 "있다" 0 "없다"
    label value prent PRENT
rename h06_33       tloan
    label define TLOAN 1 "있다" 0 "없다"
    label value tloan TLOAN
rename h06_36       mloan
    label define MLOAN 1 "있다" 0 "없다"
    label value mloan MLOAN
rename h06_39       bloan
    label define BLOAN 1 "있다" 0 "없다"
    label value bloan BLOAN
rename h07_3aq3     rent
rename h07_3aq4     mngt
rename h08_11aq4    nrs
rename h08_11aq5    trs
rename h09_aq7      liab
rename h12_2_11aq7  frsn
rename h12_2_11aq11 slsn
rename h12_2_11aq49 assm
rename h06_30       prent2
    label define PRENT2 1 "있다" 0 "없다"
    label var prent2 PRENT2
rename h01_11aq7    rsyn
    label define RSYN 1 " 예" 2 " 아니요"
    label var rsyn RSYN

generate mrs = trs / nrs 
    label var mrs "주거급여 수급액(월평균)"
rename h01_110 htype
    label define HTYPE "단독" 2 "모자" 3 "부자" 4 "조손가구 또는 소년소녀가장" 5 "기타"
    label value htype HTYPE

gen rgn = 0
    label var rgn "주거급여 지역"
    label define RGN 1 "1급지(서울)" 2 "2급지(경기·인천)" 3 "3급지(광역시)" 4 "4급지(그 외 지역)"
    label values rgn RGN
    replace rgn = 1 if h_reg7 == 1
    replace rgn = 2 if h_reg7 == 2
    replace rgn = 3 if h_reg5 == 2 & inlist(h_reg7, 1, 2)
    replace rgn = 4 if rgn == 0
    
/*gen tag : 연도별 수선급여 수급여부{{{*/
    gen ytrt = 0
    label var ytrt "수선급여 수급여부"

    replace ytrt = 1 if mrs >= 19.0 +20 & year == 2015 & h01_1 == 1  & rgn == 1
    replace ytrt = 1 if mrs >= 22.0 +20 & year == 2015 & h01_1 == 2  & rgn == 1
    replace ytrt = 1 if mrs >= 26.0 +20 & year == 2015 & h01_1 == 3  & rgn == 1
    replace ytrt = 1 if mrs >= 30.0 +20 & year == 2015 & h01_1 == 4  & rgn == 1
    replace ytrt = 1 if mrs >= 31.0 +20 & year == 2015 & h01_1 == 5  & rgn == 1
    replace ytrt = 1 if mrs >= 36.0 +20 & year == 2015 & h01_1 >= 6  & rgn == 1
    replace ytrt = 1 if mrs >= 17.0 +20 & year == 2015 & h01_1 == 1  & rgn == 2
    replace ytrt = 1 if mrs >= 19.0 +20 & year == 2015 & h01_1 == 2  & rgn == 2
    replace ytrt = 1 if mrs >= 23.0 +20 & year == 2015 & h01_1 == 3  & rgn == 2
    replace ytrt = 1 if mrs >= 27.0 +20 & year == 2015 & h01_1 == 4  & rgn == 2
    replace ytrt = 1 if mrs >= 28.0 +20 & year == 2015 & h01_1 == 5  & rgn == 2
    replace ytrt = 1 if mrs >= 33.0 +20 & year == 2015 & h01_1 >= 6  & rgn == 2
    replace ytrt = 1 if mrs >= 14.0 +20 & year == 2015 & h01_1 == 1  & rgn == 3
    replace ytrt = 1 if mrs >= 15.0 +20 & year == 2015 & h01_1 == 2  & rgn == 3
    replace ytrt = 1 if mrs >= 18.0 +20 & year == 2015 & h01_1 == 3  & rgn == 3
    replace ytrt = 1 if mrs >= 21.0 +20 & year == 2015 & h01_1 == 4  & rgn == 3
    replace ytrt = 1 if mrs >= 22.0 +20 & year == 2015 & h01_1 == 5  & rgn == 3
    replace ytrt = 1 if mrs >= 25.0 +20 & year == 2015 & h01_1 >= 6  & rgn == 3
    replace ytrt = 1 if mrs >= 13.0 +20 & year == 2015 & h01_1 == 1  & rgn == 4
    replace ytrt = 1 if mrs >= 14.0 +20 & year == 2015 & h01_1 == 2  & rgn == 4
    replace ytrt = 1 if mrs >= 17.0 +20 & year == 2015 & h01_1 == 3  & rgn == 4
    replace ytrt = 1 if mrs >= 19.0 +20 & year == 2015 & h01_1 == 4  & rgn == 4
    replace ytrt = 1 if mrs >= 20.0 +20 & year == 2015 & h01_1 == 5  & rgn == 4
    replace ytrt = 1 if mrs >= 23.0 +20 & year == 2015 & h01_1 >= 6  & rgn == 4

    replace ytrt = 1 if mrs >= 19.5 +20 & year == 2016 & h01_1 == 1  & rgn == 1
    replace ytrt = 1 if mrs >= 22.5 +20 & year == 2016 & h01_1 == 2  & rgn == 1
    replace ytrt = 1 if mrs >= 26.6 +20 & year == 2016 & h01_1 == 3  & rgn == 1
    replace ytrt = 1 if mrs >= 30.7 +20 & year == 2016 & h01_1 == 4  & rgn == 1
    replace ytrt = 1 if mrs >= 31.7 +20 & year == 2016 & h01_1 == 5  & rgn == 1
    replace ytrt = 1 if mrs >= 36.9 +20 & year == 2016 & h01_1 >= 6  & rgn == 1
    replace ytrt = 1 if mrs >= 17.4 +20 & year == 2016 & h01_1 == 1  & rgn == 2
    replace ytrt = 1 if mrs >= 19.5 +20 & year == 2016 & h01_1 == 2  & rgn == 2
    replace ytrt = 1 if mrs >= 23.6 +20 & year == 2016 & h01_1 == 3  & rgn == 2
    replace ytrt = 1 if mrs >= 27.6 +20 & year == 2016 & h01_1 == 4  & rgn == 2
    replace ytrt = 1 if mrs >= 28.7 +20 & year == 2016 & h01_1 == 5  & rgn == 2
    replace ytrt = 1 if mrs >= 33.8 +20 & year == 2016 & h01_1 >= 6  & rgn == 2
    replace ytrt = 1 if mrs >= 14.3 +20 & year == 2016 & h01_1 == 1  & rgn == 3
    replace ytrt = 1 if mrs >= 15.4 +20 & year == 2016 & h01_1 == 2  & rgn == 3
    replace ytrt = 1 if mrs >= 18.4 +20 & year == 2016 & h01_1 == 3  & rgn == 3
    replace ytrt = 1 if mrs >= 21.5 +20 & year == 2016 & h01_1 == 4  & rgn == 3
    replace ytrt = 1 if mrs >= 22.5 +20 & year == 2016 & h01_1 == 5  & rgn == 3
    replace ytrt = 1 if mrs >= 25.6 +20 & year == 2016 & h01_1 >= 6  & rgn == 3
    replace ytrt = 1 if mrs >= 13.3 +20 & year == 2016 & h01_1 == 1  & rgn == 4
    replace ytrt = 1 if mrs >= 14.3 +20 & year == 2016 & h01_1 == 2  & rgn == 4
    replace ytrt = 1 if mrs >= 17.4 +20 & year == 2016 & h01_1 == 3  & rgn == 4
    replace ytrt = 1 if mrs >= 19.5 +20 & year == 2016 & h01_1 == 4  & rgn == 4
    replace ytrt = 1 if mrs >= 20.5 +20 & year == 2016 & h01_1 == 5  & rgn == 4
    replace ytrt = 1 if mrs >= 23.6 +20 & year == 2016 & h01_1 >= 6  & rgn == 4

    replace ytrt = 1 if mrs >= 20.0 +20 & year == 2017 & h01_1 == 1  & rgn == 1
    replace ytrt = 1 if mrs >= 23.1 +20 & year == 2017 & h01_1 == 2  & rgn == 1
    replace ytrt = 1 if mrs >= 27.3 +20 & year == 2017 & h01_1 == 3  & rgn == 1
    replace ytrt = 1 if mrs >= 31.5 +20 & year == 2017 & h01_1 == 4  & rgn == 1
    replace ytrt = 1 if mrs >= 32.5 +20 & year == 2017 & h01_1 == 5  & rgn == 1
    replace ytrt = 1 if mrs >= 37.8 +20 & year == 2017 & h01_1 >= 6  & rgn == 1
    replace ytrt = 1 if mrs >= 17.8 +20 & year == 2017 & h01_1 == 1  & rgn == 2
    replace ytrt = 1 if mrs >= 20.0 +20 & year == 2017 & h01_1 == 2  & rgn == 2
    replace ytrt = 1 if mrs >= 24.2 +20 & year == 2017 & h01_1 == 3  & rgn == 2
    replace ytrt = 1 if mrs >= 28.3 +20 & year == 2017 & h01_1 == 4  & rgn == 2
    replace ytrt = 1 if mrs >= 29.4 +20 & year == 2017 & h01_1 == 5  & rgn == 2
    replace ytrt = 1 if mrs >= 34.7 +20 & year == 2017 & h01_1 >= 6  & rgn == 2
    replace ytrt = 1 if mrs >= 14.7 +20 & year == 2017 & h01_1 == 1  & rgn == 3
    replace ytrt = 1 if mrs >= 15.8 +20 & year == 2017 & h01_1 == 2  & rgn == 3
    replace ytrt = 1 if mrs >= 18.9 +20 & year == 2017 & h01_1 == 3  & rgn == 3
    replace ytrt = 1 if mrs >= 22.0 +20 & year == 2017 & h01_1 == 4  & rgn == 3
    replace ytrt = 1 if mrs >= 23.1 +20 & year == 2017 & h01_1 == 5  & rgn == 3
    replace ytrt = 1 if mrs >= 26.2 +20 & year == 2017 & h01_1 >= 6  & rgn == 3
    replace ytrt = 1 if mrs >= 13.6 +20 & year == 2017 & h01_1 == 1  & rgn == 4
    replace ytrt = 1 if mrs >= 14.7 +20 & year == 2017 & h01_1 == 2  & rgn == 4
    replace ytrt = 1 if mrs >= 17.8 +20 & year == 2017 & h01_1 == 3  & rgn == 4
    replace ytrt = 1 if mrs >= 20.0 +20 & year == 2017 & h01_1 == 4  & rgn == 4
    replace ytrt = 1 if mrs >= 21.0 +20 & year == 2017 & h01_1 == 5  & rgn == 4
    replace ytrt = 1 if mrs >= 24.2 +20 & year == 2017 & h01_1 >= 6  & rgn == 4

    replace ytrt = 1 if mrs >= 21.3 +20 & year == 2018 & h01_1 == 1  & rgn == 1
    replace ytrt = 1 if mrs >= 24.5 +20 & year == 2018 & h01_1 == 2  & rgn == 1
    replace ytrt = 1 if mrs >= 29.0 +20 & year == 2018 & h01_1 == 3  & rgn == 1
    replace ytrt = 1 if mrs >= 33.5 +20 & year == 2018 & h01_1 == 4  & rgn == 1
    replace ytrt = 1 if mrs >= 34.6 +20 & year == 2018 & h01_1 == 5  & rgn == 1
    replace ytrt = 1 if mrs >= 40.3 +20 & year == 2018 & h01_1 >= 6  & rgn == 1
    replace ytrt = 1 if mrs >= 18.7 +20 & year == 2018 & h01_1 == 1  & rgn == 2
    replace ytrt = 1 if mrs >= 21.0 +20 & year == 2018 & h01_1 == 2  & rgn == 2
    replace ytrt = 1 if mrs >= 25.4 +20 & year == 2018 & h01_1 == 3  & rgn == 2
    replace ytrt = 1 if mrs >= 29.7 +20 & year == 2018 & h01_1 == 4  & rgn == 2
    replace ytrt = 1 if mrs >= 30.8 +20 & year == 2018 & h01_1 == 5  & rgn == 2
    replace ytrt = 1 if mrs >= 36.4 +20 & year == 2018 & h01_1 >= 6  & rgn == 2
    replace ytrt = 1 if mrs >= 15.3 +20 & year == 2018 & h01_1 == 1  & rgn == 3
    replace ytrt = 1 if mrs >= 16.6 +20 & year == 2018 & h01_1 == 2  & rgn == 3
    replace ytrt = 1 if mrs >= 19.8 +20 & year == 2018 & h01_1 == 3  & rgn == 3
    replace ytrt = 1 if mrs >= 23.1 +20 & year == 2018 & h01_1 == 4  & rgn == 3
    replace ytrt = 1 if mrs >= 24.2 +20 & year == 2018 & h01_1 == 5  & rgn == 3
    replace ytrt = 1 if mrs >= 27.6 +20 & year == 2018 & h01_1 >= 6  & rgn == 3
    replace ytrt = 1 if mrs >= 14.0 +20 & year == 2018 & h01_1 == 1  & rgn == 4
    replace ytrt = 1 if mrs >= 15.2 +20 & year == 2018 & h01_1 == 2  & rgn == 4
    replace ytrt = 1 if mrs >= 18.4 +20 & year == 2018 & h01_1 == 3  & rgn == 4
    replace ytrt = 1 if mrs >= 20.8 +20 & year == 2018 & h01_1 == 4  & rgn == 4
    replace ytrt = 1 if mrs >= 21.8 +20 & year == 2018 & h01_1 == 5  & rgn == 4
    replace ytrt = 1 if mrs >= 25.2 +20 & year == 2018 & h01_1 >= 6  & rgn == 4

    replace ytrt = 1 if mrs >= 23.3 +20 & year == 2019 & h01_1 == 1  & rgn == 1
    replace ytrt = 1 if mrs >= 26.7 +20 & year == 2019 & h01_1 == 2  & rgn == 1
    replace ytrt = 1 if mrs >= 31.6 +20 & year == 2019 & h01_1 == 3  & rgn == 1
    replace ytrt = 1 if mrs >= 36.5 +20 & year == 2019 & h01_1 == 4  & rgn == 1
    replace ytrt = 1 if mrs >= 37.7 +20 & year == 2019 & h01_1 == 5  & rgn == 1
    replace ytrt = 1 if mrs >= 44.1 +20 & year == 2019 & h01_1 >= 6  & rgn == 1
    replace ytrt = 1 if mrs >= 20.1 +20 & year == 2019 & h01_1 == 1  & rgn == 2
    replace ytrt = 1 if mrs >= 22.6 +20 & year == 2019 & h01_1 == 2  & rgn == 2
    replace ytrt = 1 if mrs >= 27.2 +20 & year == 2019 & h01_1 == 3  & rgn == 2
    replace ytrt = 1 if mrs >= 31.7 +20 & year == 2019 & h01_1 == 4  & rgn == 2
    replace ytrt = 1 if mrs >= 32.9 +20 & year == 2019 & h01_1 == 5  & rgn == 2
    replace ytrt = 1 if mrs >= 38.9 +20 & year == 2019 & h01_1 >= 6  & rgn == 2
    replace ytrt = 1 if mrs >= 16.3 +20 & year == 2019 & h01_1 == 1  & rgn == 3
    replace ytrt = 1 if mrs >= 17.8 +20 & year == 2019 & h01_1 == 2  & rgn == 3
    replace ytrt = 1 if mrs >= 21.3 +20 & year == 2019 & h01_1 == 3  & rgn == 3
    replace ytrt = 1 if mrs >= 24.7 +20 & year == 2019 & h01_1 == 4  & rgn == 3
    replace ytrt = 1 if mrs >= 25.8 +20 & year == 2019 & h01_1 == 5  & rgn == 3
    replace ytrt = 1 if mrs >= 29.6 +20 & year == 2019 & h01_1 >= 6  & rgn == 3
    replace ytrt = 1 if mrs >= 14.7 +20 & year == 2019 & h01_1 == 1  & rgn == 4
    replace ytrt = 1 if mrs >= 16.1 +20 & year == 2019 & h01_1 == 2  & rgn == 4
    replace ytrt = 1 if mrs >= 19.4 +20 & year == 2019 & h01_1 == 3  & rgn == 4
    replace ytrt = 1 if mrs >= 22.0 +20 & year == 2019 & h01_1 == 4  & rgn == 4
    replace ytrt = 1 if mrs >= 22.9 +20 & year == 2019 & h01_1 == 5  & rgn == 4
    replace ytrt = 1 if mrs >= 26.7 +20 & year == 2019 & h01_1 >= 6  & rgn == 4

    replace ytrt = 1 if mrs >= 36.6 +20 & year == 2020 & h01_1 == 1  & rgn == 1
    replace ytrt = 1 if mrs >= 30.2 +20 & year == 2020 & h01_1 == 2  & rgn == 1
    replace ytrt = 1 if mrs >= 35.9 +20 & year == 2020 & h01_1 == 3  & rgn == 1
    replace ytrt = 1 if mrs >= 41.5 +20 & year == 2020 & h01_1 == 4  & rgn == 1
    replace ytrt = 1 if mrs >= 42.9 +20 & year == 2020 & h01_1 == 5  & rgn == 1
    replace ytrt = 1 if mrs >= 50.4 +20 & year == 2020 & h01_1 >= 6  & rgn == 1
    replace ytrt = 1 if mrs >= 22.5 +20 & year == 2020 & h01_1 == 1  & rgn == 2
    replace ytrt = 1 if mrs >= 25.2 +20 & year == 2020 & h01_1 == 2  & rgn == 2
    replace ytrt = 1 if mrs >= 30.2 +20 & year == 2020 & h01_1 == 3  & rgn == 2
    replace ytrt = 1 if mrs >= 35.1 +20 & year == 2020 & h01_1 == 4  & rgn == 2
    replace ytrt = 1 if mrs >= 36.5 +20 & year == 2020 & h01_1 == 5  & rgn == 2
    replace ytrt = 1 if mrs >= 43.0 +20 & year == 2020 & h01_1 >= 6  & rgn == 2
    replace ytrt = 1 if mrs >= 17.9 +20 & year == 2020 & h01_1 == 1  & rgn == 3
    replace ytrt = 1 if mrs >= 19.8 +20 & year == 2020 & h01_1 == 2  & rgn == 3
    replace ytrt = 1 if mrs >= 23.6 +20 & year == 2020 & h01_1 == 3  & rgn == 3
    replace ytrt = 1 if mrs >= 27.4 +20 & year == 2020 & h01_1 == 4  & rgn == 3
    replace ytrt = 1 if mrs >= 28.5 +20 & year == 2020 & h01_1 == 5  & rgn == 3
    replace ytrt = 1 if mrs >= 33.1 +20 & year == 2020 & h01_1 >= 6  & rgn == 3
    replace ytrt = 1 if mrs >= 15.8 +20 & year == 2020 & h01_1 == 1  & rgn == 4
    replace ytrt = 1 if mrs >= 17.4 +20 & year == 2020 & h01_1 == 2  & rgn == 4
    replace ytrt = 1 if mrs >= 20.9 +20 & year == 2020 & h01_1 == 3  & rgn == 4
    replace ytrt = 1 if mrs >= 23.9 +20 & year == 2020 & h01_1 == 4  & rgn == 4
    replace ytrt = 1 if mrs >= 24.9 +20 & year == 2020 & h01_1 == 5  & rgn == 4
    replace ytrt = 1 if mrs >= 29.1 +20 & year == 2020 & h01_1 >= 6  & rgn == 4

    replace ytrt = 1 if mrs >= 31.0 +20 & year == 2021 & h01_1 == 1  & rgn == 1
    replace ytrt = 1 if mrs >= 34.8 +20 & year == 2021 & h01_1 == 2  & rgn == 1
    replace ytrt = 1 if mrs >= 41.4 +20 & year == 2021 & h01_1 == 3  & rgn == 1
    replace ytrt = 1 if mrs >= 48.0 +20 & year == 2021 & h01_1 == 4  & rgn == 1
    replace ytrt = 1 if mrs >= 49.7 +20 & year == 2021 & h01_1 == 5  & rgn == 1
    replace ytrt = 1 if mrs >= 58.8 +20 & year == 2021 & h01_1 >= 6  & rgn == 1
    replace ytrt = 1 if mrs >= 23.9 +20 & year == 2021 & h01_1 == 1  & rgn == 2
    replace ytrt = 1 if mrs >= 26.8 +20 & year == 2021 & h01_1 == 2  & rgn == 2
    replace ytrt = 1 if mrs >= 32.0 +20 & year == 2021 & h01_1 == 3  & rgn == 2
    replace ytrt = 1 if mrs >= 37.1 +20 & year == 2021 & h01_1 == 4  & rgn == 2
    replace ytrt = 1 if mrs >= 38.3 +20 & year == 2021 & h01_1 == 5  & rgn == 2
    replace ytrt = 1 if mrs >= 45.3 +20 & year == 2021 & h01_1 >= 6  & rgn == 2
    replace ytrt = 1 if mrs >= 19.0 +20 & year == 2021 & h01_1 == 1  & rgn == 3
    replace ytrt = 1 if mrs >= 21.2 +20 & year == 2021 & h01_1 == 2  & rgn == 3
    replace ytrt = 1 if mrs >= 25.4 +20 & year == 2021 & h01_1 == 3  & rgn == 3
    replace ytrt = 1 if mrs >= 29.4 +20 & year == 2021 & h01_1 == 4  & rgn == 3
    replace ytrt = 1 if mrs >= 30.3 +20 & year == 2021 & h01_1 == 5  & rgn == 3
    replace ytrt = 1 if mrs >= 35.9 +20 & year == 2021 & h01_1 >= 6  & rgn == 3
    replace ytrt = 1 if mrs >= 16.3 +20 & year == 2021 & h01_1 == 1  & rgn == 4
    replace ytrt = 1 if mrs >= 18.3 +20 & year == 2021 & h01_1 == 2  & rgn == 4
    replace ytrt = 1 if mrs >= 21.7 +20 & year == 2021 & h01_1 == 3  & rgn == 4
    replace ytrt = 1 if mrs >= 25.3 +20 & year == 2021 & h01_1 == 4  & rgn == 4
    replace ytrt = 1 if mrs >= 26.1 +20 & year == 2021 & h01_1 == 5  & rgn == 4
    replace ytrt = 1 if mrs >= 30.9 +20 & year == 2021 & h01_1 >= 6  & rgn == 4

    replace ytrt = 1 if mrs >= 32.8 +20 & year == 2022 & h01_1 == 1  & rgn == 1
    replace ytrt = 1 if mrs >= 36.8 +20 & year == 2022 & h01_1 == 2  & rgn == 1
    replace ytrt = 1 if mrs >= 43.8 +20 & year == 2022 & h01_1 == 3  & rgn == 1
    replace ytrt = 1 if mrs >= 50.7 +20 & year == 2022 & h01_1 == 4  & rgn == 1
    replace ytrt = 1 if mrs >= 52.5 +20 & year == 2022 & h01_1 == 5  & rgn == 1
    replace ytrt = 1 if mrs >= 62.2 +20 & year == 2022 & h01_1 >= 6  & rgn == 1
    replace ytrt = 1 if mrs >= 25.4 +20 & year == 2022 & h01_1 == 1  & rgn == 2
    replace ytrt = 1 if mrs >= 28.4 +20 & year == 2022 & h01_1 == 2  & rgn == 2
    replace ytrt = 1 if mrs >= 33.9 +20 & year == 2022 & h01_1 == 3  & rgn == 2
    replace ytrt = 1 if mrs >= 39.2 +20 & year == 2022 & h01_1 == 4  & rgn == 2
    replace ytrt = 1 if mrs >= 40.5 +20 & year == 2022 & h01_1 == 5  & rgn == 2
    replace ytrt = 1 if mrs >= 47.9 +20 & year == 2022 & h01_1 >= 6  & rgn == 2
    replace ytrt = 1 if mrs >= 20.2 +20 & year == 2022 & h01_1 == 1  & rgn == 3
    replace ytrt = 1 if mrs >= 22.5 +20 & year == 2022 & h01_1 == 2  & rgn == 3
    replace ytrt = 1 if mrs >= 26.9 +20 & year == 2022 & h01_1 == 3  & rgn == 3
    replace ytrt = 1 if mrs >= 31.1 +20 & year == 2022 & h01_1 == 4  & rgn == 3
    replace ytrt = 1 if mrs >= 32.1 +20 & year == 2022 & h01_1 == 5  & rgn == 3
    replace ytrt = 1 if mrs >= 37.1 +20 & year == 2022 & h01_1 >= 6  & rgn == 3
    replace ytrt = 1 if mrs >= 16.4 +20 & year == 2022 & h01_1 == 1  & rgn == 4
    replace ytrt = 1 if mrs >= 18.4 +20 & year == 2022 & h01_1 == 2  & rgn == 4
    replace ytrt = 1 if mrs >= 21.9 +20 & year == 2022 & h01_1 == 3  & rgn == 4
    replace ytrt = 1 if mrs >= 25.5 +20 & year == 2022 & h01_1 == 4  & rgn == 4
    replace ytrt = 1 if mrs >= 26.3 +20 & year == 2022 & h01_1 == 5  & rgn == 4
    replace ytrt = 1 if mrs >= 31.1 +20 & year == 2022 & h01_1 >= 6  & rgn == 4

    replace ytrt = 1 if mrs >= 33.0 +20 & year == 2023 & h01_1 == 1  & rgn == 1
    replace ytrt = 1 if mrs >= 37.0 +20 & year == 2023 & h01_1 == 2  & rgn == 1
    replace ytrt = 1 if mrs >= 44.1 +20 & year == 2023 & h01_1 == 3  & rgn == 1
    replace ytrt = 1 if mrs >= 51.0 +20 & year == 2023 & h01_1 == 4  & rgn == 1
    replace ytrt = 1 if mrs >= 52.8 +20 & year == 2023 & h01_1 == 5  & rgn == 1
    replace ytrt = 1 if mrs >= 62.6 +20 & year == 2023 & h01_1 >= 6  & rgn == 1
    replace ytrt = 1 if mrs >= 25.5 +20 & year == 2023 & h01_1 == 1  & rgn == 2
    replace ytrt = 1 if mrs >= 28.5 +20 & year == 2023 & h01_1 == 2  & rgn == 2
    replace ytrt = 1 if mrs >= 34.1 +20 & year == 2023 & h01_1 == 3  & rgn == 2
    replace ytrt = 1 if mrs >= 39.4 +20 & year == 2023 & h01_1 == 4  & rgn == 2
    replace ytrt = 1 if mrs >= 40.7 +20 & year == 2023 & h01_1 == 5  & rgn == 2
    replace ytrt = 1 if mrs >= 48.2 +20 & year == 2023 & h01_1 >= 6  & rgn == 2
    replace ytrt = 1 if mrs >= 20.3 +20 & year == 2023 & h01_1 == 1  & rgn == 3
    replace ytrt = 1 if mrs >= 22.6 +20 & year == 2023 & h01_1 == 2  & rgn == 3
    replace ytrt = 1 if mrs >= 27.0 +20 & year == 2023 & h01_1 == 3  & rgn == 3
    replace ytrt = 1 if mrs >= 31.3 +20 & year == 2023 & h01_1 == 4  & rgn == 3
    replace ytrt = 1 if mrs >= 32.3 +20 & year == 2023 & h01_1 == 5  & rgn == 3
    replace ytrt = 1 if mrs >= 38.2 +20 & year == 2023 & h01_1 >= 6  & rgn == 3
    replace ytrt = 1 if mrs >= 16.4 +20 & year == 2023 & h01_1 == 1  & rgn == 4
    replace ytrt = 1 if mrs >= 18.5 +20 & year == 2023 & h01_1 == 2  & rgn == 4
    replace ytrt = 1 if mrs >= 22.0 +20 & year == 2023 & h01_1 == 3  & rgn == 4
    replace ytrt = 1 if mrs >= 25.6 +20 & year == 2023 & h01_1 == 4  & rgn == 4
    replace ytrt = 1 if mrs >= 26.4 +20 & year == 2023 & h01_1 == 5  & rgn == 4
    replace ytrt = 1 if mrs >= 31.3 +20 & year == 2023 & h01_1 >= 6  & rgn == 4

    replace ytrt = 0 if missing(mrs)
/*}}}*/

bys hhid : gen ctrt = sum(ytrt)

mvdecode  h02_20 , mv(9)
egen health = rowmean( h02_2 h02_11 h02_20 h02_29 h02_38 h02_47 h02_56 h02_65 h02_74)
    replace health = 5 - health
    label var health "가구원 평균건강상태"  

egen disa = rowmax(h01_9 h01_21  h01_33  h01_45  h01_57  h01_69  h01_81  h01_93 h01_105)

bysort hhid (year): egen repair_year = min(cond(repair_amt>0, year, .))
replace repair_year = 0 if repair_year == .
gen ever_repair = (repair_year < .)
gen rel_year = year - repair_year if ever_repair==1

compress
sort hhid 
xtset hhid year
save weps , replace
