cd ~/dropbox/klips/results

gr drop _all

local count = 1
foreach i in goi rri {
	foreach j in edugrp jobgrp pcagrp2{
		foreach k in all 3050 {
			use ~/dropbox/klips/`i'_`j'_`k' , clear
			gen test = "`i'" 
			gen env = "`j'"  
			gen cond = "`k'"
			if (`count' == 1) {
				save incn1tm_index , replace
			}
			else {
				append using incn1tm_index
				save incn1tm_index , replace
			}
			local ++count
		}
	}
}

gen year = wave + 1997
format year %02.0f
replace year = year - 1900 if year < 2000
replace year = year - 2000 if year >= 2000
save ~/dropbox/klips/incn1tm_index , replace

use ~/dropbox/klips/incn1tm_index , clear

foreach i in goi rri {
	foreach j in edugrp jobgrp pcagrp2 {
		foreach k in all 3050 {
			if "`j'" == "edugrp" {
				local xl1 가구주부친교육환경 
			}
			else if "`j'" == "jobgrp" {
				local xl1 가구주부친직업환경 
			}
			else {
				local xl1 주성분점수환경
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
			else if "`k'" == "3050" {
				local xl3 30-50세
			}
			*twoway (rarea uci95 lci95 wave , color(gs14)) (line index wave) if test == "`i'" & env == "`j'" & cond == "`k'" , xtitle(`xl1'하 `xl2': `xl3' , size(automatic))
			line index wave if test == "`i'" & env == "`j'" & cond == "`k'" , xtitle(`xl1'하 `xl2': `xl3')
			gr save incn1tm_`j'_`i'_`k' , replace
			gr export incn1tm_`j'_`i'_`k'.png , as(png) replace
		}
	}
}

capture gr drop temp1 temp2
grc1leg incn1tm_pcagrp2_goi_all.gph incn1tm_pcagrp2_goi_3050.gph , ycommon name(temp1)
grc1leg incn1tm_pcagrp2_rri_all.gph incn1tm_pcagrp2_rri_3050.gph , ycommon name(temp2)
grc1leg temp1 temp2, col(1)
gr save incn1tm_pcagrp_index.gph , replace
gr export incn1tm_pcagrp_index.png , as(png) replace



capture gr drop temp1 temp2
grc1leg incn1tm_jobgrp_goi_all.gph incn1tm_jobgrp_goi_3050.gph , ycommon name(temp1)
grc1leg incn1tm_jobgrp_rri_all.gph incn1tm_jobgrp_rri_3050.gph , ycommon name(temp2)
grc1leg temp1 temp2, col(1)
gr save incn1tm_jobgrp_index.gph , replace
gr export incn1tm_jobgrp_index.png , as(png) replace



capture gr drop temp1 temp2
grc1leg incn1tm_edugrp_goi_all.gph incn1tm_edugrp_goi_3050.gph , ycommon name(temp1)
grc1leg incn1tm_edugrp_rri_all.gph incn1tm_edugrp_rri_3050.gph , ycommon name(temp2)
grc1leg temp1 temp2, col(1)
gr save incn1tm_edugrp_index.gph , replace
gr export incn1tm_edugrp_index.png , as(png) replace
