set more off

cd ~/dropbox/data/klips /*원자료는 pwd의 하위폴더 rawdata에 있다고 가정함.*/
use klips_master.dta , clear
xtset pid wave
sort pid wave

local fwave  1	/*조사시작회차 입력*/
local lwave  23 /*조사최신회차 입력*/

  /* Generate the GDP Deflator Variable {{{*/
    /*97년지수부터 시작 (2015 = 100) */
    local price1 = 60.063/100
    local price2 = 64.576/100
    local price3 = 65.101/100
    local price4 = 66.572/100
    local price5 = 69.279/100
    local price6 = 71.193/100
    local price7 = 73.695/100
    local price8 = 76.341/100
    local price9 = 78.444/100
    local price10 = 80.202/100
    local price11 = 82.235/100
    local price12 = 86.079/100
    local price13 = 88.452/100
    local price14 = 91.051/100
    local price15 = 94.717/100
    local price16 = 96.789/100
    local price17 = 98.048/100
    local price18 = 99.298/100
    local price19 = 100.000/100   /*2015년*/
    local price20 = 100.970/100
    local price21 = 102.930/100
    local price22 = 104.450/100
    local price23 = 104.850/100
    gen gdpdef = .
    label var gdpdef "디플레이터 (2015 = 100)"
    forvalues i = `fwave'/`lwave' {
      replace gdpdef = `price`i'' if wave == `i'
    }
    /*}}}*/
  /* Generate Weight {{{*/
    tempvar wgtl swh nwh
    egen wgt = rowtotal(w??h)
    egen `swh' = rowtotal(sw??h)
    egen `nwh' = rowtotal(nw??h)
      replace wgt = `swh' if inrange(wave , 12 , 20)
      replace wgt = `nwh' if wave >= 21
      label variable wgt "통합표본 가중치"
      gen wgtp = wgt*h0150
      label variable wgtp "가중치(단년도, 가구원곱)"
    by pid : gen `wgtl' = wgt[_n+1]
      egen wgt2 = rowmean(wgt `wgtl')
      label variable wgt2 "가중치(2개년평균)"
      gen wgt2p = wgt2*h0150
      label variable wgt2p "가중치(2개년, 가구원곱)"
    /*}}}*/
  /* Generate Dummy Variables {{{*/
    gen head = (p0102 == 10)
      label variable head "1 = 가구주"
    gen age3050 = inrange(p0107 , 30 , 50)
      label variable age3050 "1 = 30-50세"
    gen h3050 = head*age3050
      label var h3050 "1 = 30-50세 & 가구주"
    recode h1109 1 = 1 2 = 0
    recode h1209 1 = 1 2 = 0
    gen support = inlist(h1109 + h1209 , 1 , 2) 
      label var support "1 = 부모의 경제적 도움(가구주 또는 배우자)"
    /*}}}*/
    /* Generate Equivalence Income {{{*/
    gen incs = (inch/sqrt(h0150))*(1/gdpdef) /*p??0150 : 가구구성원수*/
      label var incs "가계총소득(균등화)"
    gen incn = .
    forvalues i = `fwave'/`lwave' {
      local yr : disp %02.0f  = `i'
      sum incs if wave == `i' & head [aw = wgtp], meanonly
      replace incn = incs/r(mean) if wave == `i'
    }
    label var incn "가계총소득(균등평준화)"
    /*}}}*/
  /* Generate the edugrp {{{*/
    bys pid : egen edupap = max(p9051)
    label var edupap "부친 교육수준"
    recode edupap -1=. 1/2=1 3/4=2 5/7=3 8=., gen(edugrp)
    capture label define EDUGRP -1 "전체" 1 "저교육" 2 "중교육" 3 "고교육"
    capture label values edugrp EDUGRP
    capture label variable edugrp "학력환경(가구주부친)"
    /*}}}*/
  /* Generate the jobgrp {{{*/
    destring p9064, replace
    bys pid : egen jobpap = max(p9064)
    label var jobpap "부친 직업"
    recode jobpap -1=. 0/299=3 300/599=2 600/699=1 700/899=2 900/max=1, gen(jobgrp)
    capture label define JOBGRP -1 "전체"  1 "저숙련" 2 "중숙련" 3 "고숙련"
    capture label values jobgrp JOBGRP
    capture label variable jobgrp "직업환경(가구주부친)"
    /*}}}*/
  /* Generate the bplace {{{*/
    bys pid : egen bplace = max(p9001)
    label var jobpap "부친 직업"
    recode bplace -1=. 1=3 2/7=2 8/18 = 1
    capture label define BPLACE -1 "전체"  3 "특별시" 2 "광역시" 1 "도" 
    capture label values bplace BPLACE
    capture label variable bplace "출생지(특별시/광역시/도)"
    /*}}}*/
  /*Generate pcagrp {{{*/
    pca edupap jobpap 
      predict pcascore if e(sample)
      xtile pcagrp = pcascore , nq(3)
      label var pcascore "주성분분석점수"
      label var pcagrp "주성분분석환경"
      label define PCAGRP 1 "저환경" 2 "중환경" 3 "고환경"
      label value pcagrp PCAGRP
    pca edupap jobgrp 
      predict pcascore2 if e(sample)
      xtile pcagrp2 = pcascore2 , nq(3)
      label var pcascore2 "주성분분석점수(직업가공)"
      label var pcagrp2 "주성분분석환경(직업가공)"
      label value pcagrp2 PCAGRP
    pca edupap jobpap if h3050
      predict pcascore3050 if e(sample)
      xtile pcagrp3050 = pcascore3050 , nq(3)
      label var pcascore3050 "주성분분석점수3050"
      label var pcagrp3050 "주성분분석환경3050"
      label value pcagrp3050 PCAGRP
    pca edupap jobgrp if h3050
      predict pcascore23050 if e(sample)
      xtile pcagrp23050 = pcascore23050 , nq(3)
      label var pcascore23050 "주성분분석점수(직업가공)3050"
      label var pcagrp23050 "주성분분석환경(직업가공)3050"
      label value pcagrp23050 PCAGRP
    /*}}}*/
  /* Generate Income Variables {{{*/
    gen incs1 = incs
      replace incs1 = . if incs == 0
      label var incs1 "가계총소득(가구원,물가,무응답대체)"
    gen incs2 = incs
      replace incs2 = 0 if missing(incs)
      label var incs2 "가계총소득(가구원,물가,0소득대체)"
    gen incn1 = incn
      replace incn1 = . if incn == 0
      label var incn1 "가계총소득(가구원,물가,평준화,무응답대체)"
    gen incn2 = incn
      replace incn2 = 0 if missing(incn)
      label var incn2 "가계총소득(가구원,물가,평준화,0소득대체)"
    tempvar incs1f incn1f incs2f incn2f
    forvalues i = 1/2 {
      foreach j in s n {
        gen `inc`j'`i'f' = f.inc`j'`i'
        egen inc`j'`i'm = rowmean(inc`j'`i' `inc`j'`i'f')
          label variable inc`j'`i'm "가계총소득(2개년평균;from inc`j'`i' using rowmean)"
        egen inc`j'`i't = rowtotal(inc`j'`i' `inc`j'`i'f') , missing
          replace inc`j'`i't = (1/2)*inc`j'`i't
          label variable inc`j'`i't "가계총소득(2개년평균;from inc`j'`i' using rowtotal)"
        }
      }
    /*}}}*/
  /* reshape hhid hmem hwave to long {{{*/
    local widevar hhid hmem hwave
    foreach j of local widevar {
      gen `j' = .
    }
    forvalues i = `fwave'/`lwave' { 
      local yr : disp %02.0f  = `i'
      foreach j of local widevar {
        replace `j' = `j'`yr' if wave == `i'
      }
    }
    foreach j of local widevar {
      drop `j'??
    }
    label var hhid "가구번호(해당회차)"
    label var hmem "개인번호(해당회차)"
    label var hwave "응답여부(해당회차)"
    /*}}}*/

compress
order _all , alpha
order pid wave hhid edugrp jobgrp head , first
order inch , before(ince)
sort pid wave
drop if missing(pid)
capture drop _*
save klips , replace

exit

/**************** Outdated ****************************{{{*/
		/**************** GENERATE FATHER'S EDUCATION YEAR STATUS ***********************//*{{{*/
		/*tempvar edut1 edut2 edut3 edut4 edut5*/
		/*egen `edut1' = rowmax(eduy01-eduy21) */
		/*egen `edut2' = rowmin(edug01-edug21) */
		/*recode `edut1' 1/2=0 3=6 4=9 5=12 6=14 7=16 8=18 9=22, gen(`edut3')*/
		/*recode `edut1' 1/2=0 4=6 5=9 6=12 7=14 8=16 9=18 , gen(`edut4')*/
		/*recode `edut2' 1=1 2=0.7 3/5=0.5 , gen(`edut5')*/
		/*gen edufyr = `edut4' + `edut5'*(`edut3' - `edut4'); */
		/*capture label variable edupyr "Father's Education Years"; */
		/*}}}*/
	/**************** GENERATE FAMILY SIZE VARIABLES *******************{{{*/
	/*forvalues x = 1/21 { */
		/*local yr : disp %02.0f  = `x'*/
		/*if `x' > 1 {*/
			/*forvalue i=1/15 {*/
				/*local a=`i'+60; local b=`i'+20*/
				/*gen ppp`yr'`i'=(h`yr'03`a'<18 & inlist(h`yr'04`b' ,1 ,2 ))*/
				/*gen qqq`yr'`i'=(h`yr'03`a'>=18 & inlist(h`yr'04`b' ,1 ,2 ))*/
			/*}*/
		/*};	*/
		/*else if `x' == 1 {*/
			/*forvalue i=1/15 {*/
				/*local a=`i'+60; */
				/*gen ppp`yr'`i'= (h`yr'03`a'<18)*/
				/*gen qqq`yr'`i'= (h`yr'03`a'>=18 & h`yr'03`a' < 999) */
			/*}*/
		/*}*/
		/*egen lonum`yr'=rowtotal(ppp`yr'*); egen hinum`yr'=rowtotal(qqq`yr'*)*/
		/*recode hinum`yr' (0=.)*/
		/*gen heql`yr' = 1 + (hinum`yr' -1)*(0.7) + (lonum`yr')*(0.5)*/
		
		/*if `x' < 12{*/
			/*local wlist_h "w`yr'h"*/
			/*local rwlist_h "wgt`yr'_h"; }*/
		/*else {*/
			/*local wlist_h "sw`yr'h"*/
			/*local rwlist_h "wgt`yr'_h"; }*/
		/*rename (`wlist_h') (`rwlist_h')*/
		
		/**keep  hhid`yr' heql`yr' inch`yr' wgt`yr'_h */
		/*keep  hhid`yr' heql`yr' inch`yr' wgt`yr'_h inch`yr'_ne inc`yr'_e*/
		/*save "klips`yr'h.dta", replace*/
	/*}}}*/
	/**************** GENERATE SIBGRP VARIABLES ************************{{{*/
		/*order _all, alphabetic*/
		/*egen bro = rowlast(brop06-brop20) */
		/*egen sis = rowlast(sisp06-sisp20) */
		/*gen sibnum = bro + sis*/
		/*recode sib min/3=1 4/max=2 , gen(sibgrp)*/
		/*capture label define sib_typ 1 "Low" 2 "High"*/
		/*capture label values sibgrp sib_typ*/
		/*capture label variable sibgrp "Sib. Env. Group"; */
	/*}}}*/
	/**************** GENERATE OWN EDUCATION STATUS ************************//*{{{*/
		/*tempvar edupt1 edupt2 edupt3 edupt4 edupt5*/
		/*egen `edupt1' = rowmax(edpy01-edpy20) */
		/*egen `edupt2' = rowmin(edpg01-edpg20) */
		/*recode `edupt1' 1/2=0 3=6 4=9 5=12 6=14 7=16 8=18 9=22, gen(`edupt3')*/
		/*recode `edupt1' 1/2=0 4=6 5=9 6=12 7=14 8=16 9=18 , gen(`edupt4')*/
		/*recode `edupt2' 1=1 2=0.7 3/5=0.5 , gen(`edupt5')*/
		/*gen edupyr = `edupt4' + `edupt5'*(`edupt3' - `edupt4'); */
		/*capture label variable edupyr "Own Education Years"; */
		
		/*forvalues x = 1/20 { */
			/*local wave : disp %02.0f = `x' */
			
			/*recode edpg`yr' (1/2=1) (3/5=2)	;		// 졸업, 수료 -> 1 (최고학력), 중퇴, 재학, 휴학 -> 2 (학년입력)*/
			
			/*replace edps`yr' = 6 if edpy`yr' == 3 & edps`yr' > 6 	;		// 초등학생인데 6학년 이상으로 보고된 경우 6학년으로.*/
			/*replace edps`yr' = 3 if edpy`yr' == 4 & edps`yr' > 3 */
			/*replace edps`yr' = 3 if edpy`yr' == 5 & edps`yr' > 3 */
			/*replace edps`yr' = 2 if edpy`yr' == 6 & edps`yr' > 2 */
			/*replace edps`yr' = 4 if edpy`yr' == 7 & edps`yr' > 4 */
			/*replace edps`yr' = 2 if edpy`yr' == 8 & edps`yr' > 2 */
			/*replace edps`yr' = 3 if edpy`yr' == 9 & edps`yr' > 3 */
			
			/*gen edup`yr' = . */
			/*replace edup`yr' = 0 if inlist(edpy`yr',1,2) ;	// 학교자체를 X -> 교육연수 0.*/
			/*replace edup`yr' = 6 if edpy`yr' == 3 & edpg`yr' == 1 ;		// 초등학생이고 졸업했으면 6.*/
			/*replace edup`yr' = edps`yr' if edpy`yr' == 3 & edpg`yr' == 2 ;	 	// 초등학생이고 졸업 안했으면 학년입력.*/
			/*replace edup`yr' = 9 if edpy`yr' == 4 & edpg`yr' == 1 ;		// 중학생이고 졸업했으면 9.*/
			/*replace edup`yr' = edps`yr' + 6 if edpy`yr' == 4 & edpg`yr' == 2 ;	// 중학생이고 졸업 안했으면 학년입력.*/
			/*replace edup`yr' = 12 if edpy`yr' == 5 & edpg`yr' == 1 ;		// 고등학생이고 졸업했으면 12.*/
			/*replace edup`yr' = edps`yr' + 9 if edpy`yr' == 5 & edpg`yr' == 2 ;	// 고등학생이고 졸업 안했으면 학년입력.*/
			/*replace edup`yr' = 14 if edpy`yr' == 6 & edpg`yr' == 1 ;		// 전문대생이고 졸업했으면 14.*/
			/*replace edup`yr' = edps`yr' + 12 if edpy`yr' == 6 & edpg`yr' == 2 ;	// 전문대생이고 졸업 안했으면 학년입력.*/
			/*replace edup`yr' = 16 if edpy`yr' == 7 & edpg`yr' == 1 ;		// 대학생이고 졸업했으면 16.*/
			/*replace edup`yr' = edps`yr' + 12 if edpy`yr' == 7 & edpg`yr' == 2 ;	// 대학생이고 졸업 안했으면 학년입력.*/
			/*replace edup`yr' = 18 if edpy`yr' == 8 & edpg`yr' == 1 ;		// 석사과정이고 졸업했으면 18.*/
			/*replace edup`yr' = edps`yr' + 16 if edpy`yr' == 8 & edpg`yr' == 2 ;	// 석사과정이고 졸업 안했으면 학년입력.*/
			/*replace edup`yr' = 21 if edpy`yr' == 9 & edpg`yr' == 1 ;		// 박사과정이고 졸업했으면 21.*/
		/*replace edup`yr' = edps`yr' + 18 if edpy`yr' == 8 & edpg`yr' == 2 ;	// 중학생이고 졸업 안했으면 학년입력.*/
			/*} */
	/*}}}*/
	/**************** GENERATE GROWTH AREA VARIABLES *******************{{{*/
		/**order _all, alpha*/
		/*egen growth = rowlast(pgrowth01-pgrowth20) */
		/*capture label variable growth "Growth area" */
		/*drop pgrowth01-pgrowth20 */
		
		/*gen grogrp = growth */
		/*recode grogrp (1/2=2) (3/7=1) (8/18=.) */
		/*label var grogrp "서울,부산 = 2, 기타 도시 = 1" ;  // 도 단위 및 북한, 외국 제외*/
		
		/*gen grogrp_inv = grogrp */
		/*recode grogrp_inv (1=2) (2=1) */
		
		/*gen grogrp1 = growth */
		/*recode grogrp1 (1=2) (2/7=1) (8/18=.) */
		/*label var grogrp1 "서울(특별시) = 2, 기타 도시(광역시) = 1" */
		
		/*gen grogrp1_inv = grogrp1 */
		/*recode grogrp1_inv (1=2) (2=1) ; */
		
		/*gen grogrp2 = growth */
		/*recode grogrp2 (1=2) (5=2) (8=2) (2/4=1) (6/7=1) (9/16=1) */
		/*label var grogrp2 "수도권(서울,경기,인천) = 2, 나머지 = 1" */
		
		/*gen grogrp3 = growth */
		/*recode grogrp3 (1/7=2) (8/16=1) */
		/*label var grogrp3 "광역시 이상 = 2, 나머지 = 1" */
		
		/*gen grogrp4 = growth */
		/*recode grogrp4 (4=1) (6/7=1) (9/16=1) (1/3=2) (5=2) (8=2) */
		/*label var grogrp4 "수도권과 대구,부산 = 2, 나머지 = 1" */
		
		/*gen grogrp5 = growth */
		/*recode grogrp5 (1=3) (2/7=2) (8/16=1) */
		/*label var grogrp5 "나머지(1), 광역시(2), 서울(3)" */
		
		
		/*[>*시,도,군 ****<]*/
		
		/*egen city = rowlast(pseoul02-pseoul20) */
		/*capture label variable city "14세 성장지 (도/군)" */
		/*gen seoul = city if growth == 1 */
		/*drop pseoul02-pseoul20 */
		/*gen seoulgrp = seoul */
		/*recode seoulgrp (2/14=1) (16/17=1) (19/25=1) (1=2) (15=2) (18=2) */
		/*capture label variable seoulgrp "14세 성장지 (도/군 in seoul)" */
	/*}}}*/
	/**************** GENERATE BRITH AREA VARIABLES ************************//*{{{*/
		/*egen birth = rowlast(pbirth01-pbirth20) */
		/*capture label variable birth "Birth area" */
		/*drop pbirth01-pbirth20*/
		
		/*gen  birgrp = birth */
		/*recode birgrp (1/2=2) (3/7=1) (8/18=.) */
		/*label var birgrp "서울,부산 = 2, 기타 도시 = 1" */
		
		/*gen birgrp1 = birth */
		/*recode birgrp1 (1=2) (2/7=1) (8/18=.) */
		/*label var birgrp1 "서울(특별시) = 2, 기타 도시(광역시) = 1" */
		/*}}}*/
	/**************** GENERATE OECD EQUIVALENCE SCALE ************************//*{{{*/
	/*FORVALUES X = 1/20 { */
		/*LOCAL WAVE : DISP %02.0F  = `X'*/
		/*LOCAL YEAR = 1997 + `X'*/

		/*BYS HHID`YR': EGEN OESC`YR' = TOTAL(HEQL`YR')*/

		/*GEN INCA`YR' = INCH`YR'/OESC`YR'; */
			/*CAPTURE LABEL VARIABLE OESC`YR' "OECD EQUIV. SCALE"; */
			/*CAPTURE LABEL VARIABLE INCA`YR' "SCALED DISOPSABLE INCOME IN `YEAR'"; */
		
		/*GEN INCA`YR'_E = INC`YR'_E / OESC`YR'*/
		
		/*QUI SUM INCA`YR', MEANONLY*/
		/*GEN INC1`YR' = INCA`YR'/R(MEAN)*/
		/*LABEL VARIABLE INC1`YR' "SCALED AND NORMALIZED INCOME IN `YEAR'"; */
		
		/*QUI SUM INCA`YR'_E, MEANONLY*/
		/*GEN INC1`YR'_E = INCA`YR'_E/R(MEAN)*/
		/*LABEL VARIABLE INC1`YR'_E "SCALED AND NORMALIZED HOUSEHOLD EARNED INCOME"*/
	/*}*/

	/*FORVALUES X = 6/20 { */
		/*LOCAL WAVE : DISP %02.0F  = `X'*/
		/*LOCAL YEAR = 1997 + `X'*/

		/*REPLACE PINC1`YR' = PINC1`YR' / `PRICE`YR'' */
		/*BYS HHID`YR' : EGEN PINC11_NO`YR' = TOTAL(PINC1`YR')*/
		/*BYS HHID`YR' : EGEN PINC11`YR' = TOTAL(PINC1`YR')*/
		
		/*RECODE PINC11`YR' (0=.) */
		/*REPLACE PINC11`YR' = PINC11`YR'/OESC`YR' */
		/*QUI SUM PINC11`YR', MEANONLY*/
		/*REPLACE PINC11`YR' = PINC11`YR'/R(MEAN)	*/
		
		/*RECODE PINC11_NO`YR' (0=.)*/
		/*QUI SUM PINC11_NO`YR', MEANONLY*/
		/*REPLACE PINC11_NO`YR' = PINC11_NO`YR'/R(MEAN)*/
		/*}}}*/
	/**************** GENERATE AGE GROUP **************************************//*{{{*/
		/*egen yertmp = rowlast(p??0104)*/
		/*recode yertmp min/1949=. 1950/1959=1 1960/1969=2 1970/1979=3 1980/1989=4 1990/max=. , gen(yobgrp)*/
		/*drop yertmp*/
		/*capture label define yob_typ 1 "1950s" 2 "1960s" 3 "1970s" 4 "1980s"*/
		/*capture label values yobgrp yob_typ*/
		/*capture label variable yobgrp "출생년대"; */
	/*}}}*/
	*** Generate worktime/*{{{*/

	/*set more off */
	/*forvalues x = 1/20 { */
		/*local wave : disp %02.0f  = `x' */
		/*recode pweekavg`yr' pweekreg`yr' poveravg`yr'(-1=.) */
		/**주당 평균, 주당 정규, 일주일 또는 월평균 초과 근로시간의 미싱값 제거*/
		/*gen worktime`yr' = pweekreg`yr' if preg`yr' == 1 & pover`yr' == 1 */
		/**주당 정규 근로시간 (정규근로 예, 초과근로여부 아니오)*/
		/*replace worktime`yr' = pweekreg`yr' + poveravg`yr' if preg`yr' == 1 & (pover`yr'==2 & pover2`yr' == 1) */
		/**주당 정규근로시간 + 주당 초과근로시간 (정규근로 예, 초과근로 예, 초과근로 구분은 주평균)*/
		/*replace worktime`yr' = pweekreg`yr' + poveravg`yr'/4.3 if preg`yr' == 1 & (pover`yr'==2 & pover2`yr' == 2) */
		/**주당 정규근로시간 + (월평균 초과근로시간/4.3 -> 주평균 초과근로시간)*/
		/*replace worktime`yr' = pweekavg`yr' if preg`yr' == 2 */
		/**정규 근로시간이 정해져 있지 않은 경우 주당 평균 근로시간 사용*/
		/*rename worktime`yr' work_p`yr' */
		
		/*bys hhid`yr' : egen work_h`yr' = sum(work_p`yr') */
		/*bys hhid`yr' : gen inc1_time`yr' = inc1`yr'/work_h`yr' */
		
		/*label var inc1_time`yr' "가구소득1/가구 총근로시간" */
		/*label var work_p`yr' "개인 근로시간" */
		/*label var work_h`yr' "가구 총근로시간" */
		/*} */

	***이렇게 짜면 normalized된 소득을 가구 총 근무시간으로 나누었기 떄문에 문제가 발생할수도 있음
	***normalize 이전 소득을 가구 총 근무시간으로 나누어야 할 듯.

	/*forvalues x = 1/19 {*/
		/*local wave : disp %02.0f  = `x' */
		/*local wave1 : disp %02.0f  = `x'+1 */
		/*egen work_h2`yr' = rowmean(work_h`yr' work_h`wave1') */
		/*egen work_p2`yr' = rowmean(work_p`yr' work_p`wave1') */
		/*gen work_hy2`yr' = work_h2`yr' * 52*/
		/*gen work_py2`yr' = work_p2`yr' * 52*/
		/*label var work_h2`yr' "가구 2년 평균근로시간(주)" */
		/*label var work_p2`yr' "개인 2년 평균근로시간(주)" */
		/*label var work_hy2`yr' "가구 2년 평균근로시간(연)"*/
		/*label var work_py2`yr' "개인 2년 평균근로시간(연)"*/
		/*}*/
		
	*scatter work_h19 inc119 if memf19==10 & inrange(inc119,0.01,5)
	*su work_h19 inc119 if memf19==10 & inrange(inc119,0.01,5)

	/*set more off */
	/*forvalues x = 6/19 { */
		/*local wave : disp %02.0f  = `x' */
		/*bys hhid`yr' : gen inc2_time`yr' = inc2`yr'/ work_hy2`yr'	*/
		/*label var inc2_time`yr' "2년평균 가구소득 / 가구 2년 평균근로시간(연)" */
		
		/*bys pid : gen pinc2_time`yr' = pinc2`yr'/ work_py2`yr' */
		/*label var pinc2_time`yr' "2년평균 개인근로소득 / 개인 2년 평균근로시간(연)"*/
		
		/*bys pid : gen pinc3_time`yr' = pinc3`yr'/ work_py2`yr' */
		/*label var pinc2_time`yr' "2년평균 개인근로소득 / 개인 2년 평균근로시간(연)"*/
		/*} */

	*browse pid hhid18 hhid19 worktime18 work_h18 inc118 inc118_time worktime19 work_h19 inc119 inc119_time

	/*drop pweekavg* pweekreg* preg* pover* pover2* poveravg**/

	/*order _all, alphabetic*/
	/*order pid hhid01-hhid20 , first*/

	/*compress*/
	/*save klips.dta , replace*/


	*reshape long hhid* agep* edpg* edpy* inc1* inc1_time* inc2* inc2_time* memf* pinc1* pinc2* pinc2_time* wgt* work_h* work_h2* work_p* work_p2* work_hy* work_py* work_hy2* work_py2*  , i(pid) j(wave)






	/*}}}*/
/*}}}*/
