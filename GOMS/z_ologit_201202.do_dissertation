cd ~/dropbox/goms/


capture log close

log using results/ologit_201202 , replace

use goms if inrange(f001 , 2000 , 2011)

ologit score5 p026 p029 p034 rgngrp i.f001  [aw=wgt] 

eststo ologit

forvalue i =1/5 {
	quietly margins, dydx(*) predict(outcome(`i')) post
	eststo, title(Outcome `i')
	estimates restore ologit
}

esttab, noobs se nostar mtitles nonumbers title(Average Marginal Effects) varlabels(,blist(cut1:_cons "{hline @width}{break}")) eqlabels(none)

eststo drop *

ologit score5 p026 p029 p034 f009 rgngrp i.f001  [aw=wgt] 

eststo ologit

forvalue i =1/5 {
	quietly margins, dydx(*) predict(outcome(`i')) post
	eststo, title(Outcome `i')
	estimates restore ologit
}

esttab, noobs se nostar mtitles nonumbers title(Average Marginal Effects) varlabels(,blist(cut1:_cons "{hline @width}{break}")) eqlabels(none)

eststo drop *

ologit score5 p026 p029 p034 f009 rgngrp i.f001  [aw=wgt] 

eststo ologit

forvalue i =1/5 {
	quietly margins, dydx(*) predict(outcome(`i')) post
	eststo, title(Outcome `i')
	estimates restore ologit
}

esttab, noobs se nostar mtitles nonumbers title(Average Marginal Effects) varlabels(,blist(cut1:_cons "{hline @width}{break}")) eqlabels(none)

eststo drop *

ologit score5 (p026 p029 p034)##f009 rgngrp i.f001  [aw=wgt] 

eststo ologit

forvalue i =1/5 {
	quietly margins, dydx(*) predict(outcome(`i')) post
	eststo, title(Outcome `i')
	estimates restore ologit
}

esttab, noobs se nostar mtitles nonumbers title(Average Marginal Effects) varlabels(,blist(cut1:_cons "{hline @width}{break}")) eqlabels(none)
