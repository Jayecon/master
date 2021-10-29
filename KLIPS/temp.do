local count = 1
foreach i in goi rri {
	foreach j in edu job {
		foreach k in 3040 {
			use incn1_`i'_`j'_`k' , clear
			gen test = "`i'" 
			gen env = "`j'"  
			gen cond = "`k'"
				append using incn1_index
				save incn1_index , replace
			local ++count
		}
	}
}
