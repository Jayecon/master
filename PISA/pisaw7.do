/*Macro List{{{*/
local path "E:\works\pisa\stata\"
/*Macro List for School{{{*/
local schidlist cntryid cntschid cnt
local schvlist sc001q01ta stratio proatce proat5ab
local schrvlist schloc strati tchcer tchi5a 
local schwlist w_schgrnr senwt
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

use `path'p18_school.dta , clear 
	rename _all, low
	isid `schidlist'
	keep `schidlist' `schvlist' `schwlist' 
	rename (`schvlist' `schwlist') (`schrvlist' `schrwlist')
save `tfile'

use `path'p18_student.dta , clear 
	rename _all, low
	isid `stuidlist'
	keep `stuidlist' `stuvlist' `stuwlist' 
	rename (`stuvlist' `stuwlist') (`sturvlist' `sturwlist')
	merge m:1 `schidlist' using `tfile' 
save `tfile' , replace

save pisaw7.dta , replace

