cd ~/dropbox/goms
use results/goms_goi.dta , clear

keep if wavetype == 3
keep if inrange(wave , 2000 , 2011)
keep if inlist(envtype ,  1,2,3,5)

/*GOI over envtyp*/
twoway line index wave if scoretyp == 5 & envtyp == 1 & enttyp == -1 & sex == -1  & hstype == -1 & majtype == -1 || ///
	line index wave if scoretyp == 5 & envtyp == 2 & enttyp == -1 & sex == -1  & hstype == -1 & majtype == -1 || ///
	line index wave if scoretyp == 5 & envtyp == 3 & enttyp == -1 & sex == -1  & hstype == -1 & majtype == -1 || ///
	line index wave if scoretyp == 5 & envtyp == 5 & enttyp == -1 & sex == -1  & hstype == -1 & majtype == -1 ///
	, legend( lab(1 "부모학력환경") lab( 2 "부모소득환경") lab( 3 "고교지역환경") lab( 4 "주성분분석환경" )) saving(figure/goi_env , replace)

/*GOI over sex by envtyp*/
twoway line index wave if scoretyp == 5 & enttyp == -1 & sex == -1  & hstype == -1 & majtype == -1 || ///
	line index wave if scoretyp == 5 & enttyp == -1 & sex == 1  & hstype == -1 & majtype == -1 || ///
	line index wave if scoretyp == 5 & enttyp == -1 & sex == 2  & hstype == -1 & majtype == -1 ///
	, by(envtyp) legend( lab(1 "전체") lab( 2 "남성") lab( 3 "여성")  row(1) ) saving(figure/goi_sex_env , replace)

/*GOI over enttyp by envtyp*/
twoway line index wave if scoretyp == 5 & enttyp == -1 & sex == -1  & hstype == -1 & majtype == -1 || ///
	line index wave if scoretyp == 5 & enttyp == 1 & sex == -1  & hstype == -1 & majtype == -1 || ///
	line index wave if scoretyp == 5 & enttyp == 2 & sex == -1  & hstype == -1 & majtype == -1 ///
	, by(envtyp) legend( lab(1 "전체") lab( 2 "일반정시") lab( 3 "일반수시")  row(1) ) saving(figure/goi_ent_env , replace)

/*GOI over enttyp by envtyp*/
twoway line index wave if scoretyp == 5 & enttyp == -1 & sex == -1  & hstype == -1 & majtype == -1 || ///
	line index wave if scoretyp == 5 & enttyp == -1 & sex == -1  & hstype == 1 & majtype == -1 || ///
	line index wave if scoretyp == 5 & enttyp == -1 & sex == -1  & hstype == 2 & majtype == -1 || ///
	line index wave if scoretyp == 5 & enttyp == -1 & sex == -1  & hstype == 3 & majtype == -1 ///
	, by(envtyp) legend( lab(1 "전체") lab( 2 "특성화고") lab( 3 "일반계") lab(4 "특목/자립/강남") row(1) ) saving(figure/goi_sch_env , replace)

cd ~/dropbox/goms
use results/goms_rri.dta , clear

keep if wavetyp == 3
keep if inrange(wave , 2000 , 2011)
keep if inlist(envtype ,  1,2,3,5)

/*RRI over scoretyp by envtyp*/
twoway line index wave if scoretyp == 3 & enttyp == -1 & sex == -1  & hstype == -1 & majtype == -1 || ///
	line index wave if scoretyp == 4 & enttyp == -1 & sex == -1  & hstype == -1 & majtype == -1 || ///
	line index wave if scoretyp == 5 & enttyp == -1 & sex == -1  & hstype == -1 & majtype == -1 ///
	, by(envtyp) legend( lab(1 "대학3등급") lab( 2 "대학4등급") lab( 3 "대학5등급") ) saving(figure/rri_score_env , replace)

/*RRI over envtyp*/
twoway line index wave if scoretyp == 5 & envtyp == 1 & enttyp == -1 & sex == -1  & hstype == -1 & majtype == -1 || ///
	line index wave if scoretyp == 5 & envtyp == 2 & enttyp == -1 & sex == -1  & hstype == -1 & majtype == -1 || ///
	line index wave if scoretyp == 5 & envtyp == 3 & enttyp == -1 & sex == -1  & hstype == -1 & majtype == -1 || ///
	line index wave if scoretyp == 5 & envtyp == 5 & enttyp == -1 & sex == -1  & hstype == -1 & majtype == -1 ///
	, legend( lab(1 "부모학력환경") lab( 2 "부모소득환경") lab( 3 "고교지역환경") lab( 4 "주성분분석환경" )) saving(figure/rri_env , replace)

/*RRI over sex by envtyp*/
twoway line index wave if scoretyp == 5 & enttyp == -1 & sex == -1  & hstype == -1 & majtype == -1 || ///
	line index wave if scoretyp == 5 & enttyp == -1 & sex == 1  & hstype == -1 & majtype == -1 || ///
	line index wave if scoretyp == 5 & enttyp == -1 & sex == 2  & hstype == -1 & majtype == -1 ///
	, by(envtyp) legend( lab(1 "전체") lab( 2 "남성") lab( 3 "여성")  row(1) ) saving(figure/rri_sex_ent , replace)

/*RRI over enttyp by envtyp*/
twoway line index wave if scoretyp == 5 & enttyp == -1 & sex == -1  & hstype == -1 & majtype == -1 || ///
	line index wave if scoretyp == 5 & enttyp == 1 & sex == -1  & hstype == -1 & majtype == -1 || ///
	line index wave if scoretyp == 5 & enttyp == 2 & sex == -1  & hstype == -1 & majtype == -1 ///
	, by(envtyp) legend( lab(1 "전체") lab( 2 "일반정시") lab( 3 "일반수시")  row(1) ) saving(figure/rri_ent_env , replace)

/*RRI over enttyp by envtyp*/
twoway line index wave if scoretyp == 5 & enttyp == -1 & sex == -1  & hstype == -1 & majtype == -1 || ///
	line index wave if scoretyp == 5 & enttyp == -1 & sex == -1  & hstype == 1 & majtype == -1 || ///
	line index wave if scoretyp == 5 & enttyp == -1 & sex == -1  & hstype == 2 & majtype == -1 || ///
	line index wave if scoretyp == 5 & enttyp == -1 & sex == -1  & hstype == 3 & majtype == -1 ///
	, by(envtyp) legend( lab(1 "전체") lab( 2 "특성화고") lab( 3 "일반계") lab(4 "특목/자립/강남") row(1) ) saving(figure/rri_sch_env , replace)
