forvalue i=1/7 {
	use ~/dropbox/pisaw`i' , clear
		capture drop pcascore* pcagrp* pcascore pcagrp posses fambrn
		capture destring cntcode , replace
		levelsof cntcode , local(clist)
		/*Generate Variables{{{*/
		egen posses = rowtotal(poscom posdsk posnet posrom) , missing
			label var posses "Possession Status; Desk, Com, Net and Room"
		egen fambrn = rowtotal(???brn) , missing
			label var fambrn "Born in the Country; Family"
		/*}}}*/
		/* Generate PCA Group{{{*/
		local pcalist posbok posses ftredu2 mtredu2 
		local count = 1
			foreach k of local clist {
				pca `pcalist' if cntcode == `k'
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
		/*}}}*/
		compress
	save ~/dropbox/pisaw`i' , replace
}
