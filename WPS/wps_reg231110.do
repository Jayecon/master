cd ~/dropbox/wps

use wps.dta if year >= 2015 , clear

keep id year ind9 ind reg w_age cpi c_wgt?? p2_wgt9 ///
  aq2003 aq3003 aq3004 aq3006 aq3008 ///
  epq1001 epq1002 epq1003 epq1011 epq1012 epq1013 ///
    epq3001 epq3002 epq3003 epq3004 epq3005 epq3006 epq3007 epq3008 ///
    epq4008 epq4018 epq4028 ///
    epq5008 ///
    epq6001 ///
    epq8005 epq8035 epq8045 epq8055 ///
    epq9008 epq9018 epq9028 epq9038 epq9048 ///
  fpq1011 fpq2001 fpq2015 fpq4004 fpq2003 fpq2019 ///
  mq1001 ///
  covid001-covid004


tempvar temp1
  egen `temp1' = rowlast(c_wgt??)
  bys id : egen wgtc = mean(`temp1')
  label var wgtc "회차별 횡단면 가중치 평균"
  drop c_wgt??
rename p2_wgt9 wgtp
gen covidyear = year == 2021
  label var covidyear "year==2021"
gen lnfpq4004 = ln(fpq4004)
gen lnfpq1011 = ln(fpq1011)
tempvar temp2 temp3 temp4
  egen `temp2' = rowmin(covid???)
  egen `temp3' = rowmean(covid???)
  gen covid000 = (`temp1' == 1) | (`temp2' <= 2.5)
  bys id : egen `temp4' = max(covid000)
  drop covid000
  rename `temp4' covid000
  label var covid000   "[코로나 바이러스 확산이 사업장에 미친 영향]"
gen fpq9999 = fpq2015/fpq2001
  label var fpq9999   "매출액대비 영업이익"

order covid000 , before(covid001)
order ind , after(ind9)
order wgt? , after(cpi)
drop __0*

save wpsreg.dta , replace
