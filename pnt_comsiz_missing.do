foreach i in pisa {
forvalue j=1/7 {
	use ~/dropbox/`i'r`j' , clear
	gen one = 1
	di ""
	di as text " DATA : " as input "`i'" as text " Wave : " as input "`j'" 
	table cntcod , c(n one n schloc )
	}
}

pisa
1 	drop 348
4 	drop 348
5 	drop 348

1	124 352 604
2	250 344 446 
3	250 344 
4	250 
5	
6	752
7	578 752

timss
1	414
