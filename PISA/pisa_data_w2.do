/*Macro List{{{*/
local path "E:\works\pisa\stata\"
/*Macro List for School{{{*/
local schidlist country schoolid cnt
local schvlist sc01q01 stratio propcert propqped propma5a
local schrvlist schloc strati tchcer tchi5a tchm5a 
local schwlist scweight
local schrwlist schwgt
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
/*Select and Rename Variables {{{*/
/*School File{{{*/
use `path'p03_school.dta , clear 
	rename _all, low
	/*Missing Control{{{*/
	mvdecode sc01q01  , mv(9=. \ 8=. \ 7=.)  
	mvdecode stratio  , mv(999=. \ 998=. \ 997=.)  
	mvdecode propcert , mv(999=. \ 998=. \ 997=.)  
	mvdecode propqped , mv(999=. \ 998=. \ 997=.)  
	/*}}}*/
	isid `schidlist'
	keep `schidlist' `schvlist' `schwlist' 
	rename (`schvlist' `schwlist') (`schrvlist' `schrwlist')
save `tfile'
/*}}}*/
/*Student File{{{*/
use `path'p03_student.dta , clear 
	rename _all, low
/*Missing Control{{{*/
mvdecode st03q01 , mv(9=. \ 8=. \ 7=.)  
mvdecode st05q01 , mv(9=. \ 8=. \ 7=.) 
mvdecode st06q01 , mv(9=. \ 8=. \ 7=.) 
mvdecode st07q01 , mv(9999=. \ 9998=. \ 9997=.) 
mvdecode st09q01 , mv(9999=. \ 9998=. \ 9997=.)  
mvdecode st11r01 , mv(9=. \ 8=. \ 7=.) 
mvdecode st12q01 , mv(9=. \ 8=. \ 7=.) 
mvdecode st12q02 , mv(9=. \ 8=. \ 7=.) 
mvdecode st12q03 , mv(9=. \ 8=. \ 7=.)  
mvdecode st13r01 , mv(9=. \ 8=. \ 7=.) 
mvdecode st14q01 , mv(9=. \ 8=. \ 7=.) 
mvdecode st14q02 , mv(9=. \ 8=. \ 7=.) 
mvdecode st14q03 , mv(9=. \ 8=. \ 7=.)  
mvdecode st15q01 , mv(99=. \ 98=. \ 97=.) 
mvdecode st15q02 , mv(99=. \ 98=. \ 97=.) 
mvdecode st15q03 , mv(99=. \ 98=. \ 97=.)  
mvdecode st17q01 , mv(9=. \ 8=. \ 7=.) 
mvdecode st17q02 , mv(9=. \ 8=. \ 7=.) 
mvdecode st17q03 , mv(9=. \ 8=. \ 7=.) 
mvdecode st17q04 , mv(9=. \ 8=. \ 7=.) 
mvdecode st17q05 , mv(9=. \ 8=. \ 7=.)  
mvdecode st17q06 , mv(9=. \ 8=. \ 7=.) 
mvdecode st17q07 , mv(9=. \ 8=. \ 7=.) 
mvdecode st17q08 , mv(9=. \ 8=. \ 7=.) 
mvdecode st17q09 , mv(9=. \ 8=. \ 7=.) 
mvdecode st17q10 , mv(9=. \ 8=. \ 7=.)  
mvdecode st17q11 , mv(9=. \ 8=. \ 7=.) 
mvdecode st17q12 , mv(9=. \ 8=. \ 7=.) 
mvdecode st17q13 , mv(9=. \ 8=. \ 7=.)  
mvdecode st19q01 , mv(9=. \ 8=. \ 7=.)  
mvdecode misced  , mv(9=. \ 8=. \ 7=.)
mvdecode fisced  , mv(9=. \ 8=. \ 7=.)
mvdecode hisced  , mv(9=. \ 8=. \ 7=.)
mvdecode pared   , mv(99=. )
/*}}}*/
	isid `stuidlist'
	keep `stuidlist' `stuvlist' `stuwlist' `scorelist'
	rename (`stuvlist' `stuwlist') (`sturvlist' `sturwlist')
	merge m:1 `schidlist' using `tfile' , gen(_student)
save `tfile' , replace
/*}}}*/
/*}}}*/
/*Merge with the Country List{{{*/
rename country cntcode
destring cntcode , replace
merge m:1 cntcode using ~/git/etc/countrycode_1.dta 
	drop if _merge == 2
	drop _merge
	compress
/*}}}*/
save ~/dropbox/pisaw2.dta , replace
