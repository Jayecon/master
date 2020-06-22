set more off

clear

/*개인변수 선정{{{*/
	/*local demolablelist PID 본분교 국공사립 학위과정유형 주야간 전공계열 전공소분류CODE 전공세분류CODE/전공명 학교유형 학교소재권역 학교소재지역 성별 출생년 출생월 연령(조사기준일_당시) 졸업년 졸업월*/
	local demovarlist pid branch found course daynight majorcat dpmt major school province area sex birthy birthm age graduy gradum/*}}}*/
/*고교 및 대입 변수 선정 {{{*/
	/*local edulabellist 출신고교_졸업년 출신고교_졸업월 출신고교(국내외) 출신고교(국가명) 출신고교시도(특별시/광역시/도)CODE 출신고교시군구(구/시/군)CODE 고교/검정고시 고교계열 졸업대학(입학/편입) 졸업대학_입학/편입년 졸업대학_입학/편입월 대입모집(정시/수시) 입학 전형(일반/특별) 입학전형세부유형 */
	local eduvarlist f001 f002 f004 f005 f006 f007 f008 f009 f010 f011 f012 f013 f014 f170 /*}}}*/
/*환경변수 선정{{{*/
	/*local envlabellist 출생지역(국내외) 출생지역(국외국가명) 출생지역(특별시/광역시/도)CODE 출생지역(구/시/군)CODE 아버님_최종학력 아버님_최종학력이수여부 아버님_최종학력_생성변수 어머님_최종학력 어머님_최종학력이수여부 어머님_최종학력_생성변수 아버님직업_대학입학(편입)당시 어머님직업_대학입학(편입)당시 부모님_월평균소득_대학입학(편입)당시 부모님_월평균소득_조사시점현재 부모님_자산규모_조사시점현재 가중치*/
	local envvarlist p018 p019 p020 p021 p026 p027 p028z p029 p030 p031z p032 p033 p034 p035 p036 wt /*}}}*/
/*조사변수 변화를 해결하기 위한 결측변수 생성{{{*/
	local misvarlist07 branch daynight f007 f008 f013 f014 f170 p021 p036
	local misvarlist08 daynight f013 f014 f170 p021 p036
	local misvarlist09 f013 f170 p036
	local misvarlist10 f013 f170 p036
	local misvarlist11 f013 f170 p036
	local misvarlist12 f013 f170 p021 p036
	local misvarlist13 f013 f170 p019 p036
	local misvarlist14 f005 f013 f170 p019 p036
	local misvarlist15 f170
	local misvarlist16 f014 
	local misvarlist17 f014 /*}}}*/
/*년도별 파일을 mygoms??.dta 로 각각 저장하기{{{*/
forvalue x = 7/17 {
	local yr : disp %02.0f  = `x'
	use ~/dropbox/GOMS/GP`yr'.dta
	rename g`yr'1* *
	foreach y of local misvarlist`yr' {
		gen `y' = .
	}
	keep `demovarlist' `eduvarlist' `envvarlist'
	drop `misvarlist`yr''
	save ~/dropbox/goms/mygoms`yr'.dta , replace
}/*}}}*/
/*년도별 파일을 goms.dta 로 합치기{{{*/
	/*년도별 라벨불일치 해소용 라벨목록{{{*/
	local labelist07 V6_A LABO 
	local labelist08 V13_A LABB LABBD LABCG LABCH LABCI LABCJ LABCK
	local labelist09 LABCD LABCE LABN LABO LABBT LABEP LABEN LABEO LABEQ LABER LABES
	local labelist10 LABA V14_A LABJ LABF LABG
	local labelist11 LABE LABF LABN LABAC
	local labelist12 LABF LABR LABE LABAW
	local labelist13 LABE LABF LABJ
	local labelist14 LABE 
	local labelist15 LABE LABF
	local labelist16 LABAS LABK LABBR LABBS LABDM LABDN LABDO
	local labelist17 LABCC LABEI LABEJ LABEL LABEM LABEK LABEN LABEO/*}}}*/
forvalue x = 7/17 {
	local yr : disp %02.0f  = `x'
	di "year = " 2000+`x'
	use ~/dropbox/GOMS/GP`yr'.dta , clear
	rename g`yr'1* *
	foreach y of local misvarlist`yr' {
		gen `y' = .
	}
	keep `demovarlist' `eduvarlist' `envvarlist'
	drop `misvarlist`yr''
	foreach j of local labelist`yr'{
		label copy `j' G`yr'1`j'
	}
	if "`x'" == "7" {/*{{{*/
		label value major G071V6_A
		label value p032 G071LABO
		label value p033 G071LABO
	}
	else if "`x'" == "8" {
		label value birthm G081V13_A
		label value f001 G081LABB
		label value f002 G081LABB
		label value f011 G081LABBD
		label value f012 G081LABBD
		label value p026 G081LABCG
		label value p027 G081LABCH
		label value p028 zG081LABCI
		label value p029 G081LABCG
		label value p030 G081LABCH
		label value p031 zG081LABCI
		label value p032 G081LABCJ
		label value p033 G081LABCJ
		label value p034 G081LABCK
		label value p035 G081LABCK
	}
	else if "`x'" == "9" {
		label value f001 G091LABCD
		label value f002 G091LABCE
		label value f006 G091LABN
		label value f007 G091LABO
		label value f011 G091LABCD
		label value f012 G091LABCE
		label value p018 G091LABBT
		label value p019 G091LABEP
		label value p020 G091LABN 
		label value p021 G091LABO 
		label value p026 G091LABEN
		label value p027 G091LABEO
		label value p028 zG091LABEQ
		label value p029 G091LABEN
		label value p030 G091LABEO
		label value p031 zG091LABEQ
		label value p032 G091LABER
		label value p033 G091LABER
		label value p034 G091LABES
		label value p035 G091LABES
	}
	else if "`x'" == "10" {
		label value area G101LABA 
		label value birthm G101V14_A
		label value f002 G101LABJ 
		label value f004 G101LABF 
		label value f006 G101LABA 
		label value f007 G101LABG 
		label value p020 G101LABA 
		label value p021 G101LABG 
	}
	else if "`x'" == "11" {
		label value f006 G111LABE 
		label value f007 G111LABF 
		label value f011 G111LABN 
		label value f012 G111LABN 
		label value p020 G111LABE 
		label value p021 G111LABF 
		label value p028z G111LABAC
		label value p031z G111LABAC
	}
	else if "`x'" == "12" {
		label value f002 G121LABF 
		label value f006 G121LABR 
		label value f007 G121LABE 
		label value p020 G121LABAW
	}
	else if "`x'" == "13" {
		label value f007 G131LABE 
		label value f011 G131LABF 
		label value f012 G131LABF 
		label value p021 G131LABE 
		label value p028 zG131LABJ 
		label value p031 zG131LABJ 
	}
	else if "`x'" == "14" {
		label value f007 G141LABE 
		label value p021 G141LABE 
	}
	else if "`x'" == "15" {
		label value f006 G151LABE 
		label value f007 G151LABF 
		label value p021 G151LABF 
	}
	else if "`x'" == "16" {
		label value f001 G161LABAS
		label value f002 G161LABAS
		label value f004 G161LABK 
		label value f006 G161LABBR
		label value f007 G161LABBS
		label value p018 G161LABK 
		label value p021 G161LABDM
		label value p027 G161LABDN
		label value p028 zG161LABDO
		label value p030 G161LABDN
		label value p031 zG161LABDO
	}
	else if "`x'" == "17" {
	label value f001 G171LABCC
	label value p020 G171LABEI
	label value p021 G171LABEJ
	label value p026 G171LABEK
	label value p027 G171LABEL
	label value p028 zG171LABEM
	label value p029 G171LABEK
	label value p030 G171LABEL
	label value p031 zG171LABEM
	label value p032 G171LABEN
	label value p033 G171LABEN
	label value p034 G171LABEO
	label value p035 G171LABEO
}/*}}}*/
	rename * g`yr'1* 
	gen wave = `x' +2000
	label var wave "조사년도"
	if "`x'" == "7" {
		save ~/dropbox/goms/mygoms.dta , replace
	}
	else {
		append using ~/dropbox/goms/mygoms.dta
		save ~/dropbox/goms/mygoms.dta , replace
	}
}/*}}}*/


