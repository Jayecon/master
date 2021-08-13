cd ~/dropbox
log using timss/timss_reg_210809 , replace
use timss/timss_regdata , clear

xtset cntcod wtimss

eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp bjtmatht_n pl_i lnpop) i.wtimss, rob
eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp bjtmatht_n pl_i lnpop) i.wtimss, fe
eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  bjtmatht_n pl_i lnpop) i.wtimss, vce(robust)
/*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g)*/
/*eststo clear*/

eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxbjtmatht_n noecdxbjtmatht_n pl_i lnpop) i.wtimss, rob
eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxbjtmatht_n noecdxbjtmatht_n pl_i lnpop) i.wtimss, fe
eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxbjtmatht_n noecdxbjtmatht_n pl_i lnpop) i.wtimss, vce(robust)
esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) csv
eststo clear

eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp bjcmatht_n bjematht_n pl_i lnpop) i.wtimss, rob
eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp bjcmatht_n bjematht_n pl_i lnpop) i.wtimss, fe
eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  bjcmatht_n bjematht_n pl_i lnpop) i.wtimss, vce(robust)
/*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g)*/
/*eststo clear*/

eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxbjcmatht_n oecdxbjematht_n noecdxbjcmatht_n noecdxbjematht_n pl_i lnpop) i.wtimss, rob
eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxbjcmatht_n oecdxbjematht_n noecdxbjcmatht_n noecdxbjematht_n pl_i lnpop) i.wtimss, fe
eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxbjcmatht_n oecdxbjematht_n noecdxbjcmatht_n noecdxbjematht_n pl_i lnpop) i.wtimss, vce(robust)
esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) csv
eststo clear

eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp fgtmatht_n pl_i lnpop) i.wtimss, rob
eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp fgtmatht_n pl_i lnpop) i.wtimss, fe
eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  fgtmatht_n pl_i lnpop) i.wtimss, vce(robust)
/*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g)*/
/*eststo clear*/

eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxfgtmatht_n noecdxfgtmatht_n pl_i lnpop) i.wtimss, rob
eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxfgtmatht_n noecdxfgtmatht_n pl_i lnpop) i.wtimss, fe
eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxfgtmatht_n noecdxfgtmatht_n pl_i lnpop) i.wtimss, vce(robust)
esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) csv
eststo clear

eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp fgcmatht_n fgematht_n pl_i lnpop) i.wtimss, rob
eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp fgcmatht_n fgematht_n pl_i lnpop) i.wtimss, fe
eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  fgcmatht_n fgematht_n pl_i lnpop) i.wtimss, vce(robust)
/*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g)*/
/*eststo clear*/

eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxfgcmatht_n oecdxfgematht_n noecdxfgcmatht_n noecdxfgematht_n pl_i lnpop) i.wtimss, rob
eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxfgcmatht_n oecdxfgematht_n noecdxfgcmatht_n noecdxfgematht_n pl_i lnpop) i.wtimss, fe
eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxfgcmatht_n oecdxfgematht_n noecdxfgcmatht_n noecdxfgematht_n pl_i lnpop) i.wtimss, vce(robust)
esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) csv
eststo clear

eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp bjtsciet_n pl_i lnpop) i.wtimss, rob
eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp bjtsciet_n pl_i lnpop) i.wtimss, fe
eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  bjtsciet_n pl_i lnpop) i.wtimss, vce(robust)
/*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g)*/
/*eststo clear*/

eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxbjtsciet_n noecdxbjtsciet_n pl_i lnpop) i.wtimss, rob
eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxbjtsciet_n noecdxbjtsciet_n pl_i lnpop) i.wtimss, fe
eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxbjtsciet_n noecdxbjtsciet_n pl_i lnpop) i.wtimss, vce(robust)
esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) csv
eststo clear

eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp bjcsciet_n bjesciet_n pl_i lnpop) i.wtimss, rob
eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp bjcsciet_n bjesciet_n pl_i lnpop) i.wtimss, fe
eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  bjcsciet_n bjesciet_n pl_i lnpop) i.wtimss, vce(robust)
/*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g)*/
/*eststo clear*/

eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxbjcsciet_n oecdxbjesciet_n noecdxbjcsciet_n noecdxbjesciet_n pl_i lnpop) i.wtimss, rob
eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxbjcsciet_n oecdxbjesciet_n noecdxbjcsciet_n noecdxbjesciet_n pl_i lnpop) i.wtimss, fe
eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxbjcsciet_n oecdxbjesciet_n noecdxbjcsciet_n noecdxbjesciet_n pl_i lnpop) i.wtimss, vce(robust)
esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) csv
eststo clear

eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp fgtsciet_n pl_i lnpop) i.wtimss, rob
eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp fgtsciet_n pl_i lnpop) i.wtimss, fe
eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  fgtsciet_n pl_i lnpop) i.wtimss, vce(robust)
/*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g)*/
/*eststo clear*/

eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxfgtsciet_n noecdxfgtsciet_n pl_i lnpop) i.wtimss, rob
eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxfgtsciet_n noecdxfgtsciet_n pl_i lnpop) i.wtimss, fe
eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxfgtsciet_n noecdxfgtsciet_n pl_i lnpop) i.wtimss, vce(robust)
esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) csv
eststo clear

eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp fgcsciet_n fgesciet_n pl_i lnpop) i.wtimss, rob
eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp fgcsciet_n fgesciet_n pl_i lnpop) i.wtimss, fe
eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  fgcsciet_n fgesciet_n pl_i lnpop) i.wtimss, vce(robust)
/*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g)*/
/*eststo clear*/

eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxfgcsciet_n oecdxfgesciet_n noecdxfgcsciet_n noecdxfgesciet_n pl_i lnpop) i.wtimss, rob
eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxfgcsciet_n oecdxfgesciet_n noecdxfgcsciet_n noecdxfgesciet_n pl_i lnpop) i.wtimss, fe
eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxfgcsciet_n oecdxfgesciet_n noecdxfgcsciet_n noecdxfgesciet_n pl_i lnpop) i.wtimss, vce(robust)
esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) csv
eststo clear

log close
