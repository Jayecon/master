cd ~/dropbox
use pnt/pnt_regdata , clear

/*Label Variables in Korean{{{*/
label var lnpcgdp           "ln1인당GDP"
label var pl_i              "투자재가격"
label var lnpop             "ln인구"
label var oecdxbjtmathpip   "OECD $\times$ 총불평등"
label var noecdxbjtmathpip  "비OECD $\times$ 총불평등"
label var bjtmathpip        "총불평등"
label var bjcmathpip        "기회불평등"
label var bjemathpip        "잔여불평등"
label var oecdxbjcmathpip   "OECD $\times$ 기회불평등"
label var oecdxbjemathpip   "OECD $\times$ 잔여불평등"
label var noecdxbjcmathpip  "비OECD $\times$ 기회불평등"
label var noecdxbjemathpip  "비OECD $\times$ 잔여불평등"
label var oecdxbjtmathtip   "OECD $\times$ 총불평등"
label var noecdxbjtmathtip  "비OECD $\times$ 총불평등"
label var bjtmathtip        "총불평등"
label var bjcmathtip        "기회불평등"
label var bjemathtip        "잔여불평등"
label var oecdxbjcmathtip   "OECD $\times$ 기회불평등"
label var oecdxbjemathtip   "OECD $\times$ 잔여불평등"
label var noecdxbjcmathtip  "비OECD $\times$ 기회불평등"
label var noecdxbjemathtip  "비OECD $\times$ 잔여불평등"
/*}}}*/
xtset cntcod wpisa3
  /*PISA Math{{{*/
    /*BJ : Total Ineq.{{{*/
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp bjtmathpip pl_i lnpop) i.wpisa3, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp bjtmathpip pl_i lnpop) i.wpisa3, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  bjtmathpip pl_i lnpop) i.wpisa3, vce(robust)
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxbjtmathpip noecdxbjtmathpip pl_i lnpop) i.wpisa3, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxbjtmathpip noecdxbjtmathpip pl_i lnpop) i.wpisa3, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxbjtmathpip noecdxbjtmathpip pl_i lnpop) i.wpisa3, vce(robust)
      /*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) /// */
        /*label replace booktabs title(Regression table\label{tab1}) drop(*wpisa*) mtitle("OLS""FE""Sys. GMM""OLS""FE""Sys. GMM")*/
      esttab using pisa_reg1.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) ///
        label replace booktabs title(Regression table\label{tab1}) drop(*wpisa*) mtitle("OLS""FE""Sys. GMM""OLS""FE""Sys. GMM")
      eststo clear
    /*}}}*/
    /*BJ : Ineq. of Effort vs. Ineq. of Env.{{{*/
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp bjcmathpip bjemathpip pl_i lnpop) i.wpisa3, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp bjcmathpip bjemathpip pl_i lnpop) i.wpisa3, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  bjcmathpip bjemathpip pl_i lnpop) i.wpisa3, vce(robust)
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxbjcmathpip oecdxbjemathpip noecdxbjcmathpip noecdxbjemathpip pl_i lnpop) i.wpisa3, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxbjcmathpip oecdxbjemathpip noecdxbjcmathpip noecdxbjemathpip pl_i lnpop) i.wpisa3, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxbjcmathpip oecdxbjemathpip noecdxbjcmathpip noecdxbjemathpip pl_i lnpop) i.wpisa3, vce(robust)
      esttab using pisa_reg2.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) ///
        label replace booktabs title(Regression table\label{tab1}) drop(*wpisa*) mtitle("OLS""FE""Sys. GMM""OLS""FE""Sys. GMM")
      eststo clear
    /*}}}*/
    /*FG : Total Ineq.{{{*/
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp fgtmathpip pl_i lnpop) i.wpisa3, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp fgtmathpip pl_i lnpop) i.wpisa3, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  fgtmathpip pl_i lnpop) i.wpisa3, vce(robust)
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxfgtmathpip noecdxfgtmathpip pl_i lnpop) i.wpisa3, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxfgtmathpip noecdxfgtmathpip pl_i lnpop) i.wpisa3, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxfgtmathpip noecdxfgtmathpip pl_i lnpop) i.wpisa3, vce(robust)
      esttab using pisa_reg3.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) ///
        label replace booktabs title(Regression table\label{tab1}) drop(*wpisa*) mtitle("OLS""FE""Sys. GMM""OLS""FE""Sys. GMM")
      eststo clear
    /*}}}*/
    /*FG : Ineq. of Effort vs. Ineq. of Env.{{{*/
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp fgcmathpip fgemathpip pl_i lnpop) i.wpisa3, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp fgcmathpip fgemathpip pl_i lnpop) i.wpisa3, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  fgcmathpip fgemathpip pl_i lnpop) i.wpisa3, vce(robust)
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxfgcmathpip oecdxfgemathpip noecdxfgcmathpip noecdxfgemathpip pl_i lnpop) i.wpisa3, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxfgcmathpip oecdxfgemathpip noecdxfgcmathpip noecdxfgemathpip pl_i lnpop) i.wpisa3, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxfgcmathpip oecdxfgemathpip noecdxfgcmathpip noecdxfgemathpip pl_i lnpop) i.wpisa3, vce(robust)
      esttab using pisa_reg4.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) ///
        label replace booktabs title(Regression table\label{tab1}) drop(*wpisa*) mtitle("OLS""FE""Sys. GMM""OLS""FE""Sys. GMM")
      eststo clear
    /*}}}*/
  /*}}}*/
  /*PISA Science{{{*/
    /*BJ : Total Ineq.{{{*/
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp bjtsciepip pl_i lnpop) i.wpisa3, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp bjtsciepip pl_i lnpop) i.wpisa3, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  bjtsciepip pl_i lnpop) i.wpisa3, vce(robust)
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxbjtsciepip noecdxbjtsciepip pl_i lnpop) i.wpisa3, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxbjtsciepip noecdxbjtsciepip pl_i lnpop) i.wpisa3, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxbjtsciepip noecdxbjtsciepip pl_i lnpop) i.wpisa3, vce(robust)
      esttab using pisa_reg6.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) ///
        label replace booktabs title(Regression table\label{tab1}) drop(*wpisa*) mtitle("OLS""FE""Sys. GMM""OLS""FE""Sys. GMM")
      eststo clear
    /*}}}*/
    /*BJ : Ineq. of Effort vs. Ineq. of Env.{{{*/
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp bjcsciepip bjesciepip pl_i lnpop) i.wpisa3, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp bjcsciepip bjesciepip pl_i lnpop) i.wpisa3, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  bjcsciepip bjesciepip pl_i lnpop) i.wpisa3, vce(robust)
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxbjcsciepip oecdxbjesciepip noecdxbjcsciepip noecdxbjesciepip pl_i lnpop) i.wpisa3, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxbjcsciepip oecdxbjesciepip noecdxbjcsciepip noecdxbjesciepip pl_i lnpop) i.wpisa3, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxbjcsciepip oecdxbjesciepip noecdxbjcsciepip noecdxbjesciepip pl_i lnpop) i.wpisa3, vce(robust)
      esttab using pisa_reg6.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) ///
        label replace booktabs title(Regression table\label{tab1}) drop(*wpisa*) mtitle("OLS""FE""Sys. GMM""OLS""FE""Sys. GMM")
      esttab using pisa_reg6.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label replace booktabs title(Regression table\label{tab1}) drop(*wpisa*)
      eststo clear
    /*}}}*/
    /*FG : Total Ineq.{{{*/
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp fgtsciepip pl_i lnpop) i.wpisa3, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp fgtsciepip pl_i lnpop) i.wpisa3, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  fgtsciepip pl_i lnpop) i.wpisa3, vce(robust)
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxfgtsciepip noecdxfgtsciepip pl_i lnpop) i.wpisa3, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxfgtsciepip noecdxfgtsciepip pl_i lnpop) i.wpisa3, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxfgtsciepip noecdxfgtsciepip pl_i lnpop) i.wpisa3, vce(robust)
      esttab using pisa_reg7.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) ///
        label replace booktabs title(Regression table\label{tab1}) drop(*wpisa*) mtitle("OLS""FE""Sys. GMM""OLS""FE""Sys. GMM")
      eststo clear
    /*}}}*/
    /*FG : Ineq. of Effort vs. Ineq. of Env.{{{*/
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp fgcsciepip fgesciepip pl_i lnpop) i.wpisa3, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp fgcsciepip fgesciepip pl_i lnpop) i.wpisa3, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  fgcsciepip fgesciepip pl_i lnpop) i.wpisa3, vce(robust)
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxfgcsciepip oecdxfgesciepip noecdxfgcsciepip noecdxfgesciepip pl_i lnpop) i.wpisa3, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxfgcsciepip oecdxfgesciepip noecdxfgcsciepip noecdxfgesciepip pl_i lnpop) i.wpisa3, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxfgcsciepip oecdxfgesciepip noecdxfgcsciepip noecdxfgesciepip pl_i lnpop) i.wpisa3, vce(robust)
      esttab using pisa_reg8.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) ///
        label replace booktabs title(Regression table\label{tab1}) drop(*wpisa*) mtitle("OLS""FE""Sys. GMM""OLS""FE""Sys. GMM")
    eststo clear
    /*}}}*/
  /*}}}*/
  /*PISA Math robust{{{*/
    /*BJ : Total Ineq.{{{*/
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp bjtmathpip pl_i lnpop) i.wpisa3, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp bjtmathpip pl_i lnpop) i.wpisa3, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  bjtmathpip pl_i lnpop) i.wpisa3, vce(robust)
      /*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g)*/
      /*eststo clear*/
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxbjtmathpip noecdxbjtmathpip pl_i lnpop) i.wpisa3, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxbjtmathpip noecdxbjtmathpip pl_i lnpop) i.wpisa3, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxbjtmathpip noecdxbjtmathpip pl_i lnpop) i.wpisa3, vce(robust)
      /*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) csv */
      esttab using pisa_reg1.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label replace booktabs title(Regression table\label{tab1}) drop(*wpisa*)
      eststo clear
    /*}}}*/
    /*BJ : Ineq. of Effort vs. Ineq. of Env.{{{*/
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp bjcmathpip bjemathpip pl_i lnpop) i.wpisa3, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp bjcmathpip bjemathpip pl_i lnpop) i.wpisa3, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  bjcmathpip bjemathpip pl_i lnpop) i.wpisa3, vce(robust)
      /*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g)*/
      /*eststo clear*/
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxbjcmathpip oecdxbjemathpip noecdxbjcmathpip noecdxbjemathpip pl_i lnpop) i.wpisa3, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxbjcmathpip oecdxbjemathpip noecdxbjcmathpip noecdxbjemathpip pl_i lnpop) i.wpisa3, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxbjcmathpip oecdxbjemathpip noecdxbjcmathpip noecdxbjemathpip pl_i lnpop) i.wpisa3, vce(robust)
      /*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) csv*/
      esttab using pisa_reg2.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label replace booktabs title(Regression table\label{tab1}) drop(*wpisa*)
      eststo clear
    /*}}}*/
    /*FG : Total Ineq.{{{*/
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp fgtmathpip pl_i lnpop) i.wpisa3, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp fgtmathpip pl_i lnpop) i.wpisa3, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  fgtmathpip pl_i lnpop) i.wpisa3, vce(robust)
      /*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g)*/
      /*eststo clear*/
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxfgtmathpip noecdxfgtmathpip pl_i lnpop) i.wpisa3, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxfgtmathpip noecdxfgtmathpip pl_i lnpop) i.wpisa3, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxfgtmathpip noecdxfgtmathpip pl_i lnpop) i.wpisa3, vce(robust)
      /*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) csv*/
      esttab using pisa_reg3.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label replace booktabs title(Regression table\label{tab1}) drop(*wpisa*)
      eststo clear
    /*}}}*/
    /*FG : Ineq. of Effort vs. Ineq. of Env.{{{*/
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp fgcmathpip fgemathpip pl_i lnpop) i.wpisa3, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp fgcmathpip fgemathpip pl_i lnpop) i.wpisa3, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  fgcmathpip fgemathpip pl_i lnpop) i.wpisa3, vce(robust)
      /*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g)*/
      /*eststo clear*/
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxfgcmathpip oecdxfgemathpip noecdxfgcmathpip noecdxfgemathpip pl_i lnpop) i.wpisa3, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxfgcmathpip oecdxfgemathpip noecdxfgcmathpip noecdxfgemathpip pl_i lnpop) i.wpisa3, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxfgcmathpip oecdxfgemathpip noecdxfgcmathpip noecdxfgemathpip pl_i lnpop) i.wpisa3, vce(robust)
      /*esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) csv*/
      esttab using pisa_reg4.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label replace booktabs title(Regression table\label{tab1}) drop(*wpisa*)
      eststo clear
    /*}}}*/
  /*}}}*/
xtset cntcod wtimss4
  /*TIMSS Math{{{*/
    /*BJ : Total Ineq.{{{*/
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp bjtmathtip pl_i lnpop) i.wtimss4, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp bjtmathtip pl_i lnpop) i.wtimss4, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  bjtmathtip pl_i lnpop) i.wtimss4, vce(robust)
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxbjtmathtip noecdxbjtmathtip pl_i lnpop) i.wtimss4, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxbjtmathtip noecdxbjtmathtip pl_i lnpop) i.wtimss4, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxbjtmathtip noecdxbjtmathtip pl_i lnpop) i.wtimss4, vce(robust)
      esttab using timss_reg1.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) ///
        label replace booktabs title(Regression table\label{tab1}) drop(*wpisa*) mtitle("OLS""FE""Sys. GMM""OLS""FE""Sys. GMM")
      eststo clear
    /*}}}*/
    /*BJ : Ineq. of Effort vs. Ineq. of Env.{{{*/
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp bjcmathtip bjemathtip pl_i lnpop) i.wtimss4, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp bjcmathtip bjemathtip pl_i lnpop) i.wtimss4, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  bjcmathtip bjemathtip pl_i lnpop) i.wtimss4, vce(robust)
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxbjcmathtip oecdxbjemathtip noecdxbjcmathtip noecdxbjemathtip pl_i lnpop) i.wtimss4, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxbjcmathtip oecdxbjemathtip noecdxbjcmathtip noecdxbjemathtip pl_i lnpop) i.wtimss4, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxbjcmathtip oecdxbjemathtip noecdxbjcmathtip noecdxbjemathtip pl_i lnpop) i.wtimss4, vce(robust)
      esttab using timss_reg2.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) ///
        label replace booktabs title(Regression table\label{tab1}) drop(*wpisa*) mtitle("OLS""FE""Sys. GMM""OLS""FE""Sys. GMM")
      eststo clear
    /*}}}*/
    /*FG : Total Ineq.{{{*/
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp fgtmathtip pl_i lnpop) i.wtimss4, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp fgtmathtip pl_i lnpop) i.wtimss4, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  fgtmathtip pl_i lnpop) i.wtimss4, vce(robust)
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxfgtmathtip noecdxfgtmathtip pl_i lnpop) i.wtimss4, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxfgtmathtip noecdxfgtmathtip pl_i lnpop) i.wtimss4, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxfgtmathtip noecdxfgtmathtip pl_i lnpop) i.wtimss4, vce(robust)
      esttab using timss_reg3.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) ///
        label replace booktabs title(Regression table\label{tab1}) drop(*wpisa*) mtitle("OLS""FE""Sys. GMM""OLS""FE""Sys. GMM")
      eststo clear
    /*}}}*/
    /*FG : Ineq. of Effort vs. Ineq. of Env.{{{*/
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp fgcmathtip fgemathtip pl_i lnpop) i.wtimss4, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp fgcmathtip fgemathtip pl_i lnpop) i.wtimss4, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  fgcmathtip fgemathtip pl_i lnpop) i.wtimss4, vce(robust)
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxfgcmathtip oecdxfgemathtip noecdxfgcmathtip noecdxfgemathtip pl_i lnpop) i.wtimss4, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxfgcmathtip oecdxfgemathtip noecdxfgcmathtip noecdxfgemathtip pl_i lnpop) i.wtimss4, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxfgcmathtip oecdxfgemathtip noecdxfgcmathtip noecdxfgemathtip pl_i lnpop) i.wtimss4, vce(robust)
      esttab using timss_reg4.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) ///
        label replace booktabs title(Regression table\label{tab1}) drop(*wpisa*) mtitle("OLS""FE""Sys. GMM""OLS""FE""Sys. GMM")
      eststo clear
    /*}}}*/
  /*}}}*/
  /*TIMSS Science{{{*/
    /*BJ : Total Ineq.{{{*/
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp bjtscietip pl_i lnpop) i.wtimss4, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp bjtscietip pl_i lnpop) i.wtimss4, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  bjtscietip pl_i lnpop) i.wtimss4, vce(robust)
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxbjtscietip noecdxbjtscietip pl_i lnpop) i.wtimss4, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxbjtscietip noecdxbjtscietip pl_i lnpop) i.wtimss4, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxbjtscietip noecdxbjtscietip pl_i lnpop) i.wtimss4, vce(robust)
      esttab using timss_reg5.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) ///
        label replace booktabs title(Regression table\label{tab1}) drop(*wpisa*) mtitle("OLS""FE""Sys. GMM""OLS""FE""Sys. GMM")
      eststo clear
    /*}}}*/
    /*BJ : Ineq. of Effort vs. Ineq. of Env.{{{*/
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp bjcscietip bjescietip pl_i lnpop) i.wtimss4, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp bjcscietip bjescietip pl_i lnpop) i.wtimss4, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  bjcscietip bjescietip pl_i lnpop) i.wtimss4, vce(robust)
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxbjcscietip oecdxbjescietip noecdxbjcscietip noecdxbjescietip pl_i lnpop) i.wtimss4, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxbjcscietip oecdxbjescietip noecdxbjcscietip noecdxbjescietip pl_i lnpop) i.wtimss4, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxbjcscietip oecdxbjescietip noecdxbjcscietip noecdxbjescietip pl_i lnpop) i.wtimss4, vce(robust)
      esttab using timss_reg6.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) ///
        label replace booktabs title(Regression table\label{tab1}) drop(*wpisa*) mtitle("OLS""FE""Sys. GMM""OLS""FE""Sys. GMM")
      eststo clear
    /*}}}*/
    /*FG : Total Ineq.{{{*/
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp fgtscietip pl_i lnpop) i.wtimss4, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp fgtscietip pl_i lnpop) i.wtimss4, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  fgtscietip pl_i lnpop) i.wtimss4, vce(robust)
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxfgtscietip noecdxfgtscietip pl_i lnpop) i.wtimss4, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxfgtscietip noecdxfgtscietip pl_i lnpop) i.wtimss4, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxfgtscietip noecdxfgtscietip pl_i lnpop) i.wtimss4, vce(robust)
      esttab using timss_reg7.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) ///
        label replace booktabs title(Regression table\label{tab1}) drop(*wpisa*) mtitle("OLS""FE""Sys. GMM""OLS""FE""Sys. GMM")
      eststo clear
    /*}}}*/
    /*FG : Ineq. of Effort vs. Ineq. of Env.{{{*/
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp fgcscietip fgescietip pl_i lnpop) i.wtimss4, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp fgcscietip fgescietip pl_i lnpop) i.wtimss4, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  fgcscietip fgescietip pl_i lnpop) i.wtimss4, vce(robust)
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxfgcscietip oecdxfgescietip noecdxfgcscietip noecdxfgescietip pl_i lnpop) i.wtimss4, rob
      eststo: quietly xi: xtreg      	   lnpcgdp L.(lnpcgdp oecdxfgcscietip oecdxfgescietip noecdxfgcscietip noecdxfgescietip pl_i lnpop) i.wtimss4, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		  oecdxfgcscietip oecdxfgescietip noecdxfgcscietip noecdxfgescietip pl_i lnpop) i.wtimss4, vce(robust)
      esttab using timss_reg8.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) ///
        label replace booktabs title(Regression table\label{tab1}) drop(*wpisa*) mtitle("OLS""FE""Sys. GMM""OLS""FE""Sys. GMM")
      eststo clear
    /*}}}*/
  /*}}}*/
