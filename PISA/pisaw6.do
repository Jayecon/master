/*Macro List{{{*/
local path "E:\works\pisa\stata\"
/*Macro List for School{{{*/
local schidlist cntryid cntschid cnt
local schvlist sc001q01ta stratio proatce proat5ab 
local schrvlist schloc strati tchcer tchi5a 
local schwlist w_schgrnrabwt senwt 
local schrwlist schwgt senwgt
/*}}}*/
/*Macro List for Student{{{*/
local stuidlist cntryid cntschid cntstuid cnt
local stuvlist st004d01t ///
				ocod1 ocod2 ///
				st005q01ta st006q01ta st006q02ta st006q03ta st006q04ta ///
				st007q01ta st008q01ta st008q02ta st008q03ta st008q04ta ///
				st019aq01t st019bq01t st019cq01t ///
				st011q01ta st011q02ta st011q03ta st011q04ta st011q05ta ///
				st011q06ta st011q07ta st011q08ta st011q09ta st011q10ta ///
				st011q11ta st011q12ta st011q16na ///
				st012q01ta st012q02ta st012q03ta st012q05na st012q06na ///
				st012q07na st012q08na st012q09na ///
				st013q01ta ///
				bfmj2 bmmj1 misced fisced hisced ///
				hisei escs
local sturvlist stusex ///
				mtrocc ftrocc ///
				mtredu1 mtredu2 mtredu3 mtredu4 mtredu5 ///
				ftredu1 ftredu2 ftredu3 ftredu4 ftredu5 ///
				stubrn mtrbrn ftrbrn ///
				posdsk posrom posplc poscom possft ///
				posnet poslit pospoe posart postxt ///
				postbk posdic posamd ///
				numtvs numcar numbth numphn numcom ///
				numtab numebk numins ///
				posbok ////
				ftrsei mtrsei mtredu ftredu hghedu ///
				hghsei idxesc
local stuwlist w_fstuwt senwt
local sturwlist stuwgt sstwgt 
local scorelist pv1math pv2math pv3math pv4math pv5math ///
				pv6math pv7math pv8math pv9math pv10math ///
				pv1read pv2read pv3read pv4read pv5read ///
				pv6read pv7read pv8read pv9read pv10read ///
				pv1scie pv2scie pv3scie pv4scie pv5scie ///
				pv6scie pv7scie pv8scie pv9scie pv10scie 
/*}}}*/
/*}}}*/

tempfile tfile

cd `path'

use `path'p15_school.dta , clear 
	rename _all, low
/*Missing Control{{{*/
	mvdecode sc001q01ta , mv( 99=. \ 98=. )
	mvdecode stratio  , mv(999=. \ 998=. \ 997=.)  
	mvdecode proatce , mv(99=. \ 98=. \ 97=.)  
	mvdecode proat5ab , mv(99=. \ 98=. \ 97=.) 
/*}}}*/
	isid `schidlist'
	keep `schidlist' `schvlist' `schwlist' 
	rename (`schvlist' `schwlist') (`schrvlist' `schrwlist')
save `tfile'

use `path'p15_student.dta , clear 
	rename _all, low
/*Missing Control{{{*/
mvdecode st004d01t  , mv( 9=. \ 8=. \ 7=. ) 
mvdecode ocod1      , mv( 9999=. \ 9998=. \ 9997=. )
mvdecode ocod2      , mv( 9999=. \ 9998=. \ 9997=. )
mvdecode st005q01ta , mv( 99=. \ 98=. \ 97=. )
mvdecode st006q01ta , mv( 9=. \ 8=. \ 7=. )
mvdecode st006q02ta , mv( 9=. \ 8=. \ 7=. )
mvdecode st006q03ta , mv( 9=. \ 8=. \ 7=. )
mvdecode st006q04ta , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st007q01ta , mv( 99=. \ 98=. \ 97=. )
mvdecode st008q01ta , mv( 9=. \ 8=. \ 7=. )
mvdecode st008q02ta , mv( 9=. \ 8=. \ 7=. )
mvdecode st008q03ta , mv( 9=. \ 8=. \ 7=. )
mvdecode st008q04ta , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st019aq01t , mv( 99=. \ 98=. \ 97=. )
mvdecode st019bq01t , mv( 99=. \ 98=. \ 97=. )
mvdecode st019cq01t , mv( 99=. \ 98=. \ 97=. ) 
mvdecode st011q01ta , mv( 9=. \ 8=. \ 7=. )
mvdecode st011q02ta , mv( 9=. \ 8=. \ 7=. )
mvdecode st011q03ta , mv( 9=. \ 8=. \ 7=. )
mvdecode st011q04ta , mv( 9=. \ 8=. \ 7=. )
mvdecode st011q05ta , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st011q06ta , mv( 9=. \ 8=. \ 7=. )
mvdecode st011q07ta , mv( 9=. \ 8=. \ 7=. )
mvdecode st011q08ta , mv( 9=. \ 8=. \ 7=. )
mvdecode st011q09ta , mv( 9=. \ 8=. \ 7=. )
mvdecode st011q10ta , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st011q11ta , mv( 9=. \ 8=. \ 7=. )
mvdecode st011q12ta , mv( 9=. \ 8=. \ 7=. )
mvdecode st011q16na , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st012q01ta , mv( 9=. \ 8=. \ 7=. )
mvdecode st012q02ta , mv( 9=. \ 8=. \ 7=. )
mvdecode st012q03ta , mv( 9=. \ 8=. \ 7=. )
mvdecode st012q05na , mv( 9=. \ 8=. \ 7=. )
mvdecode st012q06na , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st012q07na , mv( 9=. \ 8=. \ 7=. )
mvdecode st012q08na , mv( 9=. \ 8=. \ 7=. )
mvdecode st012q09na , mv( 9=. \ 8=. \ 7=. ) 
mvdecode st013q01ta , mv( 99=. \ 98=. \ 97=. ) 
mvdecode misced     , mv( 99=. \ 98=. \ 97=. )
mvdecode fisced     , mv( 99=. \ 98=. \ 97=. )
mvdecode hisced     , mv( 99=. \ 98=. \ 97=. )
mvdecode bmmj1     , mv( 9999=. \ 9998=. \ 9997=. )
mvdecode bfmj2     , mv( 9999=. \ 9998=. \ 9997=. )
mvdecode hisei     , mv( 9999=. \ 9998=. \ 9997=. )
/*}}}*/
	isid `stuidlist'
	keep `stuidlist' `stuvlist' `stuwlist' `scorelist'
	rename (`stuvlist' `stuwlist') (`sturvlist' `sturwlist')
	merge m:1 `schidlist' using `tfile' , gen(_student)
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

save ~/dropbox/pisaw6.dta , replace
