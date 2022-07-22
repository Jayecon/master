pause off
cd ~/dropbox/pees
tempfile temp
local varrename area region school grade totexp sex childnum childord score agepap edupap agemom edumom jobstat income wt
clear

  use rawdata/2019_c
    keep v1 v2 v3 v4 v10 v11 v13 v15 v17 v19 v21 v23 v24 v25 v26 v29
    rename (v1-v29) (`varrename')
    gen year = 2019
    save `temp' , replace
  use rawdata/2020_c
    keep v1-v4 v7-v17 v20
    rename (v1-v20) (`varrename')
    gen year = 2020
    append using `temp' 
    save `temp' , replace
  use rawdata/2021_c
    keep v1-v4 v10 v11 v13 v15 v17-v23 v26 
    rename (v1-v26) (`varrename')
    gen year = 2021
    append using `temp' 
    save `temp' , replace
	pause
<<<<<<< Updated upstream
  merge m:m region year using corona.dta
        drop if region == 99
        drop if year == 2022
        foreach i of var confirmed-ndeath {
            replace `i' = 0  if year == 2019
        }
save rawdata/pees.dta , replace
=======
  merge m:m region year using rawdata/corona.dta , nogen
		drop if region == 99
		drop if year == 2022
		foreach i of var confirmed-ndeath {
			replace `i' = 0  if year == 2019
		}
	merge m:m region year using rawdata/pisummary.dta , nogen
	merge m:m region year using rawdata/rgnpop.dta , nogen
save pees.dta , replace
>>>>>>> Stashed changes
