cd ~/dropbox/klips

local count = 1
foreach i in goi rri {
	foreach j in edugrp jobgrp {
		foreach k in all 3050 {
			use `i'_`j'_`k' , clear
			drop if missing(wave)
			if (`count' == 1) {
				save klips_index , replace
			}
			else {
				append using klips_index
				save klips_index , replace
			}
			local ++count
		}
	}
}

gen year = wave + 1997
format year %02.0f
replace year = year - 1900 if year < 2000
replace year = year - 2000 if year >= 2000
save klips_index , replace

foreach i in goi rri {
	foreach j in edu job {
		foreach k in all 3050 {
			if "`j'" == "edu" {
				local xl1 가구주부친학력환경 
			}
			else {
				local xl1 가구주부친직업환경
			}
			if "`i'" == "goi" {
				local xl2 지니기회불평등지수 
			}
			else {
				local xl2 개천용기회불평등지수
			}
			if "`k'" == "all" {
				local xl3 전연령 
			}
			else {
				local xl3 30-50세
			}
			line index wave if test == "`i'" & env == "`j'" & cond == "`k'" , xtitle(`xl1'하 `xl2': `xl3' , size(automatic))
			*twoway (rarea uci95 lci95 wave , color(gs14)) (line index wave) if test == "`i'" & env == "`j'" & cond == "`k'" , xtitle(`xl1'하 `xl2': `xl3' , size(automatic))
			gr save `c(pwd)'/figure/`j'_`i'_`k' , replace
			gr export `c(pwd)'/figure/`j'_`i'_`k' , as(png) replace
		}
	}
}

cd figure

capture gr drop temp1 temp2
grc1leg edu_goi_all.gph edu_goi_3050.gph , ycommon name(temp1)
grc1leg  edu_rri_all.gph edu_rri_3050.gph , ycommon name(temp2)
grc1leg temp1 temp2, col(1)
gr save edu_index.gph , replace
gr export edu_index.png , as(png) replace


capture gr drop temp1 temp2
grc1leg job_goi_all.gph job_goi_3050.gph , ycommon name(temp1)
grc1leg  job_rri_all.gph job_rri_3050.gph , ycommon name(temp2)
grc1leg temp1 temp2, col(1)
gr save job_index.gph , replace
gr export job_index.png , as(png) replace

	
	
