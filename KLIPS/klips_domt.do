cd ~/dropbox/klips/results

use ~/dropbox/klips/klips.dta , clear

capture log close

log using klips_domtest_edugrp_all , replace
forvalue y = 1998/2020 { 
  di as text "Year = " as input "`y'" 
  eopcal incn1m [aw=wgt] if year == `y' & head , env(edugrp) dom percent(0.025 0.975)
  di ""
}
log close

log using klips_domtest_edugrp_3050 , replace
forvalue y = 1998/2020 { 
  di as text "Year = " as input "`y'" 
  eopcal incn1m [aw=wgt] if year == `y' & h3050 , env(edugrp) dom percent(0.025 0.975)
  di ""
}
log close

log using klips_domtest_jobgrp_all , replace
forvalue y = 1998/2020 { 
  di as text "Year = " as input "`y'" 
  eopcal incn1m [aw=wgt] if year == `y' & head , env(jobgrp) dom percent(0.025 0.975)
  di ""
}
log close

log using klips_domtest_jobgrp_3050 , replace
forvalue y = 1998/2020 { 
  di as text "Year = " as input "`y'" 
  eopcal incn1m [aw=wgt] if year == `y' & h3050 , env(jobgrp) dom percent(0.025 0.975)
  di ""
}
log close
