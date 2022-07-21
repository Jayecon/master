cd ~/dropbox
log using pisa/pisa_reg210809 , replace
use pisa/pisa_regdata , clear

label var lnpcgdp           "ln1인당GDP"
label var oecdxbjtmathp_n   "OECD$\times$총불평등"
label var noecdxbjtmathp_n  "비OECD$\times$총불평등"
label var pl_i              "투자재가격"
label var lnpop             "ln인구"
label var bjtmathp_n        "총불평등"
label var bjcmathp_n        "기회불평등"
label var bjemathp_n        "잔여불평등"
label var oecdxbjcmathp_n   "OECD$\times$기회불평등"
label var oecdxbjemathp_n   "OECD$\times$잔여불평등"
label var noecdxbjcmathp_n  "비OECD$\times$기회불평등"
label var noecdxbjemathp_n  "비OECD$\times$잔여불평등"

xtset cntcod wpisa

  /*PISA Math{{{*/
    eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp bjtmathp_n pl_i lnpop) i.wpisa, rob
    eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp bjtmathp_n pl_i lnpop) i.wpisa, fe
    eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  bjtmathp_n pl_i lnpop) i.wpisa, vce(robust)
    /*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g)*/
    /*eststo clear*/
    eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxbjtmathp_n noecdxbjtmathp_n pl_i lnpop) i.wpisa, rob
    eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxbjtmathp_n noecdxbjtmathp_n pl_i lnpop) i.wpisa, fe
    eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxbjtmathp_n noecdxbjtmathp_n pl_i lnpop) i.wpisa, vce(robust)
    /*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) csv */
    esttab using pisa_reg1.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label replace booktabs title(Regression table\label{tab1})
    eststo clear

    eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp bjcmathp_n bjemathp_n pl_i lnpop) i.wpisa, rob
    eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp bjcmathp_n bjemathp_n pl_i lnpop) i.wpisa, fe
    eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  bjcmathp_n bjemathp_n pl_i lnpop) i.wpisa, vce(robust)
    /*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g)*/
    /*eststo clear*/
    eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxbjcmathp_n oecdxbjemathp_n noecdxbjcmathp_n noecdxbjemathp_n pl_i lnpop) i.wpisa, rob
    eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxbjcmathp_n oecdxbjemathp_n noecdxbjcmathp_n noecdxbjemathp_n pl_i lnpop) i.wpisa, fe
    eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxbjcmathp_n oecdxbjemathp_n noecdxbjcmathp_n noecdxbjemathp_n pl_i lnpop) i.wpisa, vce(robust)
    /*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) csv*/
    esttab using pisa_reg2.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label replace booktabs title(Regression table\label{tab1})
    eststo clear

    eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp fgtmathp_n pl_i lnpop) i.wpisa, rob
    eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp fgtmathp_n pl_i lnpop) i.wpisa, fe
    eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  fgtmathp_n pl_i lnpop) i.wpisa, vce(robust)
    /*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g)*/
    /*eststo clear*/
    eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxfgtmathp_n noecdxfgtmathp_n pl_i lnpop) i.wpisa, rob
    eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxfgtmathp_n noecdxfgtmathp_n pl_i lnpop) i.wpisa, fe
    eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxfgtmathp_n noecdxfgtmathp_n pl_i lnpop) i.wpisa, vce(robust)
    /*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) csv*/
    esttab using pisa_reg3.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label replace booktabs title(Regression table\label{tab1})
    eststo clear

    eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp fgcmathp_n fgemathp_n pl_i lnpop) i.wpisa, rob
    eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp fgcmathp_n fgemathp_n pl_i lnpop) i.wpisa, fe
    eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  fgcmathp_n fgemathp_n pl_i lnpop) i.wpisa, vce(robust)
    /*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g)*/
    /*eststo clear*/
    eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxfgcmathp_n oecdxfgemathp_n noecdxfgcmathp_n noecdxfgemathp_n pl_i lnpop) i.wpisa, rob
    eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxfgcmathp_n oecdxfgemathp_n noecdxfgcmathp_n noecdxfgemathp_n pl_i lnpop) i.wpisa, fe
    eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxfgcmathp_n oecdxfgemathp_n noecdxfgcmathp_n noecdxfgemathp_n pl_i lnpop) i.wpisa, vce(robust)
    /*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) csv*/
    esttab using pisa_reg4.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label replace booktabs title(Regression table\label{tab1})
    eststo clear
  /*}}}*/
  /*PISA Science{{{*/
    eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp bjtsciep_n pl_i lnpop) i.wpisa, rob
    eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp bjtsciep_n pl_i lnpop) i.wpisa, fe
    eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  bjtsciep_n pl_i lnpop) i.wpisa, vce(robust)
    /*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g)*/
    /*eststo clear*/

    eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxbjtsciep_n noecdxbjtsciep_n pl_i lnpop) i.wpisa, rob
    eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxbjtsciep_n noecdxbjtsciep_n pl_i lnpop) i.wpisa, fe
    eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxbjtsciep_n noecdxbjtsciep_n pl_i lnpop) i.wpisa, vce(robust)
    /*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) csv*/
    esttab using pisa_reg5.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label replace booktabs title(Regression table\label{tab1})
    eststo clear

    eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp bjcsciep_n bjesciep_n pl_i lnpop) i.wpisa, rob
    eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp bjcsciep_n bjesciep_n pl_i lnpop) i.wpisa, fe
    eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  bjcsciep_n bjesciep_n pl_i lnpop) i.wpisa, vce(robust)
    /*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g)*/
    /*eststo clear*/

    eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxbjcsciep_n oecdxbjesciep_n noecdxbjcsciep_n noecdxbjesciep_n pl_i lnpop) i.wpisa, rob
    eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxbjcsciep_n oecdxbjesciep_n noecdxbjcsciep_n noecdxbjesciep_n pl_i lnpop) i.wpisa, fe
    eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxbjcsciep_n oecdxbjesciep_n noecdxbjcsciep_n noecdxbjesciep_n pl_i lnpop) i.wpisa, vce(robust)
    /*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) csv*/
    esttab using pisa_reg6.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label replace booktabs title(Regression table\label{tab1})
    eststo clear

    eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp fgtsciep_n pl_i lnpop) i.wpisa, rob
    eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp fgtsciep_n pl_i lnpop) i.wpisa, fe
    eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  fgtsciep_n pl_i lnpop) i.wpisa, vce(robust)
    /*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g)*/
    /*eststo clear*/

    eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxfgtsciep_n noecdxfgtsciep_n pl_i lnpop) i.wpisa, rob
    eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxfgtsciep_n noecdxfgtsciep_n pl_i lnpop) i.wpisa, fe
    eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxfgtsciep_n noecdxfgtsciep_n pl_i lnpop) i.wpisa, vce(robust)
    /*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) csv*/
    esttab using pisa_reg7.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label replace booktabs title(Regression table\label{tab1})
    eststo clear

    eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp fgcsciep_n fgesciep_n pl_i lnpop) i.wpisa, rob
    eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp fgcsciep_n fgesciep_n pl_i lnpop) i.wpisa, fe
    eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  fgcsciep_n fgesciep_n pl_i lnpop) i.wpisa, vce(robust)
    /*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g)*/
    /*eststo clear*/

    eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxfgcsciep_n oecdxfgesciep_n noecdxfgcsciep_n noecdxfgesciep_n pl_i lnpop) i.wpisa, rob
    eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxfgcsciep_n oecdxfgesciep_n noecdxfgcsciep_n noecdxfgesciep_n pl_i lnpop) i.wpisa, fe
    eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxfgcsciep_n oecdxfgesciep_n noecdxfgcsciep_n noecdxfgesciep_n pl_i lnpop) i.wpisa, vce(robust)
    /*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) csv*/
    esttab using pisa_reg8.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label replace booktabs title(Regression table\label{tab1})
    eststo clear
  /*}}}*/

log close
