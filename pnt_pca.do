foreach i in pisa timss
forvalue j=1/7 {
	use ~/dropbox/`i'w`j' , clear
	levelsof cntcode , local(clist)
	/* Cleaning Dummy Variables {{{*/
	captur label drop YN
	label defien YN 1 "Yes" 0 "No"
	lookfor pos
	local plist `r(varlist)'
	foreach k of local plist {
		local num ustrlen("`k'")
		if `num' == 6 {
			qui inspect `k'
			local length = r(N_unique) 
			sum `k' , meanonly
			local min = r(min)
			local max = r(max)
			if `length' == 2 & `min' == 1 & `max' == 2 {
				recode `k' 2=0 
				label value `k' YN
			}
		}
	}
	/*}}}*/
	/*Generate Variables{{{*/
	capture drop posses fambrn
	egen posses = rowtotal(poscom posdsk posnet posrom) , missing
		label var posses "Possession Status; Desk, Com, Net and Room"
	egen fambrn = rowtotal(???brn) , missing
		label var fambrn "Born in the Country; Family"
	/*}}}*/
	/* Generate PCA Group{{{*/
	local pcalist posbok posses ftredu2 mtredu2 
	capture drop pcascr pcagrp 
	local count = 1
	foreach k of local clist {
		pca `pcalist' if cntcode == `k'
			predict temp1`count' if e(sample)
			xtile temp2`count' = temp1`count' , nq(3)
		local ++count
	}
	egen pcascr = rowtotal(temp1*) , missing
		label var pcascr "PCA Score"
	egen pcagrp = rowtotal(temp2*) , missing
		label var pcagrp "PCA Group"
		capture label drop PCAGRP
		label define PCAGRP 1 "Low Env." 2 "Mid Env." 3 "high Env."
		label value pcagrp PCAGRP
	drop temp*
	/*}}}*/
	compress
	save ~/dropbox/`i'w`j' , replace
}
