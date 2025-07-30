cd ~/dropbox/data/YFC

use 청년미래센터047, clear

    ds , has(type string)
    local svset = r(varlist)
    foreach i of local svset { 
        replace `i' = subinstr(`i', " ", "", .)
    }
    
    replace d9c = subinstr(d9c,"-","",.)

    replace id = "김가영1991인천"  if id == "김가영19920215인천"
    replace id = "김민정9999인천"  if id == "김민정.인천"
    replace id = "김우주2002울산"  if id == "김우주20030205울산"
    replace id = "김황희2006울산"  if id == "김황희20007울산"
    replace id = "남서연2003충북"  if id == "남서연2004.08.24충북"
    replace id = "류현지2007울산"  if id == "류현지20080412울산"
    replace id = "박주빈1999전북 " if id == "박주빈2000년생전북 "
    replace id = "박지해1998울산"  if id == "박지해990308울산"
    replace id = "방성영1992인천"  if id == "방성영930827인천"
    replace id = "양시현2009전북"  if id == "양시현100920전북"
    replace id = "오용훈1999울산"  if id == "오용훈001018울산"
    replace id = "윤유진1996울산"  if id == "윤유진19970421울산"
    replace id = "윤정윤2010전북"  if id == "윤정윤2011.11.09전북"
    replace id = "정시우2011인천"  if id == "정시우121012인천"
    replace id = "현희원2001울산"  if id == "현희원020421울산"
