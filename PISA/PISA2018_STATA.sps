SET decimal=dot.

GET FILE ="e:\works\pisa\pisa2018\CY07_MSU_SCH_QQQ.sav".
SAVE TRANSLATE OUTFILE= "E:\works\pisa\stata\p18_school.dta"
	  /TYPE=STATA
	  /VERSION=13
	  /EDITION=SE
	  /MAP
	  /REPLACE.

GET FILE ="e:\works\pisa\pisa2018\CY07_MSU_STU_COG.sav".
SAVE TRANSLATE OUTFILE= "E:\works\pisa\stata\p18_cogitm.dta"
	  /TYPE=STATA
	  /VERSION=13
	  /EDITION=SE
	  /MAP
	  /REPLACE.

GET FILE ="e:\works\pisa\pisa2018\CY07_MSU_STU_QQQ.sav".
SAVE TRANSLATE OUTFILE= "E:\works\pisa\stata\p18_student.dta"
	  /TYPE=STATA
	  /VERSION=13
	  /EDITION=SE
	  /MAP
	  /REPLACE.

GET FILE ="e:\works\pisa\pisa2018\CY07_MSU_TCH_QQQ.sav".
SAVE TRANSLATE OUTFILE= "E:\works\pisa\stata\p18_teacher.dta"
	  /TYPE=STATA
	  /VERSION=13
	  /EDITION=SE
	  /MAP
	  /REPLACE.
