use wdi , clear
collapse v1 if inrange(year , 1960 , 1969) , by(ccode cname)
sort v1
gen num = _n
sum num if ccode == "KOR" , meanonly
local knum = r(mean)
local kmin = `knum' -5
local kmax = `knum' +5
list in `kmin'/`kmax' , sep(0)
