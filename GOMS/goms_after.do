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
