local datalist pisa timss
local depvlist lnpcgdp lngdp growth pcgrowth
local subjectlist math scie 
local indexlist goi rri fgt fge fgc fgr bje bjc bjt bjr
local num = 1
local maxnum : word count `indexlist' 
local maxnumm = `maxnum' -1

cd ~/dropbox/graph

foreach i of local datalist {
	use ~/dropbox/pnt/pnt_regdata if y`i' , clear
	local dataf = substr("`i'",1,1)
	foreach l of local subjectlist {
		forvalue j = `num'/`maxnumm' {
		local idx1 : word `j' of `indexlist'
		local `nump' = `num' +1
			forvalue k = `nump'/`maxnum' {
			local idx2 : word `k' of `indexlist'
			scatter  `j'`l'`dataf'  `k'`l'`dataf' || lfit `k'`l'`dataf' , by(year)
			gr export scatter_`i'_`j'`l'`dataf'  _`k'`l'`dataf'.png , replace
			}
		local ++num
		}
	}
}
