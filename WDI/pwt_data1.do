cd C:\Users\KIHASA\Documents\사회동향
use pwt1001 if year < 1960 , clear
keep countrycode rgdpna pop year
levelsof countrycode , local(cset)

preserve

tempfile tfile
foreach i of local cset {
	keep if countrycode == "`i'"
	xpose , clear
	drop in 1/2
	gen CountryCode = "`i'"
	gen SeriesName = ""
	replace SeriesName = "pop" in 1
	replace SeriesName = "rgdpna" in 2
	if "`i'" == "ABW" {
		save `tfile' , replace
	}
	else {
		append using `tfile' 
		save `tfile' , replace
	}
	restore , preserve
}
use `tfile' , clear
order CountryCode SeriesName , first
sort CountryCode
save pwtx , replace

import excel "C:\Users\KIHASA\Documents\사회동향\오성재_사회동향 차트서식(25-0502)_이슈부문.xlsx", sheet("GDPpC") firstrow clear
keep CountryName-한글명
drop SeriesName
merge 1:m CountryCode using pwtx , nogen

save pwtx , replace