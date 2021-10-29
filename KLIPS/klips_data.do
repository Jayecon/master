set more off
clear

cd ~/dropbox/klips ///pwd;원자료는 pwd의 하위폴더 rawdata에 있다고 가정함.
local fwave  1	/*조사시작회차 입력*/
local lwave  22 /*조사최신회차 입력*/
tempfile temp

  forvalues x = `fwave'/`lwave' {
    local yr : disp %02.0f  = `x'
    /* 조사년도별 가구파일 조작{{{*/
      use rawdata/klips`yr'h
      /*가구파일에서 필요변수 선정{{{*/
      local h`yr'vars hhid`yr' hwave`yr' orghid?? sample?? hwaveent w`yr'h 
        lookfor "가구원수"
        local h`yr'vars `h`yr'vars' `r(varlist)'
        lookfor "PID"
        local h`yr'vars `h`yr'vars' `r(varlist)'
        lookfor "소득(만)"
        local h`yr'vars `h`yr'vars' `r(varlist)'
        lookfor "금액(만)"
        local h`yr'vars `h`yr'vars' `r(varlist)'
        lookfor "소득액수(만)"
        local h`yr'vars `h`yr'vars' `r(varlist)'
        lookfor "지원금(만)"
        local h`yr'vars `h`yr'vars' `r(varlist)'
        lookfor "수급액"
        local h`yr'vars `h`yr'vars' `r(varlist)'
        lookfor "가중치"
        local h`yr'vars `h`yr'vars' `r(varlist)'
        /*}}}*/
      /*항목별 가구소득합계 및 가구총소득 변수 생성 {{{*/
        if `x' ==1 {/*{{{*/
          recode h`yr'2102      ///
            h`yr'2112           ///
            h`yr'2122           ///
            h`yr'2270-h`yr'2287 ///
            h`yr'2152           ///
            h`yr'2182 (-1=.)
          gen inc`yr'_e = h`yr'2102                                                                   /*earned income*/
          egen inc`yr'_m = rowtotal(h`yr'2112),missing                                                /*financial income*/
          egen inc`yr'_p = rowtotal(h`yr'2122),missing                                                /*real estate income*/
          egen inc`yr'_i = rowtotal(h`yr'2270-h`yr'2287),missing                                      /*social insurance*/
          egen inc`yr'_t = rowtotal(h`yr'2152),missing
          replace inc`yr'_t = inc`yr'_t*12                                                            /*transfer income*/
          egen inc`yr'_o = rowtotal(h`yr'2182),missing
          replace inc`yr'_o = inc`yr'_o*12                                                            /*other income*/
          egen inc`yr'_h = rowtotal(inc`yr'_e inc`yr'_m inc`yr'_p inc`yr'_i inc`yr'_t inc`yr'_o),mis  /*annual total income*/
          }/*}}}*/
        else if `x' <= 3 {/*{{{*/
          recode h`yr'2102                ///
            h`yr'2112-h`yr'2116           ///
            h`yr'2122-h`yr'2126           ///
            h`yr'2134 h`yr'2136 h`yr'2138 ///
            h`yr'2152 h`yr'2155-h`yr'2160 ///
            h`yr'2182-h`yr'2191 (-1=.)
          gen inc`yr'_e = h`yr'2102                                                                    /*earned income*/
          egen inc`yr'_m = rowtotal(h`yr'2112-h`yr'2116),missing                                       /*financial income*/
          egen inc`yr'_p = rowtotal(h`yr'2122-h`yr'2126),missing                                       /*real estate income*/
          egen inc`yr'_i = rowtotal(h`yr'2134 h`yr'2136 h`yr'2138),missing                             /*social insurance*/
          egen inc`yr'_t = rowtotal(h`yr'2152 h`yr'2155-h`yr'2160),missing                             /*transfer income*/
          egen inc`yr'_o = rowtotal(h`yr'2182-h`yr'2191),missing                                       /*other income*/
          egen inc`yr'_h = rowtotal(inc`yr'_e inc`yr'_m inc`yr'_p inc`yr'_i inc`yr'_t inc`yr'_o),mis   /*annual total income*/
          }/*}}}*/
        else if `x' <= 5 {/*{{{*/
          recode h`yr'2102 ///
            h`yr'2112-h`yr'2116                     ///
            h`yr'2122-h`yr'2126                     ///
            h`yr'2134 h`yr'2136 h`yr'2138 h`yr'2140 ///
            h`yr'2152-h`yr'2160                     ///
            h`yr'2182-h`yr'2191 (-1=.)
          gen inc`yr'_e = h`yr'2102                                                                   /*earned income*/
          egen inc`yr'_m = rowtotal(h`yr'2112-h`yr'2116),missing                                      /*financial income*/
          egen inc`yr'_p = rowtotal(h`yr'2122-h`yr'2126),missing                                      /*real estate income*/
          egen inc`yr'_i = rowtotal(h`yr'2134 h`yr'2136 h`yr'2138 h`yr'2140 ),missing                 /*social insurance*/
          egen inc`yr'_t = rowtotal(h`yr'2152-h`yr'2160),missing                                      /*transfer income*/
          egen inc`yr'_o = rowtotal(h`yr'2182-h`yr'2191),missing                                      /*other income*/
          egen inc`yr'_h = rowtotal(inc`yr'_e inc`yr'_m inc`yr'_p inc`yr'_i inc`yr'_t inc`yr'_o),mis  /*annual total income*/
          }/*}}}*/
        else if `x' <= 8 {/*{{{*/
          recode h`yr'2102 ///
            h`yr'2112-h`yr'2116 ///
            h`yr'2122-h`yr'2126 ///
            h`yr'2134 h`yr'2136 h`yr'2138 h`yr'2140 h`yr'2142 ///
            h`yr'2152-h`yr'2160 ///
            h`yr'2182-h`yr'2191 (-1=.)
          gen inc`yr'_e = h`yr'210210                                                                 /*earned income*/
          egen inc`yr'_m = rowtotal(h`yr'2112-h`yr'2116),missing                                      /*financial income*/
          egen inc`yr'_p = rowtotal(h`yr'2122-h`yr'2126),missing                                      /*real estate income*/
          egen inc`yr'_i = rowtotal(h`yr'2134 h`yr'2136 h`yr'2138 h`yr'2140 h`yr'2142),missing        /*social insurance*/
          egen inc`yr'_t = rowtotal(h`yr'2152-h`yr'2160 ),missing                                     /*transfer income*/
          egen inc`yr'_o = rowtotal(h`yr'2182-h`yr'2191),missing                                      /*other income*/
          egen inc`yr'_h = rowtotal(inc`yr'_e inc`yr'_m inc`yr'_p inc`yr'_i inc`yr'_t inc`yr'_o),mis  /*annual total income*/
          }/*}}}*/
        else if `x' <= 12 {/*{{{*/
          recode h`yr'2102 ///
            h`yr'2112-h`yr'2116 ///
            h`yr'2122-h`yr'2126 ///
            h`yr'2134 h`yr'2136 h`yr'2138 h`yr'2140 h`yr'2142 ///
            h`yr'2152-h`yr'2160 ///
            h`yr'2183-h`yr'2191 (-1=.)
          gen inc`yr'_e = h`yr'2102 /*earned income*/
          egen inc`yr'_m = rowtotal(h`yr'2112-h`yr'2116),missing /*financial income*/
          egen inc`yr'_p = rowtotal(h`yr'2122-h`yr'2126),missing /*real estate income*/
          egen inc`yr'_i = rowtotal(h`yr'2134 h`yr'2136 h`yr'2138 h`yr'2140 h`yr'2142),missing /*social insurance*/
          egen inc`yr'_t = rowtotal(h`yr'2152-h`yr'2160 ),missing /*transfer income*/
          egen inc`yr'_o = rowtotal(h`yr'2183-h`yr'2191),missing /*other income*/
          egen inc`yr'_h = rowtotal(inc`yr'_e inc`yr'_m inc`yr'_p inc`yr'_i inc`yr'_t inc`yr'_o),mis /*annual total income*/
          }/*}}}*/
        else {/*{{{*/
          recode h`yr'2102 ///
            h`yr'2112-h`yr'2116 ///
            h`yr'2122-h`yr'2126 ///
            h`yr'2134 h`yr'2136 h`yr'2138 h`yr'2140 h`yr'2142 ///
            h`yr'2152-h`yr'2160 h`yr'4002 ///
            h`yr'2183-h`yr'2191 (-1=.)
          gen inc`yr'_e = h`yr'2102 /*earned income*/
          egen inc`yr'_m = rowtotal(h`yr'2112-h`yr'2116),missing /*financial income*/
          egen inc`yr'_p = rowtotal(h`yr'2122-h`yr'2126),missing /*real estate income*/
          egen inc`yr'_i = rowtotal(h`yr'2134 h`yr'2136 h`yr'2138 h`yr'2140 h`yr'2142),missing/*social insurance*/
          egen inc`yr'_t = rowtotal(h`yr'2152-h`yr'2160 h`yr'4002),missing /*transfer income*/
          egen inc`yr'_o = rowtotal(h`yr'2183-h`yr'2191),missing /*other income*/
          egen inc`yr'_h = rowtotal(inc`yr'_e inc`yr'_m inc`yr'_p inc`yr'_i inc`yr'_t inc`yr'_o),mis /*annual total income*/
          }/*}}}*/
        label var inc`yr'_e "`yr'조사 근로소득"
        label var inc`yr'_m "`yr'조사 금융소득"
        label var inc`yr'_p "`yr'조사 부동산소득"
        label var inc`yr'_i "`yr'조사 사회보험소득"
        label var inc`yr'_t "`yr'조사 이전소득"
        label var inc`yr'_o "`yr'조사 기타소득"
        label var inc`yr'_h "`yr'조사 가계총소득"
        rename (inc`yr'_?) (inc?`yr')
        /*}}}*/
      keep `h`yr'vars' inc?`yr'
      keep if hwave`yr' == 1
      lookfor "(지난한달)"
      capture drop `r(varlist)'
      save `temp' , replace
      /*}}}*/
    /*조사년도별 개인파일 조작 {{{*/
      use rawdata/klips`yr'p , clear
      /*개인필요변수 선정{{{*/
        local p`yr'vars pid hhid`yr' hmem`yr' orghid?? sample?? hwaveent p`yr'0102 p`yr'0314 p`yr'0110 p`yr'0111 p`yr'0121 p`yr'0314
        lookfor "표준산업분류"
        local p`yr'vars `p`yr'vars' `r(varlist)'
        lookfor "표준직업분류"
        local p`yr'vars `p`yr'vars' `r(varlist)'
        lookfor "가구정보"
        local p`yr'vars `p`yr'vars' `r(varlist)'
        lookfor "임금수준(월급액)"
        local p`yr'vars `p`yr'vars' `r(varlist)'
        lookfor "액수(만)"
        local p`yr'vars `p`yr'vars' `r(varlist)'
        lookfor "소득(만)"
        local p`yr'vars `p`yr'vars' `r(varlist)'
        lookfor "14세무렵 경활상태"
        local p`yr'vars `p`yr'vars' `r(varlist)'
        lookfor "아버지"
        local p`yr'vars `p`yr'vars' `r(varlist)'
        lookfor "어머님"
        local p`yr'vars `p`yr'vars' `r(varlist)'
        if `x' != 3 {
          local p`yr'vars `p`yr'vars' p`yr'0317
        }
        if `x' >= 5 {
          local p`yr'vars `p`yr'vars' p`yr'5201
        } /*}}}*/
      keep `p`yr'vars'
      sort hhid`yr'
      /*}}}*/
    /*년도별 가구 및 개인파일 결합{{{*/
      merge m:1 hhid`yr' using `temp' , nogen
      mvencode hwave`yr' , mv(0)
      gen wave = `x'
      label var wave "조사회차"
      gen year = `x' + 1997
      label var year "조사년도"
      /*}}}*/
    /*long data 형태로 변환{{{*/
      if `x' <3 {
        rename (h`yr'???? p`yr'???? inc?`yr' ) (h???? p???? inc? )
      }
      else {
        rename (h`yr'???? p`yr'???? inc?`yr' p`yr'orig?? ) (h???? p???? inc? porig?? )
      } /*}}}*/
    if `x' == 1 {
      save klips_master ,replace
    }
    else {
      append using klips_master
      save klips_master , replace
    }
  }

  compress
  sort pid wave
  drop if missing(pid)
  drop pa*
  capture drop _*
  mvdecode _all , mv(-1)
  save klips_master , replace

exit
