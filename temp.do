

foreach i in pisa { 
	forvalue j = 1/7 {
		di ""
		di as input "`i'w`j'"
		use  ~/dropbox/pisaw`j' , clear
		capture drop pv1mrsc
		egen pv1mrsc = rowmean(pv1math pv1scie pv1read)
			label var pv1mrsc "Plausible Value in Math, Science and Reading"
		save , replace
	}
}


