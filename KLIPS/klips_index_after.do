cd ~/dropbox/klips/

gr drop _all

local count = 1
foreach i in goi rri {
  foreach j in edugrp jobgrp pcagrp{
    foreach k in all 3050 {
      use results/`i'_`j'_`k' , clear
      gen test = "`i'" 
      gen env = "`j'"  
      gen cond = "`k'"
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


