* Encoding: UTF-8.
DEFINE !StateLoop (!POSITIONAL  !CHAREND('/') 
                                / !POSITIONAL  !CMDEND) 
!DO !I !IN (!1) 
 !DO !J !IN (!2) 
    !LET !F = !QUOTE(!CONCAT("E:\Works\TIMSS\TIMSS03\T03_spss\",!I,!J,"m3.sav"))
    !LET !G = !QUOTE(!CONCAT("E:\Works\TIMSS\Stata\",!I,!J,"m3.dta"))
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

!StateLoop bcg bsa bsg bst btm bts / arm aus bhr bwa bgr chl twn cyp egy eng est gha hkg hun idn irn isr ita jpn jor kor lva lbn ltu mkd mys mda mar nld nzl nor pse phl rom rus sau sco scg sgp svk svn zaf swe syr tun usa. 
