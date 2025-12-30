cd "C:\MyWorks\GOMS\"

use "goms.dta", clear


g top5 = (unirank<=5) 
g female = (sex==2) if sex!=.

g edum = .
replace edum = 0 if p029==1
replace edum = 6 if p029==2 & p030==1
replace edum = 3 if p029==2 & p030!=1
replace edum = 9 if p029==3 & p030==1
replace edum = 7.5 if p029==3 & p030!=1
replace edum = 12 if p029==4 & p030==1
replace edum = 10.5 if p029==4 & p030!=1
replace edum = 14 if p029==5 & p030==1
replace edum = 13 if p029==5 & p030!=1
replace edum = 16 if p029==6 & p030==1
replace edum = 14 if p029==6 & p030!=1
replace edum = 18 if p029==7 & p030==1
replace edum = 17 if p029==7 & p030!=1

g eduf = .
replace eduf = 0 if p026==1
replace eduf = 6 if p026==2 & p027==1
replace eduf = 3 if p026==2 & p027!=1
replace eduf = 9 if p026==3 & p027==1
replace eduf = 7.5 if p026==3 & p027!=1
replace eduf = 12 if p026==4 & p027==1
replace eduf = 10.5 if p026==4 & p027!=1
replace eduf = 14 if p026==5 & p027==1
replace eduf = 13 if p026==5 & p027!=1
replace eduf = 16 if p026==6 & p027==1
replace eduf = 14 if p026==6 & p027!=1
replace eduf = 18 if p026==7 & p027==1
replace eduf = 17 if p026==7 & p027!=1

g tophs = (f009>=6)

*tab incgrp, g(faminc)
tab rgngrp, g(region)

g reexamlength = reexamy
replace reexamlength = 0 if reexamlength==.

drop if majgrp==1
drop if f010==1

tab p034, g(famimc)

drop if f009 == 1
drop if f009 == 4
keep if school==2


reg top5 tophs, r
reg top5 tophs female reexamlength edum eduf   famimc3 famimc4 famimc5 famimc6 famimc7 famimc8 region2 region3  fage, r
outreg2 using table1.doc, replace   title(Regression for entering Top 5 university) dec(4)
reg top5 tophs female reexamlength edum eduf   famimc3 famimc4 famimc5 famimc6 famimc7 famimc8 region2 region3  fage if f013==1, r
outreg2 using table1.doc, append   title(Regression for entering Top 5 university) dec(4)
reg top5 tophs female reexamlength edum eduf   famimc3 famimc4 famimc5 famimc6 famimc7 famimc8 region2 region3  fage if f013==2, r
outreg2 using table1.doc, append   title(Regression for entering Top 5 university) dec(4)

keep if e(sample)


reg top5 tophs female reexamlength edum eduf   famimc3 famimc4 famimc5 famimc6 famimc7 famimc8 fage if region3==1 , r
outreg2 using table2.doc, replace   title(Regression for entering Top 5 university) dec(4)
reg top5 tophs female reexamlength edum eduf   famimc3 famimc4 famimc5 famimc6 famimc7 famimc8 fage if region1==1 , r
outreg2 using table2.doc, append   title(Regression for entering Top 5 university) dec(4)
reg top5 tophs female reexamlength edum eduf   famimc3 famimc4 famimc5 famimc6 famimc7 famimc8 fage if region2==1 , r
outreg2 using table2.doc, append   title(Regression for entering Top 5 university) dec(4)

reg top5 tophs female reexamlength edum eduf   region2 region3 fage if p034<=3 , r
outreg2 using table3.doc, replace   title(Regression for entering Top 5 university) dec(4)
reg top5 tophs female reexamlength edum eduf   region2 region3 fage if p034>3 & p034<=6 , r
outreg2 using table3.doc, append   title(Regression for entering Top 5 university) dec(4)
reg top5 tophs female reexamlength edum eduf   region2 region3 fage if p034>=7 , r
outreg2 using table3.doc, append   title(Regression for entering Top 5 university) dec(4)
/*Jay's working Area*/




use "goms.dta", clear


g top5 = (unirank<=5) 
g female = (sex==2) if sex!=.

g edum = .
replace edum = 0 if p029==1
replace edum = 6 if p029==2 & p030==1
replace edum = 3 if p029==2 & p030!=1
replace edum = 9 if p029==3 & p030==1
replace edum = 7.5 if p029==3 & p030!=1
replace edum = 12 if p029==4 & p030==1
replace edum = 10.5 if p029==4 & p030!=1
replace edum = 14 if p029==5 & p030==1
replace edum = 13 if p029==5 & p030!=1
replace edum = 16 if p029==6 & p030==1
replace edum = 14 if p029==6 & p030!=1
replace edum = 18 if p029==7 & p030==1
replace edum = 17 if p029==7 & p030!=1

g eduf = .
replace eduf = 0 if p026==1
replace eduf = 6 if p026==2 & p027==1
replace eduf = 3 if p026==2 & p027!=1
replace eduf = 9 if p026==3 & p027==1
replace eduf = 7.5 if p026==3 & p027!=1
replace eduf = 12 if p026==4 & p027==1
replace eduf = 10.5 if p026==4 & p027!=1
replace eduf = 14 if p026==5 & p027==1
replace eduf = 13 if p026==5 & p027!=1
replace eduf = 16 if p026==6 & p027==1
replace eduf = 14 if p026==6 & p027!=1
replace eduf = 18 if p026==7 & p027==1
replace eduf = 17 if p026==7 & p027!=1

g tophs = (f009>=6)

*tab incgrp, g(faminc)
tab rgngrp, g(region)

g reexamlength = reexamy
replace reexamlength = 0 if reexamlength==.

drop if majgrp==1
drop if f010==1

tab p034, g(famimc)

drop if f009 == 1
drop if f009 == 4
keep if school==2


reg top5 tophs female reexamlength edum eduf   famimc3 famimc4 famimc5 famimc6 famimc7 famimc8 region2 region3  fage, r
keep top5 tophs female reexamlength edum eduf  famimc3 famimc4 famimc5 famimc6 famimc7 famimc8  region2 region3  fage
keep if e(sample)
outsheet using "goms.csv", comma replace nolabel



use "goms.dta", clear


g top5 = (unirank<=5) 
g female = (sex==2) if sex!=.

g edum = .
replace edum = 0 if p029==1
replace edum = 6 if p029==2 & p030==1
replace edum = 3 if p029==2 & p030!=1
replace edum = 9 if p029==3 & p030==1
replace edum = 7.5 if p029==3 & p030!=1
replace edum = 12 if p029==4 & p030==1
replace edum = 10.5 if p029==4 & p030!=1
replace edum = 14 if p029==5 & p030==1
replace edum = 13 if p029==5 & p030!=1
replace edum = 16 if p029==6 & p030==1
replace edum = 14 if p029==6 & p030!=1
replace edum = 18 if p029==7 & p030==1
replace edum = 17 if p029==7 & p030!=1

g eduf = .
replace eduf = 0 if p026==1
replace eduf = 6 if p026==2 & p027==1
replace eduf = 3 if p026==2 & p027!=1
replace eduf = 9 if p026==3 & p027==1
replace eduf = 7.5 if p026==3 & p027!=1
replace eduf = 12 if p026==4 & p027==1
replace eduf = 10.5 if p026==4 & p027!=1
replace eduf = 14 if p026==5 & p027==1
replace eduf = 13 if p026==5 & p027!=1
replace eduf = 16 if p026==6 & p027==1
replace eduf = 14 if p026==6 & p027!=1
replace eduf = 18 if p026==7 & p027==1
replace eduf = 17 if p026==7 & p027!=1

g tophs = (f009>=6)

*tab incgrp, g(faminc)
tab rgngrp, g(region)

g reexamlength = reexamy
replace reexamlength = 0 if reexamlength==.

drop if majgrp==1
drop if f010==1

tab p034, g(famimc)

drop if f009 == 1
drop if f009 == 4
keep if school==2

reg top5 tophs female reexamlength edum eduf   famimc3 famimc4 famimc5 famimc6 famimc7 famimc8 region2 region3  fage if f013==1, r
keep if e(sample)
keep top5 tophs female reexamlength edum eduf   famimc3 famimc4 famimc5 famimc6 famimc7 famimc8 region2 region3 
outsheet using "goms_2.csv", comma replace nolabel



use "goms.dta", clear


g top5 = (unirank<=5) 
g female = (sex==2) if sex!=.

g edum = .
replace edum = 0 if p029==1
replace edum = 6 if p029==2 & p030==1
replace edum = 3 if p029==2 & p030!=1
replace edum = 9 if p029==3 & p030==1
replace edum = 7.5 if p029==3 & p030!=1
replace edum = 12 if p029==4 & p030==1
replace edum = 10.5 if p029==4 & p030!=1
replace edum = 14 if p029==5 & p030==1
replace edum = 13 if p029==5 & p030!=1
replace edum = 16 if p029==6 & p030==1
replace edum = 14 if p029==6 & p030!=1
replace edum = 18 if p029==7 & p030==1
replace edum = 17 if p029==7 & p030!=1

g eduf = .
replace eduf = 0 if p026==1
replace eduf = 6 if p026==2 & p027==1
replace eduf = 3 if p026==2 & p027!=1
replace eduf = 9 if p026==3 & p027==1
replace eduf = 7.5 if p026==3 & p027!=1
replace eduf = 12 if p026==4 & p027==1
replace eduf = 10.5 if p026==4 & p027!=1
replace eduf = 14 if p026==5 & p027==1
replace eduf = 13 if p026==5 & p027!=1
replace eduf = 16 if p026==6 & p027==1
replace eduf = 14 if p026==6 & p027!=1
replace eduf = 18 if p026==7 & p027==1
replace eduf = 17 if p026==7 & p027!=1

g tophs = (f009>=6)

*tab incgrp, g(faminc)
tab rgngrp, g(region)

g reexamlength = reexamy
replace reexamlength = 0 if reexamlength==.

drop if majgrp==1
drop if f010==1

tab p034, g(famimc)

drop if f009 == 1
drop if f009 == 4
keep if school==2

reg top5 tophs female reexamlength edum eduf   famimc3 famimc4 famimc5 famimc6 famimc7 famimc8 region2 region3  fage if f013==2, r
keep if e(sample)
keep top5 tophs female reexamlength edum eduf   famimc3 famimc4 famimc5 famimc6 famimc7 famimc8 region2 region3 
outsheet using "goms_3.csv", comma replace nolabel



use "goms.dta", clear


g top5 = (unirank<=5) 
g female = (sex==2) if sex!=.

g edum = .
replace edum = 0 if p029==1
replace edum = 6 if p029==2 & p030==1
replace edum = 3 if p029==2 & p030!=1
replace edum = 9 if p029==3 & p030==1
replace edum = 7.5 if p029==3 & p030!=1
replace edum = 12 if p029==4 & p030==1
replace edum = 10.5 if p029==4 & p030!=1
replace edum = 14 if p029==5 & p030==1
replace edum = 13 if p029==5 & p030!=1
replace edum = 16 if p029==6 & p030==1
replace edum = 14 if p029==6 & p030!=1
replace edum = 18 if p029==7 & p030==1
replace edum = 17 if p029==7 & p030!=1

g eduf = .
replace eduf = 0 if p026==1
replace eduf = 6 if p026==2 & p027==1
replace eduf = 3 if p026==2 & p027!=1
replace eduf = 9 if p026==3 & p027==1
replace eduf = 7.5 if p026==3 & p027!=1
replace eduf = 12 if p026==4 & p027==1
replace eduf = 10.5 if p026==4 & p027!=1
replace eduf = 14 if p026==5 & p027==1
replace eduf = 13 if p026==5 & p027!=1
replace eduf = 16 if p026==6 & p027==1
replace eduf = 14 if p026==6 & p027!=1
replace eduf = 18 if p026==7 & p027==1
replace eduf = 17 if p026==7 & p027!=1

g tophs = (f009>=6)

*tab incgrp, g(faminc)
tab rgngrp, g(region)

g reexamlength = reexamy
replace reexamlength = 0 if reexamlength==.

drop if majgrp==1
drop if f010==1

tab p034, g(famimc)

drop if f009 == 1
drop if f009 == 4
keep if school==2


reg top5 tophs female reexamlength edum eduf   famimc3 famimc4 famimc5 famimc6 famimc7 famimc8 fage if region3==1 , r
keep if e(sample)
keep top5 tophs female reexamlength edum eduf   famimc3 famimc4 famimc5 famimc6 famimc7 famimc8 fage 
outsheet using "goms2_1.csv", comma replace nolabel



use "goms.dta", clear


g top5 = (unirank<=5) 
g female = (sex==2) if sex!=.

g edum = .
replace edum = 0 if p029==1
replace edum = 6 if p029==2 & p030==1
replace edum = 3 if p029==2 & p030!=1
replace edum = 9 if p029==3 & p030==1
replace edum = 7.5 if p029==3 & p030!=1
replace edum = 12 if p029==4 & p030==1
replace edum = 10.5 if p029==4 & p030!=1
replace edum = 14 if p029==5 & p030==1
replace edum = 13 if p029==5 & p030!=1
replace edum = 16 if p029==6 & p030==1
replace edum = 14 if p029==6 & p030!=1
replace edum = 18 if p029==7 & p030==1
replace edum = 17 if p029==7 & p030!=1

g eduf = .
replace eduf = 0 if p026==1
replace eduf = 6 if p026==2 & p027==1
replace eduf = 3 if p026==2 & p027!=1
replace eduf = 9 if p026==3 & p027==1
replace eduf = 7.5 if p026==3 & p027!=1
replace eduf = 12 if p026==4 & p027==1
replace eduf = 10.5 if p026==4 & p027!=1
replace eduf = 14 if p026==5 & p027==1
replace eduf = 13 if p026==5 & p027!=1
replace eduf = 16 if p026==6 & p027==1
replace eduf = 14 if p026==6 & p027!=1
replace eduf = 18 if p026==7 & p027==1
replace eduf = 17 if p026==7 & p027!=1

g tophs = (f009>=6)

*tab incgrp, g(faminc)
tab rgngrp, g(region)

g reexamlength = reexamy
replace reexamlength = 0 if reexamlength==.

drop if majgrp==1
drop if f010==1

tab p034, g(famimc)

drop if f009 == 1
drop if f009 == 4
keep if school==2


reg top5 tophs female reexamlength edum eduf   famimc3 famimc4 famimc5 famimc6 famimc7 famimc8 fage if region2==1 , r
keep if e(sample)
keep top5 tophs female reexamlength edum eduf   famimc3 famimc4 famimc5 famimc6 famimc7 famimc8 fage 
outsheet using "goms2_2.csv", comma replace nolabel



use "goms.dta", clear


g top5 = (unirank<=5) 
g female = (sex==2) if sex!=.

g edum = .
replace edum = 0 if p029==1
replace edum = 6 if p029==2 & p030==1
replace edum = 3 if p029==2 & p030!=1
replace edum = 9 if p029==3 & p030==1
replace edum = 7.5 if p029==3 & p030!=1
replace edum = 12 if p029==4 & p030==1
replace edum = 10.5 if p029==4 & p030!=1
replace edum = 14 if p029==5 & p030==1
replace edum = 13 if p029==5 & p030!=1
replace edum = 16 if p029==6 & p030==1
replace edum = 14 if p029==6 & p030!=1
replace edum = 18 if p029==7 & p030==1
replace edum = 17 if p029==7 & p030!=1

g eduf = .
replace eduf = 0 if p026==1
replace eduf = 6 if p026==2 & p027==1
replace eduf = 3 if p026==2 & p027!=1
replace eduf = 9 if p026==3 & p027==1
replace eduf = 7.5 if p026==3 & p027!=1
replace eduf = 12 if p026==4 & p027==1
replace eduf = 10.5 if p026==4 & p027!=1
replace eduf = 14 if p026==5 & p027==1
replace eduf = 13 if p026==5 & p027!=1
replace eduf = 16 if p026==6 & p027==1
replace eduf = 14 if p026==6 & p027!=1
replace eduf = 18 if p026==7 & p027==1
replace eduf = 17 if p026==7 & p027!=1

g tophs = (f009>=6)

*tab incgrp, g(faminc)
tab rgngrp, g(region)

g reexamlength = reexamy
replace reexamlength = 0 if reexamlength==.

drop if majgrp==1
drop if f010==1

tab p034, g(famimc)

drop if f009 == 1
drop if f009 == 4
keep if school==2

reg top5 tophs female reexamlength edum eduf   famimc3 famimc4 famimc5 famimc6 famimc7 famimc8 fage if region1==1 , r
keep if e(sample)
keep top5 tophs female reexamlength edum eduf   famimc3 famimc4 famimc5 famimc6 famimc7 famimc8 fage 
outsheet using "goms2_3.csv", comma replace nolabel






use "goms.dta", clear


g top5 = (unirank<=5) 
g female = (sex==2) if sex!=.

g edum = .
replace edum = 0 if p029==1
replace edum = 6 if p029==2 & p030==1
replace edum = 3 if p029==2 & p030!=1
replace edum = 9 if p029==3 & p030==1
replace edum = 7.5 if p029==3 & p030!=1
replace edum = 12 if p029==4 & p030==1
replace edum = 10.5 if p029==4 & p030!=1
replace edum = 14 if p029==5 & p030==1
replace edum = 13 if p029==5 & p030!=1
replace edum = 16 if p029==6 & p030==1
replace edum = 14 if p029==6 & p030!=1
replace edum = 18 if p029==7 & p030==1
replace edum = 17 if p029==7 & p030!=1

g eduf = .
replace eduf = 0 if p026==1
replace eduf = 6 if p026==2 & p027==1
replace eduf = 3 if p026==2 & p027!=1
replace eduf = 9 if p026==3 & p027==1
replace eduf = 7.5 if p026==3 & p027!=1
replace eduf = 12 if p026==4 & p027==1
replace eduf = 10.5 if p026==4 & p027!=1
replace eduf = 14 if p026==5 & p027==1
replace eduf = 13 if p026==5 & p027!=1
replace eduf = 16 if p026==6 & p027==1
replace eduf = 14 if p026==6 & p027!=1
replace eduf = 18 if p026==7 & p027==1
replace eduf = 17 if p026==7 & p027!=1

g tophs = (f009>=6)

*tab incgrp, g(faminc)
tab rgngrp, g(region)

g reexamlength = reexamy
replace reexamlength = 0 if reexamlength==.

drop if majgrp==1
drop if f010==1

tab p034, g(famimc)

drop if f009 == 1
drop if f009 == 4
keep if school==2


reg top5 tophs, r
reg top5 tophs female reexamlength edum eduf   region2 region3 fage if p034<=3 , r
keep if e(sample)
keep top5 tophs female reexamlength edum eduf   region2 region3 fage 
outsheet using "goms3_1.csv", comma replace nolabel





use "goms.dta", clear


g top5 = (unirank<=5) 
g female = (sex==2) if sex!=.

g edum = .
replace edum = 0 if p029==1
replace edum = 6 if p029==2 & p030==1
replace edum = 3 if p029==2 & p030!=1
replace edum = 9 if p029==3 & p030==1
replace edum = 7.5 if p029==3 & p030!=1
replace edum = 12 if p029==4 & p030==1
replace edum = 10.5 if p029==4 & p030!=1
replace edum = 14 if p029==5 & p030==1
replace edum = 13 if p029==5 & p030!=1
replace edum = 16 if p029==6 & p030==1
replace edum = 14 if p029==6 & p030!=1
replace edum = 18 if p029==7 & p030==1
replace edum = 17 if p029==7 & p030!=1

g eduf = .
replace eduf = 0 if p026==1
replace eduf = 6 if p026==2 & p027==1
replace eduf = 3 if p026==2 & p027!=1
replace eduf = 9 if p026==3 & p027==1
replace eduf = 7.5 if p026==3 & p027!=1
replace eduf = 12 if p026==4 & p027==1
replace eduf = 10.5 if p026==4 & p027!=1
replace eduf = 14 if p026==5 & p027==1
replace eduf = 13 if p026==5 & p027!=1
replace eduf = 16 if p026==6 & p027==1
replace eduf = 14 if p026==6 & p027!=1
replace eduf = 18 if p026==7 & p027==1
replace eduf = 17 if p026==7 & p027!=1

g tophs = (f009>=6)

*tab incgrp, g(faminc)
tab rgngrp, g(region)

g reexamlength = reexamy
replace reexamlength = 0 if reexamlength==.

drop if majgrp==1
drop if f010==1

tab p034, g(famimc)

drop if f009 == 1
drop if f009 == 4
keep if school==2


reg top5 tophs, r
reg top5 tophs female reexamlength edum eduf   region2 region3 fage if p034>3 & p034<=6 , r
keep if e(sample)
keep top5 tophs female reexamlength edum eduf   region2 region3 fage 
outsheet using "goms3_2.csv", comma replace nolabel





use "goms.dta", clear


g top5 = (unirank<=5) 
g female = (sex==2) if sex!=.

g edum = .
replace edum = 0 if p029==1
replace edum = 6 if p029==2 & p030==1
replace edum = 3 if p029==2 & p030!=1
replace edum = 9 if p029==3 & p030==1
replace edum = 7.5 if p029==3 & p030!=1
replace edum = 12 if p029==4 & p030==1
replace edum = 10.5 if p029==4 & p030!=1
replace edum = 14 if p029==5 & p030==1
replace edum = 13 if p029==5 & p030!=1
replace edum = 16 if p029==6 & p030==1
replace edum = 14 if p029==6 & p030!=1
replace edum = 18 if p029==7 & p030==1
replace edum = 17 if p029==7 & p030!=1

g eduf = .
replace eduf = 0 if p026==1
replace eduf = 6 if p026==2 & p027==1
replace eduf = 3 if p026==2 & p027!=1
replace eduf = 9 if p026==3 & p027==1
replace eduf = 7.5 if p026==3 & p027!=1
replace eduf = 12 if p026==4 & p027==1
replace eduf = 10.5 if p026==4 & p027!=1
replace eduf = 14 if p026==5 & p027==1
replace eduf = 13 if p026==5 & p027!=1
replace eduf = 16 if p026==6 & p027==1
replace eduf = 14 if p026==6 & p027!=1
replace eduf = 18 if p026==7 & p027==1
replace eduf = 17 if p026==7 & p027!=1

g tophs = (f009>=6)

*tab incgrp, g(faminc)
tab rgngrp, g(region)

g reexamlength = reexamy
replace reexamlength = 0 if reexamlength==.

drop if majgrp==1
drop if f010==1

tab p034, g(famimc)

drop if f009 == 1
drop if f009 == 4
keep if school==2


reg top5 tophs, r
reg top5 tophs female reexamlength edum eduf   region2 region3 fage if p034>=7 , r
keep if e(sample)
keep top5 tophs female reexamlength edum eduf   region2 region3 fage 
outsheet using "goms3_3.csv", comma replace nolabel



clear
insheet using synGOMS.csv, comma
reg top5 tophs female reexamlength edum eduf   famimc3 famimc4 famimc5 famimc6 famimc7 famimc8 region2 region3  fage, r
outreg2 using table4.doc, replace label  title(Regression for entering Top 5 university) dec(4)


clear
insheet using synGOMS_2.csv, comma
reg top5 tophs female reexamlength edum eduf   famimc3 famimc4 famimc5 famimc6 famimc7 famimc8 region2 region3  fage if f013==1, r
outreg2 using table4.doc, append label  title(Regression for entering Top 5 university) dec(4)


clear
insheet using synGOMS_3.csv, comma
reg top5 tophs female reexamlength edum eduf   famimc3 famimc4 famimc5 famimc6 famimc7 famimc8 region2 region3  fage if f013==2, r
outreg2 using table4.doc, append label  title(Regression for entering Top 5 university) dec(4)


clear
insheet using synGOMS2_1.csv, comma
reg top5 tophs female reexamlength edum eduf   famimc3 famimc4 famimc5 famimc6 famimc7 famimc8 fage if region3==1 , r
outreg2 using table5.doc, replace   title(Regression for entering Top 5 university) dec(4)


clear
insheet using synGOMS2_2.csv, comma
reg top5 tophs female reexamlength edum eduf   famimc3 famimc4 famimc5 famimc6 famimc7 famimc8 fage if region1==1 , r
outreg2 using table5.doc, append   title(Regression for entering Top 5 university) dec(4)


clear
insheet using synGOMS2_3.csv, comma
reg top5 tophs female reexamlength edum eduf   famimc3 famimc4 famimc5 famimc6 famimc7 famimc8 fage if region2==1 , r
outreg2 using table5.doc, append   title(Regression for entering Top 5 university) dec(4)


clear
insheet using synGOMS3_1.csv, comma
reg top5 tophs female reexamlength edum eduf   region2 region3 fage if p034<=3 , r
outreg2 using table6.doc, replace   title(Regression for entering Top 5 university) dec(4)


clear
insheet using synGOMS3_2.csv, comma
reg top5 tophs female reexamlength edum eduf   region2 region3 fage if p034>3 & p034<=6 , r
outreg2 using table6.doc, append   title(Regression for entering Top 5 university) dec(4)


clear
insheet using synGOMS3_3.csv, comma
reg top5 tophs female reexamlength edum eduf   region2 region3 fage if p034>=7 , r
outreg2 using table6.doc, append   title(Regression for entering Top 5 university) dec(4)
