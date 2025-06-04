tempfile tfile
import delimited "/Users/jay/GitHub/master/LIS/lis_data_ehpublic.txt", delimiter(";", collapse) varnames(1) encoding(ISO-8859-1) , clear
    drop v11
    save `tfile'
import delimited "/Users/jay/GitHub/master/LIS/lis_data_ehpublic.txt", delimiter(";", collapse) varnames(1) encoding(ISO-8859-1) , clear
    drop v11
    merge 1:1 iso2 year using `tfile'
    save `tfile' , replace
import delimited "/Users/jay/GitHub/master/LIS/lis_data_ehpublic.txt", delimiter(";", collapse) varnames(1) encoding(ISO-8859-1) , clear
    drop v11
    merge 1:1 iso2 year using `tfile'
    save `tfile' , replace
import delimited "/Users/jay/GitHub/master/LIS/lis_data_ehpublic.txt", delimiter(";", collapse) varnames(1) encoding(ISO-8859-1) , clear
    drop v11
    merge 1:1 iso2 year using `tfile'
    save `tfile' , replace
import delimited "/Users/jay/GitHub/master/LIS/lis_data_ehpublic.txt", delimiter(";", collapse) varnames(1) encoding(ISO-8859-1) , clear
    drop v11
    merge 1:1 iso2 year using `tfile'
    save `tfile' , replace
import delimited "/Users/jay/GitHub/master/LIS/lis_data_ehpublic.txt", delimiter(";", collapse) varnames(1) encoding(ISO-8859-1) , clear
    drop v11
    merge 1:1 iso2 year using `tfile'
    save lis.dta , replace

