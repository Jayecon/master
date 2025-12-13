cd ~/GitHub/master/YFCenter

use yfc , clear
    drop if dset == 0 & mx == 1 // 초기상담만 한 자료 삭제
/*time graph{{{*/
    gen agrp = 2025 - q1
        recode agrp (0/19=1) (20/24=2) (25/29=3) (30/34=4) (35/99=5) 
        label var agrp "연령집단"
        label define AGRP 1 "19세 이하" 2 "20~24세" 3 "25~30세" 4 "30~34세" 5 "35세 이상"
        label value agrp AGRP
    gen dur = dm2
        recode dur (0/3=1) (4/6=2) (7/9=3) (10/99=4)
        label var dur "사업참여기간"
        label define DUR 1 "3개월이하" 2 "4-6개월" 3 "7-9개월" 4 "10-14개월"
        label value dur DUR
    forvalue i = 1/10 {
        gen mytu`i' = !missing(tu`i')
    }
    gr bar (sum) mytu* , over(agrp) stack percentages ytitle("") ///
        blabel(bar, format(%9.1fc) size(tiny) position(center)) graphregion(color(white)) ///
        legend( label(1 "TV") label(2 "PC/게임") label(3 "SNS/커뮤니티") label(4 "OTT") ///
        label(5 "일/구직") label(6 "운동 등 취미") label(7 "잠") label(8 "없음") ///
        label(9 "센터활동") label(10 "기타")  position(3) col(1)) saving(time_agrp.gph, replace)
    gr export time_agrp.png , replace
    gr bar (sum) mytu* if dm2 > 0, over(dur) stack percentages ytitle("") ///
        blabel(bar, format(%9.1fc) size(tiny) position(center)) graphregion(color(white)) ///
        legend( label(1 "TV") label(2 "PC/게임") label(3 "SNS/커뮤니티") label(4 "OTT") ///
        label(5 "일/구직") label(6 "운동 등 취미") label(7 "잠") label(8 "없음") ///
        label(9 "센터활동") label(10 "기타")  position(3) col(1)) saving(time_dur.gph, replace)
    gr export time_dur.png , replace
/*}}}*/
    local mybaroptdset blabel(bar , format(%9.2fc) size()) legend(label(1 "초기상담") label(2 "25년 4월") label(3 "25년 7월") label(4 "25년 10월") pos(6) row(1)) graphregion(color(white))
    local mybaroptdur blabel(bar , format(%9.2fc) size()) legend(label(1 "3개월이하") label(2 "4-6개월") label(3 "7-9개월") label(4 "10-14개월") pos(6) row(1)) graphregion(color(white))
/*lsns{{{*/
preserve
    collapse lsns? , by(dset) 
    xpose , clear varname
    drop if _v == "dset"
    gen fam = inrange(_n, 1, 3)
    gen fri = inrange(_n, 5, 7)
    gen spt = inlist(_n, 4, 8)
    gen tag = ""
        replace tag = "만남"   if _v == "lsns1"
        replace tag = "대화"   if _v == "lsns2"
        replace tag = "도움"   if _v == "lsns3"
        replace tag = "친인척" if _v == "lsns4"
        replace tag = "만남"   if _v == "lsns5"
        replace tag = "대화"   if _v == "lsns6"
        replace tag = "도움"   if _v == "lsns7"
        replace tag = "친구"   if _v == "lsns8"
    gr bar v1 v2 v3 v4 if fam , over(tag) `mybaroptdset' saving(lsns_fam_dset.gph, replace)
    gr export lsns_fam_dset.png , replace
    gr bar v1 v2 v3 v4 if fri , over(tag) `mybaroptdset' saving(lsns_frd_dset.gph, replace)
    gr export lsns_frd_dset.png , replace
    gr bar v1 v2 v3 v4 if spt , over(tag) `mybaroptdset' saving(lsns_spt_dset.gph, replace)
    gr export lsns_spt_dset.png , replace
restore , preserve
    collapse lsns? if dm2 > 0, by(dur) 
    xpose , clear varname
    drop if _v == "dur"
    gen fam = inrange(_n, 1, 3)
    gen fri = inrange(_n, 5, 7)
    gen spt = inlist(_n, 4, 8)
    gen tag = ""
        replace tag = "만남"   if _v == "lsns1"
        replace tag = "대화"   if _v == "lsns2"
        replace tag = "도움"   if _v == "lsns3"
        replace tag = "친인척" if _v == "lsns4"
        replace tag = "만남"   if _v == "lsns5"
        replace tag = "대화"   if _v == "lsns6"
        replace tag = "도움"   if _v == "lsns7"
        replace tag = "친구"   if _v == "lsns8"
    gr bar v1 v2 v3 v4 if fam , over(tag) `mybaroptdur' saving(lsns_fam_dur.gph, replace)
    gr export lsns_fam_dur.png, replace
    gr bar v1 v2 v3 v4 if fri , over(tag) `mybaroptdur' saving(lsns_frd_dur.gph, replace)
    gr export lsns_frd_dur.png, replace
    gr bar v1 v2 v3 v4 if spt , over(tag) `mybaroptdur' saving(lsns_spt_dur.gph, replace)
    gr export lsns_spt_dur.png, replace
/*}}}*/
/*hq{{{*/
restore , preserve
    replace hq4 = 4 - hq4
    replace hq8 = 4 - hq8
    replace hq10 = 4 - hq10
    replace hq15 = 4 - hq15
    replace hq21 = 4 - hq21
    replace hq22 = 4 - hq22
    replace hq25 = 4 - hq25
    collapse hq* , by(dset) 
    xpose , clear varname
    drop if _v == "dset"
    gen sec = inlist(_n, 2, 5)
    gen soc = inlist(_n, 1, 4, 6, 8, 11, 15, 18, 20, 23, 25)
    gen iso = inlist(_n, 9, 12, 13, 16, 19, 22, 24)
    gen spt = inlist(_n, 3, 7, 10, 14, 17, 21)
    gen tag = ""
        replace tag = "거리두기"    if _v == "hq1"
        replace tag = "집"          if _v == "hq2"
        replace tag = "의논상대"    if _v == "hq3"
        replace tag = "낮선사람"    if _v == "hq4"
        replace tag = "방"          if _v == "hq5"
        replace tag = "귀찮음"      if _v == "hq6"
        replace tag = "이해자"      if _v == "hq7"
        replace tag = "불편함"      if _v == "hq8"
        replace tag = "혼자지냄"    if _v == "hq9"
        replace tag = "생각공유"    if _v == "hq10"
        replace tag = "보여짐"      if _v == "hq11"
        replace tag = "가족외"      if _v == "hq12"
        replace tag = "집단소속"    if _v == "hq13"
        replace tag = "문제의논"    if _v == "hq14"
        replace tag = "대인교류"    if _v == "hq15"
        replace tag = "사회규칙"    if _v == "hq16"
        replace tag = "소중한 사람" if _v == "hq17"
        replace tag = "타인과 대화" if _v == "hq18"
        replace tag = "연락"        if _v == "hq19"
        replace tag = "혼자있기"    if _v == "hq20"
        replace tag = "상담할 사람" if _v == "hq21"
        replace tag = "혼자못지냄"    if _v == "hq22"
        replace tag = "사회적 교류" if _v == "hq23"
        replace tag = "타인과 교류" if _v == "hq24"
        replace tag = "함께지냄"    if _v == "hq25"
    gr bar v1 v2 v3 v4 if sec , over(tag) `mybaroptdset' saving(hq_sec_dset.gph , replace)
    gr export hq_sec_dset.png , replace
    gr bar v1 v2 v3 v4 if soc , over(tag, label(angle(45))) `mybaroptdset' saving(hq_soc_dset.gph , replace)
    gr export hq_soc_dset.png , replace
    gr bar v1 v2 v3 v4 if iso , over(tag) `mybaroptdset' saving(hq_iso_dset.gph , replace)
    gr export hq_iso_dset.png , replace
    gr bar v1 v2 v3 v4 if spt , over(tag) `mybaroptdset' saving(hq_spt_dset.gph , replace)
    gr export hq_spt_dset.png , replace
restore , preserve
    replace hq4 = 4 - hq4
    replace hq8 = 4 - hq8
    replace hq10 = 4 - hq10
    replace hq15 = 4 - hq15
    replace hq21 = 4 - hq21
    replace hq22 = 4 - hq22
    replace hq25 = 4 - hq25
    collapse hq* if dm2 > 0, by(dur) 
    xpose , clear varname
    drop if _v == "dur"
    gen sec = inlist(_n, 2, 5)
    gen soc = inlist(_n, 1, 4, 6, 8, 11, 15, 18, 20, 23, 25)
    gen iso = inlist(_n, 9, 12, 13, 16, 19, 22, 24)
    gen spt = inlist(_n, 3, 7, 10, 14, 17, 21)
    gen tag = ""
        replace tag = "거리두기"    if _v == "hq1"
        replace tag = "집"          if _v == "hq2"
        replace tag = "의논상대"    if _v == "hq3"
        replace tag = "낮선사람"    if _v == "hq4"
        replace tag = "방"          if _v == "hq5"
        replace tag = "귀찮음"      if _v == "hq6"
        replace tag = "이해자"      if _v == "hq7"
        replace tag = "불편함"      if _v == "hq8"
        replace tag = "혼자지냄"    if _v == "hq9"
        replace tag = "생각공유"    if _v == "hq10"
        replace tag = "보여짐"      if _v == "hq11"
        replace tag = "가족외"      if _v == "hq12"
        replace tag = "집단소속"    if _v == "hq13"
        replace tag = "문제의논"    if _v == "hq14"
        replace tag = "대인교류"    if _v == "hq15"
        replace tag = "사회규칙"    if _v == "hq16"
        replace tag = "소중한 사람" if _v == "hq17"
        replace tag = "타인과 대화" if _v == "hq18"
        replace tag = "연락"        if _v == "hq19"
        replace tag = "혼자있기"    if _v == "hq20"
        replace tag = "상담할 사람" if _v == "hq21"
        replace tag = "혼자못지냄"  if _v == "hq22"
        replace tag = "사회적 교류" if _v == "hq23"
        replace tag = "타인과 교류" if _v == "hq24"
        replace tag = "함께지냄"    if _v == "hq25"
    gr bar v1 v2 v3 v4 if sec , over(tag) `mybaroptdur' saving(hq_sec_dur.gph , replace)
    gr export hq_sec_dur.png , replace
    gr bar v1 v2 v3 v4 if soc , over(tag, label(angle(45))) `mybaroptdur' saving(hq_soc_dur.gph , replace)
    gr export hq_soc_dur.png , replace
    gr bar v1 v2 v3 v4 if iso , over(tag) `mybaroptdur' saving(hq_iso_dur.gph , replace)
    gr export hq_iso_dur.png , replace
    gr bar v1 v2 v3 v4 if spt , over(tag) `mybaroptdur' saving(hq_spt_dur.gph , replace)
    gr export hq_spt_dur.png , replace
/*}}}*/
/*thq{{{*/
restore, preserve
    collapse thq??? , by(dset) 
    xpose , clear varname
    drop if _v == "dset"
    gen sec = strpos(_v, "sec" )
    gen soc = strpos(_v, "soc" )
    gen iso = strpos(_v, "iso" )
    gen spt = strpos(_v, "spt" )
    gen tag = ""
        replace tag = "물리적은둔" if  strpos(_v, "sec" )
        replace tag = "사회화"     if  strpos(_v, "soc" )
        replace tag = "고립"       if  strpos(_v, "iso" )
        replace tag = "정서적지지" if  strpos(_v, "spt" )
    gr bar v1 v2 v3 v4 , over(tag) `mybaroptdset' saving(thq_dset.gph, replace)
    gr export thq_dset.png , replace
restore, preserve
    collapse thq??? if dm2 > 0, by(dur) 
    xpose , clear varname
    drop if _v == "dur"
    gen sec = strpos(_v, "sec" )
    gen soc = strpos(_v, "soc" )
    gen iso = strpos(_v, "iso" )
    gen spt = strpos(_v, "spt" )
    gen tag = ""
        replace tag = "물리적은둔" if  strpos(_v, "sec" )
        replace tag = "사회화"     if  strpos(_v, "soc" )
        replace tag = "고립"       if  strpos(_v, "iso" )
        replace tag = "정서적지지" if  strpos(_v, "spt" )
    gr bar v1 v2 v3 v4 , over(tag) `mybaroptdur' saving(thq_dur.gph, replace)
    gr export thq_dur.png , replace
/*}}}*/
/*c1{{{*/
restore, preserve
    collapse c1 , by(dset) 
    xpose , clear varname
    drop if _v == "dset"
    gen tag = _v
    gr bar v1 v2 v3 v4 , `mybaroptdset' saving(c1_dset.gph, replace)
    gr export c1_dset.png , replace
restore, preserve
    collapse c1 if dm2 > 0, by(dur) 
    xpose , clear varname
    drop if _v == "dur"
    gen tag = _v
    gr bar v1 v2 v3 v4 , `mybaroptdur' saving(c1_dur.gph, replace)
    gr export c1_dur.png , replace
/*}}}*/
/*c2{{{*/
restore, preserve
    collapse c2??? , by(dset) 
    xpose , clear varname
    drop if _v == "dset"
    gen tag = ""
        replace tag = "긍정적" if  strpos(_v, "pos" )
        replace tag = "부정적" if  strpos(_v, "neg" )
    gr bar v1 v2 v3 v4 , over(tag) `mybaroptdset' saving(c2_dset.gph, replace)
    gr export c2_dset.png , replace
restore, preserve
    collapse c2??? if dm2 > 0, by(dur) 
    xpose , clear varname
    drop if _v == "dur"
    gen tag = ""
        replace tag = "긍정적" if  strpos(_v, "pos" )
        replace tag = "부정적" if  strpos(_v, "neg" )
    gr bar v1 v2 v3 v4 , over(tag) `mybaroptdur' saving(c2_dur.gph, replace)
    gr export c2_dur.png , replace
/*}}}*/
/*c3{{{*/
restore, preserve
    collapse c3? , by(dset) 
    xpose , clear varname
    drop if _v == "dset"
    gen life = inrange(_n, 1, 3)
    gen stat = inrange(_n, 4, 6)
    gen valu = inrange(_n, 7, 9)
    gen order = .
        replace order = 1 if _v == "c3a"
        replace order = 2 if _v == "c3b"
        replace order = 3 if _v == "c3c"
        replace order = 4 if _v == "c3d"
        replace order = 5 if _v == "c3e"
        replace order = 6 if _v == "c3f"
        replace order = 7 if _v == "c3g"
        replace order = 8 if _v == "c3h"
        replace order = 9 if _v == "c3i"
    label define orderlbl ///
        1 "연애" ///
        2 "결혼" ///
        3 "출산·양육" ///
        4 "고학력" ///
        5 "일자리" ///
        6 "소득·자산" ///
        7 "대인관계" ///
        8 "사회적 기여" ///
        9 "명예와 권력"
    label values order orderlbl
    gr bar v4, over(order, label(angle(45))) `mybaroptdset' ytitle("") saving(c3_dset.gph, replace)
    gr export c3_dset.png , replace
restore, preserve
    collapse c3? if dm2 > 0, by(dur) 
    xpose , clear varname
    drop if _v == "dur"
    gen life = inrange(_n, 1, 3)
    gen stat = inrange(_n, 4, 6)
    gen valu = inrange(_n, 7, 9)
    gen order = .
        replace order = 1 if _v == "c3a"
        replace order = 2 if _v == "c3b"
        replace order = 3 if _v == "c3c"
        replace order = 4 if _v == "c3d"
        replace order = 5 if _v == "c3e"
        replace order = 6 if _v == "c3f"
        replace order = 7 if _v == "c3g"
        replace order = 8 if _v == "c3h"
        replace order = 9 if _v == "c3i"
    label define orderlbl ///
        1 "연애" ///
        2 "결혼" ///
        3 "출산·양육" ///
        4 "고학력" ///
        5 "일자리" ///
        6 "소득·자산" ///
        7 "대인관계" ///
        8 "사회적 기여" ///
        9 "명예와 권력"
    label values order orderlbl
    gr bar v4, over(order, label(angle(45))) `mybaroptdset' ytitle("") saving(c3_dur.gph, replace)
    gr export c3_dur.png , replace
restore, preserve
    collapse c4 if dm2 > 0, by(dur) 
    xpose , clear varname
    drop if _v == "dur"
    gr bar v1 v2 v3 v4 ,  `mybaroptdur' ytitle("") saving(c4.gph, replace)
    gr export c4.png , replace
/*}}}*/
