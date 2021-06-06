cd ~/git
captur log close
log using pnt_missing , replace
foreach i in pisa timss {
forvalue j=1/7 {
	use ~/dropbox/`i'r`j' , clear
	qui levelsof cntcod , local(clist)
	qui lookfor pos
		local vlist `r(varlist)'
		local vlist ftredu mtredu
		qui lookfor brn
		local vlist `r(varlist)'
	foreach k of local clist {
		qui count if cntcod == `k'
		local cntnum = r(N)
		foreach l of local vlist {
			qui count if !missing(`l') & cntcod == `k'
			local varnum = r(N)
			local nmratio = `varnum'/`cntnum' 
			if (`nmratio' >= .7) {
				di as text "Data : " "`i'" " Wave : " "`j'" " Cntcod : " "`k'" " Var : " "`l'" " Non-missing : " %4.3f `nmratio'
			}
			else {
				di as error "Data : " "`i'" " Wave : " "`j'" " Cntcod : " "`k'" " Var : " "`l'" " Non-missing : "  %4.3f `nmratio'
			}
		}
	}
}
}
log close
