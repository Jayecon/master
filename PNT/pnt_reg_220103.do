  cd ~/dropbox/pnt
  use pnt_regdata.dta , clear
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
    label var oecdxbjtmathp   "OECD $\times$ 총불평등"
    label var noecdxbjtmathp  "비OECD $\times$ 총불평등"
    label var bjtmathp        "총불평등"
    label var bjcmathp        "기회불평등"
    label var bjemathp        "잔여불평등"
    label var oecdxbjcmathp   "OECD $\times$ 기회불평등"
    label var oecdxbjemathp   "OECD $\times$ 잔여불평등"
    label var noecdxbjcmathp  "비OECD $\times$ 기회불평등"
    label var noecdxbjemathp  "비OECD $\times$ 잔여불평등"
    label var oecdxbjtmatht   "OECD $\times$ 총불평등"
    label var noecdxbjtmatht  "비OECD $\times$ 총불평등"
    label var bjtmatht        "총불평등"
    label var bjcmatht        "기회불평등"
    label var bjematht        "잔여불평등"
    label var oecdxbjcmatht   "OECD $\times$ 기회불평등"
    label var oecdxbjematht   "OECD $\times$ 잔여불평등"
    label var noecdxbjcmatht  "비OECD $\times$ 기회불평등"
    label var noecdxbjematht  "비OECD $\times$ 잔여불평등"
    label var oecdxfgtmathpip   "OECD $\times$ 총불평등"
    label var noecdxfgtmathpip  "비OECD $\times$ 총불평등"
    label var fgtmathpip        "총불평등"
    label var fgcmathpip        "기회불평등"
    label var fgemathpip        "잔여불평등"
    label var oecdxfgcmathpip   "OECD $\times$ 기회불평등"
    label var oecdxfgemathpip   "OECD $\times$ 잔여불평등"
    label var noecdxfgcmathpip  "비OECD $\times$ 기회불평등"
    label var noecdxfgemathpip  "비OECD $\times$ 잔여불평등"
    label var oecdxfgtmathtip   "OECD $\times$ 총불평등"
    label var noecdxfgtmathtip  "비OECD $\times$ 총불평등"
    label var fgtmathtip        "총불평등"
    label var fgcmathtip        "기회불평등"
    label var fgemathtip        "잔여불평등"
    label var oecdxfgcmathtip   "OECD $\times$ 기회불평등"
    label var oecdxfgemathtip   "OECD $\times$ 잔여불평등"
    label var noecdxfgcmathtip  "비OECD $\times$ 기회불평등"
    label var noecdxfgemathtip  "비OECD $\times$ 잔여불평등"
    label var oecdxfgtmathp   "OECD $\times$ 총불평등"
    label var noecdxfgtmathp  "비OECD $\times$ 총불평등"
    label var fgtmathp        "총불평등"
    label var fgcmathp        "기회불평등"
    label var fgemathp        "잔여불평등"
    label var oecdxfgcmathp   "OECD $\times$ 기회불평등"
    label var oecdxfgemathp   "OECD $\times$ 잔여불평등"
    label var noecdxfgcmathp  "비OECD $\times$ 기회불평등"
    label var noecdxfgemathp  "비OECD $\times$ 잔여불평등"
    label var oecdxfgtmatht   "OECD $\times$ 총불평등"
    label var noecdxfgtmatht  "비OECD $\times$ 총불평등"
    label var fgtmatht        "총불평등"
    label var fgcmatht        "기회불평등"
    label var fgematht        "잔여불평등"
    label var oecdxfgcmatht   "OECD $\times$ 기회불평등"
    label var oecdxfgematht   "OECD $\times$ 잔여불평등"
    label var noecdxfgcmatht  "비OECD $\times$ 기회불평등"
    label var noecdxfgematht  "비OECD $\times$ 잔여불평등"
  /*}}}*/
 /*PISA Math{{{*/
    xtset cntcod wpisa3
    /*BJ : Total Ineq.{{{*/
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp bjtmathpip                  pl_i lnpop) i.wpisa3, rob
      eststo: quietly xi: xtreg      	 lnpcgdp L.(lnpcgdp bjtmathpip                  pl_i lnpop) i.wpisa3, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		    bjtmathpip                  pl_i lnpop) i.wpisa3, vce(robust)
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxbjtmathp bjtmathp oecd pl_i lnpop) i.wpisa3, rob
      eststo: quietly xi: xtreg        lnpcgdp L.(lnpcgdp oecdxbjtmathp bjtmathp oecd pl_i lnpop) i.wpisa3, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(	  	  oecdxbjtmathp bjtmathp oecd pl_i lnpop) i.wpisa3, vce(robust)
      esttab , se drop(*wpisa*) star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label mtitle("OLS""FE""Sys.GMM""OLS""FE""Sys. GMM")
	  esttab using pisa_reg1.tex, se drop(*wpisa*) star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label ///
        mtitle("OLS""FE""Sys. GMM""OLS""FE""Sys. GMM") replace title(회귀분석 결과 : PISA, 총불평등 \label{tab:pisa_reg1})
      eststo clear
    /*}}}*/
    /*BJ : Ineq. of Effort vs. Ineq. of Env.{{{*/
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp                             bjcmathp bjemathp      pl_i lnpop) i.wpisa3, rob
      eststo: quietly xi: xtreg        lnpcgdp L.(lnpcgdp                             bjcmathp bjemathp      pl_i lnpop) i.wpisa3, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(	                              	  bjcmathp bjemathp      pl_i lnpop) i.wpisa3, vce(robust)
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxbjcmathp oecdxbjemathp bjcmathp bjemathp oecd pl_i lnpop) i.wpisa3, rob
      eststo: quietly xi: xtreg        lnpcgdp L.(lnpcgdp oecdxbjcmathp oecdxbjemathp bjcmathp bjemathp oecd pl_i lnpop) i.wpisa3, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(	   	  oecdxbjcmathp oecdxbjemathp bjcmathp bjemathp oecd pl_i lnpop) i.wpisa3, vce(robust)
      esttab , se drop(*wpisa*) star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label mtitle("OLS""FE""Sys.GMM""OLS""FE""Sys. GMM")
      esttab using pisa_reg2.tex, se drop(*wpisa*) star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label ///
        mtitle("OLS""FE""Sys. GMM""OLS""FE""Sys. GMM") replace title(회귀분석 결과 : PISA, 기회 vs. 잔여불평등 \label{tab:pisa_reg2}) 
	  eststo clear
    /*}}}*/
  /*}}}*/
  /*TIMSS Math{{{*/
    xtset cntcod wtimss4
    /*BJ : Total Ineq.{{{*/
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp               bjtmatht      pl_i lnpop) i.wtimss4, rob
      eststo: quietly xi: xtreg        lnpcgdp L.(lnpcgdp               bjtmatht      pl_i lnpop) i.wtimss4, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(	  	                bjtmatht      pl_i lnpop) i.wtimss4, vce(robust)
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxbjtmatht bjtmatht oecd pl_i lnpop) i.wtimss4, rob
      eststo: quietly xi: xtreg        lnpcgdp L.(lnpcgdp oecdxbjtmatht bjtmatht oecd pl_i lnpop) i.wtimss4, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(	  	  oecdxbjtmatht bjtmatht oecd pl_i lnpop) i.wtimss4, vce(robust)
      esttab , se drop(*timss*) star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label mtitle("OLS""FE""Sys.GMM""OLS""FE""Sys. GMM")
      esttab using timss_reg1.tex, se drop(*wtimss*) star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label ///
        mtitle("OLS""FE""Sys. GMM""OLS""FE""Sys. GMM") replace title(회귀분석 결과 : TIMSS, 총불평등 \label{tab:timss_reg1}) 
	  eststo clear
    /*}}}*/
    /*BJ : Ineq. of Effort vs. Ineq. of Env.{{{*/
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp                             bjcmatht bjematht      pl_i lnpop) i.wtimss4, rob
      eststo: quietly xi: xtreg        lnpcgdp L.(lnpcgdp                             bjcmatht bjematht      pl_i lnpop) i.wtimss4, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(  		                              bjcmatht bjematht      pl_i lnpop) i.wtimss4, vce(robust)
      eststo: quietly xi: reg      	   lnpcgdp L.(lnpcgdp oecdxbjcmatht oecdxbjematht bjcmatht bjematht oecd pl_i lnpop) i.wtimss4, rob
      eststo: quietly xi: xtreg        lnpcgdp L.(lnpcgdp oecdxbjcmatht oecdxbjematht bjcmatht bjematht oecd pl_i lnpop) i.wtimss4, fe
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(  		  oecdxbjcmatht oecdxbjematht bjcmatht bjematht oecd pl_i lnpop) i.wtimss4, vce(robust)
      esttab , se drop(*timss*) star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label mtitle("OLS""FE""Sys.GMM""OLS""FE""Sys. GMM")
      esttab using timss_reg2.tex, se drop(*timss*) star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g)b label ///
        mtitle("OLS""FE""Sys. GMM""OLS""FE""Sys. GMM") replace title(회귀분석 결과 : PISA, 기회 vs. 잔여불평등 \label{tab:timss_reg2}) 
	 eststo clear
    /*}}}*/
  /*}}}*/
  /*Robustness Check{{{*/
    /*PISA indicies{{{*/
      xtset cntcod wpisa3
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(              bjtmathp                                                   pl_i lnpop) i.wpisa3, vce(robust)
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(              fgtmathp                                                   pl_i lnpop) i.wpisa3, vce(robust)
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(oecdxbjtmathp bjtmathp                                              oecd pl_i lnpop) i.wpisa3, vce(robust)
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(oecdxfgtmathp fgtmathp                                              oecd pl_i lnpop) i.wpisa3, vce(robust)
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(                                                  bjcmathp bjemathp      pl_i lnpop) i.wpisa3, vce(robust)
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(                                                  fgcmathp fgemathp      pl_i lnpop) i.wpisa3, vce(robust)
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(                      oecdxbjcmathp oecdxbjemathp bjcmathp bjemathp oecd pl_i lnpop) i.wpisa3, vce(robust)
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(                      oecdxfgcmathp oecdxfgemathp fgcmathp fgemathp oecd pl_i lnpop) i.wpisa3, vce(robust)
      esttab , se drop(*wpisa*) star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label mtitle("BJ지수""FG지수""BJ지수""FG지수""BJ지수""FG지수""BJ지수""FG지수")
      esttab using pisa_reg_rob1.tex, se drop(*wpisa*) star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label replace ///
        mtitle("BJ지수""FG지수""BJ지수""FG지수""BJ지수""FG지수""BJ지수""FG지수") title(회귀분석 결과 : PISA, 지수비교 \label{tab:pisa_reg_rob1}) 
      eststo clear
    /*}}}*/
    /*TIMSS indicies{{{*/
      xtset cntcod wtimss4
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		          bjtmatht                                                   pl_i lnpop) i.wtimss4, vce(robust)
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(		          fgtmatht                                                   pl_i lnpop) i.wtimss4, vce(robust)
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(oecdxbjtmatht bjtmatht                                              oecd pl_i lnpop) i.wtimss4, vce(robust)
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(oecdxfgtmatht fgtmatht                                              oecd pl_i lnpop) i.wtimss4, vce(robust)
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(	                                              	bjcmatht bjematht      pl_i lnpop) i.wtimss4, vce(robust)
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(	                                              	fgcmatht fgematht      pl_i lnpop) i.wtimss4, vce(robust)
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(	                 	  oecdxbjcmatht oecdxbjematht bjcmatht bjematht oecd pl_i lnpop) i.wtimss4, vce(robust)
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(                 		  oecdxfgcmatht oecdxfgematht fgcmatht fgematht oecd pl_i lnpop) i.wtimss4, vce(robust)
      esttab , se drop(*wtimss*) star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label mtitle("BJ지수""FG지수""BJ지수""FG지수""BJ지수""FG지수""BJ지수""FG지수")
      esttab using timss_reg_rob1.tex, se drop(*wtimss*) star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label replace ///
        mtitle("BJ지수""FG지수""BJ지수""FG지수""BJ지수""FG지수""BJ지수""FG지수") title(회귀분석 결과 : TIMSS, 지수비교 \label{tab:timss_reg_rob1}) 
      eststo clear
    /*}}}*/
    /*PISA times{{{*/
      xtset cntcod wpisa3
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(                bjtmathpip                                                            pl_i lnpop) i.wpisa3, vce(robust)
      xtset cntcod wpisa4                                         
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(                bjtmathpip                                                            pl_i lnpop) i.wpisa4, vce(robust)
      xtset cntcod wpisa5                                         
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(                bjtmathpip                                                            pl_i lnpop) i.wpisa5, vce(robust)
      xtset cntcod wpisa3
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(oecdxbjtmathpip bjtmathpip                                                       oecd pl_i lnpop) i.wpisa3, vce(robust)
      xtset cntcod wpisa4
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(oecdxbjtmathpip bjtmathpip                                                       oecd pl_i lnpop) i.wpisa4, vce(robust)
      xtset cntcod wpisa5
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(oecdxbjtmathpip bjtmathpip                                                       oecd pl_i lnpop) i.wpisa5, vce(robust)
      xtset cntcod wpisa3
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(                                                           bjcmathpip bjemathpip      pl_i lnpop) i.wpisa3, vce(robust)
      xtset cntcod wpisa4                                                    
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(                                                           bjcmathpip bjemathpip      pl_i lnpop) i.wpisa4, vce(robust)
      xtset cntcod wpisa5                                                    
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(                                                           bjcmathpip bjemathpip      pl_i lnpop) i.wpisa5, vce(robust)
      xtset cntcod wpisa3                                                    
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(                           oecdxbjcmathpip oecdxbjemathpip bjcmathpip bjemathpip oecd pl_i lnpop) i.wpisa3, vce(robust)
      xtset cntcod wpisa4                                                    
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(                           oecdxbjcmathpip oecdxbjemathpip bjcmathpip bjemathpip oecd pl_i lnpop) i.wpisa4, vce(robust)
      xtset cntcod wpisa5                                                    
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(                           oecdxbjcmathpip oecdxbjemathpip bjcmathpip bjemathpip oecd pl_i lnpop) i.wpisa5, vce(robust)
      esttab , se drop(*wpisa*) star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label mtitle("3년후""4년후""5년후""3년후""4년후""5년후""3년후""4년후""5년후""3년후""4년후""5년후")
      esttab using pisa_reg_rob2.tex, se drop(*wpisa*) star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label replace ///
        mtitle("3년후""4년후""5년후""3년후""4년후""5년후""3년후""4년후""5년후""3년후""4년후""5년후") title(회귀분석 결과 : PISA, 시점비교 \label{tab:pisa_reg_rob2}) 
      eststo clear
    /*}}}*/
    /*TIMSS times{{{*/
      xtset cntcod wtimss3
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(                bjtmathtip                                                            pl_i lnpop) i.wtimss3, vce(robust)
      xtset cntcod wtimss4
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(                bjtmathtip                                                            pl_i lnpop) i.wtimss4, vce(robust)
      xtset cntcod wtimss5
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(                bjtmathtip                                                            pl_i lnpop) i.wtimss5, vce(robust)
      xtset cntcod wtimss3
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(oecdxbjtmathtip bjtmathtip                                                       oecd pl_i lnpop) i.wtimss3, vce(robust)
      xtset cntcod wtimss4                                                                                                          
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(oecdxbjtmathtip bjtmathtip                                                       oecd pl_i lnpop) i.wtimss4, vce(robust)
      xtset cntcod wtimss5                                                                                                          
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(oecdxbjtmathtip bjtmathtip                                                       oecd pl_i lnpop) i.wtimss5, vce(robust)
      xtset cntcod wtimss3
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(                                                          bjcmathtip bjemathtip       pl_i lnpop) i.wtimss3, vce(robust)
      xtset cntcod wtimss4
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(                                                          bjcmathtip bjemathtip       pl_i lnpop) i.wtimss4, vce(robust)
      xtset cntcod wtimss5
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(                                                          bjcmathtip bjemathtip       pl_i lnpop) i.wtimss5, vce(robust)
      xtset cntcod wtimss3
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(                           oecdxbjcmathtip oecdxbjemathtip bjcmathtip bjemathtip oecd pl_i lnpop) i.wtimss3, vce(robust)
      xtset cntcod wtimss4                                                                                                         
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(                           oecdxbjcmathtip oecdxbjemathtip bjcmathtip bjemathtip oecd pl_i lnpop) i.wtimss4, vce(robust)
      xtset cntcod wtimss5                                                                                                         
      eststo: quietly xi: xtdpdsys 	   lnpcgdp L.(                           oecdxbjcmathtip oecdxbjemathtip bjcmathtip bjemathtip oecd pl_i lnpop) i.wtimss5, vce(robust)
      esttab using timss_reg_rob2.tex, bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) ///
        label replace booktabs title(회귀분석 결과 : TIMSS, 시점비교 \label{tab1}) drop(*wtimss*) mtitle("3년후""4년후""5년후""3년후""4년후""5년후""3년후""4년후""5년후""3년후""4년후""5년후")
      eststo clear
    /*}}}*/
  /*}}}*/
