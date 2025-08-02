cd ~/dropbox/data/yfc

use yfc if b1 , clear
    drop if dset == 0 & nx == 1 // 초기상담만 한 자료 삭제

gen agrp = 2025 - q1
    recode agrp (0/19=1) (20/24=2) (25/29=3) (30/34=4) (35/99=5) 
    label var agrp "연령집단"
    label define AGRP 1 "19세 이하" 2 "20~24세" 3 "25~30세" 4 "30~34세" 5 "35세 이상"
    label value agrp AGRP

forvalue i = 1/10 {
    gen mytu`i' = !missing(tu`i')
}
gr bar (sum) mytu* , over(agrp) stack percentages ytitle("") ///
    blabel(bar, format(%9.1fc) size(tiny) position(center)) graphregion(color(white)) ///
    legend( label(1 "TV") label(2 "PC/게임") label(3 "SNS/커뮤니티") label(4 "OTT") ///
    label(5 "일/구직") label(6 "운동 등 취미") label(7 "잠") label(8 "없음") ///
    label(9 "센터활동") label(10 "기타")  position(3) col(1)) saving(time.gph, replace)

preserve
    local mybaroption over(tag) blabel(bar , format(%9.2fc) size(tiny)) legend(label(1 "초기상담") label(2 "25년 4월") label(3 "25년 7월") row(1)) graphregion(color(white))

    collapse lsns? , by(dset) 
    xpose , clear varname
    drop if _v == "dset"
    gen fam = inrange(_n, 1, 3)
    gen fri = inrange(_n, 5, 7)
    gen spt = inlist(_n, 4, 8)
    gen tag = ""
        replace tag = "만남"     if  _v == "lsns1"
        replace tag = "일상대화" if  _v == "lsns2"
        replace tag = "도움"     if  _v == "lsns3"
        replace tag = "친인척" if  _v == "lsns4"
        replace tag = "만남"     if  _v == "lsns5"
        replace tag = "일상대화" if  _v == "lsns6"
        replace tag = "도움"     if  _v == "lsns7"
        replace tag = "친구" if  _v == "lsns8"

    gr bar v1 v2 v3  if fam , `mybaroption' saving(lsns_fam.gph, replace)
    gr bar v1 v2 v3  if fri , `mybaroption' saving(lsns_frd.gph, replace)
    gr bar v1 v2 v3  if spt , `mybaroption' saving(lsns_spt.gph, replace)

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
        replace tag = "의논대상"    if _v == "hq3"
        replace tag = "낮선 사람"   if _v == "hq4"
        replace tag = "방"          if _v == "hq5"
        replace tag = "귀찮음"      if _v == "hq6"
        replace tag = "이해자"      if _v == "hq7"
        replace tag = "불편함"      if _v == "hq8"
        replace tag = "혼자지냄"    if _v == "hq9"
        replace tag = "생각공유"    if _v == "hq10"
        replace tag = "보여짐"      if _v == "hq11"
        replace tag = "가족 외"     if _v == "hq12"
        replace tag = "집단"        if _v == "hq13"
        replace tag = "중요문제"    if _v == "hq14"
        replace tag = "사람과 교류" if _v == "hq15"
        replace tag = "사회규칙"    if _v == "hq16"
        replace tag = "소중한 사람" if _v == "hq17"
        replace tag = "타인과 대화" if _v == "hq18"
        replace tag = "연락"        if _v == "hq19"
        replace tag = "홀로있기"    if _v == "hq20"
        replace tag = "상담할 사람" if _v == "hq21"
        replace tag = "혼자보냄"    if _v == "hq22"
        replace tag = "사회적 교류" if _v == "hq23"
        replace tag = "타인과 교류" if _v == "hq24"
        replace tag = "타인과 함께" if _v == "hq25"


    gr bar v1 v2 v3  if sec , `mybaroption' saving(hq_sec.gph , replace)
    gr bar v1 v2 v3  if soc , `mybaroption' saving(hq_soc.gph , replace)
    gr bar v1 v2 v3  if iso , `mybaroption' saving(hq_iso.gph , replace)
    gr bar v1 v2 v3  if spt , `mybaroption' saving(hq_spt.gph , replace)
