cd ~/dropbox/data/YFC

use 청년미래센터047, clear
    rename _all , low

    ds , has(type string)
    local svset = r(varlist)
    foreach i of local svset { 
        replace `i' = subinstr(`i', " ", "", .)
    }
    
    replace d9c = subinstr(d9c,"-","",.)

    replace d9a = "" if d9a == "ㄱㄴ슧늑"
    replace d9a = "" if d9a == "ㅎㄱㄴ"
    replace d9a = "" if d9a == "밝히고싶지 않습니다."

    replace q1 = subinstr(q1,".","",.)
    replace q1 = subinstr(q1,"년생","",.)
    replace q1 = subinstr(q1,"q","1",.)
    gen q1l = strlen(q1)
    destring q1 , replace
    capture drop q1t
    gen q1t = .
        replace q1t = q1 if inrange(q1, 1945 , 2025)
        replace q1t = round((q1+20000000)/10000) if inrange(q1, 0, 449999) & q1l == 6
        replace q1t = round((q1+19000000)/10000) if inrange(q1, 450000, 999999)
        replace q1t = round((q1)/10000) if inrange(q1, 19450000, 99999999)
        list q1 q1t q1l if q1 !=q1t
        replace q1 = q1t
        drop q1t q1l

    capture drop sido
    gen center = .
        replace center = 1 if d9b=="인천청년미래센터"
        replace center = 2 if d9b=="울산청년미래센터"
        replace center = 3 if d9b=="충북청년미래센터"
        replace center = 4 if d9b=="전북청년미래센터"
        label var center "대상센터지역"
        label define CENTER 1 "인천 청년미래센터" 2 "울산 청년미래센터" 3 "충북 청년미래센터" 4 "전북 청년미래센터" 
        label value center CENTER

    capture drop id
    egen id = group(d9a q1 center)

    capture drop stmd stm std 
    gen double dt = clock(stdate, "YMDhms")
        format dt %tc
        label var dt "응답시작일시분초"
    gen dd = dofc(dt)
        format dd %td
        label var dd "응답시작일시"
    gen stm = month(dd)
        label var dd "응답시작월"
    gen std = day(dd)
        label var dd "응답시작일"
    gen stmd = stm*100 + std
        label var dd "응답시작월일"
        order stm std stmd, before(stdate)




    replace id = "김가영1991인천"  if id == "김가영1999920215인천"
    replace id = "김민정9999인천"  if id == "김민정.인천"
    replace id = "김우주2002울산"  if id == "김우주20030205울산"
    replace id = "김황희2006울산"  if id == "김황희20007울산"
    replace id = "남서연2003충북"  if id == "남서연2004.08.24충북"
    replace id = "류현지2007울산"  if id == "류현지20080412울산"
    replace id = "박주빈2000전북 " if id == "박주빈2000년생전북"
    replace id = "박지해1998울산"  if id == "박지해990308울산"
    replace id = "방성영1992인천"  if id == "방성영930827인천"
    replace id = "양시현2009전북"  if id == "양시현100920전북"
    replace id = "오용훈1999울산"  if id == "오용훈001018울산"
    replace id = "윤유진1996울산"  if id == "윤유진19970421울산"
    replace id = "윤정윤2011전북"  if id == "윤정윤2011.11.09전북"
    replace id = "정시우2011인천"  if id == "정시우121012인천"
    replace id = "현희원2002울산"  if id == "현희원020421울산"

    replace id = "김가영1991인천"  if id == "김가영19920215인천"
    replace id = "김민정9999인천"  if id == "김민정.인천"
    replace id = "김우주2002울산"  if id == "김우주20030205울산"
    replace id = "김황희2006울산"  if id == "김황희20007울산"
    replace id = "남서연2003충북"  if id == "남서연2004.08.24충북"
    replace id = "류현지2007울산"  if id == "류현지20080412울산"
    replace id = "박주빈2000전북 " if id == "박주빈2000년생전북"
    replace id = "박지해1998울산"  if id == "박지해990308울산"
    replace id = "방성영1992인천"  if id == "방성영930827인천"
    replace id = "양시현2009전북"  if id == "양시현100920전북"
    replace id = "오용훈1999울산"  if id == "오용훈001018울산"
    replace id = "윤유진1996울산"  if id == "윤유진19970421울산"
    replace id = "윤정윤2011전북"  if id == "윤정윤2011.11.09전북"
    replace id = "정시우2011인천"  if id == "정시우121012인천"
    replace id = "현희원2002울산"  if id == "현희원020421울산"
