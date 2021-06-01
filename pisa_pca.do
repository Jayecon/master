use ~/dropbox/pisaw1 , clear
	capture drop pcascore* pcagrp* cnt pcascore pcagrp posses fambrn
	capture rename country cntcode
	capture destring cntcode , replace
	merge m:1 cntcode using ~/dropbox/countrycode_1.dta 
		drop if _merge == 2
		drop _merge
	levelsof cntcode , local(clist)
	egen posses = rowtotal(poscom posdsk posnet posrom) , missing
		label var posses "Possession Status; Desk, Com, Net and Room"
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
			label var pcagrp "PCA Group"
			capture label drop PCAGRP
			label define PCAGRP 1 "Low Env." 2 "Mid Env." 3 "high Env."
			label value pcagrp PCAGRP
	drop pcascore0* pcagrp0* 
	compress
save ~/dropbox/pisaw1 , replace
