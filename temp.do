foreach i in pisa timss {
	forvalue j = 1/7 {
	use ~/dropbox/`i'w`j'.dta , clear
	di ""
	di as text " DATA : " as input "`i'" as text " Wave : " as input "`j'"
	isid cntcod idschool idstudent
	}
}
