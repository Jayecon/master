tempvar one

foreach i in pisa timss { 
	forvalue j = 1/7 {
		di ""
		di as input "`i'w`j'"
		qui gen `one' = 1
		count if !missing(`one')
		count
		use ~/dropbox/`i'w`j' , clear
		sum pca*
	}
}
