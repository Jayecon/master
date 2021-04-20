forvalues j=1/5{
	forvalues i=1/6{
		myuse timssw`i'
		collapse (mean) meanw`i'=mat0`j' (sd) sdw`i'=mat0`j' [aw=totwgt] , by(cntry)
		twoway (scatter sdw`i' meanw`i')  (lfit sdw`i' meanw`i') , saving(meansd_mat0`j'_w`i')
	}
}
