SET decimal=dot.

GET FILE ="e:\works\pisa\pisa2015\CY6_MS_COM_SCH_QQQ.sav".
SAVE TRANSLATE OUTFILE= "E:\works\pisa\stata\p15_school.dta"
	  /TYPE=STATA
	  /VERSION=13
	  /EDITION=SE
	  /MAP
	  /REPLACE.

GET FILE ="e:\works\pisa\pisa2015\CY6_MS_COM_STU_COG.sav".
SAVE TRANSLATE OUTFILE= "E:\works\pisa\stata\p15_cogitm.dta"
	  /TYPE=STATA
	  /VERSION=13
	  /EDITION=SE
	  /MAP
	  /REPLACE.

GET FILE ="e:\works\pisa\pisa2015\CY6_MS_COM_STU_QQQ.sav".
SAVE TRANSLATE OUTFILE= "E:\works\pisa\stata\p15_student.dta"
	  /TYPE=STATA
	  /VERSION=13
	  /EDITION=SE
	  /MAP
	  /REPLACE.

GET FILE ="e:\works\pisa\pisa2015\CY6_MS_COM_TCH_QQQ.sav".
SAVE TRANSLATE OUTFILE= "E:\works\pisa\stata\p15_teacher.dta"
	  /TYPE=STATA
	  /VERSION=13
	  /EDITION=SE
	  /MAP
	  /REPLACE.
