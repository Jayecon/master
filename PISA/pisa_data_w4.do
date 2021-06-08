/*Macro List{{{*/
local path "E:\works\pisa\stata\"
/*Macro List for School{{{*/
local schidlist country schoolid cnt
local schvlist sc04q01 stratio propcert propqual 
local schrvlist schloc strati tchcer tchi5a 
local schwlist w_fschwt
local schrwlist schwgt
local schtvlist sc09q11-sc09q32
/*}}}*/
/*Macro List for Student{{{*/
local stuidlist country schoolid stidstd cnt
local stuvlist st04q01 ///
				st09q01 st13q01 st12q01 st16q01 ///
				st10q01 st11q01 st11q02 st11q03 st11q04 ///
				st14q01 st15q01 st15q02 st15q03 st15q04 ///
				st17q01 st17q02 st17q03 ///
				st20q01 st20q02 st20q03 st20q04 st20q05 ///
				st20q06 st20q07 st20q08 st20q09 st20q10 ///
				st20q11 st20q12 st20q13 st20q14 ///
				st21q01 st21q02 st21q03 st21q04 st21q05 ///
				st22q01 ///
				bfmj bmmj misced fisced hisced ///
				fsecateg msecateg hsecateg hisei escs
local sturvlist stusex ///
				mtrocc ftrocc mtrjob ftrjob ///
				mtredu1 mtredu2 mtredu3 mtredu4 mtredu5 ///
				ftredu1 ftredu2 ftredu3 ftredu4 ftredu5 ///
				stubrn mtrbrn ftrbrn ///
				posdsk posrom posplc poscom possft ///
				posnet poslit pospoe posart postxt ///
				postbk posdic posdsh posdvd ///
				numphn numtvs numcom numcar numbth ///
				posbok ////
				ftrsei mtrsei mtredu ftredu paredu ///
				ftrsec mtrsec hghsec hghsei idxesc
local stuwlist w_fstuwt cntfac 
local sturwlist stuwgt ceqwgt 
local scorelist pv1math pv2math pv3math pv4math pv5math ///
				pv1read pv2read pv3read pv4read pv5read ///
				pv1scie pv2scie pv3scie pv4scie pv5scie 
/*}}}*/
/*}}}*/
tempfile tfile
cd `path'
/*Select and Rename Variables {{{*/
/*School File{{{*/
use `path'p09_school.dta , clear 
	rename _all, low
/*Missing Control{{{*/
	mvdecode sc04q01  , mv( 9=. \ 8=. \ 7=. )
	mvdecode stratio  , mv(9999=. \ 9998=. \ 9997=.)  
	mvdecode propcert , mv(9999=. \ 9998=. \ 9997=.)  
	mvdecode propqual , mv(9999=. \ 9998=. \ 9997=.) 
/*}}}*/
	isid `schidlist'
	keep `schidlist' `schvlist' `schwlist' 
	rename (`schvlist' `schwlist') (`schrvlist' `schrwlist')
save `tfile'
/*}}}*/
/*Student File{{{*/
use `path'p09_student.dta , clear 
	rename _all, low
/*Missing Control{{{*/
mvdecode st04q01  , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st09q01  , mv( 9999=. \ 9998=. \ 9997=. )
mvdecode st13q01  , mv( 9999=. \ 9998=. \ 9997=. )
mvdecode st12q01  , mv( 9=. \ 8=. \ 7=. )
mvdecode st16q01  , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st10q01  , mv( 9=. \ 8=. \ 7=. )
mvdecode st11q01  , mv( 9=. \ 8=. \ 7=. )
mvdecode st11q02  , mv( 9=. \ 8=. \ 7=. )
mvdecode st11q03  , mv( 9=. \ 8=. \ 7=. )
mvdecode st11q04  , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st14q01  , mv( 9=. \ 8=. \ 7=. )
mvdecode st15q01  , mv( 9=. \ 8=. \ 7=. )
mvdecode st15q02  , mv( 9=. \ 8=. \ 7=. )
mvdecode st15q03  , mv( 9=. \ 8=. \ 7=. )
mvdecode st15q04  , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st17q01  , mv( 9=. \ 8=. \ 7=. )
mvdecode st17q02  , mv( 9=. \ 8=. \ 7=. )
mvdecode st17q03  , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st20q01  , mv( 9=. \ 8=. \ 7=. )
mvdecode st20q02  , mv( 9=. \ 8=. \ 7=. )
mvdecode st20q03  , mv( 9=. \ 8=. \ 7=. )
mvdecode st20q04  , mv( 9=. \ 8=. \ 7=. )
mvdecode st20q05  , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st20q06  , mv( 9=. \ 8=. \ 7=. )
mvdecode st20q07  , mv( 9=. \ 8=. \ 7=. )
mvdecode st20q08  , mv( 9=. \ 8=. \ 7=. )
mvdecode st20q09  , mv( 9=. \ 8=. \ 7=. )
mvdecode st20q10  , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st20q11  , mv( 9=. \ 8=. \ 7=. )
mvdecode st20q12  , mv( 9=. \ 8=. \ 7=. )
mvdecode st20q13  , mv( 9=. \ 8=. \ 7=. )
mvdecode st20q14  , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st21q01  , mv( 9=. \ 8=. \ 7=. )
mvdecode st21q02  , mv( 9=. \ 8=. \ 7=. )
mvdecode st21q03  , mv( 9=. \ 8=. \ 7=. )
mvdecode st21q04  , mv( 9=. \ 8=. \ 7=. )
mvdecode st21q05  , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st22q01  , mv( 9=. \ 8=. \ 7=. ) 
mvdecode bfmj     , mv( 99=. \ 98=. \ 97=. )
mvdecode bmmj     , mv( 99=. \ 98=. \ 97=. )
mvdecode misced   , mv( 9=. \ 8=. \ 7=. )
mvdecode fisced   , mv( 9=. \ 8=. \ 7=. )
mvdecode hisced   , mv( 9=. \ 8=. \ 7=. )
mvdecode fsecateg , mv( 9=. \ 8=. \ 7=. ) 
mvdecode msecateg , mv( 9=. \ 8=. \ 7=. ) 
mvdecode hsecateg , mv( 9=. \ 8=. \ 7=. ) 
mvdecode hisei    , mv( 99=. \ 98=. \ 97=. )
mvdecode escs     , mv( 9999=. \ 9998=. \ 9997=. )
/*}}}*/
	isid `stuidlist'
	keep `stuidlist' `stuvlist' `stuwlist' `scorelist'
	rename (`stuvlist' `stuwlist') (`sturvlist' `sturwlist')
	merge m:1 `schidlist' using `tfile' , gen(_student)
save `tfile' , replace
/*}}}*/
/*}}}*/
/*Merge with the Country List{{{*/
rename country cntcod
destring cntcod , replace
replace stidstd = stidstd +1616 if cnt == "QTN"
merge m:1 cntcod using ~/git/etc/countrycode_1.dta 
	drop if _merge == 2
	drop _merge
	compress
/*}}}*/
save ~/dropbox/pisar4.dta , replace
