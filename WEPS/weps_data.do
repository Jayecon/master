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
    label define KITCHEN 1 "단독사용-입식" 2 "단독사용-재래식" 3 "공동사용 입식" ///
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

save weps , replace
