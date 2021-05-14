/*Macro List{{{*/
local path "E:\works\pisa\stata\"
/*Macro List for School{{{*/
local schidlist country schoolid cnt
local schvlist sc01q01 stratio propqual propcert propread propmath propscie
local schrvlist schloc strati tchi5a tchcer tchr5a tchm5a tchs5a
local schwlist wnrschb
local schrwlist schwgt
/*}}}*/
/*Macro List for Student{{{*/
local stuidlist country schoolid stidstd cnt
local stuvlist st03q01 ///
				st06q01 st07q01 st09q01 st11q01 ///
				st12q01 st13q01 st14q01 st15q01 ///
				st16q01 st16q02 st16q03 ///
				st21q01 st21q02 st21q03 st21q04 st21q05 ///
				st21q06 st21q07 st21q08 st21q09 st21q10 ///
				st21q11  ///
				st22q01 st22q02 st22q03 st22q04 st22q05 ///
				st22q06 st22q07 ///
				st27q01 st27q02 st27q03 ///
				st37q01
local sturvlist stusex ///
				mtrocc ftrocc mtrjob ftrjob ///
				mtredu2 ftredu2 mtredu3 ftredu3 ///
				stubrn mtrbrn ftrbrn ///
				posdis posrom possft posnet posdic ///
				pospla posdsk postxt poslit pospoe ///
				posart  ///
				pospon postvs poscal poscom posmus ///
				poscar posbth ///
				numlan nummat numsci ///
				posbok
local stuwlist w_fstuwt cnt?fac 
local sturwlist stuwgt cn?fwgt 
local scorelist pv1math pv2math pv3math pv4math pv5math ///
				pv1read pv2read pv3read pv4read pv5read ///
				pv1scie pv2scie pv3scie pv4scie pv5scie 
/*}}}*/
/*}}}*/

tempfile tfile

cd `path'

use `path'p00_school.dta , clear 
	rename _all, low
	isid `schidlist'
	keep `schidlist' `schvlist' `schwlist' 
	rename (`schvlist' `schwlist') (`schrvlist' `schrwlist')
save `tfile'

use `path'p00_science.dta , clear 
	rename _all, low
	isid `stuidlist'
	keep `stuidlist' `stuvlist' `stuwlist' 
	rename (`stuvlist' `stuwlist') (`sturvlist' `sturwlist')
	merge m:1 `schidlist' using `tfile' , gen(_mscience)
save `tfile' , replace

use `path'p00_reading.dta , clear 
	rename _all, low
	isid `stuidlist'
	keep `stuidlist' `stuvlist' `stuwlist' 
	rename (`stuvlist' `stuwlist') (`sturvlist' `sturwlist')
	merge 1:1 `stuidlist' using `tfile' , gen(_mreading)
save `tfile' , replace

use `path'p00_math.dta , clear 
	rename _all, low
	isid `stuidlist'
	keep `stuidlist' `stuvlist' `stuwlist' 
	rename (`stuvlist' `stuwlist') (`sturvlist' `sturwlist')
	merge 1:1 `stuidlist' using `tfile' , gen(_mmath)
save `tfile' , replace

save pisaw1.dta , replace
