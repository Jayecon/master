  cd ~/dropbox
  use pnt/pnt_regdata , clear
  /*Gen pisa_regdata.dta{{{*/
  merge 1:1 cntcod year using "~/dropbox/data_extras/oecdlist_long.dta"
    drop if _merge == 2
    drop _merge
    replace oecd = 0 if missing(oecd)
    label var oecd "OECD"
  gen wpisa = ceil((year-1999)/3)
    gen t = mod(year-2000,3) 
    replace wpisa = . if t != 0
    replace wpisa = . if wpisa <= 0
    label var wpisa "PISA wave"
  xtset cntcod year
  foreach i of varlist goimathp-bjemrscp {
    forvalue j =1/2 {
      gen `i'_f`j'= f`j'.`i'
    }
    egen `i'_f = rowfirst(`i'_f?)
    replace `i'_f = . if ypisa
  }
  foreach i of varlist goimathp-bjemrscp {
    forvalue j =1/2{
      gen `i'_l`j'= l`j'.`i'
    }
    egen `i'_l = rowfirst(`i'_l?)
    replace `i'_f = . if ypisa
  }
  foreach i of varlist goimathp-bjemrscp {
      gen `i'_n = `i'_l + (`i'_f - `i'_l)*t/3
      replace `i'_n = `i' if t == 0
  }
  keep if wpisa

  foreach i of varlist goimathp_n-bjemrscp_n {
    gen oecdx`i' = oecd*`i'
    gen noecdx`i' = (1-oecd)*`i'
  }

  save pisa/pisa_regdata.dta , replace
  /*}}}*/
  /*Gen timss_regdata.dta{{{*/
  use pnt/pnt_regdata , clear

  merge 1:1 cntcod year using "~/dropbox/data_extras/oecdlist_long.dta"

  drop if _merge == 2
  drop _merge
  replace oecd = 0 if missing(oecd)

  gen wtimss = ceil((year-1994)/4)
  gen t = mod(year-1995,4) 
  replace wtimss = . if t != 0
  replace wtimss = . if wtimss <= 0

  xtset cntcod year

  foreach i of varlist goimatht-bjemasct {
    forvalue j =1/3 {
      gen `i'_f`j'= f`j'.`i'
    }
    egen `i'_f = rowfirst(`i'_f?)
    replace `i'_f = . if ytimss
  }

  foreach i of varlist goimatht-bjemasct {
    forvalue j =1/3{
      gen `i'_l`j'= l`j'.`i'
    }
    egen `i'_l = rowfirst(`i'_l?)
    replace `i'_f = . if ytimss
  }
  foreach i of varlist goimatht-bjemasct {
      gen `i'_n = `i'_l + (`i'_f - `i'_l)*t/4
      replace `i'_n = `i' if t == 0
  }
  keep if wtimss

  foreach i of varlist goimatht_n-bjemasct_n {
    gen oecdx`i' = oecd*`i'
    gen noecdx`i' = (1-oecd)*`i'
  }
  save timss/timss_regdata.dta , replace
  /*}}}*/
