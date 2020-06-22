gen smoo = runiform()
egen p032 = rowfirst(*p032)
gen p032smoo = p032 + smoo
label var p032smoo "입학당시 아버지 직업; 연속화"
egen p035 = rowfirst(*p035)
label var p035 "입학당시 부모님 소득"
gen p035smoo = p035 + smoo
label var p035smoo "입학당시 부모님 소득; 연속화"
egen p026 = rowfirst(*p026)
gen p026smoo = p026 + smoo
label var p026smoo "입학당시 아버지 학력; 연속화"
egen f009 = rowfirst(*f009)
gen f009smoo = f009 + smoo
label var f009smoo "고등학교 계열"

forvalue x = 7/17 {
	local yr : disp %02.0f  = `x'
	kdensity p032smoo if wave == 2000 + `x',  nograph gen(x`yr'32 p32kden`yr')
	label var p32kden`yr' "입학당시 아버지 직업"
	kdensity p035smoo if wave == 2000 + `x', nograph gen(x`yr'35 p35kden`yr')
	label var p35kden`yr' "입학당시 부모님 소득"
	kdensity p026smoo if wave == 2000 + `x', nograph gen(x`yr'26 p26kden`yr')
	label var p26kden`yr' "입학당시 아버지 학력"
	kdensity f009smoo if wave == 2000 + `x',  nograph gen(x`yr'09 f09kden`yr')
	label var f09kden`yr' "고등학교 계열"
	label var x`yr'32 "`yr'년 코호트"
	label var x`yr'35 "`yr'년 코호트"
	label var x`yr'26 "`yr'년 코호트"
	label var x`yr'09 "`yr'년 코호트"
}
forvalue x = 7/17 {
	local yr : disp %02.0f  = `x'
	graph twoway (line p32kden`yr' x`yr'32) , name(p032`yr')
	graph twoway (line p35kden`yr' x`yr'35) , name(p035`yr')
	graph twoway (line p26kden`yr' x`yr'26) , name(p026`yr')
	graph twoway (line f09kden`yr' x`yr'09) , name(f009`yr')
}

gr combine p03207 p03208 p03209 p03210 p03211 p03212 p03213 p03214 p03215 p03216 p03217 , title("입학당시 아버지 직업") 
gr save p32

gr combine p03507 p03508 p03509 p03510 p03511 p03512 p03513 p03514 p03515 p03516 p03517 , title("입학당시 부모님 소득") 
gr save p35

gr combine p02607 p02608 p02609 p02610 p02611 p02612 p02613 p02614 p02615 p02616 p02617 , title("입학당시 아버지 학력") 
gr save p26

gr combine f00907 f00908 f00909 f00910 f00911 f00912 f00913 f00914 f00915 f00916 f00917 , title("고등학교 계열") 
gr save f09
