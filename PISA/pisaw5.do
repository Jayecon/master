/*Macro List{{{*/
local path "E:\works\pisa\stata\"
/*Macro List for School{{{*/
local schidlist schoolid cnt
local schvlist sc03q01 stratio propcert propqual 
local schrvlist schloc strati tchcer tchi5a 
local schwlist w_fschwt senwgt_scq
local schrwlist schwgt seqwgt
local schtvlist sc09q11-sc09q32
/*}}}*/
/*Macro List for Student{{{*/
local stuidlist schoolid stidstd cnt
local stuvlist st04q01 ///
				ocod1 ocod2 st15q01 st19q01 ///
				st13q01 st14q01 st14q02 st14q03 st14q04 ///
				st17q01 st18q01 st18q02 st18q03 st18q04 ///
				st20q01 st20q02 st20q03 ///
				st26q01 st26q02 st26q03 st26q04 st26q05 ///
				st26q06 st26q07 st26q08 st26q09 st26q10 ///
				st26q11 st26q12 st26q13 st26q14 ///
				st27q01 st27q02 st27q03 st27q04 st27q05 ///
				st28q01 ///
				bfmj2 bmmj1 misced fisced hisced ///
				hisei escs
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
				ftrsei mtrsei mtredu ftredu hghedu ///
				hghsei idxesc
local stuwlist w_fstuwt senwgt_stu
local sturwlist stuwgt sstwgt 
local scorelist pv1math pv2math pv3math pv4math pv5math ///
				pv1read pv2read pv3read pv4read pv5read ///
				pv1scie pv2scie pv3scie pv4scie pv5scie 
/*}}}*/
/*}}}*/

tempfile tfile

cd `path'

use `path'p12_school.dta , clear 
	rename _all, low
/*Missing Control{{{*/
	mvdecode sc03q01  , mv( 9=. \ 8=. \ 7=. )
	mvdecode stratio  , mv(9999=. \ 9998=. \ 9997=.)  
	mvdecode propcert , mv(9999=. \ 9998=. \ 9997=.)  
	mvdecode propqual , mv(9999=. \ 9998=. \ 9997=.) 
/*}}}*/
	isid `schidlist'
	keep `schidlist' `schvlist' `schwlist' 
	rename (`schvlist' `schwlist') (`schrvlist' `schrwlist')
save `tfile'

use `path'p12_student.dta , clear 
	rename _all, low
/*Missing Control{{{*/
mvdecode st04q01 , mv( 9=. \ 8=. \ 7=. )  
mvdecode ocod1   , mv( 9999=. \ 9998=. \ 9997=. )
mvdecode ocod2   , mv( 9999=. \ 9998=. \ 9997=. )
mvdecode st15q01 , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st19q01 , mv( 9=. \ 8=. \ 7=. )  
mvdecode st13q01 , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st14q01 , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st14q02 , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st14q03 , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st14q04 , mv( 9=. \ 8=. \ 7=. )  
mvdecode st17q01 , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st18q01 , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st18q02 , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st18q03 , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st18q04 , mv( 9=. \ 8=. \ 7=. )  
mvdecode st20q01 , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st20q02 , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st20q03 , mv( 9=. \ 8=. \ 7=. )  
mvdecode st26q01 , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st26q02 , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st26q03 , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st26q04 , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st26q05 , mv( 9=. \ 8=. \ 7=. )  
mvdecode st26q06 , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st26q07 , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st26q08 , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st26q09 , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st26q10 , mv( 9=. \ 8=. \ 7=. )  
mvdecode st26q11 , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st26q12 , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st26q13 , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st26q14 , mv( 9=. \ 8=. \ 7=. )  
mvdecode st27q01 , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st27q02 , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st27q03 , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st27q04 , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st27q05 , mv( 9=. \ 8=. \ 7=. )  
mvdecode st28q01 , mv( 9=. \ 8=. \ 7=. )
mvdecode misced , mv( 9=. \ 8=. \ 7=. )
mvdecode fisced , mv( 9=. \ 8=. \ 7=. )
mvdecode hisced , mv( 9=. \ 8=. \ 7=. )
mvdecode bmmj1 	 , mv( 99=. \ 98=. \ 97=. )  
mvdecode bfmj2   , mv( 99=. \ 98=. \ 97=. ) 
mvdecode escs    , mv( 9999=. \ 9998=. \ 9997=. )
mvdecode hisei   , mv( 9999=. \ 9998=. \ 9997=. )

/*}}}*/
	isid `stuidlist'
	keep `stuidlist' `stuvlist' `stuwlist' `scorelist'
	rename (`stuvlist' `stuwlist') (`sturvlist' `sturwlist')
	merge m:1 `schidlist' using `tfile' 
save `tfile' , replace

rename country cntcode
destring cntcode , replace
merge m:1 cntcode using ~/git/etc/countrycode_1.dta 
	drop if _merge == 2
	drop _merge
egen posses = rowtotal(poscom posdsk posnet posrom) , missing
	label var posses "Possession Status; Desk, Com, Net and Room"
egen fambrn = rowtotal(???brn) , missing
	label var fambrn "Born in the Country; Family"
	compress

save ~/dropbox/pisaw5.dta , replace
