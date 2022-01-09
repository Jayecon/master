  tempfile tf1

  cd ~/dropbox
  use pnt/pnt_regdata , clear
    rename cntab3 cntabc3
    merge m:1 cntabc3 using data_extras/countrycode_1
    drop if _merge == 2
    drop _merge
    gen ISO  = cntabc2
    save `tf1' 
  use ~/git/gis/world , clear
    merge m:m ISO using `tf1'

  /*Hong Kong , Macao and Taiwan are excluded due to the missing gis */

  colorpalette w3 cyan, n(11)  nograph
    local colors `r(p)'
  forvalues i = 2000(3)2018 {
    spmap bjtmathp using ~/git/gis/world_shp  if year == `i' | _m == 1 ,  ///
      id(_ID) ndsize(vvthin ..) ocolor(black ..) osize(vvthin ..)         ///
      clmethod(custom) clbreaks(0(0.004)0.04 1)  fcolor("`colors'")       ///
      legend(pos(7) size(0.8)) legstyle(2)                                ///
      title("PISA `i'년 총불평등", size(small))                           ///
      note("참고 : 대만, 마카우, 홍콩은 제외됨." , size(tiny))
    gr export ~/dropbox/pnt/figure/map_bjtpisa_`i'.png , as(png) replace
  }

  colorpalette w3 lime, n(11)  nograph
    local colors `r(p)'
  forvalues i = 1995(4)2019 {
    spmap bjtmatht using ~/git/gis/world_shp  if year == `i' | _m == 1 ,  ///
      id(_ID) ndsize(vvthin ..) ocolor(black ..) osize(vvthin ..)         ///
      clmethod(custom) clbreaks(0(0.004)0.04 1)  fcolor("`colors'")       ///
      legend(pos(7) size(0.8)) legstyle(2)                                ///
      title("TIMSS `i'년 총불평등", size(small))                          ///
      note("참고 : 대만, 마카우, 홍콩은 제외됨." , size(tiny))           
    gr export ~/dropbox/pnt/figure/map_bjttimss_`i'.png , as(png) replace
  }

  colorpalette w3 indigo, n(11)  nograph
    local colors `r(p)'
  forvalues i = 2000(3)2018 {
    spmap bjrmathp using ~/git/gis/world_shp  if year == `i' | _m == 1 ,  ///
      id(_ID) ndsize(vvthin ..) ocolor(black ..) osize(vvthin ..)         ///
      clmethod(custom) clbreaks(0(0.04)0.4 1)  fcolor("`colors'")         ///
      legend(pos(7) size(0.8)) legstyle(2)                                ///
      title("PISA `i'년 기회불평등비중", size(small))                     ///
      note("참고 : 대만, 마카우, 홍콩은 제외됨." , size(tiny))
    gr export ~/dropbox/pnt/figure/map_bjrpisa_`i'.png , as(png) replace
  }

  colorpalette w3 light-green, n(11)  nograph
    local colors `r(p)'	
  forvalues i = 1995(4)2019 {
    spmap bjrmatht using ~/git/gis/world_shp  if year == `i' | _m == 1 ,  ///
      id(_ID) ndsize(vvthin ..) ocolor(black ..) osize(vvthin ..)         ///
      clmethod(custom) clbreaks(0(0.04)0.4 1)  fcolor("`colors'")         ///
      legend(pos(7) size(0.8)) legstyle(2)                                ///
      title("TIMSS `i'년 기회불평등비중", size(small))                    ///
      note("참고 : 대만, 마카우, 홍콩은 제외됨." , size(tiny))
    gr export ~/dropbox/pnt/figure/map_bjrtimss_`i'.png , as(png) replace
  }

  bys cntabc3 : egen bjmmathp = mean(bjtmathp)
  bys cntabc3 : egen bjmmatht = mean(bjtmatht)
  bys cntabc3 : egen bjmrmathp = mean(bjrmathp)
  bys cntabc3 : egen bjmrmatht = mean(bjrmatht)
  bys cntabc3 : gen first = (_n == 1)

  colorpalette w3 cyan, n(11)  nograph
    local colors `r(p)'
  spmap bjmmathp using ~/git/gis/world_shp  if first | _m == 1 ,  ///
    id(_ID) ndsize(vvthin ..) ocolor(black ..) osize(vvthin ..)   ///
    clmethod(custom) clbreaks(0(0.004)0.04 1)  fcolor("`colors'") ///
    legend(pos(7) size(0.8)) legstyle(2)                          ///
    title("PISA 총불평등 평균", size(small))                      ///
    note("참고 : 대만, 마카우, 홍콩은 제외됨." , size(tiny))
  gr export ~/dropbox/pnt/figure/map_bjtpisa_mean.png , as(png) replace


  colorpalette w3 lime, n(11)  nograph
    local colors `r(p)'	
  spmap bjmmatht using ~/git/gis/world_shp  if first | _m == 1 ,  ///
    id(_ID) ndsize(vvthin ..) ocolor(black ..) osize(vvthin ..)   ///
    clmethod(custom) clbreaks(0(0.004)0.04 1)  fcolor("`colors'") ///
    legend(pos(7) size(0.8)) legstyle(2)                          ///
    title("TIMSS 총불평등 평균", size(small))                     ///
    note("참고 : 대만, 마카우, 홍콩은 제외됨." , size(tiny))
  gr export ~/dropbox/pnt/figure/map_bjttimss_mean.png , as(png) replace

  colorpalette w3 indigo, n(11)  nograph
    local colors `r(p)'
  spmap bjmrmathp using ~/git/gis/world_shp  if first | _m == 1 , ///
    id(_ID) ndsize(vvthin ..) ocolor(black ..) osize(vvthin ..)   ///
    clmethod(custom) clbreaks(0(0.04)0.4 1)  fcolor("`colors'")   ///
    legend(pos(7) size(0.8)) legstyle(2)                          ///
    title("PISA 기회불평등비중 평균", size(small))                ///
    note("참고 : 대만, 마카우, 홍콩은 제외됨." , size(tiny))
  gr export ~/dropbox/pnt/figure/map_bjrpisa_mean.png , as(png) replace


  colorpalette w3 light-green, n(11)  nograph
    local colors `r(p)'	
  spmap bjmrmatht using ~/git/gis/world_shp  if first | _m == 1 , ///
    id(_ID) ndsize(vvthin ..) ocolor(black ..) osize(vvthin ..)   ///
    clmethod(custom) clbreaks(0(0.04)0.4 1)  fcolor("`colors'")   ///
    legend(pos(7) size(0.8)) legstyle(2)                          ///
    title("TIMSS 기회불평등비중 평균", size(small))               ///
    note("참고 : 대만, 마카우, 홍콩은 제외됨." , size(tiny))
  gr export ~/dropbox/pnt/figure/map_bjrtimss_mean.png , as(png) replace



  /*
  forvalues i = 2000(3)2018 {
    sum bjtmathp if year == `i', meanonly
    local max  = round(r(max) , 0.001) + 0.001
    local div = `max'/10

    spmap bjtmathp using ~/git/gis/world_shp  if year == `i' | _m == 1 , ///
      id(_ID) ndsize(vvthin ..) ocolor(black ..) osize(vvthin ..)  ///
      clmethod(custom) clbreaks(0(`div') `max')  fcolor("`colors'")  ///
      legend(pos(7) size(0.8)) legstyle(2) /// 
      note("참고 : 대만, 마카우, 홍콩은 제외됨." , size(tiny))
    gr export ~/dropbox/pnt/figure/map_bjtpisa_`i'.png , as(png) replace
  }
    
  forvalues i = 1995(4)2019 {
    sum bjtmatht if year == `i', meanonly
    local max  = round(r(max) , 0.001) + 0.001
    local div = `max'/10

    spmap bjtmatht using ~/git/gis/world_shp  if year == `i' | _m == 1 , ///
      id(_ID) ndsize(vvthin ..) ocolor(black ..) osize(vvthin ..)  ///
      clmethod(custom) clbreaks(0(`div') `max')  fcolor("`colors'")  ///
      legend(pos(7) size(0.8)) legstyle(2) /// 
      note("참고 : 대만, 마카우, 홍콩은 제외됨." , size(tiny))
    gr export ~/dropbox/pnt/figure/map_bjttimss_`i'.png , as(png) replace
  }
  */
