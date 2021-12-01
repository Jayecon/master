cd ~/dropbox/pnt/figure

use ~/dropbox/timss/timss_regdata.dta , clear

label define OECD 0 "비OECD" 1 "OECD"
label value oecd OECD
label var lnpcgdp           "ln1인당GDP"
label var pl_i              "투자재가격"
label var lnpop             "ln인구"
label var bjtmathp        "PISA총불평등"
label var bjcmathp        "PISA기회불평등"
label var bjemathp        "PISA잔여불평등"
label var bjtmatht        "TIMSS총불평등"
label var bjcmatht        "TIMSS기회불평등"
label var bjematht        "TIMSS잔여불평등"
label var pcgrowth 		  "1인당GDP성장률"

twoway (scatter bjematht bjemathp) (lfit bjematht bjemathp) if inlist(year,2003, 2015)&bjemathp<.027 , by(year)
gr export scatter_eff_math_pnt.png , as(png) replace

twoway (scatter bjtmatht bjtmathp) (lfit bjtmatht bjtmathp) if inlist(year,2003, 2015)&bjtmatht<.03 , by(year)
gr export scatter_tot_math_pnt.png , as(png) replace

twoway (scatter bjcmatht bjcmathp) (lfit bjcmatht bjcmathp) if inlist(year,2003, 2015)&bjcmathp<.013 , by(year)
gr export scatter_env_math_pnt.png , as(png) replace

twoway (scatter lnpcgdp bjtmathp) (lfit lnpcgdp bjtmathp) if bjtmathp<.05 , by(year)
gr export scatter_lnpcgdp_totmath_pisa.png , as(png) replace

twoway (scatter lnpcgdp bjtmatht) (lfit lnpcgdp bjtmatht) if bjtmatht<.04 , by(year)
gr export scatter_lnpcgdp_totmath_timss.png , as(png) replace

twoway (scatter lnpcgdp bjtmathp) (lfit lnpcgdp bjtmathp) if bjtmathp<.05 , by(year oecd )
gr export scatter_lnpcgdp_totmath_pisa_oecd.png , as(png) replace

twoway (scatter lnpcgdp bjtmatht) (lfit lnpcgdp bjtmatht) if bjtmatht<.04 , by(year oecd)
gr export scatter_lnpcgdp_totmath_timss_oecd.png , as(png) replace

twoway (scatter pcgrowth bjtmathp) (lfit pcgrowth bjtmathp) if bjtmathp<.05 , by(year)
gr export scatter_pcgrowth_totmath_pisa.png , as(png) replace

twoway (scatter pcgrowth bjtmatht) (lfit pcgrowth bjtmatht) if bjtmatht<.04 , by(year)
gr export scatter_pcgrowth_totmath_timss.png , as(png) replace

twoway (scatter pcgrowth bjtmathp) (lfit pcgrowth bjtmathp) if bjtmathp<.05 , by(year oecd )
gr export scatter_pcgrowth_totmath_pisa_oecd.png , as(png) replace

twoway (scatter pcgrowth bjtmatht) (lfit pcgrowth bjtmatht) if bjtmatht<.04 , by(year oecd)
gr export scatter_pcgrowth_totmath_timss_oecd.png , as(png) replace

twoway (scatter pcgrowth bjtmathp) (lfit pcgrowth bjtmathp) if bjtmathp<.05 ,
gr export scatter_pcgrowth_totmath_pisa_noy.png , as(png) replace

twoway (scatter pcgrowth bjtmatht) (lfit pcgrowth bjtmatht) if bjtmatht<.04 , 
gr export scatter_pcgrowth_totmath_timss_noy.png , as(png) replace

twoway (scatter pcgrowth bjtmathp) (lfit pcgrowth bjtmathp) if bjtmathp<.05 , by( oecd )
gr export scatter_pcgrowth_totmath_pisa_oecd_noy.png , as(png) replace

twoway (scatter pcgrowth bjtmatht) (lfit pcgrowth bjtmatht) if bjtmatht<.04 , by( oecd)
gr export scatter_pcgrowth_totmath_timss_oecd_noy.png , as(png) replace

gr matrix pcgrowth bjtmathp bjcmathp bjemathp ,

gr matrix pcgrowth bjtmatht bjcmatht bjematht ,


gr drop total oecd noecd
aaplot pcgrowth bjtmatht 			, name(total) title(전체)
aaplot pcgrowth bjtmatht if oecd	, name(oecd) title(OECD)
aaplot pcgrowth bjtmatht if !oecd	, name(noecd) title(비OECD)
grc1leg  total oecd noecd , 
gr export scatter_pcgrowth_totmath_timss_oecd_lfit.png , as(png) replace

gr drop total oecd noecd
aaplot pcgrowth bjtmathp 			, name(total) title(전체)
aaplot pcgrowth bjtmathp if oecd	, name(oecd) title(OECD)
aaplot pcgrowth bjtmathp if !oecd	, name(noecd) title(비OECD)
grc1leg  total oecd noecd , 
gr export scatter_pcgrowth_totmath_pisa_oecd_lfit.png , as(png) replace


gr drop total oecd noecd
twoway (scatter pcgrowth bjtmatht) (lfit pcgrowth bjtmatht) if bjtmatht<.04 , name(total) title(전체)
twoway (scatter pcgrowth bjtmatht) (lfit pcgrowth bjtmatht) if bjtmatht<.04 & oecd , name(oecd) title(OECD)
twoway (scatter pcgrowth bjtmatht) (lfit pcgrowth bjtmatht) if bjtmatht<.04 & !oecd, name(noecd) title(비OECD)
grc1leg  total oecd noecd  , xcom ycom
gr export scatter_pcgrowth_totmath_timss_oecd_lfit.png , as(png) replace
