lsd
use wepsh
lookfor 주거
lookfor 지역
lookfor 주소
tab h_reg7
cdata khp
use khp
de
lookfor 급여
tab1 b4*
de b4*
xount
count
tab b4_0 year
de
cd ..
cd koweps
use weps
de
count
tab year
use weps
sum tag
tab year
sum tms
use weps
tab year
tab year tag
egen tgt = sum(tag)
tab year tgt
drop tgt
lookfor id
isid h_id
isid h_id year
de
set more on
de
  isid h_id h_ind
  isid h_id h_ind year
  isid h_id h_sn year
  isid h_id h_new h_new1 year
sum h_*
   count
isid h_merkey year
isid h_merkey
bys h_merkey year : egen ctrt = sum(tag)
tab year ctrt
use weps
use weps , clear
tab year tag
his tms if tag , by(year)
hist tms if tag , by(year)
use weps
tab year tag
tab year if tms
de tms
gen tmp = tms/ 12
sum tmp tms
tab h01_1
de mrs
tab mrs
tab year mrs
use weps
use weps , clear
tab year ytrt
hist trs if ytrt , by(year)
 bys ytrt : sum trs
de trs
hist trs
hist trs if trs >= 50
 tab trs
    tab trs if !ytrt
   list h01_1 if trs == 1241
   list h01_1 ytrt if trs == 1241
   list h01_1 rgn yearytrt if trs == 1241
   list h01_1 rgn year ytrt if trs == 1241
tab rgn
tab rgn h_reg5
tab rgn h_reg7
tab h_reg7 rgn
tab h_reg7 h_reg5 , mis
use weps , clear
tab year ytrt
tab year rgn
sum mrs
sum trs
sum nrs
tab nrs
use weps
tab year ytrt
tab year if trs
bys h_merkey year : egen ctrt = sum(ytrt)
tab ctrt
tab year ctrt
drop ctrt
bys h_merkey year : egen ctrt = total(ytrt)
tab year ctrt
tab year yter
tab year ytrt 
isid h_merkey year
tab ctrt
drop ctrt
sum ctrt ytrt
bys h_merkey year : egen ctrt = total(ytrt)
sum ctrt ytrt
use weps
use weps , clear
tab year ytrt 
tab year ctrt 
tab year h01_1 if ctrt >= 2
bys year : sum trs if ctrt >= 2
bys year : sum mrs if ctrt >= 2
bys year : sum trs mrs if ctrt >= 2
bys year : sum trs mrs ytrt ctrt
bys year : sum trs mrs if ctrt >= 2 * !missing(mrs)
bys year : sum trs mrs if ctrt >= 2 & !missing(mrs)
bys year : sum ytrt ctrt  if ctrt >= 2 & !missing(mrs)
list h_merkey year trs mrs if ctrt >= 3
   sort h_merkey year
list h_merkey year trs mrs if ctrt >= 3
list h_merkey year trs mrs ytrt ctrt if ctrt >= 3
 use weps
use year ytrt 
tab year ytrt 
tab year ctrt 
tab year if mrs
 use weps
tab year ytrt 
tab year ctrt 
xtset h_merkey year
lookfor 건강
xtreg h02_2 ctrt
xtreg h02_2 ctrt , fe
xtreg h02_2 ctrt g_flag, fe
xtreg h02_2 ctrt h_flag, fe
lookfor 소득
xtreg h02_2 ctrt h_야ㅜ, fe
xtreg h02_2 ctrt h_din, fe
xtreg h02_2 ctrt h_din if mrs, fe
xtreg h02_2 ctrt h_din if h01_11aq9, fe
de h01_111
tab h01_111
tab h01_5aq1
xtreg h02_2 ctrt h_din if h01_11aq9 == 1, fe
xtreg h02_2 ctrt h_din if h01_11aq9 >= 1, fe
xtreg h02_2 ctrt h_din if h01_11aq10, fe
xtreg h02_2 ctrt h_din if h01_11aq10 >= 1, fe
tab year h01_11aq10
count
xtreg h02_2 ctrt h_din , fe
xtreg h02_2 ctrt h_din i.year , fe
xtreg f.h02_2 ctrt h_din i.year , fe
xtreg ff.h02_2 ctrt h_din i.year , fe
xtreg f.h02_2 ctrt h_din i.year , fe
xtreg f.h02_2 ctrt y_din i.year , fe
xtreg f.h02_2 ytrt h_din i.year , fe
xtreg f.h02_2 ytrt h_din i.year i.hreg_5 , fe
xtreg f.h02_2 ytrt h_din i.year i.h_reg5 , fe
xtreg f.h02_2 ytrt h_din i.year i.h_reg5 if h_hc == 2, fe
xtreg f.h02_2 ytrt h_din i.year i.h_reg5 if h_hc_n_all == 2, fe
xtreg f.h02_2 ytrt h_din H01_4 h01_5 i.year i.h_reg5 if h_hc_n_all == 2, fe
xtreg f.h02_2 ytrt h_din h01_4 h01_5 i.year i.h_reg5 if h_hc_n_all == 2, fe
xtreg f.h02_2 ytrt h_din h01_4 h01_5 I.h01_9 i.year i.h_reg5 if h_hc_n_all == 2, fe
xtreg f.h02_2 ytrt h_din h01_4 h01_5 i.h01_9 i.year i.h_reg5 if h_hc_n_all == 2, fe
xtreg f.h02_2 ytrt h_din h01_4 h01_5 i.h01_6 i.h01_9 i.year i.h_reg5 if h_hc_n_all == 2, fe
lookfor 건강
lookfor 건강상태
return list
egen health =  rowtotal(r(varlist))
lookfor 건강상태
local aaa r(varlist)
egen health =  rowtotal(`aaa')
di `aaa'
lookfor 건강상태
local aaa `r(varlist)'
di `aaa'
lookfor 건강상태
di r(varlist)
local aaa r(varlist)
di `aaa'
egen health =  rowtotal(`aaa')
egen health =  rowtotal("`aaa'")
di `aaa'
lookfor 건강상태
local aaa = r(varlist)
di `aaa'
use wep2 , clear
use weps , clear
xtreg f.health ytrt h_din h01_4 h01_5 i.h01_6 i.h01_9 i.year i.h_reg5 if h_hc_n_all == 2, fe
xtset h_merkey year
xtreg f.health ytrt h_din h01_4 h01_5 i.h01_6 i.h01_9 i.year i.h_reg5 if h_hc_n_all == 2, fe
de h01_?
xtreg f.health ytrt h_din h01_4 i.h01_6 i.h01_9 i.year i.h_reg5 if h_hc_n_all == 2, fe
xtreg f.health ytrt h_din h01_5 i.h01_6 i.h01_9 i.year i.h_reg5 if h_hc_n_all == 2, fe
xtreg f.health ytrt h_din i.year i.h_reg5 if h_hc_n_all == 2, fe
sum health
bys year :sum health
xtreg f.health ytrt h_din i.year i.h_reg5 , fe
sort h_merkey year
xtreg f.health ytrt h_din i.year i.h_reg5 , fe
xtreg f.health ytrt h_din i.year, fe
xtreg f.health ytrt h_din i.year i.h_reg5 , fe
tab rstype 
de rst
use weps , clear
sort h_merkey year
xtreg f.health ytrt h_din h01_4 h01_5 i.h01_6 i.h01_9 i.year i.h_reg5 if h_hc_n_all == 2, fe
xtreg f.health ytrt h_din h01_4 i.h01_6 i.h01_9 i.year i.h_reg5 if h_hc_n_all == 2, fe
xtreg f.health ytrt h_din h01_4 h01_5 i.h01_6 i.h01_9 i.year i.h_reg5 if h_hc_n_all == 2, fe
xtset h_merkey year
xtreg f.health ytrt h_din h01_4 h01_5 i.h01_6 i.h01_9 i.year i.h_reg5 if h_hc_n_all == 2, fe
xtreg f.health ytrt h_din i.year i.h_reg5 , fe
de rstype 
tab year rst
gen atrt = rstype == 3
bys h_merkey : egen btrt = sum(atrt)
xtreg f.h02_2 btrt h_din h01_4 h01_5 i.h01_6 i.h01_9 i.year i.h_reg5 if h_hc_n_all == 2, fe
tab year atrt btrt
tab year atrt
tab year btrt
de rstype 
xtreg f.health btrt h_din i.year i.h_reg5 , fe
xtreg f.health btrt h_din i.year , fe
xtreg health btrt h_din i.year , fe
xtreg health btrt h_din , fe
xtreg health btrt h_din ,
replace btrt = 1 if btrt
xtreg health btrt h_din ,
xtreg health btrt h_din , fe
xtreg health btrt h_din i.year , fe
xtreg health btrt h_din i.year 
xtreg health btrt h_din i.year i.h_reg5 
xtreg health btrt h_din i.year i.h_reg7
xtreg f,health btrt h_din i.year i.h_reg7
xtreg f.health btrt h_din i.year i.h_reg7
xtreg health l.btrt h_din i.year i.h_reg7
xtreg health l.atrt h_din i.year i.h_reg7
xtreg h02_2 l.atrt h_din i.year i.h_reg7
xtreg h02_2 l.atrt i.h01_4 h01_5 h_din i.year i.h_reg7
xtreg h02_2 i.rstype h_din i.year i.h_reg7 , fe
xtreg health  i.rstype h_din i.year i.h_reg7 , fe
xtreg health  il.rstype h_din i.year i.h_reg7 , fe
xtreg health il.rstype h_cin i.year i.h_reg7 , fe
xtreg health il.rstype h_din i.year i.h_reg7 , fe
xtreg health il.rstype h_din i.location i.year i.h_reg7 , fe
xtreg health il.rstype h_din i.location i.heat i.year i.h_reg7 , fe
lookfor 가구
lookfor 주거
xtreg health il.rstype h_din h16_35 i.location i.heat i.year i.h_reg7 , fe
tab h16_35
xtreg health il.rstype h_din i.location i.heat i.year i.rgn , fe
xtreg health b1il.rstype h_din i.location i.heat i.year i.rgn , fe
xtreg health b1il.rstype h_din i.year i.rgn , fe
xtreg health b1il.rstype#i.location h_din i.year i.rgn , fe
xtreg health b1il.rstype#i.location h_din i.year i.rgn , fe label
tab location
use weps
use weps , clear
xtreg health b1il.rstype#i.location h_din i.year i.rgn , fe label
xtreg health b1il.rstype#i.location h_din i.year i.rgn , fe
xtreg health b1il.rstype#b3i.location h_din i.year i.rgn , fe
xtreg health b0il.rstype#b3i.location h_din i.year i.rgn , fe
xtreg health b0i.rstype#b3i.location h_din i.year i.rgn , fe
tab h02_2
xtreg h02_2 b0i.rstype#b3i.location h_din i.year i.rgn , fe
xtreg h02_2 b0i.rstype b3i.location h_din i.year i.rgn , fe
xtreg h02_2 b0il.rstype b3i.location h_din i.year i.rgn , fe
xtreg h02_2 b0il.rstype b3i.location i.h01_8 h_din i.year i.rgn , fe
xtreg h02_2 b0il.rstype b3i.location h01_5 i.h01_8 h_din i.year i.rgn , fe
xtreg h02_2 b0il.rstype b3i.location h01_5 i.h01_9 h_din i.year i.rgn , fe
xtreg h02_2 b1il.rstype b3i.location h01_5 i.h01_9 h_din i.year i.rgn , fe
xtreg h02_2 b1il.rstype b3i.location h01_5 i.h01_9 h_din i.year i.rgn ,
xtreg h02_2 b1i.rstype b3i.location h01_5 i.h01_9 h_din i.year i.rgn ,
xtreg f.h02_2 b1i.rstype b3i.location h01_5 i.h01_9 h_din i.year i.rgn ,
xtreg ff.h02_2 b1i.rstype b3i.location h01_5 i.h01_9 h_din i.year i.rgn ,
xtreg fff.h02_2 b1i.rstype b3i.location h01_5 i.h01_9 h_din i.year i.rgn ,
xtreg health b1i.rstype b3i.location h01_5 i.h01_9 h_din i.year i.rgn ,
xtreg health b1i.rstype b3i.location h01_5 i.h01_9 h_din i.year i.rgn , fe
xtreg health b1i.rstype b3i.location i.h01_9 h_din i.year i.rgn , fe
tab year h01_9
lookfor 장애
xtreg health b1i.rstype b3i.location i.h01_9 ㅗ01_110 h_din i.year i.rgn , fe
xtreg health b1i.rstype b3i.location i.h01_9 i.h01_110 h_din i.year i.rgn , fe
h rowavg
h rowaverage
h egen
use weps , clear
xtreg health b1i.rstype b3i.location i.h01_9 i.h01_110 h_din i.year i.rgn , fe
xtreg health b1il.rstype b3i.location i.h01_9 i.h01_110 h_din i.year i.rgn , fe
xtreg health b1ill.rstype b3i.location i.h01_9 i.h01_110 h_din i.year i.rgn , fe
xtreg health b1i.rstype b3i.location i.h01_9 i.h01_110 h_din i.year i.rgn , fe
xtreg f.health b1i.rstype b3i.location i.h01_9 i.h01_110 h_din i.year i.rgn , fe
xtreg health b1il.rstype b3i.location i.h01_9 i.h01_110 h_din i.year i.rgn , fe
xtreg health b1i.rstype b3i.location i.h01_9 i.h01_110 h_din i.year i.rgn , fe
xtreg health b1i.rstype b3i.location i.h01_9 i.h01_110 i.hear h_din i.year i.rgn , fe
xtreg health b1i.rstype b3i.location i.h01_9 i.h01_110 i.heat h_din i.year i.rgn , fe
xtreg health b1i.rstype b3i.location i.h01_9 i.h01_110 i.heat i.bath h_din i.year i.rgn , fe
lookfor 주거
xtreg health b1i.rstype b3i.location i.h01_9 i.h01_110 size i.heat i.bath h_din i.year i.rgn , fe
lookfor 장애등급
lookfor 장애
lookfor 장애정도
sum health 
tab year health
   lookfor 건강
sum h02_2
sum h02_11
sum h02_17
sum h02_74
sum h02_11
lookfor 건강상태
sum r(varlist)
lookfor 건강상태
local `aaa' = r(varlist)
sum `aaa'
tab year h02_11
list if h02_11 == 9
   use weps
xtreg health b1i.rstype b3i.location i.h01_9 i.h01_110 size i.heat i.bath h_din i.year i.rgn , fe
set locale_ui ko
reg health b1i.rstype
xtreg health b1i.rstype b3i.location i.h01_9 i.h01_110 size i.heat i.bath h_din i.year i.rgn , fe
xtreg health b1i.rstype b3i.location i.h01_9 i.h01_110 size i.heat i.bath h_din i.year i.rgn ,
reg health b1i.rstype b3i.location i.h01_9 i.h01_110 size i.heat i.bath h_din i.year i.rgn
reg health b1i.rstype
reg health b1i.rstype b3i.location i.h01_9 i.h01_110 size i.heat i.bath h_din i.year i.rgn
scatter health retype
scatter health rstype
scatter health rstype , lfit
scatter health rstype , fit
h scatter
twoway (scatter health rstype ) (lfit health rstype )
reg health b1i.rstype b3i.location i.h01_9 i.h01_110 size i.heat i.bath h_din i.year i.rgn
twoway (scatter health rstype ) (qfit health rstype )
twoway (scatter health rstype ) (qfit health rstype )
twoway (scatter health rstype , by(year) ) (qfit health rstype , by(year) )
twoway (scatter health trs , by(year) ) (qfit health trs , by(year) )
twoway (scatter health trs , by(year) ) (lit health trs , by(year) )
twoway (scatter health trs , by(year) ) (lfit health trs , by(year) )
twoway (scatter health trs ,) (lfit health trs , )

* 집수리 경험 여부
gen ever_repair = (repair_year < .)

* 시점 변수 (처치 이후)
gen post = (year >= repair_year) if ever_repair==1

* DID 모형
xtset hhid year
xtreg y ever_repair##post i.year, fe cluster(hhid)

gen treat_amt = 0
replace treat_amt = repair_amt if year >= repair_year & repair_year < .
xtreg y treat_amt i.year, fe cluster(hhid)

gen lntreat_amt = ln(1 + treat_amt)
xtreg y lntreat_amt i.year, fe cluster(hhid)

* 상대연도 변수 생성
gen rel_year = year - repair_year if ever_repair==1

* 기준시점: 집수리 직전(rel_year = -1)
xtreg y i.rel_year##i.ever_repair, fe cluster(hhid)


ssc install eventstudyinteract
eventstudyinteract y, absorb(hhid year) cohort(repair_year) rel_year(-5/5) vce(cluster hhid)

ssc install csdid
csdid y, ivar(hhid) time(year) gvar(repair_year) method(dripw) vce(cluster hhid)
estat event
