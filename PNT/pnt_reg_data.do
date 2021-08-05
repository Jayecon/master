cd ~/dropbox

tempfile temp1 temp2

use pnt/pnt_index.dta , clear

rename cntab3 countrycode
preserve 
	keep countrycode cntcod
	duplicates drop
	merge 1:m countrycode using "~/Dropbox/Data/pwt100.dta"
		drop if _merge == 1
		drop _merge
	save `temp1' , replace
restore , preserve 

forvalue i = 1/2 {
	forvalue j = 1/4 {
		forvalue k = 1/5 {
		/* Set local dbname {{{*/
		if (`i' == 1 ) {
			local dbname pisa
		}
		else if (`i' == 2 ) {
			local dbname  timss
		} 
		/*}}}*/
		/* Set local subname {{{*/
		if (`k' == 1 ) {
			local subname math
		}
		else if (`k' == 2 ) {
			local subname  scie
		} 
		else if (`k' == 3 ) {
			local subname  read
		} 
		else if (`k' == 4 ) {
			local subname  masc
		} 
		else if (`k' == 5 ) {
			local subname  mrsc
		} 
		/*}}}*/
			keep if dbname == `i' & group == `j' & subject == `k'
			merge m:1 countrycode year using `temp1'
			if (`i' == 1 ) {
				drop if year < 2000
			}
			else if (`i' == 2 ) {
				drop if year < 1995
			} 
			levelsof countrycode if inlist(_merge , 1 ,3) , local(clist)
			gen _temp = 0
			foreach l of local clist { 
				replace _temp = 1 if countrycode == "`l'"
			}
			drop if !_temp
			drop _*
			rename countrycode cntabc3 
		compress
		save `dbname'/`dbname'_reg`j'`subname'.dta , replace
		restore, preserve  
		}
	}
}
