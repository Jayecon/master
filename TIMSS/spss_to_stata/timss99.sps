* Encoding: UTF-8.
DEFINE !StateLoop (!POSITIONAL  !CHAREND('/') 
                                / !POSITIONAL  !CMDEND) 
!DO !I !IN (!1) 
 !DO !J !IN (!2) 
    !LET !F = !QUOTE(!CONCAT("E:\Works\TIMSS\TIMSS99\T99_G8_SPSSData\",!I,!J,"m2.sav"))
    !LET !G = !QUOTE(!CONCAT("E:\Works\TIMSS\Stata\",!I,!J,"m2.dta"))
    GET FILE = !F.
    SAVE TRANSLATE OUTFILE= !G
          /TYPE=STATA
          /VERSION=13
          /EDITION=SE
          /MAP
          /REPLACE.
 !DOEND 
!DOEND 
!ENDDEFINE. 

!StateLoop bcg bsa bsg bst btm bts / aus bgr can chl twn cyp cze fin hkg hun idn irn isr ita jor kor lva ltu mkd mda mar mys nld nzl phl rom rus sgp svk svn tha tun tur usa.


