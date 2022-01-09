  cd ~/dropbox
  use "~/Dropbox/PNT/raw_pnt_index.dta" , clear
  /*Reshape data to wide{{{*/
    label data "불평등지수 환경:소유,도서,부모교육,이민"
      drop ??2?
      keep if group == 2
      rename ??1? ???
      drop group
      drop wave
      replace subject = subject + 90
    reshape wide goi-bje , i(dbname cntab3 year) j(subject)
      rename *91 *math
      rename *92 *scie
      rename *93 *read
      rename *94 *masc
      rename *95 *mrsc
      replace dbname = dbname + 90
    reshape wide goimath-bjemrsc , i(cntab3 year) j(dbname)
      rename *91 *p
      rename *92 *t
    order cntab3 contcode year cntcod cntab2 country continent , first
    foreach i of varlist goimathp - bjemrsct {
      label var `i' ""
    }
  /*}}}*/
  /*Lable indicies{{{*/
    foreach i in goi rri fgc fge fgr fgt bjc bje bjr bjt {
      if "`i'" == "goi" {/*{{{*/
        local lindex1 "지니기회불평등지수"
      }
      if "`i'" == "rri" {
        local lindex1 "개천용기회불평등지수"
      }
      if "`i'" == "fgc" {
        local lindex1 "FG기회불평등지수"
      }
      if "`i'" == "fgt" {
        local lindex1 "FG총불평등지수"
      }
      if "`i'" == "fgr" {
        local lindex1 "FG기회불평등비중"
      }
      if "`i'" == "fge" {
        local lindex1 "FG노력불평등지수"
      }
      if "`i'" == "bjc" {
        local lindex1 "BJ기회불평등지수"
      }
      if "`i'" == "bjt" {
        local lindex1 "BJ총불평등지수"
      }
      if "`i'" == "bjr" {
        local lindex1 "BJ기회불평등비중"
      }
      if "`i'" == "bje" {
        local lindex1 "BJ노력불평등지수"
      } /*}}}*/
      foreach j in math scie read masc mrsc {
        if "`j'" == "math" {/*{{{*/
          local lindex2 "수학"
        }
        if "`j'" == "scie" {
          local lindex2 "과학"
        }
        if "`j'" == "read" {
          local lindex2 "읽기"
        }
        if "`j'" == "masc" {
          local lindex2 "수학과학평균"
        }
        if "`j'" == "mrsc" {
          local lindex2 "읽기수학과학평균"
        } /*}}}*/
        foreach k in p t {
          if "`k'" == "p" {/*{{{*/
            local lindex3 "PISA"
          }
          if "`k'" == "t" {
            local lindex3 "TIMSS"
          } /*}}}*/
          label var `i'`j'`k' "`lindex1' : `lindex2', `lindex3'"
        }
      }
    }
  /*}}}*/
  save "~/Dropbox/PNT/pnt_index.dta" , replace
  /*Merge PWT and the Data{{{*/
    use data/pwt100
    rename countrycode cntab3
    merge 1:1 cntab3 year using pnt/pnt_index
    bys cntab3 : egen temp3 = max(cntcod)
    replace cntcod = temp3
    egen temp1 = rownonmiss(goimath?)
    bys cntcod : egen temp2 = max(temp1)
    drop if !temp2
  /*}}}*/
  /*Generate Macro Variables{{{*/
    xtset cntcod year
    gen pcgdp = rgdpo/pop
      /*label var pcgdp "Output-side per capita real GDP at chained PPPs (in mil. 2017US$)"*/
      label var pcgdp "1인당GDP"
    gen lnpcgdp = ln(pcgdp)
      /*label var pcgdp "log of per capita GDP"*/
      label var lnpcgdp "ln1인당GDP"
    gen lngdp = ln(rgdpo)
      /*label var pcgdp "log of GDP"*/
      label var lngdp "ln실질GDP"
    gen pcgrowth = lnpcgdp - l.lnpcgdp
      /*label var pcgrowth "Per capita GDP growth rate"*/
      label var pcgrowth "1인당GDP성장률"
    gen growth = lngdp - l.lngdp
      /*label var growth "GDP growth rate"*/
      label var growth "GDP성장률"
    gen lnpop = ln(pop)
      /*label var lnpop "log of Population"*/
      label var lnpop "ln인구수"
  /*}}}*/
  /*Generate Survey year Dummies{{{*/
    qui reg goimathp goimatht
      gen ypnt = e(sample)
      label var ypnt "TIMSS&PISA year"
    qui reg goimathp
      gen ypisa = e(sample)
      label var ypisa "PISA year"
    qui reg goimatht
      gen ytimss = e(sample)
      label var ytimss "TIMSS year"
    drop if !inrange(year , 1994 ,  2019)
    drop _merge
    drop temp?
  /*}}}*/
  /*Generate Servey Wave Variables{{{*/
    foreach i in 3 4 5 6 {
      gen wpisa`i' = ceil((year-1999)/`i')
      gen t = mod(year-2000,`i') 
      replace wpisa`i'= . if t != 0
      replace wpisa`i'= . if wpisa`i' <= 0
      label var wpisa`i'"PISA wave`i'"
      drop t
    }
    foreach i in 3 4 5 6 {
      gen wtimss`i' = ceil((year-1994)/`i')
      gen t = mod(year-1995,`i') 
      replace wtimss`i' = . if t != 0
      replace wtimss`i' = . if wtimss`i' <= 0
      label var wtimss`i' "TIMSS wave`i'"
      drop t
    }
  /*}}}*/
  /*Generate interpolated indicies{{{*/
    xtset cntcod year
    foreach i in goi rri fgc fge fgr fgt bjc bje bjr bjt {
      foreach j in math scie read masc mrsc {
        foreach k in p t {
          local temp : var label `i'`j'`k'
          by cntcod : ipolate `i'`j'`k' year , gen (`i'`j'`k'ip)
          label var `i'`j'`k'ip "`temp', ip"
        }
      }
    }
  /*}}}*/
  drop ???readt ???mrsct
  /*Generate OECD variables{{{*/
    merge 1:1 cntcod year using "~/dropbox/data_extras/oecdlist_long.dta"
      drop if _merge == 2
      drop _merge
      replace oecd = 0 if missing(oecd)
      label var oecd "OECD"
    foreach i of varlist goimathp-bjtmrsctip {
      gen oecdx`i' = oecd*`i'
      gen noecdx`i' = (1-oecd)*`i'
    }
  /*}}}*/
  save "~/Dropbox/PNT/pnt_regdata.dta" , replace
