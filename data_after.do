foreach i in pisa timss {
	forvalue j = 1/7 {
		use ~/dropbox/`i'w`j' , clear
		capture rename cntry country
		if "`i'" == "pisa" & "`j'" == "6" {
			drop if country == 8
		}
		levelsof country , local(clist)
		capture drop posses
		egen posses = rowtotal(poscom posdsk posnet posrom) 
			label var posses "Possession status;desk, com, net and room"
		capture drop fambrn
		egen fambrn = rowtotal(???brn) 
			label var posses "Born in the Country; Family"
		local count = 1
		foreach k of local clist {
				pca posbok posses fambrn if country == `k'
					predict pcascore0`count' if e(sample)
					xtile pcagrp0`count' = pcascore0`count' , nq(3)
					local ++count
		}
		egen pcascore = rowtotal(pcascore*) , missing
				label var pcascore "PCA Score"
		egen pcagrp = rowtotal(pcagrp*) , missing
				label var pcagrp "PCA Score"
				label define PCAGRP 1 "Low Env." 2 "Mid Env." 3 "high Env."
				label value pcagrp PCAGRP
		drop pcascore0* pcagrp0* 
		compress
		save ~/dropbox/`i'w`j' , replace
	}
}

