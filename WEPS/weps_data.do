cd ~/Library/CloudStorage/dropbox/data/KOWEPS
use wepsh , clear
drop if year <= 2015

rename h01_11aq8    rstype
    label define RSTYPE 0 "해당없음" 1 "임차급여(특례포함)" 3 "수선유지급여(특례포함)"
    label var rstype RSTYPE
rename h06_2        location
    label define LOCATION 1 "지하층" 2 "반지하층" 3 "지상" 4 "옥탑"
    label var location LOCATION
rename h06_5        size
rename h06_21       water
    label define WATER 1 "단독사용" 2 "공동사용" 3 "없음"
    label var water WATER
rename h06_22       kitchen
    label define KITCHEN 1 "단독사용-입식" 2 "단독사용-재래식" 3 "공동사용-입식" ///
        4 "공동사용-재래식" 5 "없음"
    label var kitchen KITCHEN
rename h06_23       toilet
    label define TOILET 1 "단독사용-수세식" 2 "단독사용-재래식" 3 "공동사용-수세식" ///
        4 "공동사용-재래식" 5 "없음"
    label var toilet TOILET
rename h06_24       bath
    label define BATH 1 "단독사용-온수시설 있음" 2 "단독사용-온수시설 없음" ///
        3 "공동사용-온수시설 있음" 4 "공동사용-온수시설 없음" 5 "없음"
    label var bath BATH
rename h06_25       heat
    label define HEAT 1 "연탄 또는 재래식(땔감) 아궁이" 4 "기름보일러" 7 "중앙난방" ///
        2 "연탄보일러" 5 "가스보일러" 8 "전기장판" 3 "나무,석탄보일러" 6 "전기보일러" 9 "기타"
    label var heat HEAT
rename h06_27       prent
    label define PRENT 1 "있다" 0 "없다"
    label var prent PRENT
rename h06_33       tloan
    label define TLOAN 1 "있다" 0 "없다"
    label var tloan TLOAN
rename h06_36       mloan
    label define MLOAN 1 "있다" 0 "없다"
    label var mloan MLOAN
rename h06_39       bloan
    label define BLOAN 1 "있다" 0 "없다"
    label var bloan BLOAN
rename h07_3aq3     rent
rename h07_3aq4     mngt
rename h08_11aq4    mrs
rename h08_11aq5    tms
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


gen rgn = 0
    replace rgn = 1 if h_reg7 == 1
    replace rgn = 2 if h_reg7 == 2
    replace rgn = 3 if h_reg5 == 2 & !inlist(h_reg7, 1, 2)
    replace rgn = 4 if !inlist(h_reg5, 1, 2) & !inlist(h_reg7, 1, 2)

gen tag = 0
    replace tag = 1 if tms >= 330000 & year == 2015 & nhh == 1  & rgn == 1
    replace tag = 1 if tms >= 370000 & year == 2015 & nhh == 2  & rgn == 1
    replace tag = 1 if tms >= 441000 & year == 2015 & nhh == 3  & rgn == 1
    replace tag = 1 if tms >= 510000 & year == 2015 & nhh == 4  & rgn == 1
    replace tag = 1 if tms >= 528000 & year == 2015 & nhh == 5  & rgn == 1
    replace tag = 1 if tms >= 626000 & year == 2015 & nhh >= 6  & rgn == 1
    replace tag = 1 if tms >= 255000 & year == 2015 & nhh == 1  & rgn == 2
    replace tag = 1 if tms >= 285000 & year == 2015 & nhh == 2  & rgn == 2
    replace tag = 1 if tms >= 341000 & year == 2015 & nhh == 3  & rgn == 2
    replace tag = 1 if tms >= 394000 & year == 2015 & nhh == 4  & rgn == 2
    replace tag = 1 if tms >= 407000 & year == 2015 & nhh == 5  & rgn == 2
    replace tag = 1 if tms >= 482000 & year == 2015 & nhh >= 6  & rgn == 2
    replace tag = 1 if tms >= 203000 & year == 2015 & nhh == 1  & rgn == 3
    replace tag = 1 if tms >= 226000 & year == 2015 & nhh == 2  & rgn == 3
    replace tag = 1 if tms >= 270000 & year == 2015 & nhh == 3  & rgn == 3
    replace tag = 1 if tms >= 313000 & year == 2015 & nhh == 4  & rgn == 3
    replace tag = 1 if tms >= 323000 & year == 2015 & nhh == 5  & rgn == 3
    replace tag = 1 if tms >= 382000 & year == 2015 & nhh >= 6  & rgn == 3
    replace tag = 1 if tms >= 164000 & year == 2015 & nhh == 1  & rgn == 4
    replace tag = 1 if tms >= 185000 & year == 2015 & nhh == 2  & rgn == 4
    replace tag = 1 if tms >= 220000 & year == 2015 & nhh == 3  & rgn == 4
    replace tag = 1 if tms >= 256000 & year == 2015 & nhh == 4  & rgn == 4
    replace tag = 1 if tms >= 264000 & year == 2015 & nhh == 5  & rgn == 4
    replace tag = 1 if tms >= 313000 & year == 2015 & nhh >= 6  & rgn == 4

    replace tag = 1 if tms >= 330000 & year == 2016 & nhh == 1  & rgn == 1
    replace tag = 1 if tms >= 370000 & year == 2016 & nhh == 2  & rgn == 1
    replace tag = 1 if tms >= 441000 & year == 2016 & nhh == 3  & rgn == 1
    replace tag = 1 if tms >= 510000 & year == 2016 & nhh == 4  & rgn == 1
    replace tag = 1 if tms >= 528000 & year == 2016 & nhh == 5  & rgn == 1
    replace tag = 1 if tms >= 626000 & year == 2016 & nhh >= 6  & rgn == 1
    replace tag = 1 if tms >= 255000 & year == 2016 & nhh == 1  & rgn == 2
    replace tag = 1 if tms >= 285000 & year == 2016 & nhh == 2  & rgn == 2
    replace tag = 1 if tms >= 341000 & year == 2016 & nhh == 3  & rgn == 2
    replace tag = 1 if tms >= 394000 & year == 2016 & nhh == 4  & rgn == 2
    replace tag = 1 if tms >= 407000 & year == 2016 & nhh == 5  & rgn == 2
    replace tag = 1 if tms >= 482000 & year == 2016 & nhh >= 6  & rgn == 2
    replace tag = 1 if tms >= 203000 & year == 2016 & nhh == 1  & rgn == 3
    replace tag = 1 if tms >= 226000 & year == 2016 & nhh == 2  & rgn == 3
    replace tag = 1 if tms >= 270000 & year == 2016 & nhh == 3  & rgn == 3
    replace tag = 1 if tms >= 313000 & year == 2016 & nhh == 4  & rgn == 3
    replace tag = 1 if tms >= 323000 & year == 2016 & nhh == 5  & rgn == 3
    replace tag = 1 if tms >= 382000 & year == 2016 & nhh >= 6  & rgn == 3
    replace tag = 1 if tms >= 164000 & year == 2016 & nhh == 1  & rgn == 4
    replace tag = 1 if tms >= 185000 & year == 2016 & nhh == 2  & rgn == 4
    replace tag = 1 if tms >= 220000 & year == 2016 & nhh == 3  & rgn == 4
    replace tag = 1 if tms >= 256000 & year == 2016 & nhh == 4  & rgn == 4
    replace tag = 1 if tms >= 264000 & year == 2016 & nhh == 5  & rgn == 4
    replace tag = 1 if tms >= 313000 & year == 2016 & nhh >= 6  & rgn == 4

    replace tag = 1 if tms >= 330000 & year == 2017 & nhh == 1  & rgn == 1
    replace tag = 1 if tms >= 370000 & year == 2017 & nhh == 2  & rgn == 1
    replace tag = 1 if tms >= 441000 & year == 2017 & nhh == 3  & rgn == 1
    replace tag = 1 if tms >= 510000 & year == 2017 & nhh == 4  & rgn == 1
    replace tag = 1 if tms >= 528000 & year == 2017 & nhh == 5  & rgn == 1
    replace tag = 1 if tms >= 626000 & year == 2017 & nhh >= 6  & rgn == 1
    replace tag = 1 if tms >= 255000 & year == 2017 & nhh == 1  & rgn == 2
    replace tag = 1 if tms >= 285000 & year == 2017 & nhh == 2  & rgn == 2
    replace tag = 1 if tms >= 341000 & year == 2017 & nhh == 3  & rgn == 2
    replace tag = 1 if tms >= 394000 & year == 2017 & nhh == 4  & rgn == 2
    replace tag = 1 if tms >= 407000 & year == 2017 & nhh == 5  & rgn == 2
    replace tag = 1 if tms >= 482000 & year == 2017 & nhh >= 6  & rgn == 2
    replace tag = 1 if tms >= 203000 & year == 2017 & nhh == 1  & rgn == 3
    replace tag = 1 if tms >= 226000 & year == 2017 & nhh == 2  & rgn == 3
    replace tag = 1 if tms >= 270000 & year == 2017 & nhh == 3  & rgn == 3
    replace tag = 1 if tms >= 313000 & year == 2017 & nhh == 4  & rgn == 3
    replace tag = 1 if tms >= 323000 & year == 2017 & nhh == 5  & rgn == 3
    replace tag = 1 if tms >= 382000 & year == 2017 & nhh >= 6  & rgn == 3
    replace tag = 1 if tms >= 164000 & year == 2017 & nhh == 1  & rgn == 4
    replace tag = 1 if tms >= 185000 & year == 2017 & nhh == 2  & rgn == 4
    replace tag = 1 if tms >= 220000 & year == 2017 & nhh == 3  & rgn == 4
    replace tag = 1 if tms >= 256000 & year == 2017 & nhh == 4  & rgn == 4
    replace tag = 1 if tms >= 264000 & year == 2017 & nhh == 5  & rgn == 4
    replace tag = 1 if tms >= 313000 & year == 2017 & nhh >= 6  & rgn == 4

    replace tag = 1 if tms >= 330000 & year == 2018 & nhh == 1  & rgn == 1
    replace tag = 1 if tms >= 370000 & year == 2018 & nhh == 2  & rgn == 1
    replace tag = 1 if tms >= 441000 & year == 2018 & nhh == 3  & rgn == 1
    replace tag = 1 if tms >= 510000 & year == 2018 & nhh == 4  & rgn == 1
    replace tag = 1 if tms >= 528000 & year == 2018 & nhh == 5  & rgn == 1
    replace tag = 1 if tms >= 626000 & year == 2018 & nhh >= 6  & rgn == 1
    replace tag = 1 if tms >= 255000 & year == 2018 & nhh == 1  & rgn == 2
    replace tag = 1 if tms >= 285000 & year == 2018 & nhh == 2  & rgn == 2
    replace tag = 1 if tms >= 341000 & year == 2018 & nhh == 3  & rgn == 2
    replace tag = 1 if tms >= 394000 & year == 2018 & nhh == 4  & rgn == 2
    replace tag = 1 if tms >= 407000 & year == 2018 & nhh == 5  & rgn == 2
    replace tag = 1 if tms >= 482000 & year == 2018 & nhh >= 6  & rgn == 2
    replace tag = 1 if tms >= 203000 & year == 2018 & nhh == 1  & rgn == 3
    replace tag = 1 if tms >= 226000 & year == 2018 & nhh == 2  & rgn == 3
    replace tag = 1 if tms >= 270000 & year == 2018 & nhh == 3  & rgn == 3
    replace tag = 1 if tms >= 313000 & year == 2018 & nhh == 4  & rgn == 3
    replace tag = 1 if tms >= 323000 & year == 2018 & nhh == 5  & rgn == 3
    replace tag = 1 if tms >= 382000 & year == 2018 & nhh >= 6  & rgn == 3
    replace tag = 1 if tms >= 164000 & year == 2018 & nhh == 1  & rgn == 4
    replace tag = 1 if tms >= 185000 & year == 2018 & nhh == 2  & rgn == 4
    replace tag = 1 if tms >= 220000 & year == 2018 & nhh == 3  & rgn == 4
    replace tag = 1 if tms >= 256000 & year == 2018 & nhh == 4  & rgn == 4
    replace tag = 1 if tms >= 264000 & year == 2018 & nhh == 5  & rgn == 4
    replace tag = 1 if tms >= 313000 & year == 2018 & nhh >= 6  & rgn == 4

    replace tag = 1 if tms >= 330000 & year == 2019 & nhh == 1  & rgn == 1
    replace tag = 1 if tms >= 370000 & year == 2019 & nhh == 2  & rgn == 1
    replace tag = 1 if tms >= 441000 & year == 2019 & nhh == 3  & rgn == 1
    replace tag = 1 if tms >= 510000 & year == 2019 & nhh == 4  & rgn == 1
    replace tag = 1 if tms >= 528000 & year == 2019 & nhh == 5  & rgn == 1
    replace tag = 1 if tms >= 626000 & year == 2019 & nhh >= 6  & rgn == 1
    replace tag = 1 if tms >= 255000 & year == 2019 & nhh == 1  & rgn == 2
    replace tag = 1 if tms >= 285000 & year == 2019 & nhh == 2  & rgn == 2
    replace tag = 1 if tms >= 341000 & year == 2019 & nhh == 3  & rgn == 2
    replace tag = 1 if tms >= 394000 & year == 2019 & nhh == 4  & rgn == 2
    replace tag = 1 if tms >= 407000 & year == 2019 & nhh == 5  & rgn == 2
    replace tag = 1 if tms >= 482000 & year == 2019 & nhh >= 6  & rgn == 2
    replace tag = 1 if tms >= 203000 & year == 2019 & nhh == 1  & rgn == 3
    replace tag = 1 if tms >= 226000 & year == 2019 & nhh == 2  & rgn == 3
    replace tag = 1 if tms >= 270000 & year == 2019 & nhh == 3  & rgn == 3
    replace tag = 1 if tms >= 313000 & year == 2019 & nhh == 4  & rgn == 3
    replace tag = 1 if tms >= 323000 & year == 2019 & nhh == 5  & rgn == 3
    replace tag = 1 if tms >= 382000 & year == 2019 & nhh >= 6  & rgn == 3
    replace tag = 1 if tms >= 164000 & year == 2019 & nhh == 1  & rgn == 4
    replace tag = 1 if tms >= 185000 & year == 2019 & nhh == 2  & rgn == 4
    replace tag = 1 if tms >= 220000 & year == 2019 & nhh == 3  & rgn == 4
    replace tag = 1 if tms >= 256000 & year == 2019 & nhh == 4  & rgn == 4
    replace tag = 1 if tms >= 264000 & year == 2019 & nhh == 5  & rgn == 4
    replace tag = 1 if tms >= 313000 & year == 2019 & nhh >= 6  & rgn == 4

    replace tag = 1 if tms >= 330000 & year == 2020 & nhh == 1  & rgn == 1
    replace tag = 1 if tms >= 370000 & year == 2020 & nhh == 2  & rgn == 1
    replace tag = 1 if tms >= 441000 & year == 2020 & nhh == 3  & rgn == 1
    replace tag = 1 if tms >= 510000 & year == 2020 & nhh == 4  & rgn == 1
    replace tag = 1 if tms >= 528000 & year == 2020 & nhh == 5  & rgn == 1
    replace tag = 1 if tms >= 626000 & year == 2020 & nhh >= 6  & rgn == 1
    replace tag = 1 if tms >= 255000 & year == 2020 & nhh == 1  & rgn == 2
    replace tag = 1 if tms >= 285000 & year == 2020 & nhh == 2  & rgn == 2
    replace tag = 1 if tms >= 341000 & year == 2020 & nhh == 3  & rgn == 2
    replace tag = 1 if tms >= 394000 & year == 2020 & nhh == 4  & rgn == 2
    replace tag = 1 if tms >= 407000 & year == 2020 & nhh == 5  & rgn == 2
    replace tag = 1 if tms >= 482000 & year == 2020 & nhh >= 6  & rgn == 2
    replace tag = 1 if tms >= 203000 & year == 2020 & nhh == 1  & rgn == 3
    replace tag = 1 if tms >= 226000 & year == 2020 & nhh == 2  & rgn == 3
    replace tag = 1 if tms >= 270000 & year == 2020 & nhh == 3  & rgn == 3
    replace tag = 1 if tms >= 313000 & year == 2020 & nhh == 4  & rgn == 3
    replace tag = 1 if tms >= 323000 & year == 2020 & nhh == 5  & rgn == 3
    replace tag = 1 if tms >= 382000 & year == 2020 & nhh >= 6  & rgn == 3
    replace tag = 1 if tms >= 164000 & year == 2020 & nhh == 1  & rgn == 4
    replace tag = 1 if tms >= 185000 & year == 2020 & nhh == 2  & rgn == 4
    replace tag = 1 if tms >= 220000 & year == 2020 & nhh == 3  & rgn == 4
    replace tag = 1 if tms >= 256000 & year == 2020 & nhh == 4  & rgn == 4
    replace tag = 1 if tms >= 264000 & year == 2020 & nhh == 5  & rgn == 4
    replace tag = 1 if tms >= 313000 & year == 2020 & nhh >= 6  & rgn == 4

    replace tag = 1 if tms >= 330000 & year == 2021 & nhh == 1  & rgn == 1
    replace tag = 1 if tms >= 370000 & year == 2021 & nhh == 2  & rgn == 1
    replace tag = 1 if tms >= 441000 & year == 2021 & nhh == 3  & rgn == 1
    replace tag = 1 if tms >= 510000 & year == 2021 & nhh == 4  & rgn == 1
    replace tag = 1 if tms >= 528000 & year == 2021 & nhh == 5  & rgn == 1
    replace tag = 1 if tms >= 626000 & year == 2021 & nhh >= 6  & rgn == 1
    replace tag = 1 if tms >= 255000 & year == 2021 & nhh == 1  & rgn == 2
    replace tag = 1 if tms >= 285000 & year == 2021 & nhh == 2  & rgn == 2
    replace tag = 1 if tms >= 341000 & year == 2021 & nhh == 3  & rgn == 2
    replace tag = 1 if tms >= 394000 & year == 2021 & nhh == 4  & rgn == 2
    replace tag = 1 if tms >= 407000 & year == 2021 & nhh == 5  & rgn == 2
    replace tag = 1 if tms >= 482000 & year == 2021 & nhh >= 6  & rgn == 2
    replace tag = 1 if tms >= 203000 & year == 2021 & nhh == 1  & rgn == 3
    replace tag = 1 if tms >= 226000 & year == 2021 & nhh == 2  & rgn == 3
    replace tag = 1 if tms >= 270000 & year == 2021 & nhh == 3  & rgn == 3
    replace tag = 1 if tms >= 313000 & year == 2021 & nhh == 4  & rgn == 3
    replace tag = 1 if tms >= 323000 & year == 2021 & nhh == 5  & rgn == 3
    replace tag = 1 if tms >= 382000 & year == 2021 & nhh >= 6  & rgn == 3
    replace tag = 1 if tms >= 164000 & year == 2021 & nhh == 1  & rgn == 4
    replace tag = 1 if tms >= 185000 & year == 2021 & nhh == 2  & rgn == 4
    replace tag = 1 if tms >= 220000 & year == 2021 & nhh == 3  & rgn == 4
    replace tag = 1 if tms >= 256000 & year == 2021 & nhh == 4  & rgn == 4
    replace tag = 1 if tms >= 264000 & year == 2021 & nhh == 5  & rgn == 4
    replace tag = 1 if tms >= 313000 & year == 2021 & nhh >= 6  & rgn == 4

    replace tag = 1 if tms >= 330000 & year == 2022 & nhh == 1  & rgn == 1
    replace tag = 1 if tms >= 370000 & year == 2022 & nhh == 2  & rgn == 1
    replace tag = 1 if tms >= 441000 & year == 2022 & nhh == 3  & rgn == 1
    replace tag = 1 if tms >= 510000 & year == 2022 & nhh == 4  & rgn == 1
    replace tag = 1 if tms >= 528000 & year == 2022 & nhh == 5  & rgn == 1
    replace tag = 1 if tms >= 626000 & year == 2022 & nhh >= 6  & rgn == 1
    replace tag = 1 if tms >= 255000 & year == 2022 & nhh == 1  & rgn == 2
    replace tag = 1 if tms >= 285000 & year == 2022 & nhh == 2  & rgn == 2
    replace tag = 1 if tms >= 341000 & year == 2022 & nhh == 3  & rgn == 2
    replace tag = 1 if tms >= 394000 & year == 2022 & nhh == 4  & rgn == 2
    replace tag = 1 if tms >= 407000 & year == 2022 & nhh == 5  & rgn == 2
    replace tag = 1 if tms >= 482000 & year == 2022 & nhh >= 6  & rgn == 2
    replace tag = 1 if tms >= 203000 & year == 2022 & nhh == 1  & rgn == 3
    replace tag = 1 if tms >= 226000 & year == 2022 & nhh == 2  & rgn == 3
    replace tag = 1 if tms >= 270000 & year == 2022 & nhh == 3  & rgn == 3
    replace tag = 1 if tms >= 313000 & year == 2022 & nhh == 4  & rgn == 3
    replace tag = 1 if tms >= 323000 & year == 2022 & nhh == 5  & rgn == 3
    replace tag = 1 if tms >= 382000 & year == 2022 & nhh >= 6  & rgn == 3
    replace tag = 1 if tms >= 164000 & year == 2022 & nhh == 1  & rgn == 4
    replace tag = 1 if tms >= 185000 & year == 2022 & nhh == 2  & rgn == 4
    replace tag = 1 if tms >= 220000 & year == 2022 & nhh == 3  & rgn == 4
    replace tag = 1 if tms >= 256000 & year == 2022 & nhh == 4  & rgn == 4
    replace tag = 1 if tms >= 264000 & year == 2022 & nhh == 5  & rgn == 4
    replace tag = 1 if tms >= 313000 & year == 2022 & nhh >= 6  & rgn == 4

    replace tag = 1 if tms >= 330000 & year == 2023 & nhh == 1  & rgn == 1
    replace tag = 1 if tms >= 370000 & year == 2023 & nhh == 2  & rgn == 1
    replace tag = 1 if tms >= 441000 & year == 2023 & nhh == 3  & rgn == 1
    replace tag = 1 if tms >= 510000 & year == 2023 & nhh == 4  & rgn == 1
    replace tag = 1 if tms >= 528000 & year == 2023 & nhh == 5  & rgn == 1
    replace tag = 1 if tms >= 626000 & year == 2023 & nhh >= 6  & rgn == 1
    replace tag = 1 if tms >= 255000 & year == 2023 & nhh == 1  & rgn == 2
    replace tag = 1 if tms >= 285000 & year == 2023 & nhh == 2  & rgn == 2
    replace tag = 1 if tms >= 341000 & year == 2023 & nhh == 3  & rgn == 2
    replace tag = 1 if tms >= 394000 & year == 2023 & nhh == 4  & rgn == 2
    replace tag = 1 if tms >= 407000 & year == 2023 & nhh == 5  & rgn == 2
    replace tag = 1 if tms >= 482000 & year == 2023 & nhh >= 6  & rgn == 2
    replace tag = 1 if tms >= 203000 & year == 2023 & nhh == 1  & rgn == 3
    replace tag = 1 if tms >= 226000 & year == 2023 & nhh == 2  & rgn == 3
    replace tag = 1 if tms >= 270000 & year == 2023 & nhh == 3  & rgn == 3
    replace tag = 1 if tms >= 313000 & year == 2023 & nhh == 4  & rgn == 3
    replace tag = 1 if tms >= 323000 & year == 2023 & nhh == 5  & rgn == 3
    replace tag = 1 if tms >= 382000 & year == 2023 & nhh >= 6  & rgn == 3
    replace tag = 1 if tms >= 164000 & year == 2023 & nhh == 1  & rgn == 4
    replace tag = 1 if tms >= 185000 & year == 2023 & nhh == 2  & rgn == 4
    replace tag = 1 if tms >= 220000 & year == 2023 & nhh == 3  & rgn == 4
    replace tag = 1 if tms >= 256000 & year == 2023 & nhh == 4  & rgn == 4
    replace tag = 1 if tms >= 264000 & year == 2023 & nhh == 5  & rgn == 4
    replace tag = 1 if tms >= 313000 & year == 2023 & nhh >= 6  & rgn == 4

save weps , replace
