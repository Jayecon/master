forvalue i = 2/100      {
	forvalue j = 1/100 {
		di as text "The Number of Env. is " as result "`i'." _newline as text "The Number of efffort level is " as result "`j'."
		local jp = 0
		forvalue t = 1/`j'  {
			local jp = `jp' + `t'
		}
		local k = 1
		local limit = 0
		while (`k' <= `j' ) {
			local limit = `limit' +  (`k'/`jp')*(1-(1/`i')+(`i'-1)*(1/`i'))
			local ++k
		}
		di as text "Index = " as result "`limit'"
	}	
}
	
