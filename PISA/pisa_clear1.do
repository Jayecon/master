foreach i in pisa {
	forvalue j = 1/1 {
		use ~/dropbox/`i'w`j' , clear
		capture drop pcascore* pcagrp* cnt
		capture drop pcascore pcagrp 
		capture rename country cntcode
		capture destring cntcode , replace
		merge m:1 cntcode using ~/dropbox/countrycode_1.dta 
		drop if _merge == 2
		drop _merge
		if "`i'" == "pisa" & "`j'" == "6" {
			drop if country == 8
		}
		levelsof cntcode , local(clist)
		capture drop posses
		egen posses = rowtotal(poscom posdsk posnet posrom) , missing
			label var posses "Possession status;desk, com, net and room"
		capture drop fambrn
		egen fambrn = rowtotal(???brn) , missing
			label var fambrn "Born in the Country; Family"
		local count = 1
		foreach k of local clist {
				pca posbok posses ftredu2 mtredu2 if cntcode == `k'
					predict pcascore0`count' if e(sample)
					xtile pcagrp0`count' = pcascore0`count' , nq(3)
					local ++count
		}
		egen pcascore = rowtotal(pcascore0*) , missing
				label var pcascore "PCA Score"
		egen pcagrp = rowtotal(pcagrp*) , missing
				label var pcagrp "PCA Score"
				capture label drop PCAGRP
				label define PCAGRP 1 "Low Env." 2 "Mid Env." 3 "high Env."
				label value pcagrp PCAGRP
		drop pcascore0* pcagrp0* 
		compress
		save ~/dropbox/`i'w`j' , replace
	}
}
