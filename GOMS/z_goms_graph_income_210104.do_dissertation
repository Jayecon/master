cd ~/dropbox/goms
use results/goms_index_income.dta if indextype == 1, clear

/*GOI over envtyp*/
twoway line index wave if envtyp == 1 & enttyp == -1 & sex == -1 & jobtype == -1 & winratio == .|| ///
	line index wave if envtyp == 2 & enttyp == -1 & sex == -1 & jobtype == -1 & winratio == .|| ///
	line index wave if envtyp == 3 & enttyp == -1 & sex == -1 & jobtype == -1 & winratio == . || ///
	line index wave if envtyp == 4 & enttyp == -1 & sex == -1 & jobtype == -1 & winratio == . ///
	, legend( lab(1 "부모학력집단") lab( 2 "부모소득집단") lab( 3 "고교지역집단") lab( 4 "PCA집단" )) saving(figure/goi_env_income_alljob , replace)

/*GOI over env*/
twoway line index wave if envtyp == 1 & enttyp == -1 & sex == -1 & jobtype == 1 & winratio == .|| ///
	line index wave if envtyp == 2 & enttyp == -1 & sex == -1 & jobtype == 1 & winratio == .|| ///
	line index wave if envtyp == 3 & enttyp == -1 & sex == -1 & jobtype == 1 & winratio == . || ///
	line index wave if envtyp == 4 & enttyp == -1 & sex == -1 & jobtype == 1 & winratio == . ///
	, legend( lab(1 "부모학력집단") lab( 2 "부모소득집단") lab( 3 "고교지역집단") lab( 4 "PCA집단" )) saving(figure/goi_env_income_sjob , replace)

/*GOI over env job*/
twoway line index wave if enttyp == -1 & sex == -1 & jobtype == -1 & winratio == .|| ///
		line index wave if enttyp == -1 & sex == -1 & jobtype == 1 & winratio == . ///
	, by(envtype) legend( lab(1 "전직업") lab( 2 "정규직/자영업자")) saving(figure/goi_env_job_income , replace)

/*GOI over env job sex*/
twoway line index wave if enttyp == -1 & sex == 1  & winratio == . || ///
		line index wave if enttyp == -1 & sex == 2  & winratio == .|| ///
	, by(envtype jobtype , cols(2)) legend( lab(1 "남성") lab( 2 "여성")) saving(figure/goi_env_job_sex_income , replace)
	
/*GOI over env job ent*/
twoway line index wave if enttyp == 1 & sex == -1  & winratio == . || ///
		line index wave if enttyp == 2 & sex == -1  & winratio == .|| ///
	, by(envtype jobtype , cols(2)) legend( lab(1 "일반정시") lab( 2 "일반수시")) saving(figure/goi_env_job_ent_income , replace)

cd ~/dropbox/goms
use results/goms_index_income.dta if indextype == 2, clear

/*RRI over envtyp*/
twoway line index wave if envtyp == 1 & enttyp == -1 & sex == -1 & jobtype == -1 & winratio == 1|| ///
	line index wave if envtyp == 2 & enttyp == -1 & sex == -1 & jobtype == -1 & winratio == 1|| ///
	line index wave if envtyp == 3 & enttyp == -1 & sex == -1 & jobtype == -1 & winratio == 1 || ///
	line index wave if envtyp == 4 & enttyp == -1 & sex == -1 & jobtype == -1 & winratio == 1 ///
	, legend( lab(1 "부모학력집단") lab( 2 "부모소득집단") lab( 3 "고교지역집단") lab( 4 "PCA집단" )) saving(figure/rri_2p8_env_income_alljob , replace)

/*RRI over envtyp*/
twoway line index wave if envtyp == 1 & enttyp == -1 & sex == -1 & jobtype == -1 & winratio == 2|| ///
	line index wave if envtyp == 2 & enttyp == -1 & sex == -1 & jobtype == -1 & winratio == 2|| ///
	line index wave if envtyp == 3 & enttyp == -1 & sex == -1 & jobtype == -1 & winratio == 2 || ///
	line index wave if envtyp == 4 & enttyp == -1 & sex == -1 & jobtype == -1 & winratio == 2 ///
	, legend( lab(1 "부모학력집단") lab( 2 "부모소득집단") lab( 3 "고교지역집단") lab( 4 "PCA집단" )) saving(figure/rri_10_env_income_alljob , replace)
	
	
/*RRI over env*/
twoway line index wave if envtyp == 1 & enttyp == -1 & sex == -1 & jobtype == 1 & winratio == 1|| ///
	line index wave if envtyp == 2 & enttyp == -1 & sex == -1 & jobtype == 1 & winratio == 1|| ///
	line index wave if envtyp == 3 & enttyp == -1 & sex == -1 & jobtype == 1 & winratio == 1 || ///
	line index wave if envtyp == 4 & enttyp == -1 & sex == -1 & jobtype == 1 & winratio == 1 ///
	, legend( lab(1 "부모학력집단") lab( 2 "부모소득집단") lab( 3 "고교지역집단") lab( 4 "PCA집단" )) saving(figure/rri_2p8_env_income_sjob , replace)
	
/*RRI over env*/
twoway line index wave if envtyp == 1 & enttyp == -1 & sex == -1 & jobtype == 1 & winratio == 2|| ///
	line index wave if envtyp == 2 & enttyp == -1 & sex == -1 & jobtype == 1 & winratio == 2|| ///
	line index wave if envtyp == 3 & enttyp == -1 & sex == -1 & jobtype == 1 & winratio == 2 || ///
	line index wave if envtyp == 4 & enttyp == -1 & sex == -1 & jobtype == 1 & winratio == 2 ///
	, legend( lab(1 "부모학력집단") lab( 2 "부모소득집단") lab( 3 "고교지역집단") lab( 4 "PCA집단" )) saving(figure/rri_10_env_income_sjob , replace)
	
/*RRI over env job*/
twoway line index wave if enttyp == -1 & sex == -1 & jobtype == -1 & winratio == 1|| ///
		line index wave if enttyp == -1 & sex == -1 & jobtype == 1 & winratio == 1 ///
	, by(envtype) legend( lab(1 "전직업") lab( 2 "정규직/자영업자")) saving(figure/rri_2p8_env_job_income , replace)

/*RRI over env job*/
twoway line index wave if enttyp == -1 & sex == -1 & jobtype == -1 & winratio == 2|| ///
		line index wave if enttyp == -1 & sex == -1 & jobtype == 1 & winratio == 2 ///
	, by(envtype) legend( lab(1 "전직업") lab( 2 "정규직/자영업자")) saving(figure/rri_10_env_job_income , replace)

/*RRI over env job*/
twoway line index wave if enttyp == -1 & sex == -1 & jobtype == -1 & winratio == 1|| ///
		line index wave if enttyp == -1 & sex == -1 & jobtype == -1 & winratio == 2 ///
	, by(envtype) legend( lab(1 "상위 2.8%") lab( 2 "상위 10%")) saving(figure/rri_win_env_alljob_income , replace)

/*RRI over env job*/
twoway line index wave if enttyp == -1 & sex == -1 & jobtype == 1 & winratio == 1|| ///
		line index wave if enttyp == -1 & sex == -1 & jobtype == 1 & winratio == 2 ///
	, by(envtype) legend( lab(1 "상위 2.8%") lab( 2 "상위 10%")) saving(figure/rri_win_env_sjob_income , replace)	
	
/*RRI over env job sex*/
twoway line index wave if enttyp == -1 & sex == 1  & winratio == 1 || ///
		line index wave if enttyp == -1 & sex == 2  & winratio == 1|| ///
	, by(envtype jobtype , cols(2)) legend( lab(1 "남성") lab( 2 "여성")) saving(figure/rri_2p8_env_job_sex_income , replace)

/*RRI over env job sex*/
twoway line index wave if enttyp == -1 & sex == 1  & winratio == 2 || ///
		line index wave if enttyp == -1 & sex == 2  & winratio == 2|| ///
	, by(envtype jobtype , cols(2)) legend( lab(1 "남성") lab( 2 "여성")) saving(figure/rri_10_env_job_sex_income , replace)
	
/*RRI over env job ent*/
twoway line index wave if enttyp == 1 & sex == -1  & winratio == 1 || ///
		line index wave if enttyp == 2 & sex == -1  & winratio == 1|| ///
	, by(envtype jobtype , cols(2)) legend( lab(1 "일반정시") lab( 2 "일반수시")) saving(figure/rri_2p8_env_job_ent_income , replace)

/*RRI over env job ent*/
twoway line index wave if enttyp == 1 & sex == -1  & winratio == 2 || ///
		line index wave if enttyp == 2 & sex == -1  & winratio == 2|| ///
	, by(envtype jobtype , cols(2)) legend( lab(1 "일반정시") lab( 2 "일반수시")) saving(figure/rri_10_env_job_ent_income , replace)

cd ~/dropbox/goms
use results/goms_index_income.dta if indextype == 1, clear

/*GOI over env job sex*/
twoway rarea uc95 lc95 wave  if enttyp == -1 & sex == 1  & winratio == . & jobtype == -1 , color(gs14) || ///
		line index wave if enttyp == -1 & sex == 1  & winratio == .  & jobtype == -1 || ///
		line index wave if enttyp == -1 & sex == 2  & winratio == .  & jobtype == -1 || ///
		, by(envtype, title("GOI 성별 비교:전직업") ) legend( lab(1 "남성신뢰구간") lab( 2 "남성지수") lab( 3 "여성지수")) ///	 
		saving(figure/goi_env_alljob_sex_income_ci , replace)

/*GOI over env job sex*/
twoway rarea uc95 lc95 wave  if enttyp == -1 & sex == 1  & winratio == . & jobtype == 1 , color(gs14) || ///
		line index wave if enttyp == -1 & sex == 1  & winratio == .  & jobtype == 1 || ///
		line index wave if enttyp == -1 & sex == 2  & winratio == .  & jobtype == 1 || ///
		, by(envtype, title("GOI 성별 비교:정규직/자영업자") ) legend( lab(1 "남성신뢰구간") lab( 2 "남성지수") lab( 3 "여성지수")) ///	 
		saving(figure/goi_env_sjob_sex_income_ci , replace)
		
/*GOI over env job sex*/
twoway rarea uc95 lc95 wave  if enttyp == 1 & sex == -1  & winratio == . & jobtype == -1 , color(gs14) || ///
		line index wave if enttyp == 1 & sex == -1  & winratio == .  & jobtype == -1 || ///
		line index wave if enttyp == 2 & sex == -1  & winratio == .  & jobtype == -1 || ///
		, by(envtype, title("GOI 입시유형별 비교:전직업") ) legend( lab(1 "일반정시신뢰구간") lab( 2 "일반정시지수") lab( 3 "일반수시지수")) ///	 
		saving(figure/goi_env_alljob_ent_income_ci , replace)		

*GOI over env job sex*/
twoway rarea uc95 lc95 wave  if enttyp == 1 & sex == -1  & winratio == . & jobtype == 1 , color(gs14) || ///
		line index wave if enttyp == 1 & sex == -1  & winratio == .  & jobtype == 1 || ///
		line index wave if enttyp == 2 & sex == -1  & winratio == .  & jobtype == 1 || ///
		, by(envtype, title("GOI 입시유형별 비교:정규직/자영업자") ) legend( lab(1 "일반정시신뢰구간") lab( 2 "일반정시지수") lab( 3 "일반수시지수")) ///	 
		saving(figure/goi_env_sjob_ent_income_ci , replace)	

cd ~/dropbox/goms
use results/goms_index_income.dta if indextype == 2, clear	
	
*RRI over env sex with ci*/
twoway rarea uc95 lc95 wave  if enttyp == -1 & sex == 1  & winratio == 2 & jobtype == -1 , color(gs14) || ///
	line index wave if enttyp == -1 & sex == 1  & winratio == 2 & jobtype == -1 || ///
	line index wave if enttyp == -1 & sex == 2  & winratio == 2 & jobtype == -1  ///	
	, by(envtype, title("상위 10% RRI 성별 비교:전직업") ) legend( lab(1 "남성신뢰구간") lab( 2 "남성지수") lab( 3 "여성지수")) ///	
	saving(figure/rri_10_env_alljob_sex_income_ci , replace)

twoway rarea uc95 lc95 wave  if enttyp == -1 & sex == 1  & winratio == 1 & jobtype == -1 , color(gs14) || ///
	line index wave if enttyp == -1 & sex == 1  & winratio == 1 & jobtype == -1 || ///
	line index wave if enttyp == -1 & sex == 2  & winratio == 1 & jobtype == -1  ///	
	, by(envtype, title("상위 2.8% RRI 성별 비교:전직업") ) legend( lab(1 "남성신뢰구간") lab( 2 "남성지수") lab( 3 "여성지수")) ///	
	saving(figure/rri_2p8_env_alljob_sex_income_ci , replace)
	
twoway rarea uc95 lc95 wave  if enttyp == -1 & sex == 1  & winratio == 1 & jobtype == 1 , color(gs14) || ///
	line index wave if enttyp == -1 & sex == 1  & winratio == 1 & jobtype == 1 || ///
	line index wave if enttyp == -1 & sex == 2  & winratio == 1 & jobtype == 1  ///	
	, by(envtype, title("상위 2.8% RRI 성별 비교:정규직/자영업자") ) legend( lab(1 "남성신뢰구간") lab( 2 "남성지수") lab( 3 "여성지수")) ///	
	saving(figure/rri_2p8_env_sjob_sex_income_ci , replace)
	
twoway rarea uc95 lc95 wave  if enttyp == -1 & sex == 1  & winratio == 2 & jobtype == 1 , color(gs14) || ///
	line index wave if enttyp == -1 & sex == 1  & winratio == 2 & jobtype == 1 || ///
	line index wave if enttyp == -1 & sex == 2  & winratio == 2 & jobtype == 1  ///	
	, by(envtype, title("상위 10% RRI 성별 비교:정규직/자영업자") ) legend( lab(1 "남성신뢰구간") lab( 2 "남성지수") lab( 3 "여성지수")) /// 	
	saving(figure/rri_10_env_sjob_sex_income_ci , replace)
	
