cd ~/dropbox/goms
use results/goms_extragroups.dta , clear

keep if inrange(wave , 2000 , 2011)

/*GOI over envtyp*/
twoway line index wave if indextype == 1 & scoretyp == 6 & envtyp == 1 , saving(figure/goi_sex , replace)
twoway line index wave if indextype == 1 & scoretyp == 6 & envtyp == 2 , saving(figure/goi_sch , replace)
twoway line index wave if indextype == 1 & scoretyp == 6 & envtyp == 3 , saving(figure/goi_maj , replace)

twoway line index wave if indextype == 2 & scoretyp == 6 & envtyp == 1 , saving(figure/rri_sex , replace)
twoway line index wave if indextype == 2 & scoretyp == 6 & envtyp == 2 , saving(figure/rri_sch , replace)
twoway line index wave if indextype == 2 & scoretyp == 6 & envtyp == 3 , saving(figure/rri_maj , replace)

twoway line index wave if indextype == 1 & scoretyp == 1 & envtyp == 1 , saving(figure/goi_sex_income , replace)
twoway line index wave if indextype == 1 & scoretyp == 1 & envtyp == 2 , saving(figure/goi_sch_income , replace)
twoway line index wave if indextype == 1 & scoretyp == 1 & envtyp == 3 , saving(figure/goi_maj_income , replace)

twoway line index wave if indextype == 2 & scoretyp == 1 & envtyp == 1 , saving(figure/rri_sex_income , replace)
twoway line index wave if indextype == 2 & scoretyp == 1 & envtyp == 2 , saving(figure/rri_sch_income , replace)
twoway line index wave if indextype == 2 & scoretyp == 1 & envtyp == 3 , saving(figure/rri_maj_income , replace)
