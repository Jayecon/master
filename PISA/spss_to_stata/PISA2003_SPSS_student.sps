* This program reads the txt file data and applies variable and value labels, format and missing values specifications.
* Write the location of the ASCII file at the beginning of the control file.
* Write the location of the SPSS data file at the end of the control file.

SET decimal=dot.

DATA LIST file="e:\works\pisa\pisa2003\INT_stui_2003_v2.txt"
 /COUNTRY     1    - 3	 (a)  
  CNT         4    -   6       (a) 
  SUBNATIO    7    -   10      (a) 
  SCHOOLID    11   -   15      (a)  
  STIDSTD     16   -   20      (a)  
  ST01Q01     22   -   23           
  ST02Q02     24   -   25           
  ST02Q03     26   -   27           
  ST03Q01     28   -   28           
  ST04Q01     29   -   29           
  ST04Q02     30   -   30           
  ST04Q03     31   -   31           
  ST04Q04     32   -   32           
  ST04Q05     33   -   33           
  ST05Q01     34   -   34           
  ST06Q01     35   -   35           
  ST07Q01     36   -   39      (a)  
  ST09Q01     40   -   43      (a)  
  ST11R01     44   -   44		     
  ST12Q01     45   -   45		     
  ST12Q02     46   -   46		     
  ST12Q03     47   -   47		     
  ST13R01     48   -   48		     
  ST14Q01     49   -   49		     
  ST14Q02     50   -   50		     
  ST14Q03     51   -   51		     
  ST15Q01     52   -   53		     
  ST15Q02     54   -   55		     
  ST15Q03     56   -   57		     
  ST15Q04     58   -   65		     
  ST16Q01     66   -   67		     
  ST17Q01     68   -   68		     
  ST17Q02     69   -   69		     
  ST17Q03     70   -   70		     
  ST17Q04     71   -   71		     
  ST17Q05     72   -   72		     
  ST17Q06     73   -   73		     
  ST17Q07     74   -   74		     
  ST17Q08     75   -   75		     
  ST17Q09     76   -   76		     
  ST17Q10     77   -   77		     
  ST17Q11     78   -   78		     
  ST17Q12     79   -   79		     
  ST17Q13     80   -   80		     
  ST17Q14     81   -   85     (a)  
  ST17Q15     86   -   90     (a)  
  ST17Q16     91   -   95     (a)  
  ST19Q01     96   -   96		     
  ST20Q01     97   -   97		     
  ST21Q01     98   -   102		     
  ST22Q01     103  -   103		     
  ST22Q02     104  -   104		     
  ST22Q03     105  -   105		     
  ST23Q01     106  -   106		     
  ST23Q02     107  -   107		     
  ST23Q03     108  -   108		     
  ST23Q04     109  -   109		     
  ST23Q05     110  -   110		     
  ST23Q06     111  -   111		     
  ST24Q01     112  -   112		     
  ST24Q02     113  -   113		     
  ST24Q03     114  -   114		     
  ST24Q04     115  -   115		     
  ST25Q01     116  -   116		     
  ST25Q02     117  -   117		     
  ST25Q03     118  -   118		     
  ST25Q04     119  -   119		     
  ST25Q05     120  -   120		     
  ST25Q06     121  -   121		     
  ST26Q01     122  -   122		     
  ST26Q02     123  -   123		     
  ST26Q03     124  -   124		     
  ST26Q04     125  -   125		     
  ST26Q05     126  -   126		     
  ST27Q01     127  -   127		     
  ST27Q02     128  -   128		     
  ST27Q03     129  -   129		     
  ST27Q04     130  -   130		     
  ST27Q05     131  -   131		     
  ST27Q06     132  -   132		     
  ST28Q01     133  -   133		     
  ST29Q01     134  -   141		     
  ST29Q02     142  -   149		     
  ST29Q03     150  -   157		     
  ST29Q04     158  -   165		     
  ST29Q05     166  -   173		     
  ST29Q06     174  -   181		     
  ST30Q01     182  -   182		     
  ST30Q02     183  -   183		     
  ST30Q03     184  -   184		     
  ST30Q04     185  -   185		     
  ST30Q05     186  -   186		     
  ST30Q06     187  -   187		     
  ST30Q07     188  -   188		     
  ST30Q08     189  -   189		     
  ST31Q01     190  -   190		     
  ST31Q02     191  -   191		     
  ST31Q03     192  -   192		     
  ST31Q04     193  -   193		     
  ST31Q05     194  -   194		     
  ST31Q06     195  -   195		     
  ST31Q07     196  -   196		     
  ST31Q08     197  -   197		     
  ST32Q01     198  -   198		     
  ST32Q02     199  -   199		     
  ST32Q03     200  -   200		     
  ST32Q04     201  -   201		     
  ST32Q05     202  -   202		     
  ST32Q06     203  -   203		     
  ST32Q07     204  -   204		     
  ST32Q08     205  -   205		     
  ST32Q09     206  -   206		     
  ST32Q10     207  -   207		     
  ST33Q01     208  -   215		     
  ST33Q02     216  -   223		     
  ST33Q03     224  -   231		     
  ST33Q04     232  -   239		     
  ST33Q05     240  -   247		     
  ST33Q06     248  -   255		     
  ST34Q01     256  -   256		     
  ST34Q02     257  -   257		     
  ST34Q03     258  -   258		     
  ST34Q04     259  -   259		     
  ST34Q05     260  -   260		     
  ST34Q06     261  -   261		     
  ST34Q07     262  -   262		     
  ST34Q08     263  -   263		     
  ST34Q09     264  -   264		     
  ST34Q10     265  -   265		     
  ST34Q11     266  -   266		     
  ST34Q12     267  -   267		     
  ST34Q13     268  -   268		     
  ST34Q14     269  -   269		     
  ST35Q02     270  -   277		     
  ST35Q03     278  -   285		     
  ST36Q01     286  -   293		     
  ST37Q01     294  -   294		     
  ST37Q02     295  -   295		     
  ST37Q03     296  -   296		     
  ST37Q04     297  -   297		     
  ST37Q05     298  -   298		     
  ST37Q06     299  -   299		     
  ST37Q07     300  -   300		     
  ST37Q08     301  -   301		     
  ST37Q09     302  -   302		     
  ST37Q10     303  -   303		     
  ST38Q01     304  -   304		     
  ST38Q02     305  -   305		     
  ST38Q03     306  -   306		     
  ST38Q04     307  -   307		     
  ST38Q05     308  -   308		     
  ST38Q06     309  -   309		     
  ST38Q07     310  -   310		     
  ST38Q08     311  -   311		     
  ST38Q09     312  -   312		     
  ST38Q10     313  -   313		     
  ST38Q11     314  -   314		     
  EC01Q01     315  -   315		     
  EC02Q01     316  -   316		     
  EC03Q01     317  -   317		     
  EC04Q01     318  -   318		     
  EC05Q01     319  -   319		     
  EC06Q01     320  -   320		     
  EC06Q02     321  -   324    (a)  
  EC07Q01     325  -   332         
  EC07Q02     333  -   333         
  EC07Q03     334  -   341         
  EC08Q01     342  -   345    (a)  
  IC01Q01     346  -   346		     
  IC01Q02     347  -   347		     
  IC01Q03     348  -   348		     
  IC02Q01     349  -   349		     
  IC03Q01     350  -   350		     
  IC04Q01     351  -   351		     
  IC04Q02     352  -   352		     
  IC04Q03     353  -   353		     
  IC05Q01     354  -   354		     
  IC05Q02     355  -   355		     
  IC05Q03     356  -   356		     
  IC05Q04     357  -   357		     
  IC05Q05     358  -   358		     
  IC05Q06     359  -   359		     
  IC05Q07     360  -   360		     
  IC05Q08     361  -   361		     
  IC05Q09     362  -   362		     
  IC05Q10     363  -   363		     
  IC05Q11     364  -   364		     
  IC05Q12     365  -   365		     
  IC06Q01     366  -   366		     
  IC06Q02     367  -   367		     
  IC06Q03     368  -   368		     
  IC06Q04     369  -   369		     
  IC06Q05     370  -   370		     
  IC06Q06     371  -   371		     
  IC06Q07     372  -   372		     
  IC06Q08     373  -   373		     
  IC06Q09     374  -   374		     
  IC06Q10     375  -   375		     
  IC06Q11     376  -   376		     
  IC06Q12     377  -   377		     
  IC06Q13     378  -   378		     
  IC06Q14     379  -   379		     
  IC06Q15     380  -   380		     
  IC06Q16     381  -   381		     
  IC06Q17     382  -   382		     
  IC06Q18     383  -   383		     
  IC06Q19     384  -   384		     
  IC06Q20     385  -   385		     
  IC06Q21     386  -   386		     
  IC06Q22     387  -   387		     
  IC06Q23     388  -   388		     
  IC07Q01     389  -   389		     
  IC07Q02     390  -   390		     
  IC07Q03     391  -   391		     
  IC07Q04     392  -   392		     
  IC08Q01     393  -   393		     
  IC09Q01     394  -   394		     
  SC07Q01     395  -   397		     
  CLCUSE3A    398  -   402		     
  CLCUSE3B    403  -   407		     
  AGE         408  -   412		     
  GRADE       413  -   414		     
  ISCEDL      415  -   415		     
  ISCEDD      416  -   416		     
  ISCEDO      417  -   417		     
  PROGN       418  -   423       (a)  
  FAMSTRUC    424  -   424            
  BMMJ        425  -   426            
  BFMJ        427  -   428            
  BSMJ        429  -   430            
  HISEI       431  -   432            
  MSECATEG    433  -   433            
  FSECATEG    434  -   434            
  HSECATEG    435  -   435            
  SSECATEG    436  -   436            
  MISCED      437  -   437            
  FISCED      438  -   438            
  HISCED      439  -   439            
  PARED       440  -   441            
  ISO_S       442  -   449       (a)  
  ISO_M       450  -   457       (a)  
  ISO_F       458  -   465       (a)  
  IMMIG       466  -   466            
  LANG        467  -   467            
  LANGN       468  -   473       (a)  
  SISCED      474  -   474		     
  MMINS       475  -   482		     
  TMINS       483  -   490		     
  PCMATH      491  -   496		     
  RMHMWK      497  -   504		     
  COMPHOME    505  -   513		     
  CULTPOSS    514  -   522		     
  HEDRES      523  -   531		     
  HOMEPOS     532  -   540		     
  ATSCHL      541  -   549		     
  STUREL      550  -   558		     
  BELONG      559  -   567		     
  INTMAT      568  -   576		     
  INSTMOT     577  -   585		     
  MATHEFF     586  -   594		     
  ANXMAT      595  -   603		     
  SCMAT       604  -   612		     
  CSTRAT      613  -   621		     
  ELAB        622  -   630		     
  MEMOR       631  -   639		     
  COMPLRN     640  -   648		     
  COOPLRN     649  -   657		     
  TEACHSUP    658  -   666		     
  DISCLIM     667  -   675		     
  INTUSE      676  -   684		     
  PRGUSE      685  -   693		     
  ROUTCONF    694  -   702		     
  INTCONF     703  -   711		     
  HIGHCONF    712  -   720		     
  ATTCOMP     721  -   729		     
  ESCS        730  -   739		     
  PV1MATH     740  -   748		     
  PV2MATH     749  -   757		     
  PV3MATH     758  -   766		     
  PV4MATH     767  -   775		     
  PV5MATH     776  -   784		     
  PV1MATH1    785  -   793		     
  PV2MATH1    794  -   802		     
  PV3MATH1    803  -   811		     
  PV4MATH1    812  -   820		     
  PV5MATH1    821  -   829		     
  PV1MATH2    830  -   838		     
  PV2MATH2    839  -   847		     
  PV3MATH2    848  -   856		     
  PV4MATH2    857  -   865		     
  PV5MATH2    866  -   874		     
  PV1MATH3    875  -   883		     
  PV2MATH3    884  -   892		     
  PV3MATH3    893  -   901		     
  PV4MATH3    902  -   910		     
  PV5MATH3    911  -   919		     
  PV1MATH4    920  -   928		     
  PV2MATH4    929  -   937		     
  PV3MATH4    938  -   946		     
  PV4MATH4    947  -   955		     
  PV5MATH4    956  -   964		     
  PV1READ     965  -   973		     
  PV2READ     974  -   982		     
  PV3READ     983  -   991		     
  PV4READ     992  -   1000		     
  PV5READ     1001 -   1009		     
  PV1SCIE     1010 -   1018		     
  PV2SCIE     1019 -   1027		     
  PV3SCIE     1028 -   1036		     
  PV4SCIE     1037 -   1045		     
  PV5SCIE     1046 -   1054		     
  PV1PROB     1055 -   1063		     
  PV2PROB     1064 -   1072		     
  PV3PROB     1073 -   1081		     
  PV4PROB     1082 -   1090		     
  PV5PROB     1091 -   1099		     
  W_FSTUWT    1100 -   1108		     
  OECD        1125 -   1125		     
  UH          1126 -   1126		     
  W_FSTR1     1127 -   1135		     
  W_FSTR2     1136 -   1144		     
  W_FSTR3     1145 -   1153		     
  W_FSTR4     1154 -   1162		     
  W_FSTR5     1163 -   1171		     
  W_FSTR6     1172 -   1180		     
  W_FSTR7     1181 -   1189		     
  W_FSTR8     1190 -   1198		     
  W_FSTR9     1199 -   1207		     
  W_FSTR10    1208 -   1216		     
  W_FSTR11    1217 -   1225		     
  W_FSTR12    1226 -   1234		     
  W_FSTR13    1235 -   1243		     
  W_FSTR14    1244 -   1252		     
  W_FSTR15    1253 -   1261		     
  W_FSTR16    1262 -   1270		     
  W_FSTR17    1271 -   1279		     
  W_FSTR18    1280 -   1288		     
  W_FSTR19    1289 -   1297		     
  W_FSTR20    1298 -   1306		     
  W_FSTR21    1307 -   1315		     
  W_FSTR22    1316 -   1324		     
  W_FSTR23    1325 -   1333		     
  W_FSTR24    1334 -   1342		     
  W_FSTR25    1343 -   1351		     
  W_FSTR26    1352 -   1360		     
  W_FSTR27    1361 -   1369		     
  W_FSTR28    1370 -   1378		     
  W_FSTR29    1379 -   1387		     
  W_FSTR30    1388 -   1396		     
  W_FSTR31    1397 -   1405		     
  W_FSTR32    1406 -   1414		     
  W_FSTR33    1415 -   1423		     
  W_FSTR34    1424 -   1432		     
  W_FSTR35    1433 -   1441		     
  W_FSTR36    1442 -   1450		     
  W_FSTR37    1451 -   1459		     
  W_FSTR38    1460 -   1468		     
  W_FSTR39    1469 -   1477		     
  W_FSTR40    1478 -   1486		     
  W_FSTR41    1487 -   1495		     
  W_FSTR42    1496 -   1504		     
  W_FSTR43    1505 -   1513		     
  W_FSTR44    1514 -   1522		     
  W_FSTR45    1523 -   1531		     
  W_FSTR46    1532 -   1540		     
  W_FSTR47    1541 -   1549		     
  W_FSTR48    1550 -   1558		     
  W_FSTR49    1559 -   1567		     
  W_FSTR50    1568 -   1576		     
  W_FSTR51    1577 -   1585		     
  W_FSTR52    1586 -   1594		     
  W_FSTR53    1595 -   1603		     
  W_FSTR54    1604 -   1612		     
  W_FSTR55    1613 -   1621		     
  W_FSTR56    1622 -   1630		     
  W_FSTR57    1631 -   1639		     
  W_FSTR58    1640 -   1648		     
  W_FSTR59    1649 -   1657		     
  W_FSTR60    1658 -   1666		     
  W_FSTR61    1667 -   1675		     
  W_FSTR62    1676 -   1684		     
  W_FSTR63    1685 -   1693		     
  W_FSTR64    1694 -   1702		     
  W_FSTR65    1703 -   1711		     
  W_FSTR66    1712 -   1720		     
  W_FSTR67    1721 -   1729		     
  W_FSTR68    1730 -   1738		     
  W_FSTR69    1739 -   1747		     
  W_FSTR70    1748 -   1756		     
  W_FSTR71    1757 -   1765		     
  W_FSTR72    1766 -   1774		     
  W_FSTR73    1775 -   1783		     
  W_FSTR74    1784 -   1792		     
  W_FSTR75    1793 -   1801		     
  W_FSTR76    1802 -   1810		     
  W_FSTR77    1811 -   1819		     
  W_FSTR78    1820 -   1828		     
  W_FSTR79    1829 -   1837		     
  W_FSTR80    1838 -   1846		     
  WVARSTRR    1847 -   1848		     
  UNIT        1849 -   1849		
  STRATUM     1851 -   1855  (a)   
  CNTFAC1     1856 -   1869		     
  CNTFAC2     1870 -   1883		     
   .


variable labels
 country   "Country ID"                                                                             
 cnt       "Country Alphanumeric ISO Code" 
 subnatio  "Adjudicated sub-region"
 SchoolID   "School ID"
 StIDStd   "Student ID"
 ST01Q01   "Grade Q1a"                                               
 ST02Q02   "Birth Month Q1Month"                                     
 ST02Q03   "Birth Year Q1Year"                                       
 ST03Q01   "Sex Q3"                                                  
 ST04Q01   "Lives at home Mother  Q4a"                               
 ST04Q02   "Lives at home female guard. Q4b"                         
 ST04Q03   "Lives at home Father  Q4c"                               
 ST04Q04   "Lives at home male guard. Q4d"                           
 ST04Q05   "Lives at home Others Q4e"                                
 ST05Q01   "Mother currently doing Q5"                               
 ST06Q01   "Father currently doing Q6"                               
 ST07Q01   "Mother’s main job  Q7"                                   
 ST09Q01   "Father’s main job  Q9"                                   
 ST12Q01   "Mother <ISCED5A or 6>  Q12a"                             
 ST12Q02   "Mother <ISCED5B>  Q12b"                                  
 ST12Q03   "Mother <ISCED4>  Q12c"                                   
 ST14Q01   "Father <ISCED 5A or 6>  Q14a"                            
 ST14Q02   "Father <ISCED 5B>  Q14b"                                 
 ST14Q03   "Father <ISCDED 4>  Q14c"                                 
 ST15Q01   "Country of birth Self  Q15a_a"                           
 ST15Q02   "Country of birth Mother  Q15a_b"                         
 ST15Q03   "Country of birth Father  Q15a_c"                         
 ST15Q04   "Country of birth Age Q15b"                               
 ST16Q01   "Language at home Q16"                                    
 ST17Q01   "Possessions desk Q17a"                                   
 ST17Q02   "Possessions own room Q17b"                               
 ST17Q03   "Possessions study place Q17c"                            
 ST17Q04   "Possessions  computer  Q17d"                             
 ST17Q05   "Possessions software Q17e"                               
 ST17Q06   "Possessions Internet Q17f"                               
 ST17Q07   "Possessions calculator Q17g"                             
 ST17Q08   "Possessions literature Q17h"                             
 ST17Q09   "Possessions poetry Q17i"                                 
 ST17Q10   "Possessions art Q17j"                                    
 ST17Q11   "Possessions textbooks Q17k"                              
 ST17Q12   "Possessions dictionary Q17l"                             
 ST17Q13   "Possessions dishwasher Q17m"                             
 ST17Q14   "Possessions <Cntry item 1>  Q17n"                        
 ST17Q15   "Possessions <Cntry item 2>  Q17o"                        
 ST17Q16   "Possessions <Cntry item 3>  Q17p"                        
 ST19Q01   "How many books at home Q19"                              
 ST20Q01   "Attend <ISCED 0> Q20"                                    
 ST21Q01   "<ISCED 1>Years Q21"                                      
 ST22Q01   "Repeat <ISCED 1>  Q22a"                                  
 ST22Q02   "Repeat <ISCED 2>  Q22b"                                  
 ST22Q03   "Repeat <ISCED 3>  Q22c"                                  
 ST23Q01   "Expect <ISCED 2> Q23a"                                   
 ST23Q02   "Expect <ISCED 3B or 3C> Q23b"                            
 ST23Q03   "Expect <ISCED 3A> Q23c"                                  
 ST23Q04   "Expect <ISCED 4> Q23d"                                   
 ST23Q05   "Expect <ISCED 5B> Q23e"                                  
 ST23Q06   "Expect <ISCED 5A or 6> Q23f"                             
 ST24Q01   "School done little Q24a"                                 
 ST24Q02   "School waste of time  Q24b"                              
 ST24Q03   "School given confidence Q24c"                            
 ST24Q04   "School useful Q24d"                                      
 ST25Q01   "Attend local   Q25a"                                     
 ST25Q02   "Attend better  Q25b"                                     
 ST25Q03   "Attend specific program Q25c"                            
 ST25Q04   "Attend religious Q25d"                                   
 ST25Q05   "Attend family Q25e"                                      
 ST25Q06   "Attend Other Q25f"                                       
 ST26Q01   "Well with Students Q26a"                                 
 ST26Q02   "Interested in Students  Q26b"                            
 ST26Q03   "Listen to me Q26c"                                       
 ST26Q04   "Give extra help Q26d"                                    
 ST26Q05   "Treat me fairly Q26e"                                    
 ST27Q01   "Feel an outsider Q27a"                                   
 ST27Q02   "Make friends Q27b"                                       
 ST27Q03   "Feel I belong Q27c"                                      
 ST27Q04   "Feel awkward Q27d"                                       
 ST27Q05   "Think I'm liked Q27e"                                    
 ST27Q06   "Feel lonely Q27f"                                        
 ST28Q01   "Late for school Q28"                                     
 ST29Q01   "Hours All  homework  Q29a"                               
 ST29Q02   "Hours All <Remedial> Q29b"                               
 ST29Q03   "Hours All <Enrichment> Q29c"                             
 ST29Q04   "Hours All  tutor Q29d"                                   
 ST29Q05   "Hours All  <out-of-school> Q29e"                         
 ST29Q06   "Hours All  other study Q29f"                             
 ST30Q01   "Attitude enjoy reading Q30a"                             
 ST30Q02   "Attitude effort Q30b"                                    
 ST30Q03   "Attitude look forward Q30c"                              
 ST30Q04   "Attitude enjoy Maths  Q30d"                              
 ST30Q05   "Attitude career  Q30e"                                   
 ST30Q06   "Attitude interested Q30f"                                
 ST30Q07   "Attitude further study Q30g"                             
 ST30Q08   "Attitude job  Q30h"                                      
 ST31Q01   "Confident timetable Q31a"                                
 ST31Q02   "Confident discount  Q31b"                                
 ST31Q03   "Confident area Q31c"                                     
 ST31Q04   "Confident graphs Q31d"                                   
 ST31Q05   "Confident linear Q31e"                                   
 ST31Q06   "Confident distance Q31f"                                 
 ST31Q07   "Confident quadratics Q31g"                               
 ST31Q08   "Confident rate  Q31h"                                    
 ST32Q01   "Feel study_worry Q32a"                                   
 ST32Q02   "Feel study_not good Q32b"                                
 ST32Q03   "Feel study_tense Q32c"                                   
 ST32Q04   "Feel study_good <marks>  Q32d"                           
 ST32Q05   "Feel study_nervous Q32e"                                 
 ST32Q06   "Feel study_quickly  Q32f"                                
 ST32Q07   "Feel study_best subject Q32g"                            
 ST32Q08   "Feel study_helpless Q32h"                                
 ST32Q09   "Feel study_underst. diffc. Q32i"                         
 ST32Q10   "Feel study_poor <marks> Q32j"                            
 ST33Q01   "Hours Maths  homework Q33a"                              
 ST33Q02   "Hours Maths <Remedial> Q33b"                             
 ST33Q03   "Hours Maths  <Enrichment> Q33c"                          
 ST33Q04   "Hours  Maths  tutor Q33d"                                
 ST33Q05   "Hours Maths  <out-of-school>  Q33e"                      
 ST33Q06   "Hours Maths other   Q33f"                                
 ST34Q01   "Learn_important parts Q34a"                              
 ST34Q02   "Learn_new ways Q34b"                                     
 ST34Q03   "Learn_check myself  Q34c"                                
 ST34Q04   "Learn_concepts Q34d"                                     
 ST34Q05   "Learn_everyday life Q34e"                                
 ST34Q06   "Learn_solve when sleep  Q34f"                            
 ST34Q07   "Learn_by heart  Q34g"                                    
 ST34Q08   "Learn_by relating Q34h"                                  
 ST34Q09   "Learn_examples Q34i"                                     
 ST34Q10   "Learn_clarify  Q34j"                                     
 ST34Q11   "Learn_applied Q34k"                                      
 ST34Q12   "Learn_exactly Q34l"                                      
 ST34Q13   "Learn_procedure Q34m"                                    
 ST34Q14   "Learn_relate Q34n"                                       
 ST35Q02   "Maths <class periods> Q35b"                              
 ST35Q03   "All <class periods> Q35c"                                
 ST36Q01   "Students in Maths Q36"                                   
 ST37Q01   "Attitudes be the best Q37a"                              
 ST37Q02   "Attitudes group work Q37b"                               
 ST37Q03   "Attitudes exams Q37c"                                    
 ST37Q04   "Attitudes project  Q37d"                                 
 ST37Q05   "Attitudes effort  Q37e"                                  
 ST37Q06   "Attitudes work with other Q37f"                          
 ST37Q07   "Attitudes do better Q37g"                                
 ST37Q08   "Attitudes helping Q37h"                                  
 ST37Q09   "Attitudes learn most  Q37i"                              
 ST37Q10   "Attitudes best work Q37j"                                
 ST38Q01   "Lesson interested Q38a"                                  
 ST38Q02   "Lesson don’t listen Q38b"                                
 ST38Q03   "Lesson extra help Q38c"                                  
 ST38Q04   "Lesson book work Q38d"                                   
 ST38Q05   "Lesson help learning  Q38e"                              
 ST38Q06   "Lesson noise  Q38f"                                      
 ST38Q07   "Lesson understand Q38g"                                  
 ST38Q08   "Lesson <quieten down>  Q38h"                             
 ST38Q09   "Lesson can't work well Q38i"                             
 ST38Q10   "Lesson opinions Q38j"                                    
 ST38Q11   "Lesson late start Q38k"                                  
 EC01Q01   "Miss two months <ISCED 1> Q1"                            
 EC02Q01   "Miss two months <ISCED 2> Q2"                            
 EC03Q01   "Change while in  <ISCED 1> Q3"                           
 EC04Q01   "Change while in  <ISCED 2> Q4"                           
 EC05Q01   "Changed <study programme> since <Grade X> Q5"            
 EC06Q01   "Type <Mathematics class> Q6"  
 ec06q02    " Type <Mathematics class> National codes"	
 EC07Q01     "Mark in <Mathematics> Q7"                           
 EC07Q02     "Pass mark in Maths Q7"
 EC07Q03     "Mark in Maths in percentages"
 EC08Q01   "Job at 30 Q8"                                            
 IC01Q01   "Available at home  IC1a"                                 
 IC01Q02   "Available at school  IC1b"                               
 IC01Q03   "Available at other places  IC1c"                         
 IC02Q01   "Used computer  IC2"                                      
 IC03Q01   "How long using computers Q3"                             
 IC04Q01   "Use often at home  IC4a"                                 
 IC04Q02   "Use often at school  IC4b"                               
 IC04Q03   "Use often at other places  IC4c"                         
 IC05Q01   "How often information  IC5a"                             
 IC05Q02   "How often games  IC5b"                                   
 IC05Q03   "How often Word  IC5c"                                    
 IC05Q04   "How often group  IC5d"                                   
 IC05Q05   "How often spreadsheets  IC5e"                            
 IC05Q06   "How often Internet software?  IC5f"                      
 IC05Q07   "How often graphics  IC5g"                                
 IC05Q08   "How often educ software  IC5h"                           
 IC05Q09   "How often learning  IC5i"                                
 IC05Q10   "How often download music  IC5j"                          
 IC05Q11   "How often programming  IC5k"                             
 IC05Q12   "How often chatrooms  IC5l"                               
 IC06Q01   "How well start game  IC6a"                               
 IC06Q02   "How well antiviruses  IC6b"                              
 IC06Q03   "How well open file  IC6c"                                
 IC06Q04   "How well edit  IC6d"                                     
 IC06Q05   "How well scroll  IC6e"                                   
 IC06Q06   "How well addresses  IC6f"                                
 IC06Q07   "How well copy  IC6g"                                     
 IC06Q08   "How well save  IC6h"                                     
 IC06Q09   "How well print  IC6i"                                    
 IC06Q10   "How well delete  IC6j"                                   
 IC06Q11   "How well move  IC6k"                                     
 IC06Q12   "How well Internet  IC6l"                                 
 IC06Q13   "How well download file  IC6m"                            
 IC06Q14   "How well attach  IC6n"                                   
 IC06Q15   "How well program  IC6o"                                  
 IC06Q16   "How well spreadsheet plot  IC6p"                         
 IC06Q17   "How well PowerPoint  IC6q"                               
 IC06Q18   "How well games  IC6r"                                    
 IC06Q19   "How well download music  IC6s"                           
 IC06Q20   "How well multimedia  IC6t"                               
 IC06Q21   "How well draw  IC6u"                                     
 IC06Q22   "How well emails  IC6v"                                   
 IC06Q23   "How well web page  IC6w"                                 
 IC07Q01   "Feel  important  IC7a"                                   
 IC07Q02   "Feel  fun  IC7b"                                         
 IC07Q03   "Feel  interested  IC7c"                                  
 IC07Q04   "Feel  forget time  IC7d"                                 
 IC08Q01   "Learn Computer  IC8"                                     
 IC09Q01   "Learn Internet  IC9"                                     
 ISCEDL    "ISCED Level"                                              
 ISCEDD    "ISCED Designation"                                        
 ISCEDO    "ISCED Orientation"                                        
 ProgN     "Unique national programme code"                            
 BMMJ      "ISCO code Mother"                                           
 BFMJ      "ISCO code Father"                                           
 BSMJ      "ISCO code Student"                                          
 ISO_S     "ISO code country of birth Student"                         
 ISO_M     "ISO code country of birth Mother"                          
 ISO_F     "ISO code country of birth Father"                          
 LANG       "Foreign language spoken at home"
 LANGN     "Language at home, national"                                                         
 AGE       "Age of student"                                              
 MMINS     "Minutes of Maths per week"                                 
 TMINS     "Total minutes of instructional time p/w"                   
 PCMATH    "Ratio of maths and total instructional time"
 SC07q01   "Instructional weeks in year"                             
 FAMSTRUC  "Family Structure"                                                
 HISEI     "Highest parental occupational status"     
 ST11R01   "Mother: Highest level completed at school"      
 ST13R01   "Father: Highest level completed at school"  
 MISCED    "Educational level of mother (ISCED)"                               
 FISCED    "Educational level of father (ISCED)"                               
 HISCED    "Highest educational level of parents"                              
 IMMIG     "Country of birth"                                                   
 GRADE     "Grade compared to modal grade in country"                          
 SISCED    "Expected educational level of student (ISCED)"                    
 RMHMWK    "Relative time spent on Maths homework"                            
 MsECATEG  "Mother White collar/Blue collar classification"                  
 FsECATEG  "Father White collar/Blue collar classification"                  
 HsECATEG  "Highest parent White collar/Blue collar classification"     
 SsECATEG  "Self White collar/Blue collar classification"       
 ANXMAT    "Mathematics anxiety (WLE)"                                            
 ATSCHL    "Attitudes towards school (WLE)"                                      
 ATTCOMP   "ICT: Attitudes towards computers (WLE)"                             
 BELONG    "Sense of belonging to school (WLE)"                                  
 COMPHOME  "Computer facilities at home (WLE)"                                 
 COMPLRN   "Competitive learning (WLE)"                                         
 COOPLRN   "Co-operative learning (WLE)"                                        
 CSTRAT    "Control strategies (WLE)"                                            
 CULTPOSS  "Cultural possessions of the family (WLE)"                          
 DISCLIM   "Disciplinary climate in maths lessons (WLE)"                        
 ELAB      "Elaboration strategies (WLE)"                                          
 HEDRES    "Home educational resources (WLE)"                                    
 HIGHCONF  "ICT: Confidence in high-level tasks (WLE)"                         
 INSTMOT   "Instrumental motivation in mathematics (WLE)"                       
 INTCONF   "ICT: Confidence in internet tasks (WLE)"                            
 INTMAT    "Interest in mathematics (WLE)"                                       
 INTUSE    "ICT: Internet/entertainment use  (WLE)"                              
 MATHEFF   "Mathematics self-efficacy (WLE)"                                    
 MEMOR     "Memorisation strategies (WLE)"                                        
 PRGUSE    "ICT: Programs/software use (WLE)"                                    
 ROUTCONF  "ICT: Confidence in routine tasks (WLE)"                            
 SCMAT     "Mathematics self-concept (WLE)"                                       
 STUREL    "Student-teacher relations at school  (WLE)"                          
 TEACHSUP  "Teacher support in maths lessons (WLE)"    
 homepos  "Index of home possessions (WLE)"	
 pared	     "Highest parental education in years of schooling"	
 oecd	     "OECD country indicator"	
 uh	     "One-hour booklet indicator"	
 pv1math   " Plausible value in math"                                
 pv2math   " Plausible value in math"                                
 pv3math   " Plausible value in math"                                
 pv4math   " Plausible value in math"                                
 pv5math   " Plausible value in math"                                
 pv1math1  " Plausible value in math - Space and Shape"             
 pv2math1  " Plausible value in math - Space and Shape"             
 pv3math1  " Plausible value in math - Space and Shape"             
 pv4math1  " Plausible value in math - Space and Shape"             
 pv5math1  " Plausible value in math - Space and Shape"             
 pv1math2  " Plausible value in math- Change and Relationships"     
 pv2math2  " Plausible value in math- Change and Relationships"     
 pv3math2  " Plausible value in math- Change and Relationships"     
 pv4math2  " Plausible value in math- Change and Relationships"     
 pv5math2  " Plausible value in math- Change and Relationships"     
 pv1math3  " Plausible value in math - Uncertainty"                 
 pv2math3  " Plausible value in math - Uncertainty"                 
 pv3math3  " Plausible value in math - Uncertainty"                 
 pv4math3  " Plausible value in math - Uncertainty"                 
 pv5math3  " Plausible value in math - Uncertainty"                 
 pv1math4  " Plausible value in math - Quantity "                   
 pv2math4  " Plausible value in math - Quantity "                   
 pv3math4  " Plausible value in math - Quantity "                   
 pv4math4  " Plausible value in math - Quantity "                   
 pv5math4  " Plausible value in math - Quantity "                   
 pv1read   " Plausible value in reading"                             
 pv2read   " Plausible value in reading"                             
 pv3read   " Plausible value in reading"                             
 pv4read   " Plausible value in reading"                             
 pv5read   " Plausible value in reading"                             
 pv1scie   " Plausible value in science"                             
 pv2scie   " Plausible value in science"                             
 pv3scie   " Plausible value in science"                             
 pv4scie   " Plausible value in science"                             
 pv5scie   " Plausible value in science"                             
 pv1prob   " Plausible value in problem solving"                     
 pv2prob   " Plausible value in problem solving"                     
 pv3prob   " Plausible value in problem solving"                     
 pv4prob   " Plausible value in problem solving"                     
 pv5prob   " Plausible value in problem solving"                     
 w_fstuwt  " Student final weight"                                  
 cntfac1   " Country weight factor for equal weights (1000)"             
 cntfac2   " Country weight factor for normalised weights (sample size)"                                                       
 w_fstr1   " BRR replicate"                                          
 w_fstr2   " BRR replicate"                                          
 w_fstr3   " BRR replicate"                                          
 w_fstr4   " BRR replicate"                                          
 w_fstr5   " BRR replicate"                                          
 w_fstr6   " BRR replicate"                                          
 w_fstr7   " BRR replicate"                                          
 w_fstr8   " BRR replicate"                                          
 w_fstr9   " BRR replicate"                                          
 w_fstr10  " BRR replicate"                                         
 w_fstr11  " BRR replicate"                                         
 w_fstr12  " BRR replicate"                                         
 w_fstr13  " BRR replicate"                                         
 w_fstr14  " BRR replicate"                                         
 w_fstr15  " BRR replicate"                                         
 w_fstr16  " BRR replicate"                                         
 w_fstr17  " BRR replicate"                                         
 w_fstr18  " BRR replicate"                                         
 w_fstr19  " BRR replicate"                                         
 w_fstr20  " BRR replicate"                                         
 w_fstr21  " BRR replicate"                                         
 w_fstr22  " BRR replicate"                                         
 w_fstr23  " BRR replicate"                                         
 w_fstr24  " BRR replicate"                                         
 w_fstr25  " BRR replicate"                                         
 w_fstr26  " BRR replicate"                                         
 w_fstr27  " BRR replicate"                                         
 w_fstr28  " BRR replicate"                                         
 w_fstr29  " BRR replicate"                                         
 w_fstr30  " BRR replicate"                                         
 w_fstr31  " BRR replicate"                                         
 w_fstr32  " BRR replicate"                                         
 w_fstr33  " BRR replicate"                                         
 w_fstr34  " BRR replicate"                                         
 w_fstr35  " BRR replicate"                                         
 w_fstr36  " BRR replicate"                                         
 w_fstr37  " BRR replicate"                                         
 w_fstr38  " BRR replicate"                                         
 w_fstr39  " BRR replicate"                                         
 w_fstr40  " BRR replicate"                                         
 w_fstr41  " BRR replicate"                                         
 w_fstr42  " BRR replicate"                                         
 w_fstr43  " BRR replicate"                                         
 w_fstr44  " BRR replicate"                                         
 w_fstr45  " BRR replicate"                                         
 w_fstr46  " BRR replicate"                                         
 w_fstr47  " BRR replicate"                                         
 w_fstr48  " BRR replicate"                                         
 w_fstr49  " BRR replicate"                                         
 w_fstr50  " BRR replicate"                                         
 w_fstr51  " BRR replicate"                                         
 w_fstr52  " BRR replicate"                                         
 w_fstr53  " BRR replicate"                                         
 w_fstr54  " BRR replicate"                                         
 w_fstr55  " BRR replicate"                                         
 w_fstr56  " BRR replicate"                                         
 w_fstr57  " BRR replicate"                                         
 w_fstr58  " BRR replicate"                                         
 w_fstr59  " BRR replicate"                                         
 w_fstr60  " BRR replicate"                                         
 w_fstr61  " BRR replicate"                                         
 w_fstr62  " BRR replicate"                                         
 w_fstr63  " BRR replicate"                                         
 w_fstr64  " BRR replicate"                                         
 w_fstr65  " BRR replicate"                                         
 w_fstr66  " BRR replicate"                                         
 w_fstr67  " BRR replicate"                                         
 w_fstr68  " BRR replicate"                                         
 w_fstr69  " BRR replicate"                                         
 w_fstr70  " BRR replicate"                                         
 w_fstr71  " BRR replicate"                                         
 w_fstr72  " BRR replicate"                                         
 w_fstr73  " BRR replicate"                                         
 w_fstr74  " BRR replicate"                                         
 w_fstr75  " BRR replicate"                                         
 w_fstr76  " BRR replicate"                                         
 w_fstr77  " BRR replicate"                                         
 w_fstr78  " BRR replicate"                                         
 w_fstr79  " BRR replicate"                                         
 w_fstr80  " BRR replicate"   
 wvarstrr  " RANDOMIZED FINAL VARIANCE STRATUM(1-80)"
 unit      " FINAL VARIANCE UNIT(1,2,3)"                                       
 ESCS       "Index of Socio-Economic and Cultural Status"
 CLCUSE3a   "How much Effort was invested-in the test"  
 CLCUSE3b   "How much Effort would has been invested- if masks were counted by schools"  
 STRATUM    "Stratum"
 .
 
value labels 
  ST01Q01    97    "N/A"
               98    "Invalid"
              99    "Miss"/
   ST02Q02     97    "N/A"
               98    "Invalid"
               99    "Miss"/
   ST02Q03     97    "N/A"
               98    "Invalid"
               99    "Miss"/
   ST03Q01     1    "Female"
               2    "Male"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST04Q01     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST04Q02     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST04Q03     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST04Q04     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST04Q05     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST05Q01     1    "Working Full-time"
               2    "Working Part-Time"
               3    "Looking for work"
               4    "Other"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST06Q01     1    "Working Full-time"
               2    "Working Part-Time"
               3    "Looking for work"
               4    "Other"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST12Q01     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST12Q02     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST12Q03     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST14Q01     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST14Q02     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST14Q03     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST15Q01     1    "<Test Country>"
               2    "<Other Country>"
               "97"    "N/A"
               "98"    "Invalid"
               "99"    "Miss"/
   ST15Q02     1    "<Test Country>"
               2    "<Other Country>"
               "97"    "N/A"
               "98"    "Invalid"
               "99"    "Miss"/
   ST15Q03     1    "<Test Country>"
               2    "<Other Country>"   
               "97"    "N/A"
               "98"    "Invalid"
               "99"    "Miss"/
   ST16Q01     1    "<Test language>"
               2    "<Other national language>"
               3    "<Other national dialects>"
               4    "<Other languages>"
               "97"    "N/A"
               "98"    "Invalid"
               "99"    "Miss"/
   ST17Q01     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST17Q02     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST17Q03     1    "Tick"
               2    "No Tick"
               8    "Invalid"
               7    "N/A"/
   ST17Q04     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST17Q05     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST17Q06     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST17Q07     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST17Q08     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST17Q09     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST17Q10     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST17Q11     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST17Q12     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST17Q13     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST17Q14     "xxxn1"    "Tick"
               "xxxn2"    "No Tick"
               "99998"    "Invalid"
               "99997"    "N/A"/
   ST17Q15      "xxxn1"    "Tick"
               "xxxn2"    "No Tick"
               "99998"    "Invalid"
               "99997"    "N/A"/
   ST17Q16      "xxxn1"    "Tick"
               "xxxn2"    "No Tick"
               "99998"    "Invalid"
               "99997"    "N/A"/
   ST19Q01     1    "0-10 books"
               2    "11-25 books"
               3    "26-100 books"
               4    "101-200 books"
               5    "201-500 books"
               6    "More than 500 books"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST20Q01     1    "No"
               2    "Yes, one year or less"
               3    "Yes, more than one year"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST22Q01     1    "No, never"
               2    "Yes, once"
               3    "Yes, twice or more"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST22Q02     1    "No, never"
               2    "Yes, once"
               3    "Yes, twice or more"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST22Q03     1    "No, never"
               2    "Yes, once"
               3    "Yes, twice or more"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST23Q01     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST23Q02     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST23Q03     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST23Q04     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST23Q05     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST23Q06     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST24Q01     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST24Q02     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST24Q03     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST24Q04     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST25Q01     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST25Q02     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST25Q03     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST25Q04     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST25Q05     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST25Q06     1    "Tick"
               2    "No Tick"
               9    "Miss"
               8    "Invalid"
               7    "N/A"/
   ST26Q01     1    "Strongly Agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST26Q02     1    "Strongly Agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST26Q03     1    "Strongly Agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST26Q04     1    "Strongly Agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST26Q05     1    "Strongly Agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST27Q01     1    "Strongly Agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST27Q02     1    "Strongly Agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST27Q03     1    "Strongly Agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST27Q04     1    "Strongly Agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST27Q05     1    "Strongly Agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST27Q06     1    "Strongly Agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST28Q01     1    "None "
               2    "1 or 2 times"
               3    "3 or 4 times"
               4    "5 or more times"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST30Q01     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST30Q02     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST30Q03     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST30Q04     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST30Q05     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST30Q06     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST30Q07     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST30Q08     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST31Q01     1    "Very confident"
               2    "Confident"
               3    "Not very confident"
               4    "Not at all confident"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST31Q02     1    "Very confident"
               2    "Confident"
               3    "Not very confident"
               4    "Not at all confident"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST31Q03     1    "Very confident"
               2    "Confident"
               3    "Not very confident"
               4    "Not at all confident"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST31Q04     1    "Very confident"
               2    "Confident"
               3    "Not very confident"
               4    "Not at all confident"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST31Q05     1    "Very confident"
               2    "Confident"
               3    "Not very confident"
               4    "Not at all confident"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST31Q06     1    "Very confident"
               2    "Confident"
               3    "Not very confident"
               4    "Not at all confident"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST31Q07     1    "Very confident"
               2    "Confident"
               3    "Not very confident"
               4    "Not at all confident"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST31Q08     1    "Very confident"
               2    "Confident"
               3    "Not very confident"
               4    "Not at all confident"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST32Q01     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST32Q02     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST32Q03     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST32Q04     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST32Q05     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST32Q06     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST32Q07     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST32Q08     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST32Q09     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST32Q10     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST34Q01     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST34Q02     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST34Q03     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST34Q04     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST34Q05     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST34Q06     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST34Q07     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST34Q08     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST34Q09     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST34Q10     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST34Q11     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST34Q12     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST34Q13     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST34Q14     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST37Q01     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST37Q02     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST37Q03     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST37Q04     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST37Q05     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST37Q06     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST37Q07     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST37Q08     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST37Q09     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST37Q10     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST38Q01     1    "Every lesson"
               2    "Most lessons"
               3    "Some lessons"
               4    "Never or hardly ever"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST38Q02     1    "Every lesson"
               2    "Most lessons"
               3    "Some lessons"
               4    "Never or hardly ever"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST38Q03     1    "Every lesson"
               2    "Most lessons"
               3    "Some lessons"
               4    "Never or hardly ever"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST38Q04     1    "Every lesson"
               2    "Most lessons"
               3    "Some lessons"
               4    "Never or hardly ever"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST38Q05     1    "Every lesson"
               2    "Most lessons"
               3    "Some lessons"
               4    "Never or hardly ever"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST38Q06     1    "Every lesson"
               2    "Most lessons"
               3    "Some lessons"
               4    "Never or hardly ever"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST38Q07     1    "Every lesson"
               2    "Most lessons"
               3    "Some lessons"
               4    "Never or hardly ever"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST38Q08     1    "Every lesson"
               2    "Most lessons"
               3    "Some lessons"
               4    "Never or hardly ever"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST38Q09     1    "Every lesson"
               2    "Most lessons"
               3    "Some lessons"
               4    "Never or hardly ever"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST38Q10     1    "Every lesson"
               2    "Most lessons"
               3    "Some lessons"
               4    "Never or hardly ever"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ST38Q11     1    "Every lesson"
               2    "Most lessons"
               3    "Some lessons"
               4    "Never or hardly ever"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   EC01Q01     1    "No, never"
               2    "Yes, once"
               3    "Yes, twice or more"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   EC02Q01     1    "No, never"
               2    "Yes, once"
               3    "Yes, twice or more"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   EC03Q01     1    "No, all <ISCED 1> same school"
               2    "Yes, changed once"
               3    "Yes, changed twice or more"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   EC04Q01     1    "No, all <ISCED 1> same school"
               2    "Yes, changed once"
               3    "Yes, changed twice or more"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   EC05Q01     1    "Yes"
               2    "No"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   EC06Q01     1    "<high level>"
               2    "<medium level>"
               3    "<basic level>"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   EC07Q02     1    "At or above <pass mark>"
               2    "Below <pass mark>"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC01Q01     1    "Yes"
               2    "No"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC01Q02     1    "Yes"
               2    "No"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC01Q03     1    "Yes"
               2    "No"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC02Q01     1    "Yes"
               2    "No"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC03Q01     1    "Less than 1 year"
               2    "1 to 3 years"
               3    "3 to 5 years"
               4    "More than 5 years"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC04Q01     1    "Almost every day"
               2    "A few times each week"
               3    "Between 1 pwk & 1 pmn"
               4    "Less than 1 pmn"
               5    "Never"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC04Q02     1    "Almost every day"
               2    "A few times each week"
               3    "Between 1 pwk & 1 pmn"
               4    "Less than 1 pmn"
               5    "Never"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC04Q03     1    "Almost every day"
               2    "A few times each week"
               3    "Between 1 pwk & 1 pmn"
               4    "Less than 1 pmn"
               5    "Never"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC05Q01     1    "Almost every day"
               2    "A few times each week"
               3    "Between 1 pwk & 1 pmn"
               4    "Less than 1 pmn"
               5    "Never"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC05Q02     1    "Almost every day"
               2    "A few times each week"
               3    "Between 1 pwk & 1 pmn"
               4    "Less than 1 pmn"
               5    "Never"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC05Q03     1    "Almost every day"
               2    "A few times each week"
               3    "Between 1 pwk & 1 pmn"
               4    "Less than 1 pmn"
               5    "Never"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC05Q04     1    "Almost every day"
               2    "A few times each week"
               3    "Between 1 pwk & 1 pmn"
               4    "Less than 1 pmn"
               5    "Never"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC05Q05     1    "Almost every day"
               2    "A few times each week"
               3    "Between 1 pwk & 1 pmn"
               4    "Less than 1 pmn"
               5    "Never"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC05Q06     1    "Almost every day"
               2    "A few times each week"
               3    "Between 1 pwk & 1 pmn"
               4    "Less than 1 pmn"
               5    "Never"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC05Q07     1    "Almost every day"
               2    "A few times each week"
               3    "Between 1 pwk & 1 pmn"
               4    "Less than 1 pmn"
               5    "Never"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC05Q08     1    "Almost every day"
               2    "A few times each week"
               3    "Between 1 pwk & 1 pmn"
               4    "Less than 1 pmn"
               5    "Never"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC05Q09     1    "Almost every day"
               2    "A few times each week"
               3    "Between 1 pwk & 1 pmn"
               4    "Less than 1 pmn"
               5    "Never"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC05Q10     1    "Almost every day"
               2    "A few times each week"
               3    "Between 1 pwk & 1 pmn"
               4    "Less than 1 pmn"
               5    "Never"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC05Q11     1    "Almost every day"
               2    "A few times each week"
               3    "Between 1 pwk & 1 pmn"
               4    "Less than 1 pmn"
               5    "Never"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC05Q12     1    "Almost every day"
               2    "A few times each week"
               3    "Between 1 pwk & 1 pmn"
               4    "Less than 1 pmn"
               5    "Never"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC06Q01     1    "Can do well"
               2    "Can do with help"
               3    "Cannot do"
               4    "Don't know"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC06Q02     1    "Can do well"
               2    "Can do with help"
               3    "Cannot do"
               4    "Don't know"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC06Q03     1    "Can do well"
               2    "Can do with help"
               3    "Cannot do"
               4    "Don't know"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC06Q04     1    "Can do well"
               2    "Can do with help"
               3    "Cannot do"
               4    "Don't know"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC06Q05     1    "Can do well"
               2    "Can do with help"
               3    "Cannot do"
               4    "Don't know"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC06Q06     1    "Can do well"
               2    "Can do with help"
               3    "Cannot do"
               4    "Don't know"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC06Q07     1    "Can do well"
               2    "Can do with help"
               3    "Cannot do"
               4    "Don't know"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC06Q08     1    "Can do well"
               2    "Can do with help"
               3    "Cannot do"
               4    "Don't know"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC06Q09     1    "Can do well"
               2    "Can do with help"
               3    "Cannot do"
               4    "Don't know"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC06Q10     1    "Can do well"
               2    "Can do with help"
               3    "Cannot do"
               4    "Don't know"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC06Q11     1    "Can do well"
               2    "Can do with help"
               3    "Cannot do"
               4    "Don't know"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC06Q12     1    "Can do well"
               2    "Can do with help"
               3    "Cannot do"
               4    "Don't know"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC06Q13     1    "Can do well"
               2    "Can do with help"
               3    "Cannot do"
               4    "Don't know"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC06Q14     1    "Can do well"
               2    "Can do with help"
               3    "Cannot do"
               4    "Don't know"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC06Q15     1    "Can do well"
               2    "Can do with help"
               3    "Cannot do"
               4    "Don't know"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC06Q16     1    "Can do well"
               2    "Can do with help"
               3    "Cannot do"
               4    "Don't know"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC06Q17     1    "Can do well"
               2    "Can do with help"
               3    "Cannot do"
               4    "Don't know"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC06Q18     1    "Can do well"
               2    "Can do with help"
               3    "Cannot do"
               4    "Don't know"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC06Q19     1    "Can do well"
               2    "Can do with help"
               3    "Cannot do"
               4    "Don't know"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC06Q20     1    "Can do well"
               2    "Can do with help"
               3    "Cannot do"
               4    "Don't know"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC06Q21     1    "Can do well"
               2    "Can do with help"
               3    "Cannot do"
               4    "Don't know"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC06Q22     1    "Can do well"
               2    "Can do with help"
               3    "Cannot do"
               4    "Don't know"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC06Q23     1    "Can do well"
               2    "Can do with help"
               3    "Cannot do"
               4    "Don't know"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC07Q01     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC07Q02     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC07Q03     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC07Q04     1    "Strongly agree"
               2    "Agree"
               3    "Disagree"
               4    "Strongly disagree"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC08Q01     1    "My school"
               2    "My friends"
               3    "My family"
               4    "Taught myself"
               5    "Others"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   IC09Q01     1    "Don't know how to use"
               2    "My school"
               3    "My friends"
               4    "My family"
               5    "Taught myself"
               6    "Others"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ISCEDL      1    "ISCED level 1"
               2    "ISCED level 2"
               3    "ISCED level 3"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ISCEDD      1    "A"
               2    "B"
               3    "C"
               4    "M"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   ISCEDO      1    "General"
               2    "Pre-Vocational"
               3    "Vocational"
               8    "Invalid"
               9    "Miss"
               7    "N/A"/
   FAMSTRUC 	1 'Single parent family'
                                  	2 'Nuclear family'
                                  	3 'Mixed family'
                                  	4 'Other'
                 		9 'Missing'   /
   st11R01          1 'None'
                        2 'ISCED 1'
		3 'ISCED 2'
		4 'ISCED 3B, C'
		5 'ISCED 3A' 
		9 'Missing' /
   ST13R01          1 'None'
                        2 'ISCED 1'
		3 'ISCED 2'
		4 'ISCED 3B, C'
		5 'ISCED 3A' 
		9 'Missing' /
   misced           0 'None'
                        1 'ISCED 1'
		2 'ISCED 2'
		3 'ISCED 3B, C'
		4 'ISCED 3A, ISCED 4'
		5 'ISCED 5B'
		6 'ISCED 5A, 6'
		9 'Missing'   /
   fisced             0 'None'
                        1 'ISCED 1'
		2 'ISCED 2'
		3 'ISCED 3B, C'
		4 'ISCED 3A, ISCED 4'
		5 'ISCED 5B'
		6 'ISCED 5A, 6'
		9 'Missing'   /
   HISCED         0 'None'
                        1 'ISCED 1'
		2 'ISCED 2'
		3 'ISCED 3B, C'
		4 'ISCED 3A, ISCED 4'
		5 'ISCED 5B'
		6 'ISCED 5A, 6'
		9 'Missing'   /
   immig             1 'Native students'
		2 'First-Generation students'
		3 'Non-native students'
                          9 'Missing'   /
   sisced             0 'ISCED 1'
                         1 'ISCED 2'
		2 'ISCED 3B, C'
		3 'ISCED 3A, ISCED 4'
		4 'ISCED 5B'
		5 'ISCED 5A, 6'
		9 'Missing'   /
  MSECateg  1 "White Collar high skilled"   
                    2 "White Collar low skilled"    
                    3 "Blue Collar high skilled"    
                    4 "Blue Collar low skilled"     
                    9 "Missing"  /         
  FSECateg   1 "White Collar high skilled"   
                    2 "White Collar low skilled"    
                    3 "Blue Collar high skilled"    
                    4 "Blue Collar low skilled"     
                    9 "Missing"  /         
  HSECateg  1 "White Collar high skilled"   
                    2 "White Collar low skilled"    
                    3 "Blue Collar high skilled"    
                    4 "Blue Collar low skilled"     
                    9 "Missing" / 
  SSECateg  1 "White Collar high skilled"   
                    2 "White Collar low skilled"    
                    3 "Blue Collar high skilled"    
                    4 "Blue Collar low skilled"     
                    9 "Missing"    /
  LANG    1   "Foreign language"
               0  "Test language or other national language"
               8   "Invalid"
               9    "Miss"
               7    "N/A"/
   oecd 1 'OECD country' 0 'Partner country'    /
   uh 1 'One-hour booklet' 0 'Two-hour booklet'
       .
 
missing values st03q01 st04q01 st04q02 st04q03 st04q04 st04q05 st05q01 st06q01 
  st12q01 st12q02 st12q03 st14q01 st14q02 st14q03 st17q01 st17q02 st17q03
  st17q04 st17q05 st17q06 st17q07 st17q08 st17q09 st17q10 st17q11 st17q12
  st17q13 st19q01 st20q01 st22q01
  st22q02 st22q03 st23q01 st23q02 st23q03 st23q04 st23q05 st23q06 st24q01
  st24q02 st24q03 st24q04 st25q01 st25q02 st25q03 st25q04 st25q05 st25q06
  st26q01 st26q02 st26q03 st26q04 st26q05 st27q01 st27q02 st27q03 st27q04
  st27q05 st27q06 st28q01 st30q01 st30q02 st30q03 st30q04 st30q05 st30q06
  st30q07 st30q08 st31q01 st31q02 st31q03 st31q04 st31q05 st31q06 st31q07
  st31q08 st32q01 st32q02 st32q03 st32q04 st32q05 st32q06 st32q07 st32q08
  st32q09 st32q10 st34q01 st34q02 st34q03 st34q04 st34q05 st34q06 st34q07
  st34q08 st34q09 st34q10 st34q11 st34q12 st34q13 st34q14 st37q01 st37q02
  st37q03 st37q04 st37q05 st37q06 st37q07 st37q08 st37q09 st37q10 st38q01
  st38q02 st38q03 st38q04 st38q05 st38q06 st38q07 st38q08 st38q09 st38q10
  st38q11 ec01q01 ec02q01 ec03q01 ec04q01 ec05q01 ec06q01 ec07q02 ic01q01
  ic01q02 ic01q03 ic02q01 ic03q01 ic04q01 ic04q02 ic04q03 ic05q01 ic05q02
  ic05q03 ic05q04 ic05q05 ic05q06 ic05q07 ic05q08 ic05q09 ic05q10 ic05q11
  ic05q12 ic06q01 ic06q02 ic06q03 ic06q04 ic06q05 ic06q06 ic06q07 ic06q08
  ic06q09 ic06q10 ic06q11 ic06q12 ic06q13 ic06q14 ic06q15 ic06q16 ic06q17
  ic06q18 ic06q19 ic06q20 ic06q21 ic06q22 ic06q23 ic07q01 ic07q02 ic07q03
  ic07q04 ic08q01 ic09q01  iscedl iscedd iscedo (7,8,9).
missing values ST15Q04 EC07Q01 EC07Q03 MMINS TMINS PCMATH ST21Q01 
      ST29Q01 ST29Q02 ST29Q03 ST29Q04 ST29Q05 ST29Q06  ST33Q01 ST33Q02 ST33Q03 ST33Q04 ST33Q05 ST33Q06 
      ST35Q02 ST35Q03 ST36Q01 sc07q01  (997,998,999).
missing values BMMJ BFMJ BSMJ AGE (97,98,99).
missing values iso_s iso_m iso_f ("99999970","99999980","99999990").
missing values ST17Q14 ST17Q15 ST17Q16 ("99997","99998").     
missing values ST07Q01 ST09Q01 EC08Q01 ("9997","9998","9999").
missing values ST01Q01 ST02Q02 ST02Q03 ST15Q01 ST15Q02 
  ST15Q03 ST16Q01  (97,98,99).      
missing values   GRADE (7,8,9).
missing values  FAMSTRUC  misced fisced HISCED immig sisced 
  MSECateg FSECateg HSECateg  SSECateg  st11R01  ST13R01  (7,8,9).
missing values  RMHMWK ANXMAT ATSCHL ATTCOMP BELONG COMPHOME COMPLRN COOPLRN 
  CSTRAT CULTPOSS DISCLIM ELAB HEDRES HIGHCONF INSTMOT 
  INTCONF INTMAT INTUSE MATHEFF MEMOR PRGUSE ROUTCONF 
  SCMAT STUREL TEACHSUP (997,998,999).
missing values  HISEI (97,98,99).
missing values  PV1MATH to pv5prob w_fstuwt  w_fstr1   to  w_fstr80   (9997).
VALUE LABELS PV1MATH to pv5prob w_fstuwt  w_fstr1   to  w_fstr80 9997 "N/A" .  
VALUE LABELS   ST07Q01 ST09Q01 EC08Q01 '9997' "N/A" '9998' "Invalid" '9999' "Miss". 
VALUE LABELS   ST15Q04 EC07Q01 EC07Q03 MMINS TMINS PCMATH ST21Q01 
      ST29Q01 ST29Q02 ST29Q03 ST29Q04 ST29Q05 ST29Q06  ST33Q01 ST33Q02 ST33Q03 ST33Q04 
      ST33Q05 ST33Q06 ST35Q02 ST35Q03 ST36Q01 sc07q01 CLCUSE3a CLCUSE3b  997 "N/A" 998 "Invalid" 999 "Miss".
VALUE LABELS   BMMJ BFMJ BSMJ AGE  97 "N/A" 98 "Invalid" 99 "Miss".
VALUE LABELS   GRADE 9 "Missing".
VALUE LABELS   RMHMWK ANXMAT ATSCHL ATTCOMP BELONG COMPHOME COMPLRN COOPLRN 
      CSTRAT CULTPOSS DISCLIM ELAB HEDRES HIGHCONF INSTMOT 
      INTCONF INTMAT INTUSE MATHEFF MEMOR PRGUSE ROUTCONF 
      SCMAT STUREL TEACHSUP HOMEPOS ESCS 999 "Missing".
VALUE LABELS   HISEI PARED 99 "Missing".
format st03q01 st04q01 st04q02 st04q03 st04q04 st04q05 st05q01 st06q01 
  st12q01 st12q02 st12q03 st14q01 st14q02 st14q03 st17q01 st17q02 st17q03
  st17q04 st17q05 st17q06 st17q07 st17q08 st17q09 st17q10 st17q11 st17q12
  st17q13 st19q01 st20q01 st22q01
  st22q02 st22q03 st23q01 st23q02 st23q03 st23q04 st23q05 st23q06 st24q01
  st24q02 st24q03 st24q04 st25q01 st25q02 st25q03 st25q04 st25q05 st25q06
  st26q01 st26q02 st26q03 st26q04 st26q05 st27q01 st27q02 st27q03 st27q04
  st27q05 st27q06 st28q01 st30q01 st30q02 st30q03 st30q04 st30q05 st30q06
  st30q07 st30q08 st31q01 st31q02 st31q03 st31q04 st31q05 st31q06 st31q07
  st31q08 st32q01 st32q02 st32q03 st32q04 st32q05 st32q06 st32q07 st32q08
  st32q09 st32q10 st34q01 st34q02 st34q03 st34q04 st34q05 st34q06 st34q07
  st34q08 st34q09 st34q10 st34q11 st34q12 st34q13 st34q14 st37q01 st37q02
  st37q03 st37q04 st37q05 st37q06 st37q07 st37q08 st37q09 st37q10 st38q01
  st38q02 st38q03 st38q04 st38q05 st38q06 st38q07 st38q08 st38q09 st38q10
  st38q11 ec01q01 ec02q01 ec03q01 ec04q01 ec05q01 ec06q01 ec07q02 ic01q01
  ic01q02 ic01q03 ic02q01 ic03q01 ic04q01 ic04q02 ic04q03 ic05q01 ic05q02
  ic05q03 ic05q04 ic05q05 ic05q06 ic05q07 ic05q08 ic05q09 ic05q10 ic05q11
  ic05q12 ic06q01 ic06q02 ic06q03 ic06q04 ic06q05 ic06q06 ic06q07 ic06q08
  ic06q09 ic06q10 ic06q11 ic06q12 ic06q13 ic06q14 ic06q15 ic06q16 ic06q17
  ic06q18 ic06q19 ic06q20 ic06q21 ic06q22 ic06q23 ic07q01 ic07q02 ic07q03
  ic07q04 ic08q01 ic09q01 iscedl iscedd iscedo (f1.0).
missing values ESCS (999).
missing values LANG (7,8,9).
missing values homepos (999).
Missing values ec06q02 ('9997','9998','9999').
missing values pared (99).
missing values st17q14 to st17q16 ('99997','99998','99999').
Format ST15Q04 EC07Q01 EC07Q03 PCMATH (f8.3).
format MMINS TMINS (f5.0).
Format ST21Q01 (f5.1). 
Format ST29Q01 ST29Q02 ST29Q03 ST29Q04 ST29Q05 ST29Q06  ST33Q01 ST33Q02 ST33Q03 ST33Q04 ST33Q05 ST33Q06 
  ST35Q02 ST35Q03 ST36Q01(F3.0). 
Format sc07q01  (f3.0).
Format AGE (F5.2).
Format BMMJ BFMJ BSMJ GRADE (f2.0).
Format FAMSTRUC misced fisced HISCED immig sisced   MSECateg FSECateg HSECateg  SSECateg  st11R01  ST13R01  (f1.0).
format HISEI (f2.0).
format RMHMWK to  ATTCOMP  PV1MATH to w_fstuwt  w_fstr1 to w_fstr80 (f9.4).
format wvarstrr (f2.0).
format unit (f1.0).
format ESCS (f10.5).
format cntfac1 cntfac2 (f14.10).
format homepos  (f9.4).
format pared (f2.0).
format UH  (f1.0).
missing values CLCUSE3a CLCUSE3b (997,998,999).
format CLCUSE3a CLCUSE3b (f5.0).
exe.

value labels SUBNATIO
  '0360'  'Australia'
  '0400'  'Austria'
  '0560'  'Belgium'
  '0760'  'Brazil'
  '1240'  'Canada'
  '2030'  'Czech Republic'
  '2080'  'Denmark'
  '2460'  'Finland'
  '2500'  'France'
  '2760'  'Germany'
  '3000'  'Greece'
  '3440'  'Hong Kong SAR'
  '3480'  'Hungary'
  '3520'  'Iceland'
  '3600'  'Indonesia'
  '3720'  'Ireland'
  '3801'  'Italy: Veneto-Nord Est'
  '3802'  'Italy: Trento-Nord-Est '
  '3803'  'Italy: Toscana-Centro'
  '3804'  'Italy: Piemonte-Nord-Ovest '
  '3805'  'Italy: Lombardia-Nord Ovest '
  '3806'  'Italy: Bolzano'
  '3807'  'Italy: Other regions'
  '3920'  'Japan'
  '4100'  'Korea'
  '4280'  'Latvia'
  '4380'  'Liechtenstein'
  '4420'  'Luxembourg'
  '4460'  'Macao SAR'
  '4840'  'Mexico'
  '5280'  'Netherlands'
  '5540'  'New Zealand'
  '5780'  'Norway'
  '6160'  'Poland'
  '6200'  'Portugal'
  '6430'  'Russian Federation'
  '7030'  'Slovak Republic'
  '7241'  'Spain: Other regions'
  '7242'  'Spain: Castilia y Leon'
  '7243'  'Spain: Catalonia'
  '7244'  'Spain: Basque Country'
  '7520'  'Sweden'
  '7560'  'Switzerland'
  '7640'  'Thailand'
  '7880'  'Tunisia'
  '7920'  'Turkey'
  '8261'  'United Kingdom: England, Wales & NI'
  '8262'  'United Kingdom: Scotland'
  '8400'  'United States'
  '8580'  'Uruguay'
  '8910'  'Yugoslavia'.


value labels LANGN
  "036001"  "AUS: English"
  "036002"  "AUS: Indigenous Australian languages"
  "036003"  "AUS: Italian"
  "036004"  "AUS: Greek"
  "036005"  "AUS: Cantonese"
  "036006"  "AUS: Mandarin"
  "036007"  "AUS: Arabic"
  "036008"  "AUS: Vietnamese"
  "036009"  "AUS: German"
  "036010"  "AUS: Spanish"
  "036011"  "AUS: Tagalog (Philippines)"
  "036012"  "AUS: Other languages"
  "040001"  "AUT: German"
  "040002"  "AUT: Turkish"
  "040003"  "AUT: Serbo-Croat"
  "040004"  "AUT: Romanian"
  "040005"  "AUT: Polish"
  "040006"  "AUT: Hungarian"
  "040007"  "AUT: Albanian"
  "040008"  "AUT: Czech"
  "040009"  "AUT: Slovak"
  "040010"  "AUT: Slovenian"
  "040011"  "AUT: Other languages"
  "056101"  "BEL (Fl.): Dutch"
  "056102"  "BEL (Fl.): French"
  "056103"  "BEL (Fl.): German"
  "056104"  "BEL (Fl.): Flemish dialect"
  "056105"  "BEL (Fl.): English"
  "056106"  "BEL (Fl.): Other EU languages"
  "056107"  "BEL (Fl.): Arabic"
  "056108"  "BEL (Fl.): Turkish"
  "056109"  "BEL (Fl.): Eastern European languages"
  "056110"  "BEL (Fl.): Other languages"
  "056201"  "BEL (Fr.): French"
  "056202"  "BEL (Fr.): Dutch"
  "056203"  "BEL (Fr.): German"
  "056204"  "BEL (Fr.): Wallon"
  "056205"  "BEL (Fr.): English"
  "056206"  "BEL (Fr.): Other EU languages"
  "056207"  "BEL (Fr.): Arabic"
  "056208"  "BEL (Fr.): Turkish"
  "056209"  "BEL (Fr.): Eastern European languages"
  "056210"  "BEL (Fr.): Other languages"
  "056301"  "BEL (German): German"
  "056302"  "BEL (German): French"
  "056303"  "BEL (German): Dutch"
  "056304"  "BEL (German): Wallon"
  "056305"  "BEL (German): English"
  "056306"  "BEL (German): Other EU languages"
  "056307"  "BEL (German): Arabic"
  "056309"  "BEL (German): Eastern European languages"
  "076001"  "BRA: Portuguese"
  "076002"  "BRA: Other national language - indigenous"
  "076003"  "BRA: Other languages"
  "124101"  "CAN: English"
  "124102"  "CAN: French"
  "124103"  "CAN: Other languages"
  "203001"  "CZE: Czech"
  "203002"  "CZE: Slovak"
  "203003"  "CZE: Romani"
  "203004"  "CZE: Other languages"
  "208001"  "DNK: Danish"
  "208002"  "DNK: Turkish"
  "208003"  "DNK: Serbo-Croatian"
  "208004"  "DNK: Punjabi"
  "208005"  "DNK: Urdu"
  "208006"  "DNK: Arabic"
  "208007"  "DNK: Other languages"
  "246001"  "FIN: Finnish"
  "246002"  "FIN: Swedish"
  "246003"  "FIN: Sami"
  "246004"  "FIN: Romani"
  "246005"  "FIN: Russian"
  "246006"  "FIN: Estonian"
  "246007"  "FIN: Other language"
  "250001"  "FRA: French"
  "250002"  "FRA: Other national dialects or languages"
  "250003"  "FRA: Other languages"
  "276001"  "DEU: German"
  "276004"  "DEU: Bosnian"
  "276005"  "DEU: Greek"
  "276006"  "DEU: Italian"
  "276007"  "DEU: Croatian"
  "276008"  "DEU: Polish"
  "276009"  "DEU: Russian"
  "276010"  "DEU: Serbian"
  "276011"  "DEU: Turkish"
  "276012"  "DEU: Kurdish"
  "276013"  "DEU: Other languages"
  "300001"  "GRC: Greek"
  "300002"  "GRC: Albanian"
  "300003"  "GRC: Languages of the former USSR"
  "300004"  "GRC: Bulgarian"
  "300005"  "GRC: Other languages"
  "344001"  "HKG: Cantonese"
  "344002"  "HKG: English"
  "344003"  "HKG: Other national dialects or languages"
  "344004"  "HKG: Other languages"
  "348001"  "HUN: Hungarian"
  "348002"  "HUN: Other languages"
  "352001"  "ISL: Icelandic"
  "352002"  "ISL: Other languages"
  "360001"  "IDN: Bahasa Indonesian"
  "360002"  "IDN: Other dialects, local languages"
  "360003"  "IDN: Other languages"
  "372001"  "IRL: English"
  "372002"  "IRL: Irish"
  "372003"  "IRL: Other languages"
  "380001"  "ITA: Italian"
  "380002"  "ITA: Other official languages"
  "380003"  "ITA: National dialects"
  "380004"  "ITA: English or another EU language"
  "380005"  "ITA: Other languages"
  "380701"  "ITA (German): German"
  "380702"  "ITA (German): Other official languages"
  "380703"  "ITA (German): National dialects"
  "380704"  "ITA (German): English or another EU language"
  "380705"  "ITA (German): Other languages" 
  "392001"  "JPN: Japanese"
  "392002"  "JPN: Other languages"
  "410001"  "KOR: Korean"
  "410002"  "KOR: Other languages"
  "428001"  "LVA: Latvian"
  "428002"  "LVA: Russian"
  "428003"  "LVA: Belarusian"
  "428004"  "LVA: Ukrainian"
  "428005"  "LVA: Other languages"
  "438001"  "LIE: Swiss German"
  "438002"  "LIE: German"
  "438003"  "LIE: French"
  "438004"  "LIE: Swiss Italian"
  "438005"  "LIE: Italian"
  "438006"  "LIE: romance"
  "438007"  "LIE: Spanish"
  "438008"  "LIE: Portuguese"
  "438009"  "LIE: South Slavic languages"
  "438010"  "LIE: Albanian"
  "438011"  "LIE: Turkish"
  "438012"  "LIE: English"
  "438013"  "LIE: Other languagess"
  "442001"  "LUX: German"
  "442002"  "LUX: French"
  "442003"  "LUX: Luxembourgian"
  "442004"  "LUX: Portuguese"
  "442005"  "LUX: Italian"
  "442006"  "LUX: Yugoslavian - Serbian, Croatian, etc"
  "442007"  "LUX: Other languages"
  "446001"  "MAC: Cantonese"
  "446002"  "MAC: Portugese"
  "446003"  "MAC: Other national dialects"
  "446004"  "MAC: English"
  "446005"  "MAC: Other languages"
  "484001"  "MEX: Spanish"
  "484002"  "MEX: American-Indian"
  "484003"  "MEX: English"
  "484004"  "MEX: French"
  "484005"  "MEX: German"
  "484006"  "MEX: Other languages"
  "528001"  "NLD: Dutch"
  "528003"  "NLD: Dutch regional languages or dialects"
  "528004"  "NLD: Other European languages"
  "528005"  "NLD: Other non-European languages"
  "554001"  "NZL: English"
  "554002"  "NZL: Te Reo Maori"
  "554003"  "NZL: Samoan"
  "554004"  "NZL: Tongan"
  "554005"  "NZL: Mandarin"
  "554006"  "NZL: Cantonese"
  "554007"  "NZL: Hindi"
  "554008"  "NZL: Other languages"
  "036097"  "AUS: N/A"
  "036098"  "AUS: Invalid"
  "036099"  "AUS: Missing"
  "040097"  "AUT: N/A"
  "040098"  "AUT: Invalid"
  "040099"  "AUT: Missing"
  "056197"  "BEL (Fl.):  N/A"
  "056198"  "BEL (Fl.):  Invalid"
  "056199"  "BEL (Fl.):  Missing"
  "056297"  "BEL (Fr.):  N/A"
  "056298"  "BEL (Fr.):  Invalid"
  "056299"  "BEL (Fr.):  Missing"
  "076097"  "BRA: N/A"
  "076098"  "BRA: Invalid"
  "076099"  "BRA: Missing"
  "124197"  "CAN: N/A"
  "124198"  "CAN: Invalid"
  "124199"  "CAN: Missing"
  "203097"  "CZE: N/A"
  "203098"  "CZE: Invalid"
  "203099"  "CZE: Missing"
  "208097"  "DNK:  N/A"
  "208098"  "DNK:  Invalid"
  "208099"  "DNK:  Missing"
  "246097"  "FIN: N/A"
  "246098"  "FIN: Invalid"
  "246099"  "FIN: Missing"
  "724001"  "ESP: Castilian"
  "724002"  "ESP: Catalonian"
  "724003"  "ESP: Galician"
  "724004"  "ESP: Valencian"
  "724005"  "ESP: Basque"
  "724006"  "ESP: Other languagess"
  "752001"  "SWE: Swedish"
  "752002"  "SWE: Finnish, Yiddish, Romani, Sami or Tornedalen"
  "752003"  "SWE: Other languages"
  "756101"  "CHE (French): Swiss German"
  "756102"  "CHE (French): German"
  "756103"  "CHE (French): French"
  "756104"  "CHE (French): Swiss Italian"
  "756105"  "CHE (French): Italian"
  "756106"  "CHE (French): Romansch"
  "756107"  "CHE (French): Spanish"
  "756108"  "CHE (French): Portuguese"
  "756109"  "CHE (French): South Slavic languages"
  "756110"  "CHE (French): Albanian"
  "756111"  "CHE (French): Turkish"
  "756112"  "CHE (French): English"
  "756113"  "CHE (French): Other languages"
  "756201"  "CHE (German): Swiss German"
  "756202"  "CHE (German): German"
  "756203"  "CHE (German): French"
  "756204"  "CHE (German): Swiss Italian"
  "756205"  "CHE (German): Italian"
  "756206"  "CHE (German): romance"
  "756207"  "CHE (German): Spanish"
  "756208"  "CHE (German): Portuguese"
  "756209"  "CHE (German): South Slavic languages"
  "756210"  "CHE (German): Albanian"
  "756211"  "CHE (German): Turkish"
  "756212"  "CHE (German): English"
  "756213"  "CHE (German): Other languagess"
  "756301"  "CHE (Italian): Swiss German"
  "756302"  "CHE (Italian): German"
  "756303"  "CHE (Italian): French"
  "756304"  "CHE (Italian): Swiss Italian"
  "756305"  "CHE (Italian): Italian"
  "756306"  "CHE (Italian): romance"
  "756307"  "CHE (Italian): Spanish"
  "756308"  "CHE (Italian): Portuguese"
  "756309"  "CHE (Italian): South Slavic languages"
  "756310"  "CHE (Italian): Albanian"
  "756311"  "CHE (Italian): Turkish"
  "756312"  "CHE (Italian): English"
  "756313"  "CHE (Italian): Other languages"
  "250097"  "FRA:  N/A"
  "250099"  "FRA:  Missing"
  "276097"  "DEU: N/A"
  "276098"  "DEU: Invalid"
  "276099"  "DEU: Missing"
  "300097"  "GRC: N/A"
  "300098"  "GRC: Invalid"
  "300099"  "GRC: Missing"
  "344097"  "HKG:  N/A"
  "344098"  "HKG:  Invalid"
  "344099"  "HKG:  Missing"
  "344298"  "HKI:  Invalid"
  "348097"  "HUN:  N/A"
  "348098"  "HUN:  Invalid"
  "348099"  "HUN:  Missing"
  "352097"  "ISL: N/A"
  "352098"  "ISL: Invalid"
  "352099"  "ISL: Missing"
  "360097"  "IDN: N/A"
  "360098"  "IDN: Invalid"
  "360099"  "IDN: Missing"
  "826101"  "GBR (Eng., Wales, NI): English"
  "826102"  "GBR (Eng., Wales, NI): Irish"
  "826103"  "GBR (Eng., Wales, NI): Ulster Scots"
  "826104"  "GBR (Eng., Wales, NI): Welsh"
  "826105"  "GBR (Eng., Wales, NI): Other languages"
  "826201"  "GBR (Scotland): English or Scots"
  "826202"  "GBR (Scotland): Gaelic"
  "826204"  "GBR (Scotland): Arabic"
  "826205"  "GBR (Scotland): Bengali"
  "826206"  "GBR (Scotland): Cantonese or Mandarin"
  "826207"  "GBR (Scotland): Gujarati"
  "826208"  "GBR (Scotland): Hindi"
  "826209"  "GBR (Scotland): Malay"
  "826210"  "GBR (Scotland): Punjabi"
  "826211"  "GBR (Scotland): Urdu"
  "826212"  "GBR (Scotland): Other European languages"
  "826213"  "GBR (Scotland): Other non-European languages"
  "372097"  "IRL: N/A"
  "372098"  "IRL: Invalid"
  "372099"  "IRL: Missing"
  "380097"  "ITA: N/A"
  "380098"  "ITA: Invalid"
  "380099"  "ITA: Missing"
  "380797"  "ITA (German):  N/A"
  "380798"  "ITA (German):  Invalid"
  "392097"  "JPN: N/A"
  "392098"  "JPN: Invalid"
  "392099"  "JPN: Missing"
  "410097"  "KOR:  N/A"
  "410098"  "KOR:  Invalid"
  "410099"  "KOR:  Missing"
  "428097"  "LVA:  N/A"
  "428098"  "LVA:  Invalid"
  "428099"  "LVA:  Missing"
  "438098"  "LIE:  Invalid"
  "438099"  "LIE:  Missing"
  "056398"  "BEL (German):  Invalid"
  "056399"  "BEL (German):  Missing"
  "442097"  "LUX:  N/A"
  "442098"  "LUX:  Invalid"
  "442099"  "LUX:  Missing"
  "446098"  "MAC:  Invalid"
  "446099"  "MAC:  Missing"
  "484097"  "MEX:  N/A"
  "484098"  "MEX:  Invalid"
  "484099"  "MEX:  Missing"
  "528097"  "NLD: N/A"
  "528098"  "NLD: Invalid"
  "528099"  "NLD: Missing"
  "554097"  "NZL:  N/A"
  "554098"  "NZL:  Invalid"
  "554099"  "NZL:  Missing"
  "578001"  "NOR: Norwegian"
  "578002"  "NOR: Sami"
  "578003"  "NOR: Swedish"
  "578004"  "NOR: Danish"
  "578005"  "NOR: Other languages"
  "578097"  "NOR: N/A"
  "578098"  "NOR: Invalid"
  "578099"  "NOR: Missing"
  "616099"  "POL: Missing"
  "620097"  "PRT: N/A"
  "620098"  "PRT: Invalid"
  "620099"  "PRT: Missing"
  "616001"  "POL: Polish"
  "616002"  "POL: Other languages"
  "620001"  "PRT: Portuguese"
  "620002"  "PRT: Other languages"
  "643001"  "RUS: Russian"
  "643002"  "RUS: Other languages"
  "703001"  "SVK: Slovak"
  "703002"  "SVK: Hungarian"
  "703004"  "SVK: Czech"
  "703005"  "SVK: Other Slavonic languages"
  "703006"  "SVK: Romani"
  "703007"  "SVK: Other languages"
  "764001"  "THA: Thai central"
  "764002"  "THA: Other Thai dialects"
  "764003"  "THA: Other languages"
  "788001"  "TUN: Arabic"
  "788002"  "TUN: Arabic, Tunisian dialect"
  "788003"  "TUN: French"
  "788004"  "TUN: Other languages"
  "792001"  "TUR: Turkish"
  "792002"  "TUR: Other national dialects or languages"
  "792003"  "TUR: English"
  "792004"  "TUR: French"
  "792005"  "TUR: German"
  "792006"  "TUR: Other languages"
  "858001"  "URY: Spanish"
  "858002"  "URY: Portuguese"
  "858003"  "URY: English"
  "858004"  "URY: Other languages"
  "840001"  "USA: English"
  "840002"  "USA: Spanish"
  "840003"  "USA: Other languages"
  "891001"  "YUG: Serbian"
  "891002"  "YUG: Hungarian"
  "891003"  "YUG: Albanian"
  "891004"  "YUG: Romanian"
  "891005"  "YUG: Slovak"
  "891006"  "YUG: Other languages"
  "643097"  "RUS: N/A"
  "643098"  "RUS: Invalid"
  "643099"  "RUS: Missing"
  "724097"  "ESP: N/A"
  "724098"  "ESP: Invalid"
  "724099"  "ESP: Missing"
  "703097"  "SVK: N/A"
  "703098"  "SVK: Invalid"
  "703099"  "SVK: Missing"
  "752097"  "SWE: N/A"
  "752098"  "SWE: Invalid"
  "752099"  "SWE: Missing"
  "756197"  "CHE (French):  N/A"
  "756198"  "CHE (French):  Invalid"
  "756199"  "CHE (French):  Missing"
  "756297"  "CHE (German):  N/A"
  "756298"  "CHE (German):  Invalid"
  "756299"  "CHE (German):  Missing"
  "756397"  "CHE (Italian): N/A"
  "756398"  "CHE (Italian): Invalid"
  "756399"  "CHE (Italian): Missing"
  "764099"  "THA: Missing"
  "788097"  "TUN:  N/A"
  "788098"  "TUN:  Invalid"
  "788099"  "TUN:  Missing"
  "792097"  "TUR: N/A"
  "792098"  "TUR: Invalid"
  "792099"  "TUR: Missing"
  "826197"  "GBR (Eng., Wales, NI):  N/A"
  "826198"  "GBR (Eng., Wales, NI):  Invalid"
  "826199"  "GBR (Eng., Wales, NI):  Missing"
  "826297"  "GBR (Scotland):  N/A"
  "826298"  "GBR (Scotland):  Invalid"
  "826299"  "GBR (Scotland):  Missing"
  "840097"  "USA: N/A"
  "840098"  "USA: Invalid"
  "840099"  "USA: Missing"
  "858097"  "URY: N/A"
  "858098"  "URY: Invalid"
  "858099"  "URY: Missing"
  "891097"  "YUG: N/A"
  "891098"  "YUG: Invalid"
  "891099"  "YUG: Missing".

VALUE LABELS ISO_S ISO_M ISO_F
  "03608261"  "AUS: England"
  "03608262"  "AUS: Scotland"
  "03609996"  "AUS: Other"
  "04000391"  "AUT: Yugoslavia"
  "04009996"  "AUT: Other"
  "05610021"  "BFL: An African country (not Maghreb)"
  "05610151"  "BFL: A Maghreb country"
  "05611501"  "BFL: An other country of the EU"
  "05619996"  "BFL: Other"
  "05620021"  "BFR: An African country (not Maghreb)"
  "05620151"  "BFR: A Maghreb country"
  "05621501"  "BFR: Another country of the EU"
  "05629996"  "BFR: Other"
  "07609996"  "BRA: Other"
  "12419996"  "CAE: Other"
  "12429996"  "CAF: Other"
  "12439996"  "CAN: Other"
  "20309996"  "CZE: Other"
  "20800391"  "DNK: The former Yuguslavia"
  "20809996"  "DNK: Other"
  "24609996"  "FIN: Other"
  "25009996"  "FRA: Other"
  "27601501"  "DEU: Russia, Kazakhstan or another former Soviet republic"
  "27608911"  "DEU: Montenegro"
  "27608912"  "DEU: Serbia"
  "27609996"  "DEU: Other"
  "30001501"  "GRC: Country that belonged to the USSR"
  "30009996"  "GRC: Other "
  "34409996"  "HKG: Other "
  "34809996"  "HUN: Other "
  "35209996"  "ISL: Other"
  "36009996"  "IDN: Other "
  "37200701"  "IRL: Bosnia"
  "37203761"  "IRL: Palestine"
  "37208261"  "IRL: Northern Ireland"
  "37208262"  "IRL: Great Britain"
  "37209996"  "IRL: Other"
  "38001501"  "ITA: In an European country that is not member of the EU "
  "38009996"  "ITA: Other"
  "39209996"  "JPN: Other"
  "41009996"  "KOR: Other"
  "42809996"  "LVA: Other"
  "44209996"  "LUX: Other"
  "44609996"  "MAC: Other"
  "48409996"  "MEX: Other"
  "52801501"  "NLD: Other European country"
  "52809996"  "NLD: Other"
  "55409996"  "NZL: Other"
  "57809996"  "NOR: Other"
  "61609996"  "POL: Other"
  "62009996"  "PRT: Other"
  "64301501"  "RUS: Former USSR republics"
  "64309996"  "RUS: Other"
  "70301501"  "SVK: In other country of Europe"
  "70309996"  "SVK: Other"
  "72419996"  "ESC: Other"
  "72429996"  "ECL: Other"
  "72439996"  "ECT: Other"
  "72449996"  "EBS: Other"
  "75209996"  "SWE: Other"
  "75600391"  "CHE: Ex-Yugoslavia"
  "75600392"  "CHE: Albania or Kosovo"
  "75601551"  "CHE: Germany or Austria"
  "75601552"  "CHE: France or Belgium"
  "75607560"  "CHE: Switzerland"
  "75609996"  "CHE: Other"
  "76409996"  "THA: Other"
  "78809996"  "TUN: Other"
  "79209996"  "TUR: Other"
  "82619996"  "GRB: Other"
  "82620301"  "SCO: China (incl Hong Kong)"
  "82621421"  "SCO: Middle East"
  "82621501"  "SCO: Other European country"
  "82628261"  "SCO: England, Wales, N Ireland"
  "82628262"  "SCO: Scotland "
  "82629996"  "SCO: Other "
  "84009996"  "USA: Other"
  "85809996"  "URY: Other"
  "89101491"  "YUG: The former Yugoslavia"
  "89109996"  "YUG: Other"
  "99990020"  "Africa"
  "99990080"  "Albania"
  "99990290"  "Caribbean"
  "99990320"  "Argentina "
  "99990360"  "Australia"
  "99990400"  "Austria"
  "99990500"  "Bangladesh"
  "99990560"  "Belgium"
  "99990600"  "Bermuda"
  "99990700"  "Bosnia-Herzegovina "
  "99990760"  "Brazil "
  "99991000"  "Bulgaria"
  "99991040"  "Myanmar (Burma)"
  "99991120"  "Belarus"
  "99991240"  "Canada"
  "99991440"  "Sri Lanka"
  "99991490"  "Ex-Yugoslavia"
  "99991510"  "An East-European country"
  "99991560"  "China"
  "99991840"  "Cook Islands"
  "99991910"  "Croatia"
  "99992030"  "Czech Republic"
  "99992080"  "Denmark "
  "99992330"  "Estonia "
  "99992420"  "Fiji"
  "99992460"  "Finland "
  "99992500"  "France"
  "99992680"  "Georgia"
  "99992760"  "Germany"
  "99993000"  "Greece"
  "99993440"  "Hong Kong"
  "99993480"  "Hungary"
  "99993520"  "Iceland"
  "99993560"  "India"
  "99993600"  "Indonesia"
  "99993640"  "Iran"
  "99993680"  "Iraq"
  "99993720"  "Ireland"
  "99993800"  "Italy"
  "99993880"  "Jamaica"
  "99993920"  "Japan"
  "99994000"  "Jordan"
  "99994100"  "Korea"
  "99994220"  "Lebanon"
  "99994280"  "Latvia"
  "99994340"  "Libya"
  "99994400"  "Lithuania"
  "99994420"  "Luxembourg"
  "99994460"  "Macau"
  "99994580"  "Malaysia"
  "99994840"  "Mexico"
  "99995160"  "Namibia"
  "99995280"  "Netherlands"
  "99995540"  "New Zealand"
  "99995660"  "Nigeria"
  "99995780"  "Norway"
  "99995860"  "Pakistan"
  "99996080"  "Philippines"
  "99996160"  "Poland "
  "99996200"  "Portugal"
  "99996420"  "Romania"
  "99996430"  "Russia"
  "99996820"  "Saudi Arabia"
  "99997030"  "Slovakia"
  "99997040"  "Vietnam"
  "99997050"  "Slowenia"
  "99997100"  "South Africa "
  "99997160"  "Zimbabwe"
  "99997240"  "Spain"
  "99997520"  "Sweden"
  "99997560"  "Switzerland  "
  "99997640"  "Thailand"
  "99997760"  "Tonga"
  "99997880"  "Tunisia"
  "99997920"  "Turkey"
  "99998040"  "Ukraine"
  "99998070"  "Macedonia"
  "99998180"  "Egypt"
  "99998260"  "United Kingdom"
  "99998340"  "Tanzania"
  "99998400"  "United States"
  "99998580"  "Uruguay "
  "99998820"  "Samoa"
  "99998910"  "Yugoslavia"
  "99998940"  "Zambia".

value labels ec06q02
  '0361' 'Australia: High level maths course'
  '0362' 'Australia: Medium level maths course'
  '0363' 'Australia: Low level maths course'
  '2761' 'Germany: High level maths course'
  '2762' 'Germany: Medium level maths course'
  '2763' 'Germany: Low level maths course'
  '3001' 'Greece: Advanced level maths course'
  '3002' 'Greece: Medium level maths course'
  '3003' 'Greece: Basic level maths course'
  '3481' 'Hungary: Special or high level maths course'
  '3482' 'Hungary: Normal maths course'
  '3521' 'Iceland: Fast track maths course'
  '3522' 'Iceland: Medium track maths course'
  '3523' 'Iceland: Slow track maths course'
  '4101' 'Korea: High level maths course'  
  '4102' 'Korea: Medium level maths course'  
  '4103' 'Korea: Basic level maths course'
  '7031' 'Slovak Rep.: Extended maths teaching'
  '7032' 'Slovak Rep.: Normal maths teaching'
  '7033' 'Slovak Rep.: Reduced maths teaching'
  '8261' 'Scotland: Nat. Qualifications higher'
  '8262' 'Scotland: Intermediate/Access, standard grade'
  '9997' 'N/A'
  '9998' 'Invalid'
  '9999' 'Missing'.

value labels country
 '008' 'Albania'
 '032' 'Argentina'
 '036' 'Australia '
 '040' 'Austria '
 '056' 'Belgium '
 '076' 'Brazil '
 '100' 'Bulgaria'
 '124' 'Canada '
 '152' 'Chile'
 '203' 'Czech Republic '
 '208' 'Denmark '
 '246' 'Finland '
 '250' 'France '
 '276' 'Germany '
 '300' 'Greece '
 '344' 'Hong Kong (China)'
 '348' 'Hungary '
 '352' 'Iceland '
 '360' 'Indonesia '
 '372' 'Ireland '
 '376' 'Israel'
 '380' 'Italy '
 '392' 'Japan '
 '410' 'Korea '
 '428' 'Latvia '
 '438' 'Liechtenstein '
 '442' 'Luxembourg '
 '446' 'Macao (China)'
 '484' 'Mexico '
 '528' 'Netherlands '
 '554' 'New Zealand '
 '578' 'Norway '
 '604' 'Peru '
 '616' 'Poland '
 '620' 'Portugal '
 '643' 'Russian Federation '
 '703' 'Slovakia '
 '724' 'Spain '
 '752' 'Sweden '
 '756' 'Switzerland '
 '764' 'Thailand '
 '788' 'Tunisia '
 '792' 'Turkey '
 '807' 'Macedonia'
 '826' 'United Kingdom'
 '840' 'United States '
 '858' 'Uruguay '
 '891' 'Yugoslavia '.

value labels st17q14
 '04001'  'Austria: DVD'
 '04002'  'Austria: No DVD'
 '05611'  'Belgium (Fl.): DVD'
 '05612'  'Belgium (Fl.): No DVD'
 '05621'  'Belgium (Fr.): DVD'
 '05622'  'Belgium (Fr.): No DVD'
 '20301'  'Czech Republic: Own mobile phone'
 '20302'  'Czech Republic: No own mobile phone'
 '27601'  'Germany: Own garden'
 '27602'  'Germany: No own garden'
 '30001'  'Greece: Video camera'
 '30002'  'Greece: No Video camera'
 '34401'  'Hong Kong: Encyclopedia '
 '34402'  'Hong Kong: No encyclopedia'
 '34801'  'Hungary: Video casette recorder'
 '34802'  'Hungary: No video casette recorder'
 '37201'  'Ireland: Games console'
 '37202'  'Ireland: No games console'
 '38001'  'Italy: Ancient furniture'
 '38002'  'Italy: No ancient furniture'
 '41001'  'Korea: DVD'
 '41002'  'Korea: No DVD'
 '44201'  'Luxembourg: Satellite dish'
 '44202'  'Luxembourg: No satellite dish'
 '44601'  'Macao: Encyclopedia '
 '44602'  'Macao: No encyclopedia'
 '55401'  'New Zealand: Clothes dryer'
 '55402'  'New Zealand: No clothes dryer'
 '57801'  'Norway: Swimming pool'
 '57802'  'Norway: No swimming pool'
 '61601'  'Poland: Satellite or cable TV (> 29 channels)'
 '61602'  'Poland: No satellite or cable TV (> 29 channels)'
 '72401'  'Spain: Video'
 '72402'  'Spain: No video'
 '75601'  'Switzerland: Musical instrument'
 '75602'  'Switzerland: No musical instrument'
 '78801'  'Tunisia: Telephone'
 '78802'  'Tunisia: No telephone'
 '79201'  'Turkey: Central heating system'
 '79202'  'Turkey: No central heating system'
 '82621'  'Scotland: Musical instruments'
 '82622'  'Scotland: No musical instruments'
 '85801'  'Uruguay: Freezer'
 '85802'  'Uruguay: No freezer'
 '99997' 'N/A'
'99998' 'Invalid'
'99999' 'Missing'.

value labels st17q15
 '04001'  'Austria: MP3 player'
 '04002'  'Austria: No MP3 player'
 '05611'  'Belgium (Fl.): Swimming pool'
 '05612'  'Belgium (Fl.): No swimming pool'
 '20301'  'Czech Republic: Your own discman or mp3 player'
 '20302'  'Czech Republic: No own discman or mp3 player'
 '30001'  'Greece: HiFi equipment'
 '30002'  'Greece: No HiFi equipment'
 '34401'  'Hong Kong: Musical instrument (e.g., piano, violin) '
 '34402'  'Hong Kong: No musical instrument (e.g., piano, violin) '
 '34801'  'Hungary: CD player'
 '34802'  'Hungary: No CD player'
 '37201'  'Ireland: VCR or DVD'
 '37202'  'Ireland: No VCR or DVD'
 '38001'  'Italy: DVD player'
 '38002'  'Italy: No DVD player'
 '44201'  'Luxembourg: Own television set'
 '44202'  'Luxembourg: No own television set'
 '44601'  'Macao: Musical instrument (e.g., piano, violin) '
 '44602'  'Macao: No musical instrument (e.g., piano, violin) '
 '55401'  'New Zealand: DVD'
 '55402'  'New Zealand: No DVD'
 '57801'  'Norway: Housekeeper'
 '57802'  'Norway: No housekeeper'
 '61601'  'Poland: VCR or DVD'
 '61602'  'Poland: No VCR or DVD'
 '72401'  'Spain: DVD'
 '72402'  'Spain: No DVD'
 '78801'  'Tunisia: Electricity'
 '78802'  'Tunisia: No electricity'
 '79201'  'Turkey: Washing machine'
 '79202'  'Turkey: No washing machine'
 '82621'  'Scotland: Cable/satellite TV'
 '82622'  'Scotland: No Cable/satellite TV'
 '85801'  'Uruguay: DVD '
 '85802'  'Uruguay: No DVD '
 '99997' 'N/A'
 '99998' 'Invalid'
 '99999' 'Missing'.

value labels st17q16
 '04001'  'Austria: Digital camera'
 '04002'  'Austria: No digital camera'
 '05611'  'Belgium (Fl.): CDs with classical music'
 '05612'  'Belgium (Fl.): No CDs with classical music'
 '30001'  'Greece: Air conditioning'
 '30002'  'Greece: No air conditioning'
 '34801'  'Hungary: DVD'
 '34802'  'Hungary: No DVD'
 '38001'  'Italy: Musical instrument (except flute)'
 '38002'  'Italy: No musical instrument (except flute)'
 '44201'  'Luxembourg: Own mobile phone'
 '44202'  'Luxembourg: No own mobile phone'
 '72401'  'Spain: Video console (Playstation, X-Box, Nintendo, etc.)'
 '72402'  'Spain: No video console (Playstation, X-Box, Nintendo, etc.)'
 '78801'  'Tunisia: Running water'
 '78802'  'Tunisia: No running water'
 '79201'  'Turkey: Vacuum cleaner'
 '79202'  'Turkey: No vacuum cleaner'
 '82621'  'Scotland: Kitchen range (eg AGA, Rayburn)'
 '82622'  'Scotland: No kitchen range (eg AGA, Rayburn)'
 '85801'  'Uruguay: Water heater'
 '85802'  'Uruguay: No water heater'
 '99997' 'N/A'
 '99998' 'Invalid'
 '99999' 'Missing'.

value label PROGN
  '036001'  'AUS: <Year 10 in a general academic program '
  '036002'  'AUS: <Year 10 in a general program (vocational)'
  '036003'  'AUS: Year 11 or 12 in a general academic program'
  '036004'  'AUS: Year 11 or 12 in a VET (vocational) course'
  '040002'  'AUT: Hauptschule (Lower Secondary school)'
  '040003'  'AUT: Polytechnische Schule (Vocational)'
  '040004'  'AUT: Sonderschule (Special school (lower sec.))'
  '040005'  'AUT: Sonderschul-Oberstufe (Special school (upper sec.))'
  '040006'  'AUT: AHS-Unterstufe (Gymnasium Lower Secondary )'
  '040007'  'AUT: AHS-Oberstufe (Gymnasium Upper Secondary )'
  '040010'  'AUT: Berufsschule  (Apprenticeship)'
  '040011'  'AUT: BMS  (Medium vocational school )'
  '040012'  'AUT: Haushaltungs- und Hauswirtschaftsschulen (Medium voc.)'
  '040014'  'AUT: BHS  (Higher vocational school)'
  '040015'  'AUT: Anst. Der Kindergarten-/Sozialpadagogik (Voc. college)'
  '056111'  'BEL: 1st year A of 1st stage of General Education (Fl.)'
  '056112'  'BEL: 1st year B of 1st stage of General Education (Fl.)'
  '056113'  'BEL: 2nd year of 1st stage, prep. voc. sec. education (Fl.)'
  '056114'  'BEL: 2nd year of 1st stage, prep. reg. sec. education (Fl.)'
  '056115'  'BEL: 2nd & 3rd stage regular sec. education (Fl.)'
  '056116'  'BEL: 2nd & 3rd stage technical sec. education (Fl.)'
  '056117'  'BEL: 2nd & 3rd stage artistic sec. education (Fl.)'
  '056118'  'BEL: 2nd & 3rd stage vocational sec. ed. (Fl.)'
  '056119'  'BEL: Part-time vocational sec. ed. for labour market (Fl.)'
  '056120'  'BEL: Special sec. education (Fl.)'
  '056197'  'BEL: Missing (Fl.)'
  '056231'  'BEL: (1st grade of )General Education (Fr.)'
  '056232'  'BEL: Special needs (Fr.)'
  '056233'  'BEL: Vocational Education (Fr.)'
  '056234'  'BEL: Complementary year or programme for 1st degree  (Fr.)'
  '056235'  'BEL: General Education (Fr.)'
  '056236'  'BEL: Technical or Artistical Education (transition) (Fr.)'
  '056237'  'BEL: Technical  or Artistical  Education (qualif.) (Fr.)'
  '056238'  'BEL: Vocational Education (Fr.)'
  '056239'  'BEL: Vocational training for labour market (Fr.)'
  '056242'  'BEL: Special sec. education (form 3 or 4 - voc.) (Fr.)'
  '056244'  'BEL: Special sec. education form 3 (Germ.)'
  '056245'  'BEL: Part-time Vocational Education (Germ.)'
  '056246'  'BEL: Vocational Education (Germ.)'
  '056297'  'BEL: Missing (Fr.&Germ.)'
  '076001'  'BRA: Lower sec. education'
  '076002'  'BRA: Upper sec. education'
  '076097'  'BRA: Missing'
  '124102'  'CAN: Grades 7 - 9 '
  '124103'  'CAN: Grades 10  - 12 '
  '124197'  'CAN: Missing'
  '756001'  'CHE: sec. education, 1st stage'
  '756002'  'CHE: Preparatory course for vocational education'
  '756003'  'CHE: School prep. for the university entrance certificate'
  '756004'  'CHE: Vocational baccalaureat, dual system 3-4 years'
  '756005'  'CHE: Vocational education, dual system 3-4 years'
  '756006'  'CHE: Intermediate diploma school 3-4 years'
  '756007'  'CHE: Basic vocational education, dual system 1-2 years'
  '756008'  'CHE: Intermediate Diploma School'
  '756099'  'CHE: Missing '
  '203001'  'CZE: Basic school'
  '203002'  'CZE: 6, 8-year gymnasium & 8-year conservatory (lower sec.)'
  '203003'  'CZE: 6, 8-year gymnasium (upper sec.)'
  '203004'  'CZE: 4- year gymnasium'
  '203005'  'CZE: Voc/tech sec. school with maturate'
  '203006'  'CZE: Conservatory (upper sec.)'
  '203007'  'CZE: Voc/tech sec. school without maturate'
  '203008'  'CZE: Special schools'
  '203009'  'CZE: Practical schools, vocational education predominantly'
  '276001'  'DEU: Lower sec. access to upper sec. (compr., special educ.)'
  '276002'  'DEU: Lower sec. no access to upper sec. (Hauptschule)'
  '276003'  'DEU: Lower sec. no access to upper sec. (Realschule)'
  '276004'  'DEU: Lower sec. access to upper sec. (Gymnasium)'
  '276005'  'DEU: Lower sec. access to upper sec. (comprehensive)'
  '276006'  'DEU: Lower sec. no access to upper sec. (Koop. Gesamtschule)'
  '276009'  'DEU: Lower sec. no access to upper sec.'
  '276010'  'DEU: Lower sec. no access to upper sec.'
  '276011'  'DEU: Lower sec. no access to upper sec.'
  '276012'  'DEU: Lower sec. no access to upper sec.'
  '276013'  'DEU: Lower sec. with access to upper sec. (comprehensive)'
  '276014'  'DEU: pre-vocational training year'
  '276015'  'DEU: Vocational school (Berufsschule)'
  '276016'  'DEU: Vocational school (Berufsfachschule)'
  '276017'  'DEU: Upper sec. (Gymnasium)'
  '276018'  'DEU: Upper sec. (comprehensive)'
  '276097'  'DEU: Missing '
  '208001'  'DNK: Lower sec.'
  '208002'  'DNK: Continuation school'
  '208004'  'DNK: Upper sec.'
  '208097'  'DNK: Missing '
  '724101'  'ESP: Compulsory sec. Education'
  '724102'  'ESP: Baccalaureat'
  '724201'  'ESP: Compulsory sec. Education'
  '724301'  'ESP: Compulsory sec. Education'
  '724401'  'ESP: Compulsory sec. Education'
  '246001'  'FIN: Comprehensive sec. school'
  '250001'  'FRA: 5ème, 4ème, 3ème (lower sec.)'
  '250002'  'FRA: SEGPA, CPA (special education)'
  '250003'  'FRA: 2nde ou 1ère (générale ou techn.) (upper sec. general)'
  '250004'  'FRA: Enseignement professionnel (upper sec. vocational)'
  '250005'  'FRA: apprentissage (upper sec. vocational)'
  '826101'  'GBR: Studies toward Entry Level Certificates'
  '826102'  'GBR: Studies toward  academic GCSEs eg history, Fr.'
  '826103'  'GBR: Studies toward applied or vocational GCSEs '
  '826104'  'GBR: Studies at GNVQ Foundation or Intermed. Level (6-unit)'
  '826105'  'GBR: Studies toward NVQ Level 1 or 2'
  '826106'  'GBR: Studies toward for AS or A Levels'
  '826109'  'GBR: < Year 10 (England&Wales) or < Year 11 (North. Ireland)'
  '300001'  'GRC: Gymnasio ( lower sec. education) '
  '300002'  'GRC: Eniaio Lykeio (upper sec. education) '
  '300003'  'GRC: Technical-vocational training inst.): 1st & 2nd cycle'
  '344001'  'HKG: Lower sec. in G & I Sch.'
  '344002'  'HKG: Upper sec. in G & I Sch.'
  '344003'  'HKG: Lower sec. in P & T Sch.'
  '344004'  'HKG: Upper sec. in P & T Sch.'
  '348001'  'HUN: Primary school'
  '348002'  'HUN: Grammar school '
  '348003'  'HUN: Vocational sec. school'
  '348004'  'HUN: Vocational school'
  '360002'  'IDN: Junior sec. School'
  '360003'  'IDN: Islamic Junior sec. School'
  '360004'  'IDN: High School'
  '360005'  'IDN: Islamic High School'
  '360006'  'IDN: Vocational & Technical School'
  '372001'  'IRL: Junior Cert'
  '372002'  'IRL: Transition Year Programme'
  '372003'  'IRL: Leaving Cert. Applied'
  '372004'  'IRL: Leaving Cert. General'
  '372005'  'IRL: Leaving Cert.  Vocational'
  '352001'  'ISL: Lower sec. school'
  '380001'  'ITA: Lower sec. education'
  '380002'  'ITA: Technical Institute'
  '380003'  'ITA: Professional or Art Institute, Art High School'
  '380004'  'ITA: Scientif., Classical or linguistic High School'
  '380005'  'ITA: Professional School (only in Bolzano)'
  '392001'  'JPN: Upper sec. school (General)'
  '392002'  'JPN: Technical college (1st 3 years)'
  '392003'  'JPN: Upper sec. school (Vocational)'
  '410001'  'KOR: Lower sec. Education (Jung-hakgyo)'
  '410002'  'KOR: Upper sec. Education (Ilban Kodeung-hakgyo)'
  '410003'  'KOR: Upper sec. Education (Silup Kodeung-hakgyo)'
  '438001'  'LIE: sec. education, 1st stage'
  '438002'  'LIE: Preparatory course for vocational education'
  '438003'  'LIE: School prep. for the university entrance certificate'
  '442001'  'LUX: Year 7 or 8 or 9'
  '442002'  'LUX: Year 7 or 8 or 9'
  '442003'  'LUX: Year 10 or 11, with mostly VET (vocational) subjects '
  '442004'  'LUX: Year 10-12, in a program leading to an apprenticeship'
  '442005'  'LUX: Year 10-12 in a program leading to higher education '
  '442006'  'LUX: Year 10-12 in a program leading to university '
  '428001'  'LVA: Basic education'
  '428004'  'LVA: General sec. education'
  '428097'  'LVA: Missing'
  '446001'  'MAC: Lower sec. in G & I Sch.'
  '446002'  'MAC: Upper sec. in G & I Sch.'
  '446003'  'MAC: Lower sec. in P & T Sch.'
  '446004'  'MAC: Upper sec. in P & T Sch.'
  '484001'  'MEX: General Lower sec.'
  '484002'  'MEX: Technical Lower sec.'
  '484003'  'MEX: Lower sec. for workers'
  '484004'  'MEX: General Lower sec. by Television'
  '484005'  'MEX: Job Training '
  '484006'  'MEX: General Baccalaureate or Upper sec.(Years prog.)'
  '484007'  'MEX: General Baccalaureate or Upper sec.(semester prog.)'
  '484008'  'MEX: General Baccalaureate or Upper sec.(two years prog.)'
  '484009'  'MEX: Technical Baccalaureate or Upper sec. (semester prog.)'
  '484010'  'MEX: Professional Technician (semester prog.)'
  '528001'  'NLD: PRO'
  '528002'  'NLD: VMBO'
  '528003'  'NLD: VMBO BB'
  '528004'  'NLD: VMBO KB'
  '528005'  'NLD: VMBO GL'
  '528006'  'NLD: VMBO TL'
  '528007'  'NLD: HAVO 2/3'
  '528008'  'NLD: HAVO 4/5 '
  '528009'  'NLD: VWO 2/3'
  '528010'  'NLD: VWO 4/5'
  '528097'  'NLD: Missing'
  '578001'  'NOR: Lower sec.'
  '578002'  'NOR: Upper sec.'
  '554001'  'NZL: Years 7 to 10 '
  '554002'  'NZL: Years 11 to 13'
  '554097'  'NZL: Missing'
  '616001'  'POL: Gymnasium'
  '616002'  'POL: Lyceum - General education'
  '620001'  'PRT: Lower sec.'
  '620003'  'PRT: Upper sec.'
  '620004'  'PRT: Vocational sec. (technological)'
  '620005'  'PRT: Vocational sec. (professional)'
  '643001'  'RUS: Basic general education (Lower sec.) '
  '643002'  'RUS: Sec. general education (Upper sec.)'
  '643003'  'RUS: Initial professional education (prof. schools, etc.)'
  '643004'  'RUS: Sec. professional education (technikum, college, etc.)'
  '643099'  'RUS: Missing '
  '826201'  'SCO: All students in S4'
  '826202'  'SCO: S5 and studies at Higher level, A-level, or equivalent'
  '826203'  'SCO: S5 and studies at Intermed., Access level or equivalent'
  '703002'  'SVK: Basic school (lower sec.)'
  '703004'  'SVK: Vocational Basic school (lower sec.)'
  '703005'  'SVK: sec. school (lower sec.)'
  '703006'  'SVK: sec. school (upper sec.)'
  '703007'  'SVK: High School (Gymnasium)'
  '703008'  'SVK: sec. College'
  '703009'  'SVK: Technical College'
  '703010'  'SVK: Vocational College'
  '752001'  'SWE: Compulsory basic school '
  '752002'  'SWE: Upper sec. school, general orientation '
  '752003'  'SWE: Upper sec. school, vocational orientation '
  '752004'  'SWE: Upper sec. school, the individual programme '
  '752097'  'SWE: Missing'
  '764001'  'THA: Lower sec. level'
  '764002'  'THA: Upper sec. level'
  '764003'  'THA: Vocational stream'
  '788001'  'TUN: Enseignement de base (lower sec.)'
  '788002'  'TUN: 2ndaire (upper sec.)'
  '792001'  'TUR: Primary education (lower sec.)'
  '792002'  'TUR: General high school (upper sec.)'
  '792003'  'TUR: Anatolian high school (upper sec.)'
  '792004'  'TUR: High school with foreign language (upper sec.)'
  '792005'  'TUR: Science high schools (upper sec.)'
  '792006'  'TUR: Vocational high schools'
  '792007'  'TUR: Anatolian vocational high schools'
  '792008'  'TUR: Technical high schools'
  '792009'  'TUR: Anatolian technical high schools'
  '858001'  'URY: Lower sec. (Plan 86)'
  '858002'  'URY: Lower sec. (Plan 96)'
  '858003'  'URY: Lower sec. (Plan 96 technological)'
  '858004'  'URY: Vocational lower sec. (basic courses)'
  '858005'  'URY: Vocational lower sec. (basic professional)'
  '858006'  'URY: Rural lower sec.'
  '858007'  'URY: General upper sec.'
  '858008'  'URY: Technical upper sec.'
  '858009'  'URY: Vocational upper sec.'
  '858010'  'URY: Military School'
  '840001'  'USA: Grades 7 - 9'
  '840002'  'USA: Grades 10 - 12'
  '840097'  'USA: Missing'
  '891001'  'YUG: Gymnasium'
  '891002'  'YUG: Technical'
  '891003'  'YUG: Technical Vocational'
  '891004'  'YUG: Medical'
  '891005'  'YUG: Medical Vocational'
  '891006'  'YUG: Economic'
  '891007'  'YUG: Economic Vocational'
  '891008'  'YUG: Agricultural'
  '891009'  'YUG: Agricultaral Vocational '
  '891010'  'YUG: Artistic '
  '891097'  'YUG: Missing'.

value labels STRATUM
  "03601" "Australia: ACT"
  "03602" "Australia: NSW"
  "03603" "Australia: VIC"
  "03604" "Australia: QLD"
  "03605" "Australia: SA"
  "03606" "Australia: WA"
  "03607" "Australia: TAS"
  "03608" "Australia: NT"
  "04002" "Austria: Hauptschule"
  "04003" "Austria: Polytechn. Schule"
  "04005" "Austria: Gymnasium"
  "04006" "Austria: Realgymnasium"
  "04007" "Austria: Oberstufenrealgymnasium"
  "04009" "Austria: Berufsschule (techn.-gewerbl.)"
  "04010" "Austria: Berufsschule (kaufmänn./Handel/Verkehr)"
  "04012" "Austria: BMS (gewerblich-technisch-kunstgewerbl.)"
  "04013" "Austria: BMS (kaufmännisch/Handelschulen)"
  "04014" "Austria: BMS (wirtschafts-/sozialberufl.)"
  "04015" "Austria: BMS (land-/forstwirtschaftl.)"
  "04016" "Austria: BHS (techn.-gewerblich)"
  "04017" "Austria: BHS (kaufmännisch)"
  "04018" "Austria: BHS (wirtschafts-/sozialberufl)"
  "04019" "Austria: BHS (land-/forstwirtschaftl.)"
  "04020" "Austria: Anstalt der Kindergarten-/Sozialpädagogik"
  "04021" "Austria: Moderately small schools"
  "04022" "Austria: Very small schools"
  "05601" "Belgium (Flemish): Only general education, private"
  "05602" "Belgium (Flemish): Only general education, public"
  "05603" "Belgium (Flemish): Gen.-techn.-vocat.-arts, private"
  "05604" "Belgium (Flemish): Gen.-techn.-vocat.-arts, public"
  "05605" "Belgium (Flemish): Techn.,arts, not general, private"
  "05606" "Belgium (Flemish): Techn.-vocat.-arts, not gen., public"
  "05607" "Belgium (Flemish): Special education - private"
  "05608" "Belgium (Flemish): Special education - public"
  "05609" "Belgium (Flemish): Part time vocational"
  "05610" "Belgium (Flemish): Moderately small schools"
  "05611" "Belgium (Flemish): Very small schools"
  "05612" "Belgium (French): Organised by community"
  "05613" "Belgium (French): Organised by community, spec. ed."
  "05614" "Belgium (French): Official schools subsidised by comm."
  "05615" "Belgium (French): Subsidised special education"
  "05616" "Belgium (French): Subsidised confessional"
  "05617" "Belgium (French): Subsidised confessional - spec. ed."
  "05618" "Belgium (French): Subsidised non-confessional"
  "05619" "Belgium (French): Subsidised non-confessional - spec. ed."
  "05620" "Belgium (German)"
  "07601" "Brazil: Central (private)"
  "07602" "Brazil: Central (public)"
  "07603" "Brazil: North (private)"
  "07604" "Brazil: North (public)"
  "07605" "Brazil: Northeast (private)"
  "07606" "Brazil: Northeast (public)"
  "07607" "Brazil: South (private)"
  "07608" "Brazil: South (public)"
  "07609" "Brazil: Southeast (private)"
  "07610" "Brazil: Southeast (public)"
  "07611" "Brazil: Small schools"
  "07612" "Brazil: Very small schools"
  "12400" "Canada"
  "20301" "Czech Republic: Stratum 1"
  "20302" "Czech Republic: Stratum 2"
  "20303" "Czech Republic: Stratum 3"
  "20304" "Czech Republic: Stratum 4"
  "20305" "Czech Republic: Stratum 5"
  "20306" "Czech Republic: Stratum 6"
  "20307" "Czech Republic: Stratum 7"
  "20308" "Czech Republic: Stratum 8"
  "20309" "Czech Republic: Stratum 9"
  "20310" "Czech Republic: Stratum 10"
  "20311" "Czech Republic: Stratum 11"
  "20312" "Czech Republic: Stratum 12"
  "20313" "Czech Republic: Stratum 13"
  "20314" "Czech Republic: Stratum 14"
  "20315" "Czech Republic: Stratum 15"
  "20316" "Czech Republic: Stratum 16"
  "20317" "Czech Republic: Stratum 17"
  "20318" "Czech Republic: Stratum 18"
  "20319" "Czech Republic: Stratum 19"
  "20320" "Czech Republic: Stratum 20"
  "20321" "Czech Republic: Stratum 21"
  "20322" "Czech Republic: Stratum 22"
  "20323" "Czech Republic: Stratum 23"
  "20324" "Czech Republic: Stratum 24"
  "20325" "Czech Republic: Stratum 25"
  "20326" "Czech Republic: Stratum 26"
  "20327" "Czech Republic: Stratum 27"
  "20328" "Czech Republic: Stratum 28"
  "20329" "Czech Republic: Stratum 29"
  "20330" "Czech Republic: Stratum 30"
  "20331" "Czech Republic: Stratum 31"
  "20332" "Czech Republic: Stratum 32"
  "20333" "Czech Republic: Stratum 33"
  "20334" "Czech Republic: Stratum 34"
  "20801" "Denmark: Large schools"
  "20802" "Denmark: Moderately small schools"
  "20803" "Denmark: Very Small schools"
  "24601" "Finland: Stratum 1"
  "24602" "Finland: Stratum 2"
  "24603" "Finland: Stratum 3"
  "24604" "Finland: Stratum 4"
  "24605" "Finland: Stratum 5"
  "24606" "Finland: Stratum 6"
  "24607" "Finland: Stratum 7"
  "24608" "Finland: Stratum 8"
  "24609" "Finland: Stratum 9"
  "24610" "Finland: Stratum 10"
  "24611" "Finland: Stratum 11"
  "24612" "Finland: Stratum 12"
  "25001" "France: Lycées généraux et technologiques"
  "25002" "France: Collèges"
  "25003" "France: Lycées professionnels"
  "25004" "France: Lycées agricoles"
  "25005" "France: Moderately small  schools"
  "25006" "France: Very small schools"
  "27601" "Germany: Stratum 1"
  "27602" "Germany: Stratum 2"
  "27603" "Germany: Stratum 3"
  "27604" "Germany: Stratum 4"
  "27605" "Germany: Stratum 5"
  "27606" "Germany: Stratum 6"
  "27607" "Germany: Stratum 7"
  "27608" "Germany: Stratum 8"
  "27609" "Germany: Stratum 9"
  "27610" "Germany: Stratum 10"
  "27611" "Germany: Stratum 11"
  "27612" "Germany: Stratum 12"
  "27613" "Germany: Stratum 13"
  "27614" "Germany: Stratum 14"
  "27615" "Germany: Stratum 15"
  "27616" "Germany: Stratum 16"
  "27617" "Germany: Stratum 17"
  "27618" "Germany: Stratum 18"
  "30001" "Greece: Stratum 1"
  "30002" "Greece: Stratum 2"
  "30003" "Greece: Stratum 3"
  "30004" "Greece: Stratum 4"
  "30005" "Greece: Stratum 5"
  "30006" "Greece: Stratum 6"
  "30007" "Greece: Stratum 7"
  "30008" "Greece: Stratum 8"
  "30009" "Greece: Stratum 9"
  "30010" "Greece: Stratum 10"
  "30011" "Greece: Stratum 11"
  "30012" "Greece: Stratum 12"
  "34401" "Hong Kong SAR: Stratum 1"
  "34402" "Hong Kong SAR: Stratum 2"
  "34403" "Hong Kong SAR: Stratum 3"
  "34801" "Hungary: Stratum 1"
  "34802" "Hungary: Stratum 2"
  "34803" "Hungary: Stratum 3"
  "34804" "Hungary: Stratum 4"
  "34805" "Hungary: Stratum 5"
  "35201" "Iceland: Stratum 1"
  "35202" "Iceland: Stratum 2"
  "35203" "Iceland: Stratum 3"
  "35204" "Iceland: Stratum 4"
  "35205" "Iceland: Stratum 5"
  "35206" "Iceland: Stratum 6"
  "35207" "Iceland: Stratum 7"
  "35208" "Iceland: Stratum 8"
  "35209" "Iceland: Stratum 9"
  "36001" "Indonesia: Stratum 1"
  "36002" "Indonesia: Stratum 2"
  "36003" "Indonesia: Stratum 3"
  "36004" "Indonesia: Stratum 4"
  "36005" "Indonesia: Stratum 5"
  "36006" "Indonesia: Stratum 6"
  "36007" "Indonesia: Stratum 7"
  "36008" "Indonesia: Stratum 8"
  "36009" "Indonesia: Stratum 9"
  "36010" "Indonesia: Stratum 10"
  "36011" "Indonesia: Stratum 11"
  "36012" "Indonesia: Stratum 12"
  "36013" "Indonesia: Stratum 13"
  "36014" "Indonesia: Stratum 14"
  "36015" "Indonesia: Stratum 15"
  "36016" "Indonesia: Stratum 16"
  "36017" "Indonesia: Stratum 17"
  "36018" "Indonesia: Stratum 18"
  "36019" "Indonesia: Stratum 19"
  "36020" "Indonesia: Stratum 20"
  "36021" "Indonesia: Stratum 21"
  "36022" "Indonesia: Stratum 22"
  "36023" "Indonesia: Stratum 23"
  "36024" "Indonesia: Stratum 24"
  "36025" "Indonesia: Stratum 25"
  "36026" "Indonesia: Stratum 26"
  "36027" "Indonesia: Stratum 27"
  "36028" "Indonesia: Stratum 28"
  "37201" "Ireland: Stratum 1"
  "37202" "Ireland: Stratum 2"
  "37203" "Ireland: Stratum 3"
  "38014" "Italy, Veneto-Nord Est: Stratum 14"
  "38015" "Italy, Veneto-Nord Est: Stratum 15"
  "38016" "Italy, Veneto-Nord Est: Stratum 16"
  "38017" "Italy, Veneto-Nord Est: Stratum 17"
  "38018" "Italy, Veneto-Nord Est: Stratum 18"
  "38019" "Italy, Trento-Nord-Est: Stratum 19"
  "38020" "Italy, Trento-Nord-Est: Stratum 20"
  "38028" "Italy, Toscana-Centro: Stratum 28"
  "38029" "Italy, Toscana-Centro: Stratum 29"
  "38030" "Italy, Toscana-Centro: Stratum 30"
  "38031" "Italy, Toscana-Centro: Stratum 31"
  "38001" "Italy, Piemonte-Nord-Ovest: Stratum 1"
  "38002" "Italy, Piemonte-Nord-Ovest: Stratum 2"
  "38003" "Italy, Piemonte-Nord-Ovest: Stratum 3"
  "38004" "Italy, Piemonte-Nord-Ovest: Stratum 4"
  "38005" "Italy, Lombardia-Nord Ovest: Stratum 5"
  "38006" "Italy, Lombardia-Nord Ovest: Stratum 6"
  "38007" "Italy, Lombardia-Nord Ovest: Stratum 7"
  "38008" "Italy, Lombardia-Nord Ovest: Stratum 8"
  "38021" "Italy, Bolzano: Stratum 21"
  "38022" "Italy, Bolzano: Stratum 22"
  "38009" "Italy, Other regions: Stratum 9"
  "38010" "Italy, Other regions: Stratum 10"
  "38011" "Italy, Other regions: Stratum 11"
  "38012" "Italy, Other regions: Stratum 12"
  "38013" "Italy, Other regions: Stratum 13"
  "38023" "Italy, Other regions: Stratum 23"
  "38024" "Italy, Other regions: Stratum 24"
  "38025" "Italy, Other regions: Stratum 25"
  "38026" "Italy, Other regions: Stratum 26"
  "38032" "Italy, Other regions: Stratum 32"
  "38033" "Italy, Other regions: Stratum 33"
  "38034" "Italy, Other regions: Stratum 34"
  "38035" "Italy, Other regions: Stratum 35"
  "38036" "Italy, Other regions: Stratum 36"
  "38037" "Italy, Other regions: Stratum 37"
  "38038" "Italy, Other regions: Stratum 38"
  "38039" "Italy, Other regions: Stratum 39"
  "38040" "Italy, Other regions: Stratum 40"
  "38041" "Italy, Other regions: Stratum 41"
  "38042" "Italy, Other regions: Stratum 42"
  "38043" "Italy, Other regions: Stratum 43"
  "38044" "Italy, Other regions: Stratum 44"
  "39201" "Japan: Public & Academic Course"
  "39202" "Japan: Public & Practical Course"
  "39203" "Japan: Private & Academic Course"
  "39204" "Japan: Private & Practical Course"
  "41001" "Korea: Metropolitan General"
  "41002" "Korea: Metropolitan Vocational "
  "41003" "Korea: Urban General"
  "41004" "Korea: Urban Vocational"
  "41005" "Korea: Urban General & Vocational"
  "41006" "Korea: Rural General"
  "41007" "Korea: Rural Vocational"
  "41008" "Korea: Rural General & Vocational"
  "41009" "Korea: Moderately small schools"
  "42801" "Latvia: Large schools"
  "42802" "Latvia: Moderately small schools"
  "42803" "Latvia: Very small schools"
  "43840" "Liechtenstein"
  "44201" "Luxembourg: Stratum 1"
  "44202" "Luxembourg: Stratum 2"
  "44203" "Luxembourg: Stratum 3"
  "44601" "Macao SAR: Stratum 1"
  "44602" "Macao SAR: Stratum 2"
  "44603" "Macao SAR: Stratum 3"
  "48401" "Mexico: Aguascalientes"
  "48402" "Mexico: Baja California"
  "48403" "Mexico: Baja California Sur"
  "48404" "Mexico: Campeche Coahuila"
  "48405" "Mexico: Coahuila"
  "48406" "Mexico: Colima"
  "48407" "Mexico: Chiapas"
  "48408" "Mexico: Chihuahua"
  "48409" "Mexico: Distrito Federal"
  "48410" "Mexico: Durango"
  "48411" "Mexico: Guanajuato"
  "48412" "Mexico: Guerrero"
  "48413" "Mexico: Hidalgo"
  "48414" "Mexico: Jalisco"
  "48415" "Mexico: Mexico"
  "48417" "Mexico: Morelos"
  "48418" "Mexico: Nayarit"
  "48419" "Mexico: Nuevo Leon"
  "48420" "Mexico: Oaxaca"
  "48421" "Mexico: Puebla"
  "48422" "Mexico: Queretaro"
  "48423" "Mexico: Quintana Roo"
  "48424" "Mexico: San Luis Potosi"
  "48425" "Mexico: Sinaloa"
  "48426" "Mexico: Sonora"
  "48427" "Mexico: Tabasco"
  "48428" "Mexico: Tamaulipas"
  "48429" "Mexico: Tlaxcala"
  "48430" "Mexico: Veracruz"
  "48431" "Mexico: Yucatan"
  "48432" "Mexico: Zacatecas"
  "48433" "Mexico: Small schools"
  "48434" "Mexico: Very small schools"
  "52801" "Netherlands: Lower secondary schools"
  "52802" "Netherlands: Upper secondary schools"
  "55401" "New Zealand"
  "57801" "Norway: Stratum 1"
  "57802" "Norway: Stratum 2"
  "57803" "Norway: Stratum 3"
  "57804" "Norway: Stratum 4"
  "61601" "Poland: Gimnazja"
  "61602" "Poland: Licea (vss)"
  "62001" "Portugal: Açores"
  "62002" "Portugal: DREA"
  "62003" "Portugal: DREALG"
  "62004" "Portugal: DREC"
  "62005" "Portugal: DREL"
  "62006" "Portugal: DREN"
  "62007" "Portugal: Madeira"
  "62008" "Portugal: Small schools"
  "62009" "Portugal: Very small schools"
  "64303" "Russian Federation: Stratum 3"
  "64304" "Russian Federation: Stratum 4"
  "64307" "Russian Federation: Stratum 7"
  "64308" "Russian Federation: Stratum 8"
  "64314" "Russian Federation: Stratum 14"
  "64316" "Russian Federation: Stratum 16"
  "64318" "Russian Federation: Stratum 18"
  "64321" "Russian Federation: Stratum 21"
  "64322" "Russian Federation: Stratum 22"
  "64323" "Russian Federation: Stratum 23"
  "64324" "Russian Federation: Stratum 24"
  "64325" "Russian Federation: Stratum 25"
  "64326" "Russian Federation: Stratum 26"
  "64327" "Russian Federation: Stratum 27"
  "64331" "Russian Federation: Stratum 31"
  "64332" "Russian Federation: Stratum 32"
  "64334" "Russian Federation: Stratum 34"
  "64335" "Russian Federation: Stratum 35"
  "64336" "Russian Federation: Stratum 36"
  "64337" "Russian Federation: Stratum 37"
  "64338" "Russian Federation: Stratum 38"
  "64342" "Russian Federation: Stratum 42"
  "64343" "Russian Federation: Stratum 43"
  "64347" "Russian Federation: Stratum 47"
  "64348" "Russian Federation: Stratum 48"
  "64350" "Russian Federation: Stratum 50"
  "64351" "Russian Federation: Stratum 51"
  "64352" "Russian Federation: Stratum 52"
  "64353" "Russian Federation: Stratum 53"
  "64354" "Russian Federation: Stratum 54"
  "64355" "Russian Federation: Stratum 55"
  "64356" "Russian Federation: Stratum 56"
  "64358" "Russian Federation: Stratum 58"
  "64359" "Russian Federation: Stratum 59"
  "64361" "Russian Federation: Stratum 61"
  "64363" "Russian Federation: Stratum 63"
  "64364" "Russian Federation: Stratum 64"
  "64366" "Russian Federation: Stratum 66"
  "64370" "Russian Federation: Stratum 70"
  "64371" "Russian Federation: Stratum 71"
  "64374" "Russian Federation: Stratum 74"
  "64376" "Russian Federation: Stratum 76"
  "64377" "Russian Federation: Stratum 77"
  "64378" "Russian Federation: Stratum 78"
  "64386" "Russian Federation: Stratum 86"
  "70301" "Slovak Republic: Stratum 1"
  "70302" "Slovak Republic: Stratum 2"
  "70303" "Slovak Republic: Stratum 3"
  "70304" "Slovak Republic: Stratum 4"
  "70305" "Slovak Republic: Stratum 5"
  "70306" "Slovak Republic: Stratum 6"
  "70307" "Slovak Republic: Stratum 7"
  "70308" "Slovak Republic: Stratum 8"
  "70309" "Slovak Republic: Stratum 9"
  "70310" "Slovak Republic: Stratum 10"
  "70311" "Slovak Republic: Stratum 11"
  "70312" "Slovak Republic: Stratum 12"
  "70313" "Slovak Republic: Stratum 13"
  "70314" "Slovak Republic: Stratum 14"
  "70315" "Slovak Republic: Stratum 15"
  "70316" "Slovak Republic: Stratum 16"
  "70317" "Slovak Republic: Stratum 17"
  "70318" "Slovak Republic: Stratum 18"
  "70319" "Slovak Republic: Stratum 19"
  "70320" "Slovak Republic: Stratum 20"
  "72401" "Spain: Stratum 1"
  "72402" "Spain: Stratum 2"
  "72403" "Spain: Stratum 3"
  "72419" "Spain: Stratum 19"
  "72420" "Spain: Stratum 20"
  "72421" "Spain: Stratum 21"
  "72422" "Spain: Stratum 22"
  "72423" "Spain: Stratum 23"
  "72424" "Spain: Stratum 24"
  "72425" "Spain: Stratum 25"
  "72426" "Spain: Stratum 26"
  "72427" "Spain: Stratum 27"
  "72428" "Spain: Stratum 28"
  "72429" "Spain: Stratum 29"
  "72430" "Spain: Stratum 30"
  "72431" "Spain: Stratum 31"
  "72432" "Spain: Stratum 32"
  "72433" "Spain: Stratum 33"
  "72434" "Spain: Stratum 34"
  "72435" "Spain: Stratum 35"
  "72436" "Spain: Stratum 36"
  "72437" "Spain: Stratum 37"
  "72438" "Spain: Stratum 38"
  "72439" "Spain: Stratum 39"
  "72440" "Spain: Stratum 40"
  "72441" "Spain: Stratum 41"
  "72442" "Spain: Stratum 42"
  "72443" "Spain: Stratum 43"
  "72444" "Spain: Stratum 44"
  "72445" "Spain: Stratum 45"
  "72404" "Spain, Castilia y Leon: Stratum 4"
  "72405" "Spain, Castilia y Leon: Stratum 5"
  "72406" "Spain, Castilia y Leon: Stratum 6"
  "72407" "Spain, Castilia y Leon: Stratum 7"
  "72408" "Spain, Catalonia: Stratum 8"
  "72409" "Spain, Catalonia: Stratum 9"
  "72410" "Spain, Catalonia: Stratum 10"
  "72411" "Spain, Basque Country: Stratum 11"
  "72412" "Spain, Basque Country: Stratum 12"
  "72413" "Spain, Basque Country: Stratum 13"
  "72414" "Spain, Basque Country: Stratum 14"
  "72415" "Spain, Basque Country: Stratum 15"
  "72416" "Spain, Basque Country: Stratum 16"
  "72417" "Spain, Basque Country: Stratum 17"
  "72418" "Spain, Basque Country: Stratum 18"
  "75201" "Sweden: Stratum 1"
  "75202" "Sweden: Stratum 2"
  "75203" "Sweden: Stratum 3"
  "75204" "Sweden: Stratum 4"
  "75205" "Sweden: Stratum 5"
  "75206" "Sweden: Stratum 6"
  "75207" "Sweden: Stratum 7"
  "75208" "Sweden: Stratum 8"
  "75209" "Sweden: Stratum 9"
  "75601" "Switzerland (German): Stratum 1"
  "75602" "Switzerland (German): Stratum 2"
  "75603" "Switzerland (German): Stratum 3"
  "75604" "Switzerland (German): Stratum 4"
  "75605" "Switzerland (German): Stratum 5"
  "75606" "Switzerland (German): Stratum 6"
  "75607" "Switzerland (German): Stratum 7"
  "75608" "Switzerland (German): Stratum 8"
  "75609" "Switzerland (German): Stratum 9"
  "75610" "Switzerland (German): Stratum 10"
  "75611" "Switzerland (German): Stratum 11"
  "75612" "Switzerland (German): Stratum 12"
  "75613" "Switzerland (German): Stratum 13"
  "75614" "Switzerland (German): Stratum 14"
  "75615" "Switzerland (French): Stratum 15"
  "75616" "Switzerland (French): Stratum 16"
  "75617" "Switzerland (French): Stratum 17"
  "75618" "Switzerland (French): Stratum 18"
  "75619" "Switzerland (French): Stratum 19"
  "75620" "Switzerland (French): Stratum 20"
  "75621" "Switzerland (French): Stratum 21"
  "75623" "Switzerland (French): Stratum 23"
  "75624" "Switzerland (French): Stratum 24"
  "75625" "Switzerland (French): Stratum 25"
  "75626" "Switzerland (French): Stratum 26"
  "75628" "Switzerland (French): Stratum 28"
  "75629" "Switzerland (Italian): Stratum 29"
  "75631" "Switzerland (Italian): Stratum 31"
  "75632" "Switzerland (Italian): Stratum 32"
  "75634" "Switzerland (Italian): Stratum 34"
  "76401" "Thailand: Stratum 1"
  "76402" "Thailand: Stratum 2"
  "76403" "Thailand: Stratum 3"
  "76404" "Thailand: Stratum 4"
  "76405" "Thailand: Stratum 5"
  "76406" "Thailand: Stratum 6"
  "76407" "Thailand: Stratum 7"
  "76408" "Thailand: Stratum 8"
  "76409" "Thailand: Stratum 9"
  "76410" "Thailand: Stratum 10"
  "76411" "Thailand: Stratum 11"
  "76412" "Thailand: Stratum 12"
  "76413" "Thailand: Stratum 13"
  "76414" "Thailand: Stratum 14"
  "76415" "Thailand: Stratum 15"
  "78801" "Tunisia: East"
  "78802" "Tunisia: West"
  "79201" "Turkey: Stratum 1"
  "79202" "Turkey: Stratum 2"
  "79203" "Turkey: Stratum 3"
  "79204" "Turkey: Stratum 4"
  "79205" "Turkey: Stratum 5"
  "79206" "Turkey: Stratum 6"
  "79207" "Turkey: Stratum 7"
  "79208" "Turkey: Stratum 8"
  "79209" "Turkey: Stratum 9"
  "79210" "Turkey: Stratum 10"
  "79211" "Turkey: Stratum 11"
  "79212" "Turkey: Stratum 12"
  "79213" "Turkey: Stratum 13"
  "79214" "Turkey: Stratum 14"
  "79215" "Turkey: Stratum 15"
  "79216" "Turkey: Stratum 16"
  "79217" "Turkey: Stratum 17"
  "79218" "Turkey: Stratum 18"
  "79219" "Turkey: Stratum 19"
  "79220" "Turkey: Stratum 20"
  "79221" "Turkey: Stratum 21"
  "79222" "Turkey: Stratum 22"
  "79223" "Turkey: Stratum 23"
  "79224" "Turkey: Stratum 24"
  "79225" "Turkey: Stratum 25"
  "79226" "Turkey: Stratum 26"
  "79227" "Turkey: Stratum 27"
  "79228" "Turkey: Stratum 28"
  "79229" "Turkey: Stratum 29"
  "79230" "Turkey: Stratum 30"
  "79231" "Turkey: Stratum 31"
  "79232" "Turkey: Stratum 32"
  "79233" "Turkey: Stratum 33"
  "79234" "Turkey: Stratum 34"
  "79235" "Turkey: Stratum 35"
  "79236" "Turkey: Stratum 36"
  "79237" "Turkey: Stratum 37"
  "79238" "Turkey: Stratum 38"
  "79239" "Turkey: Stratum 39"
  "79240" "Turkey: Stratum 40"
  "79241" "Turkey: Stratum 41"
  "79242" "Turkey: Stratum 42"
  "79243" "Turkey: Stratum 43"
  "82611" "England"
  "82613" "N.Ireland"
  "82614" "N.Ireland: Very large schools"
  "82615" "Wales"
  "82601" "Scotland: Stratum 1"
  "82602" "Scotland: Stratum 2"
  "82603" "Scotland: Stratum 3"
  "82604" "Scotland: Stratum 4"
  "82605" "Scotland: Stratum 5"
  "84000" "United States"
  "85801" "Uruguay: Liceos Publicos (Mdeo/AM)"
  "85802" "Uruguay: Liceos Publicos (cap. dptos interior)"
  "85803" "Uruguay: Liceos Publicos (rural)"
  "85804" "Uruguay: Escuelas tecnicas (Mdeo/AM)"
  "85805" "Uruguay: Escuelas tecnicas (interior)"
  "85806" "Uruguay: Colegios privados"
  "85808" "Uruguay: Small schools"
  "85809" "Uruguay: Very small schools"
  "89101" "Yugoslavia: Stratum 1"
  "89102" "Yugoslavia: Stratum 2"
  "89103" "Yugoslavia: Stratum 3"
  "89104" "Yugoslavia: Stratum 4"
  "89105" "Yugoslavia: Stratum 5"
  "89106" "Yugoslavia: Stratum 6"
  "89107" "Yugoslavia: Stratum 7"
  "89108" "Yugoslavia: Stratum 8".
exe.

    SAVE TRANSLATE OUTFILE= "E:\works\pisa\stata\p03_student.dta" 
          /TYPE=STATA
          /VERSION=13
          /EDITION=SE
          /MAP
          /REPLACE.
