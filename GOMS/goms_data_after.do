use ~/dropbox/goms/goms_master , clear
/*자료제한 1981-1993년생 , 2000-2012년 고교졸업자 */
/*keep if inrange(birthy , 1981 , 1994) & inrange(f001 , 2000 , 2011)*/
  /*자료 신뢰도 검증{{{*/
    /*고교졸업연령 검증 {{{*/
      gen fage = f001 - birthy
      label var fage "고졸만나이"
      drop if fage <0 
    /*}}}*/
    /*현재연령 검증 {{{*/
      gen temp1 = age + birthy
      gen temp2 = year - temp1
      drop if !inrange(temp2 , -2 , 0 )
      drop temp?  
    /*}}}*/
    /*고교졸업-대학입학 순서검증 {{{*/
      gen temp = f011 - f001
      drop if temp < 0
      drop temp 
    /*}}}*/
  /*}}}*/
  /*성별변수 수정 {{{*/
    gen women = sex -1 
    label define WOMEN 1 "여성" 0 "남성"
    label value women WOMEN
    label var women "여성더미"
    label define SEX 2 "여성" 1 "남성"
    label value sex SEX
  /*}}}*/
  /*부모학력집단 {{{*/
    gen temp = p026 + p029
    gen edugrp = . 
      label var edugrp "부친학력환경(년도별 조정)"
      label define EDUGRP 1 "저학력" 2 "중학력" 3 "고학력" -1 "전체"
      label value edugrp EDUGRP
      replace edugrp = 1 if f001 == 2000 & inrange(temp , 2 , 7 )
      replace edugrp = 2 if f001 == 2000 & inrange(temp , 8 , 9 )
      replace edugrp = 3 if f001 == 2000 & inrange(temp , 10 , 99 )
      replace edugrp = 1 if f001 == 2001 & inrange(temp , 2 , 7 )
      replace edugrp = 2 if f001 == 2001 & inrange(temp , 8 , 9 )
      replace edugrp = 3 if f001 == 2001 & inrange(temp , 10 , 99 )
      replace edugrp = 1 if f001 == 2002 & inrange(temp , 2 , 7 )
      replace edugrp = 2 if f001 == 2002 & inrange(temp , 8 , 9 )
      replace edugrp = 3 if f001 == 2002 & inrange(temp , 10 , 99 )
      replace edugrp = 1 if f001 == 2003 & inrange(temp , 2 , 7 )
      replace edugrp = 2 if f001 == 2003 & inrange(temp , 8 , 9 )
      replace edugrp = 3 if f001 == 2003 & inrange(temp , 10 , 99 )
      replace edugrp = 1 if f001 == 2004 & inrange(temp , 2 , 7 )
      replace edugrp = 2 if f001 == 2004 & inrange(temp , 8 , 9 )
      replace edugrp = 3 if f001 == 2004 & inrange(temp , 10 , 99 )
      replace edugrp = 1 if f001 == 2005 & inrange(temp , 2 , 7 )
      replace edugrp = 2 if f001 == 2005 & inrange(temp , 8 , 9 )
      replace edugrp = 3 if f001 == 2005 & inrange(temp , 10 , 99 )
      replace edugrp = 1 if f001 == 2006 & inrange(temp , 2 , 7 )
      replace edugrp = 2 if f001 == 2006 & inrange(temp , 8 , 9 )
      replace edugrp = 3 if f001 == 2006 & inrange(temp , 10 , 99 )
      replace edugrp = 1 if f001 == 2007 & inrange(temp , 2 , 8 )
      replace edugrp = 2 if f001 == 2007 & inrange(temp , 9 , 11 )
      replace edugrp = 3 if f001 == 2007 & inrange(temp , 12 , 99 )
      replace edugrp = 1 if f001 == 2008 & inrange(temp , 2 , 8 )
      replace edugrp = 2 if f001 == 2008 & inrange(temp , 9 , 11 )
      replace edugrp = 3 if f001 == 2008 & inrange(temp , 12 , 99 )
      replace edugrp = 1 if f001 == 2009 & inrange(temp , 2 , 8 )
      replace edugrp = 2 if f001 == 2009 & inrange(temp , 9 , 11 )
      replace edugrp = 3 if f001 == 2009 & inrange(temp , 12 , 99 )
      replace edugrp = 1 if f001 == 2010 & inrange(temp , 2 , 8 )
      replace edugrp = 2 if f001 == 2010 & inrange(temp , 9 , 11 )
      replace edugrp = 3 if f001 == 2010 & inrange(temp , 12 , 99 )
      replace edugrp = 1 if f001 == 2011 & inrange(temp , 2 , 8 )
      replace edugrp = 2 if f001 == 2011 & inrange(temp , 9 , 11 )
      replace edugrp = 3 if f001 == 2011 & inrange(temp , 12 , 99 )
      replace edugrp = 1 if f001 == 2012 & inrange(temp , 2 , 8 )
      replace edugrp = 2 if f001 == 2012 & inrange(temp , 9 , 11 )
      replace edugrp = 3 if f001 == 2012 & inrange(temp , 12 , 99 )
    recode temp (2/7=1) (8 =2) (9/99 = 3) , gen(edugrp2)
      label var edugrp2 "부친학력환경"
      label value edugrp2 EDUGRP
    drop temp
  /*}}}*/
  /*부모소득집단 {{{*/
    gen incgrp = . 
      label var incgrp "부모소득환경(년도별 조정)"
      label define INCGRP 1 "저소득" 2 "중소득" 3 "고소득" -1 "전체"
      label value incgrp INCGRP
      replace incgrp = 1 if f001 == 2000 & inrange(p034 , 1 , 3 )
      replace incgrp = 2 if f001 == 2000 & inrange(p034 , 4 , 5 )
      replace incgrp = 3 if f001 == 2000 & inrange(p034 , 6 , 99 )
      replace incgrp = 1 if f001 == 2001 & inrange(p034 , 1 , 3 )
      replace incgrp = 2 if f001 == 2001 & inrange(p034 , 4 , 5 )
      replace incgrp = 3 if f001 == 2001 & inrange(p034 , 6 , 99 )
      replace incgrp = 1 if f001 == 2002 & inrange(p034 , 1 , 3 )
      replace incgrp = 2 if f001 == 2002 & inrange(p034 , 4 , 5 )
      replace incgrp = 3 if f001 == 2002 & inrange(p034 , 6 , 99 )
      replace incgrp = 1 if f001 == 2003 & inrange(p034 , 1 , 3 )
      replace incgrp = 2 if f001 == 2003 & inrange(p034 , 4 , 5 )
      replace incgrp = 3 if f001 == 2003 & inrange(p034 , 6 , 99 )
      replace incgrp = 1 if f001 == 2004 & inrange(p034 , 1 , 3 )
      replace incgrp = 2 if f001 == 2004 & inrange(p034 , 4 , 5 )
      replace incgrp = 3 if f001 == 2004 & inrange(p034 , 6 , 99 )
      replace incgrp = 1 if f001 == 2005 & inrange(p034 , 1 , 3 )
      replace incgrp = 2 if f001 == 2005 & inrange(p034 , 4 , 5 )
      replace incgrp = 3 if f001 == 2005 & inrange(p034 , 6 , 99 )
      replace incgrp = 1 if f001 == 2006 & inrange(p034 , 1 , 3 )
      replace incgrp = 2 if f001 == 2006 & inrange(p034 , 4 , 5 )
      replace incgrp = 3 if f001 == 2006 & inrange(p034 , 6 , 99 )
      replace incgrp = 1 if f001 == 2007 & inrange(p034 , 1 , 3 )
      replace incgrp = 2 if f001 == 2007 & inrange(p034 , 4 , 5 )
      replace incgrp = 3 if f001 == 2007 & inrange(p034 , 6 , 99 )
      replace incgrp = 1 if f001 == 2008 & inrange(p034 , 1 , 3 )
      replace incgrp = 2 if f001 == 2008 & inrange(p034 , 4 , 5 )
      replace incgrp = 3 if f001 == 2008 & inrange(p034 , 6 , 99 )
      replace incgrp = 1 if f001 == 2009 & inrange(p034 , 1 , 3 )
      replace incgrp = 2 if f001 == 2009 & inrange(p034 , 4 , 5 )
      replace incgrp = 3 if f001 == 2009 & inrange(p034 , 6 , 99 )
      replace incgrp = 1 if f001 == 2010 & inrange(p034 , 1 , 3 )
      replace incgrp = 2 if f001 == 2010 & inrange(p034 , 4 , 5 )
      replace incgrp = 3 if f001 == 2010 & inrange(p034 , 6 , 99 )
      replace incgrp = 1 if f001 == 2011 & inrange(p034 , 1 , 3 )
      replace incgrp = 2 if f001 == 2011 & inrange(p034 , 4 , 5 )
      replace incgrp = 3 if f001 == 2011 & inrange(p034 , 6 , 99 )
      replace incgrp = 1 if f001 == 2012 & inrange(p034 , 1 , 3 )
      replace incgrp = 2 if f001 == 2012 & inrange(p034 , 4 , 5 )
      replace incgrp = 3 if f001 == 2012 & inrange(p034 , 6 , 99 )
    recode p034 (1/3 = 1) (4/5 = 2) (6/99 = 3) , gen(incgrp2)
      label var incgrp2 "부모소득환경"
      label value incgrp2 INCGRP
  /*}}}*/
  /*고교지역집단 {{{*/
    recode f006 ( 1 5 = 3) ( 2 3 4 6 7 17 = 2) (8/16 =1) , gen(rgngrp)
      replace rgngrp = 3 if inlist(f007 , 802 , 804, 811, 812, 813, 815, 817, 823)
      /*고양시, 광명시, 부천시, 성남시, 수원시, 안산시, 안양시, 용인시, 의정부시*/
      label var rgngrp "지역환경(수도권조정)"
      label define RGNGRP -1 "전체" 1 "도" 2 "광역시" 3 "수도권"
      label value rgngrp RGNGRP
    recode f006 ( 1 5 8= 3) ( 2 3 4 6 7 17 = 2) (9/16 =1) , gen(rgngrp2)
      label var rgngrp2 "지역환경"
      label value rgngrp2 RGNGRP
  /*}}}*/
  /*대입전형방법 {{{*/
    recode f01410 (1=1) (2=2) (3=3) (4/6=4) , gen(temp10)
    gen temp11 = f01411
    gen temp12 = f01412
    gen temp13 = f01413
    recode f01414 (1=1) (2=2) (3=3) (4/5=4) , gen(temp14)
    gen temp15 = .
      replace temp15 = 1 if f01315 == 1 & inlist(f01415 , 1 , 2)
      replace temp15 = 2 if f01315 == 2 & inlist(f01415 , 1 , 2)
      replace temp15 = 3 if inlist(f01315 , 1 , 2 ) & inlist(f01415 , 3 , 4)
      replace temp15 = 4 if f01315 == 3 | f01415 == 5 
    gen temp16 = .
      replace temp16 = 1 if f01316 == 1 & inlist(f17016 , 1 , 2, 3, 4, 5)
      replace temp16 = 2 if f01316 == 2 & inlist(f17016 , 1 , 2, 3, 4, 5)
      replace temp16 = 3 if inlist(f01316 , 1 , 2 ) & inlist(f17016 , 6 , 7)
      replace temp16 = 4 if f01316 == 3 | f17016 == 8 
    gen temp17 = .
      replace temp17 = 1 if f01317 == 1 & inlist(f17017 , 1 , 2, 3, 4, 5)
      replace temp17 = 2 if f01317 == 2 & inlist(f17017 , 1 , 2, 3, 4, 5)
      replace temp17 = 3 if inlist(f01317 , 1 , 2 ) & inlist(f17017 , 6 , 7)
      replace temp17 = 4 if f01317 == 3 | f17017 == 8 
    egen f013 = rowlast(temp??) 
      label define F013 1 "일반정시" 2 "일반수시" 3 "특별전형" 4 "기타"
      label var f013 "대입전형 방법"
      label value f013 F013
    drop temp??
  /*}}}*/
  /*입학점수생성 {{{*/
    gen score3 = .
      replace score3 = 1 if school == 1
      replace score3 = 2 if inlist(school , 2 , 3)
      replace score3 = 3 if !missing(unirank)
      label var score3 "대학3등급"
    gen score4 = score3
      replace score4 = 4 if inrange(unirank , 1 , 10) & branch == 1
      label var score4 "대학4등급"
    gen score5 = score4
      replace score5 = 5 if inrange(majtyp , 1 , 5) | ( (inrange(majtyp , 6 , 9) & inlist( unirank , 1, 2, 3, 5, 6)) & branch == 1 )
      label var score5 "대학5등급"
  /*}}}*/
  /* 재수여부{{{*/
    replace f010 = f010 -1
      label define F010 0 "입학" 1"편입"
      label value f010 F101
    gen reexam = f011>f001 & !f010
      replace reexam = 0 if missing(f011)
      label var reexam "재수여부"
    gen reexamy = f011 - f001 if reexam
      label var reexamy "재수기간(년)"
    gen byte entgrp = .
      replace entgrp = 1 if f013 == 1 & !reexam
      replace entgrp = 2 if f013 == 1 & reexam
      replace entgrp = 3 if f013 == 2 & !reexam
      replace entgrp = 4 if f013 == 2 & reexam
      replace entgrp = 5 if !missing(f013)&missing(entgrp)
      label var entgrp "대입유형집단"
      label define ENTGRP 3 "일반수시고졸" 4 "일반수시재수" 1 "일반정시고졸" 2 "일반정시재수" 5 "기타"
      label value entgrp ENTGRP
    /*}}}*/
  /* 좋은직장{{{*/
    gen sjob = ((a059 == 1) | (a021 == 1 & a022 == 2))&(a010 >=6) | inlist(a021 , 4,5)
    replace sjob = . if missing(a004)
      label var sjob "좋은직업"
      label define SJOB 0 "안좋은직업" 1"좋은직업"
      label value sjob SJOB
  /*}}}*/
  /* 직장유형{{{*/
    gen jobcat = .
    replace jobcat = 1 if inlist(a021 ,  4, 5 )
    replace jobcat = 2 if sjob == 0 & missing(jobcat)
    replace jobcat = 3 if sjob == 1 & missing(jobcat)
      label define JOBCAT 1 "자영업자" 2"임시근로자" 3"정규근로자"
      label value jobcat JOBCAT
      label var jobcat "직업유형"
  /*}}}*/
  /*소득생성 {{{*/
    replace a366 = . if a366 < 0
    egen income = rowtotal(a122 a366 a376 a386) , missing
      label var income "월평균근로소득(만원)"
    /* 소득5등급(0포함)생성{{{*/
      forvalue i = 2000/2011 {
        gen temp`i' = income if f001 == `i'
          replace temp`i' = 10^(-5) if missing(temp`i') & f001 == `i'
        count if f001 == `i'
        local n_`i' = r(N)
        forvalue j = 1/4 {
          count if f001 == `i' & score5 <= `j'
          local n_`i'_`j' = (r(N) / `n_`i'')*100
          _pctile temp`i' if f001 == `i' , p(`n_`i'_`j'')
          local q_`i'_`j' = r(r1)
        }
        recode temp`i' (0/`q_`i'_1' = 1) (`q_`i'_1' /`q_`i'_2' = 2) (`q_`i'_2' /`q_`i'_3' = 3)(`q_`i'_3' /`q_`i'_4' = 4)(`q_`i'_4' /10000 = 5)
      }
      egen scorei = rowtotal(temp????), missing
        label var scorei "소득5등급(0포함)" 
      drop temp????
    /*}}}*/
    /* 소득5등급생성{{{*/
      forvalue i = 2000/2011 {
        gen temp`i' = income if f001 == `i'
        count if f001 == `i'
        local n_`i' = r(N)
        forvalue j = 1/4 {
          count if f001 == `i' & score5 <= `j'
          local n_`i'_`j' = (r(N) / `n_`i'')*100
          _pctile temp`i' if f001 == `i' , p(`n_`i'_`j'')
          local q_`i'_`j' = r(r1)
        }
        recode temp`i' (0/`q_`i'_1' = 1) (`q_`i'_1' /`q_`i'_2' = 2) (`q_`i'_2' /`q_`i'_3' = 3)(`q_`i'_3' /`q_`i'_4' = 4)(`q_`i'_4' /10000 = 5)
      }
      egen scorej = rowtotal(temp????) , missing 
      label var scorej "소득5등급"
      drop temp????
    /*}}}*/
  /*}}}*/
  /*고등학교계열 {{{*/
    recode f00907 (1=2) (2=3) (3 4=7) (5=4) (6/9=1) , gen(temp07)
    recode f00908 (1=2) (2=3) (3 4=7) (5=4) (6/9=1) , gen(temp08)
    recode f00909 (1=2) (2=3) (3 4=7) (5=4) (6/9=1) , gen(temp09)
    recode f00910 (1=2) (2=3) (3 4=7) (5=4) (6/9=1) , gen(temp10)
    recode f00911 (1=2) (2=3) (3 4=7) (5=4) (6/9=1) , gen(temp11)
    recode f00912 (1=2) (2=3) (3 4=7) (5=4) (6/9=1) , gen(temp12)
    recode f00913 (1=2) (2=3) (3 4=7) (5=4) (6/9=1) , gen(temp13)
    recode f00914 (1=2) (2=3) (3 =7) (7=4) (4 5 6 8 =1) , gen(temp14)
    recode f00915 (1=2) (2=3) (3 =7) (4=4) (5/10=1) , gen(temp15)
    recode f00916 (1=2) (2=3) (3 =7) (4=4) (5/10=1) , gen(temp16)
    recode f00917 (1=2) (2=3) (3 =7) (4=4) (5/10=1) , gen(temp17)
    egen f009 = rowlast(temp??) 
      label define F009 1 "기타(특성화등)" 2 "일반계(문과)" 3 "일반계(이과)" 4 "특목고(예체능)" 5 "강남3구" 6 "자율고" 7 "특목고(외과국)" 
      label var f009 "고등학교 계열"
      label value f009 F009
      /* 특목고(외/과/국) 범주 바로잡기{{{*/
        replace f009 = 7 if strpos(hsname , "외국어" ) & f009 != 7
        replace f009 = 7 if strpos(hsname , "과학" ) & f009 != 7
        replace f009 = 7 if strpos(hsname , "국제" ) & f009 != 7
        /* from 특목 to 기타{{{*/
          replace f009 = 1 if strpos(hsname , "영상과학" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "자연과학" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "해양과학" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "조리과학" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "생활과학" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "항공과학" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "생명과학" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "비즈니스" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "마이스터" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "한동국제" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "혜성국제" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "국제특성" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "벨국제" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "테크노" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "테트노" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "자동차" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "디지털" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "인터넷" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "디자인" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "모바일" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "컴퓨터" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "바이오" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "미디어" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "에너지" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "농생명" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "컨베션" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "컨벤션" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "컴벤션" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "산업" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "외식" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "영상" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "물류" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "영화" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "무역" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "해향" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "해양" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "기술" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "전자" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "농공" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "발명" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "아트" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "상업" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "경영" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "세무" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "조리" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "해사" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "공업" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "금융" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "관광" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "통상" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "항공" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "한독" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "정보" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "게임" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "종교" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "도시" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "전산" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "선화" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "화교" ) & f009 == 7
          replace f009 = 1 if strpos(hsname , "한인" ) & f009 == 7
        /*}}}*/
        /* from 특목 to 일반{{{*/
          replace f009 = 2 if strpos(hsname , "휘문" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "국제" ) & f009 == 7 & f006 == 6
          replace f009 = 2 if strpos(hsname , "상일여자" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "성덕" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "부광" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "홍천" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "영알" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "청암" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "선덕" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "성남자" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "강산" ) & f009 == 7
          replace f009 = . if strpos(hsname , "제일외국어" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "목동" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "신목" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "브니엘" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "장안" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "동인" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "동의" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "대동" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "장안" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "경덕여자" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "선일" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "옥련여자" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "영흥" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "서인천" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "호남삼육" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "금호" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "현대" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "구리여자" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "산본" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "심석" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "중앙" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "전북대" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "영생" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "배영" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "여수화양" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "청도" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "순심" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "밀성" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "보광" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "명석" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "원주여자" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "성산" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "부평" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "삼성" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "상서" ) & f009 == 7
          replace f009 = 2 if strpos(hsname , "성서" ) & f009 == 7
        /*}}}*/
        /* from 특목 to 자율{{{*/
          replace f009 = 6 if strpos(hsname , "해운대" ) & f009 == 7
        /*}}}*/
        /* from 특목 to 예술{{{*/
          replace f009 = 4 if strpos(hsname , "국악" ) & f009 == 7 
          replace f009 = 4 if strpos(hsname , "예술" ) & f009 == 7 
          replace f009 = 4 if strpos(hsname , "전통문화" ) & f009 == 7 
        /*}}}*/
        /* 강남{{{*/
          gen temp99 =  inlist(f007 , 101 , 115 , 118)
          replace f009 = 5 if temp99 & strpos(hsname , "가락")
          replace f009 = 5 if temp99 & strpos(hsname , "개포")
          replace f009 = 5 if temp99 & strpos(hsname , "경기")
          replace f009 = 5 if temp99 & strpos(hsname , "구정")
          replace f009 = 5 if temp99 & strpos(hsname , "단국")
          replace f009 = 5 if temp99 & strpos(hsname , "단대")
          replace f009 = 5 if temp99 & strpos(hsname , "동덕")
          replace f009 = 5 if temp99 & strpos(hsname , "반포")
          replace f009 = 5 if temp99 & strpos(hsname , "방산")
          replace f009 = 5 if temp99 & strpos(hsname , "배명")
          replace f009 = 5 if temp99 & strpos(hsname , "보성")
          replace f009 = 5 if temp99 & strpos(hsname , "보인")
          replace f009 = 5 if temp99 & strpos(hsname , "상문")
          replace f009 = 5 if temp99 & strpos(hsname , "서문")
          replace f009 = 5 if temp99 & strpos(hsname , "서울고")
          replace f009 = 5 if temp99 & strpos(hsname , "청담")
          replace f009 = 5 if temp99 & strpos(hsname , "현대")
          replace f009 = 5 if temp99 & strpos(hsname , "서초")
          replace f009 = 5 if temp99 & strpos(hsname , "세종")
          replace f009 = 5 if temp99 & strpos(hsname , "세화")
          replace f009 = 5 if temp99 & strpos(hsname , "숙명")
          replace f009 = 5 if temp99 & strpos(hsname , "양재")
          replace f009 = 5 if temp99 & strpos(hsname , "언남")
          replace f009 = 5 if temp99 & strpos(hsname , "영동")
          replace f009 = 5 if temp99 & strpos(hsname , "영파")
          replace f009 = 5 if temp99 & strpos(hsname , "오금")
          replace f009 = 5 if temp99 & strpos(hsname , "은광")
          replace f009 = 5 if temp99 & strpos(hsname , "잠신")
          replace f009 = 5 if temp99 & strpos(hsname , "잠실")
          replace f009 = 5 if temp99 & strpos(hsname , "정신")
          replace f009 = 5 if temp99 & strpos(hsname , "중대")
          replace f009 = 5 if temp99 & strpos(hsname , "중동")
          replace f009 = 5 if temp99 & strpos(hsname , "중산")
          replace f009 = 5 if temp99 & strpos(hsname , "중앙대")
          replace f009 = 5 if temp99 & strpos(hsname , "진선")
          replace f009 = 5 if temp99 & strpos(hsname , "창덕")
          replace f009 = 5 if temp99 & strpos(hsname , "휘문")
          replace f009 = 1 if strpos(hsname , "공업") &f009 == 5
          replace f009 = 1 if strpos(hsname , "상업") &f009 == 5
          replace f009 = 1 if strpos(hsname , "산업") &f009 == 5
          replace f009 = 1 if strpos(hsname , "전자") &f009 == 5
        /*}}}*/
        replace f009 = 6 if strpos(hsname , "하나" ) & f007 == 122
        replace f009 = 6 if strpos(hsname , "청운" ) & f006 == 7
        replace f009 = 6 if strpos(hsname , "민족" ) & f006 == 9
        replace f009 = 6 if strpos(hsname , "상산" ) & f007 == 1212
        replace f009 = 6 if strpos(hsname , "제철" ) & f007 == 1304 
        replace f009 = 6 if strpos(hsname , "제철" ) & f007 == 1423
        replace f009 = 6 if strpos(hsname , "해운대") & inrange(f009 , 1, 4) & !strpos(hsname , "공고") & !strpos(hsname , "여자") & !strpos(hsname , "공업")& !strpos(hsname , "관광")& !strpos(hsname , "기계")
        replace f009 = 7 if strpos(hsname , "영재" ) 
      /*}}}*/
    gen hscgrp = .
      label var hscgrp "출신고계열환경"
      label define HSCGRP 1 "특성화/기타" 2 "일반" 3 "특목/자율/강남3고"
      label value hscgrp HSCGRP
    replace hscgrp = 1 if f009 == 1
    replace hscgrp = 2 if inlist(f009 , 2, 3)
    replace hscgrp = 3 if inlist(f009 , 4, 5, 6, 7)
    drop temp??
  /*}}}*/
  /*고등학교명 정정{{{*/
    . if hsname == (경기)광주중앙 
    . if hsname == (나주)영산고등학교(구 영산포상업고등..
    . if hsname == 0
    . if hsname == 00
    . if hsname == 00기계
    . if hsname == 00실업
    . if hsname == 11
    . if hsname == @@
    한국YMCA원주고등학교 if hsname == YMCA원주고등학교
    군포e비즈니스고등학교 if hsname == e비즈니스고등학교
    . if hsname == ㄱ더절
    . if hsname == ㅇ ㅇ여자
    가곡고등학교 if hsname == 가곡
    가오고등학교 if hsname == 가도
    가락고등학교 if hsname == 가락
    가림고등학교 if hsname == 가린
    가림고등학교 if hsname == 가림
    가야고등학교 if hsname == 가야
    가야고등학교 if hsname == 가야고등
    . if hsname == 가양동
    가오고등학교 if hsname == 가오
    가온고등학교 if hsname == 가온
    가운고등학교 if hsname == 가운
    가운고등학교 if hsname == 가운고
    가은고등학교 if hsname == 가은
    가정고등학교 if hsname == 가정
    가조익천고등학교 if hsname == 가조의천
    가조익천고등학교 if hsname == 가조이천
    가조익천고등학교 if hsname == 가조익천
    가좌고등학교 if hsname == 가좌
    if hsname == 가창
    가천고등학교 if hsname == 가천
    가평고등학교 if hsname == 가평
    가평종합고등학교 if hsname == 가평종합
    if hsname == 가포
    간동고등학교 if hsname == 간동
    간디고등학교 if hsname == 간디
    if hsname == 간호
    갈산고등학교 if hsname == 갈산
    if hsname == 갈인
    if hsname == 갈현동
    if hsname == 감산
    if hsname == 감천고등학교
    감포고등학교 if hsname == 감포
    갑천고등학교 if hsname == 갑천
    if hsname == 갑포
    강경고등학교 if hsname == 강경
    강경상업정보고등학교 if hsname == 강경상업
    강경상업정보고등학교 if hsname == 강경상업정보
    강남고등학교 if hsname == 강남
    if hsname == 강남공업
    강남여자고등학교 if hsname == 강남여자
    if hsname == 강남영상미디어고등학교
    if hsname == 강남자고등학교
    if hsname == 강납종합
    강동고등학교 if hsname == 강동
    강릉고등학교 if hsname == 강릉
    if hsname == 강릉 강일여자
    if hsname == 강릉 경포
    강릉명륜고등학교 if hsname == 강릉 명륜
    if hsname == 강릉 문성
    if hsname == 강릉 여자
    강릉공업고등학교 if hsname == 강릉공고
    강릉농공고등학교 if hsname == 강릉농공
    if hsname == 강릉농업
    강릉명륜고등학교 if hsname == 강릉명륜
    if hsname == 강릉명원
    강릉문성고등학교 if hsname == 강릉문성
    if hsname == 강릉상업고등학교
    강릉여자고등학교 if hsname == 강릉여자
    if hsname == 강릉인문
    강릉정보고등학교 if hsname == 강릉정보
    강릉정보공업고등학교 if hsname == 강릉정보공업
    강릉제일고등학교 if hsname == 강릉제일
    강릉중앙고등학교 if hsname == 강릉중앙
    강릉중앙고등학교 if hsname == 강릉중앙고등학교고등학교
    강문고등학교 if hsname == 강문
    강북고등학교 if hsname == 강복고등학교
    강북고등학교 if hsname == 강북
    강상고등학교 if hsname == 강산
    강서고등학교 if hsname == 강서
    if hsname == 강서(안산)
    강서공업고등학교 if hsname == 강서공고
    강서공업고등학교 if hsname == 강서공업
    강원고등학교 if hsname == 강원
    if hsname == 강원고성고등학교
    강원과학고등학교 if hsname == 강원과학
    강원대학교사범대학부설고등학교 if hsname == 강원대 사범대 부설
    강원대학교사범대학부설고등학교 if hsname == 강원대부속
    강원대학교사범대학부설고등학교 if hsname == 강원대사대부설고등학교
    강원대학교사범대학부설고등학교 if hsname == 강원대사범대학부설
    강원대학교사범대학부설고등학교 if hsname == 강원대학교 사범대학부설
    강원대학교사범대학부설고등학교 if hsname == 강원대학교사범대학부설
    강원대학교사범대학부설고등학교 if hsname == 강원대학사범대학부설
    if hsname == 강원도
    if hsname == 강원도삼척
    if hsname == 강원도인문계
    강원대학교사범대학부설고등학교 if hsname == 강원사대부
    강원대학교사범대학부설고등학교 if hsname == 강원사대부고
    강원대학교사범대학부설고등학교 if hsname == 강원사대부설
    강원대학교사범대학부설고등학교 if hsname == 강원사대부속
    강원대학교사범대학부설고등학교 if hsname == 강원사범대부설
    강원대학교사범대학부설고등학교 if hsname == 강원사험대학부설
    강원예술고등학교 if hsname == 강원예술
    강원체육고등학교 if hsname == 강원체육
    if hsname == 강원효천
    강일고등학교 if hsname == 강일
    강일여자고등학교 if hsname == 강일여자
    강진고등학교 if hsname == 강진
    if hsname == 강진 성요셉여자
    if hsname == 강진농업
    if hsname == 강진성전
    if hsname == 강진여자고등학교
    강호상업고등학교 if hsname == 강풍
    강호상업고등학교 if hsname == 강호상업
    강호항공고등학교 if hsname == 강호항공
    강화고등학교 if hsname == 강화
    강화여자고등학교 if hsname == 강화여자
    if hsname == 강회
    개금고등학교 if hsname == 개금
    개성고등학교 if hsname == 개성
    개성정보고등학교 if hsname == 개성정보
    개포고등학교 if hsname == 개포
    if hsname == 거부
    if hsname == 거장
    if hsname == 거전
    if hsname == 거점
    if hsname == 거정
    거제고등학교 if hsname == 거제
    거제공업고등학교 if hsname == 거제 공업
    if hsname == 거제 여자
    if hsname == 거제 제일
    if hsname == 거제 중앙
    거제공업고등학교 if hsname == 거제공업
    거제공업고등학교 if hsname == 거제공업고등학교(조선산업 마이스터고)
    if hsname == 거제산업
    if hsname == 거제상업
    거제여자상업고등학교 if hsname == 거제여상고등학교
    거제여자상업고등학교 if hsname == 거제여자
    거제여자상업고등학교 if hsname == 거제여자고등학교
    거제여자상업고등학교 if hsname == 거제여자고등학교(구/거제여자상업고등..
    거제여자상업고등학교 if hsname == 거제여자상업
    거제옥포고등학교 if hsname == 거제옥포
    거제제일고등학교 if hsname == 거제제길
    거제제일고등학교 if hsname == 거제제일
    거제종합고등학교 if hsname == 거제종합
    거제중앙고등학교 if hsname == 거제중앙
    if hsname == 거제중앙여자
    거제해성고등학교 if hsname == 거제해선고등학교
    거제해성고등학교 if hsname == 거제해성
    거제해성고등학교 if hsname == 거제혜성
    if hsname == 거진
    if hsname == 거진공업
    if hsname == 거진정문
    if hsname == 거진정보공업
    if hsname == 거진종합고등학교
    if hsname == 거창
    거창대성고등학교 if hsname == 거창 대성
    거창대성고등학교 if hsname == 거창 대성고등학교
    if hsname == 거창 중앙
    if hsname == 거창고등학교
    거창대성고등학교 if hsname == 거창대성
    if hsname == 거창대성여자상업
    if hsname == 거창대성정보
    거창대성환경정보고등학교 if hsname == 거창대성환경정보
    if hsname == 거창산업과학고등학교
    거창상업고등학교 if hsname == 거창상업
    거창아림고등학교 if hsname == 거창아림
    거창여자고등학교 if hsname == 거창여자
    if hsname == 거창여자상업고등학교
    거창중앙고등학교 if hsname == 거창중앙
    if hsname == 거창환경정보
    거창대성고등학교 if hsname == 거청 대성
    if hsname == 거초
    if hsname == 거화
    if hsname == 건국
    if hsname == 건국고등학교
    건국대학교사범대학부속고등학교 if hsname == 건국대 부속
    건국대학교사범대학부속고등학교 if hsname == 건국대부속
    건국대학교사범대학부속고등학교 if hsname == 건국대학교 사범대학 부속
    건국대학교사범대학부속고등학교 if hsname == 건국대학교 사범대학 부속고등학교
    건국대학교사범대학부속고등학교 if hsname == 건국대학교부속
    건국대학교사범대학부속고등학교 if hsname == 건국대학교사범대학
    건국대학교사범대학부속고등학교 if hsname == 건국대학교사범대학부속
    건국대학교사범대학부속고등학교 if hsname == 건국대학교사범대학주
    건국대학교사범대학부속고등학교 if hsname == 건국대학부속
    건국대학교사범대학부속고등학교 if hsname == 건국부속
    건국대학교사범대학부속고등학교 if hsname == 건국사대부속
    if hsname == 건국자활
    건국대학교사범대학부속고등학교 if hsname == 건대 부속
    건국대학교사범대학부속고등학교 if hsname == 건대부
    건국대학교사범대학부속고등학교 if hsname == 건대부고
    건국대학교사범대학부속고등학교 if hsname == 건대부속
    건국대학교사범대학부속고등학교 if hsname == 건대부속고등학교
    if hsname == 건대부속여자고등학교
    if hsname == 건선
    if hsname == 건설공업
    건양고등학교 if hsname == 건양
    건양고등학교 if hsname == 건양고
    if hsname == 건조
    검단고등학교 if hsname == 검단
    if hsname == 검정고시
    if hsname == 결성고등학교
    if hsname == 경
    경구고등학교 if hsname == 경고
    경구고등학교 if hsname == 경구
    경기고등학교 if hsname == 경기
    if hsname == 경기 광문
    if hsname == 경기 모바일 과학
    if hsname == 경기 여자
    if hsname == 경기 오산
    if hsname == 경기 외국어
    if hsname == 경기 이천
    if hsname == 경기 자동차 과학고등학교
    if hsname == 경기계공업
    if hsname == 경기공업
    if hsname == 경기과락
    경기과학고등학교 if hsname == 경기과학
    if hsname == 경기관광고등학교
    if hsname == 경기광남고등학교
    if hsname == 경기광주고등학교
    경기국제통상고등학교 if hsname == 경기국제통상
    경기글로벌통상고등학교 if hsname == 경기글로벌통상
    경기기계공업고등학교 if hsname == 경기기게공업
    경기기계공업고등학교 if hsname == 경기기계
    경기기계공업고등학교 if hsname == 경기기계공고
    경기기계공업고등학교 if hsname == 경기기계공업
    경기기계공업고등학교 if hsname == 경기기계공업고
    if hsname == 경기도 가평
    if hsname == 경기도 여주여자고등학교
    if hsname == 경기도 장곡
    if hsname == 경기도 평택 신한
    경기모바일과학고등학교 if hsname == 경기모바일
    경기모바일과학고등학교 if hsname == 경기모바일고등학교(구/반월정보산업고..
    경기모바일과학고등학교 if hsname == 경기모바일과학
    경기모바일과학고등학교 if hsname == 경기모바일고등학교
    경기물류고등학교 if hsname == 경기물류
    경기미용예술고등학교 if hsname == 경기미용
    경기미용예술고등학교 if hsname == 경기미용고교
    경기미용예술고등학교 if hsname == 경기미용고등학교
    경기북과학고등학교 if hsname == 경기북과학
    경기상업고등학교 if hsname == 경기상고
    경기상업고등학교 if hsname == 경기상업
    경기상업고등학교 if hsname == 경기상원
    if hsname == 경기세무고등학교
    if hsname == 경기안성안법
    경기여자고등학교 if hsname == 경기여고
    경기여자고등학교 if hsname == 경기여자
    경기여자상업고등학교 if hsname == 경기여자산업
    경기여자상업고등학교 if hsname == 경기여자상업
    경기영상과학고등학교 if hsname == 경기영상과학
    경기예술고등학교 if hsname == 경기예술
    if hsname == 경기오산고등학교
    경기외국어고등학교 if hsname == 경기외국어
    if hsname == 경기용인정보
    경기자동차과학고등학교 if hsname == 경기자동차고등학교
    경기자동차과학고등학교 if hsname == 경기자동차과학
    경기자동차과학고등학교 if hsname == (구/한인고등학교)
    if hsname == 경기창조고등학교
    경기청담고등학교 if hsname == 경기청담
    경기체육고등학교 if hsname == 경기체육
    if hsname == 경기포천
    if hsname == 경기화성
    경남고등학교 if hsname == 경남
    경남공업고등학교 if hsname == 경남 공업
    if hsname == 경남 미용
    if hsname == 경남 안의
    if hsname == 경남 애니메이션
    if hsname == 경남 여고등학교
    if hsname == 경남 자연
    if hsname == 경남 항공
    경남간호고등학교 if hsname == 경남간호
    if hsname == 경남거창
    if hsname == 경남고성중앙
    경남공업고등학교 if hsname == 경남공고
    경남공업고등학교 if hsname == 경남공업
    경남과학고등학교 if hsname == 경남과학
    경남관광고등학교 if hsname == 경남관광
    경남관광고등학교 if hsname == 경남관광고등학교(구/창원정보과학고등..
    if hsname == 경남남해
    if hsname == 경남동명
    if hsname == 경남마산
    if hsname == 경남마산매서여자
    if hsname == 경남마산상지여고
    if hsname == 경남마산제일여자
    if hsname == 경남미용
    if hsname == 경남미용고등학교
    if hsname == (구/마산인화여상/마산..
    if hsname == 경남보건고등학교
    경남산업고등학교 if hsname == 경남산업
    경남상업고등학교 if hsname == 경남상업
    if hsname == 경남생명과학
    경남애니메이션고등학교 if hsname == 경남애니매이션
    경남애니메이션고등학교 if hsname == 경남애니메이션
    경남여자고등학교 if hsname == 경남여자
    경남여자상업고등학교 if hsname == 경남여상
    경남여자상업고등학교 if hsname == 경남여자상업
    경남예술고등학교 if hsname == 경남예술
    경남외국어고등학교 if hsname == 경남외고
    경남외국어고등학교 if hsname == 경남외국어
    if hsname == 경남은광학교
    경남자동차고등학교 if hsname == 경남자고등학교
    경남자동차고등학교 if hsname == 경남자동차
    경남자영고등학교 if hsname == 경남자영
    경남전자고등학교 if hsname == 경남전자
    경남전자고등학교 if hsname == 경남전자공업
    경남정보고등학교 if hsname == 경남정보
    경남정보고등학교 if hsname == 경남정보과학
    if hsname == 경남종합
    if hsname == 경남진주
    경남체육고등학교 if hsname == 경남체육
    경남항공고등학교 if hsname == 경남항공
    경남해양과학고등학교 if hsname == 경남해양과학
    경북대학교대사범대학부설고등학교 if hsname == 경대사대부고
    경북대학교대사범대학부설고등학교 if hsname == 경대사대부설
    경북대학교대사범대학부설고등학교 if hsname == 경대사대부속고등학교
    경덕여자고등학교 if hsname == 경더여자
    if hsname == 경덕
    경덕공업고등학교 if hsname == 경덕 공업
    경덕공업고등학교 if hsname == 경덕공업
    경덕여자고등학교 if hsname == 경덕여고
    경덕여자고등학교 if hsname == 경덕여자
    경동고등학교 if hsname == 경도
    경동고등학교 if hsname == 경동
    if hsname == 경동방송통신
    if hsname == 경림
    경명여자고등학교 if hsname == 경명
    경명여자고등학교 if hsname == 경명 여자
    경명여자고등학교 if hsname == 경명여자
    if hsname == 경모
    if hsname == 경목
    if hsname == 경목비지니스
    if hsname == 경묵여자상업
    경문고등학교 if hsname == 경문
    경문고등학교 if hsname == 경문(서울소재)
    경민고등학교 if hsname == 경민
    경민IT고등학교 if hsname == 경민IT
    경민IT고등학교 if hsname == 경민it고등학교
    if hsname == 경민고등학교
    if hsname == 경민공고
    if hsname == 경민공업
    if hsname == 경민비즈니스
    if hsname == 경민비즈니스고등학교
    if hsname == 경민비지니스
    경민IT고등학교 if hsname == 경민산업공업고등학교
    if hsname == 경민상업
    경민IT고등학교 if hsname == 경민아이티
    if hsname == 경민여자
    if hsname == 경민여자상업
    if hsname == 경민여자상업고등학교
    if hsname == 경민여자정보고등학교
    if hsname == 경민여정보
    경민IT고등학교 if hsname == 경민정보
    경민IT고등학교 if hsname == 경민정보고
    경민IT고등학교 if hsname == 경민정보산업
    경민IT고등학교 if hsname == 경민정보산업고등학교
    경민IT고등학교 if hsname == 경민정보산업공업
    경민IT고등학교 if hsname == 경민정보산업공업고등학교
    경복고등학교 if hsname == 경복
    경복비즈니스고등학교 if hsname == 경복 비지니스
    경복비즈니스고등학교 if hsname == 경복비즈니스
    경복비즈니스고등학교 if hsname == 경복비지니스
    경복비즈니스고등학교 if hsname == 경복비지니스고등학교
    경복비즈니스고등학교 if hsname == 경복여상
    경복여자고등학교 if hsname == 경복여자
    경복비즈니스고등학교 if hsname == 경복여자비즈니스
    경복비즈니스고등학교 if hsname == 경복여자상업
    경복비즈니스고등학교 if hsname == 경복여자상업고등학교
    경북여자정보고등학교 if hsname == 경복여자정보
    경북여자정보고등학교 if hsname == 경복여자정보고등학교
    경북여자정보고등학교 if hsname == 경복여자정보산업
    경북여자정보고등학교 if hsname == 경봉여자상업
    경북고등학교 if hsname == 경부
    경북여자정보고등학교 if hsname == 경부여자상업
    경북고등학교 if hsname == 경북
    경북공업고등학교 if hsname == 경북 공업
    if hsname == 경북 금오공업
    경북기계공업고등학교 if hsname == 경북 기계공고
    경북기계공업고등학교 if hsname == 경북 기계공업
    경북기계공업고등학교 if hsname == 경북 기계공업고등학교
    if hsname == 경북 여자
    if hsname == 경북 예술
    if hsname == 경북 포항 대동
    if hsname == 경북고내방송통신
    경북고등학교 if hsname == 경북고등
    경북공업고등학교 if hsname == 경북공고
    경북공업고등학교 if hsname == 경북공업
    경북공업고등학교 if hsname == 경북공업고등
    경북과학고등학교 if hsname == 경북과학
    if hsname == 경북과학기술고등학교
    경북관광고등학교 if hsname == 경북관광
    if hsname == 경북금성고등학교
    경북기계공업고등학교 if hsname == 경북기계
    경북기계공업고등학교 if hsname == 경북기계공고
    경북기계공업고등학교 if hsname == 경북기계공업
    경북기계공업고등학교 if hsname == 경북기계금속고등학교
    경북대학교사범대학부설고등학교 if hsname == 경북대 부속
    경북대학교사범대학부설고등학교 if hsname == 경북대 사범대학 부설
    경북대학교사범대학부설고등학교 if hsname == 경북대 사범부속
    경북대학교사범대학부설고등학교 if hsname == 경북대부속
    경북대학교사범대학부설고등학교 if hsname == 경북대사대부설
    경북대학교사범대학부설고등학교 if hsname == 경북대사대부속
    경북대학교사범대학부설고등학교 if hsname == 경북대사대부속고등학교
    경북대학교사범대학부설고등학교 if hsname == 경북대사범대부설
    경북대학교사범대학부설고등학교 if hsname == 경북대사범대학부설
    경북대학교사범대학부설고등학교 if hsname == 경북대학교사대부설
    경북대학교사범대학부설고등학교 if hsname == 경북대학교사대부속
    경북대학교사범대학부설고등학교 if hsname == 경북대학교사범대학부설
    경북대학교사범대학부설고등학교 if hsname == 경북대학사범대학부설
    if hsname == 경북미용예술고등학교
    if hsname == 경북비지니스
    경북대학교사범대학부설고등학교 if hsname == 경북사대부
    경북대학교사범대학부설고등학교 if hsname == 경북사대부고등학교
    경북대학교사범대학부설고등학교 if hsname == 경북사대부설
    경북대학교사범대학부설고등학교 if hsname == 경북사대부속
    경북대학교사범대학부설고등학교 if hsname == 경북사범대학교부속
    경북생활과학고등학교 if hsname == 경북생활과학
    경북여자고등학교 if hsname == 경북여고
    경북여자상업고등학교 if hsname == 경북여상
    경북여자고등학교 if hsname == 경북여자
    경북여자정보고등학교 if hsname == 경북여자 정보
    if hsname == 경북여자공업
    경북여자상업고등학교 if hsname == 경북여자상업
    경북여자정보고등학교 if hsname == 경북여자정보
    경북여자고등학교 if hsname == 경북여자중.고등학교
    경북예술고등학교 if hsname == 경북예고
    경북예술고등학교 if hsname == 경북예술
    경북외국어고등학교 if hsname == 경북외
    경북외국어고등학교 if hsname == 경북외고
    경북외국어고등학교 if hsname == 경북외국어
    경북인터넷고등학교 if hsname == 경북인터넷
    경북자동차고등학교 if hsname == 경북자동차
    if hsname == 경북전자
    if hsname == 경북제일
    경북체육고등학교 if hsname == 경북체육
    if hsname == 경북하이텍고등학교
    경북항공고등학교 if hsname == 경북한공업
    경북항공고등학교 if hsname == 경북항공
    if hsname == 경북후포
    경산고등학교 if hsname == 경산
    경산고등학교 if hsname == 경산고등
    if hsname == 경산문명
    경산여자고등학교 if hsname == 경산여
    경산여자상업고등학교 if hsname == 경산여상고등학교
    경산여자고등학교 if hsname == 경산여자
    경산여자상업고등학교 if hsname == 경산여자상업
    경산여자상업고등학교 if hsname == 경산여자전산
    경산여자상업고등학교 if hsname == 경산여자전산고등학교
    경산여자상업고등학교 if hsname == 경산여자전자고등학교
    경산여자상업고등학교 if hsname == 경산여자정보
    if hsname == 경산자동차
    경상고등학교 if hsname == 경상
    경상공업고등학교 if hsname == 경상 공업
    경상여자고등학교 if hsname == 경상 여자
    경상공업고등학교 if hsname == 경상공업
    경상대학교사범대학부설고등학교 if hsname == 경상대 사대부속
    경상대학교사범대학부설고등학교 if hsname == 경상대학교사범대학부설
    경상대학교사범대학부설고등학교 if hsname == 경상대사대부설고등학교
    경상대학교사범대학부설고등학교 if hsname == 경상대사범대부속
    경상대학교사범대학부설고등학교 if hsname == 경상대사범대학부속
    경상대학교사범대학부설고등학교 if hsname == 경상대학교 사범대학 부설고등학교
    경상대학교사범대학부설고등학교 if hsname == 경상대학교부속고등힉교
    경상대학교사범대학부설고등학교 if hsname == 경상대학교사범대학 부설고등학교
    경상대학교사범대학부설고등학교 if hsname == 경상대학교사범대학부설
    경상대학교사범대학부설고등학교 if hsname == 경상대학사범대부설
    경상대학교사범대학부설고등학교 if hsname == 경상대학사범대학부설
    경상대학교사범대학부설고등학교 if hsname == 경상사대부설
    경상대학교사범대학부설고등학교 if hsname == 경상사대부속
    if hsname == 경상산업고등학교
    경상여자고등학교 if hsname == 경상여자
    경상여자고등학교 if hsname == 경상여자고등학교(구 경상여자상업고등..
    경상여자고등학교 if hsname == 경상여자상업
    경상여자고등학교 if hsname == 경상여자상업고등학교
    if hsname == 경상정보전자
    경성고등학교 if hsname == 경성
    if hsname == 경성 예술
    if hsname == 경성여자
    경성전자고등학교 if hsname == 경성전자
    경성전자고등학교 if hsname == 경성전자고등학교(경성전자정보고등학교)
    경성전자고등학교 if hsname == 경성전자정보
    경성전자고등학교 if hsname == 경성전자정보고등학교
    경성전자고등학교 if hsname == 경성정보통신
    if hsname == 경순
    if hsname == 경신
    경신고등 if hsname == 경신고등학교
    경신여자고등학교 if hsname == 경신여자
    경신정보과학고등학교 if hsname == 경신정보
    경신정보과학고등학교 if hsname == 경신정보과학
    if hsname == 경실
    if hsname == 경아
    경안고등학교 if hsname == 경안
    경안여자고등학교 if hsname == 경안여상
    경안여자고등학교 if hsname == 경안여자
    경안여자고등학교 if hsname == 경안여자정보
    경안여자고등학교 if hsname == 경안여자정보고
    경암고등학교 if hsname == 경암
    if hsname == 경영고등학교
    if hsname == 경영여자
    if hsname == 경영정보
    경운고등학교 if hsname == 경운
    경원고등학교 if hsname == 경원
    경의고등학교 if hsname == 경의
    경희여자고등학교 if hsname == 경의여자고등학교
    경인고등학교 if hsname == 경인
    경인여자고등학교 if hsname == 경인 여자
    if hsname == 경인공업고등학교
    경인여자고등학교 if hsname == 경인여
    경인여자고등학교 if hsname == 경인여자
    인천보건고등학교 if hsname == 경인여자상업고등학교
    인천보건고등학교 if hsname == 경인여자정보상업
    경일고등학교 if hsname == 경일
    경일관광경영고등학교 if hsname == 경일경영정보
    경일고등학교 if hsname == 경일고등
    경일관광경영고등학교 if hsname == 경일관광
    경일관광경영고등학교 if hsname == 경일관광경영
    경일여자고등학교 if hsname == 경일여
    경일여자고등학교 if hsname == 경일여자
    if hsname == 경일여자상업
    경일관광경영고등학교 if hsname == 경일정보산업
    경일관광경영고등학교 if hsname == 경일정보통신
    if hsname == 경일중경영정보고등학교
    if hsname == 경임여자
    경주고등학교 if hsname == 경주
    if hsname == 경주 계림
    if hsname == 경주 정보
    if hsname == 경주감포고등학교
    경주공업고등학교 if hsname == 경주공고
    경주공업고등학교 if hsname == 경주공업
    경주디자인고등학교 if hsname == 경주디자인
    경주문화고등학교 if hsname == 경주문화
    if hsname == 경주상업
    if hsname == 경주신라공업
    경주여자고등학교 if hsname == 경주여자
    경주여자정보고등학교 if hsname == 경주여자상업
    경주여자정보고등학교 if hsname == 경주여자정보
    경주정보고등학교 if hsname == 경주정보
    if hsname == 경주정보처리
    if hsname == 경주종합
    경주화랑고등학교 if hsname == 경주화랑
    경진고등학교 if hsname == 경진
    경포고등학교 if hsname == 경포
    경해고등학교 if hsname == 경해
    경해여자고등학교 if hsname == 경해여자
    경혜여자고등학교 if hsname == 경혜
    경혜여자고등학교 if hsname == 경혜 여자
    경혜여자고등학교 if hsname == 경혜여고
    경혜여자고등학교 if hsname == 경혜여자
    경호고등학교 if hsname == 경호
    if hsname == 경화
    경화여자고등학교 if hsname == 경화 여자
    경화여자E비즈니스고등학교 if hsname == 경화E비즈니스고등학교
    if hsname == 경화고등학교
    if hsname == 경화상업
    경화여자고등학교 if hsname == 경화여고등학교
    경화여자고등학교 if hsname == 경화여자
    경화여자E비즈니스고등학교 if hsname == 경화여자e비즈니스고등학교
    경화여자E비즈니스고등학교 if hsname == 경화여자상업
    경희고등학교 if hsname == 경희
    if hsname == 경희공업
    if hsname == 경희남
    경희여자고등학교 if hsname == 경희여고
    경희여자고등학교 if hsname == 경희여자
    경희여자상업고등학교 if hsname == 경희여자상업
    개금고등학교 if hsname == 계금
    계남고등학교 if hsname == 계남
    if hsname == 계덕여자
    if hsname == 계동
    if hsname == 계동세무
    계룡고등학교 if hsname == 계롱
    계룡고등학교 if hsname == 계룡
    계룡공업고등학교 if hsname == 계룡공
    계룡공업고등학교 if hsname == 계룡공고
    계룡공업고등학교 if hsname == 계룡공업
    계림고등학교 if hsname == 계림
    계명고등학교 if hsname == 계명
    계산고등학교 if hsname == 계산
    계산고등학교 if hsname == 계산고
    계산공업고등학교 if hsname == 계산공업
    계산여자고등학교 if hsname == 계산여자
    계산여자고등학교 if hsname == 계상여자
    계성고등학교 if hsname == 계성
    계성여자상업고등학교 if hsname == 계성 여자상업
    계성여자상업고등학교 if hsname == 계성여
    계성여자상업고등학교 if hsname == 계성여자
    계성여자상업고등학교 if hsname == 계성여자상업
    계성여자상업고등학교 if hsname == 계성여자정보
    계성여자상업고등학교 if hsname == 계성정보
    계성여자상업고등학교 if hsname == 계성정보고등학교
    계성여자상업고등학교 if hsname == 계성정보여자
    if hsname == 계실여자
    if hsname == 계암
    계양고등학교 if hsname == 계양
    if hsname == 계원여자
    계원예술고등학교 if hsname == 계원예
    계원예술고등학교 if hsname == 계원예고
    계원예술고등학교 if hsname == 계원예술
    if hsname == 계포
    if hsname == 계향정보
    if hsname == 계흥공업
    고금고등학교 if hsname == 고금
    고금고등학교 if hsname == 고금고등학교(구/고금종합고)
    고금고등학교 if hsname == 고금종합
    고려대학교사범대학부속고등학교 if hsname == 고대 부속
    고려대학교사범대학부속고등학교 if hsname == 고대부고
    고려대학교사범대학부속고등학교 if hsname == 고대부속
    고려대학교사범대학부속고등학교 if hsname == 고대부속고등학교
    고려대학교사범대학부속고등학교 if hsname == 고대사대
    if hsname == 고등고등학교
    if hsname == 고등전문고등학교
    if hsname == 고란
    고려고등학교 if hsname == 고려
    고려대학교사범대학부속고등학교 if hsname == 고려대사범대부속
    고려고등학교 if hsname == 고려고
    고려대학교사범대학부속고등학교 if hsname == 고려대사범대부속
    고려대학교사범대학부속고등학교 if hsname == 고려대사범부속
    고려대학교사범대학부속고등학교 if hsname == 고려대학교 부속
    고려대학교사범대학부속고등학교 if hsname == 고려대학교 사범대학 부속
    고려대학교사범대학부속고등학교 if hsname == 고려대학교부속
    고려대학교사범대학부속고등학교 if hsname == 고려대학교사범대학부속
    고려대학교사범대학부속고등학교 if hsname == 고려대학부속
    고려대학교사범대학부속고등학교 if hsname == 고려사대부속고등학교
    고령고등학교 if hsname == 고령
    if hsname == 고령공업
    if hsname == 고령대가야
    고령여자종합고등학교 if hsname == 고령여자
    고령여자종합고등학교 if hsname == 고령여자종합
    고명경영고등학교 if hsname == 고명상고
    고명경영고등학교 if hsname == 고명정모산업
    고명경영고등학교 if hsname == 고명정보산업
    고명경영고등학교 if hsname == 고명정보산업고등학교
    고산고등학교 if hsname == 고산
    고산상업고등학교 if hsname == 고산관광정보
    고산상업고등학교 if hsname == 고산상업(제주도)
    if hsname == 고색고등학교
    고성고등학교 if hsname == 고성
    고성중앙고등학교 if hsname == 고성 중앙
    고성중앙고등학교 if hsname == 고성 중앙-
    if hsname == 고성농공
    if hsname == 고성여자
    if hsname == 고성종고
    if hsname == 고성종합
    고성중앙고등학교 if hsname == 고성중앙
    고양고등학교 if hsname == 고양
    if hsname == 고양 실업
    if hsname == 고양 외국어
    if hsname == 고양 화정
    if hsname == 고양가좌고등학교
    if hsname == 고양동산고등학교
    if hsname == 고양무원고등학교
    고양실업고등학교 if hsname == 고양실업
    고양여자고등학교 if hsname == 고양여자
    고양예술고등학교 if hsname == 고양예고등학교
    고양예술고등학교 if hsname == 고양예술
    고양외국어고등학교 if hsname == 고양외
    고양외국어고등학교 if hsname == 고양외고
    고양외국어고등학교 if hsname == 고양외고등학교
    고양외국어고등학교 if hsname == 고양외국어
    if hsname == 고양일고등학교
    고양종합고등학교 if hsname == 고양종합
    고잔고등학교 if hsname == 고잔
    if hsname == 고정
    고창고등학교 if hsname == 고창
    고창북고등학교 if hsname == 고창 북
    고창북고등학교 if hsname == 고창북
    고창여자고등학교 if hsname == 고창여자
    고창영선고등학교 if hsname == 고창영선
    if hsname == 고창해리고등학교
    고척고등학교 if hsname == 고척
    if hsname == 고천외국어
    고한고등학교 if hsname == 고한
    if hsname == 고한여자종합
    if hsname == 고혀
    if hsname == 고현
    if hsname == 고현여자고등학교
    고흥고등학교 if hsname == 고흥
    고흥고등학교 if hsname == 고흥고등학교(구/고흥여상)
    if hsname == 고흥녹동고등학교
    고흥도화고등학교 if hsname == 고흥도화
    고흥산업과학고등학교 if hsname == 고흥산업과학
    고흥실업고등학교 if hsname == 고흥실업
    고흥고등학교 if hsname == 고흥여자상업
    if hsname == 고흥영주고등학교
    if hsname == 고흥영주종합고등학교
    if hsname == 고흥포두고등학교
    곡성고등학교 if hsname == 곡성
    if hsname == 곡성실업
    if hsname == 곡성여자고등학교
    if hsname == 곤암
    곤양고등학교 if hsname == 곤양
    곤지암고등학교 if hsname == 곤지암
    if hsname == 골프
    if hsname == 공군기술
    공군항공과학고등학교 if hsname == 공군항공과학
    if hsname == (구:공군기술고등..
    if hsname == 공남
    공주대학교사범대학부설고등학교 if hsname == 공누사대부속
    공동체비전고등학교 if hsname == 공동체 비전
    공동체비전고등학교 if hsname == 공동체비전
    공산고등학교 if hsname == 공산
    if hsname == 공성
    if hsname == 공실업
    if hsname == 공업
    if hsname == 공업고등학교
    if hsname == 공연예술
    if hsname == 공원
    if hsname == 공의공업
    공주고등학교 if hsname == 공주
    if hsname == 공주 여자
    if hsname == 공주 영명
    공주고등학교 if hsname == 공주고등
    if hsname == 공주공업
    공주금성여자고등학교 if hsname == 공주금성여자
    공주농업고등학교 if hsname == 공주농업
    공주대학교사범대학부설고등학교 if hsname == 공주대학교 사범대학 부설고등학교
    공주대학교사범대학부설고등학교 if hsname == 공주대학교사범대학부설
    공주대학교사범대학부설고등학교 if hsname == 공주대학교사범대학부속
    공주대학교사범대학부설고등학교 if hsname == 공주대학교사법대부설
    if hsname == 공주마이스터고등학교
    공주대학교사범대학부설고등학교 if hsname == 공주사대부
    공주대학교사범대학부설고등학교 if hsname == 공주사대부고
    공주대학교사범대학부설고등학교 if hsname == 공주사대부설
    공주대학교사범대학부설고등학교 if hsname == 공주사대부속
    공주대학교사범대학부설고등학교 if hsname == 공주사대부속고등학교
    공주대학교사범대학부설고등학교 if hsname == 공주사범대학부설
    공주대학교사범대학부설고등학교 if hsname == 공주사범대학부속
    공주생명과학고등학교 if hsname == 공주생명과학
    공주여자고등학교 if hsname == 공주여고
    공주여자고등학교 if hsname == 공주여자
    공주여자고등학교 if hsname == 공주여자ㅏ
    공주여자상업고등학교 if hsname == 공주여자상업
    공주영명고등학교 if hsname == 공주영명
    if hsname == 공주영양
    공주정보고등학교 if hsname == 공주정보
    공주한일고등학교 if hsname == 공주한일
    if hsname == 공포
    공항고등학교 if hsname == 공항
    if hsname == 공항상업
    if hsname == 과수
    if hsname == 과양제철
    과천고등학교 if hsname == 과천
    과천외국어고등학교 if hsname == 과천 외국어
    if hsname == 과천 중앙
    과천여자고등학교 if hsname == 과천여자
    과천외국어고등학교 if hsname == 과천외
    과천외국어고등학교 if hsname == 과천외고
    과천외국어고등학교 if hsname == 과천외국
    과천외국어고등학교 if hsname == 과천외국어
    과천외국어고등학교 if hsname == 과천외대
    과천중앙고등학교 if hsname == 과천중앙
    if hsname == 과학
    if hsname == 과학기술고등학교
    if hsname == 과학영재고등학교
    if hsname == 관광
    if hsname == 관광고등학교
    if hsname == 관광산업
    if hsname == 관광테크노고등학교
    if hsname == 관광해양
    관산고등학교 if hsname == 관산
    if hsname == 관신정보산업
    관악고등학교 if hsname == 관악
    if hsname == 관악여자상업고등학교
    경기글로벌통상고등학교 if hsname == 관악여자정보산업
    경기글로벌통상고등학교 if hsname == 관악정보
    경기글로벌통상고등학교 if hsname == 관악정보고등학교
    경기글로벌통상고등학교 if hsname == 관악정보산업
    경기글로벌통상고등학교 if hsname == 관악정보산업고
    경기글로벌통상고등학교 if hsname == 관악정보산업고등학교
    경기글로벌통상고등학교 if hsname == 관악정보상업고등학교
    관양고등학교 if hsname == 관양
    관인고등학교 if hsname == 관인
    관저고등학교 if hsname == 관저
    관저고등학교 if hsname == 관저(대전)
    관저고등학교 if hsname == 관저6
    관저고등학교 if hsname == 관저고
    관저고등학교 if hsname == 관지
    if hsname == 광교고등학교
    광남고등학교 if hsname == 광남
    if hsname == 광대
    광덕고등학교 if hsname == 광덕
    광동고등학교 if hsname == 광동
    광동여자고등학교 if hsname == 광동여고
    광동여자고등학교 if hsname == 광동여자
    if hsname == 광동종합
    if hsname == 광릉
    광명고등학교 if hsname == 광명
    if hsname == 광명 명문
    광명여자고등학교 if hsname == 광명 여자
    if hsname == 광명 진성
    if hsname == 광명, 광문
    광명공업고등학교 if hsname == 광명공업
    광명북고등학교 if hsname == 광명북
    광명북고등학교 if hsname == 광명북구
    광명여자고등학교 if hsname == 광명여자
    광명정보산업고등학교 if hsname == 광명정보산업
    광문고등학교 if hsname == 광문
    광문고등학교 if hsname == 광문고
    if hsname == 광문전자공업
    if hsname == 광산고등학교
    if hsname == 광산상업고등학교
    if hsname == 광산여자고등학교
    광성고등학교 if hsname == 광선
    광성고등학교 if hsname == 광성
    광성공업고등학교 if hsname == 광성공업
    광신고등학교 if hsname == 광신
    광신정보산업고등학교 if hsname == 광신전자
    광신정보산업고등학교 if hsname == 광신정보
    광신정보산업고등학교 if hsname == 광신정보산업
    광신정보산업고등학교 if hsname == 광신정보상업고등학교
    광신고등학교 if hsname == 광싱
    광양고등학교 if hsname == 광양
    광양여자고등학교 if hsname == 광양 여자
    광양백운고등학교 if hsname == 광양백운
    광양실업고등학교 if hsname == 광양실업
    광양여자고등학교 if hsname == 광양여
    광양여자고등학교 if hsname == 광양여고
    광양여자고등학교 if hsname == 광양여자
    if hsname == 광양예술
    광양제철고등학교 if hsname == 광양재철
    광양제철고등학교 if hsname == 광양제철
    if hsname == 광양하이텍고등학교
    광영고등학교 if hsname == 광영
    광영고등학교 if hsname == 광영남자
    광영여자고등학교 if hsname == 광영여자
    광운고등학교 if hsname == 광운
    광운전자공업고등학교 if hsname == 광운공업
    광운전자공업고등학교 if hsname == 광운전자
    광운전자공업고등학교 if hsname == 광운전자공업
    if hsname == 광원고등학교
    광일고등학교 if hsname == 광일
    광주고등학교 if hsname == 광주
    if hsname == 광주  정보고등학교
    광주제일고등학교 if hsname == 광주  제일
    if hsname == 광주 대동
    if hsname == 광주 대방여고
    if hsname == 광주 서석
    if hsname == 광주 세광
    if hsname == 광주 수피아
    광주여자고등학교 if hsname == 광주 여자
    if hsname == 광주 용성
    if hsname == 광주 은혜학교-장애인학교
    if hsname == 광주 인성
    if hsname == 광주 자연과학
    if hsname == 광주 전산정보고등학교
    if hsname == 광주 전자공업
    if hsname == 광주 정화 여자고등학교
    if hsname == 광주 제일
    if hsname == 광주 제일고
    if hsname == 광주 중앙공립
    if hsname == 광주 체육
    if hsname == 광주건흥
    광주경신여자고등학교 if hsname == 광주경신여자
    if hsname == 광주경영고등학교
    광주고등학교부설방송통신고등학교 if hsname == 광주고등학교부설 방송통신고등학교
    광주고등학교부설방송통신고등학교 if hsname == 광주고등학교부설방송통신
    if hsname == 광주고려
    if hsname == 광주공고
    광주공업고등학교 if hsname == 광주공업
    광주과학고등학교 if hsname == 광주과학
    광주과학고등학교 if hsname == 광주과학고
    if hsname == 광주광덕고등학교
    if hsname == 광주국제
    if hsname == 광주국제고등학교
    if hsname == 광주기계
    if hsname == 광주기계공업
    if hsname == 광주기계공업고등학교
    if hsname == 광주농업
    if hsname == 광주농업고등학교
    if hsname == 광주대광여자
    if hsname == 광주대동
    if hsname == 광주대동고등학교
    if hsname == 광주대성여자
    if hsname == 광주대신고등학교
    if hsname == 광주동선여자
    광주동성고등학교 if hsname == 광주동성
    광주동신고등학교 if hsname == 광주동신
    광주동신여자고등학교 if hsname == 광주동신여자
    if hsname == 광주동아여자
    if hsname == 광주동여자
    if hsname == 광주동일정보고등학교
    광주문성고등학교 if hsname == 광주문성
    광주고등학교부설방송통신고등학교 if hsname == 광주방송통신고등학교
    if hsname == 광주보문고등학교
    if hsname == 광주보훈여자
    if hsname == 광주북구 자연과학
    if hsname == 광주삼육고등학교
    광주상업고등학교 if hsname == 광주상고
    광주상업고등학교 if hsname == 광주상업
    if hsname == 광주생명과학
    if hsname == 광주서광
    광주서석고등학교 if hsname == 광주서석
    광주서진여자고등학교 if hsname == 광주서진여자
    광주서진여자고등학교 if hsname == 광주서진여자고등학교(구/광주옥천여상)
    광주석산고등학교 if hsname == 광주석산
    if hsname == 광주설원예술
    if hsname == 광주설월
    광주세종고등학교 if hsname == 광주세종
    if hsname == 광주송원
    if hsname == 광주숭의공업고등학교
    광주숭일고등학교 if hsname == 광주숭일
    광주수피아여자고등학교 if hsname == 광주스피아여자
    광주여자고등학교 if hsname == 광주여고
    광주여자고등학교 if hsname == 광주여자
    광주여자상업고등학교 if hsname == 광주여자사업
    광주여자상업고등학교 if hsname == 광주여자산업
    광주여자상업고등학교 if hsname == 광주여자상업
    광주예술고등학교 if hsname == 광주예술
    광주서진여자고등학교 if hsname == 광주옥천여자상업
    if hsname == 광주외국인학교
    광주인성고등학교 if hsname == 광주인성
    광주제일고등학교 if hsname == 광주일
    광주제일고등학교 if hsname == 광주일고
    광주자동화설비공업고등학교 if hsname == 광주자동차설비
    광주자동화설비공업고등학교 if hsname == 광주자동화설비공업
    if hsname == (구: 광주정..
    광주자연과학고등학교 if hsname == 광주자연과학
    광주자연과학고등학교 if hsname == 광주자연과학고등학교(구/광주농업고등..
    광주전산고등학교 if hsname == 광주전산
    광주전산고등학교 if hsname == 광주전산고등학교(구: 광산상업고등학교)
    광주전자공업고등학교 if hsname == 광주전자
    광주전자공업고등학교 if hsname == 광주전자공업
    if hsname == 광주전진
    광주자동화설비공업고등학교 if hsname == 광주정보
    광주자동화설비공업고등학교 if hsname == 광주정보고등학교
    광주자동화설비공업고등학교 if hsname == 광주정보산업
    광주제일고등학교 if hsname == 광주제일
    광주제일고등학교 if hsname == 광주제일고
    광주종합고등학교 if hsname == 광주종
    광주종합고등학교 if hsname == 광주종합
    광주중앙고등학교 if hsname == 광주중앙
    광주중앙고등학교 if hsname == 광주중앙고등학 교
    광주중앙여자고등학교 if hsname == 광주중앙여
    광주중앙여자고등학교 if hsname == 광주중앙여자
    광주진흥고등학교 if hsname == 광주진흥
    광주체육고등학교 if hsname == 광주체육
    광주체육고등학교 if hsname == 광주체육고등학 교
    if hsname == 광주풍암
    if hsname == 광진
    if hsname == 광진 자양
    광천고등학교 if hsname == 광천
    if hsname == 광천상업
    if hsname == 광천정보
    광천제일고등학교 if hsname == 광천제일
    광탄고등학교 if hsname == 광탄
    if hsname == 광편 정보
    if hsname == 광평
    광혜원고등학교 if hsname == 광혜원
    광희고등학교 if hsname == 광희
    괴산고등학교 if hsname == 괴산
    괴산고등학교 if hsname == 괴산고등
    괴정고등학교 if hsname == 괴정
    교동고등학교 if hsname == 교동
    if hsname == 교문여자정보
    if hsname == 교원
    if hsname == 교원대 부설
    if hsname == 교원대부설
    if hsname == 교육대 부설
    if hsname == 교하
    if hsname == 교하고등학교
    if hsname == 구광공업
    if hsname == 구남
    if hsname == 구남보건
    if hsname == 구남보건고등학교
    if hsname == 구남여자?보
    if hsname == 구남여자고등학교
    if hsname == 구남여자상업
    if hsname == 구남여자정보고등학교
    if hsname == 구남자고등학교
    if hsname == 구남정보
    if hsname == 구남정보고등학교
    if hsname == 구덕
    if hsname == 구덕고등학교
    if hsname == 구도여자
    구례고등학교 if hsname == 구례
    구례고등학교 if hsname == 구례고
    구례농업고등학교 if hsname == 구례농업
    if hsname == 구례여자
    if hsname == 구례자연
    구로고등학교 if hsname == 구로
    구로고등학교 if hsname == 구로고
    if hsname == 구로여자
    if hsname == 구로여자산업고등학교
    if hsname == 구로여자상업
    if hsname == 구로여자정보산업
    if hsname == 구로여자정보산업고등학교
    if hsname == 구룡포
    if hsname == 구룡포여자종합고등학교
    if hsname == 구룡포종합
    if hsname == 구룡포종합고등학교
    if hsname == 구류여자정보고등학교
    구리고등학교 if hsname == 구리
    구리고등학교 if hsname == 구리고
    구리여자고등학교 if hsname == 구리여고
    구리여자고등학교 if hsname == 구리여자
    구리인창고등학교 if hsname == 구리인창
    구림공업고등학교 if hsname == 구림
    구림공업고등학교 if hsname == 구림공업
    if hsname == 구명고등학교
    if hsname == 구미
    구미 경구 if hsname == 구미고등학교
    if hsname == 구미 금오여고
    if hsname == 구미 금오여자
    if hsname == 구미 사곡
    if hsname == 구미 여자
    if hsname == 구미(구미시)
    if hsname == 구미경구
    if hsname == 구미고등학교부설 방송통신고등학교
    if hsname == 구미공고
    if hsname == 구미공업
    구미금오고등학교 if hsname == 구미금오
    if hsname == 구미금호
    if hsname == 구미도계
    if hsname == 구미모삼
    if hsname == 구미방송
    구미여자고등학교 if hsname == 구미여자
    구미여자상업고등학교 if hsname == 구미여자상업
    if hsname == 구미여자정보
    if hsname == 구미오상
    구미전자공업고등학교 if hsname == 구미전자
    구미전자공업고등학교 if hsname == 구미전자공업
    구미정보고등학교 if hsname == 구미정보
    구미정보여자고등학교 if hsname == 구미정보여자
    if hsname == 구미현일
    구미전자공업고등학교 if if hsname == 구민전자공업
    if hsname == 구봉
    구성고등학교 if hsname == 구성
    구암고등학교 if hsname == 구암
    if hsname == 구영여자
    if hsname == 구용
    구일고등학교 if hsname == 구일
    구정고등학교 if hsname == 구정
    if hsname == 구포
    if hsname == 구포여자상업
    if hsname == 구현고등학교
    if hsname == 구호고등학교
    if hsname == 국내
    if hsname == 국리전통예술
    if hsname == 국립 국악
    구미전자공업고등학교 if hsname == 국립구미전자공업고등학교
    국립국악고등학교 if hsname == 국립국악
    국립국악고등학교 if hsname == 국립국악고등
    국립국악고등학교 if hsname == 국립국악고등고등학교
    국립전통예술고등학교 if hsname == 국립국악예술고등학교
    if hsname == 국립부산해사고등학교
    if hsname == 국립부산해사고등학교(부산해양고)
    국립전통예술고등학교 if hsname == 국립전통예술
    국립전통예술고등학교 if hsname == 국립전통예술중고등학교
    if hsname == 국립해사
    if hsname == 국무기계공업
    국립전통예술고등학교 if hsname == 국민전통예술
    if hsname == 국산기계공업
    국립국악고등학교 if hsname == 국악
    국립국악고등학교 if hsname == 국악고등학교
    국립전통예술고등학교 if hsname == 국악예술
    국립전통예술고등학교 if hsname == 국악예술고등학교
    if hsname == 국원고등학교
    if hsname == 국제
    if hsname == 국제  금융
    if hsname == 국제고등학교
    if hsname == 국제금융고등학교
    if hsname == 국제물류고등학교
    if hsname == 국제영화
    if hsname == 국제외
    국제외국어고등학교 if hsname == 국제외국어
    if hsname == 국제컨벤션고등학교
    if hsname == 국제통상
    if hsname == 국제통상고등학교
    if hsname == 국제통상고등학교고등학교
    if hsname == 국제통상고등학교
    if hsname == 국제통상부
    if hsname == 국제통상학교
    if hsname == 국제특성화고등학교
    if hsname == 군남종합
    군북고등학교 if hsname == 군북
    군산고등학교 if hsname == 군산
    if hsname == 군산 남
    if hsname == 군산 여자
    if hsname == 군산 영광
    if hsname == 군산 영광 여자
    군산고등학교 if hsname == 군산고
    군산기계공업고등학교 if hsname == 군산공업고등학교
    군산기계공업고등학교 if hsname == 군산기歌騙?
    군산기계공업고등학교 if if hsname == 군산기계
    군산기계공업고등학교 if hsname if hsname == 군산기계고등학교
    군산기계공업고등학교 if hsname == 군산기계공업
    군산기계공업고등학교 if hsname == 군산기계공업고등학교(구/군산공업고)
    군산남고등학교 if hsname == 군산남
    군산남고등학교 if hsname == 군산남자고등학교
    군산동고등학교 if hsname == 군산동
    군산동고등학교 if hsname == 군산동고
    if hsname == 군산려자상업
    if hsname == 군산상업
    if hsname == 군산상업고등학교
    군산여자고등학교 if hsname == 군산여고
    군산여자고등학교 if hsname == 군산여자
    if hsname == 군산여자상업
    if hsname == 군산여자상업고등학교
    군산영광여자고등학교 if hsname == 군산영광 여자
    군산영광여자고등학교 if hsname == 군산영광여자
    if hsname == 군산예상
    군산제일고등학교 if hsname == 군산제일
    군산중앙고등학교 if hsname == 군산중앙
    군산중앙여자고등학교 if hsname == 군산중앙여고
    군산중앙여자고등학교 if hsname == 군산중앙여자
    군산평화고등학교 if hsname == 군산평화
    if hsname == 군서고등학교
    if hsname == 군성
    if hsname == 군암여자정보고등학교
    군위고등학교 if hsname == 군위
    군위여자고등학교 if hsname == 군위여자
    if hsname == 군위여자상업고등학교
    군위정보고등학교 if hsname == 군위정보
    군자공업고등학교 if hsname == 군자
    군자공업고등학교 if hsname == 군자공업
    군자공업고등학교 if hsname == 군자공업고등
    군포고등학교 if hsname == 군토
    군포고등학교 if hsname == 군포
    군포용호고등학교 if hsname == 군포 용호
    군포용호고등학교 if hsname == 군포 용호고등학교
    군포e비즈니스고등학교 if hsname == 군포 정보산업
    군포e비즈니스고등학교 if hsname == 군포E비즈니스
    군포e비즈니스고등학교 if hsname == e비즈니스고등학교(구/군포정보산업..
    군포e비즈니스고등학교 if hsname == 군포e비지니스
    군포용호고등학교 if hsname == 군포용호
    군포e비즈니스고등학교 if hsname == 군포이비지니스
    군포e비즈니스고등학교 if hsname == 군포정보
    군포e비즈니스고등학교 if hsname == 군포정보산업
    군포e비즈니스고등학교 if hsname == 군포정보산업고등학교
    if hsname == 궁고별
    if hsname == 권상
    권선고등학교 if hsname == 권선
    if hsname == 균산여자
    if hsname == 극성
    if hsname == 근덕
    근명여자정보고등학교 if hsname == 근명
    근명여자정보고등학교 if hsname == 근명여자
    근명여자정보고등학교 if hsname == 근명여자상업고등학교
    근명여자정보고등학교 if hsname == 근명여자정보
    근명여자정보고등학교 if hsname == 근명여자정보상업
    근영여자고등학교 if hsname == 근영
    근영여자고등학교 if hsname == 근영 여자
    근영여자고등학교 if hsname == 근영여고
    근영여자고등학교 if hsname == 근영여자
    근명여자정보고등학교 if hsname == 근영여자정보
    근화여자고등학교 if hsname == 근하
    근화여자고등학교 if hsname == 근화
    근화여자고등학교 if hsname == 근화 여자
    근화여자고등학교 if hsname == 근화여자
    if hsname == 글로벌경영
    if hsname == 금
    금곡고등학교 if hsname == 금곡
    금곡종합고등학교 if hsname == 금곡종합
    금남고등학교 if hsname == 금남
    금남고등학교 if hsname == 금남자고등학교
    if hsname == 금당
    금명여자고등학교 if hsname == 금명여자
    근명여자정보고등학교 if hsname == 금명여자정보
    근명여자정보고등학교 if hsname == 금명정보
    금산고등학교 if hsname == 금산
    금산고등학교 if hsname == 금산고
    금산산업고등학교 if hsname == 금산산업
    금산여자고등학교 if hsname == 금산여자
    금산종합고등학교 if hsname == 금산종합
    금성고등학교 if hsname == 금성
    if hsname == 금성상심
    if hsname == 금성여자
    if hsname == 금성여자상업
    if hsname == 금신여자
    금암고등학교 if hsname == 금암
    if hsname == 금암공업
    금오고등학교 if hsname == 금오
    금오공업고등학교 if hsname == 금오공업
    금오여자고등학교 if hsname == 금오여자
    금옥여자고등학교 if hsname == 금옥
    금옥여자고등학교 if hsname == 금옥여자
    if hsname == 금왕
    if hsname == 금왕공업
    if hsname == 금융고등학교
    금일고등학교 if hsname == 금일
    금정고등학교 if hsname == 금정
    금정여자고등학교 if hsname == 금정 여자
    금정전자공업고등학교 if hsname == 금정 전자공업
    금정전자공업고등학교 if hsname == 금정공업
    금정여자고등학교 if hsname == 금정여고
    금정여자고등학교 if hsname == 금정여자
    금정전자고등학교 if hsname == 금정전자
    금정전자공업고등학교 if hsname == 금정전자공업
    if hsname == 금좌
    금천고등학교 if hsname == 금천
    금촌고등학교 if hsname == 금촌
    금파공업고등학교 if hsname == 금파
    금파공업고등학교 if hsname == 금파공고
    금파공업고등학교 if hsname == 금파공업
    금호고등학교 if hsname == 금호
    금호공업고등학교 if hsname == 금호공업
    금호여자고등학교 if hsname == 금호여자
    금호중앙여자고등학교 if hsname == 금호중앙여자
    금화여자고등학교 if hsname == 금화여자
    if hsname == 기계
    if hsname == 기계고등학교
    if hsname == 기계공고
    if hsname == 기계공업
    if hsname == 기계공업고등학교
    기린고등학교 if hsname == 기린
    if hsname == 기림
    기장고등학교 if hsname == 기장
    if hsname == 기전
    if hsname == 기전여고
    if hsname == 기전여자
    if hsname == 기타
    기흥고등학교 if hsname == 기홍
    기흥고등학교 if hsname == 기흥
    if hsname == 길성
    if hsname == 길신
    if hsname == 길안여자
    if hsname == 길원
    if hsname == 길원여자
    if hsname == 길원여자고등학교
    if hsname == 길음여자
    if hsname == 길지고등학교
    if hsname == 김고
    김제고등학교 if hsname == 김제
    if hsname == 김제 여자
    김제고등학교 if hsname == 김제고등
    if hsname == 김제덕암
    if hsname == 김제만경여자
    if hsname == 김제북
    if hsname == 김제북고
    if hsname == 김제상업
    김제서고등학교 if hsname == 김제서
    김제여자고등학교 if hsname == 김제여
    김제여자고등학교 if hsname == 김제여자
    김제자영고등학교 if hsname == 김제자영
    김제자영고등학교 if hsname == 김제자영고등학교(김제농고)
    if hsname == 김제제일
    김천고등학교 if hsname == 김천
    if hsname == 김천 상업
    if hsname == 김천 성의
    if hsname == 김천 아포 공업
    김천농공고등학교 if hsname == 김천농
    김천농공고등학교 if hsname == 김천농공
    김천농공고등학교 if hsname == 김천농립
    김천농공고등학교 if hsname == 김천농업
    김천상업고등학교 if hsname == 김천상업
    if hsname == 김천생명과학고등학교
    if hsname == 김천성의
    if hsname == 김천성의여자상업
    김천여자고등학교 if hsname == 김천여고
    김천여자고등학교 if hsname == 김천여자
    김천예술고등학교 if hsname == 김천예술
    김천중앙고등학교 if hsname == 김천중앙
    김천중앙고등학교부설방송통신고등학교 if hsname == 김천중앙고 부설 방송통신고등학교
    김천중앙고등학교부설방송통신고등학교 if hsname == 김천중앙고부설방송통신고등학교
    김천중앙고등학교부설방송통신고등학교 if hsname == 김천중앙고부설방송통신고등학교
    if hsname == 김천한일고등학교
    if hsname == 김천한일여자고등학교
    김포고등학교 if hsname == 김포
    if hsname == 김포 제일
    if hsname == 김포기계공업고등학교
    if hsname == 김포여자종합
    if hsname == 김포외국어
    if hsname == 김포외국어고등학교
    if hsname == 김포제업
    if hsname == 김포제일
    if hsname == 김포제일고등학교
    if hsname == 김포제일고등학교(구:김포공업고등학교)
    if hsname == 김포제일공업고등학교
    if hsname == 김포종고
    if hsname == 김포풍무고등학교
    if hsname == 김해
    if hsname == 김해 가야고등학교
    if hsname == 김해 건설공업
    if hsname == 김해 경운
    if hsname == 김해 분성여자
    if hsname == 김해 영훈
    if hsname == 김해가야
    if hsname == 김해가야고등학교
    if hsname == 김해건설
    if hsname == 김해건설고
    if hsname == 김해건설공업
    if hsname == 김해건설공업고등학교
    if hsname == 김해경원
    if hsname == 김해경원고등학교
    if hsname == 김해고등학교
    if hsname == 김해농공
    if hsname == 김해농업
    if hsname == 김해농업고등학교
    if hsname == 김해대청
    if hsname == 김해대청고등학교
    if hsname == 김해문성여자고등학교
    if hsname == 김해병원
    if hsname == 김해분성
    if hsname == 김해분성고등학교
    if hsname == 김해분성여자
    if hsname == 김해분성여자고등학교
    if hsname == 김해삼문
    if hsname == 김해삼문고등학교
    if hsname == 김해삼방고등학교
    if hsname == 김해생명과학
    if hsname == 김해생명과학고등학교
    if hsname == 김해생명과학고등학교(김해농업고등학교)
    if hsname == 김해실업고등학교
    if hsname == 김해여자
    if hsname == 김해여자고등하교
    if hsname == 김해여자고등학교
    if hsname == 김해여자상업
    if hsname == 김해영운
    if hsname == 김해영운고등학교
    if hsname == 김해외국어
    if hsname == 김해외국어고등학교
    if hsname == 김해장유
    if hsname == 김해제일
    if hsname == 김해중앙여고
    if hsname == 김해중앙여자
    if hsname == 김해중앙여자고등학교
    if hsname == 김해한일여자
    if hsname == 김해한일여자고등학교
    if hsname == 김호외국어고등학교
    if hsname == 김화
    if hsname == 김화고등학교
    if hsname == 김화공업
    if hsname == 김화공업고등학교
    if hsname == 나로
    if hsname == 나로고등학교
    if hsname == 나루고등학교
    if hsname == 나산
    if hsname == 나산고등학교
    if hsname == 나주
    if hsname == 나주  금성
    if hsname == 나주고등학교
    if hsname == 나주공
    if hsname == 나주공업
    if hsname == 나주공업고등학교
    if hsname == 나주광남고등학교
    if hsname == 나주광남자고등학교
    if hsname == 나주금성
    if hsname == 나주금성고등학교
    if hsname == 나주상업
    if hsname == 나주상업고등학교
    if hsname == 나주여자
    if hsname == 나주여자고등학교(구:나주여자상업고등..
    if hsname == 나주여자상업
    if hsname == 나주영산
    if hsname == 나주영산고등학교
    if hsname == 낙동
    if hsname == 낙동고등학교
    if hsname == 낙생
    if hsname == 낙생고등학교
    if hsname == 낙선
    if hsname == 남
    if hsname == 남강
    if hsname == 남강고등학교
    if hsname == 남경
    if hsname == 남경여자종합
    if hsname == 남교
    if hsname == 남기
    if hsname == 남년
    if hsname == 남녕
    if hsname == 남녕고등학
    if hsname == 남녕고등학교
    if hsname == 남당
    if hsname == 남대전
    if hsname == 남대전고등학교
    if hsname == 남동
    if hsname == 남면고등학교
    if hsname == 남명
    if hsname == 남목
    if hsname == 남목고등학교
    if hsname == 남무
    if hsname == 남문
    if hsname == 남문고등학교
    if hsname == 남문상업고등학교
    if hsname == 남부
    if hsname == 남부고등학교
    if hsname == 남산
    if hsname == 남산(대구)
    if hsname == 남산고
    if hsname == 남산고등학교
    if hsname == 남산여자
    if hsname == 남산여자고등학교
    if hsname == 남생
    if hsname == 남성
    if hsname == 남성고등학교
    if hsname == 남성여
    if hsname == 남성여고
    if hsname == 남성여자
    if hsname == 남성여자고등학교
    if hsname == 남악고등학교
    if hsname == 남얀
    if hsname == 남양
    if hsname == 남양고등학교
    if hsname == 남양주
    if hsname == 남양주공업
    if hsname == 남양주공업고등학교
    if hsname == 남양주광동고등학교
    if hsname == 남여자상업
    if hsname == 남영
    if hsname == 남영고등학교
    if hsname == 남원
    if hsname == 남원고등학교
    if hsname == 남원국악
    if hsname == 남원국악예술
    if hsname == 남원국악예술고등학교
    if hsname == 남원서진여자
    if hsname == 남원서진여자고등학교
    if hsname == 남원성원
    if hsname == 남원여고
    if hsname == 남원여자
    if hsname == 남원여자고등학교
    if hsname == 남원여자상업
    if hsname == 남원여자정보고등학교
    if hsname == 남원용성
    if hsname == 남원용성고등학교
    if hsname == 남원제일
    if hsname == 남원제일고등학교
    if hsname == 남원제일고등학교(구/남원여자정보고)
    if hsname == 남원제일여자상업
    if hsname == 남인천
    if hsname == 남인천고등학교
    if hsname == 남일
    if hsname == 남일고등학교
    if hsname == 남일초중고등학교
    if hsname == 남임
    if hsname == 남정여자
    if hsname == 남주
    if hsname == 남주고등학교
    if hsname == 남지
    if hsname == 남지고등학교
    if hsname == 남창
    if hsname == 남창고등학교
    if hsname == 남한
    if hsname == 남한고등학교
    if hsname == 남해
    if hsname == 남해 제일
    if hsname == 남해고등학교
    if hsname == 남해상업
    if hsname == 남해여자
    if hsname == 남해여자고등학교
    if hsname == 남해정보산업
    if hsname == 남해정보산업고등학교
    if hsname == 남해제일
    if hsname == 남해제일고등학교
    if hsname == (구/남해여고/남해종합..
    if hsname == 남해종합
    if hsname == 남해해성
    if hsname == 남해해성고등학교
    if hsname == 낭주
    if hsname == 내국
    if hsname == 내면
    if hsname == 내면고등학교
    if hsname == 내서여
    if hsname == 내서여자
    if hsname == 내성
    if hsname == 내성고등학교
    if hsname == 내향
    if hsname == 내향여자정보
    if hsname == 내향정보
    if hsname == 냉신
    if hsname == 노원
    if hsname == 노원고등학교
    if hsname == 노은
    if hsname == 노은그등학교
    if hsname == 노화
    if hsname == 노화고등학교
    if hsname == 노화종합
    if hsname == 녹동
    if hsname == 녹동고등학교
    if hsname == 논산
    if hsname == 논산 대건
    if hsname == 논산 여자
    if hsname == 논산고등학교
    if hsname == 논산공
    if hsname == 논산공업
    if hsname == 논산공업고등학교
    if hsname == 논산농업고등학교
    if hsname == 논산대건
    if hsname == 논산대건고등학교
    if hsname == 논산대림고
    if hsname == 논산대원
    if hsname == 논산대진
    if hsname == 논산여자
    if hsname == 논산여자고등학교
    if hsname == 논산여자상업
    if hsname == 논산여자상업고등학교
    if hsname == 논산연무
    if hsname == 논산연무기계공
    if hsname == 논산연무기계공업
    if hsname == 논현
    if hsname == 논현고등학교
    if hsname == 농고
    if hsname == 농공
    if hsname == 농공고등학교
    if hsname == 농공업중앙
    if hsname == 농노고등학교
    if hsname == 농북공업
    if hsname == 농생명(경기 수원)
    if hsname == 농서
    if hsname == 농소
    if hsname == 농소고등학교
    if hsname == 농업
    if hsname == 농업고등학교
    if hsname == 농원
    if hsname == 농인
    if hsname == 농잠
    if hsname == 누원
    if hsname == 누원고등학교
    if hsname == 눈산여자
    if hsname == 늘푸른
    if hsname == 늘푸른고등학교
    if hsname == 능곡
    if hsname == 능곡고등학교
    if hsname == 능동고등학교
    if hsname == 능인
    if hsname == 능인고등학교
    if hsname == 능주
    if hsname == 능주고등학교
    if hsname == 다곡
    if hsname == 다대
    if hsname == 다대고등학교
    if hsname == 다래
    if hsname == 다사
    if hsname == 다사고등학교
    if hsname == 다산
    if hsname == 다산고등학교
    if hsname == 다운
    if hsname == 다운고등학교
    if hsname == 다이스트기술
    if hsname == 다인
    if hsname == 다인정보고등학교(다인종합고등학교)
    if hsname == 다인중정보
    if hsname == 다잔
    if hsname == 다향고등학교
    if hsname == 단곡
    if hsname == 단국
    if hsname == 단국공업
    if hsname == 단국공업고등학교
    if hsname == 단국대부속
    if hsname == 단국대사대무
    if hsname == 단국대사범대부속
    if hsname == 단국대학교 사범대학 부속
    if hsname == 단국대학교부속
    if hsname == 단국대학교사범대학부속
    if hsname == 단국대학교사범대학부속고등학교
    if hsname == 단국대학부속
    if hsname == 단대부
    if hsname == 단대부고
    if hsname == 단대부속
    if hsname == 단대부속고등학교
    if hsname == 단산
    if hsname == 단성
    if hsname == 단성고등학교
    if hsname == 단양
    if hsname == 단양고등학교
    if hsname == 단양공업
    if hsname == 단양공업고등학교
    if hsname == 단양상업고등학교
    if hsname == 단원
    if hsname == 단원고등학교
    if hsname == 단월상업
    if hsname == 단일공업
    if hsname == 달구벌고등학교
    if hsname == 달서
    if hsname == 달서고등학교
    if hsname == 달서공업
    if hsname == 달서공업고등학교
    if hsname == 달성
    if hsname == 달성고등학교
    if hsname == 달성공업고등학교
    if hsname == 달성정보
    if hsname == 달성정보고등학교
    if hsname == 달천고등학교
    if hsname == 담양
    if hsname == 담양고등학교
    if hsname == 담양공고
    if hsname == 담양공업
    if hsname == 담양공업고등학교
    if hsname == 담양여자
    if hsname == 담양한빛고등학교
    if hsname == 당곡
    if hsname == 당곡고등학교
    if hsname == 당류고등학교
    if hsname == 당문역
    if hsname == 당산
    if hsname == 당산고등학교
    if hsname == 당성여자상업
    if hsname == 당진
    if hsname == 당진 신평
    if hsname == 당진고등학교
    if hsname == 당진상업
    if hsname == 당진여자
    if hsname == 당진정보
    if hsname == 당진정보고등학교
    if hsname == 당진호서
    if hsname == 대가대부속무학
    if hsname == 대가야
    if hsname == 대가야고등학교
    if hsname == 대건
    if hsname == 대건고등학교
    if hsname == 대건남자
    if hsname == 대경
    if hsname == 대경고
    if hsname == 대경상업
    if hsname == 대경정보
    if hsname == 대경정보산업
    if hsname == 대경정보산업고등학교
    if hsname == 대곡
    if hsname == 대곡고등학교
    if hsname == 대공
    if hsname == 대관령고등학교
    if hsname == 대관령종합
    if hsname == 대광
    if hsname == 대광고등학교
    if hsname == 대광공고
    if hsname == 대광공업
    if hsname == 대광공업고등학교
    if hsname == 대광발명
    if hsname == 대광발명고등학교
    if hsname == 대광발명과학고등학교
    if hsname == 대광여자
    if hsname == 대광여자고등학교
    if hsname == 대구
    if hsname == 대구 강동
    if hsname == 대구 경원
    if hsname == 대구 공업
    if hsname == 대구 구암
    if hsname == 대구 남산
    if hsname == 대구 동부
    if hsname == 대구 동부고등학교
    if hsname == 대구 상원
    if hsname == 대구 서구 공업
    if hsname == 대구 시지
    if hsname == 대구 여자
    if hsname == 대구 오성
    if hsname == 대구 외국어
    if hsname == 대구 자연과학고등학교
    if hsname == 대구 정화 여자
    if hsname == 대구 제일
    if hsname == 대구 중앙고등학교
    if hsname == 대구 포성
    if hsname == 대구 협성
    if hsname == 대구가톨릭대사범대부속무학고등학교
    if hsname == 대구가톨릭대학교사범대학부속무학
    if hsname == 대구가톨릭대학교사범대학부속무학고등..
    if hsname == 대구강동고등학교
    if hsname == 대구강북
    if hsname == 대구개성
    if hsname == 대구경덕여자
    if hsname == 대구경명여자
    if hsname == 대구경북
    if hsname == 대구경북여자상업
    if hsname == 대구경북여자정보
    if hsname == 대구경상
    if hsname == 대구경상고등학교
    if hsname == 대구경상공업
    if hsname == 대구경성여자고등학교
    if hsname == 대구경신
    if hsname == 대구경신고등학교
    if hsname == 대구경원
    if hsname == 대구경원고등학교
    if hsname == 대구경일여자
    if hsname == 대구경일여자고등학교
    if hsname == 대구경화여자
    if hsname == 대구경화여자고등학교
    if hsname == 대구고등
    if hsname == 대구고등학교
    if hsname == 대구고등학교부설방송통신고등학교
    if hsname == 대구공업
    if hsname == 대구공업고등학교
    if hsname == 대구과학
    if hsname == 대구과학고등
    if hsname == 대구과학고등학교
    if hsname == 대구관광
    if hsname == 대구관광고등학교
    if hsname == 대구관광정보
    if hsname == 대구광명고등학교
    if hsname == 대구구암
    if hsname == 대구구암고등학교
    if hsname == 대구남산
    if hsname == 대구남산고등학교
    if hsname == 대구남산여자
    if hsname == 대구남신여자
    if hsname == 대구농림
    if hsname == 대구농림고등학교
    if hsname == 대구농업
    if hsname == 대구농업마이스터고등학교
    if hsname == 대구다사
    if hsname == 대구달서공업
    if hsname == 대구달서공업고등학교
    if hsname == 대구대건고등학교
    if hsname == 대구대곡
    if hsname == 대구대곡고등학교
    if hsname == 대구대원고등학교
    if hsname == 대구대전고등학교
    if hsname == 대구대진
    if hsname == 대구대진고등학교
    if hsname == 대구덕원
    if hsname == 대구도원
    if hsname == 대구동문
    if hsname == 대구동문고등학교
    if hsname == 대구동부
    if hsname == 대구동부고등학교
    if hsname == 대구동부공업
    if hsname == 대구동부공업고등학교
    if hsname == 대구동신
    if hsname == 대구방송통신고등학교
    if hsname == 대구사범대학부속
    if hsname == 대구상고
    if hsname == 대구상서
    if hsname == 대구상서여자정보고등학교
    if hsname == 대구상서정보
    if hsname == 대구상업
    if hsname == 대구상업정보고등학교
    if hsname == 대구상원
    if hsname == 대구상원고등학교
    if hsname == 대구서부
    if hsname == 대구서부고등학교
    if hsname == 대구서부공업
    if hsname == 대구서부공업고등학교
    if hsname == 대구성광
    if hsname == 대구성산
    if hsname == 대구성산고등학교
    if hsname == 대구성서
    if hsname == 대구성일여자고등학교
    if hsname == 대구성화여자고등학교
    if hsname == 대구수성고등학교
    if hsname == 대구시지
    if hsname == 대구시지고등학교
    if hsname == 대구여상
    if hsname == 대구여상고등학교
    if hsname == 대구여자
    if hsname == 대구여자경영정보
    if hsname == 대구여자고등학교
    if hsname == 대구여자상서
    if hsname == 대구여자상업
    if hsname == 대구여자상업고등학교
    if hsname == 대구영남공업
    if hsname == 대구영산
    if hsname == 대구영신
    if hsname == 대구영신고등학교
    if hsname == 대구영진
    if hsname == 대구예술
    if hsname == 대구예술여자
    if hsname == 대구오성
    if hsname == 대구오성고등학교
    if hsname == 대구와룡
    if hsname == 대구와룡고등학교
    if hsname == 대구외고
    if hsname == 대구외국어
    if hsname == 대구외국어고등학교
    if hsname == 대구운암고등학교
    if hsname == 대구일마이스터고등학교
    if hsname == 대구자연
    if hsname == 대구자연과학
    if hsname == 대구자연과학고등
    if hsname == 대구자연과학고등학교
    if hsname == 대구자연과학고등학교(구/대구농림고)
    if hsname == 대구전자
    if hsname == 대구전자공업
    if hsname == 대구전자공업고등학교
    if hsname == 대구정동
    if hsname == 대구정화여자
    if hsname == 대구제일
    if hsname == 대구제일고등학교
    if hsname == 대구제일여자상업
    if hsname == 대구제일여자상업고등학교
    if hsname == 대구제일여자정보
    if hsname == 대구제일여자정보고등학교
    if hsname == 대구중앙
    if hsname == 대구중앙고등학교
    if hsname == 대구중앙상업고등학교
    if hsname == 대구청구
    if hsname == 대구체육
    if hsname == 대구체육고등학교
    if hsname == 대구카톨릭대부속
    if hsname == 대구학남
    if hsname == 대구혜화
    if hsname == 대구혜화여자
    if hsname == 대구혜화여자고등학교
    if hsname == 대구화원고등학교
    if hsname == 대군
    if hsname == 대균
    if hsname == 대기
    if hsname == 대기(제주)
    if hsname == 대기고등학교
    if hsname == 대기상업
    if hsname == 대남
    if hsname == 대덕
    if hsname == 대덕 공업
    if hsname == 대덕고
    if hsname == 대덕고등학교
    if hsname == 대덕공업
    if hsname == 대덕공업고등학교
    if hsname == 대덕여자
    if hsname == 대덕여자고등학교
    if hsname == 대덕전자기계
    if hsname == 대덕전자기계고등학교
    if hsname == 대덕전자기계고등학교(구:대덕공업고등..
    if hsname == 대덕전자기계공업
    if hsname == 대덕전자기계공업고등학교
    if hsname == 대덕종합
    if hsname == 대덕종합고등학교
    if hsname == 대동
    if hsname == 대동고등학교
    if hsname == 대동고등학교고등학교
    if hsname == 대동기계공고
    if hsname == 대동기계공업
    if hsname == 대동기계공업고등학교
    if hsname == 대동상업
    if hsname == 대동상업고등학교
    if hsname == 대동세무
    if hsname == 대동세무고
    if hsname == 대동세무고등학교
    if hsname == 대동정보고등학교
    if hsname == 대동정보산업
    if hsname == 대동정보산업고등학교
    if hsname == 대력종합
    if hsname == 대룡공업고등학교
    if hsname == 대륜
    if hsname == 대륜고등
    if hsname == 대륜고등학교
    if hsname == 대림
    if hsname == 대림고등학교
    if hsname == 대림여자
    if hsname == 대면
    if hsname == 대명
    if hsname == 대명고등학교
    if hsname == 대명여고
    if hsname == 대명여자
    if hsname == 대명여자고등학교
    if hsname == 대문
    if hsname == 대민
    if hsname == 대부
    if hsname == 대부고등학교
    if hsname == 대부정보고등학교
    if hsname == 대사
    if hsname == 대산
    if hsname == 대산고등학교
    if hsname == 대상고등학교
    if hsname == 대서
    if hsname == 대성
    if hsname == 대성 여상
    if hsname == 대성 여자
    if hsname == 대성고등학교
    if hsname == 대성공업
    if hsname == 대성산업
    if hsname == 대성여고
    if hsname == 대성여상
    if hsname == 대성여자
    if hsname == 대성여자고등학교
    if hsname == 대성여자상업
    if hsname == 대성여자상업고등학교
    if hsname == 대성여자정보
    if hsname == 대성여자정보과학
    if hsname == 대성여자정보과학고등학교
    if hsname == 대성일
    if hsname == 대성일고등학교
    if hsname == 대성정보
    if hsname == 대성종합고등고등학교
    if hsname == 대성환경정보
    if hsname == 대성환경정보고등학교
    if hsname == 대소금왕고등학교
    if hsname == 대송
    if hsname == 대송고등학교
    if hsname == 대승
    if hsname == 대승고등학교
    if hsname == 대신
    if hsname == 대신고등학교
    if hsname == 대아
    if hsname == 대아고등학교
    if hsname == 대양
    if hsname == 대양고등학교고등학교
    if hsname == 대양공고등학교
    if hsname == 대양공업
    if hsname == 대양전라
    if hsname == 대양전자
    if hsname == 대양전자고등학교
    if hsname == 대양전자벙보고
    if hsname == 대양전자정보
    if hsname == 대양전자정보고등학교
    if hsname == 대양전자정보통신
    if hsname == 대양전자통신
    if hsname == 대양전자통신고등학교
    if hsname == 대양정보
    if hsname == 대양정보고등학교
    if hsname == 대여자상업정보
    if hsname == 대연
    if hsname == 대연고등학교
    if hsname == 대연공업
    if hsname == 대연여자
    if hsname == 대연여자고등학교
    if hsname == 대연여자상업
    if hsname == 대연여자상업고등학교
    if hsname == 대연정보
    if hsname == 대연정보고
    if hsname == 대연정보고등학교
    if hsname == 대영
    if hsname == 대영고등학교
    if hsname == 대영남공업
    if hsname == 대영여자
    if hsname == 대외기계공업
    if hsname == 대왼
    if hsname == 대우공업
    if hsname == 대원
    if hsname == 대원 예술
    if hsname == 대원 외국어
    if hsname == 대원고등학교
    if hsname == 대원공업
    if hsname == 대원남자
    if hsname == 대원여
    if hsname == 대원여자
    if hsname == 대원여자고등학교
    if hsname == 대원예술
    if hsname == 대원외
    if hsname == 대원외국
    if hsname == 대원외국어
    if hsname == 대원외국어고등학교
    if hsname == 대인
    if hsname == 대인고등학교
    if hsname == 대일
    if hsname == 대일 외국어
    if hsname == 대일고등학교
    if hsname == 대일관광고등학교
    if hsname == 대일관광디자인
    if hsname == 대일관광디자인고등학교
    if hsname == 대일관광디자인고등학교(구/대일여자정..
    if hsname == 대일상업
    if hsname == 대일여자
    if hsname == 대일여자정보산업
    if hsname == 대일외
    if hsname == 대일외고
    if hsname == 대일외국어
    if hsname == 대일외국어고등학교
    if hsname == 대자
    if hsname == 대저
    if hsname == 대저고등학교
    if hsname == 대전
    if hsname == 대전 관저
    if hsname == 대전 대덕
    if hsname == 대전 대성
    if hsname == 대전 대신
    if hsname == 대전 동산
    if hsname == 대전 성모 여자
    if hsname == 대전 송촌
    if hsname == 대전 외국어
    if hsname == 대전 우성
    if hsname == 대전 제일고
    if hsname == 대전 지족
    if hsname == 대전 호수돈여자
    if hsname == 대전고
    if hsname == 대전고등학교
    if hsname == 대전고등학교부설 방송통신고등학교
    if hsname == 대전고등학교부설방송통신
    if hsname == 대전공업
    if hsname == 대전공업고
    if hsname == 대전공업고등학교
    if hsname == (구:서대전공업고등학교)
    if hsname == 대전과학
    if hsname == 대전과학고등학교
    if hsname == 대전관저
    if hsname == 대전관저고등학교
    if hsname == 대전괴정고등학교
    if hsname == 대전구봉
    if hsname == 대전구봉고등학교
    if hsname == 대전국제통상
    if hsname == 대전국제통상고등학교
    if hsname == 대전노은고등학교
    if hsname == 대전대덕
    if hsname == 대전대성
    if hsname == 대전대성고등학교
    if hsname == 대전대성여자
    if hsname == 대전대신
    if hsname == 대전대신고등
    if hsname == 대전대신고등학교
    if hsname == 대전동방여자
    if hsname == 대전동산
    if hsname == 대전동산고등학교
    if hsname == 대전동신
    if hsname == 대전동신고등학교
    if hsname == 대전동아공업
    if hsname == 대전동아공업고등학교
    if hsname == 대전두산
    if hsname == 대전둔산
    if hsname == 대전둔산여자
    if hsname == 대전둔산여자고등학교
    if hsname == 대전둔원
    if hsname == 대전둔원고등학교
    if hsname == 대전만년
    if hsname == 대전만년고등학교
    if hsname == 대전맹학교
    if hsname == 대전반석고등학교
    if hsname == 대전보문
    if hsname == 대전보문고등학교
    if hsname == 대전북
    if hsname == 대전상업
    if hsname == 대전상업고등학교
    if hsname == 대전서일
    if hsname == 대전서일고등학교
    if hsname == 대전서일여자
    if hsname == 대전성모여자
    if hsname == 대전성모여자고등학교
    if hsname == 대전송촌
    if hsname == 대전송촌고등학교
    if hsname == 대전신일여자
    if hsname == 대전신일여자고등학교
    if hsname == 대전실업
    if hsname == 대전여고
    if hsname == 대전여상
    if hsname == 대전여자
    if hsname == 대전여자 상업
    if hsname == 대전여자고등학교
    if hsname == 대전여자방송고등학교
    if hsname == 대전여자상업
    if hsname == 대전여자상업고등학교
    if hsname == 대전여자정보
    if hsname == 대전여자정보고등학교
    if hsname == 대전예술
    if hsname == 대전예술고등학교
    if hsname == 대전외
    if hsname == 대전외국어
    if hsname == 대전외국어고등학교
    if hsname == 대전외국인학교
    if hsname == 대전용산고등학교
    if hsname == 대전유성
    if hsname == 대전유성생명과학
    if hsname == 대전유성여자고등학교
    if hsname == 대전이문
    if hsname == 대전이문고등학교
    if hsname == 대전전민
    if hsname == 대전전민고등학교
    if hsname == 대전전자공예
    if hsname == 대전전자기계고등학교
    if hsname == 대전전자디자인
    if hsname == 대전전자디자인고등학교
    if hsname == 대전제일
    if hsname == 대전제일고등학교
    if hsname == 대전중등
    if hsname == 대전중앙
    if hsname == 대전중앙고
    if hsname == 대전중앙고등학교
    if hsname == 대전지족
    if hsname == 대전지족고2
    if hsname == 대전지족고등학교
    if hsname == 대전청관여자
    if hsname == 대전청란여자
    if hsname == 대전체육
    if hsname == 대전체육고등학교
    if hsname == 대전충남
    if hsname == 대전한밭
    if hsname == 대전한빛고등학교
    if hsname == 대정
    if hsname == 대정고등학교
    if hsname == 대정여
    if hsname == 대정여자
    if hsname == 대정여자고등학교
    if hsname == 대중금속
    if hsname == 대중금속공업
    if hsname == 대중금속공업고등학교
    if hsname == 대지고등학교
    if hsname == 대진
    if hsname == 대진 디자인
    if hsname == 대진고등고등학교
    if hsname == 대진고등학교
    if hsname == 대진공업고등학교
    if hsname == 대진디자인
    if hsname == 대진디자인고등학교
    if hsname == 대진디자인학교
    if hsname == 대진여자
    if hsname == 대진여자고등학교
    if hsname == 대진전자공업
    if hsname == 대진전자공예
    if hsname == 대진전자정보
    if hsname == 대진전자정보고등학교
    if hsname == 대진전자정보통신고등학교
    if hsname == 대진정보
    if hsname == 대진정보고등학교
    if hsname == 대진정보통신
    if hsname == 대진정보통신고등학교
    if hsname == 대창
    if hsname == 대창고등
    if hsname == 대창고등학교
    if hsname == 대천
    if hsname == 대천고등학교
    if hsname == 대천여
    if hsname == 대천여고
    if hsname == 대천여자
    if hsname == 대천여자고등학교
    if hsname == 대천여자상업
    if hsname == 대천여자상업고등학교
    if hsname == 대천쳐자
    if hsname == 대철
    if hsname == 대청
    if hsname == 대청고등학교
    if hsname == 대평
    if hsname == 대평고등학교
    if hsname == 대포
    if hsname == 대한공업
    if hsname == 대합종합고등학교
    if hsname == 대항정보전자
    if hsname == 대헌 공업
    if hsname == 대헌고등학교
    if hsname == 대헌공업
    if hsname == 대헌공업고등학교
    if hsname == 대현
    if hsname == 대현고등학교
    if hsname == 대현공업
    if hsname == 대화
    if hsname == 대화고등학교
    if hsname == 대화여자상업고등학교
    if hsname == 대흥
    if hsname == 대흥고등학교
    if hsname == 더동
    if hsname == 덕계
    if hsname == 덕계고등학교
    if hsname == 덕고고등학교
    if hsname == 덕눈여자
    if hsname == 덕명
    if hsname == 덕명여자
    if hsname == 덕명여자산업
    if hsname == 덕명여자상업고등학교
    if hsname == 덕명정보여자
    if hsname == 덕명정보여자고등학교
    if hsname == 덕문
    if hsname == 덕문고등학교
    if hsname == 덕문여자
    if hsname == 덕문여자고등학교
    if hsname == 덕산
    if hsname == 덕산고등학교
    if hsname == 덕성
    if hsname == 덕성여자
    if hsname == 덕성여자고등학교
    if hsname == 덕소
    if hsname == 덕소고등학교
    if hsname == 덕수
    if hsname == 덕수고등학교
    if hsname == 덕수구
    if hsname == 덕수산업
    if hsname == 덕수상고
    if hsname == 덕수상업
    if hsname == 덕수상업고등학교
    if hsname == 덕수정보
    if hsname == 덕수정보산업
    if hsname == 덕수정보산업고등학교
    if hsname == 덕신
    if hsname == 덕신고등학교
    if hsname == 덕암
    if hsname == 덕암고등학교
    if hsname == 덕암정보
    if hsname == 덕암정보고
    if hsname == 덕암정보고등학교
    if hsname == 덕앙정보
    if hsname == 덕양
    if hsname == 덕우
    if hsname == 덕원
    if hsname == 덕원 예술
    if hsname == 덕원고등학교
    if hsname == 덕원공업
    if hsname == 덕원여고
    if hsname == 덕원여자
    if hsname == 덕원여자고등학교
    if hsname == 덕원예고
    if hsname == 덕원예술
    if hsname == 덕원예술고등학교
    if hsname == 덕인
    if hsname == 덕인고등학교
    if hsname == 덕일
    if hsname == 덕일전자공업
    if hsname == 덕일전자공업고등학교
    if hsname == 덕적고등학교
    if hsname == 덕정
    if hsname == 덕정고등학교
    if hsname == 덕진여자고등학교
    if hsname == 덕천여자
    if hsname == 덕현고등학교
    if hsname == 데레사
    if hsname == 데레사여자
    if hsname == 데레사여자고등학교
    if hsname == 도개
    if hsname == 도개고등학교
    if hsname == 도계
    if hsname == 도계고등학교
    if hsname == 도계여자
    if hsname == 도계전산정보
    if hsname == 도남정보
    if hsname == 도농
    if hsname == 도농고등학교
    if hsname == 도단
    if hsname == 도당
    if hsname == 도당고등학교
    if hsname == 도림
    if hsname == 도림고등학교
    if hsname == 도명정보
    if hsname == 도민
    if hsname == 도봉
    if hsname == 도봉고
    if hsname == 도봉고등학교
    if hsname == 도봉상업
    if hsname == 도봉정보
    if hsname == 도봉정보산업
    if hsname == 도봉정보산업고등학교
    if hsname == 도예
    if hsname == 도예고등학교
    if hsname == 도원
    if hsname == 도원고등학교
    if hsname == 도초
    if hsname == 도초고등학교
    if hsname == 도호공업
    if hsname == 도화
    if hsname == 도화고등학교
    if hsname == 도화공업
    if hsname == 도화기계
    if hsname == 도화기계공업
    if hsname == 도화기계공업고등학교
    if hsname == 독산
    if hsname == 독산고등학교
    if hsname == 독수
    if hsname == 돈암동(서울)
    if hsname == 돌마
    if hsname == 돌마고등학교
    if hsname == 동
    if hsname == 동 아
    if hsname == 동계
    if hsname == 동계고등학교
    if hsname == 동고등학교
    if hsname == 동곡
    if hsname == 동광
    if hsname == 동광고등학교
    if hsname == 동광농공
    if hsname == 동광농공고등학교
    if hsname == 동광농공업고등학교
    if hsname == 동광농업
    if hsname == 동광산업과학고등학교
    if hsname == 동구공업
    if hsname == 동구마케팅
    if hsname == 동구마케팅고등학교
    if hsname == 동구산업고등학교
    if hsname == 동구여상
    if hsname == 동구여자
    if hsname == 동구여자상업
    if hsname == 동구여자상업고등학교
    if hsname == 동국
    if hsname == 동국고등학교
    if hsname == 동국대 부속
    if hsname == 동국대부속
    if hsname == 동국대부속고등학교
    if hsname == 동국대부속금산고등학교
    if hsname == 동국대부속명성
    if hsname == 동국대부속여자
    if hsname == 동국대부속여자고등학교
    if hsname == 동국대사대부속
    if hsname == 동국대사범대학부속
    if hsname == 동국대사범대학부속여자
    if hsname == 동국대사범부속여자
    if hsname == 동국대사범여자고등학교
    if hsname == 동국대학교 부속여자
    if hsname == 동국대학교 사범대학 부속
    if hsname == 동국대학교 사범대학 부속 금산고등학교
    if hsname == 동국대학교 사범대학 부속여자고등학교
    if hsname == 동국대학교 사범대학부속여자 고등
    if hsname == 동국대학교 사법대학 부속고등학교
    if hsname == 동국대학교부속
    if hsname == 동국대학교부속여자고등학교
    if hsname == 동국대학교사범대학부속
    if hsname == 동국대학교사범대학부속 영석고등학교
    if hsname == 동국대학교사범대학부속고등학교
    if hsname == 동국대학교사범대학부속금산
    if hsname == 동국대학교사범대학부속여자
    if hsname == 동국대학교사범대학부속여자고등학교
    if hsname == 동국대학교사범대학부속영석
    if hsname == 동국대학교사범부속여자
    if hsname == 동국대학부속여자
    if hsname == 동국부속
    if hsname == 동국사범대부속여자
    if hsname == 동국여자고등학교
    if hsname == 동기
    if hsname == 동난
    if hsname == 동남
    if hsname == 동남고등학교
    if hsname == 동남자고등학교
    if hsname == 동대
    if hsname == 동대문상업
    if hsname == 동대문상업고등학교
    if hsname == 동대부
    if hsname == 동대부고
    if hsname == 동대부속
    if hsname == 동대부속고등학교
    if hsname == 동대부속여자
    if hsname == 동대부속여자고등학교
    if hsname == 동대부여
    if hsname == 동대세무
    if hsname == 동대전
    if hsname == 동대전고등학교
    if hsname == 동대천
    if hsname == 동덕
    if hsname == 동덕여고
    if hsname == 동덕여자
    if hsname == 동덕여자고등학교
    if hsname == 동도공업
    if hsname == 동도공업고등학교
    if hsname == 동두천
    if hsname == 동두천 고등학교
    if hsname == 동두천고등학교
    if hsname == 동두천여자상업고등학교
    if hsname == 동두천외국어
    if hsname == 동두천외국어고등학교
    if hsname == 동두천중앙
    if hsname == 동두천중앙고등학교
    if hsname == 동래
    if hsname == 동래 여자
    if hsname == 동래고등학교
    if hsname == 동래고등학교부설 방송통신고등학교
    if hsname == 동래상업고등학교
    if hsname == 동래여
    if hsname == 동래여자
    if hsname == 동래여자고등학교
    if hsname == 동래여자상업고등학교
    if hsname == 동래여자정보고등학교
    if hsname == 동래원예
    if hsname == 동래원예고등학교
    if hsname == 동림
    if hsname == 동명
    if hsname == 동명고등학교
    if hsname == 동명공고
    if hsname == 동명공업
    if hsname == 동명공업고등학교
    if hsname == 동명여
    if hsname == 동명여고
    if hsname == 동명여자
    if hsname == 동명여자고등학교
    if hsname == 동명여자산업
    if hsname == 동명여자정보산업
    if hsname == 동명여자정보산업고등학교
    if hsname == 동명정보
    if hsname == 동명정보공업
    if hsname == 동명정보공업고등학교
    if hsname == 동명정보산업고등학교
    if hsname == 동무여자
    if hsname == 동문
    if hsname == 동문고등학교
    if hsname == 동방
    if hsname == 동방 여자
    if hsname == 동방고등학교
    if hsname == 동방여자
    if hsname == 동방여자고등학교
    if hsname == 동백고등학교
    if hsname == 동보정보
    if hsname == 동부
    if hsname == 동부고등학교
    if hsname == 동부공고
    if hsname == 동부공업
    if hsname == 동부공업고등학교
    if hsname == 동부여자
    if hsname == 동부여자고등학교
    if hsname == 동북
    if hsname == 동북고등학교
    if hsname == 동북공업고등학교
    if hsname == 동북구
    if hsname == 동사
    if hsname == 동산
    if hsname == 동산고등학교
    if hsname == 동산산업정보
    if hsname == 동산여상
    if hsname == 동산여자고등학교
    if hsname == 동산여자전산
    if hsname == 동산전산
    if hsname == 동산정보
    if hsname == 동산정보고등학교
    if hsname == 동산정보산업
    if hsname == 동산정보산업고등학교
    if hsname == 동상
    if hsname == 동상 정보
    if hsname == 동성
    if hsname == 동성고등학교
    if hsname == 동신
    if hsname == 동신고등학교
    if hsname == 동신과학고등학교
    if hsname == 동신여고
    if hsname == 동신여자
    if hsname == 동신여자고등학교
    if hsname == 동심여자
    if hsname == 동아
    if hsname == 동아 공업
    if hsname == 동아고등학교
    if hsname == 동아공고
    if hsname == 동아공업
    if hsname == 동아공업고등학교
    if hsname == 동아마이스터
    if hsname == 동아마이스터고등학교
    if hsname == 동아여자
    if hsname == 동아여자고등학교
    if hsname == 동안
    if hsname == 동안(안양)
    if hsname == 동안고
    if hsname == 동안고등학교
    if hsname == 동안천
    if hsname == 동암
    if hsname == 동암고등학교
    if hsname == 동암재활학교고등학교
    if hsname == 동양
    if hsname == 동양 공업
    if hsname == 동양고등학교
    if hsname == 동양고등학교(구/동양공고)
    if hsname == 동양공
    if hsname == 동양공업
    if hsname == 동양공업고등학교
    if hsname == 동양여자
    if hsname == 동여자
    if hsname == 동영
    if hsname == 동영여자
    if hsname == 동영여자고등학교
    if hsname == 동오여자
    if hsname == 동우
    if hsname == 동우 여자
    if hsname == 동우여고
    if hsname == 동우여자
    if hsname == 동우여자고등학교
    if hsname == 동우여자상업고등학교
    if hsname == 동우정보고등학교
    if hsname == 동원
    if hsname == 동원고등학교
    if hsname == 동의
    if hsname == 동의고등학교
    if hsname == 동의공고
    if hsname == 동의공업
    if hsname == 동의공업고등학교
    if hsname == 동이공업
    if hsname == 동익
    if hsname == 동인
    if hsname == 동인고등학교
    if hsname == 동인여자
    if hsname == 동인천
    if hsname == 동인천고
    if hsname == 동인천고등학교
    if hsname == 동일
    if hsname == 동일 전자 정보
    if hsname == 동일고등학교
    if hsname == 동일공업
    if hsname == 동일공업고등학교
    if hsname == 동일실업
    if hsname == 동일실업고등학교
    if hsname == 동일여
    if hsname == 동일여자
    if hsname == 동일여자 전산디자인
    if hsname == 동일여자고등학교
    if hsname == 동일여자상업
    if hsname == 동일여자상업고등학교
    if hsname == 동일여자전산
    if hsname == 동일여자전산고등학교
    if hsname == 동일여자전산디자인
    if hsname == 동일여자전산디자인고등학교
    if hsname == 동일여자전산디자인고등학교(구:동일여..
    if hsname == 동일여자전산산업
    if hsname == 동일여전산
    if hsname == 동일전산디자인
    if hsname == 동일전자
    if hsname == 동일전자고등학교
    if hsname == 동일전자정보
    if hsname == 동일전자정보고등학교
    if hsname == 동작
    if hsname == 동작고등학교
    if hsname == 동정한국
    if hsname == 동주
    if hsname == 동주여상
    if hsname == 동주여자
    if hsname == 동주여자고등학교
    if hsname == 동주여자상업
    if hsname == 동주여자상업고등학교
    if hsname == 동지
    if hsname == 동지고등학교
    if hsname == 동지여자
    if hsname == 동지여자고등학교
    if hsname == 동지여자상업
    if hsname == 동지여자상업고등학교
    if hsname == 동진
    if hsname == 동천
    if hsname == 동천고등학교
    if hsname == 동청
    if hsname == 동탄
    if hsname == 동탄고등학교
    if hsname == 동패고등학교
    if hsname == 동평여자상업고등학교
    if hsname == 동하
    if hsname == 동해
    if hsname == 동해 방희
    if hsname == 동해고등학교
    if hsname == 동해공업고등학교
    if hsname == 동해광희
    if hsname == 동해광희고등학교
    if hsname == 동해묵호
    if hsname == 동해삼육
    if hsname == 동해삼육고등학교
    if hsname == 동해상업
    if hsname == 동해상업고등학교
    if hsname == 동호
    if hsname == 동호고등학교
    if hsname == 동호공업
    if hsname == 동호산업고등학교
    if hsname == 동호여자
    if hsname == 동호여자고등학교
    if hsname == 동호여자상업
    if hsname == 동호정보
    if hsname == 동호정보고등학교
    if hsname == 동호정보공업
    if hsname == 동호정보공업고등학교
    if hsname == 동호정보산업
    if hsname == 동화
    if hsname == 동화고등학교
    if hsname == 동화공업
    if hsname == 동화여자
    if hsname == 돝신여자고등학교
    if hsname == 두계
    if hsname == 두레자연
    if hsname == 두레자연고등학교
    if hsname == 두명정보산업
    if hsname == 두엽
    if hsname == 두원
    if hsname == 두원여자고등학교
    if hsname == 두정
    if hsname == 두정고등학교
    if hsname == 두하기계공업
    if hsname == 두호
    if hsname == 두호고등학교
    if hsname == 둔내
    if hsname == 둔내고등학교
    if hsname == 둔산
    if hsname == 둔산여고
    if hsname == 둔산여자
    if hsname == 둔산여자고등학교
    if hsname == 둔원
    if hsname == 둔원고등학교
    if hsname == 둔촌
    if hsname == 둔촌고교
    if hsname == 둔촌고등학교
    if hsname == 둔포
    if hsname == 둥진
    if hsname == 드니엘여자
    if hsname == 등촌
    if hsname == 등촌고등학교
    if hsname == 디자인
    if hsname == 디자인고등학교
    if hsname == 디자인고등학교고등학교
    if hsname == 디자인문화
    if hsname == 디지탈미디어고등학교
    if hsname == 디지털
    if hsname == 디지털전자
    if hsname == 래인
    if hsname == 렘렌트지도자대한고등학교
    if hsname == 로봇
    if hsname == 로스북(캐나다)
    if hsname == 리라
    if hsname == 리라고등학교
    if hsname == 리라공업고등학교
    if hsname == 리라아트
    if hsname == 리라아트고등학교
    if hsname == 리산
    if hsname == 리서치고등학교
    if hsname == 링컨하우스 마산스쿨
    if hsname == 링컨하우스부천스쿨
    if hsname == 링컨하우스스쿨
    if hsname == 마령
    if hsname == 마령고등학교
    if hsname == 마리아
    if hsname == 마리아회
    if hsname == 마사
    if hsname == 마산
    if hsname == 마산 내서여
    if hsname == 마산 방통
    if hsname == 마산 삼진
    if hsname == 마산 성지여자
    if hsname == 마산 여자
    if hsname == 마산 중앙
    if hsname == 마산ㅇㅇ
    if hsname == 마산가포
    if hsname == 마산가포고등학교
    if hsname == 마산경상
    if hsname == 마산고등학교
    if hsname == 마산공고
    if hsname == 마산공업
    if hsname == 마산공업고등학교
    if hsname == 마산구암
    if hsname == 마산구암고등학교
    if hsname == 마산구암보
    if hsname == 마산내서여자
    if hsname == 마산내서여자고등학교
    if hsname == 마산매서여자
    if hsname == 마산무안고등학교
    if hsname == 마산무학
    if hsname == 마산무학여고
    if hsname == 마산무학여자
    if hsname == 마산무학여자고등학교
    if hsname == 마산무학여자상업
    if hsname == 마산방송통신
    if hsname == 마산부설통신
    if hsname == 마산삼지고등학교
    if hsname == 마산삼진
    if hsname == 마산삼진고등학교
    if hsname == 마산상고
    if hsname == 마산상업
    if hsname == 마산상업고등학교
    if hsname == 마산상진
    if hsname == 마산성지
    if hsname == 마산성지여자
    if hsname == 마산여고
    if hsname == 마산여상
    if hsname == 마산여자
    if hsname == 마산여자고등학교
    if hsname == 마산용마
    if hsname == 마산용마고등학교
    if hsname == 마산제일
    if hsname == 마산제일고등학교
    if hsname == 마산제일여자
    if hsname == 마산제일여자고등학교
    if hsname == 마산중앙
    if hsname == 마산중앙고등학교
    if hsname == 마산창신
    if hsname == 마산통신
    if hsname == 마산한길전산
    if hsname == 마산한일여자
    if hsname == 마산한일전산
    if hsname == 마산한일전산고등학교
    if hsname == 마산한일전산여자
    if hsname == 마산한일전산여자고등학교
    if hsname == 마산합포
    if hsname == 마석고등학교
    if hsname == 마송고등학교
    if hsname == 마이스터
    if hsname == 마이스트
    if hsname == 마장
    if hsname == 마장고등학교
    if hsname == 마장상업고등학교
    if hsname == 마차
    if hsname == 마차고등학교
    if hsname == 마케팅
    if hsname == 마케팅고등학교
    if hsname == 마포
    if hsname == 마포고등학교
    if hsname == 만경
    if hsname == 만경고등학교
    if hsname == 만경여고
    if hsname == 만경여자
    if hsname == 만경여자고등학교
    if hsname == 만년
    if hsname == 만년고등학교
    if hsname == 만덕
    if hsname == 만덕고등학교
    if hsname == 만리포
    if hsname == 만리포고등학교
    if hsname == 만수고등학교
    if hsname == 만안
    if hsname == 만안여자
    if hsname == 만연
    if hsname == 망남
    if hsname == 망주
    if hsname == 망포고등학교
    if hsname == 매경
    if hsname == 매괴
    if hsname == 매괴고등학교
    if hsname == 매괴여자상업고등학교
    if hsname == 매량여자정보
    if hsname == 매산
    if hsname == 매산여
    if hsname == 매산여자
    if hsname == 매성고등학교
    if hsname == 매원
    if hsname == 매원고등학교
    if hsname == 매임
    if hsname == 매창
    if hsname == 매천고등학교
    if hsname == 매탄
    if hsname == 매탄고등학교
    if hsname == 매향
    if hsname == 매향여
    if hsname == 매향여자
    if hsname == 매향여자경영정보
    if hsname == 매향여자상업
    if hsname == 매향여자정보
    if hsname == 매향여자정보고등학교
    if hsname == 매향정보고등학교
    if hsname == 매화고등학교
    if hsname == 맥석
    if hsname == 메탄
    if hsname == 멕시코
    if hsname == 면목
    if hsname == 면목고등학교
    if hsname == 면옥
    if hsname == 명곡
    if hsname == 명남
    if hsname == 명덕
    if hsname == 명덕 외국어
    if hsname == 명덕고등학교
    if hsname == 명덕여
    if hsname == 명덕여자
    if hsname == 명덕여자고등학교
    if hsname == 명덕외고
    if hsname == 명덕외국어
    if hsname == 명덕외국어고등학교
    if hsname == 명동
    if hsname == 명랑정보
    if hsname == 명룬
    if hsname == 명륜
    if hsname == 명륜(광릉)
    if hsname == 명륜고등학교
    if hsname == 명문
    if hsname == 명문고등학교
    if hsname == 명석
    if hsname == 명석고등학교
    if hsname == 명석외국어
    if hsname == 명성
    if hsname == 명성고등학교
    if hsname == 명성여자
    if hsname == 명성여자고등학교
    if hsname == 명승여자고등학교
    if hsname == 명신
    if hsname == 명신 여자
    if hsname == 명신고등학교
    if hsname == 명신여자
    if hsname == 명신여자고등학교
    if hsname == 명신여자실업
    if hsname == 명인고등학교
    if hsname == 명인상업고등학교
    if hsname == 명인정보
    if hsname == 명인정보고등학교
    if hsname == 명일
    if hsname == 명일여
    if hsname == 명일여자
    if hsname == 명일여자고등학교
    if hsname == 명주
    if hsname == 명지
    if hsname == 명지 여자
    if hsname == 명지고등학교
    if hsname == 명지여자
    if hsname == 명지외국어
    if hsname == 명지외국어고등학교
    if hsname == 명진
    if hsname == 명진고등학교
    if hsname == 명진여자
    if hsname == 명해고등학교
    if hsname == 명혜
    if hsname == 명혜학교
    if hsname == 모계
    if hsname == 모계고등학교
    if hsname == 모동
    if hsname == 목도고등학교
    if hsname == 목동
    if hsname == 목동고등학교
    if hsname == 목련여자
    if hsname == 목상고등학교
    if hsname == 목천
    if hsname == 목천고등학교
    if hsname == 목포
    if hsname == 목포  덕인고등학교
    if hsname == 목포  제일정보
    if hsname == 목포 여자
    if hsname == 목포 제일정보
    if hsname == 목포 혜인여자
    if hsname == 목포고등
    if hsname == 목포고등학교
    if hsname == 목포공업
    if hsname == 목포공업고등학교
    if hsname == 목포기계
    if hsname == 목포기계고등학교
    if hsname == 목포기계공업
    if hsname == 목포기계공업고등학교
    if hsname == 목포덕인
    if hsname == 목포덕인고등학교
    if hsname == 목포덕일고등학교
    if hsname == 목포마리아회
    if hsname == 목포마리아회고등학교
    if hsname == 목포문태
    if hsname == 목포문태고등학교
    if hsname == 목포상고
    if hsname == 목포상업
    if hsname == 목포성신고등학교
    if hsname == (목포성신여자실업고등..
    if hsname == 목포신명여자상업
    if hsname == 목포여자
    if hsname == 목포여자고등학교
    if hsname == 목포여자상업
    if hsname == 목포여자상업고등학교
    if hsname == 목포영흥
    if hsname == 목포예술고등학교
    if hsname == 목포전남제일
    if hsname == 목포정명여자
    if hsname == 목포정명여자고등학교
    if hsname == 목포제일
    if hsname == 목포제일여자
    if hsname == 목포제일여자고등학교
    if hsname == 목포제일정보
    if hsname == 목포제일정보고등학교
    if hsname == 목포중앙
    if hsname == 목포중앙고등학교
    if hsname == 목포혜인
    if hsname == 목포혜인여자
    if hsname == 목포혜인여자고등학교
    if hsname == 목포홍일
    if hsname == 목포홍일고
    if hsname == 목포홍일고등학교
    if hsname == 목표여자
    if hsname == 무거
    if hsname == 무거고등학교
    if hsname == 무거내
    if hsname == 무답
    if hsname == 무령
    if hsname == 무룡
    if hsname == 무룡고등학교
    if hsname == 무산
    if hsname == 무산고등학교
    if hsname == 무성
    if hsname == 무악여자
    if hsname == 무안
    if hsname == 무안고등학교
    if hsname == 무안백제
    if hsname == 무안종합고등학교
    if hsname == 무안해제
    if hsname == 무안현경
    if hsname == 무언
    if hsname == 무영
    if hsname == 무용
    if hsname == 무원
    if hsname == 무원고등학교
    if hsname == 무주
    if hsname == 무주 안성
    if hsname == 무주고등학교
    if hsname == 무주안성고등학교
    if hsname == 무천
    if hsname == 무풍고등학교
    if hsname == 무학
    if hsname == 무학 여자
    if hsname == 무학고등고등학교
    if hsname == 무학고등학교
    if hsname == 무학여
    if hsname == 무학여고
    if hsname == 무학여상
    if hsname == 무학여자
    if hsname == 무학여자고등학교
    if hsname == 무흥
    if hsname == 묵동
    if hsname == 묵호
    if hsname == 묵호고등학교
    if hsname == 문경
    if hsname == 문경고등학교
    if hsname == 문경공
    if hsname == 문경공업
    if hsname == 문경공업고등학교
    if hsname == 문경관광
    if hsname == 문경여자
    if hsname == 문경여자고등
    if hsname == 문경여자고등학교
    if hsname == 문남
    if hsname == 문당
    if hsname == 문당대진
    if hsname == 문막
    if hsname == 문막고등학교
    if hsname == 문명
    if hsname == 문명고등학교
    if hsname == 문산
    if hsname == 문산고등학교
    if hsname == 문산수억고등학교
    if hsname == 문산여
    if hsname == 문산여고
    if hsname == 문산여고등학교
    if hsname == 문산여자
    if hsname == 문산여자고등학교
    if hsname == 문산여자고등학교(구/문산여자종합고등..
    if hsname == 문산여자종합
    if hsname == 문산재일
    if hsname == 문산제일
    if hsname == 문산제일고등학교
    if hsname == 문산제일고등학교(구/문산종합고)
    if hsname == 문산종
    if hsname == 문산종합고등학교
    if hsname == 문산중
    if hsname == 문상
    if hsname == 문상여상
    if hsname == 문상여자상업
    if hsname == 문선 여자
    if hsname == 문성
    if hsname == 문성 미디어
    if hsname == 문성고등
    if hsname == 문성고등학교
    if hsname == 문성여상
    if hsname == 문성여자
    if hsname == 문성여자고등학교
    if hsname == 문성여자상업
    if hsname == 문성여자정보
    if hsname == 문성여자정보고등학교
    if hsname == 문성정보
    if hsname == 문성정보미디어
    if hsname == 문성정보미디어고등학교
    if hsname == 문수
    if hsname == 문수(울산)
    if hsname == 문수고등학교
    if hsname == 문영
    if hsname == 문영여자
    if hsname == 문예
    if hsname == 문인
    if hsname == 문일
    if hsname == 문일 여자
    if hsname == 문일고등학교
    if hsname == 문일여자
    if hsname == 문일여자고등학교
    if hsname == 문정
    if hsname == 문정고등학교
    if hsname == 문정여자고등학교
    if hsname == 문창
    if hsname == 문창고등학교
    if hsname == 문태
    if hsname == 문태고등학교
    if hsname == 문학정보
    if hsname == 문학정보고등학교
    if hsname == 문향
    if hsname == 문향고등학교
    if hsname == 문현
    if hsname == 문현고등학교
    if hsname == 문현여고
    if hsname == 문현여자
    if hsname == 문현여자고등학교
    if hsname == 문현여자상업
    if hsname == 문현정보고
    if hsname == 문호
    if hsname == 문화
    if hsname == 문화고등학교
    if hsname == 문화여자
    if hsname == 문화정보
    if hsname == 묻산여고
    if hsname == 물금
    if hsname == 물금고등학교
    if hsname == 미공개
    if hsname == 미래산업
    if hsname == 미래산업 과학
    if hsname == 미래산업과학
    if hsname == 미래산업과학고등학교
    if hsname == 미래정보고
    if hsname == 미래정보고등학교
    if hsname == 미림
    if hsname == 미림 여자
    if hsname == 미림여자
    if hsname == 미림여자고등학교
    if hsname == 미림여자정보
    if hsname == 미림여자정보과학
    if hsname == 미림여자정보과학고등학교
    if hsname == 미술
    if hsname == 미양고등학교
    if hsname == 미용
    if hsname == 미용고등학교
    if hsname == 미원
    if hsname == 미원공업
    if hsname == 미원공업고등학교
    if hsname == 미응답
    if hsname == 미추홀고등학교
    if hsname == 민족사관
    if hsname == 민족사관고등학교
    if hsname == 밀성
    if hsname == 밀성고등학교
    if hsname == 밀성상업여자
    if hsname == 밀성여자
    if hsname == 밀성여자상업
    if hsname == 밀성제일
    if hsname == 밀성제일고(구/밀성정보고등학교)
    if hsname == 밀성제일고등학교
    if hsname == 밀양
    if hsname == 밀양 여자
    if hsname == 밀양 일성
    if hsname == 밀양고등학교
    if hsname == 밀양동명
    if hsname == 밀양동명고등학교
    if hsname == 밀양밀성
    if hsname == 밀양여고
    if hsname == 밀양여자
    if hsname == 밀양여자고등학교
    if hsname == 밀양전자공업고등학교
    if hsname == 밀양제일고등학교
    if hsname == 바산
    if hsname == 박문
    if hsname == 박문여자
    if hsname == 박문여자고등학교
    if hsname == 반석
    if hsname == 반석고등학교
    if hsname == 반성고등학교
    if hsname == 반송
    if hsname == 반송고등학교
    if hsname == 반애
    if hsname == 반여
    if hsname == 반여고등학교
    if hsname == 반월
    if hsname == 반월 정보 산업
    if hsname == 반월고등학교
    if hsname == 반월정보
    if hsname == 반월정보고등학교
    if hsname == 반월정보산업
    if hsname == 반월정보산업고등학교
    if hsname == 반존
    if hsname == 반포
    if hsname == 반포고
    if hsname == 반포고등학교
    if hsname == 발곡고등학교
    if hsname == 발안농생명
    if hsname == 발안농업
    if hsname == 발안농업고등학교
    if hsname == 발안바이오과학
    if hsname == 발안바이오과학고등학교
    if hsname == 발안산업
    if hsname == 방문 여자
    if hsname == 방배여자
    if hsname == 방산
    if hsname == 방산(송파구)
    if hsname == 방산고등학교
    if hsname == 방송통신
    if hsname == 방송통신고
    if hsname == 방송통신고등학교
    if hsname == 방어진
    if hsname == 방어진고등학교
    if hsname == 방월정보산업
    if hsname == 방이진
    if hsname == 방통
    if hsname == 방통고등학교
    if hsname == 배경
    if hsname == 배광
    if hsname == 배기
    if hsname == 배동
    if hsname == 배명
    if hsname == 배명고등학교
    if hsname == 배명여고
    if hsname == 배문
    if hsname == 배문고등학교
    if hsname == 배병
    if hsname == 배성
    if hsname == 배성여자
    if hsname == 배아
    if hsname == 배영
    if hsname == 배영고등학교
    if hsname == 배인
    if hsname == 배재
    if hsname == 배재고등학교
    if hsname == 배정
    if hsname == 배정고등학교
    if hsname == 배제
    if hsname == 배진디라인
    if hsname == 배화
    if hsname == 배화고등학교
    if hsname == 배화여자
    if hsname == 배화여자고등학교
    if hsname == 백남
    if hsname == 백령
    if hsname == 백령종합
    if hsname == 백령종합고등학교
    if hsname == 백마
    if hsname == 백마고등학교
    if hsname == 백산
    if hsname == 백산고등학교
    if hsname == 백산여자
    if hsname == 백생
    if hsname == 백석
    if hsname == 백석(인천)
    if hsname == 백석고등학교
    if hsname == 백송고등학교
    if hsname == 백수고등학교
    if hsname == 백신
    if hsname == 백신고등학교
    if hsname == 백암
    if hsname == 백암고
    if hsname == 백암고등학교
    if hsname == 백앙
    if hsname == 백양
    if hsname == 백양고등학교
    if hsname == 백영
    if hsname == 백영고
    if hsname == 백영고등학교
    if hsname == 백운
    if hsname == 백운고등학교
    if hsname == 백제
    if hsname == 백제고등학교
    if hsname == 백제여자상업
    if hsname == 백현
    if hsname == 백현고등학교
    if hsname == 백화여자
    if hsname == 백화여자고등학교
    if hsname == 번박고등학교
    if hsname == 벌교
    if hsname == 벌교 상업
    if hsname == 벌교고등학교
    if hsname == 벌교상업
    if hsname == 벌교상업고등학교
    if hsname == 벌교여자
    if hsname == 벌교여자고등학교
    if hsname == 벌교제일
    if hsname == 벌교제일고등학교
    if hsname == 벌교제일고등학교(구:벌교상업고등학교)
    if hsname == 범박
    if hsname == 범박고등학교
    if hsname == 범서고등학교
    if hsname == 범어고등학교
    if hsname == 범천고등학교
    if hsname == 법성
    if hsname == 법성고등학교
    if hsname == 법성고등학교(구:법성상고)
    if hsname == 법성상업
    if hsname == 법성상업고등학교
    if hsname == 법인
    if hsname == 베레사여고
    if hsname == 벡양
    if hsname == 벨국제학교
    if hsname == 벽계
    if hsname == 벽제
    if hsname == 벽제고등학교 여천실업고등학교
    if hsname == 변경
    if hsname == 병안
    if hsname == 병영상업고등학교
    if hsname == 병영정보과학고등학교
    if hsname == 병운
    if hsname == 병점
    if hsname == 병점고등학교
    if hsname == 병천
    if hsname == 병천고등학교
    if hsname == 보건
    if hsname == 보광
    if hsname == 보광고등학교
    if hsname == 보당
    if hsname == 보라
    if hsname == 보령여자
    if hsname == 보명여자
    if hsname == 보문
    if hsname == 보문고등학교
    if hsname == 보문여자
    if hsname == 보문여자고등학교
    if hsname == 보성
    if hsname == 보성고등학교
    if hsname == 보성복내고등학교
    if hsname == 보성실업
    if hsname == 보성실업고등학교
    if hsname == 보성여고
    if hsname == 보성여자
    if hsname == 보성여자고등학교
    if hsname == 보성예당
    if hsname == 보성예당고등학교
    if hsname == 보성정보통신고등학교
    if hsname == 보성조성
    if hsname == 보안산업정보
    if hsname == 보영
    if hsname == 보영여자
    if hsname == 보영여자고등학교
    if hsname == 보영여자종고
    if hsname == 보용
    if hsname == 보운
    if hsname == 보원
    if hsname == 보은
    if hsname == 보은고등학교
    if hsname == 보은여고등학교
    if hsname == 보은여자
    if hsname == 보은여자고등학교
    if hsname == 보은여자고등학교(구: 보은농업고등학교)
    if hsname == 보은자연
    if hsname == 보은자영
    if hsname == 보은자영고등학교
    if hsname == 보은전자
    if hsname == 보은정보
    if hsname == 보은정보고등학교
    if hsname == 보인
    if hsname == 보인고등학교
    if hsname == 보인상업
    if hsname == 보인정보산업
    if hsname == 보인정보산업고등학교
    if hsname == 보정
    if hsname == 보정고등학교
    if hsname == 보평고등학교
    if hsname == 보형
    if hsname == 보황
    if hsname == 복가여자
    if hsname == 복성고등학교
    if hsname == 복수고등학교
    if hsname == 복자
    if hsname == 복자 여자
    if hsname == 복자여자
    if hsname == 복자여자고등학교
    if hsname == 복정고등학교
    if hsname == 복지
    if hsname == 복지 여자
    if hsname == 복천
    if hsname == 봉담고등학교
    if hsname == 봉림
    if hsname == 봉명고등학교
    if hsname == 봉민
    if hsname == 봉산
    if hsname == 봉안
    if hsname == 봉양정보
    if hsname == 봉양정보고등학교
    if hsname == 봉양중정보고등학교
    if hsname == 봉원
    if hsname == 봉의
    if hsname == 봉의고등학교
    if hsname == 봉이
    if hsname == 봉일천
    if hsname == 봉일천고등학교
    if hsname == 봉평
    if hsname == 봉평고등학교
    if hsname == 봉항
    if hsname == 봉향고등학교
    if hsname == 봉화
    if hsname == 봉화고등학교
    if hsname == 봉화여자
    if hsname == 봉화여자고등학교
    if hsname == 봉황
    if hsname == 봉황고등학교
    if hsname == 부간고등학교
    if hsname == 부강
    if hsname == 부강공업
    if hsname == 부강공업고등학교
    if hsname == 부강여
    if hsname == 부개
    if hsname == 부개 여자
    if hsname == 부개고등학교
    if hsname == 부개여
    if hsname == 부개여자
    if hsname == 부개여자고등학교
    if hsname == 부경
    if hsname == 부경고등학교
    if hsname == 부경보건
    if hsname == 부경보건고등학교
    if hsname == 부경여자고등학교
    if hsname == 부경정보고등학교
    if hsname == 부계
    if hsname == 부계여자
    if hsname == 부광
    if hsname == 부광 여자
    if hsname == 부광고등학교
    if hsname == 부광공업
    if hsname == 부광여자
    if hsname == 부광여자고등학교
    if hsname == 부동산여자
    if hsname == 부론고등학교
    if hsname == 부명
    if hsname == 부명고등학교
    if hsname == 부명상업
    if hsname == 부명정보
    if hsname == 부명정보산업
    if hsname == 부명정보산업고등학교
    if hsname == 부사고등학교
    if hsname == 부사진
    if hsname == 부산
    if hsname == 부산 공업
    if hsname == 부산 남 여자 상업고등학교
    if hsname == 부산 동성
    if hsname == 부산 마케팅
    if hsname == 부산 방송통신
    if hsname == 부산 부흥
    if hsname == 부산 삼정
    if hsname == 부산 서여자
    if hsname == 부산 여자
    if hsname == 부산 여자 상업
    if hsname == 부산 여자상업
    if hsname == 부산 영상 예술고등학교
    if hsname == 부산 외국어
    if hsname == 부산 전자공업
    if hsname == 부산 정문여자
    if hsname == 부산 정보
    if hsname == 부산 정보고등학교고등학교
    if hsname == 부산 중앙
    if hsname == 부산 중앙 여자
    if hsname == 부산 컴퓨터 과학
    if hsname == 부산가야
    if hsname == 부산가야고등학교
    if hsname == 부산강서
    if hsname == 부산강서고등학교
    if hsname == 부산개성고등학교
    if hsname == 부산개성여자상업
    if hsname == 부산경남공업고등학교
    if hsname == 부산경영고등학교
    if hsname == 부산경원고등학교
    if hsname == 부산경호
    if hsname == 부산경호고등학교
    if hsname == 부산경희여자
    if hsname == 부산계금
    if hsname == 부산고등학교
    if hsname == 부산골프
    if hsname == 부산골프고등학교
    if hsname == 부산공업
    if hsname == 부산공업고등학교
    if hsname == 부산과학
    if hsname == 부산과학고
    if hsname == 부산과학고등학교
    if hsname == 부산과학정보고등학교
    if hsname == 부산관광
    if hsname == 부산관광고등학교
    if hsname == 부산국제
    if hsname == 부산국제 외국어
    if hsname == 부산국제고등학교
    if hsname == 부산국제금융고등학교
    if hsname == 부산국제영화
    if hsname == 부산국제영화고등학교
    if hsname == 부산국제외국어
    if hsname == 부산국제외국어고등학교
    if hsname == 부산금곡고등학교
    if hsname == 부산금성고등학교
    if hsname == 부산금정전자
    if hsname == 부산기계
    if hsname == 부산기계공
    if hsname == 부산기계공업
    if hsname == 부산기계공업고등학교
    if hsname == 부산낙동
    if hsname == 부산남
    if hsname == 부산남고
    if hsname == 부산남고등학교
    if hsname == 부산남산
    if hsname == 부산남산고등학교
    if hsname == 부산남성여자고등학교
    if hsname == 부산남여자고등학교
    if hsname == 부산남일
    if hsname == 부산남일고등학교
    if hsname == 부산남자
    if hsname == 부산남자고등학교
    if hsname == 부산납여자
    if hsname == 부산다대
    if hsname == 부산대동고등학교
    if hsname == 부산대양정보공업
    if hsname == 부산대연
    if hsname == 부산대저
    if hsname == 부산대저고등학교
    if hsname == 부산대학교  사범대학 부설고등학교
    if hsname == 부산대학교 사범대학 부설
    if hsname == 부산대학교 사범대학 부설고등학교
    if hsname == 부산대학교사범대학부설
    if hsname == 부산대학교사범대학부설고등학교
    if hsname == 부산대학교사범부설
    if hsname == 부산덕명여자상업
    if hsname == 부산동
    if hsname == 부산동고등학교
    if hsname == 부산동래상업여자
    if hsname == 부산동성
    if hsname == 부산동성고등학교
    if hsname == 부산동아공업
    if hsname == 부산동아여자
    if hsname == 부산동여
    if hsname == 부산동여자
    if hsname == 부산동여자고등학교
    if hsname == 부산동의공업
    if hsname == 부산동천
    if hsname == 부산동천고등학교
    if hsname == 부산디자인
    if hsname == 부산디자인고등학교
    if hsname == 부산디지털
    if hsname == 부산디지털고등학교
    if hsname == 부산마케팅
    if hsname == 부산마케팅고등학교
    if hsname == 부산마케팅고등학교(구:덕명여자정보고..
    if hsname == 부산맹학교
    if hsname == 부산명호고등학교
    if hsname == 부산문화여자
    if hsname == 부산문화여자고등학교
    if hsname == 부산미용
    if hsname == 부산미용고등학교
    if hsname == 부산미용고등학교(구/동평여자상업고)
    if hsname == 부산백양
    if hsname == 부산백양고등학교
    if hsname == 부산보건고등학교
    if hsname == 부산부경고등학교
    if hsname == 부산부성정보
    if hsname == 부산부일외국어
    if hsname == 부산부흥
    if hsname == 부산사대부
    if hsname == 부산사대부고
    if hsname == 부산사대부설
    if hsname == 부산사대부속
    if hsname == 부산사대부속고등학교
    if hsname == 부산사범대부속
    if hsname == 부산사범대학부설
    if hsname == 부산사범대학부설고등학교
    if hsname == 부산사직
    if hsname == 부산산업과학
    if hsname == 부산산업과학고등학교
    if hsname == 부산산업정보
    if hsname == 부산삼성여자
    if hsname == 부산삼성여자고등학교
    if hsname == 부산상고
    if hsname == 부산상업
    if hsname == 부산상업고등학교
    if hsname == 부산서여고
    if hsname == 부산서여자
    if hsname == 부산서여자고등학교
    if hsname == 부산성도
    if hsname == 부산성모여자고등학교
    if hsname == 부산성지고등학교
    if hsname == 부산세무고등학교
    if hsname == 부산신도
    if hsname == 부산신도고등학교
    if hsname == 부산신정고등학교
    if hsname == 부산양정고등학교
    if hsname == 부산에너지과학
    if hsname == 부산에너지과학고등학교
    if hsname == 부산여고
    if hsname == 부산여상
    if hsname == 부산여상업
    if hsname == 부산여자
    if hsname == 부산여자고등학교
    if hsname == 부산여자산업
    if hsname == 부산여자상업
    if hsname == 부산여자상업고등학교
    if hsname == 부산영남상업
    if hsname == 부산영상예술
    if hsname == 부산영상예술고등학교
    if hsname == 부산영재고등학교
    if hsname == 부산예술
    if hsname == 부산예술고등학교
    if hsname == 부산외
    if hsname == 부산외고
    if hsname == 부산외국어
    if hsname == 부산외국어고등학교
    if hsname == 부산용인
    if hsname == 부산용인고등학교
    if hsname == 부산자동차
    if hsname == 부산자동차고등학교
    if hsname == 부산장 안
    if hsname == 부산장안고등학교
    if hsname == 부산전자
    if hsname == 부산전자공고
    if hsname == 부산전자공업
    if hsname == 부산전자공업고등학교
    if hsname == 부산전자정보
    if hsname == 부산정명여자고등학교
    if hsname == 부산정보
    if hsname == 부산정보고
    if hsname == 부산정보고등
    if hsname == 부산정보고등학교
    if hsname == 부산정보과학
    if hsname == 부산정보과학고등학교
    if hsname == 부산정보관광
    if hsname == 부산정보관광고등학교
    if hsname == 부산정보디자인
    if hsname == 부산정보여자고등학교
    if hsname == 부산제일고등학교
    if hsname == 부산제일종합
    if hsname == 부산제일종합고등학교
    if hsname == 부산조리
    if hsname == 부산조리고등학교
    if hsname == 부산중앙
    if hsname == 부산중앙고등
    if hsname == 부산중앙고등학교
    if hsname == 부산중앙여자
    if hsname == 부산중앙여자고등학교
    if hsname == 부산중양여자
    if hsname == 부산지산
    if hsname == 부산지산고등학교
    if hsname == 부산진
    if hsname == 부산진 여자
    if hsname == 부산진고등학교
    if hsname == 부산진구
    if hsname == 부산진여자
    if hsname == 부산진여자고등학교
    if hsname == 부산진여자상업
    if hsname == 부산진여자상업고등학교
    if hsname == 부산체육
    if hsname == 부산체육고등학교
    if hsname == 부산컴퓨터과학
    if hsname == 부산컴퓨터과학 고
    if hsname == 부산컴퓨터과학고등학교
    if hsname == 부산항만물류고등학교
    if hsname == 부산해사
    if hsname == 부산해사고등학교
    if hsname == 부산해양고등학교
    if hsname == 부산해운대
    if hsname == 부산혜광
    if hsname == 부산혜화
    if hsname == 부산혜화여자
    if hsname == 부산혜화여자고등학교
    if hsname == 부석
    if hsname == 부석고등학교
    if hsname == 부설고등학교
    if hsname == 부성
    if hsname == 부성고등학교
    if hsname == 부성고등학교고등학교
    if hsname == 부성여자
    if hsname == 부성정보고등학교
    if hsname == 부안
    if hsname == 부안 여자
    if hsname == 부안고등학교
    if hsname == 부안실업
    if hsname == 부안여상
    if hsname == 부안여자
    if hsname == 부안여자고등학교
    if hsname == 부안여자상업
    if hsname == 부안여자상업고등학교
    if hsname == 부안제일고등학교
    if hsname == 부여
    if hsname == 부여 여자
    if hsname == 부여고등학교
    if hsname == 부여산업과학
    if hsname == 부여산업과학고등학교
    if hsname == 부여여자
    if hsname == 부여여자고등학교
    if hsname == 부여전자고등학교
    if hsname == 부여정보
    if hsname == 부여정보고등학교
    if hsname == 부여홍상농공업
    if hsname == 부영
    if hsname == 부영여자
    if hsname == 부영여자고등학교
    if hsname == 부영여자상업
    if hsname == 부용
    if hsname == 부용고등학교
    if hsname == 부웅
    if hsname == 부원
    if hsname == 부원고등학교
    if hsname == (구 장호공업고/장호원공업..
    if hsname == 부원여자
    if hsname == 부윤고등학교
    if hsname == 부이천상업
    if hsname == 부일
    if hsname == 부일 외국어
    if hsname == 부일디자인
    if hsname == 부일여자
    if hsname == 부일여자고등학교
    if hsname == 부일외고
    if hsname == 부일외국어
    if hsname == 부일외국어고등학교
    if hsname == 부일전자
    if hsname == 부일전자고등학교
    if hsname == 부일전자공업
    if hsname == 부일전자디자인
    if hsname == 부일전자디자인고등학교
    if hsname == 부자여자
    if hsname == 부정
    if hsname == 부천
    if hsname == 부천 북
    if hsname == 부천 여자
    if hsname == 부천 정보 산업
    if hsname == 부천 정보산업
    if hsname == 부천OO
    if hsname == 부천계남
    if hsname == 부천계남고등학교
    if hsname == 부천계남자고등학교
    if hsname == 부천고등학교
    if hsname == 부천공고
    if hsname == 부천공업
    if hsname == 부천공업고등학교
    if hsname == 부천덕산
    if hsname == 부천북
    if hsname == 부천북고등학교
    if hsname == 부천산업정보
    if hsname == 부천상동
    if hsname == 부천상업
    if hsname == 부천상원
    if hsname == 부천소명
    if hsname == 부천소명여자
    if hsname == 부천소사
    if hsname == 부천소사구
    if hsname == 부천시온
    if hsname == 부천실업
    if hsname == 부천심원
    if hsname == 부천여
    if hsname == 부천여자
    if hsname == 부천여자고등학교
    if hsname == 부천원미
    if hsname == 부천원종
    if hsname == 부천정명고등학교
    if hsname == 부천정보
    if hsname == 부천정보고등학교
    if hsname == 부천정보공업
    if hsname == 부천정보산업
    if hsname == 부천정보산업고등학교
    if hsname == 부천정보상업
    if hsname == 부천정산
    if hsname == 부천중동고등학교
    if hsname == 부천중앙
    if hsname == 부천중흥
    if hsname == 부평
    if hsname == 부평 공업
    if hsname == 부평 여자과학
    if hsname == 부평고등학교
    if hsname == 부평공업
    if hsname == 부평공업고등학교
    if hsname == 부평과학
    if hsname == 부평기술
    if hsname == 부평디자인과학
    if hsname == 부평디자인과학고
    if hsname == 부평디자인과학고등학교
    if hsname == 부평상업고등학교
    if hsname == 부평여상
    if hsname == 부평여자
    if hsname == 부평여자경영정보고등학교
    if hsname == 부평여자고등학교
    if hsname == 부평여자공업고등학교
    if hsname == 부평여자상업
    if hsname == 부평여자상업고등학교
    if hsname == 부평정보
    if hsname == 부평정보고등학교
    if hsname == 부흥
    if hsname == 부흥고등학교
    if hsname == 북
    if hsname == 북공
    if hsname == 북공고
    if hsname == 북공고등학교
    if hsname == 북공업
    if hsname == 북령
    if hsname == 북삼고등학교
    if hsname == 북서울
    if hsname == 북원
    if hsname == 북원여자
    if hsname == 북원여자고등학교
    if hsname == 북인천
    if hsname == 북인천고등학교
    if hsname == 북인천상업여자
    if hsname == 북인천정보
    if hsname == 북인천정보산업
    if hsname == 북인천정보산업고등학교
    if hsname == 북인천정보선업고등학교
    if hsname == 북일
    if hsname == 북일고등학교
    if hsname == 북일여고
    if hsname == 북일여자
    if hsname == 북일여자고등학교
    if hsname == 북자여자
    if hsname == 북제주세화고등학교
    if hsname == 북천북
    if hsname == 북평
    if hsname == 북평 여자
    if hsname == 북평고등학교
    if hsname == 북평상업고등학교
    if hsname == 북평여자
    if hsname == 북평여자고등학교
    if hsname == 북형여자
    if hsname == 분단정보산업
    if hsname == 분당
    if hsname == 분당 대진
    if hsname == 분당 중앙
    if hsname == 분당 태원
    if hsname == 분당경영
    if hsname == 분당경영고등학교
    if hsname == 분당고등학교
    if hsname == 분당대진
    if hsname == 분당대진고등학교
    if hsname == 분당돌마
    if hsname == 분당상업
    if hsname == 분당송림
    if hsname == 분당영덕
    if hsname == 분당영덕고등학교
    if hsname == 분당영덕여자
    if hsname == 분당영덕여자고등학교
    if hsname == 분당영동여자
    if hsname == 분당이매
    if hsname == 분당정보
    if hsname == 분당정보산업
    if hsname == 분당정보산업고등학교
    if hsname == 분당정보상업
    if hsname == 분당중앙
    if hsname == 분당중앙고등학교
    if hsname == 분산여자
    if hsname == 분성
    if hsname == 분성여고등학교
    if hsname == 분성여자
    if hsname == 분성여자고등학교
    if hsname == 분원
    if hsname == 분포
    if hsname == 분포고등학교
    if hsname == 분포도
    if hsname == 불곡
    if hsname == 불곡고등학교
    if hsname == 불바
    if hsname == 불암
    if hsname == 불암고등학교
    if hsname == 브니엘
    if hsname == 브니엘 여자
    if hsname == 브니엘고등학교
    if hsname == 브니엘여자
    if hsname == 브니엘여자고등학교
    if hsname == 브니엘예술
    if hsname == 브니엘예술고등학교
    if hsname == 브룩필드(캐나다)
    if hsname == 브리엘여자
    if hsname == 브이엘
    if hsname == 비금
    if hsname == 비금고등학교
    if hsname == 비봉
    if hsname == 비봉고등학교
    if hsname == 비안고등학교
    if hsname == 비지니스
    if hsname == 빛고을고등학교
    if hsname == 사곡
    if hsname == 사곡고등학교
    if hsname == 사내
    if hsname == 사내고등학교
    if hsname == 사대부
    if hsname == 사대부고
    if hsname == 사대부고등학교
    if hsname == 사대부설
    if hsname == 사대부설고등
    if hsname == 사대부설고등학교
    if hsname == 사대부속
    if hsname == 사대부속고등학교
    if hsname == 사랑방고등학교
    if hsname == 사면여자
    if hsname == 사명여자
    if hsname == 사민
    if hsname == 사벌고등학교
    if hsname == 사범대부속
    if hsname == 사범대학부설
    if hsname == 사범대학부설고등학교
    if hsname == 사범대학부속
    if hsname == 사범대학부속고등학교
    if hsname == 사북
    if hsname == 사북고등학교
    if hsname == 사상
    if hsname == 사상고등학교
    if hsname == 사성
    if hsname == 사양여자
    if hsname == 사우
    if hsname == 사우고등학교
    if hsname == 사웅
    if hsname == 사정
    if hsname == 사직
    if hsname == 사직고등학교
    if hsname == 사직여고
    if hsname == 사직여자
    if hsname == 사직여자고등학교
    if hsname == 사천
    if hsname == 사천고등학교
    if hsname == 사천삼천포중앙고등학교
    if hsname == 사천여자
    if hsname == 사천여자고등학교
    if hsname == 사천여자정보고등학교
    if hsname == 사천용남
    if hsname == 사천자영
    if hsname == 사파
    if hsname == 사파고등학교
    if hsname == 사하
    if hsname == 산곡
    if hsname == 산곡고등학교
    if hsname == 산꼐
    if hsname == 산남
    if hsname == 산남고등학교
    if hsname == 산남여자고등학교
    if hsname == 산남자고등학교
    if hsname == 산동종합
    if hsname == 산림
    if hsname == 산마을고등학교
    if hsname == 산본
    if hsname == 산본(경기도)
    if hsname == 산본고
    if hsname == 산본고등학교
    if hsname == 산본공고
    if hsname == 산본공업
    if hsname == 산본공업고등학교
    if hsname == 산북
    if hsname == 산북고등학교
    if hsname == 산서고등학교
    if hsname == 산성
    if hsname == 산업고등학교
    if hsname == 산일
    if hsname == 산정
    if hsname == 산정고등학교
    if hsname == 산청
    if hsname == 산청간디고등학교
    if hsname == 산청간지
    if hsname == 산청고등학교
    if hsname == 산청신등
    if hsname == 산청여자
    if hsname == 산현
    if hsname == 살레사오여자
    if hsname == 살레시아여자
    if hsname == 살레시오
    if hsname == 살레시오 여자
    if hsname == 살레시오고등학교
    if hsname == 살레시오여자
    if hsname == 살레시오여자고등학교
    if hsname == 살레지
    if hsname == 살레지오
    if hsname == 살레지오여자
    if hsname == 삼가
    if hsname == 삼가고등학교
    if hsname == 삼계고등학교
    if hsname == 삼계종합
    if hsname == 삼공
    if hsname == 삼광
    if hsname == 삼광고등학교
    if hsname == 삼괴
    if hsname == 삼괴고등학교
    if hsname == 삼교
    if hsname == 삼궤종합
    if hsname == 삼남정보고등학교
    if hsname == 삼다리
    if hsname == 삼덕
    if hsname == 삼덕 정보
    if hsname == 삼돌고등학교
    if hsname == 삼동
    if hsname == 삼랑진
    if hsname == 삼랑진고등학교
    if hsname == 삼량
    if hsname == 삼량고등학교
    if hsname == 삼량진
    if hsname == 삼례공업
    if hsname == 삼례공업고등학교
    if hsname == 삼례여자
    if hsname == 삼리
    if hsname == 삼린전자공업
    if hsname == 삼문
    if hsname == 삼방
    if hsname == 삼방고등학교
    if hsname == 삼본
    if hsname == 삼본공업
    if hsname == 삼사
    if hsname == 삼산
    if hsname == 삼산고등학교
    if hsname == 삼산전자고등학교
    if hsname == 삼서여자상업
    if hsname == 삼선고등학교
    if hsname == 삼선예술
    if hsname == 삼성
    if hsname == 삼성 여자
    if hsname == 삼성(서울)
    if hsname == 삼성고등학교
    if hsname == 삼성과학
    if hsname == 삼성생활예술고등학교
    if hsname == 삼성여고
    if hsname == 삼성여자
    if hsname == 삼성여자고등학교
    if hsname == 삼성정보
    if hsname == 삼송
    if hsname == 삼양
    if hsname == 삼열여자
    if hsname == 삼원
    if hsname == 삼육
    if hsname == 삼육고등
    if hsname == 삼육고등학교
    if hsname == 삼육공업
    if hsname == 삼육재활
    if hsname == 삼육재활학교
    if hsname == 삼일
    if hsname == 삼일 공업
    if hsname == 삼일 상업
    if hsname == 삼일 여자
    if hsname == 삼일고등학교
    if hsname == 삼일공 업
    if hsname == 삼일공업
    if hsname == 삼일공업고등학교
    if hsname == 삼일상업
    if hsname == 삼일상업고등학교
    if hsname == 삼일실업
    if hsname == 삼일여고
    if hsname == 삼일여자
    if hsname == 삼일여자고등학교
    if hsname == 삼정
    if hsname == 삼정고등
    if hsname == 삼정고등학교
    if hsname == 삼정고등학교고등학교
    if hsname == 삼정정보
    if hsname == 삼정정보고등학교
    if hsname == 삼진
    if hsname == 삼진공업
    if hsname == 삼척
    if hsname == 삼척고등학교
    if hsname == 삼척마이스터고등학교
    if hsname == 삼척삼일
    if hsname == 삼척여자
    if hsname == 삼척여자고등학교
    if hsname == 삼척전자
    if hsname == 삼척전자공업
    if hsname == 삼척전자공업고등학교
    if hsname == 삼척하장고등학교
    if hsname == 삼천포
    if hsname == 삼천포고등학교
    if hsname == 삼천포공업
    if hsname == 삼천포공업고등학교
    if hsname == 삼천포여자
    if hsname == 삼천포여자고등학교
    if hsname == 삼천포중앙
    if hsname == 삼천포중앙고등학교
    if hsname == 삼풍
    if hsname == 삼현
    if hsname == 삼현여자
    if hsname == 삼현여자고등학교
    if hsname == 삼화여자상업
    if hsname == 삼환
    if hsname == 삽교
    if hsname == 삽교고등학교
    if hsname == 상계
    if hsname == 상계고등학교
    if hsname == 상괴종합
    if hsname == 상구
    if hsname == 상당
    if hsname == 상당고등학교
    if hsname == 상덕
    if hsname == 상동
    if hsname == 상동고
    if hsname == 상동고등학교
    if hsname == 상래공업
    if hsname == 상록고등학교
    if hsname == 상명
    if hsname == 상명 사대부속
    if hsname == 상명고
    if hsname == 상명고등학교
    if hsname == 상명공업
    if hsname == 상명대부속
    if hsname == 상명대부속여자
    if hsname == 상명대부속여자고등학교
    if hsname == 상명대부여자
    if hsname == 상명대학교 사범대학 부속여자고등학교
    if hsname == 상명대학교부설여자
    if hsname == 상명대학교부속여자
    if hsname == 상명대학교사범대학부속
    if hsname == 상명대학교사범대학부속여자
    if hsname == 상명대학교사범대학부속여자고등학교
    if hsname == 상명대학부속
    if hsname == 상명부속여자
    if hsname == 상명부여
    if hsname == 상명사대부속
    if hsname == 상명사대부속고등학교
    if hsname == 상명사대부속여자
    if hsname == 상명사대부속여자고등학교
    if hsname == 상명사범대학부속여자
    if hsname == 상명여자
    if hsname == 상모
    if hsname == 상모고등학교
    if hsname == 상무
    if hsname == 상무고등학교
    if hsname == 상문
    if hsname == 상문고등학교
    if hsname == 상문여자
    if hsname == 상북
    if hsname == 상산
    if hsname == 상산고등학교
    if hsname == 상산전자
    if hsname == 상산전자고등학교
    if hsname == 상산전자공업
    if hsname == 상산전자공업고등학교
    if hsname == 상서
    if hsname == 상서고등학교
    if hsname == 상서여자
    if hsname == 상서여자경영정보
    if hsname == (대구여자경영..
    if hsname == 상서여자고등학교
    if hsname == 상서여자상업
    if hsname == 상서여자상업고등학교
    if hsname == 상서여자정보
    if hsname == 상서여자정보고등학교
    if hsname == 상신정보
    if hsname == 상암
    if hsname == 상암고등학교
    if hsname == 상업
    if hsname == 상업고등학교
    if hsname == 상영여자
    if hsname == 상오고등학교
    if hsname == 상우
    if hsname == 상우고등학교
    if hsname == 상원
    if hsname == 상원고등학교
    if hsname == 상원정보
    if hsname == 상육
    if hsname == 상인
    if hsname == 상인고등학교
    if hsname == 상일
    if hsname == 상일 여자
    if hsname == 상일고등학교
    if hsname == 상일공업
    if hsname == 상일디자인
    if hsname == 상일미디어
    if hsname == 상일미디어고등학교
    if hsname == 상일여고
    if hsname == 상일여자
    if hsname == 상일여자고등학교
    if hsname == 상임여자고등학교
    if hsname == 상정
    if hsname == 상정고등학교
    if hsname == 상주
    if hsname == 상주 공업
    if hsname == 상주 여자
    if hsname == 상주고등학교
    if hsname == 상주공
    if hsname == 상주공업
    if hsname == 상주공업고등학교
    if hsname == 상주상지여자고등학교
    if hsname == 상주여고
    if hsname == 상주여상
    if hsname == 상주여자
    if hsname == 상주여자고등학교
    if hsname == 상주여자공업
    if hsname == 상주여자상업
    if hsname == 상주여자상업고등학교
    if hsname == 상지
    if hsname == 상지대관령
    if hsname == 상지대관령고등학교
    if hsname == 상지여자
    if hsname == 상지여자고등학교
    if hsname == 상현
    if hsname == 상현고등학교
    if hsname == 상현여자
    if hsname == 상호
    if hsname == 새벽나래 고등학교
    if hsname == 새서울정보산업
    if hsname == 새원
    if hsname == 새원고등학교
    if hsname == 새일
    if hsname == 새풀
    if hsname == 새화
    if hsname == 샌폴여자
    if hsname == 생명과학
    if hsname == 생명과학고등
    if hsname == 생명과학고등학교
    if hsname == 생초
    if hsname == 생초고등학교
    if hsname == 생활과학
    if hsname == 샬레시오
    if hsname == 서강
    if hsname == 서강고등학교
    if hsname == 서강여자
    if hsname == 서고
    if hsname == 서광
    if hsname == 서광고등학교
    if hsname == 서광여자고등학교
    if hsname == 서귀고등학교
    if hsname == 서귀산업과학
    if hsname == 서귀여상
    if hsname == 서귀여자
    if hsname == 서귀여자상업
    if hsname == 서귀포
    if hsname == 서귀포 여자
    if hsname == 서귀포고등학교
    if hsname == 서귀포남주
    if hsname == 서귀포산업과학
    if hsname == 서귀포산업과학고등학교
    if hsname == 서귀포산업과학고등학교(구/서귀포농업..
    if hsname == 서귀포삼성여자고등학교
    if hsname == 서귀포여고
    if hsname == 서귀포여자
    if hsname == 서귀포여자고등학교
    if hsname == 서귀포중문상업
    if hsname == 서대전
    if hsname == 서대전 공업
    if hsname == 서대전 여자
    if hsname == 서대전고등학교
    if hsname == 서대전공업
    if hsname == 서대전여
    if hsname == 서대전여고
    if hsname == 서대전여자
    if hsname == 서대전여자고등학교
    if hsname == 서도고등학교
    if hsname == 서라벌
    if hsname == 서라벌고등학교
    if hsname == 서라빈
    if hsname == 서령
    if hsname == 서령고등학교
    if hsname == 서면
    if hsname == 서명
    if hsname == 서문
    if hsname == 서문 여자
    if hsname == 서문고
    if hsname == 서문여자
    if hsname == 서문여자고등학교
    if hsname == 서부
    if hsname == 서부고등학교
    if hsname == 서부공
    if hsname == 서부공.공업
    if hsname == 서부공업
    if hsname == 서부공업고등학교
    if hsname == 서부산고등학교
    if hsname == 서부산공
    if hsname == 서부산공고
    if hsname == 서부산공업
    if hsname == 서부산공업고
    if hsname == 서부산공업고등학교
    if hsname == 서사고등학교
    if hsname == 서산
    if hsname == 서산 여자
    if hsname == 서산고등학교
    if hsname == 서산농공업
    if hsname == 서산농림
    if hsname == 서산농림고등학교
    if hsname == 서산농업
    if hsname == 서산부석
    if hsname == 서산여고
    if hsname == 서산여자
    if hsname == 서산여자고등학교
    if hsname == 서산중앙
    if hsname == 서산중앙고등학교
    if hsname == 서상
    if hsname == 서상고등학교
    if hsname == 서서울
    if hsname == 서서울고등학교
    if hsname == 서서울생활
    if hsname == 서서울생활고등학교
    if hsname == 서서울생활과학
    if hsname == 서서울생활과학고등학교
    if hsname == 서서울정보산업고등학교
    if hsname == 서석
    if hsname == 서석고등학교
    if hsname == 서신고등학교
    if hsname == 서신여자상업
    if hsname == 서암 국제무역
    if hsname == 서야
    if hsname == 서야고등학교
    if hsname == 서여자
    if hsname == 서영
    if hsname == 서영 여자
    if hsname == 서영여자
    if hsname == 서영여자고등학교
    if hsname == 서운
    if hsname == 서운고등학교
    if hsname == 서운여자
    if hsname == 서울
    if hsname == 서울  자양
    if hsname == 서울 강서
    if hsname == 서울 경인
    if hsname == 서울 공업
    if hsname == 서울 과학
    if hsname == 서울 금융
    if hsname == 서울 동성
    if hsname == 서울 디자인
    if hsname == 서울 로봇
    if hsname == 서울 문일
    if hsname == 서울 미술
    if hsname == 서울 삼육
    if hsname == 서울 석관
    if hsname == 서울 성남
    if hsname == 서울 성지
    if hsname == 서울 세종
    if hsname == 서울 수도 전기 공업
    if hsname == 서울 언남
    if hsname == 서울 여상
    if hsname == 서울 여자
    if hsname == 서울 연희 미용
    if hsname == 서울 영상
    if hsname == 서울 외
    if hsname == 서울 외고
    if hsname == 서울 장충
    if hsname == 서울 정신
    if hsname == 서울 정신내
    if hsname == 서울 중화
    if hsname == 서울 청원
    if hsname == 서울 한광
    if hsname == 서울 한영
    if hsname == 서울강동
    if hsname == 서울강동고등학교
    if hsname == 서울강서
    if hsname == 서울강서고등학교
    if hsname == 서울경기여자
    if hsname == 서울경복
    if hsname == 서울경성
    if hsname == 서울경성고등학교
    if hsname == 서울경신
    if hsname == 서울경영
    if hsname == 서울경영정보
    if hsname == 서울경영정보고등학교
    if hsname == 서울계성여자
    if hsname == 서울고대부속
    if hsname == 서울고등학교
    if hsname == 서울고척
    if hsname == 서울공고
    if hsname == 서울공업
    if hsname == 서울공업고등학교
    if hsname == 서울공연예술
    if hsname == 서울공연예술고등학교
    if hsname == 서울공항고등학교
    if hsname == 서울과학
    if hsname == 서울과학고등학교
    if hsname == 서울관광
    if hsname == 서울관광고등학교
    if hsname == 서울관악
    if hsname == 서울광
    if hsname == 서울광남고등학교
    if hsname == 서울광남자고등학교
    if hsname == 서울광문
    if hsname == 서울광성
    if hsname == 서울광성고등학교
    if hsname == 서울광양
    if hsname == 서울광양고등학교
    if hsname == 서울광영고등학교
    if hsname == 서울광진학교
    if hsname == 서울구일
    if hsname == 서울국립맹아학교
    if hsname == 서울국립전통예술
    if hsname == 서울국악
    if hsname == 서울국악예
    if hsname == 서울국악예술
    if hsname == 서울국악예술고등학교
    if hsname == 서울국제고등학교
    if hsname == 서울금융
    if hsname == 서울금융고등학교
    if hsname == 서울금융고등학교(구: 남서울상업고)
    if hsname == 서울금융정보
    if hsname == 서울기계공업고등학교
    if hsname == 서울남강
    if hsname == 서울농아
    if hsname == 서울대광
    if hsname == 서울대방
    if hsname == 서울대성
    if hsname == 서울대성고등학교
    if hsname == 서울대신
    if hsname == 서울대신고등학교
    if hsname == 서울대영고등학교
    if hsname == 서울대진
    if hsname == 서울대진여자고등학교
    if hsname == 서울대학교사범대학부설
    if hsname == 서울대학교사범대학부설고등학교
    if hsname == 서울덕원예술
    if hsname == 서울도시과학
    if hsname == 서울도시과학기술고등학교
    if hsname == 서울동도공업
    if hsname == 서울동성
    if hsname == 서울동성고등학교
    if hsname == 서울디자인
    if hsname == 서울디자인고등학교
    if hsname == 서울디지털고등학교
    if hsname == 서울디지텍
    if hsname == 서울디지텍고등학교
    if hsname == 서울로봇
    if hsname == 서울로봇고등학교
    if hsname == 서울맹
    if hsname == 서울맹아
    if hsname == 서울맹학교
    if hsname == 서울무학여자
    if hsname == 서울문영여자
    if hsname == 서울문영여자고등학교
    if hsname == 서울문일
    if hsname == 서울문화
    if hsname == 서울문화고등학교
    if hsname == 서울문화예술
    if hsname == 서울미림여자
    if hsname == 서울미술
    if hsname == 서울미술고등학교
    if hsname == 서울방산
    if hsname == 서울방송
    if hsname == 서울방송고등학교
    if hsname == 서울백암
    if hsname == 서울백암고등학교
    if hsname == 서울보성
    if hsname == 서울보성고등학교
    if hsname == 서울보성여자
    if hsname == 서울북공업
    if hsname == 서울북공업고등학교
    if hsname == 서울사대부
    if hsname == 서울사대부고
    if hsname == 서울사대부속
    if hsname == 서울사대부속고등학교
    if hsname == 서울사범대학부설
    if hsname == 서울사법대학교 부설
    if hsname == 서울삼성고등학교
    if hsname == 서울삼육
    if hsname == 서울삼육고등학교
    if hsname == 서울상업
    if hsname == 서울선일여자
    if hsname == 서울선정
    if hsname == 서울성남
    if hsname == 서울성수고등학교
    if hsname == 서울세정고등학교
    if hsname == 서울세종
    if hsname == 서울세종고등학교
    if hsname == 서울소재여자
    if hsname == 서울숭실
    if hsname == 서울신목
    if hsname == 서울신일고등학교
    if hsname == 서울신현
    if hsname == 서울아이티
    if hsname == 서울아이티고등학교
    if hsname == 서울양정
    if hsname == 서울언남
    if hsname == 서울여상
    if hsname == 서울여자
    if hsname == 서울여자고등학교
    if hsname == 서울여자상업
    if hsname == 서울여자상업고등학교
    if hsname == 서울연희미용
    if hsname == 서울연희미용고등학교
    if hsname == 서울영동
    if hsname == 서울영동고등학교
    if hsname == 서울영동여자
    if hsname == 서울영등포여자상업고등학교
    if hsname == 서울영상
    if hsname == 서울영상고등학교
    if hsname == 서울영상고등학교(구:영등포여자상업고)
    if hsname == 서울영서
    if hsname == 서울영신
    if hsname == 서울영신고등학교
    if hsname == 서울영신여자고등학교
    if hsname == 서울영일
    if hsname == 서울영일고등학교
    if hsname == 서울예술
    if hsname == 서울예술고등학교
    if hsname == 서울예술국악
    if hsname == 서울오산
    if hsname == 서울오산고등학교
    if hsname == 서울외
    if hsname == 서울외고
    if hsname == 서울외국어
    if hsname == 서울외국어고등학교
    if hsname == 서울우신
    if hsname == 서울인창고등학교
    if hsname == 서울자동차
    if hsname == 서울자동차고등학교
    if hsname == 서울전자
    if hsname == 서울전자고등학교
    if hsname == 서울종곡
    if hsname == 서울중산고등학교
    if hsname == 서울중앙
    if hsname == 서울중앙고등학교
    if hsname == 서울중앙여자
    if hsname == 서울중앙여자고등학교
    if hsname == 서울지디텍
    if hsname == 서울진명여자
    if hsname == 서울진형
    if hsname == 서울청담고등학교
    if hsname == 서울청량리
    if hsname == 서울청양
    if hsname == 서울청원
    if hsname == 서울체육
    if hsname == 서울체육고등학교
    if hsname == 서울컨벤션고등학교
    if hsname == 서울한광고등학교
    if hsname == 서울한성여자
    if hsname == 서울한영
    if hsname == 서울한영고등학교
    if hsname == 서울항공
    if hsname == 서울현강여자정보고등학교
    if hsname == 서울현대
    if hsname == 서울현대고등학교
    if hsname == 서울혜화여자
    if hsname == 서원
    if hsname == 서원고등학교
    if hsname == 서인
    if hsname == 서인천
    if hsname == 서인천고
    if hsname == 서인천고등학교
    if hsname == 서일
    if hsname == 서일 국제 경영
    if hsname == 서일고등학교
    if hsname == 서일고등학교고등학교
    if hsname == 서일여자
    if hsname == 서일여자고등학교
    if hsname == 서일여자상업
    if hsname == 서일여자상업고등학교
    if hsname == 서일정보산업
    if hsname == 서일정보산업고등학교
    if hsname == 서진
    if hsname == 서진고등학교
    if hsname == 서진여고
    if hsname == 서진여자
    if hsname == 서진여자고등학교
    if hsname == 서찬여자정보
    if hsname == 서창고등학교
    if hsname == 서천
    if hsname == 서천 여자
    if hsname == 서천고등학교
    if hsname == 서천농업고등학교
    if hsname == 서천상업
    if hsname == 서천여상고등학교
    if hsname == 서천여자
    if hsname == 서천여자고등학교
    if hsname == 서천여자정보
    if hsname == 서천여자정보고등학교
    if hsname == 서천정보여자
    if hsname == 서초
    if hsname == 서초 전자
    if hsname == 서초고등학교
    if hsname == 서초전자
    if hsname == 서초전자고등학교
    if hsname == 서해
    if hsname == 서해고등학교
    if hsname == 서해삼육
    if hsname == 서해삼육고등학교
    if hsname == 서현
    if hsname == 서현고등학교
    if hsname == 서혜
    if hsname == 서화 여자
    if hsname == 서흥중학교
    if hsname == 석곡고등학교
    if hsname == 석관
    if hsname == 석관고
    if hsname == 석관고등학교
    if hsname == 석광
    if hsname == 석교
    if hsname == 석교고등학교
    if hsname == 석산
    if hsname == 석산고
    if hsname == 석산고등학교
    if hsname == 석수
    if hsname == 석우
    if hsname == 석정
    if hsname == 석정고등학교
    if hsname == 석정여
    if hsname == 석정여자
    if hsname == 석정여자고등학교
    if hsname == 석정여자종합
    if hsname == 석천여자상업고등학교
    if hsname == 선경
    if hsname == 선곡
    if hsname == 선관
    if hsname == 선덕
    if hsname == 선덕고등학교
    if hsname == 선덕여자
    if hsname == 선덕여자고등학교
    if hsname == 선덕여자상업
    if hsname == 선린
    if hsname == 선린고등학교
    if hsname == 선린상업
    if hsname == 선린상업고등학교
    if hsname == 선린인터넷
    if hsname == 선린인터넷고등학교
    if hsname == 선린정보산업
    if hsname == 선명
    if hsname == 선명고등학교
    if hsname == 선명여
    if hsname == 선명여상고등학교
    if hsname == 선명여자
    if hsname == 선명여자고등학교
    if hsname == (구 진주선명여자상업..
    if hsname == 선문
    if hsname == 선민
    if hsname == 선부고등학교
    if hsname == 선부여자상업
    if hsname == 선사고등학교
    if hsname == 선산
    if hsname == 선산고등학교
    if hsname == 선산여자
    if hsname == 선산여자고등학교
    if hsname == 선산여자상업
    if hsname == 선산여자종합
    if hsname == 선산종합
    if hsname == 선수여자
    if hsname == 선양여자
    if hsname == 선영여자
    if hsname == 선영여자고등학교
    if hsname == 선유
    if hsname == 선유고등학교
    if hsname == 선인
    if hsname == 선인고등학교
    if hsname == 선일
    if hsname == 선일 여자
    if hsname == 선일E비지니스고등학교
    if hsname == 선일e비즈니스고등학교
    if hsname == 선일고등학교
    if hsname == 선일상업
    if hsname == 선일여고
    if hsname == 선일여자
    if hsname == 선일여자고등학교
    if hsname == 선일여자상업
    if hsname == 선일여자상업고등학교
    if hsname == 선일이비즈니스고등학교
    if hsname == 선일이비지니스
    if hsname == 선재
    if hsname == 선정
    if hsname == 선정고등학교
    if hsname == 선정관광
    if hsname == 선정관광고등학교
    if hsname == 선정관광고등학교(선정여자실업고등학교)
    if hsname == 선정여자실업
    if hsname == 선주
    if hsname == 선주고등학교
    if hsname == 선진인터넷
    if hsname == 선천
    if hsname == 선화
    if hsname == 선화과학
    if hsname == 선화여고
    if hsname == 선화여상
    if hsname == 선화여자
    if hsname == 선화여자고등학교
    if hsname == 선화여자상업
    if hsname == 선화여자상업고등학교
    if hsname == 선화예고
    if hsname == 선화예술
    if hsname == 선화예술고등학교
    if hsname == 선화정보고등학교
    if hsname == 설관
    if hsname == 설악
    if hsname == 설악고등학교
    if hsname == 설원
    if hsname == 설원고등학교
    if hsname == 설원여자
    if hsname == 설월
    if hsname == 설월여자
    if hsname == 설월여자고등학교
    if hsname == 설천
    if hsname == 설천고등학교
    if hsname == 설화고등학교
    if hsname == 섬광여자
    if hsname == 성경고등학교
    if hsname == 성고
    if hsname == 성곡
    if hsname == 성곡여자
    if hsname == 성광
    if hsname == 성광고등학교
    if hsname == 성광여자
    if hsname == 성광여자고등학교
    if hsname == 성남
    if hsname == 성남 서
    if hsname == 성남 성일여자
    if hsname == 성남 여자
    if hsname == 성남 정보산업
    if hsname == 성남고등학교
    if hsname == 성남공고
    if hsname == 성남공업
    if hsname == 성남공업고등
    if hsname == 성남공업고등학교
    if hsname == 성남금융고
    if hsname == 성남금융고등학교
    if hsname == 성남대고등학교
    if hsname == 성남방송
    if hsname == 성남방송고등학교
    if hsname == 성남서
    if hsname == 성남서고등학교
    if hsname == 성남서구
    if hsname == 성남성일
    if hsname == 성남성일고등학교
    if hsname == 성남여
    if hsname == 성남여고
    if hsname == 성남여자
    if hsname == 성남여자고등학교
    if hsname == 성남여자상업
    if hsname == 성남예술
    if hsname == 성남예술고등학교
    if hsname == 성남예술정보고등학교
    if hsname == 성남외국어고등학교
    if hsname == 성남자고등학교
    if hsname == 성남정보
    if hsname == 성남정보고등학교
    if hsname == 성남정보산업
    if hsname == 성남정보산업고등학교
    if hsname == 성남테크노과학고등학교
    if hsname == 성남효성고등학교
    if hsname == 성누여자
    if hsname == 성덕
    if hsname == 성덕 여자 상업
    if hsname == 성덕고등학교
    if hsname == 성덕문화여자
    if hsname == 성덕여고
    if hsname == 성덕여상
    if hsname == 성덕여자
    if hsname == 성덕여자산업
    if hsname == 성덕여자상업
    if hsname == 성덕여자상업고등학교
    if hsname == 성도
    if hsname == 성도고등학교
    if hsname == 성도공업
    if hsname == 성도여자
    if hsname == 성동
    if hsname == 성동 여자
    if hsname == 성동 여자 실업
    if hsname == 성동고등학교
    if hsname == 성동공고
    if hsname == 성동공업
    if hsname == 성동공업고등학교
    if hsname == 성동글로벌
    if hsname == 성동글로벌경영
    if hsname == 성동글로벌경영고등학교
    if hsname == 성동글로벌고등학교
    if hsname == 성동기계공업
    if hsname == 성동기계공업고등학교
    if hsname == 성동상업
    if hsname == 성동실업여자
    if hsname == 성동실업여자고등학교
    if hsname == 성동여실
    if hsname == 성동여실고등학교
    if hsname == 성동여자글로벌
    if hsname == 성동여자상업
    if hsname == 성동여자상업고등학교
    if hsname == 성동여자실업
    if hsname == 성동여자실업고등학교
    if hsname == 성명여자
    if hsname == 성모
    if hsname == 성모 여자
    if hsname == 성모여고
    if hsname == 성모여자
    if hsname == 성모여자고등학교
    if hsname == 성문
    if hsname == 성문고
    if hsname == 성문고등학교
    if hsname == 성문여자
    if hsname == 성민
    if hsname == 성민여자
    if hsname == 성민여자고등학교
    if hsname == 성반
    if hsname == 성보
    if hsname == 성보경영
    if hsname == 성보경영고등학교
    if hsname == 성보고등학교
    if hsname == 성보여자상업
    if hsname == 성보정보
    if hsname == 성보정보고등학교
    if hsname == 성보정보고등학교(구/성보여자정보산업..
    if hsname == 성보정보산업
    if hsname == 성복6
    if hsname == 성복고등학교
    if hsname == 성부
    if hsname == 성북
    if hsname == 성북여자
    if hsname == 성북여자정보고등학교
    if hsname == 성사
    if hsname == 성사고등학교
    if hsname == 성산
    if hsname == 성산고
    if hsname == 성산고등고등학교
    if hsname == 성산고등학교
    if hsname == 성산여자
    if hsname == 성서
    if hsname == 성서고등학교
    if hsname == 성서공고
    if hsname == 성서공업
    if hsname == 성수
    if hsname == 성수고등학교
    if hsname == 성수공업
    if hsname == 성수공업고등학교
    if hsname == 성수여자
    if hsname == 성수여자고등학교
    if hsname == 성수여자상업
    if hsname == 성수여자상업고등학교
    if hsname == 성수정보산업고등학교(구:성수여자상업..
    if hsname == 성식
    if hsname == 성신
    if hsname == 성신 여자
    if hsname == 성신고등학교
    if hsname == 성신여고
    if hsname == 성신여자
    if hsname == 성신여자고등학교
    if hsname == 성신여자실업
    if hsname == 성실
    if hsname == 성심
    if hsname == 성심 여자
    if hsname == 성심보건
    if hsname == 성심보건고등학교
    if hsname == (구/성심정보고/부산성..
    if hsname == 성심여고
    if hsname == 성심여자
    if hsname == 성심여자고등학교
    if hsname == 성심여자상업
    if hsname == 성심정보
    if hsname == 성심정보고
    if hsname == 성심정보고등학교
    if hsname == 성십고등학교
    if hsname == 성안
    if hsname == 성안고등학교
    if hsname == 성암
    if hsname == 성암국제무역
    if hsname == 성암국제무역고등학교
    if hsname == 성암국제무역고등학교고등학교
    if hsname == 성암여자
    if hsname == 성암여자상업고등학교
    if hsname == 성암여자정보산업고등학교
    if hsname == 성오여자
    if hsname == 성요셉
    if hsname == 성요셉 여자
    if hsname == 성요셉여자
    if hsname == 성요셉여자고등학교
    if hsname == 성요셉여자종합
    if hsname == 성요셉종합
    if hsname == 성요셉종합여자
    if hsname == 성우
    if hsname == 성운
    if hsname == 성울
    if hsname == 성원
    if hsname == 성원고등학교
    if hsname == 성원여상
    if hsname == 성원여자
    if hsname == 성원여자고등학교
    if hsname == 성원여자상업고등학교
    if hsname == 성의
    if hsname == 성의고등학교
    if hsname == 성의여자
    if hsname == 성의여자고등학교
    if hsname == 성의여종
    if hsname == 성의종합
    if hsname == 성의종합고등학교
    if hsname == 성인
    if hsname == 성일
    if hsname == 성일 여자 정보
    if hsname == 성일 정보고등학교
    if hsname == 성일고등학교
    if hsname == 성일상업고등학교
    if hsname == 성일여고등학교
    if hsname == 성일여상고등학교
    if hsname == 성일여자
    if hsname == 성일여자고등학교
    if hsname == 성일여자고등학교고등학교
    if hsname == 성일여자실업
    if hsname == 성일여자실업고등학교
    if hsname == 성일정보
    if hsname == 성일정보고등학교
    if hsname == 성전
    if hsname == 성전고등학교
    if hsname == 성정
    if hsname == 성주
    if hsname == 성주고등
    if hsname == 성주고등학교
    if hsname == 성주농업고등
    if hsname == 성주명인정보고등학교
    if hsname == 성주여자
    if hsname == 성주여자고등학교
    if hsname == 성주여자상업
    if hsname == 성지
    if hsname == 성지 여자
    if hsname == 성지고등학교
    if hsname == 성지고등학교고등학교
    if hsname == 성지공고등학교
    if hsname == 성지공업
    if hsname == 성지공업고등학교
    if hsname == 성지여고
    if hsname == 성지여자
    if hsname == 성지여자고등학교
    if hsname == 성진
    if hsname == 성창
    if hsname == 성창여자
    if hsname == 성창여자고등학교
    if hsname == 성촌정보
    if hsname == 성포
    if hsname == 성포고등학교
    if hsname == 성헌
    if hsname == 성호
    if hsname == 성호고등학교
    if hsname == 성화
    if hsname == 성화여
    if hsname == 성화여자
    if hsname == 성화여자고등학교
    if hsname == 성환
    if hsname == 성환고등학교
    if hsname == 성환고등학교(천안시)
    if hsname == 성희
    if hsname == 성희여
    if hsname == 성희여자
    if hsname == 성희여자고등학교
    if hsname == 세경
    if hsname == 세경고등학교
    if hsname == 세경컴퓨터
    if hsname == 세광
    if hsname == 세광고등학교
    if hsname == 세교고등학교
    if hsname == 세그루패션
    if hsname == 세그루패션디자인
    if hsname == 세그루패션디자인고등학교
    if hsname == 세대전공업
    if hsname == 세마고등학교
    if hsname == 세명
    if hsname == 세명고등학교
    if hsname == 세명정보
    if hsname == 세명컴퓨터
    if hsname == 세명컴퓨터고등학교
    if hsname == 세무
    if hsname == 세무고등학교
    if hsname == 세민
    if hsname == 세민정보
    if hsname == 세민정보고등학교
    if hsname == 세민정보산업고등학교
    if hsname == 세성여자
    if hsname == 세암
    if hsname == 세연정보고등학교
    if hsname == 세원
    if hsname == 세원고등학교
    if hsname == 세인
    if hsname == 세인고등학교
    if hsname == 세일
    if hsname == 세일고등학교
    if hsname == 세정상업고등학교
    if hsname == 세정정보
    if hsname == 세존
    if hsname == 세종
    if hsname == 세종고등학교
    if hsname == 세종과학고등학교
    if hsname == 세종성남고등학교
    if hsname == 세종여자상업
    if hsname == 세종하이텍
    if hsname == 세종하이텍고등학교
    if hsname == 세현
    if hsname == 세현고등학교
    if hsname == 세화
    if hsname == 세화고등학교
    if hsname == 세화여자
    if hsname == 세화여자고등학교
    if hsname == 세화예술
    if hsname == 센뽈여자
    if hsname == 센텀
    if hsname == 센텀고등학교
    if hsname == 셔화여자고등학교
    if hsname == 소곡여자
    if hsname == 소대
    if hsname == 소래
    if hsname == 소래(경기 시흥)
    if hsname == 소래고등학교
    if hsname == 소명
    if hsname == 소명고등학교
    if hsname == 소명여
    if hsname == 소명여고
    if hsname == 소명여자
    if hsname == 소명여자고등학교
    if hsname == 소사
    if hsname == 소사고등학교
    if hsname == 소아로하이스쿨
    if hsname == 소안고등학교
    if hsname == 소양
    if hsname == 소양고등학교
    if hsname == 소천고등학교
    if hsname == 소피아여자
    if hsname == 소하
    if hsname == 소하고등학교
    if hsname == 소화
    if hsname == 속초
    if hsname == 속초고등학교
    if hsname == 속초상업
    if hsname == 속초상업고등학교
    if hsname == 속초설악
    if hsname == 속초여고
    if hsname == 속초여자
    if hsname == 속초여자고
    if hsname == 속초여자고등학교
    if hsname == 속초일동
    if hsname == 솔내
    if hsname == 송계
    if hsname == 송계고등학교
    if hsname == 송곡
    if hsname == 송곡고등학교
    if hsname == 송곡관광고등학교
    if hsname == 송곡여고
    if hsname == 송곡여상
    if hsname == 송곡여자
    if hsname == 송곡여자 정보산업
    if hsname == 송곡여자고등학교
    if hsname == 송곡여자상업
    if hsname == 송곡여자정보산업
    if hsname == 송곡여자정보산업고등학교
    if hsname == 송곡정보
    if hsname == 송내
    if hsname == 송내고등학교
    if hsname == 송덕
    if hsname == 송덕여자
    if hsname == 송도
    if hsname == 송도고등학교
    if hsname == 송도산업
    if hsname == 송도상업
    if hsname == 송도상업고등학교
    if hsname == 송동
    if hsname == 송래
    if hsname == 송래고등학교
    if hsname == 송림
    if hsname == 송림고등학교
    if hsname == 송명여자
    if hsname == 송민
    if hsname == 송산
    if hsname == 송산고등학교
    if hsname == 송산종합
    if hsname == 송신여자
    if hsname == 송악
    if hsname == 송악고등학교
    if hsname == 송암
    if hsname == 송암여자상업
    if hsname == 송연여자
    if hsname == 송옥여자
    if hsname == 송우
    if hsname == 송우고등학교
    if hsname == 송원
    if hsname == 송원고등학교
    if hsname == 송원여상
    if hsname == 송원여자
    if hsname == 송원여자고등학교
    if hsname == 송원여자상업
    if hsname == 송원여자상업고등학교
    if hsname == 송월
    if hsname == 송의고등학교
    if hsname == 송일
    if hsname == 송전
    if hsname == 송정
    if hsname == 송정여자상업고등학교
    if hsname == 송지고등학교
    if hsname == 송지종합고등학교
    if hsname == 송천고등학교
    if hsname == 송촌
    if hsname == 송촌고등학교
    if hsname == 송탄
    if hsname == 송탄고등학교
    if hsname == 송탄여자
    if hsname == 송탄여자고등학교
    if hsname == 송탄제일
    if hsname == 송탄제일고등학교
    if hsname == 송파
    if hsname == 송파 공업
    if hsname == 송파공고
    if hsname == 송파공업
    if hsname == 송파공업고등학교
    if hsname == 송파여자고등학교
    if hsname == 송현
    if hsname == 송현고등학교
    if hsname == 송현여자
    if hsname == 송현여자고등학교
    if hsname == 송호
    if hsname == 송호고등학교
    if hsname == 수고여자
    if hsname == 수내
    if hsname == 수내고등학교
    if hsname == 수대
    if hsname == 수덕
    if hsname == 수도
    if hsname == 수도공업
    if hsname == 수도여
    if hsname == 수도여고
    if hsname == 수도여자
    if hsname == 수도여자고등학교
    if hsname == 수도전기공업
    if hsname == 수도전기공업고등학교
    if hsname == 수락
    if hsname == 수락고
    if hsname == 수락고등학교
    if hsname == 수래
    if hsname == 수로여
    if hsname == 수리
    if hsname == 수리고등학교
    if hsname == 수리여자
    if hsname == 수매
    if hsname == 수명고등학교
    if hsname == 수비
    if hsname == 수비고등학교
    if hsname == 수산
    if hsname == 수성
    if hsname == 수성고
    if hsname == 수성고등학교
    if hsname == 수성고등학교부설 방송통신고등학교
    if hsname == 수성방송고등학교
    if hsname == 수성방송총신
    if hsname == 수성방송통신고등학교
    if hsname == 수성통신고등학교
    if hsname == 수신여자
    if hsname == 수업농생명과학
    if hsname == 수영여자
    if hsname == 수완고등학교
    if hsname == 수원
    if hsname == 수원 수성
    if hsname == 수원 여자
    if hsname == 수원 영복 여자
    if hsname == 수원 유신
    if hsname == 수원 장안
    if hsname == 수원 한일 전산고등학교
    if hsname == 수원경성고등학교
    if hsname == 수원고등학교
    if hsname == 수원공고
    if hsname == 수원공업
    if hsname == 수원공업고등학교
    if hsname == 수원권선
    if hsname == 수원노인
    if hsname == 수원농고등학교
    if hsname == 수원농생명과학
    if hsname == 수원농생명과학고등학교
    if hsname == 수원농생명과학고등학교(구/수원농고)
    if hsname == 수원동원
    if hsname == 수원매탄고등학교
    if hsname == 수원매향여자
    if hsname == 수원방송통신고등학교
    if hsname == 수원삼일고등학교
    if hsname == 수원수성
    if hsname == 수원수성고등학교
    if hsname == 수원숙지
    if hsname == 수원여고방송통신고
    if hsname == 수원여고부설방통고등학교고등학교
    if hsname == 수원여자
    if hsname == 수원여자고등학교
    if hsname == 수원여자고등학교부설방송통신고등
    if hsname == 수원여자방통
    if hsname == 수원영덕
    if hsname == 수원영덕고등학교
    if hsname == 수원영복여자
    if hsname == 수원영생
    if hsname == 수원영생고등학교
    if hsname == 수원영신여자
    if hsname == 수원영신여자고등학교
    if hsname == 수원외국어
    if hsname == 수원외국어고등학교
    if hsname == 수원장안
    if hsname == 수원장안고등학교
    if hsname == 수원전산여자고등학교
    if hsname == 수원정보
    if hsname == 수원정보고등학교
    if hsname == 수원정보과학
    if hsname == 수원정보과학고등학교
    if hsname == 수원정보과학고등학교(구/수원정보산업..
    if hsname == 수원정보산업
    if hsname == 수원정보산업고
    if hsname == 수원정보산업고등학교
    if hsname == 수원정보산업공
    if hsname == 수원정보산업공업
    if hsname == 수원정보산업공업고등학교
    if hsname == 수원정산고등학교
    if hsname == 수원창현
    if hsname == 수원태장
    if hsname == 수원팔달공업
    if hsname == 수원하이텍
    if hsname == 수원하이텍고등학교
    if hsname == 수원한일여자정보산업
    if hsname == 수원한일전산
    if hsname == 수원한일전산고등학교
    if hsname == 수원한일전산여자
    if hsname == 수원한일정보여자고등학교
    if hsname == 수원화홍
    if hsname == 수일
    if hsname == 수일고등학교
    if hsname == 수전
    if hsname == 수정
    if hsname == 수정고등학교
    if hsname == 수주
    if hsname == 수주고등학교
    if hsname == 수지
    if hsname == 수지고등학교
    if hsname == 수태
    if hsname == 수택
    if hsname == 수택고
    if hsname == 수택고등학교
    if hsname == 수피아
    if hsname == 수피아 여자
    if hsname == 수피아여자
    if hsname == 수피아여자고등학교
    if hsname == 수하
    if hsname == 수화
    if hsname == 숙명
    if hsname == 숙명 여자
    if hsname == 숙명여
    if hsname == 숙명여고
    if hsname == 숙명여자
    if hsname == 숙명여자고등학교
    if hsname == 숙지
    if hsname == 숙지고등학교
    if hsname == 순신
    if hsname == 순실여자
    if hsname == 순심
    if hsname == 순심고등학교
    if hsname == 순심여고
    if hsname == 순심여자
    if hsname == 순심여자고등학교
    if hsname == 순창
    if hsname == 순창고등학교
    if hsname == 순창여자
    if hsname == 순창제일
    if hsname == 순창제일고등학교
    if hsname == 순천
    if hsname == 순천  금당
    if hsname == 순천 금당
    if hsname == 순천 매산
    if hsname == 순천 전자
    if hsname == 순천 효천
    if hsname == 순천 효헌
    if hsname == 순천강남
    if hsname == 순천강남여
    if hsname == 순천강남여자
    if hsname == 순천강남여자고등학교
    if hsname == 순천강남여진
    if hsname == 순천고등학교
    if hsname == 순천고등학교부설 방송통신고등학교
    if hsname == 순천공업
    if hsname == 순천공업고등학교
    if hsname == 순천금당
    if hsname == 순천금당고
    if hsname == 순천금당고등학교
    if hsname == 순천매산
    if hsname == 순천매산고등학교
    if hsname == 순천매산여자
    if hsname == 순천매산여자고등학교
    if hsname == 순천상업
    if hsname == 순천여상
    if hsname == 순천여자
    if hsname == 순천여자고등학교
    if hsname == 순천여자상업
    if hsname == 순천여자상업고등학교
    if hsname == 순천전자
    if hsname == 순천전자고등학교
    if hsname == 순천전자공업
    if hsname == 순천전자통신
    if hsname == 순천제일
    if hsname == 순천제일고등학교
    if hsname == 순천청암
    if hsname == 순천청암고등학교
    if hsname == 순천팔마
    if hsname == 순천팔마고등학교
    if hsname == 순천효산
    if hsname == 순천효산고등학교
    if hsname == 순천효성고등학교
    if hsname == 순천효천
    if hsname == 순천효천고등학교
    if hsname == 순화여자
    if hsname == 순화여자상업
    if hsname == 순화전자
    if hsname == 숭덕
    if hsname == 숭덕고등학교
    if hsname == 숭덕여자
    if hsname == 숭덕여자고등학교
    if hsname == 숭문
    if hsname == 숭문고등학교
    if hsname == 숭신
    if hsname == 숭신고등학교
    if hsname == 숭신공고
    if hsname == 숭신공업
    if hsname == 숭신공업고등학교
    if hsname == 숭신여
    if hsname == 숭신여고
    if hsname == 숭신여자
    if hsname == 숭신여자고등학교
    if hsname == 숭실
    if hsname == 숭실고등학교
    if hsname == 숭실공업
    if hsname == 숭실여자
    if hsname == 숭암
    if hsname == 숭의
    if hsname == 숭의 여자
    if hsname == 숭의고등학교
    if hsname == 숭의실업고등학교
    if hsname == 숭의여고
    if hsname == 숭의여자
    if hsname == 숭의여자고등학교
    if hsname == 숭일
    if hsname == 숭희여자
    if hsname == 스피아여자
    if hsname == 승덕
    if hsname == 승신여자
    if hsname == 승진
    if hsname == 시
    if hsname == 시문
    if hsname == 시민
    if hsname == 시온
    if hsname == 시온고등학교
    if hsname == 시온실업
    if hsname == 시운
    if hsname == 시지
    if hsname == 시지고등학교
    if hsname == 시화공업
    if hsname == 시화공업고등학교
    if hsname == 시흥
    if hsname == 시흥고등학교
    if hsname == 시흥매화고등학교
    if hsname == 시흥여고
    if hsname == 신갈
    if hsname == 신갈고등학교
    if hsname == 신경
    if hsname == 신경고등학교
    if hsname == 신경여상고등학교
    if hsname == 신경여자
    if hsname == 신경여자고등학교
    if hsname == 신경여자상업
    if hsname == 신경여자상업고등학교
    if hsname == 신경여자실업
    if hsname == 신경여자실업고등학교
    if hsname == 신광
    if hsname == 신광 여자
    if hsname == 신광여자
    if hsname == 신광여자고등학교
    if hsname == 신길고등학교
    if hsname == 신남
    if hsname == 신남고등학교
    if hsname == 신남자고등학교
    if hsname == 신녕고등학교
    if hsname == 신단고등학교
    if hsname == 신달
    if hsname == 신당
    if hsname == 신당고등학교
    if hsname == 신당동고등학교
    if hsname == 신덕
    if hsname == 신도
    if hsname == 신도고등학교
    if hsname == 신도림고등학교
    if hsname == 신동신
    if hsname == 신동신정보산업
    if hsname == 신동신정보산업고등학교
    if hsname == 신등고등학교
    if hsname == 신라
    if hsname == 신라고등학교
    if hsname == 신라공업
    if hsname == 신라공업고등학교
    if hsname == 신령고등학교
    if hsname == 신림
    if hsname == 신림고등학교
    if hsname == 신명
    if hsname == 신명고등학교
    if hsname == 신명여
    if hsname == 신명여자
    if hsname == 신명여자고등학교
    if hsname == 신명여자상업
    if hsname == 신목
    if hsname == 신목고등학교
    if hsname == 신문여자고등학교
    if hsname == 신반
    if hsname == 신반상업고등학교
    if hsname == 신반정보
    if hsname == 신반정보고등학교(구/신반상고)
    if hsname == 신북
    if hsname == 신북전자고등학교
    if hsname == 신사
    if hsname == 신서
    if hsname == 신서고등학교
    if hsname == 신석
    if hsname == 신석고등학교
    if hsname == 신선여자
    if hsname == 신선여자고등학교
    if hsname == 신성
    if hsname == 신성(인천)
    if hsname == 신성고등학교
    if hsname == 신성여자
    if hsname == 신성여자고등학교
    if hsname == 신송
    if hsname == 신송고등학교
    if hsname == 신안
    if hsname == 신안고등학교
    if hsname == 신안압해고등학교
    if hsname == 신영
    if hsname == 신영고등학교
    if hsname == 신옥
    if hsname == 신왼
    if hsname == 신원
    if hsname == 신원고등학교
    if hsname == 신월
    if hsname == 신월고등학교
    if hsname == 신의고등학교
    if hsname == 신일
    if hsname == 신일 정보
    if hsname == 신일 정보 산업
    if hsname == 신일고등학교
    if hsname == 신일비즈니스
    if hsname == 신일비즈니스고등학교
    if hsname == 신일비지니스
    if hsname == 신일여자
    if hsname == 신일여자고등학교
    if hsname == 신일여자상 업고등학교
    if hsname == 신일정보
    if hsname == 신일정보고등학교
    if hsname == 신일정보산업
    if hsname == 신일정보산업고등학교
    if hsname == 신장
    if hsname == 신장고등학교
    if hsname == 신정
    if hsname == 신정고등학교
    if hsname == 신정여상
    if hsname == 신정여자
    if hsname == 신정여자산업
    if hsname == 신정여자상업
    if hsname == 신정여자상업고등학교
    if hsname == 신진
    if hsname == 신진공고
    if hsname == 신진공업
    if hsname == 신진과학기술
    if hsname == 신진과학기술고등학교
    if hsname == 신진자동차
    if hsname == 신진자동차고등학교
    if hsname == 신천고등학교
    if hsname == 신천여자정보
    if hsname == 신철원
    if hsname == 신철원고등학교
    if hsname == 신탄
    if hsname == 신탄진
    if hsname == 신탄진고등학교
    if hsname == 신탄진세일
    if hsname == 신태인
    if hsname == 신태인고등학교
    if hsname == 신태인종합
    if hsname == 신파
    if hsname == 신평
    if hsname == 신평고등학교
    if hsname == 신풍
    if hsname == 신풍정보고등학교
    if hsname == 신풍종합고등학교
    if hsname == 신한
    if hsname == 신한고등학교
    if hsname == 신현
    if hsname == 신현고등학교
    if hsname == 신현여자
    if hsname == 신형
    if hsname == 신흥
    if hsname == 신흥고등학교
    if hsname == 실업
    if hsname == 실업계
    if hsname == 실정여자
    if hsname == 심석
    if hsname == 심석고등학교
    if hsname == 심원
    if hsname == 심원고등학교
    if hsname == 심인
    if hsname == 심인고등
    if hsname == 심인고등학교
    if hsname == 심평고등학교
    if hsname == 싱흥고등학교
    if hsname == 쌍곡
    if hsname == 쌍용
    if hsname == 쌍용고등학교
    if hsname == 쌘뽈여자
    if hsname == 쌘뽈여자고등학교
    if hsname == 쌤뽈여자
    if hsname == 쎈뽈여자
    if hsname == 쎈뿔여자고
    if hsname == 아림
    if hsname == 아림고등학교
    if hsname == 아산
    if hsname == 아산고등학교
    if hsname == 아산둔포고등학교
    if hsname == 아산부설통신
    if hsname == 아산여자상업
    if hsname == 아산온양
    if hsname == 아산온양고등학교
    if hsname == 아산제일
    if hsname == 아서
    if hsname == 아포
    if hsname == 아포공업
    if hsname == 안강
    if hsname == 안강 여자
    if hsname == 안강(경주)
    if hsname == 안강고등
    if hsname == 안강고등학교
    if hsname == 안강여자
    if hsname == 안강여자고등
    if hsname == 안강여자고등학교
    if hsname == 안강전자
    if hsname == 안강전자고등학교
    if hsname == 안계
    if hsname == 안계고등학교
    if hsname == 안계종합
    if hsname == 안곡고등학교
    if hsname == 안남
    if hsname == 안남고등학교
    if hsname == 안남자고등학교
    if hsname == 안덕
    if hsname == 안덕고등학교
    if hsname == 안동
    if hsname == 안동 경안여자고등학교
    if hsname == 안동 풍산
    if hsname == 안동경안고등학교
    if hsname == 안동경안여자상업
    if hsname == 안동경일고등학교
    if hsname == 안동고
    if hsname == 안동고등
    if hsname == 안동고등학교
    if hsname == 안동고등학교부설 방송통신고등학교
    if hsname == 안동공
    if hsname == 안동공고
    if hsname == 안동공업
    if hsname == 안동공업고등학교
    if hsname == 안동길원여자
    if hsname == 안동농업
    if hsname == 안동농업고등학교
    if hsname == 안동방송고등학교
    if hsname == 안동생명과학고
    if hsname == 안동생명과학고등학교
    if hsname == 안동여
    if hsname == 안동여자
    if hsname == 안동여자고등학교
    if hsname == 안동영문
    if hsname == 안동중앙
    if hsname == 안동중앙고등학교
    if hsname == 안동풍산고등학교
    if hsname == 안면
    if hsname == 안면고등학교
    if hsname == 안범
    if hsname == 안법
    if hsname == 안법고등학교
    if hsname == 안북
    if hsname == 안산
    if hsname == 안산 강사
    if hsname == 안산 강서
    if hsname == 안산 공업
    if hsname == 안산 동산
    if hsname == 안산 성안
    if hsname == 안산 송호
    if hsname == 안산강서
    if hsname == 안산강서고등학교
    if hsname == 안산경기모바일과학고등학교
    if hsname == 안산경영
    if hsname == 안산경영정보
    if hsname == 안산경영정보고등학교
    if hsname == 안산경일
    if hsname == 안산고등학교
    if hsname == 안산공고
    if hsname == 안산공업
    if hsname == 안산공업고등학교
    if hsname == 안산동산
    if hsname == 안산동산고등학교
    if hsname == 안산디자인고등학교
    if hsname == 안산디자인문화
    if hsname == 안산디자인문화고등학교
    if hsname == 안산디지털미디어고등학교
    if hsname == 안산모바일과학
    if hsname == 안산산업정보고등학교
    if hsname == 안산상업
    if hsname == 안산성안
    if hsname == 안산성포
    if hsname == 안산송호
    if hsname == 안산여자고등학교
    if hsname == 안산여자정보
    if hsname == 안산여자정보고등학교
    if hsname == 안산여자정보산업
    if hsname == 안산정보고등학교
    if hsname == 안산정보산업
    if hsname == 안산정보산업고등학교
    if hsname == 안산정안
    if hsname == 안산초지
    if hsname == 안산통신
    if hsname == 안상강서
    if hsname == 안상공업
    if hsname == 안상동산
    if hsname == 안성
    if hsname == 안성고
    if hsname == 안성고등
    if hsname == 안성고등학교
    if hsname == 안성공업
    if hsname == 안성공업고등학교
    if hsname == 안성두원
    if hsname == 안성두원공업
    if hsname == 안성두원공업고등학교
    if hsname == 안성두원공원
    if hsname == 안성안법
    if hsname == 안성여고
    if hsname == 안성여자
    if hsname == 안성여자고등학교
    if hsname == 안성종합
    if hsname == 안성종합고등학교
    if hsname == 안양
    if hsname == 안양 부흥
    if hsname == 안양 양명
    if hsname == 안양 외국어
    if hsname == 안양고등학교
    if hsname == 안양공
    if hsname == 안양공고
    if hsname == 안양공업
    if hsname == 안양공업고등학교
    if hsname == 안양관악정보
    if hsname == 안양부흥
    if hsname == 안양부흥고등학교
    if hsname == 안양상고
    if hsname == 안양상업
    if hsname == 안양상업고등학교
    if hsname == 안양양명여자
    if hsname == 안양여
    if hsname == 안양여고
    if hsname == 안양여상
    if hsname == 안양여자
    if hsname == 안양여자고등학교
    if hsname == 안양여자상업
    if hsname == 안양여자상업고등학교
    if hsname == 안양영화예술
    if hsname == 안양예
    if hsname == 안양예술
    if hsname == 안양예술고등학교
    if hsname == 안양외고
    if hsname == 안양외국어
    if hsname == 안양외국어고등학교
    if hsname == 안양종촌
    if hsname == 안의
    if hsname == 안의고등학교
    if hsname == 안일
    if hsname == 안일불류
    if hsname == 안일여고
    if hsname == 안일여자고등학교
    if hsname == 안일여자종합고등학교
    if hsname == 안좌종합
    if hsname == 안좌종합고등학교
    if hsname == 안중
    if hsname == 안중고등학교
    if hsname == 안중종합고등학교
    if hsname == 안창
    if hsname == 안천고등학교
    if hsname == 안하사대부
    if hsname == 안화
    if hsname == 안화고등학교
    if hsname == 안흥
    if hsname == 안흥고등학교
    if hsname == 알로이시오고등학교
    if hsname == 알로이시오전자기계
    if hsname == 알로이시오전자기계고등학교
    if hsname == 압구정
    if hsname == 압구정고등학교
    if hsname == 압해
    if hsname == 압해고등학교
    if hsname == 압해종합고등학교
    if hsname == 애니매이션고등학교
    if hsname == 애니메이션
    if hsname == 애니원
    if hsname == 애월
    if hsname == 애월고등학교
    if hsname == 애월상업
    if hsname == 애화고등학교
    if hsname == 야로
    if hsname == 야로고등학교
    if hsname == 야캅
    if hsname == 야탑
    if hsname == 야탑고등학교
    if hsname == 약목
    if hsname == 약목고등학교
    if hsname == 약산
    if hsname == 약산고등학교
    if hsname == 양경디지탈고등학교
    if hsname == 양곡
    if hsname == 양곡고등학교
    if hsname == 양구
    if hsname == 양구고등학교
    if hsname == 양구여자
    if hsname == 양구여자고등학교
    if hsname == 양덕상업고등학교
    if hsname == 양동
    if hsname == 양동고등학교
    if hsname == 양리
    if hsname == 양면고등학교
    if hsname == 양명
    if hsname == 양명 여자
    if hsname == 양명고등학교
    if hsname == 양명디지털고등학교
    if hsname == 양명여
    if hsname == 양명여고
    if hsname == 양명여자
    if hsname == 양명여자고등학교
    if hsname == 양무
    if hsname == 양문여자
    if hsname == 양백
    if hsname == 양백상업고등학교
    if hsname == 양백여자
    if hsname == 양백여자상업
    if hsname == 양백여자상업고등학교
    if hsname == 양봉
    if hsname == 양북
    if hsname == 양북고등학교
    if hsname == 양산
    if hsname == 양산 남부
    if hsname == 양산 여자
    if hsname == 양산 제일
    if hsname == 양산고등학교
    if hsname == 양산남부
    if hsname == 양산남부고등학교
    if hsname == 양산보광
    if hsname == 양산여고
    if hsname == 양산여자
    if hsname == 양산여자고등학교
    if hsname == 양산여자상업고등학교
    if hsname == 양산제일
    if hsname == 양산제일고등학교
    if hsname == 양서
    if hsname == 양서고등학교
    if hsname == 양수
    if hsname == 양양
    if hsname == 양양고
    if hsname == 양양고등학교
    if hsname == 양양여고
    if hsname == 양양여자
    if hsname == 양양여자고등학교
    if hsname == 양업
    if hsname == 양업고등학교
    if hsname == 양영
    if hsname == 양영고등학교
    if hsname == 양영공고
    if hsname == 양영공업
    if hsname == 양영디지털
    if hsname == 양영디지털고등학교
    if hsname == 양영디지털고등학교(구/양영공고)
    if hsname == 양영여자
    if hsname == 양운
    if hsname == 양운고등학교
    if hsname == 양원
    if hsname == 양윤
    if hsname == 양인
    if hsname == 양일
    if hsname == 양일고등학교
    if hsname == 양일종합
    if hsname == 양재
    if hsname == 양재고등학교
    if hsname == 양정
    if hsname == 양정고
    if hsname == 양정고등학교
    if hsname == 양정여자
    if hsname == 양주고등학교
    if hsname == 양주백석
    if hsname == 양주백석고등학교
    if hsname == 양지
    if hsname == 양지고등학교
    if hsname == 양천
    if hsname == 양천고등학교
    if hsname == 양천구 목동
    if hsname == 양천여자
    if hsname == 양천여자고등학교
    if hsname == 양천용문
    if hsname == 양청고등학교
    if hsname == 양평
    if hsname == 양평고등학교
    if hsname == 양평공업
    if hsname == 양평공업고등학교
    if hsname == 양평여자종합
    if hsname == 양평용문고등학교
    if hsname == 양평전자과학
    if hsname == 양평전자과학고등학교
    if hsname == 양평종합
    if hsname == 양평종합고등학교
    if hsname == 양형고등학교
    if hsname == 어방
    if hsname == 어주
    if hsname == 언남
    if hsname == 언남고등학교
    if hsname == 언남자고등학교
    if hsname == 언양여자
    if hsname == 언양여자상업
    if hsname == 언양여자상업고등학교
    if hsname == 업성고등학교
    if hsname == 없음
    if hsname == 에너지과학
    if hsname == 에원여고
    if hsname == 엘디자인
    if hsname == 여ㅣ문여
    if hsname == 여ㅣ지
    if hsname == 여강
    if hsname == 여강고등학교
    if hsname == 여강종합
    if hsname == 여강종합고등학교
    if hsname == 여광상업
    if hsname == 여남
    if hsname == 여남중고등학교
    if hsname == 여량고등학교
    if hsname == 여문
    if hsname == 여산
    if hsname == 여산고등학교
    if hsname == 여수
    if hsname == 여수 부영여자
    if hsname == 여수고등학교
    if hsname == 여수공업
    if hsname == 여수공업고
    if hsname == 여수공업고등학교
    if hsname == 여수부영여자
    if hsname == 여수상업
    if hsname == 여수상업고등학교
    if hsname == 여수석유화학고등학교
    if hsname == 여수여고
    if hsname == 여수여자
    if hsname == 여수여자고등학교
    if hsname == 여수여자중앙
    if hsname == 여수전자공업고등학교
    if hsname == 여수전자화학
    if hsname == 여수전자화학고등학교
    if hsname == 여수정보
    if hsname == 여수정보고등학교
    if hsname == 여수정보과학
    if hsname == 여수정보과학고등학교
    if hsname == 여수중앙여자
    if hsname == 여수중앙여자고등학교
    if hsname == 여수충무고등학교
    if hsname == 여수한영
    if hsname == 여수한영고등학교
    if hsname == 여수해양과학고등학교
    if hsname == 여수화양
    if hsname == 여수화양고등학교
    if hsname == 여수화학
    if hsname == 여양
    if hsname == 여양고등학교
    if hsname == 여의도
    if hsname == 여의도 여자
    if hsname == 여의도고등학교
    if hsname == 여의도여
    if hsname == 여의도여자
    if hsname == 여의도여자고등학교
    if hsname == 여자농업
    if hsname == 여자상업
    if hsname == 여자상업고등학교
    if hsname == 여주
    if hsname == 여주 여자
    if hsname == 여주고등학교
    if hsname == 여주대신고등학교
    if hsname == 여주여자
    if hsname == 여주여자종합
    if hsname == 여주여자종합고등학교
    if hsname == 여주자영농업
    if hsname == 여주자영농업고등학교
    if hsname == 여주정보고등학교
    if hsname == 여주제일
    if hsname == 여주제일고등학교
    if hsname == 여진
    if hsname == 여천
    if hsname == 여천고
    if hsname == 여천고등학교
    if hsname == 여천실업
    if hsname == 여천실업고등학교
    if hsname == 여천화양고등학교
    if hsname == 여화
    if hsname == 여화실업
    if hsname == 역덕여자
    if hsname == 연곡
    if hsname == 연길시제일
    if hsname == 연남정보산업
    if hsname == 연무
    if hsname == 연무고등학교
    if hsname == 연무기계공업
    if hsname == 연무대기계공
    if hsname == 연무대기계공업
    if hsname == 연무대기계공업고등학교
    if hsname == 연산
    if hsname == 연성
    if hsname == 연수
    if hsname == 연수 여자
    if hsname == 연수고등학교
    if hsname == 연수여
    if hsname == 연수여자
    if hsname == 연수여자고등학교
    if hsname == 연암
    if hsname == 연일
    if hsname == 연제
    if hsname == 연제고등학교
    if hsname == 연천
    if hsname == 연천고등학교
    if hsname == 연천농업기술고등학교
    if hsname == 연천종합
    if hsname == 연천종합고등학교
    if hsname == 연초고등학교
    if hsname == 연평고등학교
    if hsname == 연풍
    if hsname == 연화여자
    if hsname == 연화여자고등학교
    if hsname == 연희
    if hsname == 연희 미용
    if hsname == 연희무용
    if hsname == 연희미용
    if hsname == 연희미용고등학교
    if hsname == 염광
    if hsname == 염광고등학교
    if hsname == 염광메디고
    if hsname == 염광메디텍
    if hsname == 염광여상
    if hsname == 염광여자
    if hsname == 염광여자메디텍
    if hsname == 염광여자메디텍고등학교
    if hsname == (구/염광여자정..
    if hsname == 염광여자상업
    if hsname == 염광여자정보
    if hsname == 염광여자정보교육
    if hsname == 염광정보
    if hsname == 염산고등학교
    if hsname == 영가여자고등학교
    if hsname == 영광
    if hsname == 영광고등학교
    if hsname == 영광실업
    if hsname == 영광실업고등학교
    if hsname == 영광여자
    if hsname == 영광여자고등학교
    if hsname == 영광전자
    if hsname == 영광정보
    if hsname == 영광정보산업고등학교
    if hsname == 영광종합고등학교
    if hsname == 영광해룡
    if hsname == 영광혜룡
    if hsname == 영낙
    if hsname == 영남
    if hsname == 영남고등
    if hsname == 영남고등학교
    if hsname == 영남공고
    if hsname == 영남공업
    if hsname == 영남공업고등학교
    if hsname == 영남대학교
    if hsname == 영남삼육
    if hsname == 영남삼육고등학교
    if hsname == 영남상업
    if hsname == 영남자고등학교
    if hsname == 영덕
    if hsname == 영덕 여자
    if hsname == 영덕고등학교
    if hsname == 영덕여자
    if hsname == 영덕여자고등학교
    if hsname == 영덕외국어
    if hsname == 영덕종합
    if hsname == 영덕종합고등학교
    if hsname == 영도
    if hsname == 영도국제물류
    if hsname == 영도여
    if hsname == 영도여자
    if hsname == 영도여자고등학교
    if hsname == 영도여자상업
    if hsname == 영도여자상업고등학교
    if hsname == 영동
    if hsname == 영동 인터넷
    if hsname == 영동고등고등학교
    if hsname == 영동고등학교
    if hsname == 영동농업고등학교
    if hsname == 영동산업
    if hsname == 영동산업과학
    if hsname == 영동산업과학고등학교
    if hsname == 영동상업
    if hsname == 영동여상업
    if hsname == 영동여자
    if hsname == 영동여자고등학교
    if hsname == 영동인터넷
    if hsname == 영동인터넷고등학교
    if hsname == 영동인터넷고등학교(구:영동상업고등학..
    if hsname == 영동일
    if hsname == 영동일고
    if hsname == 영동일고등학교
    if hsname == 영등여자
    if hsname == 영등포
    if hsname == 영등포 공업
    if hsname == 영등포 여자
    if hsname == 영등포고등학교
    if hsname == 영등포고등학교부설방송통신
    if hsname == 영등포공
    if hsname == 영등포공업
    if hsname == 영등포공업고등학교
    if hsname == 영등포방통
    if hsname == 영등포여
    if hsname == 영등포여고
    if hsname == 영등포여상
    if hsname == 영등포여자
    if hsname == 영등포여자고등학교
    if hsname == 영등포여자상업
    if hsname == 영등포여자상업고등학교
    if hsname == 영락
    if hsname == 영락고등학교
    if hsname == 영락상업
    if hsname == 영락여자상업
    if hsname == 영락여자상업고등학교
    if hsname == 영락유헬스고등학교
    if hsname == 영란
    if hsname == 영란여자
    if hsname == 영란여자상업
    if hsname == 영명
    if hsname == 영명고등학교
    if hsname == 영무
    if hsname == 영문
    if hsname == 영문고등학교
    if hsname == 영복
    if hsname == 영복여자
    if hsname == 영복여자고등학교
    if hsname == 영북여자
    if hsname == 영북종합
    if hsname == 영북종합고등학교
    if hsname == 영산
    if hsname == 영산고등학교
    if hsname == 영산고등학교(구/영산여자고등학교)
    if hsname == 영산성지고등학교
    if hsname == 영산여자
    if hsname == 영산여자고등학교
    if hsname == 영산여자상업고등학교
    if hsname == 영산전자공업
    if hsname == 영산포
    if hsname == 영산포고등학교
    if hsname == 영산포상업
    if hsname == 영산포여자상업
    if hsname == 영산포종합고등학교
    if hsname == 영상
    if hsname == 영상고
    if hsname == 영상고등학교
    if hsname == 영상과학고등학교
    if hsname == 영상미디어
    if hsname == 영상예술
    if hsname == 영생
    if hsname == 영생고등학교
    if hsname == 영생여자
    if hsname == 영생여자상업
    if hsname == 영서
    if hsname == 영서고
    if hsname == 영서고등학교
    if hsname == 영석
    if hsname == 영석고등학교
    if hsname == 영선
    if hsname == 영선고등학교
    if hsname == 영성
    if hsname == 영성고등학교
    if hsname == 영성여자
    if hsname == 영송
    if hsname == 영송여자
    if hsname == 영송여자고등학교
    if hsname == 영신
    if hsname == 영신 여자
    if hsname == 영신간호비즈니스고등학교
    if hsname == 영신고등학교
    if hsname == 영신실업고등학교
    if hsname == 영신여상
    if hsname == 영신여자
    if hsname == 영신여자고등학교
    if hsname == 영신여자실업
    if hsname == 영신여자실업고등학교
    if hsname == 영심
    if hsname == 영심고등학교
    if hsname == 영암
    if hsname == 영암  낭주
    if hsname == 영암고등학교
    if hsname == 영암구립공업고등학교
    if hsname == 영암낭주고등학교
    if hsname == 영암농업고등학교
    if hsname == 영암여고
    if hsname == 영암여자
    if hsname == 영암여자고등학교
    if hsname == 영암전자과학고등학교
    if hsname == 영양
    if hsname == 영양고등학교
    if hsname == 영양여자
    if hsname == 영양여자고등학교
    if hsname == 영옥종합
    if hsname == 영운
    if hsname == 영월
    if hsname == 영월 공업
    if hsname == 영월고등학교
    if hsname == 영월공고
    if hsname == 영월공업
    if hsname == 영월공업고등학교
    if hsname == 영일
    if hsname == 영일 여자
    if hsname == 영일고등학교
    if hsname == 영일여자
    if hsname == 영일외국어
    if hsname == 영종고등학교
    if hsname == 영종국제물류
    if hsname == 영종국제물류고등학교
    if hsname == 영주
    if hsname == 영주고등학교
    if hsname == 영주공업
    if hsname == 영주공업고등학교
    if hsname == 영주과학기술
    if hsname == 영주과학기술고등학교
    if hsname == 영주대영고등학교
    if hsname == 영주동산
    if hsname == 영주동산고등학교
    if hsname == 영주여고
    if hsname == 영주여자
    if hsname == 영주여자고등학교
    if hsname == 영주영광
    if hsname == 영주영광고등학교
    if hsname == 영주영광여자
    if hsname == 영주영광여자고등학교
    if hsname == 영주제일
    if hsname == 영주제일고등학교
    if hsname == 영주제일공고
    if hsname == 영주종합고등학교
    if hsname == 영주중앙고등학교
    if hsname == 영지
    if hsname == 영지여자
    if hsname == 영진
    if hsname == 영진고등학교
    if hsname == 영천
    if hsname == 영천고등
    if hsname == 영천고등학교
    if hsname == 영천금호여자고등학교
    if hsname == 영천명동
    if hsname == 영천상업고등학교
    if hsname == 영천선화여자
    if hsname == 영천성남
    if hsname == 영천성남여자고등학교
    if hsname == 영천여자
    if hsname == 영천여자고등
    if hsname == 영천여자고등학교
    if hsname == 영천영동
    if hsname == 영천영동고등학교
    if hsname == 영천전자
    if hsname == 영천전자고등학교
    if hsname == 영청여자상업
    if hsname == 영춘
    if hsname == 영통
    if hsname == 영통고등학교
    if hsname == 영파
    if hsname == 영파여
    if hsname == 영파여고
    if hsname == 영파여자
    if hsname == 영파여자고등학교
    if hsname == 영풍
    if hsname == 영풍인터넷고등학교
    if hsname == 영학여자상업
    if hsname == 영해
    if hsname == 영해고등학교
    if hsname == 영해여자정보고등학교
    if hsname == 영혜
    if hsname == 영홍
    if hsname == 영화
    if hsname == 영화관광경영고등학교
    if hsname == 영화여자
    if hsname == 영화여자고등학교
    if hsname == 영화여자정보
    if hsname == 영화여자정보고등학교
    if hsname == 영훈
    if hsname == 영훈고등학교
    if hsname == 영흥
    if hsname == 영흥고등학교
    if hsname == 예당
    if hsname == 예당고등학교
    if hsname == 예덕
    if hsname == 예림디자인
    if hsname == 예림디자인고등학교
    if hsname == 예문
    if hsname == 예문 여자
    if hsname == 예문여고
    if hsname == 예문여자
    if hsname == 예문여자고등학교
    if hsname == 예산
    if hsname == 예산고등학교
    if hsname == 예산공업
    if hsname == 예산여자
    if hsname == 예산여자고등학교
    if hsname == 예산여자상업
    if hsname == 예산여자상업고등학교
    if hsname == 예산예화여자
    if hsname == 예산예화여자고등학교
    if hsname == 예산전자공업
    if hsname == 예산전자공업고등학교
    if hsname == 예산정보미디어
    if hsname == 예성여자
    if hsname == 예술
    if hsname == 예술고등
    if hsname == 예술고등학교
    if hsname == 예원
    if hsname == 예원고등학교
    if hsname == 예원여자
    if hsname == 예원여자고등학교
    if hsname == 예원예술고등학교
    if hsname == 예원정보여자
    if hsname == 예원정보여자고등학교
    if hsname == 예인
    if hsname == 예일
    if hsname == 예일 여
    if hsname == 예일 여자
    if hsname == 예일디자인
    if hsname == 예일디자인고등학교
    if hsname == 예일디자인고등학교(구/예일여자실업고)
    if hsname == 예일미용
    if hsname == 예일미용고
    if hsname == 예일미용고등학교
    if hsname == 예일여
    if hsname == 예일여고
    if hsname == 예일여자
    if hsname == 예일여자고등학교
    if hsname == 예일여자디자인고등학교
    if hsname == 예일여자상업
    if hsname == 예일여자실업
    if hsname == 예지
    if hsname == 예지고등학교
    if hsname == 예천고등학교
    if hsname == 예천상업
    if hsname == 예천여자
    if hsname == 예천여자고등학교
    if hsname == 예화
    if hsname == 예화고등학교
    if hsname == 예화여자
    if hsname == 예화여자고등학교
    if hsname == 오계
    if hsname == 오금
    if hsname == 오금고등학교
    if hsname == 오남고등학교
    if hsname == 오남자고등학교
    if hsname == 오류
    if hsname == 오류고등학교
    if hsname == 오산
    if hsname == 오산고
    if hsname == 오산고등학교
    if hsname == 오산여자
    if hsname == 오산여자상업
    if hsname == 오산운천
    if hsname == 오산정보
    if hsname == 오산정보고등학교
    if hsname == 오산정보고등학교(구/오산여자정보고)
    if hsname == 오삼
    if hsname == 오상
    if hsname == 오상고등학교
    if hsname == 오성
    if hsname == 오성고등학교
    if hsname == 오송
    if hsname == 오수
    if hsname == 오신정보
    if hsname == 오영
    if hsname == 오운여자고등학교
    if hsname == 오창
    if hsname == 오창고등학교
    if hsname == 오천
    if hsname == 오천고등학교
    if hsname == 오평
    if hsname == 오현
    if hsname == 오현고등학교
    if hsname == 옥과
    if hsname == 옥과고등학교
    if hsname == 옥구농업
    if hsname == 옥련
    if hsname == 옥련여자
    if hsname == 옥련여자고등학교
    if hsname == 옥령
    if hsname == 옥면
    if hsname == 옥야
    if hsname == 옥야고등학교
    if hsname == 옥야종합
    if hsname == 옥연여자
    if hsname == 옥종
    if hsname == 옥종고등학교
    if hsname == 옥천
    if hsname == 옥천고등
    if hsname == 옥천고등학교
    if hsname == 옥천공업
    if hsname == 옥천공업고등학교
    if hsname == 옥천상업
    if hsname == 옥천상업고등학교
    if hsname == 옥천여자
    if hsname == 옥천여자고등학교
    if hsname == 옥천여자상업고등학교
    if hsname == 옥포
    if hsname == 온고을여자
    if hsname == 온고을여자고등학교
    if hsname == 온수
    if hsname == 온수고등학교
    if hsname == 온양
    if hsname == 온양고등학교
    if hsname == 온양여자
    if hsname == 온양여자고등학교
    if hsname == 온양온양여자
    if hsname == 온양용화
    if hsname == 온양용화고등학교
    if hsname == 온양한올
    if hsname == 온양한올고
    if hsname == 온양한올고등학교
    if hsname == 옹문
    if hsname == 옹호
    if hsname == 와ㄹ룡
    if hsname == 와공업
    if hsname == 와룔
    if hsname == 와룡
    if hsname == 와룡고등
    if hsname == 와룡고등학교
    if hsname == 와부고등학교
    if hsname == 완도
    if hsname == 완도고등학교
    if hsname == 완도금일
    if hsname == 완도소안
    if hsname == 완도수산
    if hsname == 완도수산고등학교
    if hsname == 완도약산고등학교
    if hsname == 완산
    if hsname == 완산고등학교
    if hsname == 완산여자
    if hsname == 완산여자고등학교
    if hsname == 완산여자상업고등학교
    if hsname == 완용
    if hsname == 완주
    if hsname == 완주고등학교
    if hsname == 완주고산고등학교
    if hsname == 왕신고등학교
    if hsname == 왕신여자
    if hsname == 왕신여자고등학교
    if hsname == 왕심여자
    if hsname == 왕진여고
    if hsname == 왜관
    if hsname == 외국
    if hsname == 외국어
    if hsname == 외국어고등학교
    if hsname == 외국학교
    if hsname == 요수정보과학
    if hsname == 용계
    if hsname == 용궁상업고등학교
    if hsname == 용궁상업고등학교(폐교)
    if hsname == 용남
    if hsname == 용남고등학교
    if hsname == 용남자고등학교
    if hsname == 용님고등학교
    if hsname == 용담
    if hsname == 용마
    if hsname == 용마고등학교
    if hsname == 용문
    if hsname == 용문고등학교
    if hsname == 용문종합
    if hsname == 용산
    if hsname == 용산 공업
    if hsname == 용산고등학교
    if hsname == 용산공
    if hsname == 용산공업
    if hsname == 용산공업고등학교
    if hsname == 용산중앙여자
    if hsname == 용성
    if hsname == 용소
    if hsname == 용아
    if hsname == 용운
    if hsname == 용운고등학교
    if hsname == 용운종합
    if hsname == 용원
    if hsname == 용원고등학교
    if hsname == 용인
    if hsname == 용인 정보
    if hsname == 용인고등
    if hsname == 용인고등학교
    if hsname == 용인바이오
    if hsname == 용인바이오고등학교
    if hsname == 용인백암
    if hsname == 용인백암고등학교
    if hsname == 용인백현고등학교
    if hsname == 용인부설
    if hsname == 용인삼계고등학교
    if hsname == 용인상고
    if hsname == 용인상업고등학교
    if hsname == 용인상지
    if hsname == 용인서원고등학교
    if hsname == 용인성지고등학교
    if hsname == 용인외국어고등학교
    if hsname == 용인정보
    if hsname == 용인정보고등학교
    if hsname == 용인정보산업
    if hsname == 용인정보산업고등학 교
    if hsname == 용인태성
    if hsname == 용인풍덕
    if hsname == 용인한국외국어대학교부설고등학교
    if hsname == 용인홍천고등학교
    if hsname == 용일
    if hsname == 용호
    if hsname == 용호고등학교
    if hsname == 용화
    if hsname == 용화고등학교
    if hsname == 용화여
    if hsname == 용화여자
    if hsname == 용화여자고등학교
    if hsname == 용훈
    if hsname == 우산정보산업
    if hsname == 우석
    if hsname == 우석고등
    if hsname == 우석고등학교
    if hsname == 우석여자
    if hsname == 우석여자고등학교
    if hsname == 우선
    if hsname == 우성
    if hsname == 우성 중앙
    if hsname == 우성고등학교
    if hsname == 우성여자
    if hsname == 우송
    if hsname == 우송고등학교
    if hsname == 우송고등학교고등학교
    if hsname == 우신
    if hsname == 우신고등학교
    if hsname == 우에노미아
    if hsname == 우원
    if hsname == 우주
    if hsname == 우천
    if hsname == 우현
    if hsname == 운ㄴ남
    if hsname == 운남
    if hsname == 운남고등학교
    if hsname == 운남자고등학교
    if hsname == 운동공업
    if hsname == 운명
    if hsname == 운봉
    if hsname == 운봉고등학교
    if hsname == 운봉공고등학교
    if hsname == 운봉공업
    if hsname == 운봉공업고등학교
    if hsname == 운산공업
    if hsname == 운산공업고등학교
    if hsname == 운산기계공업
    if hsname == 운성고등학교
    if hsname == 운실
    if hsname == 운암
    if hsname == 운암고등학교
    if hsname == 운양고등학교
    if hsname == 운일여자
    if hsname == 운중고등학교
    if hsname == 운천
    if hsname == 운천고등학교
    if hsname == 운호
    if hsname == 운호고등학교
    if hsname == 울릉
    if hsname == 울릉고등학교
    if hsname == 울릉종합
    if hsname == 울릉종합고등학교
    if hsname == 울산
    if hsname == 울산  현대
    if hsname == 울산 경의
    if hsname == 울산 공업
    if hsname == 울산 대송
    if hsname == 울산 동천고등학교
    if hsname == 울산 생활과학
    if hsname == 울산 성신
    if hsname == 울산 신선여자
    if hsname == 울산 신정
    if hsname == 울산 여자
    if hsname == 울산 여자상업
    if hsname == 울산 정보 통신
    if hsname == 울산 정보통신
    if hsname == 울산 제일
    if hsname == 울산 중앙
    if hsname == 울산 중앙여자
    if hsname == 울산 홍명
    if hsname == 울산 효정
    if hsname == 울산강남고등학교
    if hsname == 울산경영정보
    if hsname == 울산경영정보고등학교
    if hsname == 울산경의
    if hsname == 울산경의고등학교
    if hsname == 울산고
    if hsname == 울산고등학교
    if hsname == 울산공업
    if hsname == 울산공업고등학교
    if hsname == 울산과학
    if hsname == 울산과학고등학교
    if hsname == 울산남고등학교
    if hsname == 울산남창
    if hsname == 울산농소고등학교
    if hsname == 울산대송
    if hsname == 울산대현
    if hsname == 울산대현고등학교
    if hsname == 울산동천
    if hsname == 울산동천고등학교
    if hsname == 울산동청고등학교
    if hsname == 울산마에스터
    if hsname == 울산마이스터
    if hsname == 울산마이스터고등학교
    if hsname == (구/울산정보통신고)
    if hsname == 울산문수고등학교
    if hsname == 울산문현
    if hsname == 울산문현고등학교
    if hsname == 울산미래정보
    if hsname == 울산미래정보고등학교
    if hsname == 울산미용예술고등학교
    if hsname == 울산방송통신
    if hsname == 울산방송통신고등학교
    if hsname == 울산방어진
    if hsname == 울산산업
    if hsname == 울산산업고등학교
    if hsname == 울산삼산고등학교
    if hsname == 울산삼성여자고등학교
    if hsname == 울산삼일여자
    if hsname == 울산삼일여자고등학교
    if hsname == 울산상업
    if hsname == 울산상업고등학교
    if hsname == 울산상일여자
    if hsname == 울산생활과학
    if hsname == 울산생활과학고등학교
    if hsname == 울산생활과확
    if hsname == 울산서여자상업
    if hsname == 울산성광여자
    if hsname == 울산성신
    if hsname == 울산성신고등학교
    if hsname == 울산시울주군고등학교
    if hsname == 울산시정고등학교
    if hsname == 울산신선
    if hsname == 울산신선여고
    if hsname == 울산신선여자
    if hsname == 울산신정
    if hsname == 울산신정고등학교
    if hsname == 울산애니원
    if hsname == 울산애니원고등학교
    if hsname == 울산에너지
    if hsname == 울산에너지고등학교
    if hsname == 울산여상
    if hsname == 울산여자
    if hsname == 울산여자고등학교
    if hsname == 울산여자상업
    if hsname == 울산여자상업고등학교
    if hsname == 울산예
    if hsname == 울산예술
    if hsname == 울산예술고등학교
    if hsname == 울산오종
    if hsname == 울산외국어고등학교
    if hsname == 울산우신
    if hsname == 울산우신고등학교
    if hsname == 울산인터넷
    if hsname == 울산인터넷고등학교
    if hsname == 울산자연과학
    if hsname == 울산자연과학고등학교
    if hsname == 울산정보
    if hsname == 울산정보고등학교
    if hsname == 울산정보고등학교고등학교
    if hsname == 울산정보산업
    if hsname == 울산정보통신
    if hsname == 울산정보통신고등학교
    if hsname == 울산제일
    if hsname == 울산제일고등학교
    if hsname == 울산제잉
    if hsname == 울산중앙
    if hsname == 울산중앙고등학교
    if hsname == 울산중앙여자
    if hsname == 울산중앙여자고등학교
    if hsname == 울산컴퓨터 과학
    if hsname == 울산컴퓨터고등학교
    if hsname == 울산컴퓨터과학
    if hsname == 울산컴퓨터과학고등학교
    if hsname == 울산컴퓨터과학고등학교(화봉공고)
    if hsname == 울산학성
    if hsname == 울산학성여자
    if hsname == 울산현대
    if hsname == 울산현대고등학교
    if hsname == 울산현대공업고등학교
    if hsname == 울산현대정보과학
    if hsname == 울산현대청운고등학교
    if hsname == 울산흑석
    if hsname == 울진
    if hsname == 울진고등학교
    if hsname == 울진여자
    if hsname == 울진여자고등학교
    if hsname == 웅산
    if hsname == 웅상
    if hsname == 웅상고등학교
    if hsname == 웅천
    if hsname == 웅천고등학교
    if hsname == 원강
    if hsname == 원경
    if hsname == 원경고등학교
    if hsname == 원곡
    if hsname == 원곡고등학교
    if hsname == 원과여자
    if hsname == 원광
    if hsname == 원광 예술
    if hsname == 원광 정보 예술
    if hsname == 원광고등학교
    if hsname == 원광대학부속
    if hsname == 원광여자
    if hsname == 원광여자고등학교
    if hsname == 원광여자종합
    if hsname == 원광영자
    if hsname == 원광예술고등학교
    if hsname == 원광정보
    if hsname == 원광정보고등학교
    if hsname == 원광정보예술
    if hsname == 원광정보예술고등학교
    if hsname == 원광정보예술고등학교(구/원광여자정보..
    if hsname == 원국
    if hsname == 원남
    if hsname == 원당
    if hsname == 원당고등학교
    if hsname == 원덕
    if hsname == 원덕고등학교
    if hsname == 원리
    if hsname == 원묵고등학교
    if hsname == 원미
    if hsname == 원미고등학교
    if hsname == 원복고등학교
    if hsname == 원봉
    if hsname == 원봉고등학교
    if hsname == 원산여자
    if hsname == 원성
    if hsname == 원예
    if hsname == 원일실업
    if hsname == 원자력마이스터
    if hsname == 원자여자
    if hsname == 원정
    if hsname == 원종
    if hsname == 원종고등학교
    if hsname == 원주
    if hsname == 원주 대성
    if hsname == 원주 여자
    if hsname == 원주 육민관
    if hsname == 원주(강원도)
    if hsname == 원주고등학교
    if hsname == 원주고등학교부설 방송통신고등학교
    if hsname == 원주공업
    if hsname == 원주공업고등학교
    if hsname == 원주농업
    if hsname == 원주대성
    if hsname == 원주대성고등학교
    if hsname == 원주방송통신
    if hsname == 원주북원
    if hsname == 원주삼육
    if hsname == 원주삼육고등학교
    if hsname == 원주상지여자고등학교
    if hsname == 원주여자
    if hsname == 원주여자고등학교
    if hsname == 원주의료
    if hsname == 원주의료고등학교
    if hsname == 원주정보고등학교
    if hsname == 원주정보공업
    if hsname == 원주정보공업고등학교
    if hsname == 원주진광고등학교
    if hsname == 원초
    if hsname == 원통
    if hsname == 원통고등학교
    if hsname == 원홍
    if hsname == 원화
    if hsname == 원화여자
    if hsname == 원화여자고등학교
    if hsname == 월계
    if hsname == 월계고등학교
    if hsname == 월곡고등학교
    if hsname == 월봉
    if hsname == 월봉고등학교
    if hsname == 월야종합고등학교
    if hsname == 위광여자
    if hsname == 위도
    if hsname == 위도고등학교
    if hsname == 위례정보
    if hsname == 위례정보산업
    if hsname == 위례정보산업고등학교
    if hsname == 위암
    if hsname == 위일여자
    if hsname == 유구
    if hsname == 유구공업
    if hsname == 유봉
    if hsname == 유봉고등학교
    if hsname == 유봉여자
    if hsname == 유봉여자고등학교
    if hsname == 유성
    if hsname == 유성고
    if hsname == 유성고등학교
    if hsname == 유성생명
    if hsname == 유성생명과학
    if hsname == 유성생명과학고등학교
    if hsname == 유성여자
    if hsname == 유성여자고등학교
    if hsname == 유신
    if hsname == 유신고등학교
    if hsname == 유원
    if hsname == 유일
    if hsname == 유일여자
    if hsname == 유일여자고등
    if hsname == 유일여자고등학교
    if hsname == 유한
    if hsname == 유한고
    if hsname == 유한공
    if hsname == 유한공고
    if hsname == 유한공업
    if hsname == 유한공업고등학교
    if hsname == 유흥여자
    if hsname == 육림관
    if hsname == 육민관
    if hsname == 육민관고등학교
    if hsname == 육호
    if hsname == 윤호
    if hsname == 율곡
    if hsname == 율곡고등학교
    if hsname == 율면
    if hsname == 율면고등학교
    if hsname == 율천고등학교
    if hsname == 은곡
    if hsname == 은곡(아이티)
    if hsname == 은곡공업
    if hsname == 은곡공업고등학교
    if hsname == 은관여자
    if hsname == 은광
    if hsname == 은광여고
    if hsname == 은광여자
    if hsname == 은광여자고등학교
    if hsname == 은상
    if hsname == 은일정보산업
    if hsname == 은일정보산업고등학교
    if hsname == 은척고등학교
    if hsname == 은평
    if hsname == 은평고등학교
    if hsname == 은평공업
    if hsname == 은평메디택
    if hsname == 은평메디텍고등학교
    if hsname == 은평앱미디어
    if hsname == 은평웹미디어
    if hsname == 은평웹미디어고등학교
    if hsname == 은행
    if hsname == 은행고등학교
    if hsname == 은혜
    if hsname == 은혜고
    if hsname == 은혜고등학교
    if hsname == 은혜정보산업
    if hsname == 은호
    if hsname == 음곡공업
    if hsname == 음성
    if hsname == 음성고
    if hsname == 음성고등학교
    if hsname == 음성매괴고등학교
    if hsname == 음암정보
    if hsname == 음평웹미디어
    if hsname == 응곡공업
    if hsname == 응답거부
    if hsname == 응답안함
    if hsname == 응답없음
    if hsname == 응봉공업
    if hsname == 의령
    if hsname == 의령고등학교
    if hsname == 의령여자
    if hsname == 의령여자고등학교
    if hsname == 의성
    if hsname == 의성고등학교
    if hsname == 의성공고
    if hsname == 의성공업
    if hsname == 의성공업고등학교
    if hsname == 의성여자
    if hsname == 의성여자고등학교
    if hsname == 의여고
    if hsname == 의왕
    if hsname == 의왕 우성
    if hsname == 의왕고등학교
    if hsname == 의정부
    if hsname == 의정부 공업
    if hsname == 의정부 광동
    if hsname == 의정부 부용
    if hsname == 의정부 여자
    if hsname == 의정부고
    if hsname == 의정부고등학교
    if hsname == 의정부공업
    if hsname == 의정부공업고등학교
    if hsname == 의정부광동고등학교
    if hsname == 의정부부용고등학교
    if hsname == 의정부송현
    if hsname == 의정부시광동
    if hsname == 의정부여
    if hsname == 의정부여자
    if hsname == 의정부여자고등학교
    if hsname == 의침공업
    if hsname == 이강남
    if hsname == 이경여자
    if hsname == 이광
    if hsname == 이광자동차고등학교
    if hsname == 이내
    if hsname == 이대 부속
    if hsname == 이대병설미디어
    if hsname == 이대병설미디어고등학교
    if hsname == 이대부
    if hsname == 이대부고
    if hsname == 이대부속
    if hsname == 이대부속고등학교
    if hsname == 이대부속금란
    if hsname == 이대약
    if hsname == 이리
    if hsname == 이리 여자
    if hsname == 이리고
    if hsname == 이리고등학교
    if hsname == 이리공고
    if hsname == 이리공업
    if hsname == 이리공업고등학교
    if hsname == 이리기계공업
    if hsname == 이리남성여
    if hsname == 이리남성여자
    if hsname == 이리남성여자고등학교
    if hsname == 이리농림
    if hsname == 이리농림고등학교
    if hsname == 이리상고
    if hsname == 이리상업
    if hsname == 이리여고
    if hsname == 이리여자
    if hsname == 이리여자고등학교
    if hsname == 이리원광
    if hsname == 이림
    if hsname == 이매
    if hsname == 이매고등학교
    if hsname == 이문
    if hsname == 이문고등학교
    if hsname == 이사벨
    if hsname == 이사벨고등학교
    if hsname == 이사벨여고
    if hsname == 이사벨여자
    if hsname == 이사벨여자고등학교
    if hsname == 이서
    if hsname == 이서고등학교
    if hsname == 이성여자
    if hsname == 이양
    if hsname == 이여고
    if hsname == 이우
    if hsname == 이우고등학교
    if hsname == 이원공업고등학교
    if hsname == 이일
    if hsname == 이일 여자
    if hsname == 이일여자
    if hsname == 이일여자고등학교
    if hsname == 이창
    if hsname == 이천
    if hsname == 이천 양정 여자
    if hsname == 이천 양정여자
    if hsname == 이천 제일고등학교
    if hsname == 이천경남고등학교
    if hsname == 이천경남자고등학교
    if hsname == 이천고등학교
    if hsname == 이천실업
    if hsname == 이천앙성여자
    if hsname == 이천양정
    if hsname == 이천양정여자
    if hsname == 이천양정여자고등학교
    if hsname == 이천여자
    if hsname == 이천여자정보
    if hsname == 이천제일
    if hsname == 이천제일고등학교
    if hsname == 이천제일고등학교(구: 이천실업고등학교)
    if hsname == 이촌고등학교
    if hsname == 이충고등학교
    if hsname == 이태원오산
    if hsname == 이포
    if hsname == 이포고등학교
    if hsname == 이현
    if hsname == 이화
    if hsname == 이화금란
    if hsname == 이화대학 외국어
    if hsname == 이화미디어
    if hsname == 이화여대병설 미디어
    if hsname == 이화여대병설미디어
    if hsname == 이화여대병설미디어고등학교
    if hsname == 이화여대부속
    if hsname == 이화여대부속금란
    if hsname == 이화여대사범대학부속고등학교
    if hsname == 이화여자
    if hsname == 이화여자고등학교
    if hsname == 이화여자대학교병설미디어
    if hsname == 이화여자대학교병설미디어고등학교
    if hsname == 이화여자대학교사범대학부속금란
    if hsname == 이화여자대학교사범대학부속이화금란
    if hsname == 이화여자대학교사범대학부속이화금란고..
    if hsname == 이화여자외국어
    if hsname == 이화여자외국어고등학교
    if hsname == 이화외고
    if hsname == 이화외국어
    if hsname == 익산
    if hsname == 익산 남성
    if hsname == 익산고등학교
    if hsname == 익산남성
    if hsname == 익산성일고등학교
    if hsname == 익산성일고등학교(구/황등상고)
    if hsname == 익산여자
    if hsname == 익산여자고등학교
    if hsname == 익산원광
    if hsname == 익산원광예술고등학교
    if hsname == 익산이일여자
    if hsname == 익산제일고등학교
    if hsname == 인광
    if hsname == 인남
    if hsname == 인덕
    if hsname == 인덕 공업
    if hsname == 인덕공고
    if hsname == 인덕공업
    if hsname == 인덕공업고등학교
    if hsname == 인덕원
    if hsname == 인덕원고등학교
    if hsname == 인덛공고
    if hsname == 인동
    if hsname == 인동고등학교
    if hsname == 인명
    if hsname == 인명여고
    if hsname == 인명여자
    if hsname == 인명여자고등학교
    if hsname == 인문
    if hsname == 인문계
    if hsname == 인문계(이과)
    if hsname == 인산경안
    if hsname == 인산동
    if hsname == 인상
    if hsname == 인상고등학교
    if hsname == 인성
    if hsname == 인성 여자
    if hsname == 인성여고
    if hsname == 인성여자
    if hsname == 인성여자고등
    if hsname == 인성여자고등학교
    if hsname == 인순계
    if hsname == 인영여자
    if hsname == 인월
    if hsname == 인월고등학교
    if hsname == 인일
    if hsname == 인일여
    if hsname == 인일여자
    if hsname == 인일여자고등학교
    if hsname == 인제
    if hsname == 인제(인천)
    if hsname == 인제고등학교
    if hsname == 인제여자
    if hsname == 인창
    if hsname == 인창고
    if hsname == 인창고등학교
    if hsname == 인천
    if hsname == 인천 가림
    if hsname == 인천 광성
    if hsname == 인천 남
    if hsname == 인천 남자
    if hsname == 인천 대건
    if hsname == 인천 대인
    if hsname == 인천 대헌
    if hsname == 인천 도화기계
    if hsname == 인천 디자인
    if hsname == 인천 박문
    if hsname == 인천 방문여자
    if hsname == 인천 부평
    if hsname == 인천 여자
    if hsname == 인천 여자 공업
    if hsname == 인천 여자 상업
    if hsname == 인천 영신
    if hsname == 인천 예일
    if hsname == 인천 원당
    if hsname == 인천 인일 여자
    if hsname == 인천 인화여자
    if hsname == 인천 진선
    if hsname == 인천 한진고등학교
    if hsname == 인천 효성
    if hsname == 인천가림
    if hsname == 인천가정
    if hsname == 인천가좌
    if hsname == 인천가좌고등학교
    if hsname == 인천강화고등학교
    if hsname == 인천계산
    if hsname == 인천계산여자
    if hsname == 인천고등전문
    if hsname == 인천고등학교
    if hsname == 인천고잔고등학교
    if hsname == 인천공항
    if hsname == 인천공항고등학교
    if hsname == 인천과학
    if hsname == 인천과학고등학교
    if hsname == 인천광성
    if hsname == 인천광성고등학교
    if hsname == 인천국제고등학교
    if hsname == 인천국제물류
    if hsname == 인천기계
    if hsname == 인천기계공고
    if hsname == 인천기계공업
    if hsname == 인천기계공업고
    if hsname == 인천기계공업고등학교
    if hsname == 인천기예공업
    if hsname == 인천남
    if hsname == 인천남고
    if hsname == 인천남고등학교
    if hsname == 인천남동고등학교
    if hsname == 인천남자
    if hsname == 인천남자고등학교
    if hsname == 인천논현
    if hsname == 인천논현고등학교
    if hsname == 인천대건
    if hsname == 인천대건고등학교
    if hsname == 인천대인
    if hsname == 인천대진
    if hsname == 인천동산
    if hsname == 인천동산고등학교
    if hsname == 인천디자인
    if hsname == 인천디자인고등학교
    if hsname == 인천디자인과학
    if hsname == 인천마이스터고등학교
    if hsname == 인천명신
    if hsname == 인천명신여자
    if hsname == 인천문일여자
    if hsname == 인천문학정보
    if hsname == 인천박문여자
    if hsname == 인천박문여자고등학교
    if hsname == 인천백석고등학교
    if hsname == 인천부개여자
    if hsname == 인천부광
    if hsname == 인천부평
    if hsname == 인천부평ㅇㅇ
    if hsname == 인천부흥
    if hsname == 인천부흥고등학교
    if hsname == 인천비즈니스
    if hsname == 인천비즈니스고등학교
    if hsname == 인천비지니스
    if hsname == 인천사대부속고등학교
    if hsname == 인천사립
    if hsname == 인천산곡
    if hsname == 인천산곡고등학교
    if hsname == 인천삼산
    if hsname == 인천삼산고등학교
    if hsname == 인천삼선
    if hsname == 인천상정고등학교
    if hsname == 인천생활과학
    if hsname == 인천생활과학고
    if hsname == 인천생활과학고등학교
    if hsname == 인천생활예술고등학교
    if hsname == 인천서운
    if hsname == 인천석정
    if hsname == 인천석정여자
    if hsname == 인천석정여자고등학교
    if hsname == 인천선인
    if hsname == 인천선인고등학교
    if hsname == 인천성덕여자
    if hsname == 인천세무
    if hsname == 인천세무고등학교
    if hsname == 인천세원고등학교
    if hsname == 인천세일
    if hsname == 인천송도
    if hsname == 인천숭덕여자
    if hsname == 인천신명여자
    if hsname == 인천신현
    if hsname == 인천신현고등학교
    if hsname == 인천안남
    if hsname == 인천양정여자
    if hsname == 인천양촌고등학교
    if hsname == 인천여
    if hsname == 인천여고
    if hsname == 인천여상
    if hsname == 인천여자
    if hsname == 인천여자고등학교
    if hsname == 인천여자공업
    if hsname == 인천여자공업고등학교
    if hsname == 인천여자상업
    if hsname == 인천여자상업고등학교
    if hsname == 인천연수
    if hsname == 인천영선
    if hsname == 인천영선고등학교
    if hsname == 인천영화여자
    if hsname == 인천영화여자정보고등학교
    if hsname == 인천영흥
    if hsname == 인천예술
    if hsname == 인천예술고등학교
    if hsname == 인천예일
    if hsname == 인천예일고등학교
    if hsname == 인천예화여자
    if hsname == 인천옥련여고
    if hsname == 인천옥면여자
    if hsname == 인천외국어
    if hsname == 인천외국어고등학교
    if hsname == 인천외국어고등학교(구 영일고등학교)
    if hsname == 인천운봉공업고등학교
    if hsname == 인천원당
    if hsname == 인천원당고등학교
    if hsname == 인천인명
    if hsname == 인천인성여자
    if hsname == 인천인일여자
    if hsname == 인천인제
    if hsname == 인천인제고등학교
    if hsname == 인천인항
    if hsname == 인천작전
    if hsname == 인천작전고등학교
    if hsname == 인천작전여자
    if hsname == 인천전자고등학교
    if hsname == 인천전자공업
    if hsname == 인천전자공업고등학교
    if hsname == 인천전자마이스터
    if hsname == 인천전자마이스터고등학교
    if hsname == 인천정보
    if hsname == 인천정보산업
    if hsname == 인천정보산업고등학교
    if hsname == 인천제일
    if hsname == 인천제일고등학교
    if hsname == 인천제일정보고등학교
    if hsname == 인천중앙
    if hsname == 인천중앙여자
    if hsname == 인천중앙여자상업
    if hsname == 인천중앙여자상업고등학교
    if hsname == 인천진산
    if hsname == 인천진산고등학교
    if hsname == 인천진산과학고등학교
    if hsname == 인천체육
    if hsname == 인천체육고등학교
    if hsname == 인천하이텍고등학교
    if hsname == 인천학익
    if hsname == 인천학익여자
    if hsname == 인천한진
    if hsname == 인천해사
    if hsname == 인천해사고등학교
    if hsname == 인천해양과학
    if hsname == 인천해양과학고등학교
    if hsname == 인천혜광
    if hsname == 인천효성
    if hsname == 인천효성고
    if hsname == 인천효성고등학교
    if hsname == 인첨정보산업
    if hsname == 인청
    if hsname == 인터넷
    if hsname == 인터넷고등학교
    if hsname == 인평
    if hsname == 인평자동차정보
    if hsname == 인평자동차정보고등학교
    if hsname == 인평정보
    if hsname == 인하대 사대 부속
    if hsname == 인하대부속
    if hsname == 인하대부속사범
    if hsname == 인하대사대부속
    if hsname == 인하대사범
    if hsname == 인하대사범대부속
    if hsname == 인하대사범대학부속
    if hsname == 인하대학교 사범대학 부속
    if hsname == 인하대학교 사범대학 부속고등학교
    if hsname == 인하대학교 사범부설
    if hsname == 인하대학교부속
    if hsname == 인하대학교사범대학부속
    if hsname == 인하대학교사범대학부속고등
    if hsname == 인하대학교사범대학부속고등학교
    if hsname == 인하부
    if hsname == 인하부고
    if hsname == 인하부속
    if hsname == 인하사대부
    if hsname == 인하사대부대
    if hsname == 인하사대부속
    if hsname == 인하사대부속고등학교
    if hsname == 인하사범대부속
    if hsname == 인하여자
    if hsname == 인항
    if hsname == 인항고등학교
    if hsname == 인헌
    if hsname == 인헌고등학교
    if hsname == 인현
    if hsname == 인현고등학교
    if hsname == 인화
    if hsname == 인화 사립부속
    if hsname == 인화 여자
    if hsname == 인화고등학교
    if hsname == 인화부속
    if hsname == 인화여고
    if hsname == 인화여자
    if hsname == 인화여자고등학교
    if hsname == 일동
    if hsname == 일동고등학교
    if hsname == 일동상업
    if hsname == 일동종합
    if hsname == 일반
    if hsname == 일반고등학교
    if hsname == 일산
    if hsname == 일산 대진
    if hsname == 일산 동
    if hsname == 일산 동구
    if hsname == 일산 백석
    if hsname == 일산 주엽
    if hsname == 일산고등학교
    if hsname == 일산공업
    if hsname == 일산공업고등학교
    if hsname == 일산국제컨벤션고등학교
    if hsname == 일산국제컴벤션
    if hsname == 일산남성여자고등학교
    if hsname == 일산대건
    if hsname == 일산대전
    if hsname == 일산대진
    if hsname == 일산대진고등학교
    if hsname == 일산동
    if hsname == 일산동고등학교
    if hsname == 일산백마
    if hsname == 일산백석고등학교
    if hsname == 일산백신
    if hsname == 일산상일여자고등학교
    if hsname == 일산여상
    if hsname == 일산여자
    if hsname == 일산이일여자
    if hsname == 일산저동
    if hsname == 일산정보
    if hsname == 일산정보산업
    if hsname == 일산정보산업고등학교
    if hsname == 일산컴퓨터과학고등학교
    if hsname == 일성
    if hsname == 일성고등학교
    if hsname == 일성여자
    if hsname == 일성여자고등학교
    if hsname == 일성여자상업
    if hsname == 일성여자중
    if hsname == 일성여자중고등학교
    if hsname == 일성제일
    if hsname == 일성제일고등학교
    if hsname == 일성중
    if hsname == 일신
    if hsname == 일신상업
    if hsname == 일신여
    if hsname == 일신여상
    if hsname == 일신여자
    if hsname == 일신여자고등학교
    if hsname == 일신여자산업
    if hsname == 일신여자상업
    if hsname == 일신여자상업고등학교
    if hsname == 일신여자실업
    if hsname == 일신정보산업
    if hsname == 일원
    if hsname == 일죽
    if hsname == 일죽고등학교
    if hsname == 일죽종합
    if hsname == 일죽종합고등학교
    if hsname == 임계
    if hsname == 임계고등학교
    if hsname == 임동
    if hsname == 임실
    if hsname == 임실고등학교
    if hsname == 임실서
    if hsname == 임실서고등학교
    if hsname == 임자고등학교
    if hsname == 임자종합
    if hsname == 임천전자
    if hsname == 임하고등학교
    if hsname == 자동차고등학교
    if hsname == 자립형사립
    if hsname == 자사고
    if hsname == 자양
    if hsname == 자양고등
    if hsname == 자양고등학교
    if hsname == 자연과학
    if hsname == 자연과학고등학교
    if hsname == 자연농업
    if hsname == 자영
    if hsname == 자영고등학교
    if hsname == 자영농업
    if hsname == 자운
    if hsname == 자운고등학교
    if hsname == 자원
    if hsname == 자인
    if hsname == 자인농업
    if hsname == 자인여자
    if hsname == 자인여자전산
    if hsname == 자인전산
    if hsname == 작전
    if hsname == 작전고등학교
    if hsname == 작전여
    if hsname == 작전여자
    if hsname == 작전여자고등학교
    if hsname == 작점
    if hsname == 잔여자고등학교
    if hsname == 잠신
    if hsname == 잠신고등학교
    if hsname == 잠실
    if hsname == 잠실 여자
    if hsname == 잠실고등학교
    if hsname == 잠실여
    if hsname == 잠실여고
    if hsname == 잠실여자
    if hsname == 잠실여자고등학교
    if hsname == 장계
    if hsname == 장계공업
    if hsname == 장계공업고등학교
    if hsname == 장곡
    if hsname == 장곡고등학교
    if hsname == 장기고등학교
    if hsname == 장덕고등학교
    if hsname == 장문
    if hsname == 장부고등학교
    if hsname == 장북
    if hsname == 장선
    if hsname == 장성
    if hsname == 장성고등학교
    if hsname == 장성농업
    if hsname == 장성실업
    if hsname == 장성실업고등학교
    if hsname == 장성실업고등학교(구/장성농고)
    if hsname == 장성여자
    if hsname == 장성여자고등학교
    if hsname == 장수
    if hsname == 장수고등학교
    if hsname == 장신
    if hsname == 장안
    if hsname == 장안 제일
    if hsname == 장안고등학교
    if hsname == 장안공업
    if hsname == 장안여자
    if hsname == 장안제일
    if hsname == 장안제일고등학교
    if hsname == 장안종합
    if hsname == 장여
    if hsname == 장원
    if hsname == 장원고등학교
    if hsname == 장원여자
    if hsname == 장원중업
    if hsname == 장유
    if hsname == 장유고등학교
    if hsname == 장충
    if hsname == 장충고등학교
    if hsname == 장항
    if hsname == 장항고등학교
    if hsname == 장항공업
    if hsname == 장항공업고등학교
    if hsname == 장호공업
    if hsname == 장호공업고등학교
    if hsname == 장호원
    if hsname == 장호원고등학교
    if hsname == 장호원공업
    if hsname == 장훈
    if hsname == 장훈고등학교
    if hsname == 장훈여자상업
    if hsname == 장훈여자상업고등학교
    if hsname == 장흥
    if hsname == 장흥 관산
    if hsname == 장흥고등학교
    if hsname == 장흥관산
    if hsname == 장흥관산고등학교
    if hsname == 장흥대덕종합고등학교
    if hsname == 장흥실업
    if hsname == 장흥실업고등학교
    if hsname == 장흥여자
    if hsname == 장흥종합
    if hsname == 재건
    if hsname == 재경상업
    if hsname == 재계
    if hsname == 재능
    if hsname == 재능유비쿼터스
    if hsname == 재능유비쿼터스고등학교
    if hsname == 재명여자
    if hsname == 재물포
    if hsname == 재생
    if hsname == 재송여자
    if hsname == 재원
    if hsname == 재철
    if hsname == 재현
    if hsname == 재현고등학교
    if hsname == 재활고등학교
    if hsname == 저동
    if hsname == 저동고등학교
    if hsname == 저현고등학교
    if hsname == 적산
    if hsname == 적성종합
    if hsname == 전곡
    if hsname == 전곡고등학교
    if hsname == 전곡종합
    if hsname == 전골
    if hsname == 전남
    if hsname == 전남 강진
    if hsname == 전남 고흥고등학교
    if hsname == 전남 목포
    if hsname == 전남 미용
    if hsname == 전남 여자상업
    if hsname == 전남 예술
    if hsname == 전남 제일
    if hsname == 전남 체육
    if hsname == 전남고등학교
    if hsname == 전남공고
    if hsname == 전남공업
    if hsname == 전남공업고등학교
    if hsname == 전남과학
    if hsname == 전남과학고
    if hsname == 전남과학고등학교
    if hsname == 전남과학기술
    if hsname == 전남과학기술고등학교
    if hsname == 전남대 사대부속
    if hsname == 전남대부설고등학교
    if hsname == 전남대부속
    if hsname == 전남대학교 사대부속
    if hsname == 전남대학교 사범대학 부설고등학교
    if hsname == 전남대학교 사범대학부속
    if hsname == 전남대학교사범대학부설
    if hsname == 전남대학교사범대학부설고등학교
    if hsname == 전남대학사범대학부설
    if hsname == 전남미용
    if hsname == 전남미용고등학교
    if hsname == 전남보건고등학교
    if hsname == 전남사대부속
    if hsname == 전남사대부속고등학교
    if hsname == 전남생명과학
    if hsname == 전남생명과학고등학교
    if hsname == 전남생명과학고등학교(구/강진농업고)
    if hsname == 전남순천에지
    if hsname == 전남여고
    if hsname == 전남여고방송통신
    if hsname == 전남여고부설방송통신고
    if hsname == 전남여상부설방송통신
    if hsname == 전남여자
    if hsname == 전남여자고등학교
    if hsname == 전남여자상업
    if hsname == 전남여자상업고등학교
    if hsname == 전남여천
    if hsname == 전남예술
    if hsname == 전남예술고등학교
    if hsname == 전남외
    if hsname == 전남외국어
    if hsname == 전남외국어고등학교
    if hsname == 전남음성
    if hsname == 전남자고등학교
    if hsname == 전남제일
    if hsname == 전남제일고등학교
    if hsname == 전남제일고등학교(구/목포상고)
    if hsname == 전남조리과학고등학교
    if hsname == 전남체육
    if hsname == 전남체육고등학교
    if hsname == 전남효천
    if hsname == 전대사대
    if hsname == 전대사대부
    if hsname == 전대사대부고
    if hsname == 전대사대부설
    if hsname == 전대사대부속
    if hsname == 전대사태무
    if hsname == 전두영생
    if hsname == 전라
    if hsname == 전라고등학교
    if hsname == 전라북도립고등학교
    if hsname == 전라북도립여성
    if hsname == 전민
    if hsname == 전민고등학교
    if hsname == 전북
    if hsname == 전북 과학
    if hsname == 전북 기계
    if hsname == 전북 사대부속
    if hsname == 전북고등학교
    if hsname == 전북과학
    if hsname == 전북과학고등학교
    if hsname == 전북기계
    if hsname == 전북기계공고
    if hsname == 전북기계공업
    if hsname == 전북기계공업고등학교
    if hsname == 전북대사범대학부설
    if hsname == 전북대학교 사범대학 부설
    if hsname == 전북대학교 사범대학 부설고등학교
    if hsname == 전북대학교사범대학부설
    if hsname == 전북대학교사범대학부설고등학교
    if hsname == 전북대학교사범대학부속
    if hsname == 전북사대부
    if hsname == 전북사대부고
    if hsname == 전북사대부설
    if hsname == 전북사대부속
    if hsname == 전북사대부속고등학교
    if hsname == 전북사대북속
    if hsname == 전북여자
    if hsname == 전북여자고
    if hsname == 전북여자고등학교
    if hsname == 전북외국어
    if hsname == 전북외국어고등학교
    if hsname == 전북전일
    if hsname == 전북제일
    if hsname == 전북제일고
    if hsname == 전북제일고등학교
    if hsname == 전북제일고등학교(구 이리상업고)
    if hsname == 전북체육
    if hsname == 전북체육고등학교
    if hsname == 전산
    if hsname == 전산고등학교
    if hsname == 전산고등학교고등학교
    if hsname == 전산상업
    if hsname == 전산여자
    if hsname == 전산여자실업고등학교
    if hsname == 전산정보고등학교
    if hsname == 전선
    if hsname == 전인
    if hsname == 전인고등학교
    if hsname == 전일
    if hsname == 전일고
    if hsname == 전일고등학교
    if hsname == 전자
    if hsname == 전자공
    if hsname == 전자공업
    if hsname == 전자공업고등학교
    if hsname == 전자디자인
    if hsname == 전자여자
    if hsname == 전자화학고등학교
    if hsname == 전주
    if hsname == 전주 상산
    if hsname == 전주 신흥
    if hsname == 전주 영생
    if hsname == 전주 완산 여자 상업
    if hsname == 전주 진북
    if hsname == 전주 해성
    if hsname == 전주고등학교
    if hsname == 전주공고
    if hsname == 전주공업
    if hsname == 전주공업고등학교
    if hsname == 전주근영 여자
    if hsname == 전주근영고등학교
    if hsname == 전주근영여자
    if hsname == 전주근영여자고등학교
    if hsname == 전주금암
    if hsname == 전주금암고등학교
    if hsname == 전주기계공업
    if hsname == 전주기린여자
    if hsname == 전주기전여자
    if hsname == 전주기전여자고등학교
    if hsname == 전주농림
    if hsname == 전주농림고등학교
    if hsname == 전주농업
    if hsname == 전주농업고등학교
    if hsname == 전주대부속
    if hsname == 전주대학교 사범대학 부설고등학교
    if hsname == 전주대학교사범대학부설
    if hsname == 전주대학교사범대학부설고등학교
    if hsname == 전주동암
    if hsname == 전주동암고등학교
    if hsname == 전주부속
    if hsname == 전주사대부고등학교
    if hsname == 전주상고
    if hsname == 전주상업
    if hsname == 전주상업고등학교
    if hsname == 전주상업정보
    if hsname == 전주상업정보고등학교
    if hsname == 전주생명
    if hsname == 전주생명과학
    if hsname == 전주생명과학고등학교
    if hsname == 전주성신여고등학교
    if hsname == 전주성심여자
    if hsname == 전주성심여자고등학교
    if hsname == 전주솔내
    if hsname == 전주솔내고등학교
    if hsname == 전주솔레
    if hsname == 전주솔매
    if hsname == 전주신흥
    if hsname == 전주신흥고등학교
    if hsname == 전주여고
    if hsname == 전주여상
    if hsname == 전주여자
    if hsname == 전주여자고등학교
    if hsname == 전주여자상업
    if hsname == 전주여자상업고등학교
    if hsname == 전주영상미디어고등학교
    if hsname == 전주영생
    if hsname == 전주영생고등학교
    if hsname == 전주영생여자상업
    if hsname == 전주예술
    if hsname == 전주예술고등학교
    if hsname == 전주완산
    if hsname == 전주우석
    if hsname == 전주유일
    if hsname == 전주유일여자
    if hsname == 전주유일여자고등학교
    if hsname == 전주전대사범분교고등학교
    if hsname == 전주전일
    if hsname == 전주제일
    if hsname == 전주제일고등학교
    if hsname == 전주제일고등학교(구 전주상업고등학교)
    if hsname == 전주중앙
    if hsname == 전주중앙여자
    if hsname == 전주중앙여자고등학교
    if hsname == 전주진북고등학교
    if hsname == 전주한일
    if hsname == 전주한일고등학교
    if hsname == 전주해성
    if hsname == 전주해성고등학교
    if hsname == 전주호남제일
    if hsname == 전통국악예술
    if hsname == 전통문화
    if hsname == 전통예고등학교
    if hsname == 전통예술고등학교
    if hsname == 점동
    if hsname == 점동고등학교
    if hsname == 점동종합
    if hsname == 점촌
    if hsname == 점촌고등학교
    if hsname == 정 읍
    if hsname == 정관여자고등학교
    if hsname == 정광
    if hsname == 정광고등학교
    if hsname == 정근
    if hsname == 정남 여자
    if hsname == 정동
    if hsname == 정동고등학교
    if hsname == 정란여자상업고등학교
    if hsname == 정랑
    if hsname == 정명
    if hsname == 정명고등학교
    if hsname == 정명여자
    if hsname == 정명여자고등학교
    if hsname == 정명여자상업
    if hsname == 정명여자정보
    if hsname == 정명여자정보고등학교
    if hsname == 정명정보
    if hsname == 정명정보고등학교
    if hsname == 정민 아이티
    if hsname == 정발
    if hsname == 정발(일산)
    if hsname == 정발고등학교
    if hsname == 정발산
    if hsname == 정방고등학교
    if hsname == 정보
    if hsname == 정보 산업
    if hsname == 정보고
    if hsname == 정보고등학교
    if hsname == 정보공업
    if hsname == 정보공업고등학교
    if hsname == 정보과학
    if hsname == 정보과학고등학교
    if hsname == 정보관광
    if hsname == 정보관광고등학교
    if hsname == 정보국악
    if hsname == 정보산업
    if hsname == 정보산업고등학교
    if hsname == 정보상업
    if hsname == 정보제일
    if hsname == 정보통신
    if hsname == 정산
    if hsname == 정산고등학교
    if hsname == 정석
    if hsname == 정석 항공
    if hsname == 정석항공
    if hsname == 정석항공고등학교
    if hsname == 정석항공공업
    if hsname == 정석항공공업고등학교
    if hsname == 정석항공과학
    if hsname == 정석항공과학고등학교
    if hsname == 정선
    if hsname == 정선고등학교
    if hsname == 정선실업
    if hsname == 정선여자
    if hsname == 정선인계
    if hsname == 정선정보
    if hsname == 정선정보공업
    if hsname == 정선정보공업고등학교
    if hsname == 정성
    if hsname == 정성여자
    if hsname == 정성전자
    if hsname == 정성항공
    if hsname == 정성항공과학
    if hsname == 정성항공과학고등학교
    if hsname == 정신
    if hsname == 정신여
    if hsname == 정신여고
    if hsname == 정신여자
    if hsname == 정신여자고등학교
    if hsname == 정안
    if hsname == 정암
    if hsname == 정암고등학교
    if hsname == 정암미용
    if hsname == 정암미용고등학교
    if hsname == 정양미용
    if hsname == 정영
    if hsname == 정왕
    if hsname == 정왕고등학교
    if hsname == 정외여자
    if hsname == 정운
    if hsname == 정원
    if hsname == 정원(안산)
    if hsname == 정으호남
    if hsname == 정읍
    if hsname == 정읍 서영여자
    if hsname == 정읍고등학교
    if hsname == 정읍남일고등학교
    if hsname == 정읍농민고등학교
    if hsname == 정읍배영
    if hsname == 정읍여자
    if hsname == 정읍여자고등학교
    if hsname == 정읍여자상업
    if hsname == 정읍제일
    if hsname == 정읍제일고등학교
    if hsname == 정읍학산
    if hsname == 정의
    if hsname == 정의 여자
    if hsname == 정의여자
    if hsname == 정의여자고등
    if hsname == 정의여자고등학교
    if hsname == 정인여상
    if hsname == 정일
    if hsname == 정일 여
    if hsname == 정점
    if hsname == 정주
    if hsname == 정주고등학교
    if hsname == 정주상업
    if hsname == 정포
    if hsname == 정화
    if hsname == 정화 미용
    if hsname == 정화미용
    if hsname == 정화미용고등학교
    if hsname == 정화여자
    if hsname == 정화여자고등학 교
    if hsname == 정화여자고등학교
    if hsname == 정화여자상업
    if hsname == 정화여자상업고등학교
    if hsname == 정희여자상업
    if hsname == 정희여자상업고등학교
    if hsname == 제명
    if hsname == 제물포
    if hsname == 제물포고교부설방송통신
    if hsname == 제물포고등학교
    if hsname == 제원
    if hsname == 제원예술
    if hsname == 제인여자
    if hsname == 제일
    if hsname == 제일고
    if hsname == 제일고등
    if hsname == 제일고등학교
    if hsname == 제일상업
    if hsname == 제일여
    if hsname == 제일여고
    if hsname == 제일여상
    if hsname == 제일여자
    if hsname == 제일여자고
    if hsname == 제일여자고등학교
    if hsname == 제일여자상업
    if hsname == 제일여자정보
    if hsname == 제일여자정보고등학교
    if hsname == 제일외국어
    if hsname == 제일정보
    if hsname == 제일정보고등학교
    if hsname == 제일정보산업
    if hsname == 제일정보중고등학교
    if hsname == 제일종합
    if hsname == 제일종합고등학교고등학교
    if hsname == 제주
    if hsname == 제주 여상
    if hsname == 제주 여자
    if hsname == 제주 여자 상업
    if hsname == 제주 여자상업
    if hsname == 제주 외국어
    if hsname == 제주 제일
    if hsname == 제주 포선
    if hsname == 제주고등학교
    if hsname == 제주공
    if hsname == 제주공업
    if hsname == 제주공업고등학교
    if hsname == 제주과학
    if hsname == 제주과학고등학교
    if hsname == 제주관광
    if hsname == 제주관광산업
    if hsname == 제주관광산업고등학교
    if hsname == 제주관광해양고등학교
    if hsname == 제주대부속
    if hsname == 제주대정여고
    if hsname == 제주대학교 사범대학 부설
    if hsname == 제주대학교 사범대학 부설고등학교
    if hsname == 제주대학교 사범대학 부설중학교
    if hsname == 제주대학교 사범대학부설
    if hsname == 제주대학교부설
    if hsname == 제주대학교사범대학부설
    if hsname == 제주대학교사범대학부설고등학교
    if hsname == 제주대학교사범대학부속
    if hsname == 제주도한림
    if hsname == 제주뷰티
    if hsname == 제주사대부설
    if hsname == 제주사대부속
    if hsname == 제주사대부속고등학교
    if hsname == 제주삼성여자고등학교
    if hsname == 제주상업
    if hsname == 제주상업고등학교
    if hsname == 제주서귀포
    if hsname == 제주성산고등학교
    if hsname == 제주신성여자
    if hsname == 제주여상
    if hsname == 제주여자
    if hsname == 제주여자고등학교
    if hsname == 제주여자산업
    if hsname == 제주여자상업
    if hsname == 제주여자상업고등학교
    if hsname == 제주영주고등학교
    if hsname == 제주오현
    if hsname == 제주외국어
    if hsname == 제주외국어고등학교
    if hsname == 제주외국어고등학교고등학교
    if hsname == 제주일
    if hsname == 제주제일
    if hsname == 제주제일고
    if hsname == 제주제일고등학교
    if hsname == 제주제일고등학교 부설 방송통신고등학교
    if hsname == 제주중앙
    if hsname == 제주중앙고
    if hsname == 제주중앙고등학교
    if hsname == 제주중앙여
    if hsname == 제주중앙여고
    if hsname == 제주중앙여자
    if hsname == 제주중앙여자고등학교
    if hsname == 제주한림고등학교
    if hsname == 제척
    if hsname == 제천
    if hsname == 제천 산업
    if hsname == 제천 산업고등학교
    if hsname == 제천 여자
    if hsname == 제천고등학교
    if hsname == 제천공업
    if hsname == 제천공인
    if hsname == 제천농업
    if hsname == 제천디지탈전자공업고등학교
    if hsname == 제천디지털
    if hsname == 제천디지털전자
    if hsname == 제천디지털전자고등학교
    if hsname == 제천디털전자고등학교
    if hsname == 제천산업
    if hsname == 제천산업고등학교
    if hsname == 제천산업고등학교(의림공업고등학교)
    if hsname == 제천상고
    if hsname == 제천상업
    if hsname == 제천상업고등학교
    if hsname == 제천세명
    if hsname == 제천여자
    if hsname == 제천여자고등학교
    if hsname == 제천제일
    if hsname == 제천제일고등학교
    if hsname == 제천제일고등학교(구:제천농업고등학교)
    if hsname == 제천제일여자고등학교
    if hsname == 제철
    if hsname == 제철고
    if hsname == 제포
    if hsname == 제현
    if hsname == 제현고등학교
    if hsname == 조대 부속
    if hsname == 조대부고
    if hsname == 조대부속
    if hsname == 조대여고
    if hsname == 조대여자
    if hsname == 조도고등학교
    if hsname == 조동
    if hsname == 조사
    if hsname == 조선공업
    if hsname == 조선대 교대 부속
    if hsname == 조선대 부속여자
    if hsname == 조선대부속
    if hsname == 조선대부속고등학교
    if hsname == 조선대부속여자
    if hsname == 조선대여자
    if hsname == 조선대여자고등학교
    if hsname == 조선대여자부속
    if hsname == 조선대학 여자
    if hsname == 조선대학교
    if hsname == 조선대학교 부속
    if hsname == 조선대학교 부속고등학교
    if hsname == 조선대학교 여자
    if hsname == 조선대학교부속
    if hsname == 조선대학교부속고등학교
    if hsname == 조선대학교부속여자
    if hsname == 조선대학교여자
    if hsname == 조선대학교여자고등학교
    if hsname == 조선대학교여자부속
    if hsname == 조선대학부고
    if hsname == 조선대학부속
    if hsname == 조선대흑교부속
    if hsname == 조선부속
    if hsname == 조성
    if hsname == 조성고등학교
    if hsname == 조원
    if hsname == 조원고등학교
    if hsname == 조일고등학교
    if hsname == 조일공업
    if hsname == 조일공업고등학교
    if hsname == 조일로봇
    if hsname == 조일로봇고등학교
    if hsname == 조정
    if hsname == 조종
    if hsname == 조종고등학교
    if hsname == 조종종합
    if hsname == 조치원
    if hsname == 조치원 여자
    if hsname == 조치원고등학교
    if hsname == 조치원여자
    if hsname == 조치원여자고등학교
    if hsname == 조호
    if hsname == 종교과학
    if hsname == 종단
    if hsname == 종로
    if hsname == 종산
    if hsname == 종악
    if hsname == 종암
    if hsname == 종원
    if hsname == 종합
    if hsname == 주덕고등학교
    if hsname == 주례
    if hsname == 주례 여자
    if hsname == 주례여고
    if hsname == 주례여자
    if hsname == 주례여자고등학교
    if hsname == 주명
    if hsname == 주몽고등학교
    if hsname == 주문진
    if hsname == 주문진고등학교
    if hsname == 주문진수공고등학교
    if hsname == 주산고등학교
    if hsname == 주산산업
    if hsname == 주산산업고등학교
    if hsname == 주산상업
    if hsname == 주석
    if hsname == 주성
    if hsname == 주성고등학교
    if hsname == 주암고등학교
    if hsname == 주암종합
    if hsname == 주연
    if hsname == 주엽
    if hsname == 주엽고등학교
    if hsname == 주엽공업
    if hsname == 주엽공업고등학교
    if hsname == 주원
    if hsname == 주천
    if hsname == 주천고등학교
    if hsname == 주형
    if hsname == 주혜여자
    if hsname == 죽변
    if hsname == 죽변고등학교
    if hsname == 죽변종합고등학교
    if hsname == 죽산
    if hsname == 죽산고등학교
    if hsname == 죽산종합
    if hsname == 죽원여자
    if hsname == 죽장
    if hsname == 죽장고등학교
    if hsname == 죽전
    if hsname == 죽전고등학교
    if hsname == 죽정고등학교
    if hsname == 줄포자동차공고
    if hsname == 줄포자동차공업
    if hsname == 줄포자동차공업고등학교
    if hsname == 중 앙
    if hsname == 중경
    if hsname == 중경고등학교
    if hsname == 중국
    if hsname == 중남대부속
    if hsname == 중남여자
    if hsname == 중대부
    if hsname == 중대부고
    if hsname == 중대부속
    if hsname == 중덕
    if hsname == 중덕여자
    if hsname == 중동
    if hsname == 중동고
    if hsname == 중동고등학교
    if hsname == 중동상업
    if hsname == 중등
    if hsname == 중랑
    if hsname == 중랑구소재여자
    if hsname == 중마
    if hsname == 중마고등학교
    if hsname == 중모고등학교
    if hsname == 중모종합
    if hsname == 중모중
    if hsname == 중문
    if hsname == 중문고등학교
    if hsname == 중문상업
    if hsname == 중문상업고등학교
    if hsname == 중병
    if hsname == 중산
    if hsname == 중산고
    if hsname == 중산고등학교
    if hsname == 중산외고
    if hsname == 중산외국어
    if hsname == 중산외국어고등학교
    if hsname == 중상
    if hsname == 중앙
    if hsname == 중앙 여자
    if hsname == 중앙(분당)
    if hsname == 중앙(전북군산소재)
    if hsname == 중앙경영정보
    if hsname == 중앙경영정보고등학교
    if hsname == 중앙고
    if hsname == 중앙고등
    if hsname == 중앙고등학교
    if hsname == 중앙대부속
    if hsname == 중앙대사대부속고등학교
    if hsname == 중앙대사범대학부속
    if hsname == 중앙대삼범대학부속
    if hsname == 중앙대학교부속
    if hsname == 중앙대학교사범대학부설
    if hsname == 중앙대학교사범대학부속
    if hsname == 중앙대학교사범대학부속고등학교
    if hsname == 중앙대학교사범부속
    if hsname == 중앙대학사범부속
    if hsname == 중앙사범대부속
    if hsname == 중앙상업
    if hsname == 중앙상업고등학교
    if hsname == 중앙여고
    if hsname == 중앙여상
    if hsname == 중앙여자
    if hsname == 중앙여자고등학교
    if hsname == 중앙여자상업
    if hsname == 중앙외국어
    if hsname == 중앙정보
    if hsname == 중운상업
    if hsname == 중원
    if hsname == 중원고등학교
    if hsname == 중일
    if hsname == 중일고등학교
    if hsname == 중항
    if hsname == 중화
    if hsname == 중화고등학교
    if hsname == 중훈고등학교
    if hsname == 중흥
    if hsname == 중흥고등학교
    if hsname == 증산
    if hsname == 증산고등학교
    if hsname == 증산외
    if hsname == 증산외국어
    if hsname == 증평
    if hsname == 증평 공업
    if hsname == 증평고등학교
    if hsname == 증평공업
    if hsname == 증평공업고등학교
    if hsname == 증평정보
    if hsname == 증평정보고등학교
    if hsname == 증평정보고등학교(구/증평상고/증평여고)
    if hsname == 지구촌
    if hsname == 지구촌고등학교
    if hsname == 지동
    if hsname == 지리산고등학교
    if hsname == 지명
    if hsname == 지명고등학교
    if hsname == 지보
    if hsname == 지보고등학교
    if hsname == 지산
    if hsname == 지산고등학교
    if hsname == 지성고등학교
    if hsname == 지족
    if hsname == 지족고등학교
    if hsname == 지평
    if hsname == 지평고등학교
    if hsname == 지흥
    if hsname == 직산
    if hsname == 진
    if hsname == 진강
    if hsname == 진건
    if hsname == 진건고등학교
    if hsname == 진경
    if hsname == 진경여자
    if hsname == 진경여자고등학교
    if hsname == 진경여자상업
    if hsname == 진경여자상업고등학교
    if hsname == 진관
    if hsname == 진관고등학교
    if hsname == 진광
    if hsname == 진광고등학교
    if hsname == 진교
    if hsname == 진교고등학교
    if hsname == 진국공업
    if hsname == 진권
    if hsname == 진도
    if hsname == 진도 국악
    if hsname == 진도 실업
    if hsname == 진도고등학교
    if hsname == 진도실업
    if hsname == 진도실업고등학교
    if hsname == 진도여자
    if hsname == 진량
    if hsname == 진량고등
    if hsname == 진량고등학교
    if hsname == 진명
    if hsname == 진명여
    if hsname == 진명여고
    if hsname == 진명여상고등학교
    if hsname == 진명여자
    if hsname == 진명여자고등학교
    if hsname == 진미
    if hsname == 진보
    if hsname == 진보고등학교
    if hsname == 진보전산정보
    if hsname == 진복
    if hsname == 진부
    if hsname == 진부고등학교
    if hsname == 진북
    if hsname == 진북고등학교
    if hsname == 진산
    if hsname == 진산고등학교
    if hsname == 진산과학고등학교
    if hsname == 진산영광여자
    if hsname == 진상
    if hsname == 진상고등학교
    if hsname == 진상공업
    if hsname == 진상종합
    if hsname == 진상종합여자고등학교
    if hsname == 진서
    if hsname == 진서고등학교
    if hsname == 진선
    if hsname == 진선여자
    if hsname == 진선여자고등학교
    if hsname == 진성
    if hsname == 진성고등학교
    if hsname == 진성여자
    if hsname == 진성여자고등학교
    if hsname == 진성여자상업
    if hsname == 진성정보
    if hsname == 진안
    if hsname == 진안공업
    if hsname == 진안공업고등학교
    if hsname == 진안제일
    if hsname == 진안제일고등학교
    if hsname == 진양
    if hsname == 진양고등학교
    if hsname == 진여자
    if hsname == 진여자상업
    if hsname == 진여자상업고등학교
    if hsname == 진영
    if hsname == 진영고등학교
    if hsname == 진영고등학교(구/진영여상) 수정
    if hsname == 진영실업
    if hsname == 진영정보
    if hsname == 진영정보고등학교
    if hsname == 진영정보공업고등학교
    if hsname == 진영제일
    if hsname == 진영제일고등학교
    if hsname == 진월
    if hsname == 진위
    if hsname == 진위고등학교
    if hsname == 진유
    if hsname == 진이상업고등학교
    if hsname == 진접고등학교
    if hsname == 진주
    if hsname == 진주 기계 공업
    if hsname == 진주 대화
    if hsname == 진주 명신
    if hsname == 진주 삼현여자
    if hsname == 진주 여자
    if hsname == 진주 외국어
    if hsname == 진주경상대학사범대부속
    if hsname == 진주경상대학사범대학부설
    if hsname == 진주경혜여자
    if hsname == 진주고등학교
    if hsname == 진주고등학교부설방송통신
    if hsname == 진주고등학교부설방송통신고등학교
    if hsname == 진주공업
    if hsname == 진주교육대사범고등학교
    if hsname == 진주기계
    if hsname == 진주기계공업
    if hsname == 진주기계공업고등학교
    if hsname == 진주농고등학교
    if hsname == 진주농업고등학교
    if hsname == 진주대곡
    if hsname == 진주대곡고등학교
    if hsname == 진주대동고등학교
    if hsname == 진주대아
    if hsname == 진주동명
    if hsname == 진주동명고등학교
    if hsname == 진주명신
    if hsname == 진주명신고등학교
    if hsname == 진주사대부속
    if hsname == 진주사대부속고등학교
    if hsname == 진주사범대부설고등학교
    if hsname == 진주삼현여고
    if hsname == 진주삼현여자
    if hsname == 진주삼현여자고등학교
    if hsname == 진주상고
    if hsname == 진주상업
    if hsname == 진주선명여자
    if hsname == 진주선명여자고등학교
    if hsname == 진주여고
    if hsname == 진주여자
    if hsname == 진주여자고등학교
    if hsname == 진주영생
    if hsname == 진주외국어
    if hsname == 진주외국어고등학교
    if hsname == 진주제일
    if hsname == 진주제일여자
    if hsname == 진주제일여자고등학교
    if hsname == 진주중앙
    if hsname == 진주중앙고등학교
    if hsname == 진주항공과학
    if hsname == 진천
    if hsname == 진천고등학교
    if hsname == 진천농공
    if hsname == 진천농업고등학교
    if hsname == 진천상업
    if hsname == 진천상업고등학교
    if hsname == 진천생명과학
    if hsname == 진천생명과학고등학교
    if hsname == 진천여자
    if hsname == 진평여자고등학교(검색에 안나옴)
    if hsname == 진해
    if hsname == 진해고등학교
    if hsname == 진해세화여자
    if hsname == 진해세화여자고등학교
    if hsname == 진해여자
    if hsname == 진해여자고등학교
    if hsname == 진해여자상업고등학교
    if hsname == 진해용원
    if hsname == 진해용원고등학교
    if hsname == 진해제일고등학교
    if hsname == 진해중앙
    if hsname == 진해중앙고등학교
    if hsname == 진형
    if hsname == 진형고등학교
    if hsname == 진형중
    if hsname == 진형중고등학교
    if hsname == 진흥
    if hsname == 진흥고등학교
    if hsname == 짐실
    if hsname == 찰리 보이스 하이스쿨
    if hsname == 창녕
    if hsname == 창녕 공업
    if hsname == 창녕 대성
    if hsname == 창녕 여자
    if hsname == 창녕 옥야
    if hsname == 창녕 옥야고등학교
    if hsname == 창녕고등학교
    if hsname == 창녕공업
    if hsname == 창녕공업고등학교
    if hsname == 창녕농업
    if hsname == 창녕대성
    if hsname == 창녕대성고등학교
    if hsname == 창녕여자
    if hsname == 창녕여자고등학교
    if hsname == 창녕여자종합
    if hsname == 창녕여자종합고등학교
    if hsname == 창녕옥야
    if hsname == 창녕옥야고등학교
    if hsname == 창녕을야
    if hsname == 창녕제일
    if hsname == 창녕제일고
    if hsname == 창녕제일고등학교
    if hsname == 창덕
    if hsname == 창덕여
    if hsname == 창덕여고
    if hsname == 창덕여자
    if hsname == 창덕여자고등학교
    if hsname == 창동
    if hsname == 창동고
    if hsname == 창동고등학교
    if hsname == 창명
    if hsname == 창명여자
    if hsname == 창명여자종합고등학교
    if hsname == 창문
    if hsname == 창문여자
    if hsname == 창문여자고등학교
    if hsname == 창석
    if hsname == 창선
    if hsname == 창선고등학교
    if hsname == 창신
    if hsname == 창신고등학교
    if hsname == 창신여자
    if hsname == 창암고등학교
    if hsname == 창연
    if hsname == 창원
    if hsname == 창원 경상
    if hsname == 창원 기계 공업
    if hsname == 창원 남
    if hsname == 창원 대성
    if hsname == 창원 대암
    if hsname == 창원 명지
    if hsname == 창원 명지 여자
    if hsname == 창원 신월
    if hsname == 창원 여자
    if hsname == 창원 중앙
    if hsname == 창원 중앙고
    if hsname == 창원경상
    if hsname == 창원경상고등고등학교
    if hsname == 창원경상고등학교
    if hsname == 창원경일
    if hsname == 창원경일고등학교
    if hsname == 창원경일여자
    if hsname == 창원경일여자고등학교
    if hsname == 창원고등학교
    if hsname == 창원공고
    if hsname == 창원공업
    if hsname == 창원공업고등학교
    if hsname == 창원기계
    if hsname == 창원기계고등학교
    if hsname == 창원기계공업
    if hsname == 창원기계공업고등학교
    if hsname == 창원기공
    if hsname == 창원남
    if hsname == 창원남고등학교
    if hsname == 창원남산
    if hsname == 창원남산고등학교
    if hsname == 창원남성
    if hsname == 창원남자
    if hsname == 창원남자고등학교
    if hsname == 창원대산
    if hsname == 창원대산고등학교
    if hsname == 창원대암
    if hsname == 창원대암고등학교
    if hsname == 창원명곡
    if hsname == 창원명곡고등학교
    if hsname == 창원명지
    if hsname == 창원명지여자
    if hsname == 창원명지여자고등학교
    if hsname == 창원문성
    if hsname == 창원문성고등학교
    if hsname == 창원봉림
    if hsname == 창원봉림고등학교
    if hsname == 창원붕민
    if hsname == 창원사파
    if hsname == 창원사파고등학교
    if hsname == 창원신월
    if hsname == 창원신월고등학교
    if hsname == 창원여고
    if hsname == 창원여자
    if hsname == 창원여자고등학교
    if hsname == 창원여자상업
    if hsname == 창원영일고등학교
    if hsname == 창원용조
    if hsname == 창원용호
    if hsname == 창원용호고등학교
    if hsname == 창원정보과학
    if hsname == 창원제일여자고등학교
    if hsname == 창원중앙
    if hsname == 창원중앙고등학교
    if hsname == 창원중앙여고
    if hsname == 창원중앙여자
    if hsname == 창원중앙여자고등학교
    if hsname == 창원토월
    if hsname == 창원토월고등학교
    if hsname == 창원한일여자고등학교
    if hsname == 창조고등학교
    if hsname == 창평
    if hsname == 창평고등학교
    if hsname == 창학여자
    if hsname == 창현
    if hsname == 창현고
    if hsname == 창현고등학교
    if hsname == 창호공업
    if hsname == 처인고등학교
    if hsname == 척성
    if hsname == 천산
    if hsname == 천안
    if hsname == 천안 부길
    if hsname == 천안 북일
    if hsname == 천안 상업
    if hsname == 천안 쌍용
    if hsname == 천안 여자
    if hsname == 천안 월봉
    if hsname == 천안 정보
    if hsname == 천안 제일
    if hsname == 천안 중앙
    if hsname == 천안경영정보
    if hsname == 천안고등학교
    if hsname == 천안공 업
    if hsname == 천안공고
    if hsname == 천안공업
    if hsname == 천안공업고등학교
    if hsname == 천안농업
    if hsname == 천안두정
    if hsname == 천안두정고등학교
    if hsname == 천안목자여자
    if hsname == 천안복자여자
    if hsname == 천안부길
    if hsname == 천안북일
    if hsname == 천안북일고등학교
    if hsname == 천안북일여자
    if hsname == 천안북일여자고등학교
    if hsname == 천안상업
    if hsname == 천안상업고등학교
    if hsname == 천안신당
    if hsname == 천안신당고등학교
    if hsname == 천안쌍용
    if hsname == 천안쌍용고등학교
    if hsname == 천안여상
    if hsname == 천안여자
    if hsname == 천안여자고등학교
    if hsname == 천안여자상업
    if hsname == 천안여자상업고등학교
    if hsname == 천안오성고등학교
    if hsname == 천안오송고등학교
    if hsname == 천안우길
    if hsname == 천안원봉
    if hsname == 천안원봉고등학교
    if hsname == 천안월봉
    if hsname == 천안월봉고등학교
    if hsname == 천안정보
    if hsname == 천안정보고등학교
    if hsname == 천안제일
    if hsname == 천안제일고등학교
    if hsname == 천안중앙
    if hsname == 천안중앙고등학교
    if hsname == 천안천일
    if hsname == (구/천안정보고등학교 ..
    if hsname == 천일
    if hsname == 천일고등학교
    if hsname == 천정
    if hsname == 천주여자
    if hsname == 천천
    if hsname == 천천고등학교
    if hsname == 철성
    if hsname == 철성고등학교
    if hsname == 철암
    if hsname == 철암고등학교
    if hsname == 철원
    if hsname == 철원고등학교
    if hsname == 철원여자
    if hsname == 철원여자고등학교
    if hsname == 첨단
    if hsname == 첨단고등학교
    if hsname == 첨단전자공업
    if hsname == 첨담
    if hsname == 청광
    if hsname == 청구
    if hsname == 청구고등
    if hsname == 청구고등학교
    if hsname == 청구상업
    if hsname == 청남해양과학
    if hsname == 청담
    if hsname == 청담고등학교
    if hsname == 청담정보통신
    if hsname == 청담정보통신고등학교
    if hsname == 청당
    if hsname == 청당정보통신고등학교
    if hsname == 청덕고등학교
    if hsname == 청도
    if hsname == 청도 이서
    if hsname == 청도고등학교
    if hsname == 청도모계
    if hsname == 청도여자
    if hsname == 청도이서
    if hsname == 청도전자
    if hsname == 청도전자고등학교
    if hsname == 청락공업
    if hsname == 청란
    if hsname == 청란여자
    if hsname == 청란여자고등학교
    if hsname == 청량
    if hsname == 청량고등학교
    if hsname == 청량리
    if hsname == 청량여자
    if hsname == 청량정보
    if hsname == 청량정보고등학교
    if hsname == 청명
    if hsname == 청명(영통)
    if hsname == 청명고등학교
    if hsname == 청명여자
    if hsname == 청보
    if hsname == 청북고등학교
    if hsname == 청산
    if hsname == 청산고등학교
    if hsname == 청산여자상업
    if hsname == 청석
    if hsname == 청석고등학교
    if hsname == 청소진보
    if hsname == 청송
    if hsname == 청송고등학교
    if hsname == 청송여자
    if hsname == 청송여자고등학교
    if hsname == 청송여자종합
    if hsname == 청송자동차정보고등학교
    if hsname == 청수
    if hsname == 청수고등학교
    if hsname == 청수여고
    if hsname == 청식
    if hsname == 청심국제고등학교
    if hsname == 청안
    if hsname == 청암
    if hsname == 청암고등학교
    if hsname == 청암여자
    if hsname == 청양
    if hsname == 청양 농업
    if hsname == 청양고등학교
    if hsname == (구/청양농공업고등학교 구..
    if hsname == 청양고등학교고등학교
    if hsname == 청양공업
    if hsname == 청양농업
    if hsname == 청양상업
    if hsname == 청양여자상업
    if hsname == 청양여자정보
    if hsname == 청양정사
    if hsname == 청양정산
    if hsname == 청양정산고등학교
    if hsname == 청영
    if hsname == 청운
    if hsname == 청운고등학교
    if hsname == 청운농림중
    if hsname == 청운여자
    if hsname == 청운여자고등학교
    if hsname == 청원
    if hsname == 청원고등학교
    if hsname == 청원사파
    if hsname == 청원여자
    if hsname == 청원여자고등학교
    if hsname == 청원정보산업
    if hsname == 청원정보산업고등학교
    if hsname == 청원중앙
    if hsname == 청의여자
    if hsname == 청주
    if hsname == 청주 공업
    if hsname == 청주 금천
    if hsname == 청주 농업
    if hsname == 청주 대성
    if hsname == 청주 세광
    if hsname == 청주 신흥
    if hsname == 청주 여상
    if hsname == 청주 여자
    if hsname == 청주 주성
    if hsname == 청주 중앙여자
    if hsname == 청주고등학교
    if hsname == 청주공업
    if hsname == 청주공업고등학교
    if hsname == 청주금천
    if hsname == 청주금천고등학교
    if hsname == 청주기계
    if hsname == 청주기계공
    if hsname == 청주기계공고
    if hsname == 청주기계공업
    if hsname == 청주기계공업고등학교
    if hsname == 청주농업
    if hsname == 청주농업고등학교
    if hsname == 청주대성
    if hsname == 청주대성고등학교
    if hsname == 청주대성여자상업
    if hsname == 청주맹아
    if hsname == 청주맹아고등학교
    if hsname == 청주사범대학부속
    if hsname == 청주상당
    if hsname == 청주상업
    if hsname == 청주상업고등학교
    if hsname == 청주서원
    if hsname == 청주서원고등학교
    if hsname == 청주성원
    if hsname == 청주세광
    if hsname == 청주신흥
    if hsname == 청주신흥고등학교
    if hsname == 청주여
    if hsname == 청주여리상업
    if hsname == 청주여상
    if hsname == 청주여자
    if hsname == 청주여자고등학교
    if hsname == 청주여자상업
    if hsname == 청주여자상업고등학교
    if hsname == 청주외
    if hsname == 청주외국어
    if hsname == 청주외국어고등학교
    if hsname == 청주운호
    if hsname == 청주인문
    if hsname == 청주인터넷
    if hsname == 청주인터넷고등학교
    if hsname == 청주일신여자
    if hsname == 청주일신여자고등학교
    if hsname == 청주전산
    if hsname == 청주정보
    if hsname == 청주주성
    if hsname == 청주중앙여자
    if hsname == 청주중앙여자고등학교
    if hsname == 청주청석
    if hsname == 청주체육
    if hsname == 청주혜화
    if hsname == 청주흥덕
    if hsname == 청주흥덕고등학교
    if hsname == 청지고등학교
    if hsname == 청진고등학교
    if hsname == 청평
    if hsname == 청평고등학교
    if hsname == 청평고등학교(구/청평공고)
    if hsname == 청평공업
    if hsname == 청평공업고등학교
    if hsname == 청학
    if hsname == 청학고등학교
    if hsname == 청학공고
    if hsname == 청학공업
    if hsname == 청학공업고등학교
    if hsname == 체육
    if hsname == 체천
    if hsname == 초계
    if hsname == 초계고등학교
    if hsname == 초계고등학교(구/초계종합고등학교)
    if hsname == 초계종합
    if hsname == 초계종합고등학교
    if hsname == 초당고등학교
    if hsname == 초안
    if hsname == 초원
    if hsname == 초은고등학교
    if hsname == 초지
    if hsname == 초지고동
    if hsname == 초지고등학교
    if hsname == 춘양상업고등학교
    if hsname == 춘천
    if hsname == 춘천 실업
    if hsname == 춘천 여자
    if hsname == 춘천고등학교
    if hsname == 춘천기계
    if hsname == 춘천기계공
    if hsname == 춘천기계공업
    if hsname == 춘천기계공업고등학교
    if hsname == 춘천농,공업
    if hsname == 춘천농공고등학교
    if hsname == 춘천농업
    if hsname == 춘천성수
    if hsname == 춘천성수고등학교
    if hsname == 춘천소재여자
    if hsname == 춘천시
    if hsname == 춘천실업
    if hsname == 춘천실업고등학교
    if hsname == 춘천여
    if hsname == 춘천여자
    if hsname == 춘천여자고등학교
    if hsname == 춘천한샘고등학교
    if hsname == 충남
    if hsname == 충남 배흥
    if hsname == 충남 서해
    if hsname == 충남 예술
    if hsname == 충남고등학교
    if hsname == 충남공주
    if hsname == 충남과학
    if hsname == 충남과학고등학교
    if hsname == 충남기계
    if hsname == 충남기계공고
    if hsname == 충남기계공업
    if hsname == 충남기계공업고등학교
    if hsname == 충남당진송학
    if hsname == 충남덕산고등학교
    if hsname == 충남디자인고등학교
    if hsname == 충남디자인예술고등학교
    if hsname == 충남발효식품고등학교
    if hsname == 충남서산
    if hsname == 충남서천
    if hsname == 충남애니메이션
    if hsname == 충남애니메이션고등학교
    if hsname == 충남여고
    if hsname == 충남여자
    if hsname == 충남여자고등학교
    if hsname == 충남예고등학교
    if hsname == 충남예술
    if hsname == 충남예술고등학교
    if hsname == 충남외국어고등학교
    if hsname == 충남인터넷
    if hsname == 충남인터넷고등학교
    if hsname == 충남자고등학교
    if hsname == 충남제일
    if hsname == 충남조선공업
    if hsname == 충남조선공업고등학교
    if hsname == 충남조선공업고등학교(장항공고)
    if hsname == 충남체육
    if hsname == 충남체육고등학교
    if hsname == 충남한일
    if hsname == 충남해양과학
    if hsname == 충남해양과학고등학교
    if hsname == 충납여자고등학교
    if hsname == 충대부설
    if hsname == 충대북고등학교
    if hsname == 충덕공업
    if hsname == 충렬
    if hsname == 충렬고등학교
    if hsname == 충렬여자
    if hsname == 충렬여자고등학교
    if hsname == 충렴
    if hsname == 충무
    if hsname == 충무고등학교
    if hsname == 충북
    if hsname == 충북 공업
    if hsname == 충북 여자
    if hsname == 충북 영동 인터넷고등학교
    if hsname == 충북 예술
    if hsname == 충북 인터넷고등학교
    if hsname == 충북 제천
    if hsname == 충북 청주 청석
    if hsname == 충북고등학교
    if hsname == 충북공업
    if hsname == 충북공업고등학교
    if hsname == 충북과학
    if hsname == 충북과학고
    if hsname == 충북과학고등학교
    if hsname == 충북교원대부설
    if hsname == 충북금왕공업
    if hsname == 충북대부설
    if hsname == 충북대사대부설
    if hsname == 충북대학교 사범대학 부설고등학교
    if hsname == 충북대학교 사범대학 부속
    if hsname == 충북대학교 사범대학부속
    if hsname == 충북대학교사범대학부설
    if hsname == 충북대학교사범대학부설고등학교
    if hsname == 충북대학교사범대학부속
    if hsname == 충북반도체
    if hsname == 충북반도체고등학교
    if hsname == 충북사대부속고등학교
    if hsname == 충북사범대부설
    if hsname == 충북사범대부속
    if hsname == 충북상업
    if hsname == 충북상업고등학교
    if hsname == 충북에너지고등학교
    if hsname == 충북여자
    if hsname == 충북여자고등학교
    if hsname == 충북영동
    if hsname == 충북예술
    if hsname == 충북예술고등학교
    if hsname == 충북옥천공업고등학교
    if hsname == 충북인터넷
    if hsname == 충북인터넷고등학교
    if hsname == 충북전산공업
    if hsname == 충북전산기계
    if hsname == 충북전산기계고등학교
    if hsname == 충북전산기계공고
    if hsname == 충북정보
    if hsname == 충북청주
    if hsname == 충북체육
    if hsname == 충북체육고등학교
    if hsname == 충북충주
    if hsname == 충심
    if hsname == 충암
    if hsname == 충암고
    if hsname == 충암고등학교
    if hsname == 충열
    if hsname == 충열고등학교
    if hsname == 충원
    if hsname == 충원고
    if hsname == 충원고등학교
    if hsname == 충인고
    if hsname == 충일여자고등학교
    if hsname == 충주
    if hsname == 충주 공업
    if hsname == 충주 대원
    if hsname == 충주 상업
    if hsname == 충주 여자
    if hsname == 충주 예성
    if hsname == 충주고등학교
    if hsname == 충주공업
    if hsname == 충주공업고등학교
    if hsname == 충주농
    if hsname == 충주농업
    if hsname == 충주농업고등학교
    if hsname == 충주대원
    if hsname == 충주대원고등학교
    if hsname == 충주둔산외국어
    if hsname == 충주방송통신고등학교
    if hsname == 충주상업
    if hsname == 충주상업고등학교
    if hsname == 충주실업
    if hsname == 충주여자
    if hsname == 충주여자고등학교
    if hsname == 충주여자상업
    if hsname == 충주여자상업고등학교
    if hsname == 충주예성
    if hsname == 충주예성여고
    if hsname == 충주예성여자
    if hsname == 충주예성여자고등학교
    if hsname == 충주중산고등학교
    if hsname == 충주중산외국어고등학교
    if hsname == 충추기계공업
    if hsname == 충현
    if hsname == 충현고등학교
    if hsname == 충훈
    if hsname == 충훈고
    if hsname == 충훈고등학교
    if hsname == 취하공업
    if hsname == 치악
    if hsname == 치악고등학교
    if hsname == 친명
    if hsname == 칠곡
    if hsname == 칠곡고등학교
    if hsname == 칠곡동명고등학교
    if hsname == 칠보고등학교
    if hsname == 칠보종합
    if hsname == 칠성
    if hsname == 칠성고등학교
    if hsname == 칠원
    if hsname == 칠원고등학교
    if hsname == 캐너디안 인터내셔널 스쿨(홍콩)
    if hsname == 컴퓨터
    if hsname == 컴퓨터과학
    if hsname == 컴퓨터과학고등학교
    if hsname == 타파
    if hsname == 탕일
    if hsname == 태강
    if hsname == 태건
    if hsname == 태계원
    if hsname == 태광
    if hsname == 태광고등학교
    if hsname == 태광고등학교(구/태광종합고)
    if hsname == 태광여자상업고등학교
    if hsname == 태광종합
    if hsname == 태능
    if hsname == 태당
    if hsname == 태륜
    if hsname == 태릉
    if hsname == 태릉고등학교
    if hsname == 태백
    if hsname == 태백기계
    if hsname == 태백기계공업
    if hsname == 태백기계공업고등학교
    if hsname == 태백방송통신고등학교
    if hsname == 태성
    if hsname == 태성고등학교
    if hsname == 태안
    if hsname == 태안고등학교
    if hsname == 태안여자
    if hsname == 태안여자고등학교
    if hsname == 태안여자상업
    if hsname == 태원
    if hsname == 태원고등학교
    if hsname == 태인
    if hsname == 태인고등학교
    if hsname == 태인종합
    if hsname == 태장
    if hsname == 태장고등학교
    if hsname == 태창
    if hsname == 태창상업
    if hsname == 태평
    if hsname == 태현
    if hsname == 태화
    if hsname == 태화고등학교
    if hsname == 태화여자상업
    if hsname == 태화여자상업고등학교
    if hsname == 테레사여자
    if hsname == 테크노
    if hsname == 테크노과학고등학교
    if hsname == 토목
    if hsname == 토원고등학교
    if hsname == 토월
    if hsname == 토월고등학교
    if hsname == 토평
    if hsname == 토평고
    if hsname == 토평고등학교
    if hsname == 통성
    if hsname == 통영
    if hsname == 통영 여자
    if hsname == 통영고등학교
    if hsname == 통영동원고등학교
    if hsname == 통영상업
    if hsname == 통영수산고등전문학교
    if hsname == 통영여자
    if hsname == 통영여자고등학교
    if hsname == 통영여자상업
    if hsname == 통영제일
    if hsname == 통영제일고등학교
    if hsname == 통진
    if hsname == 통진고등학교
    if hsname == 통진종합
    if hsname == 퇴계원
    if hsname == 퇴계원고등학교
    if hsname == 특수목적
    if hsname == 파주
    if hsname == 파주 여자고등학교
    if hsname == 파주고
    if hsname == 파주고등학교
    if hsname == 파주공
    if hsname == 파주공고등학교
    if hsname == 파주공업
    if hsname == 파주공업고등학교
    if hsname == 파주광탄
    if hsname == 파주상광
    if hsname == 파주여
    if hsname == 파주여고
    if hsname == 파주여고등학교
    if hsname == 파주여상고등학교
    if hsname == 파주여자
    if hsname == 파주여자고등학교
    if hsname == 파주여자상업
    if hsname == 파주여자종합
    if hsname == 파주제일
    if hsname == 파주종
    if hsname == 파주종합
    if hsname == 판곡고등학교
    if hsname == 팔공
    if hsname == 팔달
    if hsname == 팔달 공고
    if hsname == 팔달 공업
    if hsname == 팔달공업
    if hsname == 팔달공업고등학교
    if hsname == 팔당
    if hsname == 팔레시오
    if hsname == 팔렬고등학교
    if hsname == 팔마고등학교
    if hsname == 편촌경영고등학교
    if hsname == 편풍
    if hsname == 평궐공업
    if hsname == 평내
    if hsname == 평내고
    if hsname == 평내고등학교
    if hsname == 평덕
    if hsname == 평창
    if hsname == 평창고등학교
    if hsname == 평창대화고등학교
    if hsname == 평천
    if hsname == 평촌
    if hsname == 평촌 공업
    if hsname == 평촌경영
    if hsname == 평촌경영고등학교
    if hsname == 평촌고
    if hsname == 평촌고등학교
    if hsname == 평촌공
    if hsname == 평촌공고
    if hsname == 평촌공업
    if hsname == 평촌공업고등학교
    if hsname == 평촌정보
    if hsname == 평촌정보고등학교
    if hsname == 평촌정보산업
    if hsname == 평촌정보산업고등학교
    if hsname == 평촌정보상업고등학교
    if hsname == 평총공업
    if hsname == 평탄여자
    if hsname == 평택
    if hsname == 평택 효명
    if hsname == 평택고등학교
    if hsname == 평택기계
    if hsname == 평택기계공업
    if hsname == 평택기계공업고등학교
    if hsname == 평택동일공업
    if hsname == 평택물류고등학교
    if hsname == 평택신한
    if hsname == 평택안일물류고등학교
    if hsname == 평택안중
    if hsname == 평택안중고등학교
    if hsname == 평택여고
    if hsname == 평택여자
    if hsname == 평택여자고등학교
    if hsname == 평택여자상업고등학교
    if hsname == 평택첨담정보통신
    if hsname == 평택청담
    if hsname == 평택한강고등학교
    if hsname == 평택한광
    if hsname == 평해고등학교
    if hsname == 평해공업
    if hsname == 평해공업고등학교
    if hsname == 평해종합공업
    if hsname == 평화
    if hsname == 포곡고등학교
    if hsname == 포산
    if hsname == 포산고등학교
    if hsname == 포은고등학교
    if hsname == 포천
    if hsname == 포천 종합
    if hsname == 포천고등학교
    if hsname == 포천실업
    if hsname == 포천여자
    if hsname == 포천일
    if hsname == 포천일고등학교
    if hsname == 포천종합
    if hsname == 포항
    if hsname == 포항 대동
    if hsname == 포항 세명
    if hsname == 포항 세명고등학교
    if hsname == 포항 여자
    if hsname == 포항 영일
    if hsname == 포항 중앙 여자
    if hsname == 포항 흥해
    if hsname == 포항간호고등학교
    if hsname == 포항고등학교
    if hsname == 포항고등학교 부설방송통신고등학교
    if hsname == 포항고등학교부설 방송통신고등학교
    if hsname == 포항고부설방송통신
    if hsname == 포항과학기술고등학교
    if hsname == 포항기계고등학교
    if hsname == 포항남
    if hsname == 포항대동
    if hsname == 포항대동고등학교
    if hsname == 포항동성
    if hsname == 포항동성고등학교
    if hsname == 포항동지
    if hsname == 포항동지여자고등학교
    if hsname == 포항방송통신고등학교
    if hsname == 포항세명
    if hsname == 포항세명고등학교
    if hsname == 포항세화
    if hsname == 포항세화고등학교
    if hsname == 포항세화여자
    if hsname == 포항수성고등학교
    if hsname == 포항승해공업
    if hsname == 포항여
    if hsname == 포항여고
    if hsname == 포항여자
    if hsname == 포항여자고등학교
    if hsname == 포항여자전자
    if hsname == 포항여자전자고등학교
    if hsname == 포항연신
    if hsname == 포항영신
    if hsname == 포항영신고등학교
    if hsname == 포항영일
    if hsname == 포항영일고등학교
    if hsname == 포항예술
    if hsname == 포항예술고등학교
    if hsname == 포항유성
    if hsname == 포항유성여자
    if hsname == 포항유성여자고등학교
    if hsname == 포항육성여자
    if hsname == 포항이동고등학교
    if hsname == 포항인천
    if hsname == 포항장성
    if hsname == 포항장성고등학교
    if hsname == 포항재철
    if hsname == 포항전자여자
    if hsname == 포항전자여자고등학교
    if hsname == 포항제일
    if hsname == 포항제철
    if hsname == 포항제철고등학교
    if hsname == 포항제철공업
    if hsname == 포항제철공업고등학교
    if hsname == 포항중앙
    if hsname == 포항중앙 여자
    if hsname == 포항중앙고등학교
    if hsname == 포항중앙여자
    if hsname == 포항중앙여자고등학교
    if hsname == 포항해양
    if hsname == 포항해양과학
    if hsname == 포항해양과학고등학교
    if hsname == 포항해향과학
    if hsname == 포항흥해공업
    if hsname == 포항흥해공업고등학교
    if hsname == 퐁문
    if hsname == 표선
    if hsname == 표선고등학교
    if hsname == 표선상업
    if hsname == 푸른꿈
    if hsname == 푸른꿈고등학교
    if hsname == 풀무
    if hsname == 풀무농업
    if hsname == 풀무농업고등학교
    if hsname == 품생
    if hsname == 풍기고등학교
    if hsname == 풍기공업
    if hsname == 풍기과기고등학교
    if hsname == 풍덕
    if hsname == 풍덕고등학교
    if hsname == 풍동고등학교
    if hsname == 풍례고등학교
    if hsname == 풍무
    if hsname == 풍무고
    if hsname == 풍무고등학교
    if hsname == 풍문
    if hsname == 풍문고등학교
    if hsname == 풍문여
    if hsname == 풍문여고
    if hsname == 풍문여자
    if hsname == 풍문여자고등학교
    if hsname == 풍산
    if hsname == 풍산고등
    if hsname == 풍산고등학교
    if hsname == 풍산종합고등학교
    if hsname == 풍샘
    if hsname == 풍생
    if hsname == 풍생고등학교
    if hsname == 풍성
    if hsname == 풍암
    if hsname == 풍암고등학교
    if hsname == 풍양
    if hsname == 풍양고등학교
    if hsname == 풍진
    if hsname == 풍청고등고등학교
    if hsname == 프레
    if hsname == 하나고등학교
    if hsname == 하남
    if hsname == 하남 정보산업
    if hsname == 하남경영고등학교
    if hsname == 하남고등학교
    if hsname == 하남자고등학교
    if hsname == 하남정보
    if hsname == 하남정보고등학교
    if hsname == 하남정보산업
    if hsname == 하남정보산업고등학교
    if hsname == 하남정보상업고등학교
    if hsname == 하늘고등학교
    if hsname == 하늘여자
    if hsname == 하동
    if hsname == 하동고등학교
    if hsname == 하동여자
    if hsname == 하동여자고등학교
    if hsname == 하동옥종
    if hsname == 하동종합고등학교
    if hsname == 하동진교
    if hsname == 하량
    if hsname == 하명
    if hsname == 하봉공업
    if hsname == 하성
    if hsname == 하성고등학교
    if hsname == 하성종합
    if hsname == 하성종합고등학교
    if hsname == 하양
    if hsname == 하양여자
    if hsname == 하양여자고등학교
    if hsname == 하이택
    if hsname == 하이텍
    if hsname == 하이텍고등학교
    if hsname == 하장고등학교
    if hsname == 학남
    if hsname == 학남고등학교
    if hsname == 학남자고등학교
    if hsname == 학다리
    if hsname == 학다리고등학교
    if hsname == 학산
    if hsname == 학산고등학교
    if hsname == 학산고등학교(구/학산정보산업고)
    if hsname == 학산상업
    if hsname == 학산여고
    if hsname == 학산여자
    if hsname == 학산여자고등학교
    if hsname == 학산여자정보산업
    if hsname == 학산정보산업
    if hsname == 학상상업
    if hsname == 학석여고
    if hsname == 학선
    if hsname == 학성
    if hsname == 학성 여자
    if hsname == 학성고등학교
    if hsname == 학성여자
    if hsname == 학성여자고등학교
    if hsname == 학의여자
    if hsname == 학익
    if hsname == 학익 여자
    if hsname == 학익고등학교
    if hsname == 학익여자
    if hsname == 학익여자고등학교
    if hsname == 학인여자
    if hsname == 학정여자
    if hsname == 학포
    if hsname == 한가람
    if hsname == 한가람고등학교
    if hsname == 한강
    if hsname == 한강 여자
    if hsname == 한강(강서구)
    if hsname == 한강고등학교
    if hsname == 한강미디어
    if hsname == 한강미디어고등학교
    if hsname == 한강미디어고등학교(구/한강전자공예고..
    if hsname == 한강미디어공예
    if hsname == 한강여
    if hsname == 한강여자
    if hsname == 한강전자
    if hsname == 한강전자공예
    if hsname == 한강전자공예고등학교
    if hsname == 한겨레고등학교
    if hsname == 한광
    if hsname == 한광고
    if hsname == 한광고등학교
    if hsname == 한광여자
    if hsname == 한광여자고등학교
    if hsname == 한국 뷰티고등학교
    if hsname == 한국 테크노
    if hsname == 한국YMCA원주고
    if hsname == 한국ymca원주
    if hsname == 한국ymca원주고등학교
    if hsname == 한국게임과학고등학교
    if hsname == 한국경마축산
    if hsname == 한국경마축산고등학교
    if hsname == 한국공업고등학교
    if hsname == 한국과학영재
    if hsname == 한국과학영재고등학교
    if hsname == 한국과학영재학교
    if hsname == 한국과학영재학교고등학교
    if hsname == 한국과학테크노
    if hsname == 한국관광
    if hsname == 한국관광고등학교
    if hsname == 한국광산공업고등학교
    if hsname == 한국교원대 부설
    if hsname == 한국교원대부설
    if hsname == 한국교원대원대부설
    if hsname == 한국교원대학교 부설고등학교
    if hsname == 한국교원대학교부설
    if hsname == 한국교원대학교부설고등학교
    if hsname == 한국교원대학부설
    if hsname == 한국교원부설
    if hsname == 한국기계
    if hsname == 한국도예
    if hsname == 한국도예고등학교
    if hsname == 한국도자기
    if hsname == 한국디지털미디어
    if hsname == 한국디지털미디어고등학교
    if hsname == 한국마사고등학교
    if hsname == 한국말산업고등학교
    if hsname == 한국문화영상고등학교
    if hsname == 한국문화콘텐츠고등학교
    if hsname == 한국바둑고등학교
    if hsname == 한국바이오마스터고등학교
    if hsname == 한국바이오마이스터고등학교
    if hsname == 한국방송고등학교
    if hsname == 한국방송통신
    if hsname == 한국보건
    if hsname == 한국보건고등학교
    if hsname == 한국뷰티고등학교
    if hsname == 한국삼육
    if hsname == 한국삼육고등학교
    if hsname == 한국생명과학
    if hsname == 한국생명과학고등학교
    if hsname == 한국애니메이션
    if hsname == 한국애니메이션고등학교
    if hsname == 한국에니메이션
    if hsname == 한국에니메이션고등학교
    if hsname == 한국예술
    if hsname == 한국예술고등학교
    if hsname == 한국예술종합
    if hsname == 한국외국어대학교 부속 용인외국어
    if hsname == 한국외대용인외국어고등학교
    if hsname == 한국외래부속외국어
    if hsname == 한국외식과학고등학교
    if hsname == 한국원자력마이스터고등학교
    if hsname == 한국전통문화
    if hsname == 한국전통문화고등학교
    if hsname == 한국조리
    if hsname == 한국조리과학
    if hsname == 한국조리과학고등학교
    if hsname == 한국조형예술고등학교
    if hsname == 한국테크노과학
    if hsname == 한국테크노과학고등학교
    if hsname == 한국테트노과학고등학교
    if hsname == 한국항만물류
    if hsname == 한국항만물류고등학교
    if hsname == 한길
    if hsname == 한남
    if hsname == 한남미용
    if hsname == 한남정보
    if hsname == 한남중미용정보고등학교
    if hsname == 한대부속고등학교
    if hsname == 한대부속여자
    if hsname == 한덕
    if hsname == 한덕정보산업
    if hsname == 한도고등학교
    if hsname == 한독
    if hsname == 한독경정여자고등학교
    if hsname == 한독문화
    if hsname == 한독문화고등학교
    if hsname == 한독문화여자
    if hsname == 한독문화여자고등학교
    if hsname == 한독여자실업
    if hsname == 한독여자실업고등학교
    if hsname == 한독정보
    if hsname == 한동국제학교
    if hsname == 한동글로벌학교
    if hsname == 한령
    if hsname == 한림
    if hsname == 한림 공업
    if hsname == 한림고등학교
    if hsname == 한림공업
    if hsname == 한림공업고등학교
    if hsname == 한림디자인고등학교
    if hsname == 한림상업
    if hsname == 한림실업고등학교
    if hsname == 한림여자
    if hsname == 한림여자실업고등학교
    if hsname == 한림연예예술
    if hsname == 한림연예예술고등학교
    if hsname == 한림중실업고등학교
    if hsname == 한마음고등학교
    if hsname == 한미
    if hsname == 한밭
    if hsname == 한밭고
    if hsname == 한밭고등학교
    if hsname == 한밭상업
    if hsname == 한밭여자상업고등학교
    if hsname == 한별
    if hsname == 한별고등학교
    if hsname == 한빛
    if hsname == 한빛고등학교
    if hsname == 한산
    if hsname == 한산여자
    if hsname == 한산종합
    if hsname == 한산종합고등학교
    if hsname == 한샘
    if hsname == 한서
    if hsname == 한서고등학교
    if hsname == 한섬
    if hsname == 한성
    if hsname == 한성 여자
    if hsname == 한성고등학교
    if hsname == 한성과학
    if hsname == 한성과학고등학교
    if hsname == 한성여
    if hsname == 한성여고
    if hsname == 한성여자
    if hsname == 한성여자고등학교
    if hsname == 한성화교
    if hsname == 한세
    if hsname == 한세공업고등학교
    if hsname == 한세사이버보안고등학교
    if hsname == 한세전산
    if hsname == 한세전산공업고등학교
    if hsname == 한세정보
    if hsname == 한세정산
    if hsname == 한솔
    if hsname == 한솔고등학교
    if hsname == 한술
    if hsname == 한신
    if hsname == 한양
    if hsname == 한양 공업
    if hsname == 한양고등학교
    if hsname == 한양공업
    if hsname == 한양공업고등학교
    if hsname == 한양대부속
    if hsname == 한양대부속고등학교
    if hsname == 한양대부속사립
    if hsname == 한양대사범대부속
    if hsname == 한양대사범대부속여자
    if hsname == 한양대학교부속고등학교
    if hsname == 한양대학교사범대학부속
    if hsname == 한양대학교사범대학부속고등학교
    if hsname == 한양대학교사범대학부속여자고등학
    if hsname == 한양부속고등학교
    if hsname == 한양사대부속
    if hsname == 한양사대부속고등학교
    if hsname == 한양사대부속고등학교(구/한양사대부속..
    if hsname == 한양사범대학부속
    if hsname == 한양여자
    if hsname == 한양여자고등학교
    if hsname == 한양외고
    if hsname == 한얼고등학교
    if hsname == 한영
    if hsname == 한영 외국어
    if hsname == 한영고등학교
    if hsname == 한영고등학교고등학교
    if hsname == 한영외
    if hsname == 한영외고
    if hsname == 한영외국어
    if hsname == 한영외국어고등학교
    if hsname == 한올
    if hsname == 한올(온양)
    if hsname == 한울
    if hsname == 한울고등학교
    if hsname == 한인
    if hsname == 한인고등학교
    if hsname == 한일
    if hsname == 한일 여자 상업
    if hsname == 한일고등학교
    if hsname == 한일상업
    if hsname == 한일여자
    if hsname == 한일여자고등학교
    if hsname == 한일여자상업
    if hsname == 한일여자실업고등학교
    if hsname == 한일전산
    if hsname == 한일전산고등학교
    if hsname == 한일전산여고
    if hsname == 한일전산여자
    if hsname == 한일전산여자고등학교
    if hsname == 한일정보고등학교
    if hsname == 한정
    if hsname == 한정과학
    if hsname == 한정여자
    if hsname == 한진
    if hsname == 한진고등학교
    if hsname == 한진공업
    if hsname == 한창고등학교
    if hsname == 한평여자
    if hsname == 한현
    if hsname == 한현고등학교
    if hsname == 한화고등학교
    if hsname == 함덕
    if hsname == 함덕고등학교
    if hsname == 함덕정보산업
    if hsname == 함덕정보산업고등학교
    if hsname == 함백
    if hsname == 함백고등학교
    if hsname == 함백여자고등학교
    if hsname == 함산 여자
    if hsname == 함안
    if hsname == 함안고등학교
    if hsname == 함안대산
    if hsname == 함안대산고등학교
    if hsname == 함안명덕
    if hsname == 함안명덕고등학교
    if hsname == 함안여자상업
    if hsname == 함안인문
    if hsname == 함안종합
    if hsname == 함양
    if hsname == 함양고등학교
    if hsname == 함양여고
    if hsname == 함양여자
    if hsname == 함양여자고등학교
    if hsname == 함양제일
    if hsname == 함양제일고등학교
    if hsname == 함열
    if hsname == 함열고등학교
    if hsname == 함열여고
    if hsname == 함열여자
    if hsname == 함열여자고등학교
    if hsname == 함월
    if hsname == 함월고등학교
    if hsname == 함지
    if hsname == 함지고등학교
    if hsname == 함지여자상업
    if hsname == 함창
    if hsname == 함창고등학교
    if hsname == 함창공업
    if hsname == 함평
    if hsname == 함평고등학교
    if hsname == 함평골프고등학교
    if hsname == 함평나산
    if hsname == 함평농업
    if hsname == 함평농업고등학교
    if hsname == 함평여자
    if hsname == 함평여자고등학교
    if hsname == 함현
    if hsname == 함현고등학교
    if hsname == 합덕
    if hsname == 합덕농업고등학교
    if hsname == 합덕여자
    if hsname == 합덕여자고등학교
    if hsname == 합덕제철고등학교
    if hsname == 합동농업
    if hsname == 합성
    if hsname == 합천
    if hsname == 합천 여자
    if hsname == 합천고등학교
    if hsname == 합천삼가고등학교
    if hsname == 합천여고
    if hsname == 합천여자
    if hsname == 합천여자고등학교
    if hsname == 합천여자종합
    if hsname == 합천여자종합고등학교
    if hsname == 합천원경고등학교
    if hsname == 합천초계
    if hsname == 합포
    if hsname == 합포고등학교
    if hsname == 항공
    if hsname == 항공고등학교
    if hsname == 항공과학고등학교
    if hsname == 항국과학영재고등학교
    if hsname == 항만물류
    if hsname == 항현
    if hsname == 해감
    if hsname == 해강
    if hsname == 해강고등학교
    if hsname == 해광
    if hsname == 해남
    if hsname == 해남고등학교
    if hsname == 해남공업
    if hsname == 해남공업고등학교
    if hsname == 해남여자
    if hsname == 해남자고등학교
    if hsname == 해동
    if hsname == 해동고등학교
    if hsname == 해룡
    if hsname == 해룡고등학교
    if hsname == 해리고등학교
    if hsname == 해명
    if hsname == 해사
    if hsname == 해사고등학교
    if hsname == 해상
    if hsname == 해설
    if hsname == 해성
    if hsname == 해성고등학교
    if hsname == 해성국제컨베션
    if hsname == 해성국제컨벤션
    if hsname == 해성국제컨벤션고등학교
    if hsname == 해성여상
    if hsname == 해성여자
    if hsname == 해성여자고등학교
    if hsname == 해성여자상업고등학교
    if hsname == 해성컨벤션
    if hsname == 해송고등학교
    if hsname == 해양
    if hsname == 해양 과학고
    if hsname == 해양고등학교
    if hsname == 해양과학
    if hsname == 해양과학고등학교
    if hsname == 해운대
    if hsname == 해운대 관광
    if hsname == 해운대 여자
    if hsname == 해운대고등학교
    if hsname == 해운대공고
    if hsname == 해운대공업
    if hsname == 해운대공업고등학교
    if hsname == 해운대관광
    if hsname == 해운대관광고
    if hsname == 해운대관광고등학교
    if hsname == 해운대기계고등학교
    if hsname == 해운대여자
    if hsname == 해운대여자고등학교
    if hsname == 해운대여자상업
    if hsname == 해운대여자상업고등학교
    if hsname == 해원
    if hsname == 해인여자
    if hsname == 해정고등학교
    if hsname == 해제고등학교
    if hsname == 해평
    if hsname == 행선
    if hsname == 행성
    if hsname == 행신
    if hsname == 행신고등학교
    if hsname == 향남고등학교
    if hsname == 헌도정보
    if hsname == 헌일
    if hsname == 헤원여
    if hsname == 헤일
    if hsname == 헤화여자
    if hsname == 혀8ㅂ성
    if hsname == 현강
    if hsname == 현강여자
    if hsname == 현강여자상업
    if hsname == 현강여자정보
    if hsname == 현강정보고등학교
    if hsname == 현경
    if hsname == 현경고등학교
    if hsname == 현대
    if hsname == 현대 과학고등학교
    if hsname == 현대 정보과학고등학교
    if hsname == 현대 청운
    if hsname == 현대고등학교
    if hsname == 현대공
    if hsname == 현대공고
    if hsname == 현대공업
    if hsname == 현대공업고등학교
    if hsname == 현대부설고등학교
    if hsname == 현대부속
    if hsname == 현대여자
    if hsname == 현대정보
    if hsname == 현대정보과학
    if hsname == 현대정보과학고등학교
    if hsname == 현대청운
    if hsname == 현대청운고등학교
    if hsname == 현대청운자립형사립
    if hsname == 현대청원
    if hsname == 현도고등학교
    if hsname == 현도상업
    if hsname == 현도정보
    if hsname == 현도정보고등학교
    if hsname == 현동
    if hsname == 현서
    if hsname == 현서고등학교
    if hsname == 현암
    if hsname == 현암고등학교
    if hsname == 현양고등학교
    if hsname == 현일
    if hsname == 현일고등학교
    if hsname == 현정
    if hsname == 현풍
    if hsname == 현풍고등학교
    if hsname == 현풍여자
    if hsname == 현풍여자고등학교
    if hsname == 현화고등학교
    if hsname == 협성
    if hsname == 협성고등학교
    if hsname == 협성상업
    if hsname == 협성여자상업고등학교
    if hsname == 형곡고등학교
    if hsname == 형석
    if hsname == 형석고등학교
    if hsname == 형진
    if hsname == 형초공업
    if hsname == 혜광
    if hsname == 혜광고등학교
    if hsname == 혜민정보
    if hsname == 혜성
    if hsname == 혜성국제
    if hsname == 혜성여상
    if hsname == 혜성여자
    if hsname == 혜성여자고등학교
    if hsname == 혜성여자상업
    if hsname == 혜원
    if hsname == 혜원고등학교
    if hsname == 혜원여
    if hsname == 혜원여고
    if hsname == 혜원여자
    if hsname == 혜원여자고등학교
    if hsname == 혜인
    if hsname == 혜인여자
    if hsname == 혜인여자고등학교
    if hsname == 혜인정보
    if hsname == 혜화
    if hsname == 혜화고등학교
    if hsname == 혜화여고
    if hsname == 혜화여고등학교
    if hsname == 혜화여자
    if hsname == 혜화여자고등학교
    if hsname == 호계
    if hsname == 호계고등학교
    if hsname == 호남
    if hsname == 호남 제일
    if hsname == 호남고등학교
    if hsname == 호남삼육
    if hsname == 호남삼육고등학교
    if hsname == 호남원예
    if hsname == 호남원예고등학교
    if hsname == 호남자고등학교
    if hsname == 호남재일
    if hsname == 호남제일
    if hsname == 호남제일고등학교
    if hsname == 호남제일여자
    if hsname == 호남제일여자고등학교
    if hsname == 호매실고등학교
    if hsname == 호명
    if hsname == 호산고등학교
    if hsname == 호서
    if hsname == 호서고등학교
    if hsname == 호성여자
    if hsname == 호수돈
    if hsname == 호수돈 여자
    if hsname == 호수돈여고
    if hsname == 호수돈여자
    if hsname == 호수돈여자고등학교
    if hsname == 호수돌여자
    if hsname == 호수돌예진
    if hsname == 호스돈
    if hsname == 호스돈여자
    if hsname == 호원
    if hsname == 호원고등학교
    if hsname == 호원방송통신고등학교
    if hsname == 호평
    if hsname == 호평고등학교
    if hsname == 홍대 부속
    if hsname == 홍대부고
    if hsname == 홍대부설여자
    if hsname == 홍대부속
    if hsname == 홍대부속고등학교
    if hsname == 홍대부속여자
    if hsname == 홍대부여
    if hsname == 홍대부여고
    if hsname == 홍대여자
    if hsname == 홍덕
    if hsname == 홍래부속
    if hsname == 홍명
    if hsname == 홍명고등학교
    if hsname == 홍민여자
    if hsname == 홍산
    if hsname == 홍산농업고등학교
    if hsname == 홍산산업과학
    if hsname == 홍삼
    if hsname == 홍성
    if hsname == 홍성고등학교
    if hsname == 홍성공업
    if hsname == 홍성공업고등학교
    if hsname == 홍성방송통신
    if hsname == 홍성방송통신고등학교
    if hsname == 홍성방통
    if hsname == 홍성여고
    if hsname == 홍성여자
    if hsname == 홍성여자고등학교
    if hsname == 홍원
    if hsname == 홍익
    if hsname == 홍익 여자
    if hsname == 홍익고등학교
    if hsname == 홍익고등학교고등학교
    if hsname == 홍익대 부속 여자
    if hsname == 홍익대 사범부속
    if hsname == 홍익대부속고등학교
    if hsname == 홍익대부속여자고등학교
    if hsname == 홍익대사범대부속여자고등학교
    if hsname == 홍익대사범대학부속고등학교
    if hsname == 홍익대사범대학부속여자고등학교
    if hsname == 홍익대사범부속여자고등학교
    if hsname == 홍익대학교 부속
    if hsname == 홍익대학교부속
    if hsname == 홍익대학교사범대학부속
    if hsname == 홍익대학교사범대학부속고등학교
    if hsname == 홍익대학교사범대학부속여자
    if hsname == 홍익대학교사범대학부속여자고등학
    if hsname == 홍익대학교사범대학부속여자고등학교
    if hsname == 홍익대학부속
    if hsname == 홍익디자인
    if hsname == 홍익디자인고등학교
    if hsname == 홍익부속여자
    if hsname == 홍익사대부
    if hsname == 홍익사대부속고등학교
    if hsname == 홍익사범대학여자고등학교
    if hsname == 홍익여
    if hsname == 홍익여자
    if hsname == 홍익여자고등학교
    if hsname == 홍익여자디자인
    if hsname == 홍익여자디자인고등학교
    if hsname == 홍익여자디자인문화
    if hsname == 홍익여자디자인문화고등학교
    if hsname == 홍익여자디자인문화고등학교(구/경성여..
    if hsname == 홍익여자사대부속
    if hsname == 홍일
    if hsname == 홍일고등학교
    if hsname == 홍주
    if hsname == 홍주고등학교
    if hsname == 홍진
    if hsname == 홍천
    if hsname == 홍천 여자
    if hsname == 홍천고등학교
    if hsname == 홍천농업
    if hsname == 홍천농업고등학교
    if hsname == 홍천여자
    if hsname == 홍천여자고등학교
    if hsname == 홍천정보과학
    if hsname == 홍천정보과학고등학교
    if hsname == 홍천정보생활과학고등학교
    if hsname == 홍현
    if hsname == 홍혜공업
    if hsname == 화경
    if hsname == 화곡
    if hsname == 화곡고등학교
    if hsname == 화곡보건경영고등학교
    if hsname == 화곡여상
    if hsname == 화곡여자
    if hsname == 화곡여자고등학교
    if hsname == 화곡여자정보고등학교
    if hsname == 화곡여자정보산업
    if hsname == 화곡여자정보산업고등학교
    if hsname == 화곡정보산업
    if hsname == 화공
    if hsname == 화광공업
    if hsname == 화교
    if hsname == 화국
    if hsname == 화남
    if hsname == 화랑고등학교
    if hsname == 화령
    if hsname == 화령고등학교
    if hsname == 화명
    if hsname == 화명고등
    if hsname == 화명고등학교
    if hsname == 화문
    if hsname == 화봉공업
    if hsname == 화봉컴퓨터과학
    if hsname == 화서대부속
    if hsname == 화성
    if hsname == 화성고등학교
    if hsname == 화성반월고등학교
    if hsname == 화수
    if hsname == 화수고등학교
    if hsname == 화순
    if hsname == 화순고등학교
    if hsname == 화순과학기술
    if hsname == 화순실업
    if hsname == 화순실업고등학교
    if hsname == 화순여고
    if hsname == 화순여자고등학교
    if hsname == 화순이양고등학교
    if hsname == 화암
    if hsname == 화암고등학교
    if hsname == 화양
    if hsname == 화양고등학교
    if hsname == 화양여자
    if hsname == 화영
    if hsname == 화원
    if hsname == 화원고등학교
    if hsname == 화원여자
    if hsname == 화원여자고등학교
    if hsname == 화원종합고등학교
    if hsname == 화정
    if hsname == 화정고등학교
    if hsname == 화정여자
    if hsname == 화천
    if hsname == 화천고등학교
    if hsname == 화천실업
    if hsname == 화천정보산업
    if hsname == 화천정보산업고등학교
    if hsname == 화홍
    if hsname == 화홍고등학교
    if hsname == 화흥
    if hsname == 환경정보
    if hsname == 환인
    if hsname == 환일
    if hsname == 환일고등학교
    if hsname == 황간
    if hsname == 황간고등학교
    if hsname == 황기 정보 산업
    if hsname == 황문여자
    if hsname == 황산고등학교
    if hsname == 황일
    if hsname == 황지
    if hsname == 황지고등학교
    if hsname == 황지여자상업
    if hsname == 황지정보산업
    if hsname == 황지정보산업고등학교
    if hsname == 회룡
    if hsname == 회수
    if hsname == 회원
    if hsname == 회원고등학교
    if hsname == 회종
    if hsname == 회화여자
    if hsname == 횡성
    if hsname == 횡성고등학교
    if hsname == 횡성여자
    if hsname == 횡성여자고등학교
    if hsname == 횡암
    if hsname == 효경고등학교
    if hsname == 효령
    if hsname == 효령고등학교
    if hsname == 효명
    if hsname == 효명고등학교
    if hsname == 효명종합
    if hsname == 효목고등학교
    if hsname == 효문
    if hsname == 효문고등학교
    if hsname == 효산
    if hsname == 효산고등학교
    if hsname == 효상
    if hsname == 효성
    if hsname == 효성고등학교
    if hsname == 효성여자
    if hsname == 효성여자고등학교
    if hsname == 효성여자상업
    if hsname == 효송
    if hsname == 효암
    if hsname == 효암고등학교
    if hsname == 효암여자상업고등학교
    if hsname == 효앙
    if hsname == 효양
    if hsname == 효양고등학교
    if hsname == 효원
    if hsname == 효원고등학교
    if hsname == 효자
    if hsname == 효자고등학교
    if hsname == 효정
    if hsname == 효정고등학교
    if hsname == 효창
    if hsname == 효천
    if hsname == 효향
    if hsname == 후포
    if hsname == 후포고등학교
    if hsname == 휘경
    if hsname == 휘경 여자
    if hsname == 휘경공업
    if hsname == 휘경공업고등학교
    if hsname == 휘경여
    if hsname == 휘경여고
    if hsname == 휘경여자
    if hsname == 휘경여자고등학교
    if hsname == 휘문
    if hsname == 휘문고등학교
    if hsname == 휘봉고등학교
    if hsname == 휴원
    if hsname == 흥덕
    if hsname == 흥덕고등학교
    if hsname == 흥무고등학교
    if hsname == 흥암
    if hsname == 흥일
    if hsname == 흥진
    if hsname == 흥진고등학교
    if hsname == 흥해
    if hsname == 흥해 공업
    if hsname == 흥해공업
    if hsname == 흥해공업고등학교
    if hsname == 흥혜공업
    if hsname == 희경
    if hsname == 희원여자
  /*}}}*/
  /*대입계열 {{{*/
    recode majcat (1/3=2) (4/6=3) (7=1) , gen(majgrp)
      label define MAJGRP 1 "예체능" 2 "인문계" 3 "자연계" 
      label var majgrp "대학전공"
      label value majgrp MAJGRP
  /*}}}*/
  /*PCA(학력, 소득 ) 집단 {{{*/
    gen temp = p026 + p029
    forvalue i = 2000/2012 {
      pca temp p034 if f001 == `i'
      predict pcascore`i' if e(sample)
      xtile pcagrp`i' = pcascore`i' , nq(3)
    }
    egen pcascore = rowtotal(pcascore????) , missing
      label var pcascore "주성분분석점수(학력, 소득)"
    egen pcagrp = rowtotal(pcagrp????) , missing
      label var pcagrp "주성분분석환경(학력, 소득)"
      label define PCAGRP 1 "저환경" 2 "중환경" 3 "고환경"
      label value pcagrp PCAGRP
    drop pcascore???? pcagrp???? temp
  /*}}}*/
  /*PCA2(학력, 소득, 조정지역) 집단 {{{*/
    gen temp = p026 + p029
    forvalue i = 2000/2012 {
      pca temp p034 rgngrp if f001 == `i'
      predict pcascore2`i' if e(sample)
      xtile pcagrp2`i' = pcascore2`i' , nq(3)
    }
    egen pcascore2 = rowtotal(pcascore2????) , missing
      label var pcascore2 "주성분분석점수(학력, 소득, 지역)"
    egen pcagrp2 = rowtotal(pcagrp2????) , missing
      label var pcagrp2 "주성분분석환경(학력, 소득, 지역)"
      label value pcagrp2 PCAGRP
    drop pcascore2???? pcagrp2???? temp
  /*}}}*/
  /*PCA3(학력, 소득, 성별 ) 집단 {{{*/
    gen temp = p026 + p029
    forvalue i = 2000/2012 {
      pca temp p034 sex if f001 == `i'  
      predict pcascore3`i' if e(sample)
      xtile pcagrp3`i' = pcascore3`i' , nq(3)
    }
    egen pcascore3 = rowtotal(pcascore3????) , missing
      label var pcascore3 "주성분분석점수(학력, 소득, 성별)"
    egen pcagrp3 = rowtotal(pcagrp3????) , missing
      label var pcagrp3 "주성분분석환경(학력, 소득, 성별)"
      label value pcagrp3 PCAGRP
    drop pcascore3???? pcagrp3???? temp
  /*}}}*/
  /*기타정리 {{{*/
    drop f009?? f013?? f014?? f170?? unicode
    order _all , alpha
    order pid year wave *grp* , first
    compress
  /*}}}*/
save ~/dropbox/goms/goms.dta , replace
