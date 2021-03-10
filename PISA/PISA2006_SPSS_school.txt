***** PISA 2006 School Questionnaire *****.
***** Read-in syntax for SPSS        *****.

* This syntax reads the ASCII text file data and applies variable and value labels, formats and missing value specifications.
* Write the location of the ASCII text file below, in the DATA LIST command.

SET decimal=dot.


DATA LIST FILE='c:\****\INT_Sch06_Dec07.txt' / 
   SUBNATIO            1 -    5 (A)         
   SCHOOLID            6 -   10 (A)         
   CNT                11 -   13 (A)         
   COUNTRY            14 -   16 (A)         
   OECD               17 -   17 (F,0)       
   SC01Q01            18 -   22 (F,0)       
   SC01Q02            23 -   27 (F,0)       
   SC02Q01            28 -   28 (F,0)       
   SC03Q01            29 -   36 (F,2)       
   SC03Q02            37 -   44 (F,2)       
   SC03Q03            45 -   52 (F,2)       
   SC03Q04            53 -   60 (F,2)       
   SC04Q01            61 -   61 (F,0)       
   SC04Q02            62 -   62 (F,0)       
   SC04Q03            63 -   63 (F,0)       
   SC04Q04            64 -   64 (F,0)       
   SC04Q05            65 -   65 (F,0)       
   SC04Q06            66 -   66 (F,0)       
   SC04Q07            67 -   67 (F,0)       
   SC04Q08            68 -   68 (F,0)       
   SC04Q09            69 -   69 (F,0)       
   SC04Q10            70 -   70 (F,0)       
   SC04Q11            71 -   71 (F,0)       
   SC04Q12            72 -   72 (F,0)       
   SC04Q13            73 -   73 (F,0)       
   SC04Q14            74 -   74 (F,0)       
   SC05Q01            75 -   82 (F,2)       
   SC05Q02            83 -   90 (F,2)       
   SC06Q01            91 -   92 (F,0)       
   SC07Q01            93 -   93 (F,0)       
   SC08Q01            94 -   94 (F,0)       
   SC08Q02            95 -   95 (F,0)       
   SC09Q11            96 -   99 (F,0)       
   SC09Q12           100 -  103 (F,0)       
   SC09Q21           104 -  107 (F,0)       
   SC09Q22           108 -  111 (F,0)       
   SC09Q31           112 -  115 (F,0)       
   SC09Q32           116 -  119 (F,0)       
   SC10Q01           120 -  120 (F,0)       
   SC11QA1           121 -  121 (F,0)       
   SC11QA2           122 -  122 (F,0)       
   SC11QA3           123 -  123 (F,0)       
   SC11QA4           124 -  124 (F,0)       
   SC11QB1           125 -  125 (F,0)       
   SC11QB2           126 -  126 (F,0)       
   SC11QB3           127 -  127 (F,0)       
   SC11QB4           128 -  128 (F,0)       
   SC11QC1           129 -  129 (F,0)       
   SC11QC2           130 -  130 (F,0)       
   SC11QC3           131 -  131 (F,0)       
   SC11QC4           132 -  132 (F,0)       
   SC11QD1           133 -  133 (F,0)       
   SC11QD2           134 -  134 (F,0)       
   SC11QD3           135 -  135 (F,0)       
   SC11QD4           136 -  136 (F,0)       
   SC11QE1           137 -  137 (F,0)       
   SC11QE2           138 -  138 (F,0)       
   SC11QE3           139 -  139 (F,0)       
   SC11QE4           140 -  140 (F,0)       
   SC11QF1           141 -  141 (F,0)       
   SC11QF2           142 -  142 (F,0)       
   SC11QF3           143 -  143 (F,0)       
   SC11QF4           144 -  144 (F,0)       
   SC11QG1           145 -  145 (F,0)       
   SC11QG2           146 -  146 (F,0)       
   SC11QG3           147 -  147 (F,0)       
   SC11QG4           148 -  148 (F,0)       
   SC11QH1           149 -  149 (F,0)       
   SC11QH2           150 -  150 (F,0)       
   SC11QH3           151 -  151 (F,0)       
   SC11QH4           152 -  152 (F,0)       
   SC11QI1           153 -  153 (F,0)       
   SC11QI2           154 -  154 (F,0)       
   SC11QI3           155 -  155 (F,0)       
   SC11QI4           156 -  156 (F,0)       
   SC11QJ1           157 -  157 (F,0)       
   SC11QJ2           158 -  158 (F,0)       
   SC11QJ3           159 -  159 (F,0)       
   SC11QJ4           160 -  160 (F,0)       
   SC11QK1           161 -  161 (F,0)       
   SC11QK2           162 -  162 (F,0)       
   SC11QK3           163 -  163 (F,0)       
   SC11QK4           164 -  164 (F,0)       
   SC11QL1           165 -  165 (F,0)       
   SC11QL2           166 -  166 (F,0)       
   SC11QL3           167 -  167 (F,0)       
   SC11QL4           168 -  168 (F,0)       
   SC12QA1           169 -  169 (F,0)       
   SC12QA2           170 -  170 (F,0)       
   SC12QA3           171 -  171 (F,0)       
   SC12QA4           172 -  172 (F,0)       
   SC12QB1           173 -  173 (F,0)       
   SC12QB2           174 -  174 (F,0)       
   SC12QB3           175 -  175 (F,0)       
   SC12QB4           176 -  176 (F,0)       
   SC12QC1           177 -  177 (F,0)       
   SC12QC2           178 -  178 (F,0)       
   SC12QC3           179 -  179 (F,0)       
   SC12QC4           180 -  180 (F,0)       
   SC12QD1           181 -  181 (F,0)       
   SC12QD2           182 -  182 (F,0)       
   SC12QD3           183 -  183 (F,0)       
   SC12QD4           184 -  184 (F,0)       
   SC12QE1           185 -  185 (F,0)       
   SC12QE2           186 -  186 (F,0)       
   SC12QE3           187 -  187 (F,0)       
   SC12QE4           188 -  188 (F,0)       
   SC12QF1           189 -  189 (F,0)       
   SC12QF2           190 -  190 (F,0)       
   SC12QF3           191 -  191 (F,0)       
   SC12QF4           192 -  192 (F,0)       
   SC13Q01           193 -  197 (F,0)       
   SC13Q02           198 -  202 (F,0)       
   SC13Q03           203 -  207 (F,0)       
   SC14Q01           208 -  208 (F,0)       
   SC14Q02           209 -  209 (F,0)       
   SC14Q03           210 -  210 (F,0)       
   SC14Q04           211 -  211 (F,0)       
   SC14Q05           212 -  212 (F,0)       
   SC14Q06           213 -  213 (F,0)       
   SC14Q07           214 -  214 (F,0)       
   SC14Q08           215 -  215 (F,0)       
   SC14Q09           216 -  216 (F,0)       
   SC14Q10           217 -  217 (F,0)       
   SC14Q11           218 -  218 (F,0)       
   SC14Q12           219 -  219 (F,0)       
   SC14Q13           220 -  220 (F,0)       
   SC15Q01           221 -  221 (F,0)       
   SC15Q02           222 -  222 (F,0)       
   SC15Q03           223 -  223 (F,0)       
   SC16Q01           224 -  224 (F,0)       
   SC17Q01           225 -  225 (F,0)       
   SC17Q02           226 -  226 (F,0)       
   SC17Q03           227 -  227 (F,0)       
   SC17Q04           228 -  228 (F,0)       
   SC17Q05           229 -  229 (F,0)       
   SC18Q01           230 -  230 (F,0)       
   SC19Q01           231 -  231 (F,0)       
   SC19Q02           232 -  232 (F,0)       
   SC19Q03           233 -  233 (F,0)       
   SC19Q04           234 -  234 (F,0)       
   SC19Q05           235 -  235 (F,0)       
   SC19Q06           236 -  236 (F,0)       
   SC20Q01           237 -  237 (F,0)       
   SC20Q02           238 -  238 (F,0)       
   SC20Q03           239 -  239 (F,0)       
   SC20Q04           240 -  240 (F,0)       
   SC20Q05           241 -  241 (F,0)       
   SC21Q01           242 -  242 (F,0)       
   SC21Q02           243 -  243 (F,0)       
   SC21Q03           244 -  244 (F,0)       
   SC21Q04           245 -  245 (F,0)       
   SC22Q01           246 -  246 (F,0)       
   SC22Q02           247 -  247 (F,0)       
   SC22Q03           248 -  248 (F,0)       
   SC22Q04           249 -  249 (F,0)       
   SC22Q05           250 -  250 (F,0)       
   SC23Q01           251 -  251 (F,0)       
   SC23Q02           252 -  252 (F,0)       
   SC23Q03           253 -  253 (F,0)       
   SC24Q01           254 -  254 (F,0)       
   SC25Q01           255 -  255 (F,0)       
   SC26Q01           256 -  256 (F,0)       
   SC27Q01           257 -  257 (F,0)       
   SC28Q01           258 -  258 (F,0)       
   SC29Q01           259 -  259 (F,0)       
   ABGROUP           260 -  260 (F,0)       
   CLSIZE            261 -  262 (F,0)       
   COMPWEB           263 -  270 (F,3)       
   IRATCOMP          271 -  278 (F,3)       
   PCGIRLS           279 -  286 (F,3)       
   PROPCERT          287 -  294 (F,3)       
   PROPQUAL          295 -  302 (F,3)       
   RATCOMP           303 -  310 (F,3)       
   SCHLTYPE          311 -  311 (F,0)       
   SCHSIZE           312 -  319 (F,0)       
   SELSCH            320 -  320 (F,0)       
   STRATIO           321 -  328 (F,3)       
   RESPRES           329 -  336 (F,3)       
   RESPCURR          337 -  344 (F,3)       
   ENVLEARN          345 -  352 (F,4)       
   SCIPROM           353 -  360 (F,4)       
   SCMATEDU          361 -  368 (F,4)       
   TCSHORT           369 -  376 (F,4)       
   W_FSCHWT          377 -  385 (F,4)       
   STRATUM           386 -  390 (A)         
   VER_SCH           391 -  403 (A)         
.


EXECUTE.

FORMATS OECD (F1.0).
FORMATS SC01Q01 SC01Q02 (F5.0).
FORMATS SC03Q01 SC03Q02 SC03Q03 SC03Q04 SC05Q01 SC05Q02 (F8.2).
FORMATS SC06Q01 (F2.0).
FORMATS SC09Q11 SC09Q12 SC09Q21 SC09Q22 SC09Q31 SC09Q32 (F4.0).
FORMATS SC13Q01 SC13Q02 SC13Q03 (F5.0).
FORMATS SCHLTYPE ABGROUP SELSCH (F1.0).
FORMATS SCHSIZE (F8.0).
FORMATS PCGIRLS RATCOMP IRATCOMP COMPWEB STRATIO PROPCERT PROPQUAL RESPRES RESPCURR  (F8.3). 
FORMATS TCSHORT SCMATEDU SCIPROM ENVLEARN  (F8.4).
FORMATS w_fschwt (f9.4).

VARIABLE LEVEL OECD (NOMINAL).
VARIABLE LEVEL SC01Q01 SC01Q02 (SCALE).
VARIABLE LEVEL SC03Q01 SC03Q02 SC03Q03 SC03Q04 (SCALE).
VARIABLE LEVEL SC05Q01 SC05Q02 (SCALE).
VARIABLE LEVEL SC06Q01 (ORDINAL).
VARIABLE LEVEL SC09Q11 SC09Q12 SC09Q21 SC09Q22 SC09Q31 SC09Q32 (SCALE).
VARIABLE LEVEL SC13Q01 SC13Q02 SC13Q03 (SCALE).
VARIABLE LEVEL SCHLTYPE ABGROUP SELSCH (ORDINAL).
VARIABLE LEVEL CLSIZE COMPWEB IRATCOMP PCGIRLS PROPCERT (SCALE).
VARIABLE LEVEL PROPQUAL RATCOMP SCHSIZE STRATIO ENVLEARN (SCALE).
VARIABLE LEVEL RESPRES RESPCURR SCIPROM SCMATEDU TCSHORT (SCALE).



VARIABLE LABELS
  OECD      "OECD country"
  CNT       "Country code 3-character"
  COUNTRY   "Country code ISO 3-digit"
  SUBNATIO  "Adjudicated sub-region"
  SCHOOLID  "School ID 5-digit"
  SC01Q01   'Number of boys Q1a'           
  SC01Q02   'Number of girls Q1b'                                                              
  SC02Q01   'Public or private Q2'         
  SC03Q01   'Funding government Q3a'                                                           
  SC03Q02   'Funding student fees Q3b'     
  SC03Q03   'Funding benefactors Q3c'                                                          
  SC03Q04   'Funding other Q3d'                                                                
  SC04Q01   'Grade 1 Q4a'   
  SC04Q02   'Grade 2 Q4b'  
  SC04Q03   'Grade 3 Q4c'  
  SC04Q04   'Grade 4 Q4d'   
  SC04Q05   'Grade 5 Q4e'   
  SC04Q06   'Grade 6 Q4f'  
  SC04Q07   'Grade 7 Q4g'  
  SC04Q08   'Grade 8 Q4h'  
  SC04Q09   'Grade 9 Q4i'   
  SC04Q10   'Grade 10 Q4j'    
  SC04Q11   'Grade 11 Q4k'    
  SC04Q12   'Grade 12 Q4l'    
  SC04Q13   'Grade 13 Q4m'    
  SC04Q14   'Ungraded school Q4n'                                                              
  SC05Q01   'Repeat <grade> at <ISCED2> Q5a'                                                  
  SC05Q02   'Repeat <grade> at <ISCED3> Q5b'                                                  
  SC06Q01   'Size <test lang> classes <modal 15 year old grade> Q6'                                        
  SC07Q01   'School community Q7'                                                             
  SC08Q01   'Streaming between classes Q8a'                                                    
  SC08Q02   'Streaming within classes Q8b'                                                     
  SC09Q11   'Full time teachers in TOTAL Q9a1'                                                         
  SC09Q12   'Part time teachers in TOTAL Q9a2'                                                         
  SC09Q21   'Full time teachers fully certified Q9b1'                                                  
  SC09Q22   'Part time teachers fully certified Q9b2'                                                 
  SC09Q31   'Full time teachers ISCED5A Qual Q9c1'                                                     
  SC09Q32   'Part time teachers ISCED5A Qual Q9c2'                                                     
  SC10Q01   'Fill science teaching vacancy Q10'                                                        
  SC11Qa1   'Responsibility teacher hire - Principal or teachers Q11a1'                          
  SC11Qa2   'Responsibility teacher hire - School governing board Q11a2'                         
  SC11Qa3   'Responsibility teacher hire - Intermediate education authority Q11a3'         
  SC11Qa4   'Responsibility teacher hire - Central education authority Q11a4'                    
  SC11Qb1   'Responsibility firing teachers - Principal or teachers Q11b1'                       
  SC11Qb2   'Responsibility firing teachers - School governing board Q11b2'                      
  SC11Qb3   'Responsibility firing teachers - Intermediate education authority Q11b3'      
  SC11Qb4   'Responsibility firing teachers - Central education authority Q11b4'                 
  SC11Qc1   'Responsibility starting salaries - Principal or teachers Q11c1'                 
  SC11Qc2   'Responsibility starting salaries - School governing board Q11c2'                
  SC11Qc3   'Responsibility starting salaries - Intermediate education authority Q11c3'
  SC11Qc4   'Responsibility starting salaries - Central education authority Q11c4'           
  SC11Qd1   'Responsibility salary increases - Principal or teachers Q11d1'                      
  SC11Qd2   'Responsibility salary increases - School governing board Q11d2'                     
  SC11Qd3   'Responsibility salary increases - Intermediate education authority Q11d3'     
  SC11Qd4   'Responsibility salary increases - Central education authority Q11d4'                
  SC11Qe1   'Responsibility formulate budget - Principal or teachers Q11e1'                      
  SC11Qe2   'Responsibility formulate budget - School governing board Q11e2'                     
  SC11Qe3   'Responsibility formulate budget - Intermediate education authority Q11e3'     
  SC11Qe4   'Responsibility formulate budget - Central education authority Q11e4'                
  SC11Qf1   'Responsibility budget allocations - Principal or teachers Q11f1'                    
  SC11Qf2   'Responsibility budget allocations - School governing board Q11f2'                   
  SC11Qf3   'Responsibility budget allocations - Intermediate education authority Q11f3'   
  SC11Qf4   'Responsibility budget allocations - Central education authority Q11f4'              
  SC11Qg1   'Responsibility student discipline - Principal or teachers Q11g1'                    
  SC11Qg2   'Responsibility student discipline - School governing board Q11g2'                   
  SC11Qg3   'Responsibility student discipline - Intermediate education authority Q11g3'   
  SC11Qg4   'Responsibility student discipline - Central education authority Q11g4'              
  SC11Qh1   'Responsibility student assessment - Principal or teachers Q11h1'                    
  SC11Qh2   'Responsibility student assessment - School governing board Q11h2'                   
  SC11Qh3   'Responsibility student assessment - Intermediate education authority Q11h3'   
  SC11Qh4   'Responsibility student assessment - Central education authority Q11h4'              
  SC11Qi1   'Responsibility student admission - Principal or teachers Q11i1'                     
  SC11Qi2   'Responsibility student admission - School governing board Q11i2'                    
  SC11Qi3   'Responsibility student admission - Intermediate education authority Q11i3'    
  SC11Qi4   'Responsibility student admission - Central education authority Q11i4'               
  SC11Qj1   'Responsibility textbook use - Principal or teachers Q11j1'                          
  SC11Qj2   'Responsibility textbook use - School governing board Q11j2'                         
  SC11Qj3   'Responsibility textbook use - Intermediate education authority Q11j3'         
  SC11Qj4   'Responsibility textbook use - Central education authority Q11j4'                    
  SC11Qk1   'Responsibility course content - Principal or teachers Q11k1'                        
  SC11Qk2   'Responsibility course content - School governing board Q11k2'                       
  SC11Qk3   'Responsibility course content - Intermediate education authority Q11k3'       
  SC11Qk4   'Responsibility course content - Central education authority Q11k4'                  
  SC11Ql1   'Responsibility courses offered - Principal or teachers Q11l1'                       
  SC11Ql2   'Responsibility courses offered - School governing board Q11l2'                      
  SC11Ql3   'Responsibility courses offered - Intermediate education authority Q11l3'      
  SC11Ql4   'Responsibility courses offered - Central education authority Q11l4'                 
  SC12Qa1   'Intermediate or central authority - Influence staffing Q12a1'                       
  SC12Qa2   'Intermediate or central authority - Influence budget Q12a2'                         
  SC12Qa3   'Intermediate or central authority - Influence instructional content Q12a3'          
  SC12Qa4   'Intermediate or central authority - Influence assessment Q12a4'                     
  SC12Qb1   'School governing board - Influence staffing Q12b1'                                  
  SC12Qb2   'School governing board - Influence budget Q12b2'                                    
  SC12Qb3   'School governing board - Influence instructional content Q12b3'                     
  SC12Qb4   'School governing board - Influence assessment Q12b4'                                
  SC12Qc1   'Parent groups - Influence staffing Q12c1'                                           
  SC12Qc2   'Parent groups - Influence budget Q12c2'                                             
  SC12Qc3   'Parent groups - Influence instructional content Q12c3'                              
  SC12Qc4   'Parent groups - Influence assessment Q12c4'                                         
  SC12Qd1   'Teacher groups - Influence staffing Q12d1'             
  SC12Qd2   'Teacher groups - Influence budget Q12d2'               
  SC12Qd3   'Teacher groups - Influence instructional content Q12d3'
  SC12Qd4   'Teacher groups - Influence assessment Q12d4'           
  SC12Qe1   'Student groups - Influence staffing Q12e1'                                          
  SC12Qe2   'Student groups - Influence budget Q12e2'                                            
  SC12Qe3   'Student groups - Influence instructional content Q12e3'                             
  SC12Qe4   'Student groups - Influence assessment Q12e4'                                        
  SC12Qf1   'Examination board - Influence staffing Q12f1'                                       
  SC12Qf2   'Examination board - Influence budget Q12f2'                                         
  SC12Qf3   'Examination board - Influence instructional content Q12f3'                          
  SC12Qf4   'Examination board - Influence assessment Q12f4'                                     
  SC13Q01   'Computers altogether Q13a'                                                         
  SC13Q02   'Computers instruction Q13b'                                                        
  SC13Q03   'Computers with web Q13c'                                                           
  SC14Q01   'Shortage science teachers Q14a'                                                     
  SC14Q02   'Shortage maths teachers Q14b'                                                    
  SC14Q03   'Shortage <test lang> teachers Q14c'                                                
  SC14Q04   'Shortage qualified teachers Q14d'                                                  
  SC14Q05   'Shortage lab techs Q14e'                                                           
  SC14Q06   'Shortage other personnel Q14f'                                                     
  SC14Q07   'Shortage science lab equipment Q14g'                                                       
  SC14Q08   'Shortage instruct material Q14h'                                                   
  SC14Q09   'Shortage computers Q14i'                                                           
  SC14Q10   'Shortage Internet Q14j'                                                            
  SC14Q11   'Shortage computer software Q14k'                                                   
  SC14Q12   'Shortage library materials Q14l'                                                   
  SC14Q13   'Shortage audio-visual Q14m'                                                        
  SC15Q01   'Relative to other students Q15a'                                                   
  SC15Q02   'Relative to benchmarks Q15b'                                                       
  SC15Q03   'Relative to same grade Q15c'                                                       
  SC16Q01   'Parent pressure academic standards Q16'                                                  
  SC17Q01   'Achievement public Q17a'                                                           
  SC17Q02   'Achievement principal Q17b'                                                        
  SC17Q03   'Achievement teachers Q17c'                                                         
  SC17Q04   'Achievement resources Q17d'                                                        
  SC17Q05   'Achievement tracked Q17e'                                                          
  SC18Q01   'Schooling available Q18'                                                          
  SC19Q01   'Admittance residence Q19a'                                                         
  SC19Q02   'Admittance academic record Q19b'                                                    
  SC19Q03   'Admittance recommendation Q19c'                                                    
  SC19Q04   'Admittance parents endorse Q19d'                                                   
  SC19Q05   'Admittance special programme Q19e'                                                      
  SC19Q06   'Admittance family preference Q19f'                                                       
  SC20Q01   'Activities <science clubs> Q20a'                                                   
  SC20Q02   'Activities <science fairs> Q20b'                                                   
  SC20Q03   'Activities <science competitions> Q20c'                                                   
  SC20Q04   'Activities  <science projects> Q20d'                                               
  SC20Q05   'Activities  <science trips> Q20e'                                                  
  SC21Q01   'Envr specific course Q21a'                                                       
  SC21Q02   'Envr natural sciences Q21b'                                                      
  SC21Q03   'Envr geography course Q21c'                                                      
  SC21Q04   'Envr another course Q21d'                                                          
  SC22Q01   'Envr activity <outdoor> Q22a'                                                      
  SC22Q02   'Envr activity museum Q22b'                                                         
  SC22Q03   'Envr activity sci/tech Q22c'                                                       
  SC22Q04   'Envr activity projects Q22d'                                                       
  SC22Q05   'Envr activity lectures Q22e'                                                       
  SC23Q01   'Participate job fairs Q23a'                                                        
  SC23Q02   'Participate business/industry lectures Q23b'                                                
  SC23Q03   'Participate business/industry visits Q23c'                                                  
  SC24Q01   'Training local business Q24'                                                      
  SC25Q01   'Curriculum business/industry Q25'                                                          
  SC26Q01   'Developing science skills Q26'                                                    
  SC27Q01   'Developing tertiary skills Q27'                                                   
  SC28Q01   'Guidance responsibility Q28'                                                      
  SC29Q01   'Career guidance Opportunity Q29'                                                  
  ABGROUP   'Ability grouping within schools recoded from SC08Q01 and SC08Q02 (2006)'             
  CLSIZE    'Size of <test language> class recoded from SC06Q01'                           
  COMPWEB   'Proportion of computers connected to web'                                     
  IRATCOMP  'Ratio of computers for instruction to school size'                           
  PCGIRLS   'Proportion of girls at school'  
  PROPCERT  'Proportion of certified teachers'                                             
  PROPQUAL  'Proportion of teachers with ISCED 5A'   
  RATCOMP   'Ratio of computers to school size'   
  SCHLTYPE  'School ownership'   
  SCHSIZE   'School size'  
  STRATIO   'Teacher-student ratio'   
  SELSCH    'School academic selectivity recoded from SC19Q02 and SC19Q03 (2006)'                 
  RESPRES   'Responsibility for resource allocation index PISA 2006'            
  RESPCURR  'Responsibility for curriculum & assessment index PISA 2006'        
  ENVLEARN  'School activities for learning environmental topics PISA 2006 (WLE)'
  SCIPROM   'School activities to promote the learning of science PISA 2006 (WLE)'                         
  SCMATEDU  'Quality of educational resources PISA 2006 (WLE)'                                             
  TCSHORT   'Teacher shortage (negative scale) PISA 2006 (WLE)'                                            
  W_FSCHWT  'Final school weight'
  STRATUM   "Original stratum"
  VER_SCH   'Version of school database and date of release' 
.                                                                                   


VALUE LABELS
   OECD
      0      "Non-OECD" 
      1      "OECD" 
.
VALUE LABELS 
   CNT  
      "ARG"  'Argentina'
      "AUS"  'Australia'
      "AUT"  'Austria'
      "AZE"  'Azerbaijan'
      "BEL"  'Belgium'
      "BGR"  'Bulgaria'
      "BRA"  'Brazil'
      "CAN"  'Canada'
      "CHE"  'Switzerland'
      "CHL"  'Chile'
      "COL"  'Colombia'
      "CZE"  'Czech Republic'
      "DEU"  'Germany'
      "DNK"  'Denmark'
      "ESP"  'Spain'
      "EST"  'Estonia'
      "FIN"  'Finland'
      "FRA"  'France'
      "GBR"  'United Kingdom'
      "GRC"  'Greece'
      "HKG"  'Hong Kong-China'
      "HRV"  'Croatia'
      "HUN"  'Hungary'
      "IDN"  'Indonesia'
      "IRL"  'Ireland'
      "ISL"  'Iceland'
      "ISR"  'Israel'
      "ITA"  'Italy'
      "JOR"  'Jordan'
      "JPN"  'Japan'
      "KGZ"  'Kyrgyzstan'
      "KOR"  'Korea'
      "LIE"  'Liechtenstein'
      "LTU"  'Lithuania'
      "LUX"  'Luxembourg'
      "LVA"  'Latvia'
      "MAC"  'Macao-China'
      "MEX"  'Mexico'
      "MNE"  'Montenegro'
      "NLD"  'Netherlands'
      "NOR"  'Norway'
      "NZL"  'New Zealand'
      "POL"  'Poland'
      "PRT"  'Portugal'
      "QAT"  'Qatar'
      "ROU"  'Romania'
      "RUS"  'Russian Federation'
      "SRB"  'Serbia   '
      "SVK"  'Slovak Republic'
      "SVN"  'Slovenia '
      "SWE"  'Sweden'
      "TAP"  'Chinese Taipei'
      "THA"  'Thailand'
      "TUN"  'Tunisia'
      "TUR"  'Turkey'
      "URY"  'Uruguay'
      "USA"  'United States'
.
VALUE LABELS 
   country
      "031"	 "Azerbaijan" 
      "032"	 "Argentina" 
      "036"	 "Australia" 
      "040"	 "Austria" 
      "056"	 "Belgium" 
      "076"	 "Brazil" 
      "100"	 "Bulgaria" 
      "124"	 "Canada" 
      "152"	 "Chile" 
      "158"	 "Chinese Taipei" 
      "170"	 "Colombia" 
      "191"	 "Croatia" 
      "203"	 "Czech Republic"
      "208"	 "Denmark"
      "233"	 "Estonia" 
      "246"	 "Finland" 
      "250"	 "France" 
      "276"	 "Germany" 
      "300"	 "Greece" 
      "344"	 "Hong Kong-China" 
      "348"	 "Hungary" 
      "352"	 "Iceland" 
      "360"	 "Indonesia" 
      "372"	 "Ireland" 
      "376"	 "Israel" 
      "380"	 "Italy" 
      "392"	 "Japan" 
      "400"	 "Jordan" 
      "410"	 "Korea" 
      "417"	 "Kyrgyzstan" 
      "428"	 "Latvia" 
      "438"	 "Liechtenstein" 
      "440"	 "Lithuania" 
      "442"	 "Luxembourg" 
      "446"	 "Macao-China" 
      "484"	 "Mexico" 
      "499"	 "Montenegro" 
      "528"	 "Netherlands" 
      "554"	 "New Zealand" 
      "578"	 "Norway" 
      "616"	 "Poland" 
      "620"	 "Portugal" 
      "634"	 "Qatar" 
      "642"	 "Romania" 
      "643"	 "Russian Federation" 
      "688"	 "Serbia" 
      "703"	 "Slovak Republic" 
      "705"	 "Slovenia" 
      "724"	 "Spain" 
      "752"	 "Sweden" 
      "756"	 "Switzerland" 
      "764"	 "Thailand" 
      "788"	 "Tunisia" 
      "792"	 "Turkey" 
      "826"	 "United Kingdom" 
      "840"	 "United States" 
      "858"	 "Uruguay" 
.

VALUE LABELS 
   SUBNATIO
      "03100"	 "Azerbaijan" 
      "03200"	 "Argentina" 
      "03600"	 "Australia" 
      "04000"	 "Austria" 
      "05601"	 "Belgium: Flemish region" 
      "05699"	 "Belgium: French & German regions (not adjudicated)" 
      "07600"	 "Brazil" 
      "10000"	 "Bulgaria" 
      "12400"	 "Canada" 
      "15200"	 "Chile" 
      "15800"	 "Chinese Taipei" 
      "17000"	 "Colombia" 
      "19100"	 "Croatia" 
      "20300"	 "Czech Republic"
      "20800"	 "Denmark"
      "23300"	 "Estonia" 
      "24600"	 "Finland" 
      "25000"	 "France" 
      "27600"	 "Germany" 
      "30000"	 "Greece" 
      "34400"	 "Hong Kong-China" 
      "34800"	 "Hungary" 
      "35200"	 "Iceland" 
      "36000"	 "Indonesia" 
      "37200"	 "Ireland" 
      "37600"	 "Israel" 
      "38001"  "Italy: Region 1"
      "38002"  "Italy: Region 2"
      "38003"  "Italy: Region 3"
      "38004"  "Italy: Region 4"
      "38005"  "Italy: Region 5"
      "38006"  "Italy: Region 6"
      "38007"  "Italy: Region 7"
      "38008"  "Italy: Region 8"
      "38009"  "Italy: Region 9"
      "38010"  "Italy: Region 10"
      "38011"  "Italy: Region 11"
      "38012"  "Italy: Region 12"
      "38013"  "Italy: Region 13"
      "38099"  "Italy: Region 14 (not adjudicated)"
      "39200"	 "Japan" 
      "40000"	 "Jordan" 
      "41000"	 "Korea" 
      "41700"	 "Kyrgyzstan" 
      "42800"	 "Latvia" 
      "43800"	 "Liechtenstein" 
      "44000"	 "Lithuania" 
      "44200"	 "Luxembourg" 
      "44600"	 "Macao-China" 
      "48400"	 "Mexico" 
      "49900"	 "Montenegro" 
      "52800"	 "Netherlands" 
      "55400"	 "New Zealand" 
      "57800"	 "Norway" 
      "61600"	 "Poland" 
      "62000"	 "Portugal" 
      "63400"	 "Qatar" 
      "64200"	 "Romania" 
      "64300"	 "Russian Federation" 
      "68800"	 "Serbia" 
      "70300"	 "Slovak Republic" 
      "70500"	 "Slovenia" 
      "72401"  "Spain: Andalusia"
      "72402"  "Spain: Aragon"
      "72403"  "Spain: Asturias"
      "72406"  "Spain: Cantabria"
      "72407"  "Spain: Castile and Leon"
      "72409"  "Spain: Catalonia"
      "72411"  "Spain: Galicia"
      "72412"  "Spain: La Rioja"
      "72415"  "Spain: Navarre"
      "72416"  "Spain: Basque Country"
      "72499"  "The rest of Spain (not adjudicated)"
      "75200"	 "Sweden" 
      "75600"	 "Switzerland" 
      "76400"	 "Thailand" 
      "78800"	 "Tunisia" 
      "79200"	 "Turkey" 
      "82610"  "United Kingdom: England, Wales & Northern Ireland"
      "82620"  "United Kingdom: Scotland"
      "84000"	 "United States" 
      "85800"	 "Uruguay" 
.


VALUE LABELS
   STRATUM
     '03201' 'ARG: COD_PROV02'
     '03202' 'ARG: COD_PROV05'
     '03203' 'ARG: COD_PROV06'
     '03204' 'ARG: COD_PROV10'
     '03205' 'ARG: COD_PROV14'
     '03206' 'ARG: COD_PROV18'
     '03207' 'ARG: COD_PROV22'
     '03208' 'ARG: COD_PROV26'
     '03209' 'ARG: COD_PROV30'
     '03210' 'ARG: COD_PROV34'
     '03211' 'ARG: COD_PROV38'
     '03212' 'ARG: COD_PROV42'
     '03213' 'ARG: COD_PROV46'
     '03214' 'ARG: COD_PROV50'
     '03215' 'ARG: COD_PROV54'
     '03216' 'ARG: COD_PROV58'
     '03217' 'ARG: COD_PROV62'
     '03218' 'ARG: COD_PROV66'
     '03219' 'ARG: COD_PROV70'
     '03220' 'ARG: COD_PROV74'
     '03221' 'ARG: COD_PROV78'
     '03222' 'ARG: COD_PROV82'
     '03223' 'ARG: COD_PROV86'
     '03224' 'ARG: COD_PROV90'
     '03225' 'ARG: COD_PROV94'
     '03226' 'ARG: Moderately Small schools'
     '03227' 'ARG: Very Small schools'
     '03601' 'AUS: ACT'
     '03602' 'AUS: NSW'
     '03603' 'AUS: NT'
     '03604' 'AUS: QLD'
     '03605' 'AUS: SA'
     '03606' 'AUS: TAS'
     '03607' 'AUS: VIC'
     '03608' 'AUS: WA'
     '04097' 'AUT: Stratum 97'
     '03197' 'AZE: Stratum 97'
     '05601' 'BEL: Stratum 01'
     '05602' 'BEL: Stratum 02'
     '05603' 'BEL: Stratum 03'
     '05604' 'BEL: Stratum 04'
     '05605' 'BEL: Stratum 05'
     '05606' 'BEL: Stratum 06'
     '05607' 'BEL: Stratum 07'
     '05608' 'BEL: Stratum 08'
     '05609' 'BEL: Stratum 09'
     '05610' 'BEL: Stratum 10'
     '05611' 'BEL: Stratum 11'
     '05612' 'BEL: Stratum 12'
     '05613' 'BEL: Stratum 13'
     '05614' 'BEL: Stratum 14'
     '05615' 'BEL: Stratum 15'
     '05616' 'BEL: Stratum 16'
     '05617' 'BEL: Stratum 17'
     '10001' 'BGR: Stratum 01'
     '10002' 'BGR: Stratum 02'
     '10003' 'BGR: Stratum 03'
     '10004' 'BGR: Stratum 04'
     '10005' 'BGR: Stratum 05'
     '10006' 'BGR: Stratum 06'
     '10007' 'BGR: Stratum 07'
     '10008' 'BGR: Stratum 08'
     '10009' 'BGR: Stratum 09'
     '10010' 'BGR: Stratum 10'
     '10011' 'BGR: Stratum 11'
     '10012' 'BGR: Stratum 12'
     '10013' 'BGR: Stratum 13'
     '07601' 'BRA: Stratum 01'
     '07602' 'BRA: Stratum 02'
     '07603' 'BRA: Stratum 03'
     '07604' 'BRA: Stratum 04'
     '07605' 'BRA: Stratum 05'
     '07606' 'BRA: Stratum 06'
     '07607' 'BRA: Stratum 07'
     '07608' 'BRA: Stratum 08'
     '07609' 'BRA: Stratum 09'
     '07610' 'BRA: Stratum 10'
     '07611' 'BRA: Stratum 11'
     '07612' 'BRA: Stratum 12'
     '07613' 'BRA: Stratum 13'
     '07614' 'BRA: Stratum 14'
     '07615' 'BRA: Stratum 15'
     '07616' 'BRA: Stratum 16'
     '07617' 'BRA: Stratum 17'
     '07618' 'BRA: Stratum 18'
     '07619' 'BRA: Stratum 19'
     '07620' 'BRA: Stratum 20'
     '07621' 'BRA: Stratum 21'
     '07622' 'BRA: Stratum 22'
     '07623' 'BRA: Stratum 23'
     '07624' 'BRA: Stratum 24'
     '07625' 'BRA: Stratum 25'
     '07626' 'BRA: Stratum 26'
     '07627' 'BRA: Stratum 27'
     '07628' 'BRA: Stratum 28'
     '07629' 'BRA: Stratum 29'
     '07630' 'BRA: Stratum 30'
     '12401' 'CAN: Stratum 01'
     '12402' 'CAN: Stratum 02'
     '12403' 'CAN: Stratum 03'
     '12404' 'CAN: Stratum 04'
     '12405' 'CAN: Stratum 05'
     '12406' 'CAN: Stratum 06'
     '12407' 'CAN: Stratum 07'
     '12408' 'CAN: Stratum 08'
     '12409' 'CAN: Stratum 09'
     '12410' 'CAN: Stratum 10'
     '12411' 'CAN: Stratum 11'
     '12412' 'CAN: Stratum 12'
     '12413' 'CAN: Stratum 13'
     '12414' 'CAN: Stratum 14'
     '12415' 'CAN: Stratum 15'
     '12416' 'CAN: Stratum 16'
     '12417' 'CAN: Stratum 17'
     '12418' 'CAN: Stratum 18'
     '12419' 'CAN: Stratum 19'
     '12420' 'CAN: Stratum 20'
     '12421' 'CAN: Stratum 21'
     '12422' 'CAN: Stratum 22'
     '12423' 'CAN: Stratum 23'
     '12424' 'CAN: Stratum 24'
     '12425' 'CAN: Stratum 25'
     '12426' 'CAN: Stratum 26'
     '12427' 'CAN: Stratum 27'
     '12428' 'CAN: Stratum 28'
     '12429' 'CAN: Stratum 29'
     '12430' 'CAN: Stratum 30'
     '12431' 'CAN: Stratum 31'
     '12432' 'CAN: Stratum 32'
     '12433' 'CAN: Stratum 33'
     '12434' 'CAN: Stratum 34'
     '12435' 'CAN: Stratum 35'
     '12436' 'CAN: Stratum 36'
     '12437' 'CAN: Stratum 37'
     '12438' 'CAN: Stratum 38'
     '12439' 'CAN: Stratum 39'
     '12440' 'CAN: Stratum 40'
     '12441' 'CAN: Stratum 41'
     '12442' 'CAN: Stratum 42'
     '12443' 'CAN: Stratum 43'
     '12444' 'CAN: Stratum 44'
     '75697' 'CHE: Stratum 97'
     '15201' 'CHL: Stratum 01'
     '15202' 'CHL: Stratum 02'
     '15203' 'CHL: Stratum 03'
     '15204' 'CHL: Stratum 04'
     '15205' 'CHL: Stratum 05'
     '15206' 'CHL: Stratum 06'
     '15207' 'CHL: Stratum 07'
     '15208' 'CHL: Stratum 08'
     '15209' 'CHL: Stratum 09'
     '15210' 'CHL: Stratum 10'
     '15211' 'CHL: Stratum 11'
     '15212' 'CHL: Stratum 12'
     '15213' 'CHL: Stratum 13'
     '15214' 'CHL: Stratum 14'
     '15216' 'CHL: Stratum 16'
     '15219' 'CHL: Stratum 19'
     '15220' 'CHL: Stratum 20'
     '17001' 'COL: Stratum 01'
     '17002' 'COL: Stratum 02'
     '17003' 'COL: Stratum 03'
     '20301' 'CZE: PRGM1_RGN1'
     '20302' 'CZE: PRGM1_RGN1_MSS'
     '20303' 'CZE: PRGM1_RGN1_VSS'
     '20304' 'CZE: PRGM1_RGN2'
     '20305' 'CZE: PRGM1_RGN2_MSS'
     '20306' 'CZE: PRGM1_RGN2_VSS'
     '20307' 'CZE: PRGM1_RGN3'
     '20308' 'CZE: PRGM1_RGN3_MSS'
     '20309' 'CZE: PRGM1_RGN3_VSS'
     '20310' 'CZE: PRGM1_RGN4'
     '20311' 'CZE: PRGM1_RGN4_MSS'
     '20312' 'CZE: PRGM1_RGN4_VSS'
     '20313' 'CZE: PRGM1_RGN5'
     '20314' 'CZE: PRGM1_RGN5_MSS'
     '20315' 'CZE: PRGM1_RGN5_VSS'
     '20316' 'CZE: PRGM1_RGN6'
     '20317' 'CZE: PRGM1_RGN6_MSS'
     '20318' 'CZE: PRGM1_RGN6_VSS'
     '20319' 'CZE: PRGM1_RGN7'
     '20320' 'CZE: PRGM1_RGN7_MSS'
     '20321' 'CZE: PRGM1_RGN7_VSS'
     '20322' 'CZE: PRGM1_RGN8'
     '20323' 'CZE: PRGM1_RGN8_MSS'
     '20324' 'CZE: PRGM1_RGN8_VSS'
     '20325' 'CZE: PRGM1_RGN9'
     '20326' 'CZE: PRGM1_RGN9_MSS'
     '20327' 'CZE: PRGM1_RGN9_VSS'
     '20328' 'CZE: PRGM1_RGN10'
     '20329' 'CZE: PRGM1_RGN10_MSS'
     '20330' 'CZE: PRGM1_RGN10_VSS'
     '20331' 'CZE: PRGM1_RGN11'
     '20332' 'CZE: PRGM1_RGN11_MSS'
     '20333' 'CZE: PRGM1_RGN11_VSS'
     '20334' 'CZE: PRGM1_RGN12'
     '20335' 'CZE: PRGM1_RGN12_MSS'
     '20336' 'CZE: PRGM1_RGN12_VSS'
     '20337' 'CZE: PRGM1_RGN13'
     '20338' 'CZE: PRGM1_RGN13_MSS'
     '20339' 'CZE: PRGM1_RGN13_VSS'
     '20340' 'CZE: PRGM1_RGN14'
     '20341' 'CZE: PRGM1_RGN14_MSS'
     '20342' 'CZE: PRGM1_RGN14_VSS'
     '20343' 'CZE: PRGM2_RGN1'
     '20345' 'CZE: PRGM2_RGN2'
     '20346' 'CZE: PRGM2_RGN2_MSS'
     '20347' 'CZE: PRGM2_RGN3'
     '20348' 'CZE: PRGM2_RGN3_MSS'
     '20349' 'CZE: PRGM2_RGN4'
     '20351' 'CZE: PRGM2_RGN5'
     '20352' 'CZE: PRGM2_RGN5_SS'
     '20353' 'CZE: PRGM2_RGN6'
     '20354' 'CZE: PRGM2_RGN6_SS'
     '20355' 'CZE: PRGM2_RGN7'
     '20356' 'CZE: PRGM2_RGN7_MSS'
     '20357' 'CZE: PRGM2_RGN8'
     '20358' 'CZE: PRGM2_RGN8_SS'
     '20359' 'CZE: PRGM2_RGN9'
     '20360' 'CZE: PRGM2_RGN9_MSS'
     '20361' 'CZE: PRGM2_RGN10'
     '20362' 'CZE: PRGM2_RGN10_MSS'
     '20363' 'CZE: PRGM2_RGN11'
     '20364' 'CZE: PRGM2_RGN11_MSS'
     '20365' 'CZE: PRGM2_RGN12'
     '20366' 'CZE: PRGM2_RGN12_SS'
     '20367' 'CZE: PRGM2_RGN13'
     '20368' 'CZE: PRGM2_RGN13_SS'
     '20369' 'CZE: PRGM2_RGN14'
     '20370' 'CZE: PRGM2_RGN14_SS'
     '20371' 'CZE: PRGM3'
     '20372' 'CZE: PRGM4'
     '20373' 'CZE: PRGM5'
     '20374' 'CZE: PRGM6'
     '20375' 'CZE: PRGM3456_MSS'
     '20376' 'CZE: PRGM3456_VSS'
     '27697' 'DEU: Stratum 97'
     '20801' 'DNK: VSS'
     '20802' 'DNK: MSS'
     '20803' 'DNK: LARGE'
     '72401' 'ESP: ANDALUSIA_SCHTYPE1'
     '72402' 'ESP: ANDALUSIA_SCHTYPE2'
     '72403' 'ESP: ARAGON_SCHTYPE1'
     '72404' 'ESP: ARAGON_SCHTYPE2'
     '72405' 'ESP: ASTURIAS_SCHTYPE1'
     '72406' 'ESP: ASTURIAS_SCHTYPE2'
     '72407' 'ESP: BALEARIC_SCHTYPE1'
     '72408' 'ESP: BALEARIC_SCHTYPE2'
     '72409' 'ESP: CANARY_SCHTYPE1'
     '72410' 'ESP: CANARY_SCHTYPE2'
     '72411' 'ESP: CANTABRIA_SCHTYPE1'
     '72412' 'ESP: CANTABRIA_SCHTYPE2'
     '72413' 'ESP: CASTILEyLEON_SCHTYPE1'
     '72414' 'ESP: CASTILEyLEON_SCHTYPE2'
     '72415' 'ESP: LAMANCHA_SCHTYPE1'
     '72416' 'ESP: LAMANCHA_SCHTYPE2'
     '72417' 'ESP: CATALONIA_SCHTYPE1'
     '72418' 'ESP: CATALONIA_SCHTYPE2'
     '72419' 'ESP: EXTRAMADURA_SCHTYPE1'
     '72420' 'ESP: EXTRAMADURA_SCHTYPE2'
     '72421' 'ESP: GALICIA_SCHTYPE1'
     '72422' 'ESP: GALICIA_SCHTYPE2'
     '72423' 'ESP: LARIOJA_SCHTYPE1'
     '72425' 'ESP: MADRID_SCHTYPE1'
     '72426' 'ESP: MADRID_SCHTYPE2'
     '72427' 'ESP: MURCIA_SCHTYPE1'
     '72428' 'ESP: MURCIA_SCHTYPE2'
     '72429' 'ESP: NAVARRA_SCHTYPE1'
     '72430' 'ESP: NAVARRA_SCHTYPE2'
     '72431' 'ESP: BASQUE_SCHTYPE1'
     '72432' 'ESP: BASQUE_SCHTYPE1'
     '72433' 'ESP: BASQUE_SCHTYPE1'
     '72434' 'ESP: BASQUE_SCHTYPE2'
     '72435' 'ESP: BASQUE_SCHTYPE2'
     '72436' 'ESP: BASQUE_SCHTYPE2'
     '72437' 'ESP: VALENCIA_SCHTYPE1'
     '72438' 'ESP: VALENCIA_SCHTYPE2'
     '72439' 'ESP: CEUTAyMELILLA_SCHTYPE1'
     '72440' 'ESP: CEUTAyMELILLA_SCHTYPE2'
     '72441' 'ESP: ANDALUSIA_SS'
     '72442' 'ESP: ARAGON_SS'
     '72443' 'ESP: ASTURIAS_MSS'
     '72444' 'ESP: ASTURIAS_VSS'
     '72445' 'ESP: CANTABRIA_MSS'
     '72446' 'ESP: CANTABRIA_VSS'
     '72447' 'ESP: CASTILEyLEON_MSS'
     '72448' 'ESP: CASTILEyLEON_VSS'
     '72449' 'ESP: CATALONIA_SS'
     '72450' 'ESP: GALICIA_MSS'
     '72451' 'ESP: GALICIA_VSS'
     '72454' 'ESP: NAVARRA_SS'
     '72455' 'ESP: BASQUE_MSS'
     '72456' 'ESP: BASQUE_VSS'
     '72457' 'ESP: OTHER_SS'
     '72458' 'ESP: Certainty stratum'
     '23301' 'EST: Estonian Schools'
     '23302' 'EST: Russian Schools'
     '23303' 'EST: Estonian/Russian Schools'
     '23304' 'EST: Moderately small schools'
     '23305' 'EST: Very small schools'
     '23306' 'EST: Certainty stratum'
     '24601' 'FIN: Uusimaa, rural'
     '24602' 'FIN: Uusimaa, urban'
     '24603' 'FIN: Southern Finland, rural'
     '24604' 'FIN: Southern Finland, urban'
     '24605' 'FIN: Eastern Finland, rural'
     '24606' 'FIN: Eastern Finland, urban'
     '24607' 'FIN: Mid-Finland, rural'
     '24608' 'FIN: Mid-Finland, urban'
     '24609' 'FIN: Northern Finland, rural'
     '24610' 'FIN: Northern Finland, urban'
     '24611' 'FIN: Ahvenanmaa, rural'
     '24612' 'FIN: Ahvenanmaa, urban'
     '25001' 'FRA: Lycées généraux et technologiques'
     '25002' 'FRA: Collèges'
     '25003' 'FRA: Lycées professionnels'
     '25004' 'FRA: Lycées agricoles'
     '25005' 'FRA: Moderately Small schools'
     '25006' 'FRA: Very Small schools'
     '82601' 'GBR: Scotland: SGRADE_LOW'
     '82602' 'GBR: Scotland: SGRADE_LOWMID'
     '82603' 'GBR: Scotland: SGRADE_MID'
     '82604' 'GBR: Scotland: SGRADE_HIGHMID'
     '82605' 'GBR: Scotland: SGRADE_HIGH'
     '82611' 'GBR: NONPRU_ENG'
     '82612' 'GBR: NI'
     '82613' 'GBR: WALES'
     '82615' 'GBR: CERTAINTY'
     '30001' 'GRC: Stratum 01'
     '30002' 'GRC: Stratum 02'
     '30003' 'GRC: Stratum 03'
     '30004' 'GRC: Stratum 04'
     '30005' 'GRC: Stratum 05'
     '30006' 'GRC: Stratum 06'
     '30007' 'GRC: Stratum 07'
     '30008' 'GRC: Stratum 08'
     '30009' 'GRC: Stratum 09'
     '30010' 'GRC: Stratum 10'
     '30011' 'GRC: Stratum 11'
     '30012' 'GRC: Stratum 12'
     '30013' 'GRC: Stratum 13'
     '30014' 'GRC: Stratum 14'
     '30015' 'GRC: Stratum 15'
     '30016' 'GRC: Stratum 16'
     '34401' 'HKG: Government'
     '34402' 'HKG: Aided or Caput'
     '34403' 'HKG: Private'
     '34404' 'HKG: Direct Subsidy Scheme'
     '19197' 'HRV: Stratum 97'
     '34802' 'HUN: VOC'
     '34803' 'HUN: SCNDRY_VOC'
     '34804' 'HUN: GRAMMAR'
     '34805' 'HUN: MSS'
     '34806' 'HUN: VSS'
     '36001' 'IDN: Stratum 01'
     '36002' 'IDN: Stratum 02'
     '36003' 'IDN: Stratum 03'
     '36004' 'IDN: Stratum 04'
     '36005' 'IDN: Stratum 05'
     '36007' 'IDN: Stratum 07'
     '36008' 'IDN: Stratum 08'
     '36009' 'IDN: Stratum 09'
     '36010' 'IDN: Stratum 10'
     '36011' 'IDN: Stratum 11'
     '36012' 'IDN: Stratum 12'
     '36013' 'IDN: Stratum 13'
     '36014' 'IDN: Stratum 14'
     '36015' 'IDN: Stratum 15'
     '36016' 'IDN: Stratum 16'
     '36017' 'IDN: Stratum 17'
     '36018' 'IDN: Stratum 18'
     '36019' 'IDN: Stratum 19'
     '36020' 'IDN: Stratum 20'
     '36022' 'IDN: Stratum 22'
     '36023' 'IDN: Stratum 23'
     '36024' 'IDN: Stratum 24'
     '36026' 'IDN: Stratum 26'
     '36028' 'IDN: Stratum 28'
     '36029' 'IDN: Stratum 29'
     '36030' 'IDN: Stratum 30'
     '36031' 'IDN: Stratum 31'
     '36032' 'IDN: Stratum 32'
     '37201' 'IRL: Enrollment size <=40'
     '37202' 'IRL: Enrollment size between 41 and 80'
     '37203' 'IRL: Enrollment size > 80'
     '35201' 'ISL: Reykjavik'
     '35202' 'ISL: Reykjavik neighbouring munincipalities'
     '35203' 'ISL: Reykjanes peninsula'
     '35204' 'ISL: West'
     '35205' 'ISL: West fjords'
     '35206' 'ISL: North-West'
     '35207' 'ISL: North-East'
     '35208' 'ISL: East'
     '35209' 'ISL: South'
     '37601' 'ISR: Stratum 01'
     '37602' 'ISR: Stratum 02'
     '37603' 'ISR: Stratum 03'
     '37604' 'ISR: Stratum 04'
     '37605' 'ISR: Stratum 05'
     '37606' 'ISR: Stratum 06'
     '37607' 'ISR: Stratum 07'
     '37608' 'ISR: Stratum 08'
     '37609' 'ISR: Stratum 09'
     '38001' 'ITA: Region 08 - Licei - large schools + moderately small '
     '38002' 'ITA: Region 08 - Tecnici - large schools + moderately small '
     '38003' 'ITA: Region 08 - Professionali - large schools + moderately small'
     '38004' 'ITA: Region 08 - Medie - large schools + moderately small '
     '38005' 'ITA: Region 07 - Licei - large schools '
     '38006' 'ITA: Region 07 - Tecnici - large schools '
     '38007' 'ITA: Region 07 - Professionali - large schools '
     '38009' 'ITA: Region 07 - Formazione professionale - large schools '
     '38010' 'ITA: Region 06 - Licei - large schools '
     '38011' 'ITA: Region 06 - Tecnici - large schools '
     '38012' 'ITA: Region 06 - Professionali - large schools '
     '38014' 'ITA: Region 06 - Formazione professionale - census '
     '38015' 'ITA: Region 99 - Licei - large schools '
     '38016' 'ITA: Region 99 - Tecnici - large schools '
     '38017' 'ITA: Region 99 - Professionali - large schools '
     '38019' 'ITA: Region 13 - Licei - large schools '
     '38020' 'ITA: Region 13 - Tecnici - large schools '
     '38021' 'ITA: Region 13 - Professionali - large schools '
     '38023' 'ITA: Region 13 - Formazione professionale - large schools '
     '38024' 'ITA: Region 12 - Licei - large schools '
     '38025' 'ITA: Region 12 - Tecnici - large schools + moderately small '
     '38026' 'ITA: Region 12 - Professionali - large schools + moderately small '
     '38028' 'ITA: Region 12 - Formazione professionale - census '
     '38029' 'ITA: Region 01 - Licei - census '
     '38030' 'ITA: Region 01 - Tecnici - census '
     '38031' 'ITA: Region 01 - Professionali - census '
     '38032' 'ITA: Region 01 - Medie - all schools '
     '38033' 'ITA: Region 01 - Formazione professionale - census '
     '38034' 'ITA: Region 05 - Licei - large schools '
     '38035' 'ITA: Region 05 - Tecnici - large schools '
     '38036' 'ITA: Region 05 - Professionali - large schools '
     '38038' 'ITA: Region 04 - Licei - large schools '
     '38039' 'ITA: Region 04 - Tecnici - large schools '
     '38040' 'ITA: Region 04 - Professionali - large schools '
     '38042' 'ITA: Region 99 - Licei - large schools '
     '38043' 'ITA: Region 99 - Tecnici - large schools '
     '38044' 'ITA: Region 99 - Professionali - large schools '
     '38046' 'ITA: Region 03 - Licei - large schools + moderately small '
     '38047' 'ITA: Region 03 - Tecnici - large schools + moderately small '
     '38048' 'ITA: Region 03 - Professionali - large schools + moderately small'
     '38049' 'ITA: Region 03 - Medie - large schools + moderately small '
     '38050' 'ITA: Region 09 - Licei - large schools+ moderately small '
     '38051' 'ITA: Region 09 - Tecnici - large schools+ moderately small '
     '38052' 'ITA: Region 09 - Professionali - large schools+ moderately small '
     '38053' 'ITA: Region 09 - Medie - moderately small schools '
     '38054' 'ITA: Region 99 - Licei - large schools '
     '38055' 'ITA: Region 99 - Tecnici - large schools '
     '38056' 'ITA: Region 99 - Professionali - large schools '
     '38058' 'ITA: Region 02 - Licei - large schools '
     '38059' 'ITA: Region 02 - Tecnici - large schools '
     '38060' 'ITA: Region 02 - Professionali - large schools '
     '38062' 'ITA: Region 02 - Formazione professionale - census '
     '38063' 'ITA: Region 10 - Licei - large schools '
     '38064' 'ITA: Region 10 - Tecnici - large schools '
     '38065' 'ITA: Region 10 - Professionali - large schools '
     '38067' 'ITA: Region 11 - Licei - large schools '
     '38068' 'ITA: Region 11 - Tecnici - large schools '
     '38069' 'ITA: Region 11 - Professionali - large schools '
     '38070' 'ITA: Region 11 - Medie - large schools '
     '38071' 'ITA: Region 99 - Licei - large schools '
     '38072' 'ITA: Region 99 - Tecnici - large schools '
     '38073' 'ITA: Region 99 - Professionali - large schools '
     '38075' 'ITA: Region 02 - moderately small schools '
     '38076' 'ITA: Region 02 - very small schools '
     '38077' 'ITA: Region 03 - very small schools '
     '38078' 'ITA: Region 04 - moderately small schools '
     '38079' 'ITA: Region 04 - very small schools '
     '38080' 'ITA: Region 05 - moderately small schools '
     '38081' 'ITA: Region 05 - very small schools '
     '38082' 'ITA: Region 06 - moderately small schools '
     '38083' 'ITA: Region 06 - very small schools '
     '38084' 'ITA: Region 07 - moderately small schools '
     '38085' 'ITA: Region 07 - very small schools '
     '38086' 'ITA: Region 08 - very small schools '
     '38087' 'ITA: Region 09 - very small schools '
     '38088' 'ITA: Region 10 - moderately small schools '
     '38089' 'ITA: Region 10 - very small schools '
     '38090' 'ITA: Region 11 - moderately small schools '
     '38091' 'ITA: Region 11 - very small schools '
     '38092' 'ITA: Region 12 - very small schools '
     '38093' 'ITA: Region 13 - moderately small schools '
     '38094' 'ITA: Region 13 - very small schools '
     '38095' 'ITA: Region 99 - moderately small schools '
     '38096' 'ITA: Region 99 - very small schools '
     '38098' 'ITA: Certainty stratum                                        '
     '38099' 'ITA: Region 05 - Sloveni census'
     '40001' 'JOR: Stratum 01'
     '40002' 'JOR: Stratum 02'
     '40003' 'JOR: Stratum 03'
     '40004' 'JOR: Stratum 04'
     '40005' 'JOR: Stratum 05'
     '40006' 'JOR: Stratum 06'
     '39201' 'JPN: Public & Academic Course'
     '39202' 'JPN: Public & Practical Course'
     '39203' 'JPN: Private & Academic Course'
     '39204' 'JPN: Private & Practical Course'
     '41701' 'KGZ: Batken / Rural / Russian'
     '41702' 'KGZ: Batken / Rural / Kyrgyz'
     '41703' 'KGZ: Batken / Rural / Uzbek'
     '41704' 'KGZ: Batken / Town / Russian'
     '41705' 'KGZ: Batken / Town / Kyrgyz'
     '41706' 'KGZ: Batken / Town / Uzbek'
     '41707' 'KGZ: Bishkek / Russian'
     '41708' 'KGZ: Bishkek / Kyrgz'
     '41709' 'KGZ: Chui / Rural / Russian'
     '41710' 'KGZ: Chui Rural / Kyrgz'
     '41711' 'KGZ: Chui / Town / Russian'
     '41712' 'KGZ: Chui / Town / Kyrgz'
     '41714' 'KGZ: Issykkul / Rural / Russian'
     '41715' 'KGZ: Issykkul / Rural / Kyrgz'
     '41716' 'KGZ: Issykkul / Town / Russian'
     '41717' 'KGZ: Issykkul / Town / Kyrgz'
     '41718' 'KGZ: Jalalabat / Rural / Russian'
     '41719' 'KGZ: Jalalabat / Rural / Kyrgz'
     '41720' 'KGZ: Jalalabat / Rural / Uzbek'
     '41721' 'KGZ: Jalalabat / Town / Russian'
     '41722' 'KGZ: Jalalabat / Town / Kyrgz'
     '41723' 'KGZ: Jalalabat / Town / Uzbek'
     '41724' 'KGZ: Naryn / Rural / Russian'
     '41725' 'KGZ: Naryn / Rural / Kyrgz'
     '41726' 'KGZ: Naryn / Town / Russian'
     '41727' 'KGZ: Naryn / Town / Kyrgz'
     '41728' 'KGZ: Osh / Rural / Russian'
     '41729' 'KGZ: Osh / Rural / Kyrgz'
     '41730' 'KGZ: Osh / Rural / Uzbek'
     '41731' 'KGZ: Osh / Town / Russian'
     '41732' 'KGZ: Osh / Town / Kyrgz'
     '41733' 'KGZ: Osh / Town / Uzbek'
     '41734' 'KGZ: Osh City / Rural / Kyrgz'
     '41735' 'KGZ: Osh City / Town / Russian'
     '41736' 'KGZ: Osh City / Town / Kyrgz'
     '41737' 'KGZ: Osh City / Town / Uzbek'
     '41738' 'KGZ: Talas / Rural / Russian'
     '41739' 'KGZ: Talas / Rural / Kyrgyz'
     '41740' 'KGZ: Talas / Town / Russian'
     '41741' 'KGZ: Talas / Town / Kyrgyz'
     '41742' 'KGZ: Moderately Small Schools'
     '41743' 'KGZ: Very Small Schools'
     '41744' 'KGZ: Certainty School Stratum'
     '41001' 'KOR: Stratum 01'
     '41002' 'KOR: Stratum 02'
     '41003' 'KOR: Stratum 03'
     '41004' 'KOR: Stratum 04'
     '41005' 'KOR: Stratum 05'
     '43875' 'LIE: Stratum 75'
     '44001' 'LTU: Stratum 01'
     '44002' 'LTU: Stratum 02'
     '44003' 'LTU: Stratum 03'
     '44004' 'LTU: Stratum 04'
     '44005' 'LTU: Stratum 05'
     '44006' 'LTU: Stratum 06'
     '44297' 'LUX: Stratum 97'
     '42801' 'LVA: Stratum 01'
     '42802' 'LVA: Stratum 02'
     '42803' 'LVA: Stratum 03'
     '42804' 'LVA: Stratum 04'
     '44601' 'MAC: Gov, Grammar-International, Chinese and Portuguese'
     '44602' 'MAC: Gov, Technical-Prevocational, Chinese'
     '44603' 'MAC: Private-In-Net, Grammar-International, Chinese'
     '44604' 'MAC: Private-In-Net, Grammar-International, English'
     '44605' 'MAC: Private-In-Net, Grammar-International, English and Chinese'
     '44606' 'MAC: Private-In-Net, Technical-Prevocational, Chinese'
     '44607' 'MAC: Private-not-in-Net, Grammar-International, Chinese'
     '44608' 'MAC: Private-not-in-Net, Grammar-International, English'
     '44609' 'MAC: Private-not-in-Net, Grammar-International, Portuguese'
     '44610' 'MAC: Private-not-in-Net, Grammar-International, Chinese and English'
     '48401' 'MEX: AGUASCALIENTES, Lower Secondary'
     '48402' 'MEX: AGUASCALIENTES, Upper Secondary'
     '48403' 'MEX: BAJA CALIFORNIA, Lower Secondary'
     '48404' 'MEX: BAJA CALIFORNIA, Upper Secondary'
     '48405' 'MEX: BAJA CALIFORNIA SUR, Lower Secondary'
     '48406' 'MEX: BAJA CALIFORNIA SUR, Upper Secondary'
     '48407' 'MEX: CAMPECHE, Lower Secondary'
     '48408' 'MEX: CAMPECHE, Upper Secondary'
     '48409' 'MEX: CHIAPAS, Lower Secondary'
     '48410' 'MEX: CHIAPAS, Upper Secondary'
     '48411' 'MEX: CHIHUAHUA, Lower Secondary'
     '48412' 'MEX: CHIHUAHUA, Upper Secondary'
     '48413' 'MEX: COAHUILA, Lower Secondary'
     '48414' 'MEX: COAHUILA, Upper Secondary'
     '48415' 'MEX: COLIMA, Lower Secondary'
     '48416' 'MEX: COLIMA, Upper Secondary'
     '48417' 'MEX: DISTRITO FEDERAL, Lower Secondary'
     '48418' 'MEX: DISTRITO FEDERAL, Upper Secondary'
     '48419' 'MEX: DURANGO, Lower Secondary'
     '48420' 'MEX: DURANGO, Upper Secondary'
     '48421' 'MEX: GUANAJUATO, Lower Secondary'
     '48422' 'MEX: GUANAJUATO, Upper Secondary'
     '48423' 'MEX: GUERRERO, Lower Secondary'
     '48424' 'MEX: GUERRERO, Upper Secondary'
     '48425' 'MEX: HIDALGO, Lower Secondary'
     '48426' 'MEX: HIDALGO, Upper Secondary'
     '48427' 'MEX: JALISCO, Lower Secondary'
     '48428' 'MEX: JALISCO, Upper Secondary'
     '48429' 'MEX: MEXICO, Lower Secondary'
     '48430' 'MEX: MEXICO, Upper Secondary'
     '48431' 'MEX: MICHOACAN, Lower Secondary'
     '48432' 'MEX: MICHOACAN, Upper Secondary'
     '48434' 'MEX: MORELOS, Upper Secondary'
     '48435' 'MEX: NAYARIT, Lower Secondary'
     '48436' 'MEX: NAYARIT, Upper Secondary'
     '48437' 'MEX: NUEVO LEON, Lower Secondary'
     '48438' 'MEX: NUEVO LEON, Upper Secondary'
     '48439' 'MEX: OAXACA, Lower Secondary'
     '48440' 'MEX: OAXACA, Upper Secondary'
     '48441' 'MEX: PUEBLA, Lower Secondary'
     '48442' 'MEX: PUEBLA, Upper Secondary'
     '48443' 'MEX: QUERETARO, Lower Secondary'
     '48444' 'MEX: QUERETARO, Upper Secondary'
     '48445' 'MEX: QUINTANA ROO, Lower Secondary'
     '48446' 'MEX: QUINTANA ROO, Upper Secondary'
     '48447' 'MEX: SAN LUIS POTOSI, Lower Secondary'
     '48448' 'MEX: SAN LUIS POTOSI, Upper Secondary'
     '48449' 'MEX: SINALOA, Lower Secondary'
     '48450' 'MEX: SINALOA, Upper Secondary'
     '48451' 'MEX: SONORA, Lower Secondary'
     '48452' 'MEX: SONORA, Upper Secondary'
     '48453' 'MEX: TABASCO, Lower Secondary'
     '48454' 'MEX: TABASCO, Upper Secondary'
     '48455' 'MEX: TAMAULIPAS, Lower Secondary'
     '48456' 'MEX: TAMAULIPAS, Upper Secondary'
     '48457' 'MEX: TLAXCALA, Lower Secondary'
     '48458' 'MEX: TLAXCALA, Upper Secondary'
     '48459' 'MEX: VERACRUZ, Lower Secondary'
     '48460' 'MEX: VERACRUZ, Upper Secondary'
     '48461' 'MEX: YUCATAN, Lower Secondary'
     '48462' 'MEX: YUCATAN, Upper Secondary'
     '48463' 'MEX: ZACATECAS, Lower Secondary'
     '48464' 'MEX: ZACATECAS, Upper Secondary'
     '48465' 'MEX: Moderately small schools'
     '48466' 'MEX: Very small schools'
     '48467' 'MEX: Certatinty schools'
     '49901' 'MNE: Stratum 01'
     '49902' 'MNE: Stratum 02'
     '49903' 'MNE: Stratum 03'
     '49904' 'MNE: Stratum 04'
     '52801' 'NLD: Track A'
     '52802' 'NLD: Track B'
     '57801' 'NOR: Stratum 01'
     '57802' 'NOR: Stratum 02'
     '57803' 'NOR: Stratum 03'
     '57804' 'NOR: Stratum 04'
     '55497' 'NZL: Stratum 97'
     '61601' 'POL: PUBLIC'
     '61602' 'POL: PRV'
     '61603' 'POL: PRV_MSS'
     '61604' 'POL: PRV_VSS'
     '61605' 'POL: LYCEA'
     '62097' 'PRT: Stratum 97'
     '63401' 'QAT: Stratum 01'
     '63402' 'QAT: Stratum 02'
     '63403' 'QAT: Stratum 03'
     '63404' 'QAT: Stratum 04'
     '63405' 'QAT: Stratum 05'
     '63406' 'QAT: Stratum 06'
     '63407' 'QAT: Stratum 07'
     '63408' 'QAT: Stratum 08'
     '63409' 'QAT: Stratum 09'
     '63410' 'QAT: Stratum 10'
     '63411' 'QAT: Stratum 11'
     '63412' 'QAT: Stratum 12'
     '63413' 'QAT: Stratum 13'
     '63414' 'QAT: Stratum 14'
     '63415' 'QAT: Stratum 15'
     '63417' 'QAT: Stratum 17'
     '63418' 'QAT: Stratum 18'
     '63419' 'QAT: Stratum 19'
     '63420' 'QAT: Stratum 20'
     '63421' 'QAT: Stratum 21'
     '63422' 'QAT: Stratum 22'
     '63423' 'QAT: Stratum 23'
     '63424' 'QAT: Stratum 24'
     '63425' 'QAT: Stratum 25'
     '63426' 'QAT: Stratum 26'
     '64201' 'ROU: Gimnaziu'
     '64202' 'ROU: Liceu - Ciclul inferior'
     '64203' 'ROU: Scoala de Arte si Meserii'
     '64204' 'ROU: Moderately Small Schools'
     '64205' 'ROU: Very Small Schools'
     '64301' 'RUS: Stratum 01'
     '64302' 'RUS: Stratum 02'
     '64303' 'RUS: Stratum 03'
     '64304' 'RUS: Stratum 04'
     '64305' 'RUS: Stratum 05'
     '64306' 'RUS: Stratum 06'
     '64307' 'RUS: Stratum 07'
     '64308' 'RUS: Stratum 08'
     '64309' 'RUS: Stratum 09'
     '64310' 'RUS: Stratum 10'
     '64311' 'RUS: Stratum 11'
     '64312' 'RUS: Stratum 12'
     '64313' 'RUS: Stratum 13'
     '64314' 'RUS: Stratum 14'
     '64315' 'RUS: Stratum 15'
     '64316' 'RUS: Stratum 16'
     '64317' 'RUS: Stratum 17'
     '64318' 'RUS: Stratum 18'
     '64319' 'RUS: Stratum 19'
     '64320' 'RUS: Stratum 20'
     '64321' 'RUS: Stratum 21'
     '64322' 'RUS: Stratum 22'
     '64323' 'RUS: Stratum 23'
     '64324' 'RUS: Stratum 24'
     '64325' 'RUS: Stratum 25'
     '64326' 'RUS: Stratum 26'
     '64327' 'RUS: Stratum 27'
     '64328' 'RUS: Stratum 28'
     '64329' 'RUS: Stratum 29'
     '64330' 'RUS: Stratum 30'
     '64331' 'RUS: Stratum 31'
     '64332' 'RUS: Stratum 32'
     '64333' 'RUS: Stratum 33'
     '64334' 'RUS: Stratum 34'
     '64335' 'RUS: Stratum 35'
     '64336' 'RUS: Stratum 36'
     '64337' 'RUS: Stratum 37'
     '64338' 'RUS: Stratum 38'
     '64339' 'RUS: Stratum 39'
     '64340' 'RUS: Stratum 40'
     '64341' 'RUS: Stratum 41'
     '64342' 'RUS: Stratum 42'
     '64343' 'RUS: Stratum 43'
     '64344' 'RUS: Stratum 44'
     '64345' 'RUS: Stratum 45'
     '68801' 'SRB: Region 1'
     '68802' 'SRB: Region 2'
     '68803' 'SRB: Region 3'
     '68804' 'SRB: Region 4'
     '68805' 'SRB: Region 5'
     '68806' 'SRB: Region 6'
     '68807' 'SRB: Region 7'
     '68808' 'SRB: Region 8'
     '68809' 'SRB: Very small schools'
     '68810' 'SRB: Certainty stratum'
     '70301' 'SVK: Bratislavsky - basic and vocational schools'
     '70302' 'SVK: Bratislavsky - secondary, high, secondary + high schools'
     '70303' 'SVK: Bratislavsky - secondary, technical, sec. + techn. colleges'
     '70304' 'SVK: trnavsky - basic and vocational schools'
     '70305' 'SVK: trnavsky - secondary, high, secondary + high schools'
     '70306' 'SVK: trnavsky - secondary, technical, sec. + techn. colleges'
     '70307' 'SVK: trenciansky - basic and vocational schools'
     '70308' 'SVK: trenciansky - secondary, high, secondary + high schools'
     '70309' 'SVK: trenciansky - secondary, technical, sec. + techn. colleges'
     '70310' 'SVK: nitriansky - basic and vocational schools'
     '70311' 'SVK: nitriansky - secondary, high, secondary + high schools'
     '70312' 'SVK: nitriansky - secondary, technical, sec. + techn. colleges'
     '70313' 'SVK: zilinsky - basic and vocational schools'
     '70314' 'SVK: zilinsky - secondary, high, secondary + high schools'
     '70315' 'SVK: zilinsky - secondary, technical, sec. + techn. colleges'
     '70316' 'SVK: banskobytricky - basic and vocational schools'
     '70317' 'SVK: banskobytricky - secondary, high, secondary + high schools'
     '70318' 'SVK: banskobytricky - secondary, technical, sec. + techn. colleges'
     '70319' 'SVK: presovsky - - basic and vocational schools'
     '70320' 'SVK: presovsky - secondary, high, secondary + high schools'
     '70321' 'SVK: presovsky - secondary, technical, sec. + techn. colleges'
     '70322' 'SVK: kosicky - basic and vocational schools'
     '70323' 'SVK: kosicky - secondary, high, secondary + high schools'
     '70324' 'SVK: kosicky - secondary, technical, sec. + techn. colleges'
     '70325' 'SVK: Moderately small schools'
     '70326' 'SVK: Very small schools'
     '70501' 'SVN: Stratum 01'
     '70502' 'SVN: Stratum 02'
     '70503' 'SVN: Stratum 03'
     '70504' 'SVN: Stratum 04'
     '70505' 'SVN: Stratum 05'
     '70506' 'SVN: Stratum 06'
     '70508' 'SVN: Stratum 08'
     '70509' 'SVN: Stratum 09'
     '75201' 'SWE: Stratum 01'
     '75202' 'SWE: Stratum 02'
     '75203' 'SWE: Stratum 03'
     '75204' 'SWE: Stratum 04'
     '75205' 'SWE: Stratum 05'
     '75206' 'SWE: Stratum 06'
     '75207' 'SWE: Stratum 07'
     '75208' 'SWE: Stratum 08'
     '75209' 'SWE: Stratum 09'
     '75210' 'SWE: Stratum 10'
     '15801' 'TAP: Centre'
     '15802' 'TAP: East & Little Island'
     '15803' 'TAP: Kaohsiung City'
     '15804' 'TAP: North'
     '15805' 'TAP: South'
     '15806' 'TAP: Taipei City'
     '15807' 'TAP: Certainty School Stratum'
     '15808' 'TAP: Cont. Supp. High schools'
     '15809' 'TAP: 5-Year colleges'
     '15810' 'TAP: Junior parts of comprehensive high schools'
     '15811' 'TAP: Junior High schools'
     '15812' 'TAP: Practical and technical schools'
     '15814' 'TAP: Practical and technical / Working and Learning schools'
     '15815' 'TAP: Moderately small schools'
     '15816' 'TAP: Very small schools'
     '15817' 'TAP: Certainty stratum'
     '76401' 'THA: Stratum 01'
     '76402' 'THA: Stratum 02'
     '76403' 'THA: Stratum 03'
     '76404' 'THA: Stratum 04'
     '76405' 'THA: Stratum 05'
     '76406' 'THA: Stratum 06'
     '76407' 'THA: Stratum 07'
     '76408' 'THA: Stratum 08'
     '76409' 'THA: Stratum 09'
     '76410' 'THA: Stratum 10'
     '76411' 'THA: Stratum 11'
     '76412' 'THA: Stratum 12'
     '78801' 'TUN: PUB_EAST_LEVEL0_GEN'
     '78802' 'TUN: PUB_EAST_LEVEL1_GEN'
     '78803' 'TUN: PUB_EAST_LEVEL2_GEN'
     '78804' 'TUN: PUB_WEST_LEVEL0_GEN'
     '78805' 'TUN: PUB_WEST_LEVEL1_GEN'
     '78806' 'TUN: PUB_WEST_LEVEL2_GEN'
     '78807' 'TUN: PRIVATE'
     '78808' 'TUN: VOCATIONAL'
     '78809' 'TUN: VSS'
     '78810' 'TUN: CERTAINTY'
     '79201' 'TUR: Stratum 01'
     '79202' 'TUR: Stratum 02'
     '79203' 'TUR: Stratum 03'
     '79204' 'TUR: Stratum 04'
     '79205' 'TUR: Stratum 05'
     '79206' 'TUR: Stratum 06'
     '79207' 'TUR: Stratum 07'
     '79208' 'TUR: Stratum 08'
     '79209' 'TUR: Stratum 09'
     '85801' 'URY: Stratum 01'
     '85802' 'URY: Stratum 02'
     '85803' 'URY: Stratum 03'
     '85804' 'URY: Stratum 04'
     '85805' 'URY: Stratum 05'
     '85807' 'URY: Stratum 07'
     '85810' 'URY: Stratum 10'
     '85811' 'URY: Stratum 11'
     '85812' 'URY: Stratum 12'
     '85813' 'URY: Stratum 13'
     '85814' 'URY: Stratum 14'
     '85815' 'URY: Stratum 15'
     '85816' 'URY: Stratum 16'
     '85817' 'URY: Stratum 17'
     '85818' 'URY: Stratum 18'
     '85819' 'URY: Stratum 19'
     '84097' 'USA: Stratum 97'
.


VALUE LABELS
   SC02Q01  
      1    "Public"
   	  2    "Private"
   	  7    "N/A"
   	  8    "Invalid"
   	  9    "Missing"
  /SC04Q01 SC04Q02 SC04Q03 SC04Q04 SC04Q05 SC04Q06 SC04Q07            
      1    "Yes"
   	  2    "No"
   	  7    "N/A"
   	  8    "Invalid"
   	  9    "Missing"
  /SC04Q08 SC04Q09 SC04Q10 SC04Q11 SC04Q12 SC04Q13 SC04Q14         
   	  1    'Yes'
   	  2    'No'
   	  7    'N/A'
   	  8    'Invalid'
   	  9    'Missing'
  /SC06Q01	
      01	 '15 students or fewer'
   	  02	 '16-20 students'
   	  03	 '21-25 students'
   	  04	 '26-30 students'
   	  05	 '31-35 students'
   	  06	 '36-40 students'
   	  07	 '41-45 students'
   	  08	 '46-50 students'
   	  09	 'More than 50 students'
   	  97	 'N/A'
   	  98	 'Invalid'
   	  99	 'Missing'
  /SC07Q01	
      1    'Village'
   	  2    'Small town'
   	  3    'Town'
   	  4    'City'
   	  5    'Large city'
   	  7    'N/A'
   	  8    'Invalid'
   	  9    'Missing'
  /SC08Q01 SC08Q02	
      1    'For all subjects'
   	  2    'For some subjects'
   	  3    'Not for any subject'
   	  7    'N/A'
   	  8    'Invalid'
   	  9    'Missing'
  /SC10Q01	
      1    'No vacancies'
   	  2    'All positions filled'
   	  3    'Not all filled'
   	  7    'N/A'
   	  8    'Invalid'
   	  9    'Missing'
  /SC11Qa1 SC11Qa2 SC11Qa3 SC11Qa4  SC11Qb1 SC11Qb2 SC11Qb3 SC11Qb4
   SC11Qc1 SC11Qc2 SC11Qc3 SC11Qc4  SC11Qd1 SC11Qd2 SC11Qd3 SC11Qd4
   SC11Qe1 SC11Qe2 SC11Qe3 SC11Qe4  SC11Qf1 SC11Qf2 SC11Qf3 SC11Qf4
   SC11Qg1 SC11Qg2 SC11Qg3 SC11Qg4  SC11Qh1 SC11Qh2 SC11Qh3 SC11Qh4
   SC11Qi1 SC11Qi2 SC11Qi3 SC11Qi4  SC11Qj1 SC11Qj2 SC11Qj3 SC11Qj4
   SC11Qk1 SC11Qk2 SC11Qk3 SC11Qk4  SC11Ql1 SC11Ql2 SC11Ql3 SC11Ql4
   	  1    'Tick'
   	  2    'No tick'
   	  7    'N/A'
   	  8    'Invalid'
   	  9    'Missing'
  /SC12Qa1 SC12Qa2 SC12Qa3 SC12Qa4  SC12Qb1 SC12Qb2 SC12Qb3 SC12Qb4
   SC12Qc1 SC12Qc2 SC12Qc3 SC12Qc4  SC12Qd1 SC12Qd2 SC12Qd3 SC12Qd4
   SC12Qe1 SC12Qe2 SC12Qe3 SC12Qe4  SC12Qf1 SC12Qf2 SC12Qf3 SC12Qf4
      1    'Tick'
   	  2    'No tick'
   	  7    'N/A'
   	  8    'Invalid'
   	  9    'Missing'
  /SC14Q01 SC14Q02 SC14Q03 SC14Q04 SC14Q05 SC14Q06 SC14Q07 
   SC14Q08 SC14Q09 SC14Q10 SC14Q11 SC14Q12 SC14Q13
      1    'Not at all'
   	  2    'Very little'
   	  3    'To some extent'
   	  4    'A lot'
   	  7    'N/A'
   	  8    'Invalid'
   	  9    'Missing'
  /SC15Q01 SC15Q02 SC15Q03 
      1    'Yes'
   	  2    'No'
   	  7    'N/A'
   	  8    'Invalid'
   	  9    'Missing'
  /SC16Q01	
      1    'Many parents'
   	  2    'Minority of parents'
   	  3    'Largely absent'
   	  7    'N/A'
   	  8    'Invalid'
   	  9    'Missing'
  /SC17Q01 SC17Q02 SC17Q03 SC17Q04 SC17Q05
      1	   'Yes'
   	  2	   'No'
   	  7	   'N/A'
   	  8	   'Invalid'
   	  9	   'Missing'
  /SC18Q01	
      1    'Two or more schools'
   	  2    'One other school'
   	  3    'No other schools'
   	  7    'N/A'
   	  8    'Invalid'
   	  9    'Missing'
  /SC19Q01 SC19Q02 SC19Q03 SC19Q04 SC19Q05 SC19Q06  
      1    'Prerequisite'
      2    'High priority'
      3    'Considered'
      4    'Not considered'
      7    'N/A'
      8    'Invalid'
      9    'Missing'
  /SC20Q01 SC20Q02 SC20Q03 SC20Q04 SC20Q05  
      1    'Yes'
      2    'No'
      7    'N/A'
      8    'Invalid'
      9    'Miss'
  /SC21Q01 SC21Q02 SC21Q03 SC21Q04  	 
      1    'Yes'
      2    'No'
      7    'N/A'
      8    'Invalid'
      9    'Missing'
  /SC22Q01 SC22Q02 SC22Q03 SC22Q04 SC22Q05 
      1    'Yes'
      2    'No'
      7    'N/A'
      8    'Invalid'
      9    'Missing'
  /SC23Q01 SC23Q02 SC23Q03
   	  1    'Never'
   	  2    'Once a year'
   	  3    'More than once a year'
   	  7    'N/A'
   	  8    'Invalid'
   	  9    'Missing'
  /SC24Q01	
      1    'Not offered'
   	  2    'Half or less'
   	  3    'More than half'
   	  7    'N/A'
   	  8    'Invalid' 
   	  9    'Missing'
  /SC25Q01	
      1    'No influence'
   	  2    'Minor influence'
   	  3    'Considerable influence'
   	  7    'N/A'
   	  8    'Invalid'
   	  9    'Missing'
  /SC26Q01	
      1    'Incidental'
   	  2    'Integrated'
   	  3    'Focal'
   	  7    'N/A'
   	  8    'Invalid'
   	  9    'Missing'
  /SC27Q01	
      1    'Incidental'
   	  2    'Integrated'
   	  3    'Focal'
   	  7    'N/A'
   	  8    'Invalid'
   	  9    'Missing'
  /SC28Q01	
      1    'Not applicable'
      2    'All teachers'
      3    'Specific teachers'
      4    'Counsel employed'
      5    'Counsel visits'
      7    'N/A'
      8    'Invalid'
      9    'Missing'
  /SC29Q01	
      1    'Voluntary'
      2    'Compulsory'
      7    'N/A'
      8    'Invalid'
      9    'Missing'
  /SCHLTYPE	
      1    'Private independent'
      2    'Private government-dependent'
      3    'Public'
      7    'N/A'
      8    'Invalid'
      9    'Missing'
  /ABGROUP	
      1    'Not for any subjects'
      2    'For some subjects'
      3    'For all subjects'
      7    'N/A'
      9    'Missing'
  /SELSCH
      1    'Not considered'
      2    'At least one considered'
      3    'At least one high priority'
      4    'At least one prerequisite'
      7    'N/A'
      9    'Missing'
  /CLSIZE	
      97   'N/A'
      99   'Miss'
  /SC01Q01 SC01Q02 SC09Q11 SC09Q12 SC09Q21 SC09Q22 SC09Q31 SC09Q32 SC13Q01 
   SC13Q02 SC13Q03 SC03Q01 SC03Q02 SC03Q03 SC03Q04 PCGIRLS RATCOMP IRATCOMP COMPWEB 
   STRATIO PROPCERT PROPQUAL 
      9997 'N/A'
      9998 'Invalid'
      9999 'Missing'
  /RESPRES RESPCURR TCSHORT SCMATEDU SCIPROM ENVLEARN 
      997  'N/A'
      999  'Miss'
  /SC05Q01 SC05Q02 
      996  'N/A'
     9997  'N/A'
     9998  'Invalid'
     9999  'Missing'
  /SCHSIZE 
     99997 'N/A'
     99998 'Invalid'
     99999 'Missing'.
.


MISSING VALUES
  SC02Q01 SC04Q01 SC04Q02 SC04Q03 SC04Q04 SC04Q05 SC04Q06 SC04Q07 SC04Q08 SC04Q09 SC04Q10 SC04Q11 SC04Q12 
  SC04Q13 SC04Q14 SC07Q01 SC08Q01 SC08Q02 SC10Q01 SC14Q01 SC14Q02 SC14Q03 SC14Q04 SC14Q05 SC14Q06 SC14Q07 
  SC14Q08 SC14Q09 SC14Q10 SC14Q11 SC14Q12 SC14Q13 SC15Q01 SC15Q02 SC15Q03 SC16Q01 SC17Q01 SC17Q02 SC17Q03 
  SC17Q04 SC17Q05 SC18Q01 SC19Q01 SC19Q02 SC19Q03 SC19Q04 SC19Q05 SC19Q06 SC20Q01 SC20Q02 SC20Q03 SC20Q04 
  SC20Q05 SC21Q01 SC21Q02 SC21Q03 SC21Q04 SC22Q01 SC22Q02 SC22Q03 SC22Q04 SC22Q05 SC23Q01 SC23Q02 SC23Q03 
  SC24Q01 SC25Q01 SC26Q01 SC27Q01 SC28Q01 SC29Q01 (7,8,9).
MISSING VALUES
  SC11Qa1 SC11Qa2 SC11Qa3 SC11Qa4 SC11Qb1 SC11Qb2 SC11Qb3 SC11Qb4 SC11Qc1 SC11Qc2 SC11Qc3 SC11Qc4
  SC11Qd1 SC11Qd2 SC11Qd3 SC11Qd4 SC11Qe1 SC11Qe2 SC11Qe3 SC11Qe4 SC11Qf1 SC11Qf2 SC11Qf3 SC11Qf4
  SC11Qg1 SC11Qg2 SC11Qg3 SC11Qg4 SC11Qh1 SC11Qh2 SC11Qh3 SC11Qh4 SC11Qi1 SC11Qi2 SC11Qi3 SC11Qi4
  SC11Qj1 SC11Qj2 SC11Qj3 SC11Qj4 SC11Qk1 SC11Qk2 SC11Qk3 SC11Qk4 SC11Ql1 SC11Ql2 SC11Ql3 SC11Ql4
  SC12Qa1 SC12Qa2 SC12Qa3 SC12Qa4 SC12Qb1 SC12Qb2 SC12Qb3 SC12Qb4 SC12Qc1 SC12Qc2 SC12Qc3 SC12Qc4
  SC12Qd1 SC12Qd2 SC12Qd3 SC12Qd4 SC12Qe1 SC12Qe2 SC12Qe3 SC12Qe4 SC12Qf1 SC12Qf2 SC12Qf3 SC12Qf4  (7,8,9).
MISSING VALUES ABGROUP SELSCH (7, 9).
MISSING VALUES SCHLTYPE (7, 9).
MISSING VALUES SC06Q01 (97, 98, 99).
MISSING VALUES CLSIZE (97, 99).
MISSING VALUES RESPRES RESPCURR TCSHORT SCMATEDU SCIPROM ENVLEARN (997, 999).
MISSING VALUES
 SC01Q01 SC01Q02 SC09Q11 SC09Q12 SC09Q21 SC09Q22 SC09Q31 SC09Q32 SC13Q01 
 SC13Q02 SC13Q03 SC03Q01 SC03Q02 SC03Q03 SC03Q04 PCGIRLS RATCOMP IRATCOMP COMPWEB 
 STRATIO PROPCERT PROPQUAL (9997, 9998, 9999).
MISSING VALUES SC05Q01 SC05Q02 (9997 thru 9999, 996).
MISSING VALUES SCHSIZE (99997, 99998, 99999).


SAVE OUTFILE='C:\****\INT_Sch06_Dec07.sav'.
