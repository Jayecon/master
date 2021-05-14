/*Macro List{{{*/
local path "E:\works\pisa\stata\"
/*Macro List for School{{{*/
local schidlist country schoolid cnt
local schvlist sc01q01 stratio propcert propqped smratio propmath propma5a
local schrvlist schloc strati tchcer tchi5a mtrati tchmpr tchm5a 
local schwlist scweight
local schrwlist schwgt
local schtvlist sc18q11-sc19q25
/*}}}*/
/*Macro List for Student{{{*/
local stuidlist country schoolid stidstd cnt
local stuvlist st03q01 ///
				st05q01 st06q01 st07q01 st09q01 ///
				st11r01 st12q01 st12q02 st12q03 ///
				st13r01 st14q01 st14q02 st14q03 ///
				st15q01 st15q02 st15q03 ///
				st17q01 st17q02 st17q03 st17q04 st17q05 ///
				st17q06 st17q07 st17q08 st17q09 st17q10 ///
				st17q11 st17q12 st17q13 ///
				st19q01 ///
				misced fisced hisced pared
local sturvlist stusex ///
				mtrocc ftrocc mtrjob ftrjob ///
				mtredu1 mtredu2 mtredu3 mtredu4 ///
				ftredu1 ftredu2 ftredu3 ftredu4 ///
				stubrn mtrbrn ftrbrn ///
				posdsk posrom posplc poscom possft ///
				posnet poscal poslit pospoe posart ///
				postxt posdic posdsh ///
				posbok ////
				mtredu ftredu hghedu pyredu
local stuwlist w_fstuwt cntfac1 cntfac2 
local sturwlist stuwgt ceqwgt cnmwgt
local scorelist pv1math pv2math pv3math pv4math pv5math ///
				pv1read pv2read pv3read pv4read pv5read ///
				pv1scie pv2scie pv3scie pv4scie pv5scie 
/*}}}*/
/*}}}*/

tempfile tfile

cd `path'

use `path'p03_school.dta , clear 
	rename _all, low
	isid `schidlist'
	keep `schidlist' `schvlist' `schwlist' 
	rename (`schvlist' `schwlist') (`schrvlist' `schrwlist')
save `tfile'

use `path'p03_student.dta , clear 
	rename _all, low
	isid `stuidlist'
	keep `stuidlist' `stuvlist' `stuwlist' 
	rename (`stuvlist' `stuwlist') (`sturvlist' `sturwlist')
	merge m:1 `schidlist' using `tfile' 
save `tfile' , replace

save pisaw2.dta , replace

