set more off

cd ~/dropbox/goms
	capture log close
	log using branchcleaning , replace
		use goms , clear
		levelsof uniname if !missing(unirank) , local(unilist)
		foreach i of local unilist {
			di ""
			di as result "`i'"
			capture noisily table branch area if uniname == "`i'"
		}
	log close
	
