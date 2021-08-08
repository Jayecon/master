local datalist pisa timss
local depvlist lnpcgdp lngdp growth pcgrowth
local subjectlist math scie 
local indexlist goi rri fgt fge fgc fgr bje bjc bjt bjr

cd ~/dropbox/graph

foreach i of local datalist {
	use ~/dropbox/pnt/pnt_regdata if y`i' , clear
	local dataf = substr("`i'",1,1)
	foreach j of local depvlist {
	foreach k of local indexlist {
	foreach l of local subjectlist {
		scatter `j' `k'`l'`dataf' || lfit `j' `k'`l'`dataf' , by(year)
		gr export scatter_`i'_`j'_`k'`l'.png , replace
	}
	}
	}
}

local datalist pisa timss
local subjectlist math scie 
local indexlist goi rri fgt fge fgc fgr bje bjc bjt bjr
local maxnum : word count `indexlist' 
local maxnumm = `maxnum' -1

cd ~/dropbox/graph

foreach i of local datalist {
	use ~/dropbox/pnt/pnt_regdata if y`i' , clear
	local dataf = substr("`i'",1,1)
	local num = 1
	foreach l of local subjectlist {
		forvalue j = `num'/`maxnumm' {
		local idx1 : word `j' of `indexlist'
		local nump = `num' +1
			forvalue k = `nump'/`maxnum' {
				local idx2 : word `k' of `indexlist'
				scatter  `idx1'`l'`dataf'  `idx2'`l'`dataf' || lfit `idx1'`l'`dataf' `idx2'`l'`dataf' , by(year)
				gr export scatter_`i'_`idx1'`l'`dataf'_`idx2'`l'`dataf'.png , replace
			}
		local ++num
		}
	}
}
