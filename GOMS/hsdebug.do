cd ~/dropbox/goms/rawdata

use goms_data_hs , clear


qui levelsof f007 , local(list007)
foreach i of local list007 {
	qui levelsof rhsname if f007 == `i' , local(hslist)
	foreach j of local hslist {
		di as text "list if f007 == " as result "`i'" as text " & rhsname == " as result `""`j'""'
		tab hsname if f007 == `i' & rhsname == "`j'"
		di ""
	}
}
