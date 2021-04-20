forvalues j=1/5{
	forvalues i=1/6{
		myuse timssw`i'
		collapse (mean) meanw`i'=sci0`j' (sd) sdw`i'=sci0`j' [aw=totwgt] , by(cntry)
		twoway (scatter sdw`i' meanw`i')  (lfit sdw`i' meanw`i') , saving(meansd_sci0`j'_w`i')
	}
}
