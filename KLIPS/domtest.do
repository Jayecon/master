cd ~/dropbox/goms

use goms , clear

forvalue j = 3/5 {
	log using goms_domt_edugrp_score`j' 
	bys wave: eopcal score`j' [aw=wgt] , env(edugrp) dom 
	log close

	log using goms_domt_incgrp_score`j' 
	bys wave: eopcal score`j' [aw=wgt] , env(incgrp) dom 
	log close

	log using goms_domt_rgngrp_score`j' 
	bys wave: eopcal score`j' [aw=wgt] , env(rgngrp) dom 
	log close

	log using goms_domt_pcagrp_score`j' 
	bys wave: eopcal score`j' [aw=wgt] , env(pcagrp) dom 
	log close
}

	log using goms_domt_edugrp_income
	bys wave: eopcal income [aw=wgt] , env(edugrp) dom 
	log close

	log using goms_domt_incgrp_income
	bys wave: eopcal income [aw=wgt] , env(incgrp) dom 
	log close

	log using goms_domt_rgngrp_income
	bys wave: eopcal income [aw=wgt] , env(rgngrp) dom 
	log close

	log using goms_domt_pcagrp_income
	bys wave: eopcal income [aw=wgt] , env(pcagrp) dom 
	log close
