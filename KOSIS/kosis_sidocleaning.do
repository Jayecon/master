global path ~/dropbox/
tempfile tfile
do kosis_sidocleaning1.do
    save `tfile'
do kosis_sidocleaning2.do
    append using `tfile'
    save `tfile' , replace
do kosis_sidocleaning3.do
    append using `tfile'
    save `tfile' , replace
