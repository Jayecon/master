/*Macro List{{{*/
local path "E:\works\pisa\stata\"
/*Macro List for School{{{*/
local schidlist country schoolid cnt
local schvlist sc07q01 stratio propcert propqual 
local schrvlist schloc strati tchcer tchi5a 
local schwlist w_fschwt
local schrwlist schwgt
local schtvlist sc09q11-sc09q32
/*}}}*/
/*Macro List for Student{{{*/
local stuidlist country schoolid stidstd cnt
local stuvlist st04q01 ///
				bmmj bfmj msecateg fsecateg ///
				st06q01 st07q01 st07q02 st07q03 ///
				st09q01 st10q01 st10q02 st10q03 ///
				st11q01 st11q02 st11q03 ///
				st13q01 st13q02 st13q03 st13q04 st13q05 ///
				st13q06 st13q07 st13q08 st13q09 st13q10 ///
				st13q11 st13q12 st13q13 st13q14 ///
				st14q01 st14q02 st14q03 st14q04 ///
				st15q01 ///
				misced fisced hisced pared
local sturvlist stusex ///
				mtrocc ftrocc mtrjob ftrjob ///
				mtredu1 mtredu2 mtredu3 mtredu4 ///
				ftredu1 ftredu2 ftredu3 ftredu4 ///
				stubrn mtrbrn ftrbrn ///
				posdsk posrom posplc poscom possft ///
				posnet poscal poslit pospoe posart ///
				postxt posdic posdsh posdvd ///
				numphn numtvs numcom numcar ///
				posbok ////
				mtredu ftredu hghedu pyredu
local stuwlist w_fstuwt cntfac subfac 
local sturwlist stuwgt ceqwgt cnmwgt
local scorelist pv1math pv2math pv3math pv4math pv5math ///
				pv1read pv2read pv3read pv4read pv5read ///
				pv1scie pv2scie pv3scie pv4scie pv5scie 
/*}}}*/
/*}}}*/

tempfile tfile

cd `path'

use `path'p06_school.dta , clear 
	rename _all, low
	isid `schidlist'
	keep `schidlist' `schvlist' `schwlist' 
	rename (`schvlist' `schwlist') (`schrvlist' `schrwlist')
save `tfile'

use `path'p06_student.dta , clear 
	rename _all, low
	isid `stuidlist'
	keep `stuidlist' `stuvlist' `stuwlist' 
	rename (`stuvlist' `stuwlist') (`sturvlist' `sturwlist')
	merge m:1 `schidlist' using `tfile' 
save `tfile' , replace

save pisaw3.dta , replace
