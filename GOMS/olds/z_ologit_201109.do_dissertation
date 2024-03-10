cd ~/dropbox/goms

capture log close
log using 201109 , replace

use goms , clear

keep if inrange(f001 , 2000 , 2011)

gen paredu = p026+p029
gen parinc = p034
label value parinc G171LABEO
gen hsscore = f009
label value hsscore F009
reg hsscore paredu parinc i.rgngrp sex i.wave [aw=wgt]

ologit hsscore paredu parinc i.rgngrp sex i.wave [aw=wgt]

predict p1 p2 p3 p4 p5 p6 p7

egen p0 = rowtotal(p?) , missing

sum p? [aw=wgt] , sep(7)

tab hsscore [aw=wgt]

margins , dydx(*) predict(outcome(1))

margins , dydx(*) predict(outcome(7))

drop p?

ologit score5 paredu parinc i.rgngrp sex hsscore i.wave [aw=wgt]

predict p1 p2 p3 p4 p5 

egen p0 = rowtotal(p?) , missing

sum p? [aw=wgt] , sep(7)

tab hsscore [aw=wgt]

margins , dydx(*) predict(outcome(1))

margins , dydx(*) predict(outcome(5))

drop p?

ologit score5 (c.paredu c.parinc i.rgngrp sex)##hsscore i.wave [aw=wgt]

predict p1 p2 p3 p4 p5 

egen p0 = rowtotal(p?) , missing

sum p? [aw=wgt] , sep(7)

tab hsscore [aw=wgt]

margins , dydx(*) predict(outcome(1))

margins , dydx(*) predict(outcome(5))


log close
