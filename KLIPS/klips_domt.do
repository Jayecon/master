cd ~/dropbox/goms/results

use ~/dropbox/goms/goms.dta , clear

preserve

keep if inrange(f001 ,2000 ,2011)

capture log close

forvalue j = 3/5 {
	log using goms_domt_edugrp_score`j' , replace
	bys f001: eopcal score`j' [aw=wgt] , env(edugrp) dom 
	log close

	log using goms_domt_incgrp_score`j' , replace
	bys f001: eopcal score`j' [aw=wgt] , env(incgrp) dom 
	log close

	log using goms_domt_rgngrp_score`j' , replace
	bys f001: eopcal score`j' [aw=wgt] , env(rgngrp) dom 
	log close

	log using goms_domt_pcagrp_score`j' , replace
	bys f001: eopcal score`j' [aw=wgt] , env(pcagrp) dom 
	log close
}

	/*log using goms_domt_edugrp_income , replace*/
	/*bys f001: eopcal income [aw=wgt] , env(edugrp) dom  value(150, 400)*/
	/*log close*/

	/*log using goms_domt_incgrp_income , replace*/
	/*bys f001: eopcal income [aw=wgt] , env(incgrp) dom value(150, 400)*/
	/*log close*/

	log using goms_domt_rgngrp_income , replace
	bys f001: eopcal income [aw=wgt] , env(rgngrp) dom value(150, 400)
	log close

	log using goms_domt_pcagrp_income , replace
	bys f001: eopcal income [aw=wgt] , env(pcagrp) dom value(150, 400)
	log close

restore , preserve
