  #delimit ;
  capture program drop eopcal ;
  program eopcal, byable(recall) rclass sortpreserve ;
   syntax varlist(numeric) [if] [in] [pweight aweight fweight iweight] , 
   [ENVironment(varname numeric )
    GOIndex RRIndex(passthru) Bootstrap(integer 0) Seed(integer 10101)	///Options for calculating indicies.
    DOMinance ACCuracy(passthru)										                    ///Options for dominance test.
    BJORKlund(passthru)												                          ///Options for Bjorklund et al. 
    ITT												                                ///Options for Intertemporal Iop.
    CUMDplot KDENplot GRoptions(passthru)                               ///Options for drawing graphs.
    Value(passthru) Percent(passthru) NOZero                            ///Options for manipulating data range.
    STATs																                                ///Options for descriptive statistics.
    EXPost                                                              ///Options for EOp distributions.
    DEtail MODIfied TRace(integer 0) SAVing(string) ] ;                 ///Extra options.
    /* ARGUMENTS CHECK LIST {{{*/
      /* TRACE ON/OFF {{{*/
        if ("`trace'" != "0") {;
          set trace on ;
          set traced `trace' ;
          set traceindent on ;
        };
      /*}}}*/
      /* WEIGHT CHECK {{{*/
        tempvar wgt ;
        if ("`weight'" == "") {;
          qui gen `wgt' = 1;
          local weight fw ;
          local exp "= `wgt'" ;
        };
        if("`weight'"=="iweight"){ ;
          local wvar=strltrim(subinstr("`exp'","=","",1)) ;
          sum `exp' , meanonly ;
          gen `wgt'=`wvar'/(r(mean)) ;
          local exp "=`wgt'" ;
        };
        if("`weight'"=="fweight" ){;
          local wvar=strltrim(subinstr("`exp'","=","",1)) ;
          qui gen `wgt' = round(`wvar' , 1) ; 
          local exp "=`wgt'" ;
        };
      /*}}}*/
      /* CHECK IF THE OPTION RRINDEX HAS THE FORM OF (TYPE , CRITERA) {{{*/
        if `"`rrindex'"' != "" {; 
          local rrindex = strtrim(subinstr(subinstr("`rrindex'" , "rrindex(","",1) , ")","",1)) ;
          gettoken rritype rricrit : rrindex, parse(,) ;
          local rritype = strtrim("`rritype'");
          local rricrit = strtrim(subinstr("`rricrit'" , ",","",1));
          if("`rritype'" != "type" & "`rritype'" != "percent" & "`rritype'" != "score") {;
            di as error "ERROR in RRindex type. " as text "The following values are required: type, percent or score.";
            exit ;
          };
          captur confirm number `rricrit' ; 
          if _rc != 0 {;
            di as error "ERROR in RRindex critera." as text "A numeric argument is required";
            exit ;
          };
          local rrindex rrindex ;
        };
      /*}}}*/
      /* CHECK IF THE OPTION BJORKLUND HAS THE FORM OF (TYPE , CRITERA) {{{*/
        if `"`bjorklund'"' != "" { ; 
          local bjorklund = strtrim(subinstr(subinstr("`bjorklund'" , "bjorklund(","",1) , ")","",1)) ;
          gettoken bjorktype bjorkcrit : bjorklund, parse(,) ;
          local bjorktype = strtrim("`bjorktype'") ;
          local bjorkcrit = strtrim(subinstr("`bjorkcrit'" , ",","",1)) ;
          if("`bjorktype'" != "mld" & "`bjorktype'" != "var" ) { ;
            di as error "ERROR in Bjorklund type. " as text "The following values are required: mld or var." ;
            exit ;
          } ;
          captur confirm number `bjorkcrit' ; 
          if _rc != 0 { ;
            di as error "ERROR in Bjorklund critera." as text "A numeric argument is required" ;
            exit ;
          };
          local bjorklund bjorklund ;
        };
      /*}}}*/
      /* CHECK IF THE OPTION ITT HAS THE FORM OF (EOP dist. , Time weight, IOP aversion, Effort lv. ) {{{*/
        /*if `"`ITT'"' != "" { ; */
          /*local itt = strtrim(subinstr(subinstr("`itt'" , "itt(","",1) , ")","",1)) ;*/
          /*gettoken eopdist itt : itt, parse(,) ;*/
          /*gettoken timew itt : itt, parse(,) ;*/
          /*gettoken iopaversion effortlv : itt, parse(,) ;*/
          /*local eopdist = strltrim(strrtrim("`iopaversion'")) ;*/
          /*local timew = strltrim(strrtrim(subinstr("`timew'" , ",","",1))) ;*/
          /*local iopaversion = strltrim(strrtrim(subinstr("`iopaversion'" , ",","",1))) ;*/
          /*local effortgrp = strltrim(strrtrim(subinstr("`effortgrp'" , ",","",1))) ;*/
          /*if !inlist("`eopdist'" , "expost" , "exantepr" ) { ;*/
            /*di as error "ERROR in the 1st arg. " as text "The following values are required: expost or exantepr." ;*/
            /*exit ;*/
          /*} ;*/
          /*if !inlist("`timew'" , "early" , "late" , "equal" ) { ;*/
            /*di as error "ERROR in the 2nd arg. " as text "The following values are required: early, late or equal." ;*/
            /*exit ;*/
          /*} ;*/
          /*captur confirm number `iopaversion' ; */
          /*if _rc != 0 { ;*/
            /*di as error "ERROR in the 3rd arg." as text "A numeric argument is required" ;*/
            /*exit ;*/
          /*};*/
          /*captur confirm number `effortgrp' ; */
          /*if _rc != 0 { ;*/
            /*di as error "ERROR in the 4th arg." as text "A numeric argument is required" ;*/
            /*exit ;*/
          /*};*/
          /*local itt itt ;*/
        /*};*/
      /*}}}*/
      /* CHECK IF THE ENVIRONMENT VALUE HAVE SEQUENCE FROM 1 TO 1.{{{*/
        if "`environment'" != "" { ;
          qui levelsof `environment' , local(typloc) ;
          global typlist `typloc' ;
          global typnum : word count `typloc' ;
          local typnump = $typnum + 1;
          forvalue i = 1/$typnum {;
            local typ`i' : word `i' of $typlist ;
            if !(`typ`i'' == `i') {;
              di as error "ERROR in Environment value. " as text "The value must increase from 1 to 1. (eg. 1,2,3,...)." ;
              exit;
            };
          };
        }; 
      /*}}}*/
    /*}}}*/
    marksample touse  ;
    markout `touse' `environment' ;
    /*APPLYING NOZERO OPTION TO THE VARLIST {{{*/
      if ("`nozero'" != "") {;
        qui count if `varlist' <= 0 & `touse' ;
        noi if r(N) > 0 { ;
          di " " ;
          di as txt "Warning: " as input "`varlist'" as text " has " as result "`r(N)'" as text " non-positive(<=0) values ." _c ;
          di as txt " Not used in calculations" ;
        } ;
        qui replace `touse' = 0 if `varlist' <= 0 ;
      }; /*}}}*/
    /* RUN SUB PROGRAMS {{{*/
      /* GENERATE THE EX-POST EOP GROUP{{{*/
        if ("`expost'" != "") {;
          preserve ;
          qui keep if `touse' ;
          sort `environment' `varlist' ;
          tempvar temp1 temp2 temp3 temp4 ;
          tempfile tempdata ;
          /* Identifing the minimum group and its obs */
            local minnum = . ;
            foreach i of global typlist { ;
              qui	count if `environment' == `i' ;
              if (r(N) < `minnum' ) { ;
                local mintyp = `i' ;
                local minnum = r(N) ;
              } ;
            } ;
          /* Marking effort groups */
            qui bys `environment' : gen `temp1' = _n ;
              foreach i of global typlist {;
                qui xtile temp`i' = `temp1' if `environment' == `i' , n(`minnum') ;
              };
            qui egen `temp2' = rowmax(temp?) ;
          /* Give ex-post eop achievement*/
            qui gen `temp3' = . ;
              forvalue i = 1/`minnum' { ;
                sum `varlist' [`weight' `exp'] if `temp2' == `i' , meanonly ;
                qui replace `temp3' = r(mean) if `temp2' == `i' ;
              };
            qui inspect `varlist' ;
              if (r(N_unique) < .) {;
                qui replace `temp3' = round(`temp3' , 1) ;
              };
          /* Appending the ex-post achievement dist. to the original data.*/
            local wvar=strltrim(subinstr("`exp'","=","",1)) ;
            qui bys `temp2' : egen `temp4' = total(`wvar') ; /*기회평등 집단에 대한 가중치 생성*/
            qui keep `temp3' `temp4' `environment' ; /*성취변수 환경변수 가중치만 남김*/
            qui keep if `environment' == `mintyp' ;
            qui replace `environment' = `typnump' ;
            rename `temp3' `varlist' ;
            rename `temp4' `wvar' ;
            local sname=strltrim(subinstr("`c(filename)'",".dta","",.)) ;
            qui compress ;
            if ("`saving'" != "") { ;
             save `sname'_`saving'.dta , replace ;
            };
            qui save `tempdata' ;
            restore , preserve ;
            qui keep if `touse' ;
            qui append using `tempdata' ;
            local venvlabel : value label `environment' ;
            label define `venvlabel' `typnump' "기회평등" , add ;
            /*local typnum = `typnump' ;*/
        };
        else {;
          preserve ;
          qui keep if `touse' ;
        };
      /*}}}*/
      tempname temps temps2 ;
        /* CALL SUB PROGRAMS{{{*/
          /** PRINT of STATS{{{*/
            if ("`stats'" != "") {;
              stats `varlist' [`weight' `exp'] , environment(`environment') `nozero' ;
              matrix `temps' = r(results) ;
              matlist `temps' ;
            }; 
          /*}}}*/
          /** PRINT of GOI{{{*/
            if ("`goindex'" != "") {;
              goi `varlist' [`weight' `exp'] , environment(`environment') `detail' `modified' ;
              return local achname "`varlist'" ;
              return local evnname "`environment'" ;
              return local idxname "goindex" ;
              di as text "`goindex' = " as result %5.4f `r(index)' ;
              return scalar index = `r(index)' ;
              if ("`detail'" != "") {;
                matrix `temps' = r(results) ;
                return matrix results = `temps' ;
              }; 
            }; 
          /*}}}*/
          /** PRINT of RRI{{{*/
            else if ("`rrindex'" != "") {;
              rri `varlist' [`weight' `exp'] , environment(`environment') type(`rritype') crit(`rricrit') `detail' ;
              return local achname "`varlist'" ;
              return local evnname "`environment'" ;
              return local success  "`r(type)' , `r(crit)'";
              return local idxname "rrindex" ;
              return scalar index = `r(index)' ;
              di as text "`rrindex' = " as result %5.4f `r(index)' ;
              if ("`detail'" != "") {;
                matrix `temps' = r(results) ;
                return matrix results = `temps' ;
              };
            };
          /*}}}*/
          /** PRINT of ITT{{{*/
            else if ("`itt'" != "") {;
              itt `varlist' [`weight' `exp'] , environment(`environment') eftlv(10) ;
            return scalar postlin1 = `r(postlin1)';
            return scalar antelin1 = `r(antelin1)';
            return scalar postear1 = `r(postear1)';
            return scalar anteear1 = `r(anteear1)';
            return scalar postlat1 = `r(postlat1)';
            return scalar antelat1 = `r(antelat1)';
            di as text "`itt', ex-ante, equal time and 1 aversion = " as result %5.4f `r(antelin1)' ;
            di as text "`itt', ex-ante, early time and 1 aversion = " as result %5.4f `r(anteear1)' ;
            di as text "`itt', ex-ante, late time and 1 aversion = " as result %5.4f `r(antelat1)' ;
            di as text "`itt', ex-post, equal time and 1 aversion = " as result %5.4f `r(postlin1)' ;
            di as text "`itt', ex-post, early time and 1 aversion = " as result %5.4f `r(postear1)' ;
            di as text "`itt', ex-post, late time and 1 aversion = " as result %5.4f `r(postlat1)' ;
            };
          /*}}}*/
          /** PRINT of Bjorklund{{{*/
            else if ("`bjorklund'" != "") {;
              bjork `varlist' [`weight' `exp'] , type(`bjorktype') cut(`bjorkcrit') ;
              return local idxname "Bjorklund;mld" ;
              di as text "`bjorklund', mld, absolute = " as result %5.4f `r(bj1a)' ;
              di as text "`bjorklund', mld, relative = " as result %5.4f `r(bj1r)' ;
              di as text "`bjorklund', var, relative = " as result %5.4f `r(bj2r)' ;
              return scalar bj1a=`r(bj1a)' ;
              return scalar bj1r=`r(bj1r)' ;
              return scalar bj2r=`r(bj2r)' ;
            };
          /*}}}*/
          /** PRINT of cumdplot{{{*/
            else if ("`cumdplot'" != "") {;
              cumd `varlist' [`weight' `exp'] , environment(`environment') `value' `percent' `groptions';
            }; /*}}}*/
          /** PRINT of kdenplot{{{*/
            else if ("`kdenplot'" != "") {;
              kden `varlist' [`weight' `exp'] , environment(`environment') `value' `percent' `groptions';
            }; /*}}}*/
          /** PRINT of DOM{{{*/
            else if ("`dominance'" != "") {;
              dom `varlist' [`weight' `exp'] , environment(`environment') `value' `percent' `accuracy' `modified';
              matrix `temps' = r(results) ;	///temps for svmat
              matrix `temps2' = r(results) ;	///temps2 for return results
              return matrix results = `temps2' ;
              local typlab : variable label `environment' ;
              local typvalue : value label `environment';
              local hlnum = 8*$typnum + 4*($typnum - 1);
              if ("`typvalue'" != "") { ;
                forvalues i = 1/$typnum {;
                  local lbv`i' : label `typvalue' `i';
                };
              };
              svmat `temps' ;
              qui keep `temps'* ;
              qui keep if !missing(`temps'1) ;
              /*** CREATING TEST RESULT TEXT{{{*/
                local i = 1 ;
                while (`i' < $typnum) { ;
                  local j = `i' +1 ;
                  while (`j' <= $typnum){ ; 
                    sum `temps'13 if `temps'1 == 2 & `temps'2 == `i' & `temps'3 == `j' , meanonly ;
                      if (r(mean) == 1) { ; local dom`i'`j' "     <2*" ; };
                    sum `temps'12 if `temps'1 == 2 & `temps'2 == `i' & `temps'3 == `j' , meanonly ;
                      if (r(mean) == 1) { ; local dom`i'`j' "    <2**" ; };
                    sum `temps'11 if `temps'1 == 2 & `temps'2 == `i' & `temps'3 == `j' , meanonly ;
                      if (r(mean) == 1) { ; local dom`i'`j' "   <2***" ; };
                    sum `temps'10 if `temps'1 == 2 & `temps'2 == `i' & `temps'3 == `j'  , meanonly ;
                      if (r(mean) == 1) { ; local dom`i'`j' "     >2*" ; };
                    sum `temps'9 if `temps'1 == 2 & `temps'2 == `i' & `temps'3 == `j'  , meanonly ;
                      if (r(mean) == 1) { ; local dom`i'`j' "    >2**" ; };
                    sum `temps'8 if `temps'1 == 2 & `temps'2 == `i' & `temps'3 == `j' , meanonly ;
                      if (r(mean) == 1) { ; local dom`i'`j' "   >2***" ; };
                    sum `temps'13 if `temps'1 == 1 & `temps'2 == `i' & `temps'3 == `j' , meanonly ;
                      if (r(mean) == 1) { ; local dom`i'`j' "     <1*" ; };
                    sum `temps'12 if `temps'1 == 1 & `temps'2 == `i' & `temps'3 == `j' , meanonly ;
                      if (r(mean) == 1) { ; local dom`i'`j' "    <1**" ; };
                    sum `temps'11 if `temps'1 == 1 & `temps'2 == `i' & `temps'3 == `j' , meanonly ;
                      if (r(mean) == 1) { ; local dom`i'`j' "   <1***" ; };
                    sum `temps'10 if `temps'1 == 1 & `temps'2 == `i' & `temps'3 == `j'  , meanonly ;
                      if (r(mean) == 1) { ; local dom`i'`j' "     >1*" ; };
                    sum `temps'9 if `temps'1 == 1 & `temps'2 == `i' & `temps'3 == `j'  , meanonly ;
                      if (r(mean) == 1) { ; local dom`i'`j' "    >1**" ; };
                    sum `temps'8 if `temps'1 == 1 & `temps'2 == `i' & `temps'3 == `j' , meanonly ;
                      if (r(mean) == 1) { ; local dom`i'`j' "   >1***" ; };
                    if ("`dom`i'`j''" == "") {; local dom`i'`j' "ambiguous" ; };
                    local ++j;
                  } ;
                  local ++i ;
                } ; 
              /*}}}*/
              restore, preserve ;
              if ("`ideal'" != "") {;
                qui append using `tempdata' ;
              };
              /*** KSMIRNOV TEST for EQUAL DISTRIBUTION{{{*/
                local i = 1 ;
                while (`i' < $typnum) { ;
                  local iplus = `i' +1 ;
                  forvalues j=`iplus'/$typnum{ ; 
                    if ("`dom`i'`j''" == "ambiguous") {; 
                      tempvar tempgrp;
                      qui gen `tempgrp' = `environment' ;
                      qui replace `tempgrp' = . if !inlist(`environment' , `i' ,`j') ;
                      qui ksmirnov `varlist' if `touse' , by(`tempgrp');
                      if (r(p) <= 0.1  ) {; local dom`i'`j'  "     ??*"; };
                      if (r(p) <= 0.05 ) {; local dom`i'`j'  "    ??**"; };
                      if (r(p) <= 0.01 ) {; local dom`i'`j'  "   ??***"; };
                      if (r(p) > 0.1 )   {; local dom`i'`j'  "    === "; };
                    };
                  };
                  local ++i ;
                }; 
              /*}}}*/
              /*** PRINTING RESULT TABLE{{{*/
                forvalue i = 0/$typnum {;
                  forvalue j = 1/$typnum {;
                    if ("`dom`i'`j''" == "") { ;
                      local dom`i'`j' "    {hline 3} ";
                    };
                    if (`i' == 0) { ;
                      local contents = `"`contents' %8s abbrev("`lbv`j''",8) _skip(4)"' ;
                    };
                    else if (`i' >= 1 ) {;
                      local contents`i' = `"`contents`i'' "`dom`i'`j''" _skip(4)"';
                    };
                  };
                  if (`i' == 0) { ;
                    di ;
                    di as result "Stochastic Dominance Test Results" ;
                    di ;
                    di as text %12s abbrev("`typlab'",12) _col(14) "{c |}" `contents';
                    di as text "{hline 13}{c +}{hline `hlnum'}";
                  };
                  else if (`i' >= 1 ) { ;
                    di as text %12s abbrev("`lbv`i''",8) _col(14) "{c |}" `contents`i'';
                  };
                };
              /*}}}*/
              if ("`detail'" != "") {; matlist `temps' ; };
            };
          /*}}}*/
          restore, preserve ; 
          if ("`ideal'" != "") {;
            qui append using `tempdata' ;
          };
        /* BOOTSTRAP SAMPLING for CALCULATING CI of GOI and RRI {{{*/
          if (`bootstrap' >= 1) { ; 
            set seed `seed' ;
            tempname temp tempi temp1 temp2 tempind tempsum ;
            forvalue i = 1/`bootstrap' { ;
              qui keep if `touse' ;
              bsample ;
              if ("`goindex'" != "") {;
                goi `varlist' [`weight' `exp'] , environment(`environment') `detail' ;
              };
              else if ("`rrindex'" != "") {;
                rri `varlist' [`weight' `exp'] , environment(`environment') type(`rritype') crit(`rricrit') `detail' ;
              };
              /** CREATING BSTINDEX MATRIX{{{*/
                mat `tempi'=J(1,1,99); 
                mat `tempi'[1,1] = `r(index)' ;
                matrix rowname `tempi' = `i' ;
                mat `tempind' = (nullmat(`tempind') \ `tempi') ;
                mat colnames `tempind'= Index ; /*}}}*/
              /** CREATING BSTRESULTS MATRIX{{{*/
                if ("`detail'" != "") {;
                  matrix `temp2' = r(results) ; 
                  if ("`goindex'" != "") {;
                    local t1 = $typnum + 1 ;
                    matrix `temp1' = J(`t1',1,`i');
                  matrix rowname `temp1' = All $typlist ;
                  matrix rowname `temp1' = `environment': ;
                  };
                  else if ("`rrindex'" != "") {;
                    matrix `temp1' = J(1,1,`i');
                    matrix rowname `temp1' = `i' ;
                  };
                  matrix colname `temp1' = bstnum ;
                  matrix `temp' = (`temp1',`temp2') ;
                  mat `tempsum' = (nullmat(`tempsum') \ `temp') ;
                };
              /*}}}*/
              restore, preserve ;
              if ("`ideal'" != "") {;
                qui append using `tempdata' ;
              };
            };
            /** CREAING RESULTS{{{*/
              svmat `tempind' ;
              qui keep `tempind'1 ;
              qui keep if !missing(`tempind'1) ;
              qui sum `tempind'1 ;
              return scalar sd = r(sd) ;
              _pctile `tempind'1 , p( 0.5 2.5 5 95 97.5 99.5) ;
              return scalar l99 = r(r1) ;
              return scalar l95 = r(r2) ;
              return scalar l90 = r(r3) ;
              return scalar u90 = r(r4) ;
              return scalar u95 = r(r5) ;
              return scalar u99 = r(r6) ;
              di as text "95% CI is [" as result %5.4f `r(r2)' as text " , " as result %5.4f `r(r5)' as text "]." ;
              if ("`detail'" != "") {;
                return matrix bstindex = `tempind' ;
                return matrix bstresults = `tempsum' ;
              };
            /*}}}*/
          }; 
        /*}}}*/
        restore ;
      /*}}}*/
    /*}}}*/
    end;
  /* SUB PROGRAMS */
      /* STATS PROGRAM {{{*/
       capture program drop stats ;
       program define stats , rclass; 
       syntax varlist [fw aw pw iw] , ENVironment(varlist numeric) [NOZero] ;
       local rownum = $typnum + 1 ;
       local typval : value label `environment' ;
       tempname temp ;
       if ("`nozero'" == "") {;
           matrix `temp' = J(`rownum',10,.) ;
       };
       else {;
           matrix `temp' = J(`rownum',8,.) ;
       };
       local rowname All ;
       qui sum `varlist'[`weight' `exp'] ;
       matrix `temp'[1,1] = -1 ;
       matrix `temp'[1,2] = r(N) ;
       matrix `temp'[1,3] = (`temp'[1,2]/`temp'[1,2]) ;
       matrix `temp'[1,4] = r(mean) ;
       matrix `temp'[1,5] = r(sd) ;
       matrix `temp'[1,6] = r(min) ;
       matrix `temp'[1,7] = r(max) ;
       matrix `temp'[1,8] = r(sum_w) ;
       if ("`nozero'" == "") {;
           qui count if `varlist' == 0 ;
           matrix `temp'[1,9] = r(N) ;
           matrix `temp'[1,10] = (`temp'[1,9]/`temp'[1,2]) ;
       };
       local count = 2 ;
       foreach i of global typlist {;
          qui sum `varlist' if `environment' == `i' [`weight' `exp'] ;
          matrix `temp'[`count',1] = `i' ;
          matrix `temp'[`count',2] = r(N) ;
          matrix `temp'[`count',3] = (`temp'[`count',2]/`temp'[1,2]) ;
          matrix `temp'[`count',4] = r(mean) ;
          matrix `temp'[`count',5] = r(sd) ;
          matrix `temp'[`count',6] = r(min) ;
          matrix `temp'[`count',7] = r(max) ;
          matrix `temp'[`count',8] = r(sum_w) ;
          if ("`nozero'" == "") {;
              qui count if `varlist' == 0 & `environment' == `i' ;
              matrix `temp'[`count',9] = r(N) ;
              matrix `temp'[`count',10] = (`temp'[`count',9]/`temp'[`count',2]) ;
          };
          local row`i' : label `typval' `i' ;
          local rowname `rowname' `row`i'' ;
          local ++count ;
       };
       matrix rowname `temp' = `rowname' ;
       matrix rowname `temp' = `environment': ;
       if ("`nozero'" == "") {;
           matrix colname `temp' =  Group N RatioP Mean Sd Min Max sumW Nof0 Ratio0 ;
       };
       else {;
           matrix colname `temp' =  Group N RatioP Mean Sd Min Max sumW ;
       };
       return matrix results = `temp' ;
       end; /*}}}*/
      /* GOINDEX PROGRAM {{{*/
       capture program drop goi ;
       program define goi , rclass; 
       syntax varlist [fw aw pw iw] , ENVironment(varlist numeric) [detail MODIfied];
       tempname envm ginim senm countm populm tempg ;
       local envvalue : value label `environment' ;
       mat `senm'=J($typnum, 1 ,99) ;
       mat `populm'=J($typnum, 1 ,99) ;
       if ("`detail'" != "") {;
           mat `envm'=J($typnum, 1 ,99) ;
           mat `ginim'=J($typnum, 1 ,99) ;
           mat `countm'=J($typnum, 1 ,99) ;
       };
       sum `varlist' [`weight' `exp'] , meanonly ;
       local gsumw = r(sum_w);
       local gmean = r(mean);
       qui count ;
       local gn = r(N);
       qui ineqdeco `varlist' [`weight' `exp'] , bygroup(`environment') welfare ;
       local ggini = r(gini) ; /* Grand Gini */
       local gsen = r(wgini) ; /* Grand Sen's Welfare Mu*(1-Gini) */
       forvalues i=1/$typnum{;
           local ilabel "`i'" ;
           local rowname `rowname' `ilabel' ;
           matrix `senm'[`i',1]=r(wgini_`i') ;
           matrix `populm'[`i',1] = r(sumw_`i')/`gsumw' ;
           if ("`detail'" != "") {;
               matrix `envm'[`i',1]=`i' ;
               matrix `ginim'[`i',1]=r(gini_`i') ;
           };
       } ;
       if ("`detail'" != "") {;
           forvalues i=1/$typnum{;
               qui count if `environment' == `i' ;
               matrix `countm'[`i',1] = r(N) ;
           } ;
           sum `varlist' [`weight' `exp'] , meanonly ;
           matrix `tempg' = (-1 , `ggini' , `gsen' , `gn' , 1 ) ;
           matrix rowname `tempg' = All ;
           matrix results = (`envm',`ginim',`senm',`countm', `populm') ;
           matrix rowname results = `rowname' ;
           matrix results = (`tempg' \ results) ;
           matrix rowname results = `environment': ;
           matrix colname results = Env Gini Sen  ObsNum PopRatio ;
       };
       local count = 1 ;
       local go = 0 ;
       while (`count' < $typnum) { ;
           local cplus = `count' +1 ;
           forvalues j=`cplus'/$typnum{ ;
               local go = `go' + `populm'[`count',1]*`populm'[`j',1]*abs(`senm'[`count',1]-`senm'[`j',1]) ;
           } ;
           local ++count ;
       } ;
       if ("`modified'" != "") { ;
            local go = `go'/`gsen' ;
       };
       else {;
           local go = `go'/`gmean' ;
       };
       return scalar index = `go' ;
       if ("`detail'" != "") {;
           return matrix results = results ;
       };
       end ; /*}}}*/
      /* RRINDEX PROGRAM {{{*/
       capture program drop rri ;
       program define rri , rclass; 
       syntax varlist [fw aw pw iw] , ENVironment(varlist numeric) TYPE(str) CRIT(real) [detail] ;
       return local type  "`type'" ;
       return local crit  "`crit'" ;
       tempvar one ;
       local disadv : word 1 of $typlist ;
       gen `one' = 1;
       sum `one' [`weight' `exp'] , meanonly ;
       local totpop = r(sum_w) ; /*Grand Population*/
       sum `one' if `environment' == `disadv' [`weight' `exp'] , meanonly ;
       local dispop = r(sum_w) ; /*Population of the Disadvantage Grouop*/
       if ("`type'" == "score") {;
           sum `one' [`weight' `exp'] if `varlist' >= `crit' , meanonly ;
           local totwin = r(sum_w) ;
           sum `one' if `environment' == `disadv' & `varlist' >= `crit' [`weight' `exp'] , meanonly ;
           local diswin = r(sum_w) ;
       };
       else if ("`type'" == "type") {;
           sum `one' [`weight' `exp'] if `varlist' == `crit' , meanonly ;
           local totwin = r(sum_w) ;
           sum `one' if `environment' == `disadv' & `varlist' == `crit' [`weight' `exp'] , meanonly ;
           local diswin = r(sum_w) ;
       };
       else if ("`type'" == "percent") {;
           local crit = 100 - `crit' ;
           _pctile `varlist' [`weight' `exp'] , p( `crit') ;
           local crit = r(r1);
           sum `one' if `varlist' >= `crit' [`weight' `exp'] , meanonly ;
           local totwin = r(sum_w) ;
           sum `one' if `environment' == `disadv' & `varlist' >= `crit' [`weight' `exp'] , meanonly ;
           local diswin = r(sum_w) ;
       };
       local rr = 1 - (`diswin'/`totwin')/(`dispop'/`totpop') ;
       return scalar index = `rr' ;
       if ("`detail'" != "") {;
           matrix results =(`disadv' , `diswin' , `dispop' , `totwin' , `totpop') ;
           matrix colname results = DisTyp SucDisNum DisNum SucNum PopNum ;
           return matrix results = results ;
       };
       end; /*}}}*/
      /* ITT PROGRAM {{{*/
        capture program drop itt ;
        program define itt , rclass ;
        syntax varlist [fw aw ] , ENVironment(str) EFTlv(integer) ;
        /// args : eopdist timew IOPAversion eftlv environment
        tempvar type nofg eftgrp expost gmean typmean tottypedepvar propo tottypecompen antepr tvar etwgt ltwgt
          epdt idtotepdt totwgt postlin1 eadt idtoteadt antelin1 idtotepdtearly postear1 idtoteadtearly anteear1
          idtotepdtlate postlat1 idtoteadtlate antelat1 ;
        quietly {;
          local wgt = strtrim(subinstr("`exp'" , "= ","",1));
          /*DEFINE DEPENDENT AND INDEPENDENT VARIABLES {{{*/
            tokenize `varlist' ;
            local depvar `1' ;
            macro shift ;
            local indepvars `*' ;
            return local depvar  "`depvar'" ;
            return local indepvars  "`indepvars'" ;
            /*}}}*/
          /*GENERATE TIME WEIGHTS {{{*/
            xtset ;
            local idvar = r(panelvar) ;
            local tname = r(timevar) ;
            local tmin = r(tmin) ;
            local tmax = r(tmax) ;
            if `tmin' != 1 {;
              local `tmax' = `tmax' - `tmin' + 1 ;
              gen `tvar' = `tname' - `tmin' + 1;
            };
            else {;
              gen `tvar' = `tname';
            };
            local numearly = 0;
            forvalue i = 1/`tmax' {;
              local numearly = `numearly' + sqrt((`tmax' - `i' + 1)/`tmax') ;
            };
            gen `etwgt' = sqrt(`tmax' - `tvar'  +1)/`numearly' ;
            local numlate = 0;
            forvalue i = 1/`tmax' {;
              local numlate = `numlate' + sqrt(`i' /`tmax') ;
            };
            gen `ltwgt' = sqrt(`temptime' /  `tmax' )/`numlate' ;
            /*}}}*/
          /*IDENTIFY ENVIRONMENT GROUPS {{{*/
            if "`indepvars'" != "" {;
              egen `type'  = group(`indepvars') ;
            };
            else {;
              gen `type' = `environment' ;
            };
            levelsof `type' , local(typlist) ;
            /*}}}*/
          sort `tvar' `type' `depvar' ;
          /* Generate Ex-post Eop Achievement{{{*/
            bys `tvar' `type' : gen `nofg' = _n ;
            foreach i of local typlist {;
              forvalue j = 1/`tmax' {;
                xtile _temp`i'_`j' = `nofg' if `type' == `i' & `tvar' == `j' , n(`eftlv') ;
              };
            };
            egen `eftgrp' = rowmax(_temp*) ;
            drop _temp* ;
            gen `expost' = . ;
            forvalue i = 1/`eftlv' { ;
              forvalue j = 1/`tmax' {;
                sum `depvar' [`weight' `exp'] if `eftgrp' == `i' & `tvar' == `j' , meanonly ;
                replace `expost' = r(mean) if `eftgrp' == `i' & `tvar' == `j'  ;
              };
            };
          /*}}}*/
          /* Generate Ex-ante Propotional Eop Achievement {{{*/
            gen `gmean' = . ;
            forvalue j = 1/`tmax' {;
              sum `depvar' [`weight' `exp'] if `tvar' == `j' , meanonly ;
            replace `gmean' = r(mean) if `tvar' == `j' ;
            };
            gen `typmean' = . ;
            foreach i of local typlist { ;
              forvalue j = 1/`tmax' {;
                sum `depvar' [`weight' `exp'] if `type' == `i' & `tvar' == `j' , meanonly ;
                replace `typmean' = r(mean) if `type' == `i' & `tvar' == `j' ;
              };
            };
            bys `tvar' `type' : egen `tottypedepvar' = total( `depvar' * `wgt') ;
            gen `propo' =(`depvar' * `wgt' ) / `tottypedepvar' ;
            bys `tvar' `type' : egen `tottypecompen' = total((`gmean' - `typmean') * `wgt') ;
            gen `antepr' =`depvar' + ( `tottypecompen' * `propo') ;
            /*}}}*/
          sort `idvar' `tvar' ;
         /*Calculate ex-post, equal time and 1 aversion index */
            gen `epdt' = ln(`depvar'/`expost') ;
            bys `idvar' : egen `idtotepdt' = total(`epdt' / `tmax');
            egen `totwgt' = total(`wgt') ;
            egen `postlin1' = total(`idtotepdt' * `wgt' / `totwgt' ) ;
            return scalar postlin1 = `postlin1'[1] ;
          /*Calculate ex-ante pr, equal time and 1 aversion index */
            gen `eadt' = ln(`depvar'/`antepr') ;
            bys `idvar' : egen `idtoteadt' = total(`eadt' / `tmax');
            egen `antelin1' = total(`idtoteadt' * `wgt' / `totwgt' ) ;
            return scalar antelin1 = `antelin1'[1] ;
          /*Calculate ex-post, early time and 1 aversion index */
            bys `idvar' : egen `idtotepdtearly' = total(`epdt' * `etwgt'  / `tmax');
            egen `postear1' = total(`idtotepdtearly' * `wgt' / `totwgt' ) ;
            return scalar postear1 = `postear1'[1] ;
          /*Calculate ex-ante pr, early time and 1 aversion index */
            bys `idvar' : egen `idtoteadtearly' = total(`eadt' * `etwgt'  / `tmax');
            egen `anteear1' = total(`idtoteadtearly' * `wgt' / `totwgt' ) ;
            return scalar anteear1 = `anteear1'[1] ;
          /*Calculate ex-post, late time and 1 aversion index */
            bys `idvar' : egen `idtotepdtlate' = total(`epdt' * `ltwgt'  / `tmax');
            egen `postlat1' = total(`idtotepdtlate' * `wgt' / `totwgt' ) ;
            return scalar postlat1 = `postlat1'[1] ;
          /*Calculate ex-ante pr, late time and 1 aversion index */
            bys `idvar' : egen `idtoteadtlate' = total(`eadt' * `ltwgt'  / `tmax');
            egen `antelat1' = total(`idtoteadtlate' * `wgt' / `totwgt' ) ;
            return scalar antelat1 = `antelat1'[1] ;
          };
          end;
        /*}}}*/
      /* Bjorklund PROGRAM {{{*/
       capture program drop bjork ;
       program define bjork , rclass; 
       syntax varlist [fw aw ] , TYPE(str) CUT(integer) ;
       tempvar group nofg resid yhat one u yhatm ;
       return local type  "`type'" ;
       return local cut  "`cut'" ;
          // DEFINE DEPENDENT AND INDEPENDENT VARIABLES
           tokenize `varlist' ;
           local depvar `1' ;
           macro shift ;
           local indepvars `*' ;
           qui egen `group'  = group(`indepvars') ;
       bys `group' : gen `nofg' = _N ;
       qui replace `group' = . if `nofg' < `cut' ;
       qui levelsof `group' if !missing(`nofg') , local(glist) ;
       qui reg `depvar' `indepvars' [`weight' `exp'] if !missing(`group') ;
       qui predict double `yhat' if e(sample)  ;
       qui predict double `resid' if e(sample) , res ;
       qui sum `resid' [`weight' `exp'] ;
       local k = `r(sd)'^(-1) ;
       local count = 1 ;
       foreach i of local glist { ;
           qui reg `depvar' `indepvar' [`weight' `exp'] if `group' == `i' ;
           qui predict double resid0`count' if e(sample) , res ;
           qui sum resid0`count' [`weight' `exp'] ;
           local rho0`count' = `r(sd)' ;
           qui gen u0`count' = resid0`count'*(`k'*`rho0`count'')^(-1) ;
           local ++count ;
       } ;
       qui egen `u' = rowtotal(u0*) , missing ;
       drop u0* ;
       drop resid0* ;
       qui gen `yhatm' = `depvar' - `u' ;
       iop_mld `yhatm' if !missing(`u') [`weight'`exp'] ;
       local res_FGa=r(mld) ;
       iop_mld `depvar' if !missing(`u') [`weight'`exp'] ;
       local res_FGorg=r(mld) ;
       local res_FGr=`res_FGa'/`res_FGorg' ;
       qui reg `depvar' `yhatm' if !missing(`u') [`weight' `exp' ] ;
       local res_var=e(r2) ;
       return scalar bj1a=`res_FGa' ;
       return scalar bj1r=`res_FGr' ;
       return scalar bj2r=`res_var' ;
   end;
      /* iOP_mld{{{*/
       capture program drop iop_mld ;
          program define iop_mld, rclass;
          version 9.0 ;
          syntax varlist(max=1) [if] [in] [iweight fweight] ;
          preserve ;
          quietly{ ;
              marksample touse2 ;
              keep if `touse2' ;
              sum `varlist' [`weight'`exp'] ;
              local mean=r(mean) ;
              tempvar mld ;
              gen `mld'=ln(r(mean)/`varlist') ;
              sum `mld' [`weight'`exp'] ;
              local MLD=r(mean) ;
              return scalar mld=r(mean) ;
          } ;
       end ; /*}}}*/
   /*}}}*/
      /* CUMDPLOT PROGRAM {{{*/
       program define cumd, byable(recall);
       syntax varlist [if] [in] [fw aw pw iw] , 
           ENVironment(varlist numeric) [ Value(numlist min=2 max=2 ascending) Percent(numlist min=2 max=2 >0 <1 ascending) GROPtions(string) ] ;
          /******************************* LABELING ******************************/
           tempvar temp ;
           captur set more off ;
           local varlabel : variable label `varlist';
           local envvalue : value label `environment';
           local count = 1;
              if ("`envvalue'" != "") { ;
                  foreach i of global typlist {;
                      local lbv`i' : label `envvalue' `i';
                      local labels `labels' label(`count' `lbv`i'') ;
                      local ++count;
                  };
              };
              else {;
                  foreach i of global typlist {;
                      local lbv`i' "`environment' == `i'" ;
                      local labels `labels' label(`count' `lbv`i'') ;
                      local ++count;
                  };
              };
          /******************************* GEN CUMUL ******************************/
           foreach i of global typlist {;
              local cvar  c`environment'`i';
              local cvarlist `cvarlist' `cvar';
              local cvar2list `cvar2list' `cvar' `varlist';
              cumul `varlist' [`weight' `exp'] if `environment'==`i', equal gen(c`environment'`i');
              label variable `cvar' `"`lbv`i''"';
           };
          /******************************* RANGE RESTRICTION ******************************/
              if `"`percent'"' != "" {;
                  gettoken ymin ymax : percent ;
                  foreach i of global typlist {;
                      qui replace c`environment'`i' = . if `environment' == `i' &
                          !inrange(c`environment'`i' ,  `ymin' , `ymax') ;
                  };
              };
              qui stack `cvar2list', into (c c`environment') wide;
              if `"`value'"' != "" {;
                  gettoken xmin xmax : value ;
                  qui replace c`environment' =. if !inrange( c`environment' , `xmin' , `xmax' ) ;
              };
              if `"`percent'"' != "" {;
                  qui egen `temp' = rownonmiss(c`environmemt'*) ;
                  qui replace c`environment' = . if `temp' == 1 ;
              };
          /******************************* DRAWING ******************************/
           if (strpos("`groptions'" , "sort") == 0)	{; local sort "sort" ; };
           if (strpos("`groptions'" , "ytitle") == 0)	{; local ytitle "ytitle(CDF)" ; };
           if (strpos("`groptions'" , "ylab") == 0)	{; local ylab "ylab(,grid)" ; };
           if (strpos("`groptions'" , "xtitle") == 0)	{; local xtitle "xtitle(`varlabel')" ; };
           if (strpos("`groptions'" , "xlab") == 0)	{; local xlab "xlab(,grid)" ; };
           if (strpos("`groptions'" , "legend") == 0)	{; local legend " legend( pos(6) row(1) ) " ; };
           qui line `cvarlist' c`environment',
            `sort' `ytitle' `xtitle' `ylab'  `xlab' `legend' `groptions' legend(`labels') ;
       end; /*}}}*/
      /* KDENPLOT PROGRAM {{{*/
          program define kden, ;
          syntax varlist [if] [in] [fw aw pw iw] ,
              ENVironment(varlist numeric) [ Number(integer 500) Kernel(string)
              Value(numlist min=2 max=2  ascending) Percent(numlist min=2 max=2 >0 <1 ascending) GROPtions(string)] ;
          /******************************* LABELING ******************************/
          tempvar temp ;
          local varlabel : variable label `varlist';
          local envvalue : value label `environment';
          local count = 1;
          if ("`envvalue'" != "") { ;
              foreach i of global typlist {;
                  local lbv`i' : label `envvalue' `i';
                  local labels `labels' label(`count' `lbv`i'') ;
                  local ++count;
              };
          };
          else {;
              local count = 1;
              foreach i of global typlist {;
                  local lbv`i' "`environment' == `i'" ;
                  local labels `labels' label(`count' `lbv`i'') ;
                  local ++count;
              };
          };
          /******************************* GEN KDEN ******************************/
          qui kdensity `varlist' [`weight' `exp'] , n(`number') nograph gen(x c`environment') kernel(`kernel');
          foreach i of global typlist {;
              local cvlist `cvlist' c`environment'`i' ;
              kdensity `varlist' [`weight' `exp'] if `environment' == `i' , nograph gen(c`environment'`i') at(x) kernel(`kernel');
              label var c`environment'`i' `"`lbv`i''"';
          };
          if `"`value'"' != "" {;
              gettoken xmin xmax : value ;
              foreach i of global typlist {;
                  qui replace x =. if !inrange( x , `xmin' , `xmax' ) ;
              };
          };
          /******************************* Drawing ******************************/
          if (strpos("`groptions'" , "sort") == 0) {; local sort "sort" ; };
          if (strpos("`groptions'" , "ytitle") == 0) {; local ytitle "ytitle(Density)" ; };
          if (strpos("`groptions'" , "xtitle") == 0) {; local xtitle "xtitle(`varlabel')" ; };
          if (strpos("`groptions'" , "legend") == 0)	{; local legend " legend( pos(6) row(1) ) " ; };
          if ("`xtitle'" != "") {; local xlabel `xtitle' ; }; else {; local xlabe `varlabel' ; };
          line `cvlist' x , `sort' `ytitle' `xtitle' `legend' `groptions' legend(`labels') ;
      end; /*}}}*/
      /* DOM PROGRAM{{{*/
       capture program drop dom ;
       program define dom, rclass;
          syntax varlist [fw pw aw] , ENVironment(varname numeric) 
          [Value(numlist min=2 max=2  ascending) Percent(numlist min=2 max=2 >=0 <=1 ascending) ///Options for control a test range.
           ACCuracy(integer 40) ]; ///Extra options.
       tempvar X ; tempname temp temp1 temp2 ;
       marksample touse ;
       markout `touse' `environment' ;
      /* MANIPULATE THE TEST RANGE {{{*/
          if (`"`percent'"' != "") {;
              gettoken min max : percent; local min = `min'*100 ; if (`max' == 1) {; local max ; }; else {; local max = `max'*100 ; };
              foreach i of global typlist {;
                  _pctile `varlist' [`weight' `exp'] if `environment' == `i' , p(`min', `max');
                  local min`i'p = r(r1); local max`i'p = r(r2);
              };
          };
          else {;
              foreach i of global typlist {;
                  local min`i'p = -.; local max`i'p = .;
              };
          };
          if (`"`value'"' != "") {;
              gettoken min max : value;
          }; 
          else {;
                  local min = -.; local max = .;
          }; /*}}}*/
       preserve ;
      /*Calculate MinZ MaxZ InterZ{{{*/
          qui inspect `varlist' ;
              if (`accuracy' <= r(N_unique) ) {; local intvalue = 1 ; }; else {; local intvalue = 0 ; };
          foreach i of global typlist { ;
              summarize `varlist' [`weight' `exp'] if `environment' == `i' & `touse' , meanonly;
              local min`i' = r(min); local max`i' = r(max);
          };
          local i = 1 ;
          while (`i' < $typnum) { ;
              local j = `i' +1 ;
              while ( `j' <= $typnum) { ;
                  local min`i'`j' = max(`min`i'',`min`j'', `min' , `min`i'p' , `min`j'p');
                  local max`i'`j' = min(`max`i'',`max`j'', `max' , `max`i'' , `max`j'');
                  if ( `intvalue' == 1 ) {;
                      local inter`i'`j' = (`max`i'`j''-`min`i'`j'')/(`accuracy'-1);
                  };
                  else {;
                      local inter`i'`j' = 1 ;
                      local max`i'`j' = `max`i'`j'' ;
                  };
                  local ++j ;
              };
              local ++i ;
          }; /*}}}*/
       local s = 1;
       while (`s' < 3) { ;
          local i = 1 ;
          while (`i' < $typnum) { ;
              local j = `i' +1 ;
              while ( `j' <= $typnum) { ;
                  /*MAX POINT ERROR CHECK{{{*/
                  if (`max`i'`j'' <= `min`i'`j'') {;
                      display as error "Error: " as text "Max test point"
                          as result " between group `i' and `j'" as text " is not larger than min test point!";
                      exit;
                  }; /*}}}*/
                  local alpha = `s' - 1;
                  local afac = round(exp(lnfactorial(`alpha')),1);
                  qui count if inlist(`environment' , `i' ,`j') ;
                  local df = r(N) - 4 ;
                  local z = `min`i'`j'';
                  /* 범주형 성취에 대한 검증범위 교정; 1차지배는 최댓값 미실시, 2차지배는 최솟값 미실시 {{{*/
                      if ( `intvalue' == 0 & `s' == 1) {; local max`i'`j' = `max`i'`j'' - 1 ;  };
                      if ( `intvalue' == 0 & `s' == 2) {; local max`i'`j' = `max`i'`j'' + 1 ;  };
                      if ( `intvalue' == 0 & `s' == 2) {; local z = `min`i'`j''+1 ; };
                  /*}}}*/
                  local rownum = 1;
                  while (`z' <= `max`i'`j'') {;
                      qui gen double `X' = 0 ;
                      qui replace `X'  = (1/`afac')*((`z'-`varlist')^`alpha') if `varlist'<= `z'  ;
                      qui mean `X' [`weight' `exp'] if `environment' == `i' & `touse' ;
                      matrix est1 = e(b);		matrix var1 = e(V);
                      local  D1 = est1[1,1];	local  VD1 = var1[1,1];
                      qui mean `X' [`weight' `exp'] if `environment' == `j' & `touse' ;
                      matrix est2 = e(b);		matrix var2 = e(V);
                      local D2 = est2[1,1];	local VD2 = var2[1,1];
                      local t = (`D2'-`D1')/sqrt(`VD1'+`VD2'); //The t-statistic
                      qui drop `X' ;
                      /*CREATING RESULT MATRIX{{{*/
                          if (`t' > invttail(`df',.005)) { ; local o005 = 1; }; else {; local o005 = 0; };
                          if (`t' > invttail(`df',.025)) { ; local o025 = 1; }; else {; local o025 = 0; };
                          if (`t' > invttail(`df',.05)) { ; local o05 = 1; }; else {; local o05 = 0; };
                          if (`t' < invttail(`df',.95)) { ; local b95 = 1; }; else {; local b95 = 0; };
                          if (`t' < invttail(`df',.975)) { ; local b975 = 1; }; else {; local b975 = 0; };
                          if (`t' < invttail(`df',.995)) { ; local b995 = 1; }; else {; local b995 = 0; };
                          matrix `temp' = J(1,13,99);
                          matrix colname `temp' = S_order Group1 Group2 Z_value D1 D2 T over005 over025 over05 below995 below975 below95 ;
                          matrix `temp'[1,1] = `s' ;		matrix `temp'[1,2] = `i' ;		matrix `temp'[1,3] = `j' ;
                          matrix `temp'[1,4] = `z' ;		matrix `temp'[1,5] = `D1' ;		matrix `temp'[1,6] = `D2' ;
                          matrix `temp'[1,7] = `t' ;		matrix `temp'[1,8] = `o005' ;	matrix `temp'[1,9] = `o025' ;
                          matrix `temp'[1,10] = `o05' ;	matrix `temp'[1,11] = `b995' ;	matrix `temp'[1,12] = `b975' ;
                          matrix `temp'[1,13] = `b95' ;
                          matrix rowname `temp' = test`rownum' ;
                          matrix rowname `temp' = `i'to`j': ;
                          matrix `temp1' = (nullmat(`temp1') \ `temp') ;
                          local ++rownum ; /*}}}*/
                      local z = `z' + `inter`i'`j'';
                  };
                  local ++j ;
              };
              local ++i;
          };
          local ++s;
       };
       return matrix results = `temp1';
       restore ; 
  end; /*}}}*/
  #delimit cr
  *! A nonparametic analysis tool for (in)equality of opportunity.
  *! Created by Jay Oh on 18th Aug 2017.
  *! First update on Novemver 2019.
  *! Second update on June 2020.
