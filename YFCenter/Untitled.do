ds , has(type string)

local svset = r(varlist)

foreach i of local svset { 
	replace `i' = subinstr(`i', " ", "", .)
}
