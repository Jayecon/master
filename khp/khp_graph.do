cd ~/dropbox/data/khp
use khp_idx , clear
sort
format *gini* %9.3f
format year %9.0f

local mygropt graphregion(color(white))
twoway (connect dtpvty year, mlabs(vsmall) mlabel(dtpvty) mlabp(12)) ///
       (connect mtpvty year, mlabs(vsmall) mlabel(mtpvty) mlabp(12)) ///
       (connect dwpvty year, mlabs(vsmall) mlabel(dwpvty) mlabp(6) msymbol(d)) ///
       (connect mwpvty year, mlabs(vsmall) mlabel(mwpvty) mlabp(6) msymbol(d)) ///
       , `mygropt' saving(khp_pvty.gph , replace)

twoway (connect dtgini year, mlabs(vsmall) mlabel(dtgini) mlabp(12)) ///
       (connect mtgini year, mlabs(vsmall) mlabel(mtgini) mlabp(6)) ///
       (connect dwgini year, mlabs(vsmall) mlabel(dwgini) mlabp(12) msymbol(d)) ///
       (connect mwgini year, mlabs(vsmall) mlabel(mwgini) mlabp(12) msymbol(d)) ///
       , `mygropt' saving(khp_gini.gph , replace)

twoway (connect dtfive year, mlabs(vsmall) mlabel(dtfive) mlabp(12)) ///
       (connect dwfive year, mlabs(vsmall) mlabel(dwfive) mlabp(6) msymbol(d)) ///
       , `mygropt' saving(khp_five.gph , replace)

twoway (connect ginim  year, mlabs(vsmall) mlabel(ginim)  mlabp(12)) ///
       (connect ginit  year, mlabs(vsmall) mlabel(ginit)  mlabp(12)) ///
       (connect mwgini year, mlabs(vsmall) mlabel(mwgini) mlabp(6) msymbol(d)) ///
       (connect dwgini year, mlabs(vsmall) mlabel(dwgini) mlabp(12) msymbol(d)) ///
       , `mygropt' saving(khp_ginih.gph , replace)

twoway (connect cim1m  year,  mlabs(vsmall) mlabel(cim1m)  mlabp(6)  ) ///
       (connect cim1t  year,  mlabs(vsmall) mlabel(cim1t)  mlabp(12) ) ///
       (connect dwgini year,  mlabs(vsmall) mlabel(dwgini) mlabp(6)  msymbol(d)) ///
       (connect mwgini year,  mlabs(vsmall) mlabel(mwgini) mlabp(6)   msymbol(d)) ///
       , `mygropt' saving(khp_ginici.gph , replace)

twoway (connect cim1t  year, mlabs(vsmall) mlabel(cim1m)  mlabp(6)  yaxis(2)) ///
       (connect cim5t  year, mlabs(vsmall) mlabel(cim5m)  mlabp(12) yaxis(2)) ///
       (connect dwgini year, mlabs(vsmall) mlabel(mwgini) mlabp(6)  msymbol(dh) lpattern(dash)) ///
       , `mygropt' saving(khp_cit.gph , replace)

twoway (connect cim1m year,  mlabs(vsmall) mlabel(cim1m)  mlabp(6)  yaxis(2)) ///
       (connect cim5m year,  mlabs(vsmall) mlabel(cim5m)  mlabp(12) yaxis(2)) ///
       (connect mwgini year, mlabs(vsmall) mlabel(mwgini) mlabp(6)  msymbol(dh) lpattern(dash)) ///
       , `mygropt' saving(khp_cim.gph , replace)
