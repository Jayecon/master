* Encoding: UTF-8.
DEFINE !StateLoop (!POSITIONAL  !CHAREND('/') 
                                / !POSITIONAL  !CMDEND) 
!DO !I !IN (!1) 
 !DO !J !IN (!2) 
    !LET !F = !QUOTE(!CONCAT("E:\Works\TIMSS\TIMSS11\T11_G8_SPSSData\",!I,!J,"m5.sav"))
    !LET !G = !QUOTE(!CONCAT("E:\Works\TIMSS\Stata\",!I,!J,"m5.dta"))
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

!StateLoop bcg bsa bsg bst btm bts / arm aus bhr chl twn eng fin geo gha hkg hun idn irn isr ita jpn jor kaz kor lbn ltu mkd mys mar nzl nor omn pse qat rom rus sau sgp svn swe syr tha tun tur ukr are usa. 
