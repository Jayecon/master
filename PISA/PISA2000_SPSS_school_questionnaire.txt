* This program reads the txt file data and applies variable and value labes, format and missing valus specifications.
* Write the location of the ASCII file on the at the beginning of the controle file.
* Write the location of the SPSS file at the end of the controle file.

SET decimal=dot.

DATA list file='c:\****\intscho.txt' /
country 	2-4(a)
schoolid	5-9(a)
subnatio 	11-12(a)
sc01q01 	14-14 
sc02q01 	15-18 
sc02q02 	19-22 
sc03q01 	23-23 
sc04q01 	24-26 
sc04q02 	27-29 
sc04q03 	30-32 
sc04q04 	33-35 
sc05q01 	36-36 
sc05q02 	37-37 
sc05q03 	38-38 
sc05q04 	39-39 
sc05q05 	40-40 
sc05q06 	41-41 
sc05q07 	42-42 
sc05q08 	43-43 
sc05q09 	44-44 
sc05q10 	45-45 
sc05q11 	46-46 
sc05q12 	47-47 
sc05q13 	48-48 
sc05q14 	49-49 
sc06q01 	50-51 
sc06q02 	52-53 
sc06q03 	54-56 
sc07q01 	57-57 
sc07q02 	58-58 
sc07q03 	59-59 
sc07q04 	60-60 
sc07q05 	61-61 
sc07q06 	62-62 
sc07q07 	63-63 
sc08q01 	64-66 
sc08q02 	67-69 
sc08q03 	70-72 
sc08q04 	73-75 
sc08q05 	76-78 
sc08q06 	79-81 
sc09q01 	82-82 
sc09q02 	83-83 
sc09q03 	84-84 
sc09q04 	85-85 
sc09q05 	86-86 
sc10q01 	87-87 
sc10q02 	88-88 
sc10q03 	89-89 
sc10q04 	90-90 
sc10q05 	91-91 
sc10q06 	92-92 
sc11q01 	93-93 
sc11q02 	94-94 
sc11q03 	95-95 
sc11q04 	96-96 
sc11q05 	97-97 
sc11q06 	98-98 
sc11q07 	99-99 
sc11q08 	100-100 
sc11q09 	101-101 
sc12q01 	102-102 
sc12q02 	103-103 
sc12q03 	104-104 
sc12q04 	105-105 
sc12q05 	106-106 
sc13q01 	107-110 
sc13q02 	111-114 
sc13q03 	115-118 
sc13q04 	119-122 
sc13q05 	123-126 
sc13q06 	127-130 
sc14q01 	131-133 
sc14q02 	134-136 
sc14q03 	137-139 
sc14q04 	140-142 
sc14q05 	143-145 
sc14q06 	146-148 
sc14q07 	149-151 
sc14q08 	152-154 
sc14q09 	155-157 
sc14q10 	158-160 
sc14q11 	161-163 
sc14q12 	164-166 
sc14q13 	167-169 
sc14q14 	170-172 
sc14q15 	173-175 
sc14q16 	176-178 
sc14q17 	179-181 
sc14q18 	182-184 
sc15q01 	185-187 
sc16q01 	188-188 
sc16q02 	189-189 
sc16q03 	190-190 
sc16q04 	191-191 
sc16q05 	192-192 
sc17q01 	193-193 
sc17q02 	194-194 
sc17q03 	195-195 
sc18q01 	196-196 
sc18q02 	197-197 
sc18q03 	198-198 
sc18q04 	199-199 
sc18q05 	200-200 
sc18q06 	201-201 
sc19q01 	202-202 
sc19q02 	203-203 
sc19q03 	204-204 
sc19q04 	205-205 
sc19q05 	206-206 
sc19q06 	207-207 
sc19q07 	208-208 
sc19q08 	209-209 
sc19q09 	210-210 
sc19q10 	211-211 
sc19q11 	212-212 
sc19q12 	213-213 
sc19q13 	214-214 
sc19q14 	215-215 
sc19q15 	216-216 
sc19q16 	217-217 
sc19q17 	218-218 
sc20q01 	219-219 
sc20q02 	220-220 
sc20q03 	221-221 
sc20q04 	222-222 
sc21q01 	223-223 
sc21q02 	224-224 
sc21q03 	225-225 
sc21q04 	226-226 
sc21q05 	227-227 
sc22q01 	228-232(a)
sc22q02 	233-237(a)
sc22q03 	238-242(a)
sc22q04 	243-247(a)
sc22q05 	248-252(a)
sc22q06 	253-257(a)
sc22q07 	258-262(a)
sc22q08 	263-267(a)
sc22q09 	268-272(a)
sc22q10 	273-277(a)
sc22q11 	278-282(a)
sc22q12 	283-287(a)
schlsize 	289-293 
pcgirls 		294-298 
schltype 	299-299 
tothrs 		300-303 
ratcomp 	304-309 
percomp1 	310-313 
percomp2 	314-317 
percomp3 	318-321 
percomp4 	322-325 
percomp5 	326-329 
stratio 		330-334 
propqual 	335-338 
propcert 	339-342 
propread 	343-346 
propmath 	347-350 
propscie 	351-354 
scmatedu 	355-359 
tcshort 		360-364 
teacbeha	365-369 
studbeha 	370-374 
tcmorale	375-379 
schauton	380-384 
tchparti 		385-389 
scmatbui 	390-394 
wnrschbw	395-402
cnt 		404-406 (a).
execute.

formats country (a3).
formats schoolid (a5).
formats sc01q01 sc03q01 sc05q01 to sc05q14 sc07q01 to sc07q07 sc09q01 to sc12q05  sc16q01 to sc21q05 (f1.0).
formats sc06q01 sc06q02 (f2.0).
formats sc04q01 to sc04q04 sc06q03 sc08q01 to sc08q06 sc14q01 to sc15q01 (f3.0).
formats sc02q01 sc02q02 sc13q01 to sc13q06 (f4.0).
formats sc22q01 to sc22q12 (a5).
formats schlsize (f5.0).
formats pcgirls (f5.3).
formats schltype (f1.0).
formats ratcomp (f6.3).
formats tothrs (f4.0).
formats percomp1 to percomp5 (f4.2).
formats stratio (f5.2).
formats propqual to propscie (f4.2).
formats scmatedu to scmatbui (f5.2).
formats wnrschbw (f8.2).

variable labels
country 		"Country four-digit code"
schoolid	"School ID (unique)"
subnatio	"Subnational entities"
sc01q01 	"School location - Q1"
sc02q01 	"Number of boys - Q2a"
sc02q02 	"Number of girls - Q2b"
sc03q01 	"School public/private - Q3"
sc04q01 	"Funds, government - Q4a"
sc04q02 	"Funds, student fees - Q4b"
sc04q03 	"Funds, benefactors - Q4c"
sc04q04 	"Funds, other - Q4d"
sc05q01 	"Grade 1 - Q5a"
sc05q02 	"Grade 2 - Q5b"
sc05q03 	"Grade 3 - Q5c"
sc05q04 	"Grade 4 - Q5d"
sc05q05 	"Grade 5 - Q5e"
sc05q06 	"Grade 6 - Q5f"
sc05q07 	"Grade 7 - Q5g"
sc05q08 	"Grade 8 - Q5h"
sc05q09 	"Grade 9 - Q5i"
sc05q10 	"Grade 10 - Q5j"
sc05q11 	"Grade 11 - Q5k"
sc05q12 	"Grade 12 - Q5l"
sc05q13 	"Grade 13 - Q5m"
sc05q14 	"Ungraded- Q5n"
sc06q01 	"Instructional weeks - Q6a"
sc06q02 	"Instructional periods - Q6b"
sc06q03 	"Instructional minutes - Q6c"
sc07q01 	"Residence - Q7a"
sc07q02 	"Academic performance - Q7b"
sc07q03 	"Feeder schools - Q7c"
sc07q04 	"Phylosophy and religion - Q7d"
sc07q05 	"Special program - Q7e"
sc07q06 	"Family preference - Q7f"
sc07q07 	"Admittance factors, other - Q7g"
sc08q01 	"<ISCED 2A> - Q8a"
sc08q02 	"<ISCED 2B> - Q8b"
sc08q03 	"<ISCED 2C> -Q8c"
sc08q04 	"<ISCED 3A> - Q8d"
sc08q05 	"<ISCED 3B> - Q8e"
sc08q06 	" <ISCED 3C> - Q8f"
sc09q01 	"Student's choice - Q9a"
sc09q02 	"Academic record - Q9b"
sc09q03 	"Placement exams - Q9c"
sc09q04 	"Teacher recommend - Q9d"
sc09q05 	"Parents' request - Q9e"
sc10q01 	"Low achievement - Q10a"
sc10q02 	"High achievement - Q10b"
sc10q03 	"Behaviour - Q10c"
sc10q04 	"Special needs - Q10d"
sc10q05 	"Parents' request -Q10e"
sc10q06 	"Transfer reason, other - Q10f"
sc11q01 	"Poor buildings - Q11a"
sc11q02 	"Poor heating - Q11b"
sc11q03 	"Inadequate space - Q11c"
sc11q04 	"Lack of instruct materials - Q11d"
sc11q05 	"Lack of computers - Q11e"
sc11q06 	"Poor library - Q11f"
sc11q07 	"Poor multi-media Q11g"
sc11q08 	"Poor science equip - Q11h"
sc11q09 	"Poor art facilities - Q11i"
sc12q01 	"Courses for gifted   - Q12a"
sc12q02 	"Language training - Q12b"
sc12q03 	"Study skills - Q12c"
sc12q04 	"Special tutoring - Q12d"
sc12q05 	"Help rooms - Q12e"
sc13q01 	"Computers altogether - Q13a"
sc13q02 	"Computers students - Q13b"
sc13q03 	"Computers teachers - Q13c"
sc13q04 	"Computers admin - Q13d"
sc13q05 	"Computers with Web - Q13e"
sc13q06 	"Computers with Lan - Q13f"
sc14q01 	"Ftime teach in total - Q14a1"
sc14q02 	"Ptime teach in total - Q14a2"
sc14q03 	"Ftime teach <ISCED5A>  in <pedag> - Q14b1"
sc14q04 	"Ptime teach  <ISCED5A>  in <pedag> - Q14b2"
sc14q05 	"Ftime teach fully certified - q14c1"
sc14q06 	"Ptime teach fully certified - Q14c2"
sc14q07 	"Ftime teach <test language> - Q14d1"
sc14q08 	"Ptime teach <test language> - Q14d2"
sc14q09 	"Ftime teach <ISCED5A>  in <test lang> - Q14e1"
sc14q10 	"Ptime teach <ISCED5A>  in <test lang> - Q14e2"
sc14q11 	"Ftime teach <maths> - Q14f1"
sc14q12 	"Ptime teach <maths> - Q14f2"
sc14q13 	"Ftime teach <ISCED5A>  in <maths> - Q14g1"
sc14q14 	"Ptime teach <ISCED5A>  in <maths> - Q14g2"
sc14q15 	"Ftime teach <science> - Q14h1"
sc14q16 	"Ptime teach <science> - q14h2"
sc14q17 	"Ftime teach <ISCED5A>  in <science> - Q14i1"
sc14q18 	"Ptime teach - <ISCED5A>  in <science> - Q14i2"
sc15q01 	"Professional development - Q15"
sc16q01 	"Standardised test - Q16a"
sc16q02 	"Teacher's test - Q16b"
sc16q03 	"Teacher's ratings - Q16c"
sc16q04 	"Students' portfolios - Q16d"
sc16q05 	"Assignments - Q16e"
sc17q01 	"Parents - Q17a"
sc17q02 	"Principal - Q17b"
sc17q03 	"Government - Q17c"
sc18q01 	"Parents information - Q18a"
sc18q02 	"Promotion decisions - Q18b"
sc18q03 	"Instructional grouping - Q18c"
sc18q04 	"National comparison - Q18d"
sc18q05 	"Progress monitoring - Q18e"
sc18q06 	"Teachers' effectiveness -Q18f"
sc19q01 	"Low expectations - Q19a"
sc19q02 	"Student absenteeism - Q19b"
sc19q03 	"Stud-teach relations - Q19c"
sc19q04 	"Teacher turnover - Q19d"
sc19q05 	"Lack parent support - Q19e"
sc19q06 	"Disruptions of classes - Q19f"
sc19q07 	"Ignoring students - Q19g"
sc19q08 	"Teacher absenteeism - Q19h"
sc19q09 	"Skipping classes - Q19i"
sc19q10 	"Lack of respect -Q19j"
sc19q11 	"Resisting change - Q19k"
sc19q12 	"Lack of instr time - Q19l"
sc19q13 	"Use of alcohol - Q19m"
sc19q14 	"Teachers' strictness - Q19n"
sc19q15 	"Bullying - Q19o"
sc19q16 	"Lack of encouragm - Q19p"
sc19q17 	"Poor home envrm - Q19q"
sc20q01 	"High morale -Q20a"
sc20q02 	"Enthusiasm -Q20b"
sc20q03 	"Pride in school -Q20c"
sc20q04 	"Value acad achvm -Q20d"
sc21q01 	"Teachers - Q21a"
sc21q02 	"<Test language> teachers - Q21b"
sc21q03 	"<Mathematics> teacher - Q21c"
sc21q04 	"<Science> teachers - Q21d"
sc21q05 	"Support personnel - Q21e"
sc22q01 	"Hiring teachers - Q22a"
sc22q02 	"Firing teachers - Q22b"
sc22q03 	"Teacher salaries - Q22c"
sc22q04 	"Salary increase -Q22d"
sc22q05 	"Budget formulation - Q22e"
sc22q06 	"Budget allocation - Q22f"
sc22q07 	"Disciplinary policies - Q22g"
sc22q08 	"Assessment policies - Q22h"
sc22q09 	"Student admittance - Q22i"
sc22q10 	"Textbooks - Q22j"
sc22q11 	"Corse content - Q22k"
sc22q12 	"Course offer - Q22l"
schlsize 	"Number of students in the school"
pcgirls   	"Percentage of girls in the school"
schltype 	"Type of school"
tothrs    	"Total number of schooling hours per year"
ratcomp 	"Total number of computer / school size"
percomp1	"Percentage of computers available for 15 year olds"
percomp2	"Percentage of computers available only for teachers"
percomp3	"Percentage of computers available for administrative staff"
percomp4	"Percentage of computers connected to the Web"
percomp5	"Percentage of computers connected to a LAN"
stratio 		"School size / number of teachers"
propqual	"Proportion of teachers with a ISCED 5 A level in pedagogy"
propcert 	"Proportion of teachers fully certified"
propread	"Proportion of language teacher with a ISCED 5 A level in pedagogy" 
propmath	"Proportion of math teachers with a ISCED 5A level in math"
propscie	"Proportion of science teachers with a ISCED 5A level in science"
scmatedu	"Instructional ressources"
tcshort	"Shortage of teachers"
teacbeha	"Teacher behaviors"
studbeha	"Student behaviors"
tcmorale	"Teacher morale"
schauton	"School autonomy"
tchparti	"Teacher participation to decision making"
scmatbui	"Material ressources"
wnrschbw	"School weight "
cnt		"Country Alphanumeric Code".

value labels
COUNTRY
           "036" "AUSTRALIA"
           "040" "AUSTRIA"
           "056" "BELGIUM"
           "076" "BRAZIL"
           "124" "CANADA"
           "203" "CZECH REPUBLIC"
           "208" "DENMARK"
           "246" "FINLAND"
           "250" "FRANCE"
           "276" "GERMANY"
           "300" "GREECE"
           "348" "HUNGARY"
           "352" "ICELAND"
           "372" "IRELAND"
           "380" "ITALY"
           "392" "JAPAN"
           "410" "KOREA, REPUBLIC OF"
           "428" "LATVIA"
           "438" "LIECHTENSTEIN"
           "442" "LUXEMBOURG"
           "484" "MEXICO"
           "528" "NETHERLANDS"
           "554" "NEW ZEALAND"
           "578" "NORWAY"
           "616" "POLAND"
           "620" "PORTUGAL"
           "643" "RUSSIAN FEDERATION"
           "724" "SPAIN"
           "752" "SWEDEN"
           "756" "SWITZERLAND"
           "826" "UNITED KINGDOM"
           "840" "UNITED STATES"
           "008" "ALBANIA"
           "032" "ARGENTINA"
           "100" "BULGARIA"
           "152" "CHILE"
           "344" "HONG KONG"
           "360" "INDONESIA"
           "376" "ISRAEL"
           "604" "PERU"
           "642" "ROMANIA"
           "764" "THAILAND"
           "807" "MACEDONIA"/
 SC01Q01     1    "Village (less 3 000)"
             2    "Small town (3 000 to 15 000)"
             3    "Town (15 000 to 100 000)"
             4    "City (100 000 to 1 000 000)"
             5    "City (more 1 000 000) centre"
             6    "City (more 1 000 000) elswhere"
             8    "M/R"
             9    "Mis"
             7    "N/A"/
 SC02Q01  SC02Q02  
             9997   "N/A"
             9999   "Mis"/
 SC03Q01     1    "Public"
             2    "Private"
             8    "M/R"
             9    "Mis"
             7    "N/A"/
 SC04Q01 to SC04Q04
             997  "N/A"
             999  "Mis"/
 SC05Q01 to SC05Q14
	       1    "Yes"
             2    "No"
             8    "M/R"
             9    "Mis"
             7    "N/A"/
 SC06Q01 to SC06Q02
             97  "N/A"
             99   "Mis"/
 SC06Q03
             997 "N/A"
             999 "Mis"/
 SC07Q01 TO  SC07Q07     
             1    "Never"
             2    "Sometimes"
             3    "Always"
             8    "M/R"
             9    "Mis"
             7    "N/A"/
 SC08Q01 to SC08Q06 
             997 "N/A"
             999 "Mis"/
 SC09Q01 to  SC09Q05
             1    "Not important"
             2    "Important"
             3    "Very important"
             8    "M/R"
             9    "Mis"
             7    "N/A"/
 SC10Q01 to SC10Q06     
		 1    "Not likely"
             2    "Likely"
             3    "Very likely"
             8    "M/R"
             9    "Mis"
             7    "N/A"/
SC11Q01 to SC11Q09     
             1    "Not at all"
             2    "A little"
             3    "Some"
             4    "A lot"
             8    "M/R"
             9    "Mis"
             7    "N/A"/
 SC12Q01 to  SC12Q05 
	       1    "Yes"
             2    "No"
             8    "M/R"
             9    "Mis"
             7    "N/A"/
 SC13Q01 to SC13Q06 
             9997 "N/A"
             9999 "Mis"/
 SC14Q01 to SC14Q18
             997  "N/A"
             999  "Mis"/
 SC15Q01
             997  "N/A"
             999  "Mis"/
 SC16Q01 to SC16Q05
             1    "Never"
             2    "Yearly"
             3    "Twice a year"
             4    "3 times a year"
             5    "4 or more times a year"
             8    "M/R"
             9    "Mis"
             7    "N/A"/
 SC17Q01 to SC17Q03
             1    "Never"
             2    "Yearly"
             3    "Twice a year"
             4    "3 times a year"
             5    "4 or more times a year"
             8    "M/R"
             9    "Mis"
             7    "N/A"/
 SC18Q01 to SC18Q06
             1    "Yes"
             2    "No"
             8    "M/R"
             9    "Mis"
             7    "N/A"/
 SC19Q01 to SC19Q17
             1    "Not at all"
             2    "A little"
             3    "Some"
             4    "A lot"
             8    "M/R"
             9    "Mis"
             7    "N/A"/
 SC20Q01 to SC20Q04
             1    "Strongly Disagree"
             2    "Disagree"
             3    "Agree"
             4    "Strongly Agree"
             8    "M/R"
             9    "Mis"
             7    "N/A"/
 SC21Q01 to  SC21Q05     
             1    "Not at all"
             2    "A little"
             3    "Some"
             4    "A lot"
             8    "M/R"
             9    "Mis"
             7    "N/A"/
 SC22Q01     "99997"    "N/A"
             "99999"    "Mis"/
 SC22Q02     "99997"    "N/A"
             "99999"    "Mis"/
 SC22Q03     "99997"    "N/A"
             "99999"    "Mis"/
 SC22Q04     "99997"    "N/A"
             "99999"    "Mis"/
 SC22Q05     "99997"    "N/A"
             "99999"    "Mis"/
 SC22Q06     "99997"    "N/A"
             "99999"    "Mis"/
 SC22Q07     "99997"    "N/A"
             "99999"    "Mis"/
 SC22Q08     "99997"    "N/A"
             "99999"    "Mis"/
 SC22Q09     "99997"    "N/A"
             "99999"    "Mis"/
 SC22Q10     "99997"    "N/A"
             "99999"    "Mis"/
 SC22Q11     "99997"    "N/A"
             "99999"    "Mis"/
 SC22Q12     "99997"    "N/A"
             "99999"    "Mis"/
SCHLSIZE    99997 "N/A"
	 99999	    "Mis"/
PCGIRLS PERCOMP1 to PERCOMP5 PROPQUAL PROPCERT PROPREAD PROPMATH PROPSCIE
	7 	"N/A"
	9 	"Mis"/
SCHLTYPE
	1 	"Private, government independent"
	2 	"Private, government dependent"
	3 	"Government" 
	7	"N/A"
	9	"Mis"/
TOTHRS	9997	"N/A"
	9999	"Mis"/
RATCOMP	97	"N/A"
	99	"Mis"/
STRATIO SCMATEDU to scmatbui
	97 	"N/A"
	99	"Mis"/
CNT
           "ALB" "ALBANIA"
           "ARG" "ARGENTINA"
           "BGR" "BULGARIA"
           "CHL" "CHILE"
           "HKG" "HONG KONG"
           "IDN" "INDONESIA"
           "ISR" "ISRAEL"
           "PER" "PERU"
           "ROM" "ROMANIA"
           "THA" "THAILAND"
           "MKD" "MACEDONIA"
           "AUS" "AUSTRALIA"
           "AUT" "AUSTRIA"
           "BEL" "BELGIUM"
           "BRA" "BRAZIL"
           "CAN" "CANADA"
           "CZE" "CZECH REPUBLIC"
           "DNK" "DENMARK"
           "FIN" "FINLAND"
           "FRA" "FRANCE"
           "DEU" "GERMANY"
           "GRC" "GREECE"
           "HUN" "HUNGARY"
           "ISL" "ICELAND"
           "IRL" "IRELAND"
           "ITA" "ITALY"
           "JPN" "JAPAN"
           "KOR" "KOREA, REPUBLIC OF"
           "LVA" "LATVIA"
           "LIE" "LIECHTENSTEIN"
           "LUX" "LUXEMBOURG"
           "MEX" "MEXICO"
           "NLD" "NETHERLANDS"
           "NZL" "NEW ZEALAND"
           "NOR" "NORWAY"
           "POL" "POLAND"
           "PRT" "PORTUGAL"
           "RUS" "RUSSIAN FEDERATION"
           "ESP" "SPAIN"
           "SWE" "SWEDEN"
           "CHE" "SWITZERLAND"
           "GBR" "UNITED KINGDOM"
           "USA" "UNITED STATES".


MISSING VALUES
sc01q01 sc03q01 sc05q01 to sc05q14 sc07q01 to sc07q07 sc09q01 to sc12q05 sc16q01 to sc21q05 schltype (8,9,7)
/pcgirls percomp1 to percomp5 propqual propcert propread propmath propscie (7,9)
/sc06q01 to sc06q02 stratio scmatedu to scmatbui ratcomp (97,98,99)
/sc04q01 to sc04q04 sc06q03 sc08q01 to sc08q06 sc14q01 to sc15q01  (997,998,999)
/sc02q01 sc02q02 sc13q01 to sc13q06 tothrs (9997,9998,9999)
/schlsize (99997,99999)
/sc22q01 to sc22q12 ("99997","99999")

save outfile='c:\****\intscho.sav'.

