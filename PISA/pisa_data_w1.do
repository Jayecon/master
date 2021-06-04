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
				st37q01
local sturvlist stusex ///
				mtrocc ftrocc mtrjob ftrjob ///
				mtredu1 ftredu1 mtredu2 ftredu2 ///
				stubrn mtrbrn ftrbrn ///
				posdis posrom possft posnet posdic ///
				pospla posdsk postxt poslit pospoe ///
				posart  ///
				pospon postvs poscal poscom posmus ///
				poscar posbth ///
				posbok
local stuwlist w_fstuwt cnt?fac 
local sturwlist stuwgt cn?fwgt 
local scorelistm pv1math pv2math pv3math pv4math pv5math
local scorelistr pv1read pv2read pv3read pv4read pv5read
local scorelists pv1scie pv2scie pv3scie pv4scie pv5scie 
/*}}}*/
/*}}}*/
tempfile tfile
cd `path'
/*Select and Rename Variables {{{*/
/*School File{{{*/
use `path'p00_school.dta , clear 
	rename _all, low
/*Missing Control{{{*/
mvdecode sc01q0  , mv(9=. \ 8=. \ 7=.)
/*}}}*/
	isid `schidlist'
	keep `schidlist' `schvlist' `schwlist' 
	rename (`schvlist' `schwlist') (`schrvlist' `schrwlist')
save `tfile'
/*}}}*/
/*Science File{{{*/
use `path'p00_science.dta , clear 
	rename _all, low
/*Missing Control{{{*/
mvdecode st03q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st06q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st07q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st09q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st11q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st12q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st13q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st14q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st15q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st16q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st16q02 , mv(9=. \ 8=. \ 7=.)
mvdecode st16q03 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q02 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q03 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q04 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q05 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q06 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q07 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q08 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q09 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q10 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q11 , mv(9=. \ 8=. \ 7=.)
mvdecode st22q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st22q02 , mv(9=. \ 8=. \ 7=.)
mvdecode st22q03 , mv(9=. \ 8=. \ 7=.)
mvdecode st22q04 , mv(9=. \ 8=. \ 7=.)
mvdecode st22q05 , mv(9=. \ 8=. \ 7=.)
mvdecode st22q06 , mv(9=. \ 8=. \ 7=.)
mvdecode st22q07 , mv(9=. \ 8=. \ 7=.)
mvdecode st27q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st27q02 , mv(9=. \ 8=. \ 7=.)
mvdecode st27q03 , mv(9=. \ 8=. \ 7=.)
mvdecode st37q01 , mv(99=. \ 98=. \ 97=.)
/*}}}*/
	isid `stuidlist'
	keep `stuidlist' `stuvlist' `stuwlist' `scorelists'
	rename (`stuvlist' `stuwlist') (`sturvlist' `sturwlist')
	merge m:1 `schidlist' using `tfile' , gen(_mscience)
save `tfile' , replace
/*}}}*/
/*Reading File{{{*/
use `path'p00_reading.dta , clear 
	rename _all, low
/*Missing Control{{{*/
mvdecode st03q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st06q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st07q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st09q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st11q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st12q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st13q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st14q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st15q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st16q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st16q02 , mv(9=. \ 8=. \ 7=.)
mvdecode st16q03 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q02 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q03 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q04 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q05 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q06 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q07 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q08 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q09 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q10 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q11 , mv(9=. \ 8=. \ 7=.)
mvdecode st22q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st22q02 , mv(9=. \ 8=. \ 7=.)
mvdecode st22q03 , mv(9=. \ 8=. \ 7=.)
mvdecode st22q04 , mv(9=. \ 8=. \ 7=.)
mvdecode st22q05 , mv(9=. \ 8=. \ 7=.)
mvdecode st22q06 , mv(9=. \ 8=. \ 7=.)
mvdecode st22q07 , mv(9=. \ 8=. \ 7=.)
mvdecode st27q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st27q02 , mv(9=. \ 8=. \ 7=.)
mvdecode st27q03 , mv(9=. \ 8=. \ 7=.)
mvdecode st37q01 , mv(99=. \ 98=. \ 97=.)
/*}}}*/
	isid `stuidlist'
	keep `stuidlist' `stuvlist' `stuwlist' `scorelistr'
	rename (`stuvlist' `stuwlist') (`sturvlist' `sturwlist')
	merge 1:1 `stuidlist' using `tfile' , gen(_mreading)
save `tfile' , replace
/*}}}*/
/*Math File{{{*/
use `path'p00_math.dta , clear 
	rename _all, low
/*Missing Control{{{*/
mvdecode st03q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st06q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st07q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st09q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st11q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st12q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st13q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st14q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st15q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st16q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st16q02 , mv(9=. \ 8=. \ 7=.)
mvdecode st16q03 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q02 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q03 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q04 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q05 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q06 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q07 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q08 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q09 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q10 , mv(9=. \ 8=. \ 7=.)
mvdecode st21q11 , mv(9=. \ 8=. \ 7=.)
mvdecode st22q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st22q02 , mv(9=. \ 8=. \ 7=.)
mvdecode st22q03 , mv(9=. \ 8=. \ 7=.)
mvdecode st22q04 , mv(9=. \ 8=. \ 7=.)
mvdecode st22q05 , mv(9=. \ 8=. \ 7=.)
mvdecode st22q06 , mv(9=. \ 8=. \ 7=.)
mvdecode st22q07 , mv(9=. \ 8=. \ 7=.)
mvdecode st27q01 , mv(9=. \ 8=. \ 7=.)
mvdecode st27q02 , mv(9=. \ 8=. \ 7=.)
mvdecode st27q03 , mv(9=. \ 8=. \ 7=.)
mvdecode st37q01 , mv(99=. \ 98=. \ 97=.)
/*}}}*/
	isid `stuidlist'
	keep `stuidlist' `stuvlist' `stuwlist' `scorelistm'
	rename (`stuvlist' `stuwlist') (`sturvlist' `sturwlist')
	merge 1:1 `stuidlist' using `tfile' , gen(_mmath)
save `tfile' , replace
/*}}}*/
/*}}}*/
/*Merge with the Country List{{{*/
rename country cntcod
destring cntcod , replace
merge m:1 cntcod using ~/git/etc/countrycode_1.dta 
	drop if _merge == 2
	drop _merge
compress
/*}}}*/
/*Generate Parents' Education{{{*/
foreach i in ftr mtr {
	gen `i'edu = `i'edu1
	replace `i'edu = 6 if `i'edu2 == 1
}
local labelname : value label ftredu1
	label copy `labelname' EDUCAT
	label define EDUCAT 6 "Tertiary education" , add
	label value ftredu mtredu EDUCAT
	label var ftredu "Father's education"
	label var mtredu "Mother's education"
egen paredu = rowmax(ftredu mtredu)
	label var paredu "Parents' education"
	label value paredu EDUCAT
/*}}}*/
save ~/dropbox/pisar1 , replace
