set more off

cd ~/dropbox/klips

use klips.dta , clear 

forvalue i = 1/20 {
	eopcal incn2 [aw=wgt2] if wave == `i' & head & !inc0 , env(edugrp) cumd xr( 0.000000001, 4) file(edu_cumd_w`i'_all) xtitle(`i'차년도 전연령)
}

forvalue i = 1/20 {
	eopcal incn2 [aw=wgt2] if wave == `i' & head & !inc0, env(edugrp) kden xr( 0.000000001, 4) file(edu_kden_w`i'_all) xtitle(`i'차년도 전연령)
}

forvalue i = 1/20 {
	eopcal incn2 [aw=wgt2] if wave == `i' & head & !inc0, env(jobgrp) cumd xr( 0.000000001, 4) file(job_cumd_w`i'_all) xtitle(`i'차년도 전연령)
}

forvalue i = 1/20 {
	eopcal incn2 [aw=wgt2] if wave == `i' & head & !inc0, env(jobgrp) kden xr( 0.000000001, 4) file(job_kden_w`i'_all) xtitle(`i'차년도 전연령)
}

cd figure

gr combine edu_kden_w1_all.gph edu_kden_w2_all.gph edu_kden_w3_all.gph edu_kden_w4_all.gph edu_kden_w5_all.gph ///
	edu_kden_w6_all.gph edu_kden_w7_all.gph edu_kden_w8_all.gph edu_kden_w9_all.gph edu_kden_w10_all.gph ///
	edu_kden_w11_all.gph edu_kden_w12_all.gph edu_kden_w13_all.gph edu_kden_w14_all.gph edu_kden_w15_all.gph /// 
	edu_kden_w16_all.gph edu_kden_w17_all.gph edu_kden_w18_all.gph edu_kden_w19_all.gph edu_kden_w20_all.gph 
	gr save edu_kden_all.gph , replace
	gr export edu_kden_all.png , as(png) replace
gr combine job_kden_w1_all.gph job_kden_w2_all.gph job_kden_w3_all.gph job_kden_w4_all.gph job_kden_w5_all.gph ///
	job_kden_w6_all.gph job_kden_w7_all.gph job_kden_w8_all.gph job_kden_w9_all.gph job_kden_w10_all.gph ///
	job_kden_w11_all.gph job_kden_w12_all.gph job_kden_w13_all.gph job_kden_w14_all.gph job_kden_w15_all.gph /// 
	job_kden_w16_all.gph job_kden_w17_all.gph job_kden_w18_all.gph job_kden_w19_all.gph job_kden_w20_all.gph 
	gr save job_kden_all.gph , replace
	gr export job_kden_all.png , as(png) replace

gr combine job_cumd_w1_all.gph job_cumd_w2_all.gph job_cumd_w3_all.gph job_cumd_w4_all.gph job_cumd_w5_all.gph ///
	job_cumd_w6_all.gph job_cumd_w7_all.gph job_cumd_w8_all.gph job_cumd_w9_all.gph job_cumd_w10_all.gph ///
	job_cumd_w11_all.gph job_cumd_w12_all.gph job_cumd_w13_all.gph job_cumd_w14_all.gph job_cumd_w15_all.gph /// 
	job_cumd_w16_all.gph job_cumd_w17_all.gph job_cumd_w18_all.gph job_cumd_w19_all.gph job_cumd_w20_all.gph 
	gr save job_cumd_all.gph , replace
	gr export job_cumd_all.png , as(png) replace

gr combine edu_cumd_w1_all.gph edu_cumd_w2_all.gph edu_cumd_w3_all.gph edu_cumd_w4_all.gph edu_cumd_w5_all.gph ///
	edu_cumd_w6_all.gph edu_cumd_w7_all.gph edu_cumd_w8_all.gph edu_cumd_w9_all.gph edu_cumd_w10_all.gph ///
	edu_cumd_w11_all.gph edu_cumd_w12_all.gph edu_cumd_w13_all.gph edu_cumd_w14_all.gph edu_cumd_w15_all.gph /// 
	edu_cumd_w16_all.gph edu_cumd_w17_all.gph edu_cumd_w18_all.gph edu_cumd_w19_all.gph edu_cumd_w20_all.gph 
	gr save edu_cumd_all.gph , replace
	gr export edu_cumd_all.png , as(png) replace

	
cd ~/dropbox/klips

use klips.dta , clear 

forvalue i = 1/20 {
	eopcal incn2 [aw=wgt2] if wave == `i' & head & age3050 & !inc0 , env(edugrp) cumd xr( 0.000000001, 4) file(edu_cumd_w`i'_3050) xtitle(`i'차년도 30-50세)
}

forvalue i = 1/20 {
	eopcal incn2 [aw=wgt2] if wave == `i' & head & age3050  & !inc0, env(edugrp) kden xr( 0.000000001, 4) file(edu_kden_w`i'_3050) xtitle(`i'차년도 30-50세)
}

forvalue i = 1/20 {
	eopcal incn2 [aw=wgt2] if wave == `i' & head & age3050 & !inc0, env(jobgrp) cumd xr( 0.000000001, 4) file(job_cumd_w`i'_3050) xtitle(`i'차년도 30-50세)
}

forvalue i = 1/20 {
	eopcal incn2 [aw=wgt2] if wave == `i' & head & age3050 & !inc0, env(jobgrp) kden xr( 0.000000001, 4) file(job_kden_w`i'_3050) xtitle(`i'차년도 30-50세)
}

cd figure

gr combine edu_kden_w1_3050.gph edu_kden_w2_3050.gph edu_kden_w3_3050.gph edu_kden_w4_3050.gph edu_kden_w5_3050.gph ///
	edu_kden_w6_3050.gph edu_kden_w7_3050.gph edu_kden_w8_3050.gph edu_kden_w9_3050.gph edu_kden_w10_3050.gph ///
	edu_kden_w11_3050.gph edu_kden_w12_3050.gph edu_kden_w13_3050.gph edu_kden_w14_3050.gph edu_kden_w15_3050.gph /// 
	edu_kden_w16_3050.gph edu_kden_w17_3050.gph edu_kden_w18_3050.gph edu_kden_w19_3050.gph edu_kden_w20_3050.gph 
	gr save edu_kden_3050.gph , replace
	gr export edu_kden_3050.gph ,as(png) replace

gr combine job_kden_w1_3050.gph job_kden_w2_3050.gph job_kden_w3_3050.gph job_kden_w4_3050.gph job_kden_w5_3050.gph ///
	job_kden_w6_3050.gph job_kden_w7_3050.gph job_kden_w8_3050.gph job_kden_w9_3050.gph job_kden_w10_3050.gph ///
	job_kden_w11_3050.gph job_kden_w12_3050.gph job_kden_w13_3050.gph job_kden_w14_3050.gph job_kden_w15_3050.gph /// 
	job_kden_w16_3050.gph job_kden_w17_3050.gph job_kden_w18_3050.gph job_kden_w19_3050.gph job_kden_w20_3050.gph 
	gr save job_kden_3050.gph , replace
	gr export job_kden_3050.gph ,as(png) replace

gr combine job_cumd_w1_3050.gph job_cumd_w2_3050.gph job_cumd_w3_3050.gph job_cumd_w4_3050.gph job_cumd_w5_3050.gph ///
	job_cumd_w6_3050.gph job_cumd_w7_3050.gph job_cumd_w8_3050.gph job_cumd_w9_3050.gph job_cumd_w10_3050.gph ///
	job_cumd_w11_3050.gph job_cumd_w12_3050.gph job_cumd_w13_3050.gph job_cumd_w14_3050.gph job_cumd_w15_3050.gph /// 
	job_cumd_w16_3050.gph job_cumd_w17_3050.gph job_cumd_w18_3050.gph job_cumd_w19_3050.gph job_cumd_w20_3050.gph 
	gr save job_cumd_3050.gph , replace
	gr export job_cumd_3050.gph ,as(png) replace

gr combine edu_cumd_w1_3050.gph edu_cumd_w2_3050.gph edu_cumd_w3_3050.gph edu_cumd_w4_3050.gph edu_cumd_w5_3050.gph ///
	edu_cumd_w6_3050.gph edu_cumd_w7_3050.gph edu_cumd_w8_3050.gph edu_cumd_w9_3050.gph edu_cumd_w10_3050.gph ///
	edu_cumd_w11_3050.gph edu_cumd_w12_3050.gph edu_cumd_w13_3050.gph edu_cumd_w14_3050.gph edu_cumd_w15_3050.gph /// 
	edu_cumd_w16_3050.gph edu_cumd_w17_3050.gph edu_cumd_w18_3050.gph edu_cumd_w19_3050.gph edu_cumd_w20_3050.gph 
	gr save edu_cumd_3050.gph , replace
	gr export edu_cumd_3050.png , as(png) replace
	
	
	
foreach i in 1 7 14 20 {
	eopcal incn2 [aw=wgt2] if wave == `i' & head & age3050 & !inc0 , env(edugrp) cumd xr( 0.000000001, 3) file(report_edu_cumd_w`i'_3050) xtitle(`i'차년도 30-50세)
}

foreach i in 1 7 14 20 {
	eopcal incn2 [aw=wgt2] if wave == `i' & head & age3050 & !inc0, env(edugrp) kden xr( 0.000000001, 3) file(report_edu_kden_w`i'_3050) xtitle(`i'차년도 30-50세)
}

foreach i in 1 7 14 20 {
	eopcal incn2 [aw=wgt2] if wave == `i' & head & age3050 & !inc0, env(jobgrp) cumd xr( 0.000000001, 3) file(report_job_cumd_w`i'_3050) xtitle(`i'차년도 30-50세)
}

foreach i in 1 7 14 20 {
	eopcal incn2 [aw=wgt2] if wave == `i' & head & age3050 & !inc0, env(jobgrp) kden xr( 0.000000001, 3) file(report_job_kden_w`i'_3050) xtitle(`i'차년도 30-50세)
}

cd figure

gr combine report_edu_kden_w1_3050.gph report_edu_kden_w7_3050.gph  report_edu_kden_w14_3050.gph  report_edu_kden_w20_3050.gph
	gr save report_edu_kden_3050.png , replace
	gr export report_edu_kden_3050.png , as(png) replace

gr combine report_edu_cumd_w1_3050.gph report_edu_cumd_w7_3050.gph  report_edu_cumd_w14_3050.gph  report_edu_cumd_w20_3050.gph  
	gr save report_edu_cumd_3050.png , replace
	gr export report_edu_cumd_3050.png , as(png) replace
	
gr combine report_job_cumd_w1_3050.gph report_job_cumd_w7_3050.gph  report_job_cumd_w14_3050.gph  report_job_cumd_w20_3050.gph  
	gr save report_job_cumd_3050.png , replace
	gr export report_job_cumd_3050.png , as(png) replace
gr combine report_job_kden_w1_3050.gph report_job_kden_w7_3050.gph  report_job_kden_w14_3050.gph  report_job_kden_w20_3050.gph  
	gr save report_job_kden_3050.png , replace
	gr export report_job_kden_3050.png , as(png) replace
