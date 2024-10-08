local path ~/dropbox/data/dta/

use `path'akglist , clear
    duplicates drop address, force
    keep uniname-address
    export excel using "/Users/jay/GitHub/master/etc/akgaddresslist.xls"

import delimited "/Users/jay/GitHub/master/etc/akgeoinfo.csv", encoding(UTF-8)
    label var address "대학주소"
    label var latitude "대학의 위도"
    label var longitude "대학의 경도"
    label var distance "기준점과의 거리(남산타워, km)"
    save `path'akggeoinfo , replace
