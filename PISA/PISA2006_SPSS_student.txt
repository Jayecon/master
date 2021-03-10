***** PISA 2006 Student Questionnaire *****.
***** Read-in syntax for SPSS         *****.

* This syntax reads the ASCII txt file data and applies variable and value labels, formats and missing value specifications.
* Write the location of the ASCII txt file below, in the DATA LIST command.

SET decimal=dot.

DATA LIST FILE='C:\****\INT_Stu06_Dec07.txt' / 
   SUBNATIO            1 -    5 (A)         
   SCHOOLID            6 -   10 (A)         
   STIDSTD            11 -   15 (A)         
   CNT                16 -   18 (A)         
   COUNTRY            19 -   21 (A)         
   OECD               22 -   22 (F,0)       
   ST01Q01            23 -   24 (F,0)       
   ST02Q01            25 -   26 (F,0)       
   ST03Q02            27 -   28 (A)         
   ST03Q03            29 -   30 (A)         
   ST04Q01            31 -   31 (F,0)       
   ST05Q01            32 -   35 (A)         
   ST06Q01            36 -   36 (F,0)       
   ST07Q01            37 -   37 (F,0)       
   ST07Q02            38 -   38 (F,0)       
   ST07Q03            39 -   39 (F,0)       
   ST08Q01            40 -   43 (A)         
   ST09Q01            44 -   44 (F,0)       
   ST10Q01            45 -   45 (F,0)       
   ST10Q02            46 -   46 (F,0)       
   ST10Q03            47 -   47 (F,0)       
   ST11Q01            48 -   48 (F,0)       
   ST11Q02            49 -   49 (F,0)       
   ST11Q03            50 -   50 (F,0)       
   ST11Q04            51 -   52 (F,0)       
   ST12Q01            53 -   53 (F,0)       
   ST13Q01            54 -   54 (F,0)       
   ST13Q02            55 -   55 (F,0)       
   ST13Q03            56 -   56 (F,0)       
   ST13Q04            57 -   57 (F,0)       
   ST13Q05            58 -   58 (F,0)       
   ST13Q06            59 -   59 (F,0)       
   ST13Q07            60 -   60 (F,0)       
   ST13Q08            61 -   61 (F,0)       
   ST13Q09            62 -   62 (F,0)       
   ST13Q10            63 -   63 (F,0)       
   ST13Q11            64 -   64 (F,0)       
   ST13Q12            65 -   65 (F,0)       
   ST13Q13            66 -   66 (F,0)       
   ST13Q14            67 -   67 (F,0)       
   ST13Q15            68 -   73 (A)         
   ST13Q16            74 -   79 (A)         
   ST13Q17            80 -   85 (A)         
   ST14Q01            86 -   86 (F,0)       
   ST14Q02            87 -   87 (F,0)       
   ST14Q03            88 -   88 (F,0)       
   ST14Q04            89 -   89 (F,0)       
   ST15Q01            90 -   90 (F,0)       
   ST16Q01            91 -   91 (F,0)       
   ST16Q02            92 -   92 (F,0)       
   ST16Q03            93 -   93 (F,0)       
   ST16Q04            94 -   94 (F,0)       
   ST16Q05            95 -   95 (F,0)       
   ST17Q01            96 -   96 (F,0)       
   ST17Q02            97 -   97 (F,0)       
   ST17Q03            98 -   98 (F,0)       
   ST17Q04            99 -   99 (F,0)       
   ST17Q05           100 -  100 (F,0)       
   ST17Q06           101 -  101 (F,0)       
   ST17Q07           102 -  102 (F,0)       
   ST17Q08           103 -  103 (F,0)       
   ST18Q01           104 -  104 (F,0)       
   ST18Q02           105 -  105 (F,0)       
   ST18Q03           106 -  106 (F,0)       
   ST18Q04           107 -  107 (F,0)       
   ST18Q05           108 -  108 (F,0)       
   ST18Q06           109 -  109 (F,0)       
   ST18Q07           110 -  110 (F,0)       
   ST18Q08           111 -  111 (F,0)       
   ST18Q09           112 -  112 (F,0)       
   ST18Q10           113 -  113 (F,0)       
   ST19Q01           114 -  114 (F,0)       
   ST19Q02           115 -  115 (F,0)       
   ST19Q03           116 -  116 (F,0)       
   ST19Q04           117 -  117 (F,0)       
   ST19Q05           118 -  118 (F,0)       
   ST19Q06           119 -  119 (F,0)       
   ST20QA1           120 -  120 (F,0)       
   ST20QA2           121 -  121 (F,0)       
   ST20QA3           122 -  122 (F,0)       
   ST20QA4           123 -  123 (F,0)       
   ST20QA5           124 -  124 (F,0)       
   ST20QA6           125 -  125 (F,0)       
   ST20QB1           126 -  126 (F,0)       
   ST20QB2           127 -  127 (F,0)       
   ST20QB3           128 -  128 (F,0)       
   ST20QB4           129 -  129 (F,0)       
   ST20QB5           130 -  130 (F,0)       
   ST20QB6           131 -  131 (F,0)       
   ST20QC1           132 -  132 (F,0)       
   ST20QC2           133 -  133 (F,0)       
   ST20QC3           134 -  134 (F,0)       
   ST20QC4           135 -  135 (F,0)       
   ST20QC5           136 -  136 (F,0)       
   ST20QC6           137 -  137 (F,0)       
   ST20QD1           138 -  138 (F,0)       
   ST20QD2           139 -  139 (F,0)       
   ST20QD3           140 -  140 (F,0)       
   ST20QD4           141 -  141 (F,0)       
   ST20QD5           142 -  142 (F,0)       
   ST20QD6           143 -  143 (F,0)       
   ST20QE1           144 -  144 (F,0)       
   ST20QE2           145 -  145 (F,0)       
   ST20QE3           146 -  146 (F,0)       
   ST20QE4           147 -  147 (F,0)       
   ST20QE5           148 -  148 (F,0)       
   ST20QE6           149 -  149 (F,0)       
   ST20QF1           150 -  150 (F,0)       
   ST20QF2           151 -  151 (F,0)       
   ST20QF3           152 -  152 (F,0)       
   ST20QF4           153 -  153 (F,0)       
   ST20QF5           154 -  154 (F,0)       
   ST20QF6           155 -  155 (F,0)       
   ST20QG1           156 -  156 (F,0)       
   ST20QG2           157 -  157 (F,0)       
   ST20QG3           158 -  158 (F,0)       
   ST20QG4           159 -  159 (F,0)       
   ST20QG5           160 -  160 (F,0)       
   ST20QG6           161 -  161 (F,0)       
   ST20QH1           162 -  162 (F,0)       
   ST20QH2           163 -  163 (F,0)       
   ST20QH3           164 -  164 (F,0)       
   ST20QH4           165 -  165 (F,0)       
   ST20QH5           166 -  166 (F,0)       
   ST20QH6           167 -  167 (F,0)       
   ST21Q01           168 -  168 (F,0)       
   ST21Q02           169 -  169 (F,0)       
   ST21Q03           170 -  170 (F,0)       
   ST21Q04           171 -  171 (F,0)       
   ST21Q05           172 -  172 (F,0)       
   ST21Q06           173 -  173 (F,0)       
   ST21Q07           174 -  174 (F,0)       
   ST21Q08           175 -  175 (F,0)       
   ST22Q01           176 -  176 (F,0)       
   ST22Q02           177 -  177 (F,0)       
   ST22Q03           178 -  178 (F,0)       
   ST22Q04           179 -  179 (F,0)       
   ST22Q05           180 -  180 (F,0)       
   ST23QA1           181 -  181 (F,0)       
   ST23QA2           182 -  182 (F,0)       
   ST23QA3           183 -  183 (F,0)       
   ST23QA4           184 -  184 (F,0)       
   ST23QA5           185 -  185 (F,0)       
   ST23QA6           186 -  186 (F,0)       
   ST23QB1           187 -  187 (F,0)       
   ST23QB2           188 -  188 (F,0)       
   ST23QB3           189 -  189 (F,0)       
   ST23QB4           190 -  190 (F,0)       
   ST23QB5           191 -  191 (F,0)       
   ST23QB6           192 -  192 (F,0)       
   ST23QC1           193 -  193 (F,0)       
   ST23QC2           194 -  194 (F,0)       
   ST23QC3           195 -  195 (F,0)       
   ST23QC4           196 -  196 (F,0)       
   ST23QC5           197 -  197 (F,0)       
   ST23QC6           198 -  198 (F,0)       
   ST23QD1           199 -  199 (F,0)       
   ST23QD2           200 -  200 (F,0)       
   ST23QD3           201 -  201 (F,0)       
   ST23QD4           202 -  202 (F,0)       
   ST23QD5           203 -  203 (F,0)       
   ST23QD6           204 -  204 (F,0)       
   ST23QE1           205 -  205 (F,0)       
   ST23QE2           206 -  206 (F,0)       
   ST23QE3           207 -  207 (F,0)       
   ST23QE4           208 -  208 (F,0)       
   ST23QE5           209 -  209 (F,0)       
   ST23QE6           210 -  210 (F,0)       
   ST23QF1           211 -  211 (F,0)       
   ST23QF2           212 -  212 (F,0)       
   ST23QF3           213 -  213 (F,0)       
   ST23QF4           214 -  214 (F,0)       
   ST23QF5           215 -  215 (F,0)       
   ST23QF6           216 -  216 (F,0)       
   ST24Q01           217 -  217 (F,0)       
   ST24Q02           218 -  218 (F,0)       
   ST24Q03           219 -  219 (F,0)       
   ST24Q04           220 -  220 (F,0)       
   ST24Q05           221 -  221 (F,0)       
   ST24Q06           222 -  222 (F,0)       
   ST25Q01           223 -  223 (F,0)       
   ST25Q02           224 -  224 (F,0)       
   ST25Q03           225 -  225 (F,0)       
   ST25Q04           226 -  226 (F,0)       
   ST25Q05           227 -  227 (F,0)       
   ST25Q06           228 -  228 (F,0)       
   ST26Q01           229 -  229 (F,0)       
   ST26Q02           230 -  230 (F,0)       
   ST26Q03           231 -  231 (F,0)       
   ST26Q04           232 -  232 (F,0)       
   ST26Q05           233 -  233 (F,0)       
   ST26Q06           234 -  234 (F,0)       
   ST26Q07           235 -  235 (F,0)       
   ST27Q01           236 -  236 (F,0)       
   ST27Q02           237 -  237 (F,0)       
   ST27Q03           238 -  238 (F,0)       
   ST27Q04           239 -  239 (F,0)       
   ST28Q01           240 -  240 (F,0)       
   ST28Q02           241 -  241 (F,0)       
   ST28Q03           242 -  242 (F,0)       
   ST28Q04           243 -  243 (F,0)       
   ST29Q01           244 -  244 (F,0)       
   ST29Q02           245 -  245 (F,0)       
   ST29Q03           246 -  246 (F,0)       
   ST29Q04           247 -  247 (F,0)       
   ST30Q01           248 -  251 (A)         
   ST31Q01           252 -  252 (F,0)       
   ST31Q02           253 -  253 (F,0)       
   ST31Q03           254 -  254 (F,0)       
   ST31Q04           255 -  255 (F,0)       
   ST31Q05           256 -  256 (F,0)       
   ST31Q06           257 -  257 (F,0)       
   ST31Q07           258 -  258 (F,0)       
   ST31Q08           259 -  259 (F,0)       
   ST31Q09           260 -  260 (F,0)       
   ST31Q10           261 -  261 (F,0)       
   ST31Q11           262 -  262 (F,0)       
   ST31Q12           263 -  263 (F,0)       
   ST32Q01           264 -  264 (F,0)       
   ST32Q02           265 -  265 (F,0)       
   ST32Q03           266 -  266 (F,0)       
   ST32Q04           267 -  267 (F,0)       
   ST32Q05           268 -  268 (F,0)       
   ST32Q06           269 -  269 (F,0)       
   ST33Q11           270 -  270 (F,0)       
   ST33Q12           271 -  271 (F,0)       
   ST33Q21           272 -  272 (F,0)       
   ST33Q22           273 -  273 (F,0)       
   ST33Q31           274 -  274 (F,0)       
   ST33Q32           275 -  275 (F,0)       
   ST33Q41           276 -  276 (F,0)       
   ST33Q42           277 -  277 (F,0)       
   ST33Q51           278 -  278 (F,0)       
   ST33Q52           279 -  279 (F,0)       
   ST33Q61           280 -  280 (F,0)       
   ST33Q62           281 -  281 (F,0)       
   ST33Q71           282 -  282 (F,0)       
   ST33Q72           283 -  283 (F,0)       
   ST33Q81           284 -  284 (F,0)       
   ST33Q82           285 -  285 (F,0)       
   ST34Q01           286 -  286 (F,0)       
   ST34Q02           287 -  287 (F,0)       
   ST34Q03           288 -  288 (F,0)       
   ST34Q04           289 -  289 (F,0)       
   ST34Q05           290 -  290 (F,0)       
   ST34Q06           291 -  291 (F,0)       
   ST34Q07           292 -  292 (F,0)       
   ST34Q08           293 -  293 (F,0)       
   ST34Q09           294 -  294 (F,0)       
   ST34Q10           295 -  295 (F,0)       
   ST34Q11           296 -  296 (F,0)       
   ST34Q12           297 -  297 (F,0)       
   ST34Q13           298 -  298 (F,0)       
   ST34Q14           299 -  299 (F,0)       
   ST34Q15           300 -  300 (F,0)       
   ST34Q16           301 -  301 (F,0)       
   ST34Q17           302 -  302 (F,0)       
   ST35Q01           303 -  303 (F,0)       
   ST35Q02           304 -  304 (F,0)       
   ST35Q03           305 -  305 (F,0)       
   ST35Q04           306 -  306 (F,0)       
   ST35Q05           307 -  307 (F,0)       
   ST36Q01           308 -  308 (F,0)       
   ST36Q02           309 -  309 (F,0)       
   ST36Q03           310 -  310 (F,0)       
   ST37Q01           311 -  311 (F,0)       
   ST37Q02           312 -  312 (F,0)       
   ST37Q03           313 -  313 (F,0)       
   ST37Q04           314 -  314 (F,0)       
   ST37Q05           315 -  315 (F,0)       
   ST37Q06           316 -  316 (F,0)       
   IC01Q01           317 -  317 (F,0)       
   IC02Q01           318 -  318 (F,0)       
   IC03Q01           319 -  319 (F,0)       
   IC03Q02           320 -  320 (F,0)       
   IC03Q03           321 -  321 (F,0)       
   IC04Q01           322 -  322 (F,0)       
   IC04Q02           323 -  323 (F,0)       
   IC04Q03           324 -  324 (F,0)       
   IC04Q04           325 -  325 (F,0)       
   IC04Q05           326 -  326 (F,0)       
   IC04Q06           327 -  327 (F,0)       
   IC04Q07           328 -  328 (F,0)       
   IC04Q08           329 -  329 (F,0)       
   IC04Q09           330 -  330 (F,0)       
   IC04Q10           331 -  331 (F,0)       
   IC04Q11           332 -  332 (F,0)       
   IC05Q01           333 -  333 (F,0)       
   IC05Q02           334 -  334 (F,0)       
   IC05Q03           335 -  335 (F,0)       
   IC05Q04           336 -  336 (F,0)       
   IC05Q05           337 -  337 (F,0)       
   IC05Q06           338 -  338 (F,0)       
   IC05Q07           339 -  339 (F,0)       
   IC05Q08           340 -  340 (F,0)       
   IC05Q09           341 -  341 (F,0)       
   IC05Q10           342 -  342 (F,0)       
   IC05Q11           343 -  343 (F,0)       
   IC05Q12           344 -  344 (F,0)       
   IC05Q13           345 -  345 (F,0)       
   IC05Q14           346 -  346 (F,0)       
   IC05Q15           347 -  347 (F,0)       
   IC05Q16           348 -  348 (F,0)       
   AGE               349 -  353 (F,2)       
   ISCEDL            354 -  354 (F,0)       
   ISCEDD            355 -  355 (F,0)       
   ISCEDO            356 -  356 (F,0)       
   PROGN             357 -  363 (A)         
   BMMJ              364 -  365 (F,0)       
   BFMJ              366 -  367 (F,0)       
   BSMJ              368 -  369 (F,0)       
   HISEI             370 -  371 (F,0)       
   MSECATEG          372 -  372 (F,0)       
   FSECATEG          373 -  373 (F,0)       
   HSECATEG          374 -  374 (F,0)       
   SRC_M             375 -  375 (F,0)       
   SRC_F             376 -  376 (F,0)       
   SRC_E             377 -  377 (F,0)       
   SRC_S             378 -  378 (F,0)       
   MISCED            379 -  379 (F,0)       
   FISCED            380 -  380 (F,0)       
   HISCED            381 -  381 (F,0)       
   PARED             382 -  385 (F,1)       
   COBN_M            386 -  390 (A)         
   COBN_F            391 -  395 (A)         
   COBN_S            396 -  400 (A)         
   IMMIG             401 -  401 (F,0)       
   LANGN             402 -  404 (A)         
   CARINFO           405 -  413 (F,4)       
   CARPREP           414 -  422 (F,4)       
   CULTPOSS          423 -  431 (F,4)       
   ENVAWARE          432 -  440 (F,4)       
   ENVOPT            441 -  449 (F,4)       
   ENVPERC           450 -  458 (F,4)       
   GENSCIE           459 -  467 (F,4)       
   HEDRES            468 -  476 (F,4)       
   HOMEPOS           477 -  485 (F,4)       
   INSTSCIE          486 -  494 (F,4)       
   INTSCIE           495 -  503 (F,4)       
   JOYSCIE           504 -  512 (F,4)       
   PERSCIE           513 -  521 (F,4)       
   RESPDEV           522 -  530 (F,4)       
   SCAPPLY           531 -  539 (F,4)       
   SCHANDS           540 -  548 (F,4)       
   SCIEACT           549 -  557 (F,4)       
   SCIEEFF           558 -  566 (F,4)       
   SCIEFUT           567 -  575 (F,4)       
   SCINTACT          576 -  584 (F,4)       
   SCINVEST          585 -  593 (F,4)       
   SCSCIE            594 -  602 (F,4)       
   WEALTH            603 -  611 (F,4)       
   HIGHCONF          612 -  620 (F,4)       
   INTCONF           621 -  629 (F,4)       
   INTUSE            630 -  638 (F,4)       
   PRGUSE            639 -  647 (F,4)       
   ESCS              648 -  656 (F,4)       
   PV1MATH           657 -  665 (F,4)       
   PV2MATH           666 -  674 (F,4)       
   PV3MATH           675 -  683 (F,4)       
   PV4MATH           684 -  692 (F,4)       
   PV5MATH           693 -  701 (F,4)       
   PV1READ           702 -  710 (F,4)       
   PV2READ           711 -  719 (F,4)       
   PV3READ           720 -  728 (F,4)       
   PV4READ           729 -  737 (F,4)       
   PV5READ           738 -  746 (F,4)       
   PV1SCIE           747 -  755 (F,4)       
   PV2SCIE           756 -  764 (F,4)       
   PV3SCIE           765 -  773 (F,4)       
   PV4SCIE           774 -  782 (F,4)       
   PV5SCIE           783 -  791 (F,4)       
   PV1INTR           792 -  800 (F,4)       
   PV2INTR           801 -  809 (F,4)       
   PV3INTR           810 -  818 (F,4)       
   PV4INTR           819 -  827 (F,4)       
   PV5INTR           828 -  836 (F,4)       
   PV1SUPP           837 -  845 (F,4)       
   PV2SUPP           846 -  854 (F,4)       
   PV3SUPP           855 -  863 (F,4)       
   PV4SUPP           864 -  872 (F,4)       
   PV5SUPP           873 -  881 (F,4)       
   PV1EPS            882 -  890 (F,4)       
   PV2EPS            891 -  899 (F,4)       
   PV3EPS            900 -  908 (F,4)       
   PV4EPS            909 -  917 (F,4)       
   PV5EPS            918 -  926 (F,4)       
   PV1ISI            927 -  935 (F,4)       
   PV2ISI            936 -  944 (F,4)       
   PV3ISI            945 -  953 (F,4)       
   PV4ISI            954 -  962 (F,4)       
   PV5ISI            963 -  971 (F,4)       
   PV1USE            972 -  980 (F,4)       
   PV2USE            981 -  989 (F,4)       
   PV3USE            990 -  998 (F,4)       
   PV4USE            999 - 1007 (F,4)       
   PV5USE           1008 - 1016 (F,4)       
   W_FSTUWT         1017 - 1025 (F,4)       
   W_FSTR1          1026 - 1034 (F,4)       
   W_FSTR2          1035 - 1043 (F,4)       
   W_FSTR3          1044 - 1052 (F,4)       
   W_FSTR4          1053 - 1061 (F,4)       
   W_FSTR5          1062 - 1070 (F,4)       
   W_FSTR6          1071 - 1079 (F,4)       
   W_FSTR7          1080 - 1088 (F,4)       
   W_FSTR8          1089 - 1097 (F,4)       
   W_FSTR9          1098 - 1106 (F,4)       
   W_FSTR10         1107 - 1115 (F,4)       
   W_FSTR11         1116 - 1124 (F,4)       
   W_FSTR12         1125 - 1133 (F,4)       
   W_FSTR13         1134 - 1142 (F,4)       
   W_FSTR14         1143 - 1151 (F,4)       
   W_FSTR15         1152 - 1160 (F,4)       
   W_FSTR16         1161 - 1169 (F,4)       
   W_FSTR17         1170 - 1178 (F,4)       
   W_FSTR18         1179 - 1187 (F,4)       
   W_FSTR19         1188 - 1196 (F,4)       
   W_FSTR20         1197 - 1205 (F,4)       
   W_FSTR21         1206 - 1214 (F,4)       
   W_FSTR22         1215 - 1223 (F,4)       
   W_FSTR23         1224 - 1232 (F,4)       
   W_FSTR24         1233 - 1241 (F,4)       
   W_FSTR25         1242 - 1250 (F,4)       
   W_FSTR26         1251 - 1259 (F,4)       
   W_FSTR27         1260 - 1268 (F,4)       
   W_FSTR28         1269 - 1277 (F,4)       
   W_FSTR29         1278 - 1286 (F,4)       
   W_FSTR30         1287 - 1295 (F,4)       
   W_FSTR31         1296 - 1304 (F,4)       
   W_FSTR32         1305 - 1313 (F,4)       
   W_FSTR33         1314 - 1322 (F,4)       
   W_FSTR34         1323 - 1331 (F,4)       
   W_FSTR35         1332 - 1340 (F,4)       
   W_FSTR36         1341 - 1349 (F,4)       
   W_FSTR37         1350 - 1358 (F,4)       
   W_FSTR38         1359 - 1367 (F,4)       
   W_FSTR39         1368 - 1376 (F,4)       
   W_FSTR40         1377 - 1385 (F,4)       
   W_FSTR41         1386 - 1394 (F,4)       
   W_FSTR42         1395 - 1403 (F,4)       
   W_FSTR43         1404 - 1412 (F,4)       
   W_FSTR44         1413 - 1421 (F,4)       
   W_FSTR45         1422 - 1430 (F,4)       
   W_FSTR46         1431 - 1439 (F,4)       
   W_FSTR47         1440 - 1448 (F,4)       
   W_FSTR48         1449 - 1457 (F,4)       
   W_FSTR49         1458 - 1466 (F,4)       
   W_FSTR50         1467 - 1475 (F,4)       
   W_FSTR51         1476 - 1484 (F,4)       
   W_FSTR52         1485 - 1493 (F,4)       
   W_FSTR53         1494 - 1502 (F,4)       
   W_FSTR54         1503 - 1511 (F,4)       
   W_FSTR55         1512 - 1520 (F,4)       
   W_FSTR56         1521 - 1529 (F,4)       
   W_FSTR57         1530 - 1538 (F,4)       
   W_FSTR58         1539 - 1547 (F,4)       
   W_FSTR59         1548 - 1556 (F,4)       
   W_FSTR60         1557 - 1565 (F,4)       
   W_FSTR61         1566 - 1574 (F,4)       
   W_FSTR62         1575 - 1583 (F,4)       
   W_FSTR63         1584 - 1592 (F,4)       
   W_FSTR64         1593 - 1601 (F,4)       
   W_FSTR65         1602 - 1610 (F,4)       
   W_FSTR66         1611 - 1619 (F,4)       
   W_FSTR67         1620 - 1628 (F,4)       
   W_FSTR68         1629 - 1637 (F,4)       
   W_FSTR69         1638 - 1646 (F,4)       
   W_FSTR70         1647 - 1655 (F,4)       
   W_FSTR71         1656 - 1664 (F,4)       
   W_FSTR72         1665 - 1673 (F,4)       
   W_FSTR73         1674 - 1682 (F,4)       
   W_FSTR74         1683 - 1691 (F,4)       
   W_FSTR75         1692 - 1700 (F,4)       
   W_FSTR76         1701 - 1709 (F,4)       
   W_FSTR77         1710 - 1718 (F,4)       
   W_FSTR78         1719 - 1727 (F,4)       
   W_FSTR79         1728 - 1736 (F,4)       
   W_FSTR80         1737 - 1745 (F,4)       
   CNTFAC           1746 - 1758 (F,10)      
   SUBFAC           1759 - 1771 (F,10)      
   WVARSTRR         1772 - 1773 (F,0)       
   RANDUNIT         1774 - 1774 (F,0)       
   STRATUM          1775 - 1779 (A)         
   TESTLANG         1780 - 1782 (A)         
   CLCUSE3A         1783 - 1785 (F,0)       
   CLCUSE3B         1786 - 1788 (F,0)       
   DEFFORT          1789 - 1791 (F,0)       
   S421Q02          1792 - 1792 (A)         
   S456Q01          1793 - 1794 (A)         
   S456Q02          1795 - 1795 (A)         
   VER_STU          1796 - 1808 (A)         
.

EXECUTE.

FORMATS OECD (F1.0).
FORMATS ST01Q01 ST02Q01 (F2.0).
FORMATS
  ST04Q01 ST06Q01 ST07Q01 ST07Q02 ST07Q03 ST09Q01 ST10Q01 ST10Q02 ST10Q03
  ST11Q01 ST11Q02 ST11Q03 ST12Q01
  ST13Q01 ST13Q02 ST13Q03 ST13Q04 ST13Q05 ST13Q06
  ST13Q07 ST13Q08 ST13Q09 ST13Q10 ST13Q11 ST13Q12 ST13Q13 ST13Q14
  ST14Q01 ST14Q02 ST14Q03 ST14Q04
  ST15Q01 ST16Q01 ST16Q02 ST16Q03 ST16Q04 ST16Q05 ST17Q01 ST17Q02
  ST17Q03 ST17Q04 ST17Q05 ST17Q06 ST17Q07 ST17Q08 ST18Q01 ST18Q02
  ST18Q03 ST18Q04 ST18Q05 ST18Q06 ST18Q07 ST18Q08 ST18Q09 ST18Q10
  ST19Q01 ST19Q02 ST19Q03 ST19Q04 ST19Q05 ST19Q06 ST20QA1 ST20QA2
  ST20QA3 ST20QA4 ST20QA5 ST20QA6 ST20QB1 ST20QB2 ST20QB3 ST20QB4
  ST20QB5 ST20QB6 ST20QC1 ST20QC2 ST20QC3 ST20QC4 ST20QC5 ST20QC6
  ST20QD1 ST20QD2 ST20QD3 ST20QD4 ST20QD5 ST20QD6 ST20QE1 ST20QE2
  ST20QE3 ST20QE4 ST20QE5 ST20QE6 ST20QF1 ST20QF2 ST20QF3 ST20QF4
  ST20QF5 ST20QF6 ST20QG1 ST20QG2 ST20QG3 ST20QG4 ST20QG5 ST20QG6
  ST20QH1 ST20QH2 ST20QH3 ST20QH4 ST20QH5 ST20QH6 ST21Q01 ST21Q02
  ST21Q03 ST21Q04 ST21Q05 ST21Q06 ST21Q07 ST21Q08 ST22Q01 ST22Q02
  ST22Q03 ST22Q04 ST22Q05 ST23QA1 ST23QA2 ST23QA3 ST23QA4 ST23QA5
  ST23QA6 ST23QB1 ST23QB2 ST23QB3 ST23QB4 ST23QB5 ST23QB6 ST23QC1
  ST23QC2 ST23QC3 ST23QC4 ST23QC5 ST23QC6 ST23QD1 ST23QD2 ST23QD3
  ST23QD4 ST23QD5 ST23QD6 ST23QE1 ST23QE2 ST23QE3 ST23QE4 ST23QE5
  ST23QE6 ST23QF1 ST23QF2 ST23QF3 ST23QF4 ST23QF5 ST23QF6 ST24Q01
  ST24Q02 ST24Q03 ST24Q04 ST24Q05 ST24Q06 ST25Q01 ST25Q02 ST25Q03
  ST25Q04 ST25Q05 ST25Q06 ST26Q01 ST26Q02 ST26Q03 ST26Q04 ST26Q05
  ST26Q06 ST26Q07 ST27Q01 ST27Q02 ST27Q03 ST27Q04 ST28Q01 ST28Q02
  ST28Q03 ST28Q04 ST29Q01 ST29Q02 ST29Q03 ST29Q04 ST31Q01 ST31Q02
  ST31Q03 ST31Q04 ST31Q05 ST31Q06 ST31Q07 ST31Q08 ST31Q09 ST31Q10
  ST31Q11 ST31Q12 ST32Q01 ST32Q02 ST32Q03 ST32Q04 ST32Q05 ST32Q06
  ST33Q11 ST33Q12 ST33Q21 ST33Q22 ST33Q31 ST33Q32 ST33Q41 ST33Q42
  ST33Q51 ST33Q52 ST33Q61 ST33Q62 ST33Q71 ST33Q72 ST33Q81 ST33Q82
  ST34Q01 ST34Q02 ST34Q03 ST34Q04 ST34Q05 ST34Q06 ST34Q07 ST34Q08
  ST34Q09 ST34Q10 ST34Q11 ST34Q12 ST34Q13 ST34Q14 ST34Q15 ST34Q16
  ST34Q17 ST35Q01 ST35Q02 ST35Q03 ST35Q04 ST35Q05 ST36Q01 ST36Q02
  ST36Q03 ST37Q01 ST37Q02 ST37Q03 ST37Q04 ST37Q05 ST37Q06 IC01Q01
  IC02Q01 IC03Q01 IC03Q02 IC03Q03 IC04Q01 IC04Q02 IC04Q03 IC04Q04
  IC04Q05 IC04Q06 IC04Q07 IC04Q08 IC04Q09 IC04Q10 IC04Q11 IC05Q01
  IC05Q02 IC05Q03 IC05Q04 IC05Q05 IC05Q06 IC05Q07 IC05Q08 IC05Q09
  IC05Q10 IC05Q11 IC05Q12 IC05Q13 IC05Q14 IC05Q15 IC05Q16 (F1.0).
FORMATS BMMJ BFMJ BSMJ HISEI (F2.0).
FORMATS MsECATEG FsECATEG HsECATEG (F1.0).
FORMATS SRC_M SRC_F SRC_E SRC_S (F1.0).
FORMATS FISCED MISCED HISCED (F1.0) .
FORMATS PARED (F4.1).
FORMATS IMMIG (F1.0).
FORMATS ST11Q04 (F2.0).
FORMATS CLCUSE3a CLCUSE3b Deffort (F3.0) .
FORMATS ISCEDL ISCEDD ISCEDO (F1.0).
FORMATS AGE (F5.2).
FORMATS CARINFO CARPREP CULTPOSS ENVAWARE ENVOPT ENVPERC ESCS GENSCIE (F9.4) .
FORMATS HEDRES HIGHCONF HOMEPOS INSTSCIE INTCONF INTSCIE INTUSE JOYSCIE (F9.4).
FORMATS PERSCIE PRGUSE  RESPDEV SCAPPLY SCHANDS SCIEACT SCIEEFF SCIEFUT (F9.4).
FORMATS SCINTACT SCINVEST SCSCIE WEALTH  (F9.4).
FORMATS 
   PV1MATH PV2MATH PV3MATH PV4MATH PV5MATH 
   PV1READ PV2READ PV3READ PV4READ PV5READ 
   PV1SCIE PV2SCIE PV3SCIE PV4SCIE PV5SCIE (F9.4).
FORMATS
   PV1INTR PV2INTR PV3INTR PV4INTR PV5INTR
   PV1SUPP PV2SUPP PV3SUPP PV4SUPP PV5SUPP (F9.4).
FORMATS
   PV1EPS PV2EPS PV3EPS PV4EPS PV5EPS 
   PV1ISI PV2ISI PV3ISI PV4ISI PV5ISI 
   PV1USE PV2USE PV3USE PV4USE PV5USE (F9.4).
FORMATS W_FSTR1 TO W_FSTR80 (F9.4).
FORMATS W_FSTUWT (F9.4).
FORMATS CNTFAC SUBFAC (F13.10).
FORMATS WVARSTRR (F2.0).
FORMATS RANDUNIT (F1.0).

VARIABLE LEVEL OECD (NOMINAL).
VARIABLE LEVEL ST01Q01 (ORDINAL).
VARIABLE LEVEL ST02Q01 (NOMINAL).
VARIABLE LEVEL ST04Q01 (NOMINAL).
VARIABLE LEVEL
  ST06Q01 ST07Q01 ST07Q02 ST07Q03 ST09Q01 ST10Q01 ST10Q02 ST10Q03
  ST11Q01 ST11Q02 ST11Q03 ST12Q01
  ST13Q01 ST13Q02 ST13Q03 ST13Q04 ST13Q05 ST13Q06
  ST13Q07 ST13Q08 ST13Q09 ST13Q10 ST13Q11 ST13Q12 ST13Q13 ST13Q14
  ST14Q01 ST14Q02 ST14Q03 ST14Q04
  ST15Q01 ST16Q01 ST16Q02 ST16Q03 ST16Q04 ST16Q05 ST17Q01 ST17Q02
  ST17Q03 ST17Q04 ST17Q05 ST17Q06 ST17Q07 ST17Q08 ST18Q01 ST18Q02
  ST18Q03 ST18Q04 ST18Q05 ST18Q06 ST18Q07 ST18Q08 ST18Q09 ST18Q10
  ST19Q01 ST19Q02 ST19Q03 ST19Q04 ST19Q05 ST19Q06 ST20QA1 ST20QA2
  ST20QA3 ST20QA4 ST20QA5 ST20QA6 ST20QB1 ST20QB2 ST20QB3 ST20QB4
  ST20QB5 ST20QB6 ST20QC1 ST20QC2 ST20QC3 ST20QC4 ST20QC5 ST20QC6
  ST20QD1 ST20QD2 ST20QD3 ST20QD4 ST20QD5 ST20QD6 ST20QE1 ST20QE2
  ST20QE3 ST20QE4 ST20QE5 ST20QE6 ST20QF1 ST20QF2 ST20QF3 ST20QF4
  ST20QF5 ST20QF6 ST20QG1 ST20QG2 ST20QG3 ST20QG4 ST20QG5 ST20QG6
  ST20QH1 ST20QH2 ST20QH3 ST20QH4 ST20QH5 ST20QH6 ST21Q01 ST21Q02
  ST21Q03 ST21Q04 ST21Q05 ST21Q06 ST21Q07 ST21Q08 ST22Q01 ST22Q02
  ST22Q03 ST22Q04 ST22Q05 ST23QA1 ST23QA2 ST23QA3 ST23QA4 ST23QA5
  ST23QA6 ST23QB1 ST23QB2 ST23QB3 ST23QB4 ST23QB5 ST23QB6 ST23QC1
  ST23QC2 ST23QC3 ST23QC4 ST23QC5 ST23QC6 ST23QD1 ST23QD2 ST23QD3
  ST23QD4 ST23QD5 ST23QD6 ST23QE1 ST23QE2 ST23QE3 ST23QE4 ST23QE5
  ST23QE6 ST23QF1 ST23QF2 ST23QF3 ST23QF4 ST23QF5 ST23QF6 ST24Q01
  ST24Q02 ST24Q03 ST24Q04 ST24Q05 ST24Q06 ST25Q01 ST25Q02 ST25Q03
  ST25Q04 ST25Q05 ST25Q06 ST26Q01 ST26Q02 ST26Q03 ST26Q04 ST26Q05
  ST26Q06 ST26Q07 ST27Q01 ST27Q02 ST27Q03 ST27Q04 ST28Q01 ST28Q02
  ST28Q03 ST28Q04 ST29Q01 ST29Q02 ST29Q03 ST29Q04 ST31Q01 ST31Q02
  ST31Q03 ST31Q04 ST31Q05 ST31Q06 ST31Q07 ST31Q08 ST31Q09 ST31Q10
  ST31Q11 ST31Q12 ST32Q01 ST32Q02 ST32Q03 ST32Q04 ST32Q05 ST32Q06
  ST33Q11 ST33Q12 ST33Q21 ST33Q22 ST33Q31 ST33Q32 ST33Q41 ST33Q42
  ST33Q51 ST33Q52 ST33Q61 ST33Q62 ST33Q71 ST33Q72 ST33Q81 ST33Q82
  ST34Q01 ST34Q02 ST34Q03 ST34Q04 ST34Q05 ST34Q06 ST34Q07 ST34Q08
  ST34Q09 ST34Q10 ST34Q11 ST34Q12 ST34Q13 ST34Q14 ST34Q15 ST34Q16
  ST34Q17 ST35Q01 ST35Q02 ST35Q03 ST35Q04 ST35Q05 ST36Q01 ST36Q02
  ST36Q03 ST37Q01 ST37Q02 ST37Q03 ST37Q04 ST37Q05 ST37Q06 IC01Q01
  IC02Q01 IC03Q01 IC03Q02 IC03Q03 IC04Q01 IC04Q02 IC04Q03 IC04Q04
  IC04Q05 IC04Q06 IC04Q07 IC04Q08 IC04Q09 IC04Q10 IC04Q11 IC05Q01
  IC05Q02 IC05Q03 IC05Q04 IC05Q05 IC05Q06 IC05Q07 IC05Q08 IC05Q09
  IC05Q10 IC05Q11 IC05Q12 IC05Q13 IC05Q14 IC05Q15 IC05Q16 (ORDINAL).
VARIABLE LEVEL BMMJ BFMJ BSMJ HISEI (SCALE).
VARIABLE LEVEL MsECATEG FsECATEG HsECATEG (ORDINAL).
VARIABLE LEVEL SRC_M SRC_F SRC_E SRC_S (ORDINAL).
VARIABLE LEVEL FISCED MISCED HISCED (ORDINAL) .
VARIABLE LEVEL PARED (SCALE).
VARIABLE LEVEL IMMIG (ORDINAL).
VARIABLE LEVEL ST11Q04 (SCALE).
VARIABLE LEVEL ISCEDL ISCEDD ISCEDO (NOMINAL).
VARIABLE LEVEL AGE (SCALE).
VARIABLE LEVEL CARINFO CARPREP CULTPOSS ENVAWARE ENVOPT ENVPERC ESCS GENSCIE (SCALE) .
VARIABLE LEVEL HEDRES HIGHCONF HOMEPOS INSTSCIE INTCONF INTSCIE INTUSE JOYSCIE (SCALE).
VARIABLE LEVEL PERSCIE PRGUSE  RESPDEV SCAPPLY SCHANDS SCIEACT SCIEEFF SCIEFUT (SCALE).
VARIABLE LEVEL SCINTACT SCINVEST SCSCIE WEALTH  (SCALE).
VARIABLE LEVEL 
   PV1MATH PV2MATH PV3MATH PV4MATH PV5MATH 
   PV1READ PV2READ PV3READ PV4READ PV5READ 
   PV1SCIE PV2SCIE PV3SCIE PV4SCIE PV5SCIE (SCALE).
VARIABLE LEVEL 
   PV1INTR PV2INTR PV3INTR PV4INTR PV5INTR
   PV1SUPP PV2SUPP PV3SUPP PV4SUPP PV5SUPP (SCALE).
VARIABLE LEVEL 
   PV1EPS PV2EPS PV3EPS PV4EPS PV5EPS 
   PV1ISI PV2ISI PV3ISI PV4ISI PV5ISI 
   PV1USE PV2USE PV3USE PV4USE PV5USE (SCALE).
VARIABLE LEVEL W_FSTR1 TO W_FSTR80 (SCALE).
VARIABLE LEVEL W_FSTUWT CNTFAC (SCALE).
VARIABLE LEVEL CLCUSE3a CLCUSE3b Deffort (ORDINAL) .


VARIABLE LABELS
  OECD        "OECD country"
  CNT         "Country code 3-character"
  COUNTRY     "Country code ISO 3-digit"
  SUBNATIO    "Adjudicated sub-region"
  SCHOOLID    "School ID 5-digit"
  STIDSTD     "Student ID 5-digit"
  ST01Q01     "Grade Q1"
  ST02Q01     "Study programme Q2"
  ST03Q02     "Month of birth Q3"
  ST03Q03     "Year of birth Q3"
  ST04Q01     "Gender Q4"
  ST05Q01     "Mother ISCO code Q5a"
  ST06Q01     "Mother <highest schooling> Q6"
  ST07Q01     "Mother <ISCED 5A or 6> Q7a"
  ST07Q02     "Mother <ISCED 5B> Q7b"
  ST07Q03     "Mother <ISCED 4> Q7c"
  ST08Q01     "Father ISCO Code Q8a"
  ST09Q01     "Father <highest schooling> Q9"
  ST10Q01     "Father <ISCED 5A or 6> Q10a"
  ST10Q02     "Father <ISCED 5B> Q10b"
  ST10Q03     "Father <ISCED 4> Q10c"
  ST11Q01     "Self born in country Q11a"
  ST11Q02     "Mother born in country Q11a"
  ST11Q03     "Father born in country Q11a"
  ST11Q04     "Country arrival age Q11b"
  ST12Q01     "Language at home Q12"
  ST13Q01     "Possessions desk Q13a"
  ST13Q02     "Possessions own room Q13b"
  ST13Q03     "Possessions study place Q13c"
  ST13Q04     "Possessions computer Q13d"
  ST13Q05     "Possessions software Q13e"
  ST13Q06     "Possessions Internet Q13f"
  ST13Q07     "Possessions calculator Q13g"
  ST13Q08     "Possessions literature Q13h"
  ST13Q09     "Possessions poetry Q13i"
  ST13Q10     "Possessions art Q13j"
  ST13Q11     "Possessions textbooks Q13k"
  ST13Q12     "Possessions dictionary Q13l"
  ST13Q13     "Possessions dishwasher Q13m"
  ST13Q14     "Possessions <DVD or VCR> Q13n"
  ST13Q15     "Possessions <country-specific item 1> Q13o"
  ST13Q16     "Possessions <country-specific item 2> Q13p"
  ST13Q17     "Possessions <country-specific item 3> Q13q"
  ST14Q01     "How many cell phones Q14a"
  ST14Q02     "How many televisions Q14b"
  ST14Q03     "How many computers Q14c"
  ST14Q04     "How many cars Q14d"
  ST15Q01     "How many books at home Q15"
  ST16Q01     "Sci enjoyment - Have fun Q16a"
  ST16Q02     "Sci enjoyment - Like reading Q16b"
  ST16Q03     "Sci enjoyment - Sci problems Q16c"
  ST16Q04     "Sci enjoyment - New knowledge Q16d"
  ST16Q05     "Sci enjoyment - Learning science Q16e"
  ST17Q01     "Sci tasks - Newspaper Q17a"
  ST17Q02     "Sci tasks - Earthquakes Q17b"
  ST17Q03     "Sci tasks - Antibiotics Q17c"
  ST17Q04     "Sci tasks - Garbage Q17d"
  ST17Q05     "Sci tasks - Species survival Q17e"
  ST17Q06     "Sci tasks - Food labels Q17f"
  ST17Q07     "Sci tasks - Life on Mars Q17g"
  ST17Q08     "Sci tasks - Acid rain Q17h"
  ST18Q01     "Sci value - Living conditions Q18a"
  ST18Q02     "Sci value - Natural world Q18b"
  ST18Q03     "Sci value - Relate to others Q18c"
  ST18Q04     "Sci value - Improve economy Q18d"
  ST18Q05     "Sci value - Use as adult Q18e"
  ST18Q06     "Sci value - Value to society Q18f"
  ST18Q07     "Sci value - Relevant to me Q18g"
  ST18Q08     "Sci value - Help understand Q18h"
  ST18Q09     "Sci value - Social benefits Q18i"
  ST18Q10     "Sci value - Opportunities Q18j"
  ST19Q01     "Sci activity - Science TV Q19a"
  ST19Q02     "Sci activity - Science books Q19b"
  ST19Q03     "Sci activity - Web content Q19c"
  ST19Q04     "Sci activity - Science radio Q19d"
  ST19Q05     "Sci activity - Science mags Q19e"
  ST19Q06     "Sci activity - Science club Q19f"
  ST20QA1     "Sci info - Photosynthesis - none Q20a"
  ST20QA2     "Sci info - Photosynthesis - school Q20a"
  ST20QA3     "Sci info - Photosynthesis - media Q20a"
  ST20QA4     "Sci info - Photosynthesis - friends Q20a"
  ST20QA5     "Sci info - Photosynthesis - family Q20a"
  ST20QA6     "Sci info - Photosynthesis - Internet or books Q20a"
  ST20QB1     "Sci info - Continents - none Q20b"
  ST20QB2     "Sci info - Continents - school Q20b"
  ST20QB3     "Sci info - Continents - media Q20b"
  ST20QB4     "Sci info - Continents - friends Q20b"
  ST20QB5     "Sci info - Continents - family Q20b"
  ST20QB6     "Sci info - Continents - Internet or books Q20b"
  ST20QC1     "Sci info - Genes - none Q20c"
  ST20QC2     "Sci info - Genes - school Q20c"
  ST20QC3     "Sci info - Genes - media Q20c"
  ST20QC4     "Sci info - Genes - friends Q20c"
  ST20QC5     "Sci info - Genes - family Q20c"
  ST20QC6     "Sci info - Genes - Internet or books Q20c"
  ST20QD1     "Sci info - Soundproofing - none Q20d"
  ST20QD2     "Sci info - Soundproofing - school Q20d"
  ST20QD3     "Sci info - Soundproofing - media Q20d"
  ST20QD4     "Sci info - Soundproofing - friends Q20d"
  ST20QD5     "Sci info - Soundproofing - family Q20d"
  ST20QD6     "Sci info - Soundproofing - Internet or books Q20d"
  ST20QE1     "Sci info - Climate change - none Q20e"
  ST20QE2     "Sci info - Climate change - school Q20e"
  ST20QE3     "Sci info - Climate change - media Q20e"
  ST20QE4     "Sci info - Climate change - friends Q20e"
  ST20QE5     "Sci info - Climate change - family Q20e"
  ST20QE6     "Sci info - Climate change - Internet or books Q20e"
  ST20QF1     "Sci info - Evolution - none Q20f"
  ST20QF2     "Sci info - Evolution - school Q20f"
  ST20QF3     "Sci info - Evolution - media Q20f"
  ST20QF4     "Sci info - Evolution - friends Q20f"
  ST20QF5     "Sci info - Evolution - family Q20f"
  ST20QF6     "Sci info - Evolution - Internet or books Q20f"
  ST20QG1     "Sci info - Nuclear energy - none Q20g"
  ST20QG2     "Sci info - Nuclear energy - school Q20g"
  ST20QG3     "Sci info - Nuclear energy - media Q20g"
  ST20QG4     "Sci info - Nuclear energy - friends Q20g"
  ST20QG5     "Sci info - Nuclear energy - family Q20g"
  ST20QG6     "Sci info - Nuclear energy - Internet or books Q20g"
  ST20QH1     "Sci info - Health - none Q20h"
  ST20QH2     "Sci info - Health - school Q20h"
  ST20QH3     "Sci info - Health - media Q20h"
  ST20QH4     "Sci info - Health - friends Q20h"
  ST20QH5     "Sci info - Health - family Q20h"
  ST20QH6     "Sci info - Health - Internet or books Q20h"
  ST21Q01     "Sci interest - Physics Q21a"
  ST21Q02     "Sci interest - Chemistry Q21b"
  ST21Q03     "Sci interest - Plant biology Q21c"
  ST21Q04     "Sci interest - Human biology Q21d"
  ST21Q05     "Sci interest - Astronomy Q21e"
  ST21Q06     "Sci interest - Geology Q21f"
  ST21Q07     "Sci interest - Experiments Q21g"
  ST21Q08     "Sci interest - Explanations Q21h"
  ST22Q01     "Envr aware - Greenhouse Q22a"
  ST22Q02     "Envr aware - Genetic modified Q22b"
  ST22Q03     "Envr aware - Acid rain Q22c"
  ST22Q04     "Envr aware - Nuclear waste Q22d"
  ST22Q05     "Envr aware - Forest clearing Q22e"
  ST23QA1     "Envr info - Air pollution - none Q23a"
  ST23QA2     "Envr info - Air pollution - school Q23a"
  ST23QA3     "Envr info - Air pollution - media Q23a"
  ST23QA4     "Envr info - Air pollution - friends Q23a"
  ST23QA5     "Envr info - Air pollution - family Q23a"
  ST23QA6     "Envr info - Air pollution - Internet or books Q23a"
  ST23QB1     "Envr info - Energy shortages - none Q23b"
  ST23QB2     "Envr info - Energy shortages - school Q23b"
  ST23QB3     "Envr info - Energy shortages - media Q23b"
  ST23QB4     "Envr info - Energy shortages - friends Q23b"
  ST23QB5     "Envr info - Energy shortages - family Q23b"
  ST23QB6     "Envr info - Energy shortages - Internet or books Q23b"
  ST23QC1     "Envr info - Extinction - none Q23c"
  ST23QC2     "Envr info - Extinction - school Q23c"
  ST23QC3     "Envr info - Extinction - media Q23c"
  ST23QC4     "Envr info - Extinction - friends Q23c"
  ST23QC5     "Envr info - Extinction - family Q23c"
  ST23QC6     "Envr info - Extinction - Internet or books Q23c"
  ST23QD1     "Envr info - Forest clearing - none Q23d"
  ST23QD2     "Envr info - Forest clearing - school Q23d"
  ST23QD3     "Envr info - Forest clearing - media Q23d"
  ST23QD4     "Envr info - Forest clearing - friends Q23d"
  ST23QD5     "Envr info - Forest clearing - family Q23d"
  ST23QD6     "Envr info - Forest clearing - Internet or books Q23d"
  ST23QE1     "Envr info - Water shortages - none Q23e"
  ST23QE2     "Envr info - Water shortages - school Q23e"
  ST23QE3     "Envr info - Water shortages - media Q23e"
  ST23QE4     "Envr info - Water shortages - friends Q23e"
  ST23QE5     "Envr info - Water shortages - family Q23e"
  ST23QE6     "Envr info - Water shortages - Internet or books Q23e"
  ST23QF1     "Envr info - Nuclear waste - none Q23f"
  ST23QF2     "Envr info - Nuclear waste - school Q23f"
  ST23QF3     "Envr info - Nuclear waste - media Q23f"
  ST23QF4     "Envr info - Nuclear waste - friends Q23f"
  ST23QF5     "Envr info - Nuclear waste - family Q23f"
  ST23QF6     "Envr info - Nuclear waste - Internet or books Q23f"
  ST24Q01     "Envr issues - Air pollution Q24a"
  ST24Q02     "Envr issues - Energy shortages Q24b"
  ST24Q03     "Envr issues - Extinction Q24c"
  ST24Q04     "Envr issues - Forest clearing Q24d"
  ST24Q05     "Envr issues - Water shortages Q24e"
  ST24Q06     "Envr issues - Nuclear waste Q24f"
  ST25Q01     "Envr improve - Air pollution Q25a"
  ST25Q02     "Envr improve - Energy shortages Q25b"
  ST25Q03     "Envr improve - Extinction Q25c"
  ST25Q04     "Envr improve - Forest clearing Q25d"
  ST25Q05     "Envr improve - Water shortages Q25e"
  ST25Q06     "Envr improve - Nuclear waste Q25f"
  ST26Q01     "Envr responsibility - Car emissions Q26a"
  ST26Q02     "Envr responsibility- Energy wasted Q26b"
  ST26Q03     "Envr responsibility- Factory emissions Q26c"
  ST26Q04     "Envr responsibility- Plastic pack Q26d"
  ST26Q05     "Envr responsibility- Dangerous waste Q26e"
  ST26Q06     "Envr responsibility- Endangered Q26f"
  ST26Q07     "Envr responsibility- Renewable electricity Q26g"
  ST27Q01     "Useful for Science career - School subjects Q27a"
  ST27Q02     "Useful for career - Science subjects Q27b"
  ST27Q03     "Useful for Science career - My subjects Q27c"
  ST27Q04     "Useful for Science career - Teaching Q27d"
  ST28Q01     "Science know - Job available Q28a"
  ST28Q02     "Science know - Find Where Q28b"
  ST28Q03     "Science know - Steps to take Q28c"
  ST28Q04     "Science know - Employers Q28d"
  ST29Q01     "Sci future - Like career Q29a"
  ST29Q02     "Sci future - After <secondary school> Q29b"
  ST29Q03     "Sci future - Advanced Q29c"
  ST29Q04     "Sci future - Work as adult Q29d"
  ST30Q01     "Self expected occupation at 30 ISCO code Q30"
  ST31Q01     "Regular lessons - Science Q31a"
  ST31Q02     "Out of school - Science Q31b"
  ST31Q03     "Self study - Science Q31c"
  ST31Q04     "Regular lessons - Mathematics Q31d"
  ST31Q05     "Out of school - Mathematics Q31e"
  ST31Q06     "Self study - Mathematics Q31f"
  ST31Q07     "Regular lessons - Language Q31g"
  ST31Q08     "Out of school - Language Q31h"
  ST31Q09     "Self study - Language Q31i"
  ST31Q10     "Regular lessons - Other Q31j"
  ST31Q11     "Out of school - Other Q31k"
  ST31Q12     "Self study - Other Q31l"
  ST32Q01     "Lessons - School 1-1 Q32a"
  ST32Q02     "Lessons - Not school 1-1 Q32b"
  ST32Q03     "Lessons - School small Q32c"
  ST32Q04     "Lessons - Not school small Q32d"
  ST32Q05     "Lessons - School large Q32e"
  ST32Q06     "Lessons - Not school large Q32f"
  ST33Q11     "Course - Comp Sci last yr Q33a"
  ST33Q12     "Course - Comp Sci this yr Q33a"
  ST33Q21     "Course - Opt Sci last yr Q33b"
  ST33Q22     "Course - Opt Sci this yr Q33b"
  ST33Q31     "Course - Comp Bio last yr Q33c"
  ST33Q32     "Course - Comp Bio this yr Q33c"
  ST33Q41     "Course - Opt Bio last yr Q33d"
  ST33Q42     "Course - Opt Bio this yr Q33d"
  ST33Q51     "Course - Comp Phy last yr Q33e"
  ST33Q52     "Course - Comp Phy this yr Q33e"
  ST33Q61     "Course - Opt Phy last yr Q33f"
  ST33Q62     "Course - Opt Phy this yr Q33f"
  ST33Q71     "Course - Comp Chem last yr Q33g"
  ST33Q72     "Course - Comp Chem this yr Q33g"
  ST33Q81     "Course - Opt Chem last yr Q33h"
  ST33Q82     "Course - Opt Chem this yr Q33h"
  ST34Q01     "Learning - Student ideas Q34a"
  ST34Q02     "Learning - Experiments Q34b"
  ST34Q03     "Learning - Design for lab Q34c"
  ST34Q04     "Learning - Apply everyday Q34d"
  ST34Q05     "Learning - Student opinion Q34e"
  ST34Q06     "Learning - Draw conclusions Q34f"
  ST34Q07     "Learning - Differnt phenomena Q34g"
  ST34Q08     "Learning - Own experiments Q34h"
  ST34Q09     "Learning - Class debate Q34i"
  ST34Q10     "Learning - Demonstrations Q34j"
  ST34Q11     "Learning - Choose own Q34k"
  ST34Q12     "Learning - World outside Q34l"
  ST34Q13     "Learning - Discussion Q34m"
  ST34Q14     "Learning - Follow instructions Q34n"
  ST34Q15     "Learning - Explain relevance Q34o"
  ST34Q16     "Learning - Test ideas Q34p"
  ST34Q17     "Learning - Society relevance Q34q"
  ST35Q01     "Sci future - Help later work Q35a"
  ST35Q02     "Sci future - Learn need later Q35b"
  ST35Q03     "Sci future - Useful to me Q35c"
  ST35Q04     "Sci future - Improve career Q35d"
  ST35Q05     "Sci future - Get a job Q35e"
  ST36Q01     "Self - Do well Science Q36a"
  ST36Q02     "Self - Do well Maths Q36b"
  ST36Q03     "Self - Do well Language Q36c"
  ST37Q01     "Learning - Advanced easy Q37a"
  ST37Q02     "Learning - Good answers Q37b"
  ST37Q03     "Learning - Topics quickly Q37c"
  ST37Q04     "Learning - Topics easy Q37d"
  ST37Q05     "Learning - Understand well Q37e"
  ST37Q06     "Learning - New ideas Q37f"
  IC01Q01     "Used computer IC1"
  IC02Q01     "How long used computers IC2"
  IC03Q01     "Use computer at home IC3a"
  IC03Q02     "Use computer at school IC3b"
  IC03Q03     "Use computer other places IC3c"
  IC04Q01     "Browse Internet IC4a"
  IC04Q02     "Play games IC4b"
  IC04Q03     "Write documents IC4c"
  IC04Q04     "Collaborate on Internet IC4d"
  IC04Q05     "Use spreadsheets IC4e"
  IC04Q06     "Download software IC4f"
  IC04Q07     "Graphics programs IC4g"
  IC04Q08     "Educational software IC4h"
  IC04Q09     "Download music IC4i"
  IC04Q10     "Write programs IC4j"
  IC04Q11     "E-mail or chat rooms IC4k"
  IC05Q01     "How well - Chat IC5a"
  IC05Q02     "How well - Virus IC5b"
  IC05Q03     "How well - Edit photos IC5c"
  IC05Q04     "How well - Database IC5d"
  IC05Q05     "How well - Copy data to CD IC5e"
  IC05Q06     "How well - Move files IC5f"
  IC05Q07     "How well - Search Internet IC5g"
  IC05Q08     "How well - Download files IC5h"
  IC05Q09     "How well - Attach e-mail IC5i"
  IC05Q10     "How well - Word processor IC5j"
  IC05Q11     "How well - Spreadsheet IC5k"
  IC05Q12     "How well - Presentation IC5l"
  IC05Q13     "How well - Download music IC5m"
  IC05Q14     "How well - Multi-media IC5n"
  IC05Q15     "How well - E-mails IC5o"
  IC05Q16     "How well - Web Page IC5p"
  ESCS        "Index of economic, social and cultural status PISA 2006 "
  AGE         "Age of student"
  BMMJ        "Occupational status Mother (SEI)"
  BFMJ        "Occupational status Father (SEI)"
  BSMJ        "Occupational status Self (SEI)"
  HISEI       "Highest parental occupational status (SEI)"
  CLCUSE3A    "Effort A: real"
  CLCUSE3B    "Effort B: if counted"
  DEFFORT     "Effort B - Effort A"
  COBN_F      "Country of birth (Father) 5-digit code"
  COBN_M      "Country of birth (Mother) 5-digit code"
  COBN_S      "Country of birth (Self) 5-digit code"
  PROGN       "Unique national study programme code"
  FISCED      "Educational level of father (ISCED)"
  HISCED      "Highest educational level of parents (ISCED)"
  MsECATEG    "Mother White collar/Blue collar classification"
  FsECATEG    "Father White collar/Blue collar classification"
  HsECATEG    "Highest parent White collar/Blue collar classification"
  IMMIG       "Immigration status"
  ISCEDD      "ISCED designation"
  ISCEDL      "ISCED level"
  ISCEDO      "ISCED orientation"
  LANGN       "Language at home (3-digit)"
  MISCED      "Educational level of mother (ISCED)"
  PARED       "Highest parental education in years"
  SRC_M       "Mother science-related career"
  SRC_F       "Father science-related career"
  SRC_E       "Either parent science-related career"
  SRC_S       "Self science-related career at 30"
  TESTLANG    "Language of Test (3-char)"
  CARINFO     "Student information on science-related careers PISA 2006 (WLE)"
  CARPREP     "School preparation for science-related careers PISA 2006 (WLE)"
  CULTPOSS    "Cultural possessions at home PISA 2006 (WLE)"
  ENVAWARE    "Awareness of environmental issues PISA 2006 (WLE)"
  ENVOPT      "Environmental optimism PISA 2006 (WLE)"
  ENVPERC     "Perception of environmental issues PISA 2006 (WLE)"
  GENSCIE     "General value of science PISA 2006 (WLE)"
  HEDRES      "Home educational resources PISA 2006 (WLE)"
  HIGHCONF    "Self-confidence in ICT high level tasks PISA 2006 (WLE)"
  HOMEPOS     "Index of home possessions PISA 2006 (WLE)"
  INSTSCIE    "Instrumental motivation in science PISA 2006 (WLE)"
  INTCONF     "Self-confidence in ICT Internet tasks PISA 2006 (WLE)"
  INTSCIE     "General interest in learning science PISA 2006 (WLE)"
  INTUSE      "ICT Internet/entertainment use PISA 2006 (WLE)"
  JOYSCIE     "Enjoyment of science PISA 2006 (WLE)"
  PERSCIE     "Personal value of science PISA 2006 (WLE)"
  PRGUSE      "ICT program/software use PISA 2006 (WLE)"
  RESPDEV     "Responsibility for sustainable development PISA 2006 (WLE)"
  SCAPPLY     "Science Teaching - Focus on applications or models PISA 2006 (WLE)"
  SCHANDS     "Science Teaching - Hands-on activities PISA 2006 (WLE)"
  SCIEACT     "Science activities PISA 2006 (WLE)"
  SCIEEFF     "Science self-efficacy PISA 2006 (WLE)"
  SCIEFUT     "Future-oriented science motivation PISA 2006 (WLE)"
  SCINTACT    "Science Teaching - Interaction PISA 2006 (WLE)"
  SCINVEST    "Science Teaching - Student investigations PISA 2006 (WLE)"
  SCSCIE      "Science self-concept PISA 2006 (WLE)"
  WEALTH      "Family wealth PISA 2006 (WLE)"
  PV1MATH     "Plausible value in math"
  PV2MATH     "Plausible value in math"
  PV3MATH     "Plausible value in math"
  PV4MATH     "Plausible value in math"
  PV5MATH     "Plausible value in math"
  PV1READ     "Plausible value in reading"
  PV2READ     "Plausible value in reading"
  PV3READ     "Plausible value in reading"
  PV4READ     "Plausible value in reading"
  PV5READ     "Plausible value in reading"
  PV1SCIE     "Plausible value in science"
  PV2SCIE     "Plausible value in science"
  PV3SCIE     "Plausible value in science"
  PV4SCIE     "Plausible value in science"
  PV5SCIE     "Plausible value in science"
  PV1INTR     "Plausible value in interest in science"
  PV2INTR     "Plausible value in interest in science"
  PV3INTR     "Plausible value in interest in science"
  PV4INTR     "Plausible value in interest in science"
  PV5INTR     "Plausible value in interest in science"
  PV1SUPP     "Plausible value in support for scientific inquiry"
  PV2SUPP     "Plausible value in support for scientific inquiry"
  PV3SUPP     "Plausible value in support for scientific inquiry"
  PV4SUPP     "Plausible value in support for scientific inquiry"
  PV5SUPP     "Plausible value in support for scientific inquiry"
  PV1EPS      "Plausible value in explaining phenomena scientifically"
  PV2EPS      "Plausible value in explaining phenomena scientifically"
  PV3EPS      "Plausible value in explaining phenomena scientifically"
  PV4EPS      "Plausible value in explaining phenomena scientifically"
  PV5EPS      "Plausible value in explaining phenomena scientifically"
  PV1ISI      "Plausible value in identifying scientific issues"
  PV2ISI      "Plausible value in identifying scientific issues"
  PV3ISI      "Plausible value in identifying scientific issues"
  PV4ISI      "Plausible value in identifying scientific issues"
  PV5ISI      "Plausible value in identifying scientific issues"
  PV1USE      "Plausible value in using scientific evidence"
  PV2USE      "Plausible value in using scientific evidence"
  PV3USE      "Plausible value in using scientific evidence"
  PV4USE      "Plausible value in using scientific evidence"
  PV5USE      "Plausible value in using scientific evidence"
  W_FSTUWT    "FINAL STUDENT WEIGHT"
  W_FSTR1     "FINAL STUDENT REPLICATE BRR-FAY WEIGHT1"
  W_FSTR2     "FINAL STUDENT REPLICATE BRR-FAY WEIGHT2"
  W_FSTR3     "FINAL STUDENT REPLICATE BRR-FAY WEIGHT3"
  W_FSTR4     "FINAL STUDENT REPLICATE BRR-FAY WEIGHT4"
  W_FSTR5     "FINAL STUDENT REPLICATE BRR-FAY WEIGHT5"
  W_FSTR6     "FINAL STUDENT REPLICATE BRR-FAY WEIGHT6"
  W_FSTR7     "FINAL STUDENT REPLICATE BRR-FAY WEIGHT7"
  W_FSTR8     "FINAL STUDENT REPLICATE BRR-FAY WEIGHT8"
  W_FSTR9     "FINAL STUDENT REPLICATE BRR-FAY WEIGHT9"
  W_FSTR10    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT10"
  W_FSTR11    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT11"
  W_FSTR12    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT12"
  W_FSTR13    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT13"
  W_FSTR14    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT14"
  W_FSTR15    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT15"
  W_FSTR16    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT16"
  W_FSTR17    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT17"
  W_FSTR18    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT18"
  W_FSTR19    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT19"
  W_FSTR20    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT20"
  W_FSTR21    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT21"
  W_FSTR22    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT22"
  W_FSTR23    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT23"
  W_FSTR24    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT24"
  W_FSTR25    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT25"
  W_FSTR26    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT26"
  W_FSTR27    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT27"
  W_FSTR28    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT28"
  W_FSTR29    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT29"
  W_FSTR30    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT30"
  W_FSTR31    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT31"
  W_FSTR32    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT32"
  W_FSTR33    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT33"
  W_FSTR34    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT34"
  W_FSTR35    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT35"
  W_FSTR36    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT36"
  W_FSTR37    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT37"
  W_FSTR38    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT38"
  W_FSTR39    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT39"
  W_FSTR40    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT40"
  W_FSTR41    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT41"
  W_FSTR42    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT42"
  W_FSTR43    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT43"
  W_FSTR44    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT44"
  W_FSTR45    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT45"
  W_FSTR46    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT46"
  W_FSTR47    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT47"
  W_FSTR48    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT48"
  W_FSTR49    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT49"
  W_FSTR50    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT50"
  W_FSTR51    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT51"
  W_FSTR52    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT52"
  W_FSTR53    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT53"
  W_FSTR54    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT54"
  W_FSTR55    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT55"
  W_FSTR56    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT56"
  W_FSTR57    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT57"
  W_FSTR58    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT58"
  W_FSTR59    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT59"
  W_FSTR60    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT60"
  W_FSTR61    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT61"
  W_FSTR62    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT62"
  W_FSTR63    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT63"
  W_FSTR64    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT64"
  W_FSTR65    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT65"
  W_FSTR66    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT66"
  W_FSTR67    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT67"
  W_FSTR68    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT68"
  W_FSTR69    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT69"
  W_FSTR70    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT70"
  W_FSTR71    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT71"
  W_FSTR72    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT72"
  W_FSTR73    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT73"
  W_FSTR74    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT74"
  W_FSTR75    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT75"
  W_FSTR76    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT76"
  W_FSTR77    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT77"
  W_FSTR78    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT78"
  W_FSTR79    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT79"
  W_FSTR80    "FINAL STUDENT REPLICATE BRR-FAY WEIGHT80"
  CNTFAC      "Country weight factor for normalised weights (multi-level)"
  SUBFAC      "Adjudicated region weight factor for normalised weights (multi-level)"
  WVARSTRR    "RANDOMIZED FINAL VARIANCE STRATUM (1-80)"
  RANDUNIT    "FINAL VARIANCE UNIT (1,2,3)"
  STRATUM     "Original stratum"
  S421Q02     "Deleted science item - Big and Small (Q02)"
  S456Q01     "Deleted science item - The Cheetah (Q01)"
  S456Q02     "Deleted science item - The Cheetah (Q02)"
  VER_STU     "Version student database and date of release"
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
   ST01Q01
      96   "Ungraded"
      99   "Missing"
  /ST02Q01
      99   "Missing"
  /ST03Q02 ST03Q03
     "99"  "Missing"
  /ST04Q01
      1    "Female"
      2    "Male"
      9    "Missing"
  /ST05Q01
     "9997" "N/A"
     "9998" "Invalid"
     "9999" "Missing"
  /ST06Q01
      1    "Completed ISCED 3A"
      2    "Completed ISCED 3B, 3C"
      3    "Completed ISCED 2"
      4    "Completed ISCED 1"
      5    "Did not complete ISCED 1"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
  /ST07Q01  ST07Q02 ST07Q03
      1    "Yes"
      2    "No"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
  /ST08Q01
     "9997" "N/A"
     "9998" "Invalid"
     "9999" "Missing"
  /ST09Q01
      1    "Completed ISCED 3A"
      2    "Completed ISCED 3B, 3C"
      3    "Completed ISCED 2"
      4    "Completed ISCED 1"
      5    "Did not complete ISCED 1"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
  /ST10Q01 ST10Q02 ST10Q03
      1    "Yes"
      2    "No"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
  /ST11Q01 ST11Q02 ST11Q03
      1	  "Country of test"
      2	  "Other Country"
      7	  "N/A"
      8	  "Invalid"
      9	  "Missing"
  /ST11Q04
      97     "N/A"
      98     "Invalid"
      99     "Missing"
  /ST12Q01
      1	  "Language of test"
  		2	  "Other national language"
  		3	  "Other language"
  		7	  "N/A"
  		8	  "Invalid"
  		9	  "Missing"
  /ST13Q01 ST13Q02 ST13Q03 ST13Q04 ST13Q05 ST13Q06 ST13Q07
   ST13Q08 ST13Q09 ST13Q10 ST13Q11 ST13Q12 ST13Q13 ST13Q14
      1    "Yes"
      2    "No"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
  /ST14Q01 ST14Q02 ST14Q03 ST14Q04
      1    "None"
      2    "One"
      3    "Two"
      4    "Three or more"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
  /ST15Q01
      1    "0-10 books"
      2    "11-25 books"
      3    "26-100 books"
      4    "101-200 books"
      5    "201-500 books"
      6    "More than 500 books"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
  /ST16Q01 ST16Q02 ST16Q03 ST16Q04 ST16Q05
      1    "Strongly agree"
      2    "Agree"
      3    "Disagree"
      4    "Strongly disagree"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
  /ST17Q01 ST17Q02 ST17Q03 ST17Q04 ST17Q05 ST17Q06 ST17Q07 ST17Q08
      1    "Do easily"
      2    "With some effort"
      3    "Struggle on own"
      4    "Couldn't do it"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
  /ST18Q01 ST18Q02 ST18Q03 ST18Q04 ST18Q05
   ST18Q06 ST18Q07 ST18Q08 ST18Q09 ST18Q10
      1    "Strongly agree"
      2    "Agree"
      3    "Disagree"
      4    "Strongly disagree"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
  /ST19Q01 ST19Q02 ST19Q03 ST19Q04 ST19Q05 ST19Q06
      1    "Very often"
      2    "Regularly"
      3    "Sometimes"
      4    "Hardly ever"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
  /ST20QA1 ST20QA2 ST20QA3 ST20QA4 ST20QA5 ST20QA6
   ST20QB1 ST20QB2 ST20QB3 ST20QB4 ST20QB5 ST20QB6
   ST20QC1 ST20QC2 ST20QC3 ST20QC4 ST20QC5 ST20QC6
   ST20QD1 ST20QD2 ST20QD3 ST20QD4 ST20QD5 ST20QD6
   ST20QE1 ST20QE2 ST20QE3 ST20QE4 ST20QE5 ST20QE6
   ST20QF1 ST20QF2 ST20QF3 ST20QF4 ST20QF5 ST20QF6
   ST20QG1 ST20QG2 ST20QG3 ST20QG4 ST20QG5 ST20QG6
   ST20QH1 ST20QH2 ST20QH3 ST20QH4 ST20QH5 ST20QH6
      1    "Tick"
      2    "No Tick"
      7    "N/A"
      8    "Invalid"
  /ST21Q01 ST21Q02 ST21Q03 ST21Q04 ST21Q05 ST21Q06 ST21Q07 ST21Q08
      1    "High Interest"
      2    "Medium Interest"
      3    "Low Interest"
      4    "No Interest"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
  /ST22Q01 ST22Q02 ST22Q03 ST22Q04 ST22Q05
      1    "Never heard"      
      2    "Know a little"
      3    "Know something"
      4    "Familiar"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
  /ST23QA1 ST23QA2 ST23QA3 ST23QA4 ST23QA5 ST23QA6
   ST23QB1 ST23QB2 ST23QB3 ST23QB4 ST23QB5 ST23QB6
   ST23QC1 ST23QC2 ST23QC3 ST23QC4 ST23QC5 ST23QC6
   ST23QD1 ST23QD2 ST23QD3 ST23QD4 ST23QD5 ST23QD6
   ST23QE1 ST23QE2 ST23QE3 ST23QE4 ST23QE5 ST23QE6
   ST23QF1 ST23QF2 ST23QF3 ST23QF4 ST23QF5 ST23QF6
      1    "Tick"
      2    "No Tick"
      7    "N/A"
      8    "Invalid"
  /ST24Q01 ST24Q02 ST24Q03 ST24Q04 ST24Q05 ST24Q06
      1    "Concern for me"
      2    "Concern for others"
      3    "Concern other countries"
      4    "Not a concern"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
  /ST25Q01 ST25Q02 ST25Q03 ST25Q04 ST25Q05 ST25Q06
      1    "Improve"
      2    "Stay same"
      3    "Get worse"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
  /ST26Q01 ST26Q02 ST26Q03 ST26Q04 ST26Q05 ST26Q06 ST26Q07
      1    "Strongly agree"
      2    "Agree"
      3    "Disagree"
      4    "Strongly disagree"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
  /ST27Q01 ST27Q02 ST27Q03 ST27Q04
      1    "Strongly agree"
      2    "Agree"
      3    "Disagree"
      4    "Strongly disagree"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
  /ST28Q01 ST28Q02 ST28Q03 ST28Q04
      1    "Very well informed"
      2    "Fairly informed"
      3    "Not well informed"
      4    "Not informed at all"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
  /ST29Q01 ST29Q02 ST29Q03 ST29Q04
      1    "Strongly agree"
      2    "Agree"
      3    "Disagree"
      4    "Strongly disagree"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
  /ST30Q01
     "9997" "N/A"
     "9998" "Invalid"
     "9999" "Missing"
  /ST31Q01 ST31Q02 ST31Q03 ST31Q04 ST31Q05 ST31Q06
   ST31Q07 ST31Q08 ST31Q09 ST31Q10 ST31Q11 ST31Q12
      1    "No time"
      2    "Less than 2 hours"
      3    "2 up to 4 hours"
      4    "4 up to 6 hours"
      5    "6 or more hours"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
  /ST32Q01 ST32Q02 ST32Q03 ST32Q04 ST32Q05 ST32Q06
      1    "Yes"
      2    "No"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
  /ST33Q11 ST33Q12  ST33Q21 ST33Q22
   ST33Q31 ST33Q32  ST33Q41 ST33Q42
   ST33Q51 ST33Q52  ST33Q61 ST33Q62
   ST33Q71 ST33Q72  ST33Q81 ST33Q82
      1    "Yes"
      2    "No"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
  /ST34Q01 ST34Q02 ST34Q03 ST34Q04 ST34Q05 ST34Q06
   ST34Q07 ST34Q08 ST34Q09 ST34Q10 ST34Q11 ST34Q12
   ST34Q13 ST34Q14 ST34Q15 ST34Q16 ST34Q17
      1    "All lessons"
      2    "Most Lessons"
      3    "Some lessons"
      4    "Hardly ever"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
  /ST35Q01 ST35Q02 ST35Q03 ST35Q04 ST35Q05
      1    "Strongly agree"
      2    "Agree"
      3    "Disagree"
      4    "Strongly disagree"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
  /ST36Q01 ST36Q02 ST36Q03
      1    "Very important"
      2    "Important"
      3    "Of little importance"
      4    "Not important at all"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
  /ST37Q01 ST37Q02 ST37Q03 ST37Q04 ST37Q05 ST37Q06
      1    "Strongly agree"
      2    "Agree"
      3    "Disagree"
      4    "Strongly disagree"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
.
VALUE LABELS
   IC01Q01
      1    "Yes"
      2    "No"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
  /IC02Q01
      1    "Less than 1 year"
      2    "1 to 3 years"
      3    "3 to 5 years"
      4    "5 years or more"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
  /IC03Q01 IC03Q02 IC03Q03
      1    "Almost every day"
      2    "Once or twice a week"
      3    "Few times a month"
      4    "Once a month or less"
      5    "Never"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
  /IC04Q01 IC04Q02 IC04Q03 IC04Q04 IC04Q05 
   IC04Q06 IC04Q07 IC04Q08 IC04Q09 IC04Q10 IC04Q11
      1    "Almost every day"
      2    "Once or twice a week"
      3    "Few times a month"
      4    "Once a month or less"
      5    "Never"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
  /IC05Q01 IC05Q02 IC05Q03 IC05Q04 IC05Q05 IC05Q06 IC05Q07 IC05Q08
   IC05Q09 IC05Q10 IC05Q11 IC05Q12 IC05Q13 IC05Q14 IC05Q15 IC05Q16
      1    "Do well by myself"
      2    "Do with help"
      3    "Know but can't do"
      4    "Don’t know"
      7    "N/A"
      8    "Invalid"
      9    "Missing"
.
VALUE LABELS
   ISCEDL
      1     "ISCED level 1"
      2     "ISCED level 2"
      3     "ISCED level 3"
      7     "N/A"
      8     "Invalid"
      9     "Missing"
  /ISCEDD
      1     "A"
      2     "B"
      3     "C"
      4     "M"
      7     "N/A"
      8     "Invalid"
      9     "Missing"
  /ISCEDO
      1     "General"
      2     "Pre-Vocational"
      3     "Vocational"
      7     "N/A"
      8     "Invalid"
      9     "Missing"
  /MISCED FISCED HISCED
      0     "None"
      1     "ISCED 1"
      2     "ISCED 2"
      3     "ISCED 3B, C"
      4     "ISCED 3A, ISCED 4"
      5     "ISCED 5B"
      6     "ISCED 5A, 6"
      7     "N/A"
      9     "Missing"
  /MsECATEG FsECATEG HsECATEG
      1     "White collar high skilled"
      2     "White collar low skilled"
      3     "Blue collar high skilled"
      4     "Blue collar low skilled"
      7     "N/A"
      9     "Missing" 
  /SRC_M SRC_F  SRC_E  SRC_S
      0     "No or indeterminate"
      1     "Yes"
      7     "N/A"
      9     "Missing" 
  /IMMIG
      1     "Native"
      2     "Second-Generation"
      3     "First-Generation"
      7     "N/A"
      8     "Invalid"
      9     "Missing"
  /AGE
      97    "N/A"
      98    "Invalid"
      99    "Missing"
  /BMMJ BFMJ BSMJ HISEI
      97    "N/A"
      99    "Missing"
  /PARED
      97    "N/A"
      99    "Missing"
  /CLCUSE3A CLCUSE3B DEFFORT
      997   "N/A"
      998   "Invalid"
      999   "Missing"
  /CARINFO CARPREP CULTPOSS ENVAWARE ENVOPT ENVPERC ESCS
   GENSCIE HEDRES HIGHCONF HOMEPOS INSTSCIE INTCONF INTSCIE
   INTUSE JOYSCIE PERSCIE PRGUSE RESPDEV SCAPPLY SCHANDS
   SCIEACT SCIEEFF SCIEFUT SCINTACT SCINVEST SCSCIE WEALTH
      997   "N/A"
      999   "Missing"
.

VALUE LABELS
   PV1READ PV2READ PV3READ PV4READ PV5READ
      9997  "N/A"
  /S421Q02
     "0" "No credit"
     "1" "Full credit"
     "7" "Not administered"
     "9" "Missing"
  /S456Q01
     "11" "Yes, Yes: Full credit"
     "12" "Yes, No: No credit"
     "18" "Yes, Invalid: No credit"
     "19" "Yes, Missing: No credit"
     "21" "No, Yes: No credit"
     "22" "No, No: No credit"
     "28" "No, Invalid: No credit"
     "29" "No, Missing: No credit"
     "71" "N/A, Yes: Not administered"
     "77" "N/A, N/A: Not administered"
     "81" "Invalid, Yes: No credit"
     "82" "Invalid, No: No credit"
     "88" "Invalid, Invalid: No credit"
     "89" "Invalid, Missing: No credit"
     "91" "Missing, Yes: No credit"
     "92" "Missing, No: No credit"
     "97" "Missing, N/A: Not administered"
     "98" "Missing, Invalid: No credit"
     "99" "Missing, Missing: No credit"
  /S456Q02 
     "1" "No credit"
     "2" "No credit"
     "3" "Full credit"
     "4" "No credit"
     "7" "Not administered"
     "8" "Invalid"
     "9" "Missing"
.

VALUE LABELS
  ST05Q01 ST08Q01 ST30Q01
  "1000"  "LEGISLATORS, SENIOR OFFICIALS & MANAGERS"
  "1100"  "LEGISLATORS & SENIOR OFFICIALS"
  "1110"  "LEGISLATORS [incl. Member of Parliament, Member of Local Council]"
  "1120"  "SENIOR GOVERNMENT OFFICIALS [incl. Minister, Ambassador]"
  "1130"  "SENIOR LOCAL GOVERNMENT OFFICIALS"
  "1140"  "SENIOR OFFICIALS SPECIAL-INTEREST ORGANISATIONS"
  "1141"  "Senior officials political-party organisations"
  "1142"  "Senior officials economic-interest organisations"
  "1143"  "Senior officials special-interest organisations"
  "1200"  "CORPORATE MANAGERS [LARGE ENTERPRISES]"
  "1210"  "[LARGE ENTERPRISES] DIRECTORS & CHIEF EXECUTIVES"
  "1220"  "[LARGE ENTERPRISE OPERATION] DEPARTMENT MANAGERS"
  "1221"  "Production dep. managers agriculture & fishing"
  "1222"  "Production dep. managers manufacturing [incl. Factory Manager]"
  "1223"  "Production dep. managers construction"
  "1224"  "Production dep. managers wholesale & retail trade"
  "1225"  "Production dep. managers restaurants & hotels"
  "1226"  "Production dep. managers transp., storage & communic. ]"
  "1227"  "Production dep. managers business services [incl. Bank Manager]"
  "1228"  "Production dep. managers personal care, cleaning etc"
  "1229"  "Production dep. managers nec [incl. Dean,School Principal]"
  "1230"  "[LARGE ENTERPRISES] OTHER DEPARTMENT MANAGERS"
  "1231"  "Finance & admin. department managers [incl. Company Secretary]"
  "1232"  "Personnel & industrial relations department managers"
  "1233"  "Sales & marketing department managers"
  "1234"  "Advertising & public relations department managers"
  "1235"  "Supply & distribution department managers"
  "1236"  "Computing services department managers"
  "1237"  "Research & development department managers"
  "1239"  "Other department managers nec"
  "1240"  "OFFICE MANAGERS [incl. Clerical Supervisor]"
  "1250"  "MILITARY OFFICERS"
  "1251"  "Higher military officers [Captain and above]"
  "1252"  "Lower grade commissioned officers [incl. Army Lieutenant]"
  "1300"  "[SMALL ENTERPRISE] GENERAL MANAGERS"
  "1310"  "[SMALL ENTERPRISE] GENERAL MANAGERS [incl. Businessman, Trader]"
  "1311"  "[Small enterprise] General managers agr., forestry & fishing"
  "1312"  "[Small enterprise] General managers manufacturing"
  "1313"  "[Small enterprise] General managers constr. [incl. Contractor]"
  "1314"  "[Small enterprise] General managers wholesale & retail trade"
  "1315"  "[Small enterprise] General managers restaurants & hotels"
  "1316"  "[Small enterprise] General managers transp., storage & comm."
  "1317"  "[Small enterprise] General managers business services"
  "1318"  "[Small enterprise] General managers personal care, cleaning etc."
  "1319"  "[Small enterprise] General managers nec [incl. Travel, Fitness]"
  "2000"  "PROFESSIONALS"
  "2100"  "PHYSICAL, MATHEMATICAL & ENGINEERING SCIENCE PROFESSIONALS"
  "2110"  "PHYSICISTS, CHEMISTS & RELATED PROFESSIONALS"
  "2111"  "Physicists & astronomers"
  "2112"  "Meteorologists"
  "2113"  "Chemists"
  "2114"  "Geologists & geophysicists [incl. Geodesist]"
  "2120"  "MATHEMATICIANS, STATISTICIANS ETC PROFESSIONALS"
  "2121"  "Mathematicians etc professionals"
  "2122"  "Statisticians [incl. Actuary]"
  "2130"  "COMPUTING PROFESSIONALS"
  "2131"  "Computer systems designers & analysts [incl. Software Engineer]"
  "2132"  "Computer programmers"
  "2139"  "Computing professionals nec"
  "2140"  "ARCHITECTS, ENGINEERS ETC PROFESSIONALS"
  "2141"  "Architects town & traffic planners [incl. Landscape Architect]"
  "2142"  "Civil engineers [incl. Construction Engineer]"
  "2143"  "Electrical engineers"
  "2144"  "Electronics & telecommunications engineers"
  "2145"  "Mechanical engineers"
  "2146"  "Chemical engineers"
  "2147"  "Mining engineers, metallurgists etc professionals"
  "2148"  "Cartographers & surveyors"
  "2149"  "Architects engineers etc professionals nec [incl. Consultant]"
  "2200"  "LIFE SCIENCE & HEALTH PROFESSIONALS"
  "2210"  "LIFE SCIENCE PROFESSIONALS"
  "2211"  "Biologists, botanists zoologists etc professionals"
  "2212"  "Pharmacologists, pathologists etc profess. [incl. Biochemist]"
  "2213"  "Agronomists etc professionals"
  "2220"  "HEALTH PROFESSIONALS (EXCEPT NURSING)"
  "2221"  "Medical doctors"
  "2222"  "Dentists"
  "2223"  "Veterinarians"
  "2224"  "Pharmacists"
  "2229"  "Health professionals except nursing nec"
  "2230"  "NURSING & MIDWIFERY PROFESS. [incl. Registered Nurses, Midwives]"
  "2300"  "TEACHING PROFESSIONALS"
  "2310"  "HIGHER EDUCATION TEACHING PROFESSIONALS [incl. Univ. Professor]"
  "2320"  "SECONDARY EDUCATION TEACHING PROFESSIONALS"
  "2321"  "[Sec. teachers, academic track] [incl. Middle School Teacher]"
  "2322"  "[Sec. teachers, vocational track] [incl. Vocational Instructor]"
  "2330"  "PRIMARY & PRE-PRIMARY EDUCATION TEACHING PROFESSIONALS"
  "2331"  "Primary education teaching professionals"
  "2332"  "Pre-primary educ. teaching professionals [incl. Kindergarten]"
  "2340"  "SPECIAL EDUC. TEACHING PROFESSIONALS [incl. Remedial, Blind]"
  "2350"  "OTHER TEACHING PROFESSIONALS"
  "2351"  "Education methods specialists [incl. Curricula Developer]"
  "2352"  "School inspectors"
  "2359"  "Other teaching professionals nec"
  "2400"  "OTHER PROFESSIONALS [incl. Professional nfs, Admin. Professional]"
  "2410"  "BUSINESS PROFESSIONALS"
  "2411"  "Accountants [incl. Auditor]"
  "2412"  "Personnel & careers profess. [incl. Job Analyst, Stud. Couns.]"
  "2419"  "Business profess. [incl. Publicity/Patent agent, Market Research]"
  "2420"  "LEGAL PROFESSIONALS"
  "2421"  "Lawyers"
  "2422"  "Judges"
  "2429"  "Legal professionals nec [incl. Notary, Notary Public]"
  "2430"  "ARCHIVISTS, LIBRARIANS ETC INFORMATION PROFESSIONALS"
  "2431"  "Archivists & curators"
  "2432"  "Librarians etc information professionals"
  "2440"  "SOCIAL SCIENCE ETC PROFESSIONALS"
  "2441"  "Economists"
  "2442"  "Sociologists, anthropologists etc professionals"
  "2443"  "Philosophers, historians & political scientists"
  "2444"  "Philologists, translators & interpreters"
  "2445"  "Psychologists"
  "2446"  "Social work professionals [incl. Welfare Worker]"
  "2450"  "WRITERS & CREATIVE OR PERFORMING ARTISTS"
  "2451"  "Authors journalists & other writers [incl. Editor, Techn. Writer]"
  "2452"  "Sculptors, painters etc artists"
  "2453"  "Composers, musicians & singers"
  "2454"  "Choreographers & dancers"
  "2455"  "Film, stage etc actors & directors"
  "2460"  "RELIGIOUS PROFESSIONALS"
  "3000"  "TECHNICIANS AND ASSOCIATE PROFESSIONALS"
  "3100"  "PHYSICAL & ENGINEERING SCIENCE ASSOCIATE PROFESSIONALS"
  "3110"  "PHYSICAL & ENGINEERING SCIENCE TECHNICIANS"
  "3111"  "Chemical & physical science technicians"
  "3112"  "Civil engineering technicians"
  "3113"  "Electrical engineering technicians"
  "3114"  "Electronics & telecommunications engineering technicians"
  "3115"  "Mechanical engineering technicians"
  "3116"  "Chemical engineering technicians"
  "3117"  "Mining & metallurgical technicians"
  "3118"  "Draughtspersons [incl. Technical Illustrator]"
  "3119"  "Physical & engineering science technicians nec"
  "3120"  "COMPUTER ASSOCIATE PROFESSIONALS"
  "3121"  "Computer assistants [incl. Assistant Users Services]"
  "3122"  "Computer equipment operators"
  "3123"  "Industrial robot controllers"
  "3130"  "OPTICAL & ELECTRONIC EQUIPMENT OPERATORS"
  "3131"  "Photographers & electronic equipment operators"
  "3132"  "Broadcasting & telecommunications equipment operators"
  "3133"  "Medical equipment operators [incl. X-ray Technician]"
  "3139"  "Optical & electronic equipment operators nec"
  "3140"  "SHIP & AIRCRAFT CONTROLLERS & TECHNICIANS"
  "3141"  "Ships engineers"
  "3142"  "Ships deck officers & pilots [incl. River Boat Captain]"
  "3143"  "Aircraft pilots etc associate professionals"
  "3144"  "Air traffic controllers"
  "3145"  "Air traffic safety technicians"
  "3150"  "SAFETY & QUALITY INSPECTORS"
  "3151"  "Building & fire inspectors"
  "3152"  "Safety, health & quality inspectors"
  "3200"  "LIFE SCIENCE & HEALTH ASSOCIATE PROFESSIONALS"
  "3210"  "LIFE SCIENCE TECHNICIANS ETC ASSOCIATE PROFESSIONALS"
  "3211"  "Life science technicians [incl. Medical Laboratory Assistant]"
  "3212"  "Agronomy & forestry technicians"
  "3213"  "Farming & forestry advisers"
  "3220"  "MODERN HEALTH ASSOCIATE PROFESSIONALS EXCEPT NURSING"
  "3221"  "Medical assistants"
  "3222"  "Sanitarians"
  "3223"  "Dieticians & nutritionists"
  "3224"  "Optometrists & opticians [incl. Dispensing Optician]"
  "3225"  "Dental assistants [incl. Oral Hygienist]"
  "3226"  "Physiotherapists etc associate professionals"
  "3227"  "Veterinary assistants [incl. Veterinarian Vaccinater]"
  "3228"  "Pharmaceutical assistants"
  "3229"  "Modern health associate professionals except nursing nec"
  "3230"  "NURSING & MIDWIFERY ASSOCIATE PROFESSIONALS"
  "3231"  "Nursing associate professionals [incl. Trainee Nurses]"
  "3232"  "Midwifery associate professionals [incl. Trainee Midwife]"
  "3240"  "TRADITIONAL MEDICINE PRACTITIONERS & FAITH HEALERS"
  "3241"  "Traditional medicine practitioners [incl. Herbalist]"
  "3242"  "Faith healers"
  "3300"  "TEACHING ASSOCIATE PROFESSIONALS"
  "3310"  "PRIMARY EDUCATION TEACHING ASSOCIATE PROFESSIONALS"
  "3320"  "PRE-PRIMARY EDUCATION TEACHING ASSOCIATE PROFESSIONALS"
  "3330"  "SPECIAL EDUCATION TEACHING ASSOCIATE PROFESSIONALS"
  "3340"  "OTHER TEACHING ASSOCIATE PROFESSIONALS"
  "3400"  "OTHER ASSOCIATE PROFESSIONALS"
  "3410"  "FINANCE & SALES ASSOCIATE PROFESSIONALS"
  "3411"  "Securities & finance dealers & brokers"
  "3412"  "Insurance representatives [incl. Insurance Agent, Underwriter]"
  "3413"  "[Real] estate agents [incl. Real Estate Broker]"
  "3414"  "Travel consultants & organisers"
  "3415"  "Technical & commercial sales representatives"
  "3416"  "Buyers"
  "3417"  "Appraisers, valuers & auctioneers [incl. Claims Adjuster]"
  "3419"  "Finance & sales associate professionals nec"
  "3420"  "BUSINESS SERVICES AGENTS AND TRADE BROKERS"
  "3421"  "Trade brokers"
  "3422"  "Clearing & forwarding agents"
  "3423"  "Employment agents & labour contractors"
  "3429"  "Business services agents & trade brokers nec"
  "3430"  "ADMINISTRATIVE ASSOCIATE PROFESSIONALS"
  "3431"  "Administrative secretaries etc associate professionals"
  "3432"  "Legal etc business associate profess. [incl. Bailiff, Law Clerk]"
  "3433"  "Bookkeepers"
  "3434"  "Statistical, mathematical etc associate professionals"
  "3439"  "Administrative associate profess. nec [incl. Management Ass.]"
  "3440"  "CUSTOMS, TAX ETC GOVERNMENT ASSOCIATE PROFESSIONALS"
  "3441"  "Customs & border inspectors"
  "3442"  "Government tax & excise officials"
  "3443"  "Government social benefits officials"
  "3444"  "Government licensing officials"
  "3449"  "Customs tax etc government associate professionals nec"
  "3450"  "POLICE INSPECTORS & DETECTIVES / [ARMY]"
  "3451"  "Police inspectors & detectives"
  "3452"  "[Armed forces non-commissioned officers] [incl. Sergeant]"
  "3460"  "SOCIAL WORK ASSOCIATE PROFESSIONALS"
  "3470"  "ARTISTIC, ENTERTAINMENT & SPORTS ASSOCIATE PROFESSIONALS"
  "3471"  "Decorators & commercial designers"
  "3472"  "Radio, television & other announcers"
  "3473"  "Street night-club etc musicians, singers & dancers"
  "3474"  "Clowns, magicians, acrobats etc associate professionals"
  "3475"  "Athletes, sports persons etc associate professionals"
  "3480"  "RELIGIOUS ASSOCIATE PROFESS. [incl. Evangelist, Lay Preacher]"
  "4000"  "CLERKS"
  "4100"  "OFFICE CLERKS [Incl. Clerk nfs, Government Office Clerk nfs]"
  "4110"  "SECRETARIES & KEYBOARD-OPERATING CLERKS"
  "4111"  "Stenographers & typists"
  "4112"  "Word-processor etc operators [incl. Teletypist]"
  "4113"  "Data entry operators [incl. Key Puncher]"
  "4114"  "Calculating-machine operators [incl. Bookkeeping Machine Op.]"
  "4115"  "Secretaries"
  "4120"  "NUMERICAL CLERKS"
  "4121"  "Accounting & bookkeeping clerks [incl. Payroll Clerk]"
  "4122"  "Statistical & finance clerks [incl. Credit Clerk]"
  "4130"  "MATERIAL-RECORDING & TRANSPORT CLERKS"
  "4131"  "Stock clerks [incl. Weighing Clerk, Storehouse Clerk]"
  "4132"  "Production clerks [incl. Planning Clerks]"
  "4133"  "Transport clerks [incl. Dispatcher, Expeditor]"
  "4140"  "LIBRARY, MAIL ETC CLERKS"
  "4141"  "Library & filing clerks"
  "4142"  "Mail carriers & sorting clerks"
  "4143"  "Coding proof-reading etc clerks"
  "4144"  "Scribes etc workers [incl. Form Filling Assistance Clerk]"
  "4190"  "OTHER OFFICE CLERKS [incl. Office Boy, Photocopy Machine Op.]"
  "4200"  "CUSTOMER SERVICES CLERKS [incl. Customer Service Clerk nfs]"
  "4210"  "CASHIERS, TELLERS ETC CLERKS"
  "4211"  "Cashiers & ticket clerks [incl. Bank/Store, Toll Collector]"
  "4212"  "Tellers & other counter clerks [incl. Bank Teller, Post Office]"
  "4213"  "Bookmakers & croupiers"
  "4214"  "Pawnbrokers & money-lenders"
  "4215"  "Debt-collectors etc workers"
  "4220"  "CLIENT INFORMATION CLERKS"
  "4221"  "Travel agency etc clerks"
  "4222"  "Receptionists & information clerks [incl. Medical Receptionist]"
  "4223"  "Telephone switchboard operators [incl. Telephone Operator]"
  "5000"  "SERVICE WORKERS & SHOP & MARKET SALES WORKERS"
  "5100"  "PERSONAL & PROTECTIVE SERVICES WORKERS"
  "5110"  "TRAVEL ATTENDANTS ETC"
  "5111"  "Travel attendants & travel stewards"
  "5112"  "Transport conductors [incl. Train Conductor]"
  "5113"  "Travel, museum guides"
  "5120"  "HOUSEKEEPING & RESTAURANT SERVICES WORKERS"
  "5121"  "Housekeepers etc workers"
  "5122"  "Cooks"
  "5123"  "Waiters, waitresses & bartenders"
  "5130"  "PERSONAL CARE ETC WORK"
  "5131"  "Child-care workers [incl. Nursemaid, Governess]"
  "5132"  "Inst.-based personal care workers [incl. Ambulance, Orderly]"
  "5133"  "Home based personal care workers [incl. Attendant]"
  "5139"  "[Other] care etc workers nec [incl. Animal Feeder]"
  "5140"  "OTHER PERSONAL SERVICES WORKERS"
  "5141"  "Hairdressers, barbers, beauticians etc workers"
  "5142"  "Companions & valets [incl. Personal Maid]"
  "5143"  "Undertakers & embalmers [incl. Funeral Director]"
  "5149"  "Other personal services workers [incl. Escort, Dancing Partner]"
  "5150"  "ASTROLOGERS, FORTUNE-TELLERS ETC WORKERS"
  "5151"  "Astrologers etc workers"
  "5152"  "Fortune-tellers, palmists etc workers"
  "5160"  "PROTECTIVE SERVICES WORKERS"
  "5161"  "Fire-fighters"
  "5162"  "Police officers [Incl. Policeman, Constable, Marshall]"
  "5163"  "Prison guards"
  "5164"  "[Armed forces, soldiers] [incl. Enlisted Man]"
  "5169"  "Protective services workers [incl. Bodyguard, Coastguard]"
  "5200"  "[SALESPERSONS, MODELS & DEMONSTRATORS]"
  "5210"  "FASHION & OTHER MODELS [incl. Mannequin, Artists Model]"
  "5220"  "SHOP SALESPERSONS & DEMONSTRATORS"
  "5230"  "STALL & MARKET SALESPERSONS"
  "6000"  "SKILLED AGRICULTURAL & FISHERY WORKERS"
  "6100"  "MARKET-ORIENTED SKILLED AGRICULTURAL & FISHERY WORKERS"
  "6110"  "MARKET GARDENERS & CROPGROWERS"
  "6111"  "Field crop & vegetable growers"
  "6112"  "Tree & shrub crop growers"
  "6113"  "Gardeners, horticultural & nursery growers"
  "6114"  "Mixed-crop growers [Incl. Share Cropper]"
  "6120"  "MARKET-ORIENTED ANIMAL PRODUCERS ETC WORKERS"
  "6121"  "Dairy & livestock producers"
  "6122"  "Poultry producers [incl. Chicken Farmer, Skilled Hatchery Worker]"
  "6123"  "Apiarists & sericulturists [incl. Beekeeper, Silkworm Raiser]"
  "6124"  "Mixed-animal producers"
  "6129"  "Market-oriented animal producers etc workers nec"
  "6130"  "MARKET-ORIENTED CROP & ANIMAL PRODUCERS"
  "6131"  "[Mixed farmers]"
  "6132"  "[Farm foremen/supervisor]"
  "6133"  "[Farmers nfs]"
  "6134"  "[Skilled farm workers nfs]"
  "6140"  "FORESTRY ETC WORKERS"
  "6141"  "Forestry workers & loggers [incl. Rafter, Timber Cruiser]"
  "6142"  "Charcoal burners etc workers"
  "6150"  "FISHERY WORKERS, HUNTERS & TRAPPERS"
  "6151"  "Aquatic-life cultivation workers"
  "6152"  "Inland & coastal waters fishery workers"
  "6153"  "Deep-sea fishery workers [incl. Fisherman nfs, Trawler Crewman]"
  "6154"  "Hunters & trappers [incl. Whaler]"
  "6200"  "SUBSISTENCE AGRICULTURAL & FISHERY WORKERS"
  "6210"  "SUBSISTENCE AGRICULTURAL & FISHERY WORKERS"
  "7000"  "CRAFT ETC TRADES WORKERS"
  "7100"  "EXTRACTION & BUILDING TRADES WORKERS"
  "7110"  "MINERS, SHOTFIRERS, STONE CUTTERS & CARVERS"
  "7111"  "Miners & quarry workers [incl. Miner nfs]"
  "7112"  "Shotfirers & blasters"
  "7113"  "Stone splitters, cutters & carvers [incl. Tombstone Carver]"
  "7120"  "BUILDING FRAME ETC TRADES WORKERS"
  "7121"  "Builders traditional materials"
  "7122"  "Bricklayers & stonemasons [incl. Paviour]"
  "7123"  "Concrete placers, concrete finishers etc workers"
  "7124"  "Carpenters & joiners"
  "7129"  "Building frame etc trades workers nec [incl. Scaffolder]"
  "7130"  "BUILDING FINISHERS ETC TRADES WORKERS"
  "7131"  "Roofers"
  "7132"  "Floor layers & tile setters [incl. Parquetry Worker]"
  "7133"  "Plasterers [incl. Stucco Mason]"
  "7134"  "Insulation workers"
  "7135"  "Glaziers"
  "7136"  "Plumbers & pipe fitters [incl. Well Digger]"
  "7137"  "Building etc electricians"
  "7140"  "PAINTERS, BUILDING STRUCTURE CLEANERS ETC TRADES WORKERS"
  "7141"  "Painters etc workers [incl. Construction Painter, Paperhanger]"
  "7142"  "Varnishers etc painters [incl. Automobile Painter]"
  "7143"  "Building structure cleaners [incl. Chimney Sweep, Sandblaster]"
  "7200"  "METAL, MACHINERY ETC TRADES WORKERS"
  "7210"  "METAL MOULDERS, WELDERS, SHEETMETAL WORKERS STRUCTURAL METAL"
  "7211"  "Metal moulders & coremakers"
  "7212"  "Welders & flamecutters [incl. Brazier, Solderer]"
  "7213"  "Sheet-metal workers [incl. Panel Beater, Coppersmith, Tinsmith]"
  "7214"  "Structural-metal preparers & erectors"
  "7215"  "Riggers & cable splicers"
  "7216"  "Underwater workers [incl. Frogman]"
  "7220"  "BLACKSMITHS, TOOL-MAKERS ETC TRADES WORKERS"
  "7221"  "Blacksmiths, hammer-smiths & forging press workers"
  "7222"  "Tool-makers etc workers [incl. Locksmith]"
  "7223"  "Machine-tool setters & setter-operators [Metal driller, Turner]"
  "7224"  "Metal wheel-grinders, polishers & tool sharpeners"
  "7230"  "MACHINERY MECHANICS & FITTERS"
  "7231"  "Motor vehicle mechanics & fitters [incl. Bicycle Repairman]"
  "7232"  "Aircraft engine mechanics & fitters"
  "7233"  "[Industrial & agricultural] machinery mechanics & fitters"
  "7234"  "[Unskilled garage worker] [incl. Oiler-Greaser]"
  "7240"  "ELECTRICAL & ELECTRONIC EQUIPMENT MECHANICS & FITTERS"
  "7241"  "Electrical mechanics & fitters [incl. Office Machine Repairman]"
  "7242"  "Electronics fitters"
  "7243"  "Electronics mechanics & servicers"
  "7244"  "Telegraph & telephone installers & servicers"
  "7245"  "Electrical line installers, repairers & cable jointers"
  "7300"  "PRECISION, HANDICRAFT, PRINTING ETC TRADES WORKERS"
  "7310"  "PRECISION WORKERS IN METAL ETC MATERIALS"
  "7311"  "Precision-instr. makers & repairers [incl. Dental, Watch Maker]"
  "7312"  "Musical-instrument makers & tuners"
  "7313"  "Jewellery & precious-metal workers [incl. Goldsmith]"
  "7320"  "POTTERS, GLASS-MAKERS ETC TRADES WORKERS"
  "7321"  "Abrasive wheel formers, potters etc workers"
  "7322"  "Glass-makers, cutters, grinders & finishers"
  "7323"  "Glass engravers & etchers"
  "7324"  "Glass ceramics etc decorative painters"
  "7330"  "HANDICRAFT WORKERS IN WOOD,TEXTILE, LEATHER ETC"
  "7331"  "Handicraft workers in wood etc materials"
  "7332"  "Handicraft workers in textile leather etc materials"
  "7340"  "PRINTING ETC TRADES WORKERS"
  "7341"  "Compositors typesetters etc workers"
  "7342"  "Stereotypers & electrotypers"
  "7343"  "Printing engravers & etchers"
  "7344"  "Photographic etc workers [incl. Darkroom worker]"
  "7345"  "Bookbinders etc workers"
  "7346"  "Silk-screen, block & textile printers"
  "7400"  "OTHER CRAFT ETC TRADES WORKERS"
  "7410"  "FOOD PROCESSING ETC TRADES WORKERS"
  "7411"  "Butchers, fishmongers etc food preparers"
  "7412"  "Bakers, pastry-cooks & confectionery makers"
  "7413"  "Dairy-products makers"
  "7414"  "Fruit, vegetable etc preservers"
  "7415"  "Food & beverage tasters & graders"
  "7416"  "Tobacco preparers & tobacco products makers"
  "7420"  "WOOD TREATERS, CABINET-MAKERS ETC TRADES WORKERS"
  "7421"  "Wood treaters [incl. Wood Grader, Wood Impregnator]"
  "7422"  "Cabinet-makers etc workers [incl. Cartwright, Cooper]"
  "7423"  "Woodworking-machine setters & setter-operators"
  "7424"  "Basketry weavers, brush makers etc workers [incl. Broom Maker]"
  "7430"  "TEXTILE, GARMENT ETC TRADES WORKERS"
  "7431"  "Fibre preparers"
  "7432"  "Weavers, knitters etc workers"
  "7433"  "Tailors, dressmakers & hatters [incl. Milliner]"
  "7434"  "Furriers etc workers"
  "7435"  "Textile, leather etc pattern-makers & cutters"
  "7436"  "Sewers, embroiderers etc workers"
  "7437"  "Upholsterers etc workers"
  "7440"  "PELT, LEATHER & SHOEMAKING TRADES WORKERS"
  "7441"  "Pelt dressers, tanners & fellmongers"
  "7442"  "Shoe-makers etc workers"
  "7500"  "[SKILLED WORKERS NFS]"
  "7510"  "[MANUAL FOREMEN NFS --NON-FARM--]"
  "7520"  "[SKILLED WORKERS NFS] [incl. Craftsman, Artisan, Tradesman]"
  "7530"  "[APPRENTICE SKILLED WORK NFS]"
  "8000"  "PLANT & MACHINE OPERATORS & ASSEMBLERS"
  "8100"  "STATIONARY-PLANT ETC OPERATORS"
  "8110"  "MINING- & MINERAL-PROCESSING PLANT OPERATORS"
  "8111"  "Mining-plant operators"
  "8112"  "Mineral-ore- & stone-processing-plant operators"
  "8113"  "Well drillers & borers etc workers"
  "8120"  "METAL-PROCESSING-PLANT OPERATORS"
  "8121"  "Ore & metal furnace operators"
  "8122"  "Metal melters, casters & rolling-mill operators"
  "8123"  "Metal-heat-treating-plant operators"
  "8124"  "Metal drawers & extruders"
  "8130"  "GLASS, CERAMICS ETC PLANT OPERATORS"
  "8131"  "Glass & ceramics kiln etc machine operators"
  "8139"  "Glass, ceramics etc plant operators nec"
  "8140"  "WOOD-PROCESSING- & PAPERMAKING-PLANT OPERATORS"
  "8141"  "Wood-processing-plant operators [incl. Sawyer]"
  "8142"  "Paper-pulp plant operators"
  "8143"  "Papermaking-plant operators"
  "8150"  "CHEMICAL-PROCESSING-PLANT OPERATORS"
  "8151"  "Crushing- grinding- & chemical-mixing machinery operators"
  "8152"  "Chemical-heat-treating-plant operators"
  "8153"  "Chemical-filtering- & separating-equipment operators"
  "8154"  "Chemical-still & reactor operators"
  "8155"  "Petroleum- & natural-gas-refining-plant operators"
  "8159"  "Chemical-processing-plant operators nec"
  "8160"  "POWER-PRODUCTION ETC PLANT OPERATORS"
  "8161"  "Power-production plant operators"
  "8162"  "Steam-engine & boiler operators [incl. Stoker]"
  "8163"  "Incinerator water-treatment etc plant operators"
  "8170"  "AUTOMATED-ASSEMBLY-LINE & INDUSTRIAL-ROBOT OPERATORS"
  "8171"  "Automated-assembly-line operators"
  "8172"  "Industrial-robot operators"
  "8200"  "MACHINE OPERATORS & ASSEMBLERS"
  "8210"  "METAL- & MINERAL-PRODUCTS MACHINE OPERATORS"
  "8211"  "Machine-tool operators [incl. Machine Operator nfs]"
  "8212"  "Cement & other mineral products machine operators"
  "8220"  "CHEMICAL-PRODUCTS MACHINE OPERATORS"
  "8221"  "Pharmaceutical- & toiletry-products machine operators"
  "8222"  "Ammunition- & explosive-products machine operators"
  "8223"  "Metal finishing- plating- & coating-machine operators"
  "8224"  "Photographic-products machine operators"
  "8229"  "Chemical-products machine operators nec"
  "8230"  "RUBBER- & PLASTIC-PRODUCTS MACHINE OPERATORS"
  "8231"  "Rubber-products machine operators"
  "8232"  "Plastic-products machine operators"
  "8240"  "WOOD-PRODUCTS MACHINE OPERATORS"
  "8250"  "PRINTING-, BINDING- & PAPER-PRODUCTS MACHINE OPERATORS"
  "8251"  "Printing-machine operators"
  "8252"  "Bookbinding-machine operators"
  "8253"  "Paper-products machine operators"
  "8260"  "TEXTILE-, FUR- & LEATHER-PRODUCTS MACHINE OPERATORS"
  "8261"  "Fibre-preparing-, spinning- & winding machine operators"
  "8262"  "Weaving- & knitting-machine operators"
  "8263"  "Sewing-machine operators"
  "8264"  "Bleaching-, dyeing- & cleaning-machine operators"
  "8265"  "Fur- & leather-preparing-machine operators"
  "8266"  "Shoemaking- etc machine operators"
  "8269"  "Textile-, fur- & leather-products machine operators nec"
  "8270"  "FOOD ETC PRODUCTS MACHINE OPERATORS"
  "8271"  "Meat- & fish-processing-machine operators"
  "8272"  "Dairy-products machine operators"
  "8273"  "Grain- & spice-milling-machine operators"
  "8274"  "Baked-goods cereal & chocolate-products machine operators"
  "8275"  "Fruit-, vegetable- & nut-processing-machine operators"
  "8276"  "Sugar production machine operators"
  "8277"  "Tea-, coffee- & cocoa-processing-machine operators"
  "8278"  "Brewers- wine & other beverage machine operators"
  "8279"  "Tobacco production machine operators"
  "8280"  "ASSEMBLERS"
  "8281"  "Mechanical-machinery assemblers [incl. Car Assembly Line Worker]"
  "8282"  "Electrical-equipment assemblers"
  "8283"  "Electronic-equipment assemblers"
  "8284"  "Metal-, rubber- & plastic-products assemblers"
  "8285"  "Wood etc products assemblers"
  "8286"  "Paperboard, textile etc products assemblers"
  "8290"  "OTHER MACHINE OPERATORS & ASSEMBLERS"
  "8300"  "DRIVERS & MOBILE-PLANT OPERATORS"
  "8310"  "LOCOMOTIVE-ENGINE DRIVERS ETC WORKERS"
  "8311"  "Locomotive-engine drivers"
  "8312"  "Railway brakers signallers & shunters"
  "8320"  "MOTOR-VEHICLE DRIVERS [incl. Driver nfs]"
  "8321"  "Motor-cycle drivers"
  "8322"  "Car, taxi & van drivers [incl. Taxi Owner nfs]"
  "8323"  "Bus & tram drivers"
  "8324"  "Heavy truck & lorry drivers"
  "8330"  "AGRICULTURAL & OTHER MOBILE PLANT OPERATORS"
  "8331"  "Motorised farm & forestry plant operators [incl. Tractor Driver]"
  "8332"  "Earth-moving- etc plant operators [incl. Bulldozer Driver]"
  "8333"  "Crane, hoist etc plant operators"
  "8334"  "Lifting-truck operators"
  "8340"  "SHIPS DECK CREWS ETC WORKERS [incl. Boatman, Deck Hand, Sailor]"
  "8400"  "SEMI-SKILLED WORKERS NFS [Incl. Production Process Worker nfs]"
  "9000"  "ELEMENTARY OCCUPATIONS"
  "9100"  "SALES & SERVICES ELEMENTARY OCCUPATIONS"
  "9110"  "STREET VENDORS ETC WORKERS"
  "9111"  "Street food vendors"
  "9112"  "Street vendors non-food products [incl. Hawker, Pedlar]"
  "9113"  "Door-to-door & tel. salespersons [incl. Solicitor, Canvasser]"
  "9120"  "STREET SERVICES ELEMENTARY OCCUPATIONS [incl. Billposter]"
  "9130"  "DOMESTIC ETC HELPERS CLEANERS & LAUNDERERS"
  "9131"  "Domestic helpers & cleaners [incl. Housemaid, Housekeeper nfs]"
  "9132"  "Helpers & cleaners in establishments [Kitchen Hand, Chambermaid]"
  "9133"  "Hand-launderers & pressers"
  "9140"  "BUILDING CARETAKERS, WINDOW ETC CLEANERS"
  "9141"  "Building caretakers [incl. Janitor, Sexton, Verger]"
  "9142"  "Vehicle, window etc cleaners"
  "9150"  "MESSENGERS, PORTERS, DOORKEEPERS ETC WORKERS"
  "9151"  "Messengers, package & luggage porters & deliverers"
  "9152"  "Doorkeepers, watch-persons etc workers"
  "9153"  "Vending-machine money collectors, meter readers etc workers"
  "9160"  "GARBAGE COLLECTORS ETC LABOURERS"
  "9161"  "Garbage collectors [incl. Dustwoman]"
  "9162"  "Sweepers etc labourers [incl. Odd-Job Worker]"
  "9200"  "AGRICULTURAL, FISHERY ETC LABOURERS"
  "9210"  "AGRICULTURAL, FISHERY ETC LABOURERS"
  "9211"  "Farm-hands & labourers [incl. Cowherd, Farm Helper, Fruit Picker]"
  "9212"  "Forestry labourers"
  "9213"  "Fishery, hunting & trapping labourers"
  "9300"  "LABOURERS IN MINING, CONSTRUCTION, MANUFACTURING & TRANSPORT"
  "9310"  "MINING & CONSTRUCTION LABOURERS"
  "9311"  "Mining & quarrying labourers"
  "9312"  "Construction & maintenance labourers: roads dams etc"
  "9313"  "Building construction labourers [incl. Handyman, Hod Carrier]"
  "9320"  "MANUFACTURING LABOURERS"
  "9321"  "Assembling labourers [incl. Sorter, Bottle Sorter, Winder]"
  "9322"  "Handpackers & other manufacturing labourers [incl. Crater]"
  "9330"  "TRANSPORT LABOURERS & FREIGHT HANDLERS"
  "9331"  "Hand or pedal vehicle drivers [incl. Rickshaw Driver]"
  "9332"  "Drivers of animal-drawn vehicles & machinery"
  "9333"  "Freight handlers [incl. Docker, Loader, Longshoreman, Remover]"
  "9501"  "Housewife"
  "9502"  "Student"
  "9503"  "Social beneficiary (unemployed, retired, sickness, etc.)"
  "9504"  "Do not know"
  "9505"  "Vague(a good job, a quiet job, a well paid job, an office job)"
  "9997"  "N/A"
  "9998"  "Invalid"
  "9999"  "Missing"
.

VALUE LABELS
  TESTLANG
    "ARA"     "Arabic"
    "AZE"     "Azerbaijani"
    "BAQ"     "Basque"
    "BUL"     "Bulgarian"
    "CAT"     "Catalan"
    "CHI"     "Chinese"
    "CZE"     "Czech"
    "DAN"     "Danish"
    "DUT"     "Dutch"
    "ENG"     "English"
    "EST"     "Estonian"
    "FIN"     "Finnish"
    "FRE"     "French"
    "GER"     "German"
    "GLE"     "Irish"
    "GLG"     "Galician"
    "GRE"     "Greek, Modern"
    "HEB"     "Hebrew"
    "HUN"     "Hungarian"
    "ICE"     "Icelandic"
    "IND"     "Indonesian"
    "ITA"     "Italian"
    "JPN"     "Japanese"
    "KIR"     "Kyrgyz"
    "KOR"     "Korean"
    "LAV"     "Latvian"
    "LIT"     "Lithuanian"
    "NOR"     "Norwegian"
    "POL"     "Polish"
    "POR"     "Portuguese"
    "QMN"     "Montenegrin"
    "QTU"     "Arabic dialect (TUN)"
    "QVL"     "Valencian"
    "RUM"     "Romanian"
    "RUS"     "Russian"
    "SCC"     "Serbian"
    "SCR"     "Croatian"
    "SLO"     "Slovak"
    "SLV"     "Slovenian"
    "SPA"     "Spanish"
    "SWE"     "Swedish"
    "THA"     "Thai"
    "TUR"     "Turkish"
    "UZB"     "Uzbek"
    "WEL"     "Welsh"
.
VALUE LABELS
  LANGN
    "105"	 "Kurdish"
    "108"	 "Tagalog"
    "113"	 "Indonesian"
    "118"	 "Romanian"
    "121"	 "Estonian"
    "133"	 "Romansh"
    "140"	 "Albanian"
    "148"	 "German"
    "156"	 "Spanish"
    "160"	 "Catalan"
    "170"	 "Slovak"
    "192"	 "Bosnian"
    "200"	 "Italian"
    "230"	 "Walloon"
    "232"	 "Portuguese"
    "244"	 "Czech"
    "258"	 "Urdu"
    "264"	 "Danish"
    "266"	 "Croatian"
    "272"	 "Samoan"
    "273"	 "Polish"
    "286"	 "Japanese"
    "301"	 "Korean"
    "313"	 "English"
    "316"	 "Chinese"
    "317"	 "Serbian"                          
    "322"	 "Dutch"
    "325"	 "Latvian"
    "329"	 "Vietnamese"
    "344"	 "Turkish"
    "351"	 "Bulgarian"
    "363"	 "Kyrgyz"
    "369"	 "Azerbaijani"
    "375"	 "Lithuanian"
    "379"	 "Welsh"
    "381"	 "Romani"
    "382"	 "Scottish Gaelic"
    "412"	 "Panjabi"
    "415"	 "Hindi"
    "420"	 "Finnish"
    "422"	 "Hebrew"
    "434"	 "Irish"
    "442"	 "Slovenian"
    "449"	 "Greek, Modern"
    "451"	 "Basque"
    "463"	 "Australian Indigenous languages"
    "465"	 "Maori"
    "467"	 "Icelandic"
    "471"	 "Uzbek"
    "474"	 "Galician"
    "492"	 "Macedonian"
    "493"	 "French"
    "494"	 "Swedish"
    "495"	 "Russian"
    "496"	 "Hungarian"
    "500"	 "Arabic"
    "507"	 "Letzeburgesch"
    "514"	 "Ukrainian"
    "523"	 "Norwegian"
    "540"	 "Sami"
    "555"	 "Thai"
    "600"	 "Yugoslavian - Serbian, Croatian, etc"
    "602"	 "National Minorities languages and Bulgarian dialects (BGR)"
    "604"	 "Italian (CHE)"
    "605"	 "Other European Languages (QSC)"
    "606"	 "Western European languages"
    "607"	 "Regional languages (FRA)"
    "608"	 "Valencian"
    "609"	 "Chinese dialects or languages (HKG)"
    "610"	 "Another language officially recognised in Italy"
    "611"	 "A dialect (ITA)"
    "612"	 "German (CHE)"
    "614"	 "Languages of the former USSR"
    "615"	 "Eastern European languages"
    "616"	 "National dialects or languages (THA)"
    "617"	 "Arabic dialect (TUN)"
    "620"	 "Dialect of Slovak (SVK)"
    "621"	 "Flemish dialect (BEL)"
    "622"	 "Serbian of a yekavian variant or Montenegrin"
    "623"	 "Other European Languages (NLD)"
    "624"	 "Another language spoken in a European Union country (ITA)"
    "625"	 "Cantonese"
    "626"	 "Ulster Scots"
    "627"	 "Other national dialects or languages (ROU)"
    "628"	 "Taiwanese dialect (TWN)"
    "629"	 "Indigenous  language (ARG)"
    "638"	 "German (LIE)"
    "639"	 "Languages of other republics in the former Yugoslavia (SVN)"
    "640"	 "German dialect (BEL)"
    "641"	 "Mandarin"
    "642"	 "Local language in Indonesia (IDN)"
    "650"	 "Aboriginal dialect (TWN)"
    "661"	 "Hakka dialect (TWN)"
    "800"	 "Other languages (ARG)"
    "801"	 "Other languages (AUS)"
    "802"	 "Other languages (AUT)"
    "803"	 "Other languages (AZE)"
    "804"	 "Other languages (BEL)"
    "805"	 "Other languages (BRA)"
    "806"	 "Other languages (BGR)"
    "807"	 "Other languages (CAN)"
    "808"	 "Other languages (CHL)"
    "809"	 "Other languages (TWN)"
    "810"	 "Other languages (COL)"
    "811"	 "Other languages (HRV)"
    "812"	 "Other languages (CZE)"
    "813"	 "Other languages (DNK)"
    "814"	 "Other languages (EST)"
    "815"	 "Other languages (FIN)"
    "816"	 "Other languages (FRA)"
    "818"	 "Other languages (DEU)"
    "819"	 "Other languages (GRC)"
    "820"	 "Other languages (HKG)"
    "821"	 "Other languages (HUN)"
    "822"	 "Other languages (ISL)"
    "823"	 "Other languages (IDN)"
    "824"	 "Other languages (IRL)"
    "825"	 "Other languages (ISR)"
    "826"	 "Other languages (ITA)"
    "827"	 "Other languages (JPN)"
    "828"	 "Other languages (JOR)"
    "830"	 "Other languages (KGZ)"
    "831"	 "Other languages (LVA)"
    "833"	 "Other languages (LTU)"
    "834"	 "Other languages (LUX)"
    "835"	 "Other languages (MAC)"
    "836"	 "Other languages (MEX)"
    "837"	 "Other languages (MNE)"
    "838"	 "Other languages (NLD)"
    "839"	 "Other languages (NZL)"
    "840"	 "Other languages (NOR)"
    "842"	 "Other languages (POL)"
    "843"	 "Other languages (PRT)"
    "844"	 "Other languages (QAT)"
    "845"	 "Other languages (KOR)"
    "846"	 "Other languages (ROU)"
    "847"	 "Other languages (RUS)"
    "848"	 "Other languages (GBR-QSC)"
    "850"	 "Other languages (SVK)"
    "851"	 "Other languages (SVN)"
    "852"	 "Other languages (ESP)"
    "853"	 "Other languages (SWE)"
    "854"	 "Other languages (CHE)"
    "855"	 "Other languages (THA)"
    "856"	 "Other languages (TUN)"
    "857"	 "Other languages (TUR)"
    "858"	 "Other languages (GBR-QUK)"
    "859"	 "Other languages (USA)"
    "860"	 "Other languages (URY)"
    "861"	 "Other languages (SRB)"
    "997"	 "N/A"
    "998"	 "Invalid"
    "999"	 "Missing"
.

VALUE LABELS
   PROGN
     "0310001"   "AZE: PROGRAMME OF BASIC GENERAL EDUCATION (LOWER SECONDARY)"
     "0310002"   "AZE: PROGRAMME OF SECONDARY GENERAL EDUCATION (UPPER SECONDARY)"
     "0310003"   "AZE: PROGRAMME OF INITIAL PROFESSIONAL EDUC. (PROF. SCHOOLS, ETC.)"
     "0310004"   "AZE: PROGRAMME OF SEC. PROF. EDUCATION (TECHNIKUM, COLLEGE, ETC.)"
     "0320001"   "ARG: PRIMARY - 7TH YEAR (OLD)"
     "0320002"   "ARG: GENERAL PROGRAMME WITH 3RD CYCLE - LOWER SECONDARY (NEW)"
     "0320003"   "ARG: GENERAL PROGR. - ONLY GBE 3RD CYCLE - LOWER SEC. (NEW)"
     "0320004"   "ARG: ARTISTIC, EGB AND POLIMODAL - LOWER SECONDARY- 7TH TO 9TH YEAR"
     "0320005"   "ARG: ARTISTIC-EGB & POLIMODAL - GENERAL UPPER SEC. - YEAR 1-3 (NEW)"
     "0320006"   "ARG: GENERAL PROGRAMME - LOWER SEC., CORDOBA, YEAR 1-3 (NEW)"
     "0320007"   "ARG: GENERAL PROGRAMME - YEAR 4-6 UPPER SEC., CORDOBA - (NEW)"
     "0320008"   "ARG: ARTISTIC / GENERAL PROGR. - LOWER SECONDARY YEAR 1-2 (OLD)"
     "0320009"   "ARG: ARTISTIC,GENERAL PROGR. - UPPER SEC. YEAR 3 (OLD)"
     "0320010"   "ARG: ARTISTIC, GENERAL PROGR. - LOWER SECONDARY YEAR 1-2 (OLD)"
     "0320011"   "ARG: ARTISTIC, GENERAL PROGR. - UPPER SECONDARY (OLD)"
     "0320012"   "ARG: VOCATIONAL PROGR. - TECHNICAL EDUC., LOWER SEC. - .YEAR 1-2 (OLD)"
     "0320013"   "ARG: VOCATIONAL PROGR. - TECHNICAL EDUC., UPPER SEC. YEAR 3 (OLD)"
     "0320014"   "ARG: VOCATIONAL PROGR. - TECHNICAL EDUC., UPPER SEC. YEAR 4-6,7 (OLD)"
     "0320015"   "ARG: ARTISTIC, POLIMODAL - YEAR 1-3 (NEW) GENERAL PROGRAMME"
     "0320016"   "ARG: SEC. YEAR 3-5 WITH ADULT GENERAL PROGR., UPPER SEC. (NEW)"
     "0320017"   "ARG: POLIMODAL WITH ADULT GENERAL PROGR. - UPPER SECONDARY (NEW)"
     "0320018"   "ARG: ADULT EDUCATION - GENERAL PROGRAMME UPPER SECONDARY"
     "0320019"   "ARG: ARTISTIC AND PROFESSIONAL COURSES (INFORMAL EDUC.)"
     "0360001"   "AUS: LOWER SECONDARY GENERAL ACADEMIC"
     "0360002"   "AUS: LOWER SECONDARY WITH SOME VET SUBJECTS"
     "0360003"   "AUS: UPPER SECONDARY GENERAL ACADEMIC"
     "0360004"   "AUS: UPPER SECONDARY WITH SOME VET SUBJECTS"
     "0360005"   "AUS: UPPER SECONDARY VET COURSE"
     "0400002"   "AUT: LOWER SECONDARY SCHOOL"
     "0400003"   "AUT: VOCATIONAL PROGRAMME"
     "0400004"   "AUT: SPECIAL EDUCATION SCHOOL (LOWER SECONDARY)"
     "0400005"   "AUT: SPECIAL EDUCTION SCHOOL (UPPER SECONDARY)"
     "0400006"   "AUT: GYMNASIUM LOWER SECONDARY"
     "0400007"   "AUT: GYMNASIUM UPPER SECONDARY"
     "0400008"   "AUT: LOWER SECONDARY SCHOOL"
     "0400009"   "AUT: UPPER SECONDARY SCHOOL"
     "0400010"   "AUT: APPRENTICESHIP"
     "0400011"   "AUT: MIDDLE VOCATIONAL SCHOOL"
     "0400012"   "AUT: MIDDLE VOCATIONAL SCHOOL (HOME ECONOMICS, HEALTH-SOCIAL SERVICES)"
     "0400013"   "AUT: MIDDLE VOCATIONAL SCHOOL (AGRICULTURAL, FORESTRY)"
     "0400014"   "AUT: HIGHER VOCATIONAL SCHOOL"
     "0400015"   "AUT: VOCATIONAL COLLEGE"
     "0560101"   "BEL: (FIRST YEAR A OF FIRST STAGE OF) GENERAL EDUCATION"
     "0560103"   "BEL: SECOND YEAR OF FIRST STAGE - PREPARING FOR VOCATIONAL SEC. EDUC."
     "0560104"   "BEL: SECOND YEAR OF FIRST STAGE PREPARING FOR REGULAR SEC. EDUC."
     "0560105"   "BEL: SECOND & THIRD STAGE REGULAR SECONDARY EDUCATION"
     "0560106"   "BEL: SECOND & THIRD STAGE TECHNICAL SECONDARY EDUCATION"
     "0560107"   "BEL: SECOND & THIRD STAGE ARTISTIC SECONDARY EDUCATION"
     "0560108"   "BEL: SECOND & THIRD STAGE VOCATIONAL SECONDARY EDUCATION"
     "0560109"   "BEL: PART-TIME VOCATIONAL SEC. EDUC. FOCUSED ON THE LABOUR MARKET"
     "0560110"   "BEL: SPECIAL SEC. EDUC. - LOWER SEC. (TRAINING FORM 3 / FIRST 3 YEARS)"
     "0560111"   "BEL: SPECIAL SEC. EDUC. - UPPER SEC. (TRAINING FORM 3 / YEARS 4 AND 5)"
     "0569612"   "BEL: FIRST DEGREE OF GENERAL EDUCATION (FR/GER)"
     "0569613"   "BEL: FIRST YEAR B SPECIAL NEEDS (FR/GER)"
     "0569614"   "BEL: 2ND YEAR OF VOCATIONAL EDUCATION (FR/GER)"
     "0569615"   "BEL: COMPLEMENTARY YEAR TO 1ST DEGREE (FR COM ONLY)"
     "0569616"   "BEL: SECOND & THIRD DEGREES OF GENERAL EDUCATION (FR/GER)"
     "0569617"   "BEL: 2ND & 3RD DEGREES OF TECHN. OR ART. EDUC. (TRANSITION) (FR/GER)"
     "0569618"   "BEL: 2ND & 3RD DEGREES OF TECHN. OR ART. EDUC. (QUALIF.) (FR/GER)"
     "0569619"   "BEL: SECOND & THIRD DEGREES OF VOCATIONAL EDUCATION (FR/GER)"
     "0569620"   "BEL: VOCATIONAL TRAINING FOCUSED ON THE LABOUR MARKET (FR COM ONLY)"
     "0569622"   "BEL: SPECIAL SEC. EDUC. (LOWER SEC. - TRAINING FORM 3) (FR COM ONLY)"
     "0569623"   "BEL: SPECIAL SEC. EDUC. (UPPER SEC.-TRAINING FORM 3)) (FR. ONLY)"
     "0569624"   "BEL: SPECIAL SEC. EDUC. (LOWER SEC.) (GER. ONLY)"
     "0760001"   "BRA: LOWER SECONDARY EDUCATION"
     "0760002"   "BRA: UPPER SECONDARY EDUCATION"
     "1000001"   "BGR: SECONDARY EDUCATION (LOWER)"
     "1000002"   "BGR: SECONDARY EDUCATION - GENERAL NONSPECIALIZED (UPPER)"
     "1000003"   "BGR: SECONDARY EDUCATION - VOCATIONAL (UPPER)"
     "1000004"   "BGR: SECONDARY EDUCATION - GENERAL SPECIALIZED (UPPER)"
     "1240001"   "CAN: GRADES 7-9 (QUEBEC: SECONDARY 1–3, MANITOBA: SENIOR 1"
     "1240002"   "CAN: GRADES 10-12 (QUEB.: SEC. 4-5, MAN.: SNR 2-4, NEWFNDL.: LEV. 1-3)"
     "1520001"   "CHL: SECONDARY EDUCATION (LOWER)"
     "1520002"   "CHL: FIRST CYCLE OF UPPER SECONDARY"
     "1520003"   "CHL: SECOND CYCLE OF UPPER SECONDARY EDUCATION, ACADEMIC ORIENTATION"
     "1520004"   "CHL: SECOND CYCLE OF UPPER SECONDARY EDUCATION, TECHNICAL ORIENTATION"
     "1580001"   "TAP: SENIOR HIGH SCHOOL"
     "1580002"   "TAP: VOCATIONAL SENIOR HIGH SCHOOL"
     "1580003"   "TAP: 5-YEAR COLLEGE"
     "1580004"   "TAP: CONT. SUPP. SCHOOL"
     "1580005"   "TAP: PRACTICAL TECHNICAL PROGRAMME"
     "1580006"   "TAP: WORKING AND LEARNING PROGRAMME"
     "1580007"   "TAP: GENERAL JUNIOR HIGH SCHOOLS"
     "1580008"   "TAP: COMPREHENSIVE HIGH SCHOOL (JUNIOR)"
     "1700001"   "COL: SECONDARY EDUCATION (LOWER)"
     "1700002"   "COL: SECONDARY EDUCATION (UPPER), ACADEMICA"
     "1700003"   "COL: SECONDARY EDUCATION (UPPER), TECNICA"
     "1910001"   "HRV: LOWER SECONDARY EDUCATION"
     "1910002"   "HRV: GYMNASIUM"
     "1910003"   "HRV: FOUR YEAR VOCATIONAL PROGRAMMES"
     "1910004"   "HRV: ART PROGRAMMES"
     "1910005"   "HRV: VOCATIONAL PROGRAMMES FOR INDUSTRY"
     "1910006"   "HRV: VOCATIONAL PROGRAMMES FOR CRAFTS"
     "1910007"   "HRV: LOWER QUALIFICATION VOCATIONAL PROGRAMMES"
     "2030001"   "CZE: BASIC SCHOOL"
     "2030002"   "CZE: 6, 8-YEAR GYMNASIUM AND 8-YEAR CONSERVATORY (LOWER SECONDARY)"
     "2030003"   "CZE: 6, 8-YEAR GYMNASIUM (UPPER SECONDARY)"
     "2030004"   "CZE: 4- YEAR GYMNASIUM"
     "2030005"   "CZE: VOC/TECH SECONDARY SCHOOL WITH MATURATE"
     "2030007"   "CZE: VOC/TECH SECONDARY SCHOOL WITHOUT MATURATE"
     "2030008"   "CZE: SPECIAL SCHOOLS"
     "2030009"   "CZE: PRACTICAL SCHOOLS, VOCATIONAL EDUCATION PREDOMINANTLY"
     "2080001"   "DNK: LOWER SECONDARY"
     "2080002"   "DNK: CONTINUATION SCHOOL"
     "2080004"   "DNK: UPPER SECONDARY"
     "2330001"   "EST: LOWER SECONDARY"
     "2330002"   "EST: UPPER SECONDARY"
     "2460001"   "FIN: COMPREHENSIVE SECONDARY SCHOOL"
     "2460002"   "FIN: UPPER SECONDARY"
     "2500001"   "FRA: LOWER SECONDARY (GENERAL)"
     "2500002"   "FRA: SPECIAL LOWER SEC. EDUCATION (SEGPA, CPA)"
     "2500003"   "FRA: UPPER SECONDARY (GENERAL OR TECHN.)"
     "2500004"   "FRA: UPPER SECONDARY (PROFESSIONAL: CAP, BEP, OTHERS)"
     "2760001"   "DEU: LOWER SECONDARY WITH ACCESS TO UPPER SECONDARY (COMPREHENSIVE)"
     "2760002"   "DEU: LOWER SEC., NO ACCESS TO UPPER SECONDARY (HAUPTSCHULE)"
     "2760003"   "DEU: LOWER SEC., NO ACCESS TO UPPER SECONDARY (REALSCHULE)"
     "2760004"   "DEU: LOWER SEC. WITH ACCESS TO UPPER SECONDARY (GYMNASIUM)"
     "2760005"   "DEU: UPPER SEC. LEVEL (GYMNASIUM)"
     "2760006"   "DEU: COMPREHENSIVE LOWER SEC. WITH ACCESS TO UPPER SEC. (GESAMTSCHULE)"
     "2760008"   "DEU: LOWER SEC., NO ACCESS TO UPPER SEC. (KOOP. GESAMTSCHULE HS)"
     "2760009"   "DEU: LOWER SEC., WITH OR WITHOUT ACCESS TO UPPER SEC. (KOOP. GS, RS)"
     "2760010"   "DEU: LOWER SEC., WITH ACCESS TO UPPER SEC. (KOOP. GS, GYMN.)"
     "2760012"   "DEU: LOWER SEC., NO ACCESS TO UPPER SECONDARY (HAUPTSCHULE INTEGRATED)"
     "2760013"   "DEU: LOWER SEC., NO ACCESS TO UPPER SECONDARY (REALSCHULE INTEGRATED)"
     "2760014"   "DEU: LOWER SEC., NO ACCESS TO UPPER SECONDARY (HAUPTSCHULKLASSE)"
     "2760015"   "DEU: LOWER SEC., NO ACCESS TO UPPER SECONDARY (REALSCHULKLASSE)"
     "2760016"   "DEU: LOWER SECONDARY WITH ACCESS TO UPPER SECONDARY (WALDORF)"
     "2760017"   "DEU: UPPER SECONDARY LEVEL OF EDUCATION (WALDORF)"
     "2760018"   "DEU: PRE-VOCATIONAL TRAINING YEAR"
     "2760019"   "DEU: VOCATIONAL SCHOOL (BERUFSSCHULE)"
     "2760020"   "DEU: VOCATIONAL SCHOOL (BERUFSFACHSCHULE)"
     "3000001"   "GRC: LOWER SECONDARY EDUCATION"
     "3000002"   "GRC: UPPER SECONDARY EDUCATION"
     "3000003"   "GRC: (TECHNICAL-VOCATIONAL SCHOOLS) UPPER SECONDARY EDUCATION"
     "3000004"   "GRC: GYMNASIO (LOWER SECONDARY EDUCATION ) EVENING SCHOOL"
     "3000097"   "GRC: MISSING/UNKNOWN"
     "3440001"   "HKG: LOWER SECONDARY IN GRAMMAR OR INT. PROGR."
     "3440002"   "HKG: UPPER SECONDARY IN GRAMMAR OR INT. PROGR."
     "3440003"   "HKG: LOWER SECONDARY IN PREVOC. OR TECHN. PROGR."
     "3440004"   "HKG: UPPER SECONDARY IN PREVOC. OR TECHN. PROGR."
     "3480001"   "HUN: PRIMARY SCHOOL"
     "3480002"   "HUN: VOCATIONAL SCHOOL"
     "3480003"   "HUN: VOCATIONAL SECONDARY SCHOOL"
     "3480004"   "HUN: GRAMMAR SCHOOL"
     "3520001"   "ISL: LOWER SECONDARY SCHOOL"
     "3520007"   "ISL: UPPER SECONDARY LEVEL VOCATIONAL 3-YEAR CERTIFICATE"
     "3520010"   "ISL: FINE ARTS EXAMINATION"
     "3520012"   "ISL: STÚDENTSPRÓF. MATRIC. EXAM. CERT. (ACCESS TO UNIV. STUDIES)"
     "3600001"   "IDN: JUNIOR SECONDARY SCHOOL"
     "3600002"   "IDN: ISLAMIC JUNIOR SECONDARY SCHOOL"
     "3600003"   "IDN: HIGH SCHOOL"
     "3600004"   "IDN: ISLAMIC HIGH SCHOOL"
     "3600005"   "IDN: VOCATIONAL & TECHNICAL SCHOOL"
     "3720001"   "IRL: JUNIOR CERT"
     "3720002"   "IRL: TRANSITION YEAR PROGRAMME"
     "3720003"   "IRL: LEAVING CERT. APPLIED"
     "3720004"   "IRL: LEAVING CERT. ESTABLISHED"
     "3720005"   "IRL: LEAVING CERT. VOCATIONAL"
     "3760001"   "ISR: SECONDARY EDUCATION (LOWER)"
     "3760002"   "ISR: 6 YEARS HIGHER EDUCATION YEARS 7-9"
     "3760003"   "ISR: 6 YEARS HIGHER EDUCATION YEARS 10-12"
     "3760004"   "ISR: 4 YEARS HIGHER EDUCATION"
     "3760005"   "ISR: 3 YEARS HIGHER EDUCATION"
     "3760006"   "ISR: HIGHER EDUCATION TECHNICAL/VOCATIONAL"
     "3760007"   "ISR: HIGHER RELIGIOUS EDUCATION FOR BOYS YEARS 7-9"
     "3760008"   "ISR: HIGHER RELIGIOUS EDUC. FOR BOYS YEARS 10-12 WITHOUT MATRICULATION"
     "3760009"   "ISR: HIGHER RELIGIOUS EDUCATION FOR BOYS WITH MATRICULATION"
     "3760010"   "ISR: HIGHER RELIGIOUS EDUCATION FOR GIRLS YEARS 7-9"
     "3760011"   "ISR: HIGHER RELIGIOUS EDUC. FOR GIRLS YEARS 10-12 - WITH MATRICULATION"
     "3800001"   "ITA: LICEO (SC., CLASS., SOC. SC., SCIENT.-TECHNOLOGICAL, LINGUISTIC)"
     "3800002"   "ITA: TECHNICAL INSTITUTE"
     "3800003"   "ITA: VOCATIONAL INSTITUTE, ART INSTITUTE, ART HIGH SCHOOL"
     "3800004"   "ITA: LOWER SECONDARY EDUCATION"
     "3800005"   "ITA: VOC. TRAINING (VOC. SCHOOLS IN BOLZANO & TRENTO)"
     "3920001"   "JPN: UPPER SECONDARY SCHOOL (GENERAL)"
     "3920002"   "JPN: TECHNICAL COLLEGE (FIRST 3 YEARS)"
     "3920003"   "JPN: UPPER SECONDARY SCHOOL (VOCATIONAL)"
     "4000001"   "JOR: BASIC EDUCATION"
     "4100001"   "KOR: LOWER SECONDARY EDUCATION"
     "4100002"   "KOR: UPPER SECONDARY EDUCATION"
     "4100003"   "KOR: UPPER SECONDARY EDUCATION"
     "4170001"   "KGZ: PROGRAMME OF BASIC GENERAL EDUCATION (LOWER SECONDARY)"
     "4170002"   "KGZ: PROGRAMME OF SECONDARY GENERAL EDUCATION (UPPER SECONDARY)"
     "4170004"   "KGZ: PROGRAMME OF SEC. PROF. EDUCATION (TECHNIKUM, COLLEGES, ETC.)"
     "4280001"   "LVA: BASIC EDUCATION"
     "4280002"   "LVA: SPECIAL BASIC EDUCATION"
     "4280004"   "LVA: GENERAL SECONDARY EDUCATION"
     "4280006"   "LVA: SECONDARY VOCATIONAL EDUCATION"
     "4380001"   "LIE: SECONDARY EDUCATION, FIRST STAGE"
     "4380003"   "LIE: SCHOOL PREPARING FOR THE UNIVERSITY ENTRANCE CERTIFICATE"
     "4400001"   "LTU: GENERAL BASIC EDUCATION"
     "4400003"   "LTU: BASIC EDUCATION (LOWER GYMNASIUM)"
     "4400004"   "LTU: SECONDARY EDUCATION (UPPER GYMNASIUM)"
     "4400005"   "LTU: BASIC AND VOCATIONAL EDUCATION"
     "4400006"   "LTU: VOCATIONAL EDUCATION"
     "4420001"   "LUX: LOWER SECONDARY EDUCATION (EST: PREPARATOIRE)"
     "4420002"   "LUX: LOWER SECONDARY EDUCATION (EST: INFERIEUR)"
     "4420003"   "LUX: LOWER SECONDARY EDUCATION (ES: INFERIEUR)"
     "4420004"   "LUX: A 3-YEAR VOCATIONAL EDUCATION (EST: PROF.)"
     "4420005"   "LUX: A 4-YEAR VOCATIONAL-TECHNICAL EDUCATION (EST)"
     "4420006"   "LUX: A 4 TO 5-YEAR TECHNICAL EDUCATION (EST)"
     "4420007"   "LUX: UPPER SECONDARY EDUCATION (ES: SUPERIEUR)"
     "4420008"   "LUX: LOWER SECONDARY PRIVATE, NOT SUBSIDIZED"
     "4420009"   "LUX: UPPER SECONDARY PRIVATE, NOT SUBSIDIZED"
     "4460001"   "MAC: GRAMMAR OR INTERNATIONAL PROGRAM AT LOWER SECONDARY LEVELS"
     "4460002"   "MAC: GRAMMAR OR INTERNATIONAL PROGRAM AT HIGHER SECONDARY LEVELS"
     "4460003"   "MAC: TECHNICAL OR PREVOCATIONAL PROGRAM AT LOWER SECONDARY LEVELS"
     "4460004"   "MAC: TECHNICAL OR PREVOCATIONAL PROGRAM AT HIGHER SECONDARY LEVELS"
     "4840001"   "MEX: GENERAL LOWER SECONDARY"
     "4840002"   "MEX: TECHNICAL LOWER SECONDARY"
     "4840003"   "MEX: LOWER SECONDARY FOR WORKERS"
     "4840004"   "MEX: GENERAL LOWER SECONDARY BY TELEVISION"
     "4840005"   "MEX: JOB TRAINING"
     "4840006"   "MEX: GENERAL BACCALAUREATE OR UPPER SECONDARY"
     "4840007"   "MEX: GENERAL BACCALAUREATE OR UPPER SECONDARY"
     "4840008"   "MEX: GENERAL BACCALAUREATE OR UPPER SECONDARY"
     "4840009"   "MEX: TECHNICAL BACCALAUREATE OR TECHNICAL FROM UPPER SECONDARY"
     "4840010"   "MEX: PROFESSIONAL TECHNICIAN"
     "4990001"   "MNE: LOWER SECONDARY"
     "4990002"   "MNE: GYMNASIUM"
     "4990003"   "MNE: TECHNICAL"
     "4990004"   "MNE: TECHNICAL VOCATIONAL SCHOOL"
     "4990005"   "MNE: ARTS SCHOOL"
     "4990006"   "MNE: ECONOMIC"
     "4990008"   "MNE: MEDICAL"
     "4990009"   "MNE: AGRICULTURAL"
     "4990010"   "MNE: AGRICULTURAL VOCATIONAL"
     "4990011"   "MNE: CATERING"
     "5280001"   "NLD: PRACTICAL PREPARATION FOR LABOUR MARKET"
     "5280002"   "NLD: VMBO (GENERAL VOC.)"
     "5280003"   "NLD: VMBO BB (1-2 YEAR)"
     "5280004"   "NLD: VMBO BB (3-4 YEAR)"
     "5280005"   "NLD: VMBO KB (1-2 YEAR)"
     "5280006"   "NLD: VMBO KB (3-4 YEAR)"
     "5280007"   "NLD: VMBO GL/ TL (1-2 YEAR)"
     "5280008"   "NLD: VMBO GL/ TL (3-4 YEAR)"
     "5280009"   "NLD: HAVO (YEAR 1-3)"
     "5280010"   "NLD: HAVO (SEC. YEAR 4-5)"
     "5280011"   "NLD: VWO (YEAR 1-3)"
     "5280012"   "NLD: VWO (YEAR 4-6)"
     "5280097"   "NLD: MISSING/UNKNOWN"
     "5540001"   "NZL: YEARS 7 TO 10"
     "5540002"   "NZL: YEARS 11 TO 13"
     "5780001"   "NOR: LOWER SECONDARY"
     "5780002"   "NOR: UPPER SECONDARY"
     "6160001"   "POL: GYMNASIUM"
     "6160002"   "POL: LYCEUM - GENERAL EDUCATION"
     "6200001"   "PRT: LOWER SECUNDARY"
     "6200002"   "PRT: LOWER SECUNDARY UNGRADED"
     "6200003"   "PRT: UPPER SECUNDARY"
     "6200004"   "PRT: VOCATIONAL SECUNDARY (TECHNICAL)"
     "6200005"   "PRT: VOCATIONAL SECUNDARY (PROFESSIONAL)"
     "6200006"   "PRT: LOWER SECUNDARY (SPEC. CURR. 1 YEAR)"
     "6200007"   "PRT: LOWER SECUNDARY (SPEC. CURR. 2 YEARS)"
     "6200008"   "PRT: LOWER SECUNDARY (SPEC. CURR. 3 YEARS)"
     "6340001"   "QAT: LOWER SECONDARY"
     "6340002"   "QAT: LOWER SECONDARY REFORMED"
     "6340003"   "QAT: LOWER SECONDARY INTERNATIONAL"
     "6340004"   "QAT: UPPER SECONDARY"
     "6340005"   "QAT: UPPER SECONDARY REFORMED"
     "6340006"   "QAT: UPPER SECONDARY INTERNATIONAL"
     "6420001"   "ROU: GENERAL EDUCATION (GIMNAZIU)"
     "6420002"   "ROU: VOCATIONAL EDUCATION (SCUOLA DE ARTE SI MESERII)"
     "6420003"   "ROU: LOWER SECONDARY EDUCATION (LICEU INFERIOR)"
     "6430001"   "RUS: PROGRAMME OF BASIC GENERAL EDUCATION (LOWER SECONDARY)"
     "6430002"   "RUS: PROGRAMME OF SECONDARY GENERAL EDUCATION (UPPER SECONDARY)"
     "6430003"   "RUS: PROGRAMME OF INITIAL PROF. EDUCATION (PROFESSIONAL SCHOOLS, ETC.)"
     "6430004"   "RUS: PROGRAMME OF SECONDARY PROF. EDUCATION (TECHNIKUM, COLLEGE, ETC.)"
     "6880001"   "SRB: PRIMARY SCHOOL"
     "6880002"   "SRB: GYMNASIUM"
     "6880003"   "SRB: TECHNICAL"
     "6880004"   "SRB: TECHNICAL VOCATIONAL"
     "6880005"   "SRB: MEDICAL"
     "6880006"   "SRB: ECONOMIC"
     "6880007"   "SRB: ECONOMIC VOCATIONAL"
     "6880008"   "SRB: AGRICULTURAL"
     "6880009"   "SRB: AGRICULTURAL VOCATIONAL"
     "6880010"   "SRB: ARTISTIC"
     "7030001"   "SVK: BASIC SCHOOL"
     "7030002"   "SVK: VOCATIONAL BASIC SCHOOL"
     "7030003"   "SVK: GENERAL 8-YEAR SECONDARY SCHOOL (YEARS 1-4)"
     "7030004"   "SVK: GENERAL 8-YEAR SECONDARY SCHOOL (YEARS 5-8)"
     "7030005"   "SVK: HIGH SCHOOL (GYMNASIUM)"
     "7030006"   "SVK: SECONDARY COLLEGE"
     "7030007"   "SVK: TECHNICAL COLLEGE, CLASS WITH A SCHOOL LEAVING EXAMINATION"
     "7030008"   "SVK: TECHNICAL COLLEGE, CLASS WITHOUT A SCHOOL LEAVING EXAMINATION"
     "7030009"   "SVK: VOCATIONAL COLLEGE"
     "7050001"   "SVN: BASIC (ELEMENTARY) EDUCATION"
     "7050002"   "SVN: VOCATIONAL EDUCATION PROGRAMMES OF SHORT DURATION"
     "7050003"   "SVN: VOCATIONAL EDUCATION PROGRAMMES OF MEDIUM DURATION"
     "7050004"   "SVN: TECHNICAL EDUCATION PROGRAMMES"
     "7050005"   "SVN: SECONDARY GENERAL EDUCATION - TECHNICAL GYMNASIUMS"
     "7050006"   "SVN: SECONDARY GENERAL EDUCATION - GENERAL AND CASSICAL GYMNASIUMS"
     "7240001"   "ESP: COMPULSORY SECONDARY EDUCATION"
     "7240002"   "ESP: BACCALAUREAT"
     "7520001"   "SWE: COMPULSORY BASIC SCHOOL"
     "7520002"   "SWE: UPPER SECONDARY SCHOOL, GENERAL ORIENTATION"
     "7520003"   "SWE: UPPER SECONDARY SCHOOL, VOCATIONAL ORIENTATION"
     "7520004"   "SWE: UPPER SECONDARY SCHOOL, THE INDIVIDUAL PROGRAMME"
     "7560001"   "CHE: SECONDARY EDUCATION, FIRST STAGE"
     "7560002"   "CHE: PREPARATORY COURSE FOR VOCATIONAL EDUCATION"
     "7560003"   "CHE: SCHOOL PREPARING FOR THE UNIVERSITY ENTRANCE CERTIFICATE"
     "7560004"   "CHE: VOCATIONAL BACCALAUREAT, DUAL SYSTEM 3-4 YEARS"
     "7560005"   "CHE: VOCATIONAL EDUCATION, DUAL SYSTEM 3-4 YEARS"
     "7560006"   "CHE: INTERMEDIATE DIPLOMA SCHOOL"
     "7560007"   "CHE: BASIC VOCATIONAL EDUCATION, DUAL SYSTEM 1-2 YEARS"
     "7640001"   "THA: LOWER SECONDARY LEVEL"
     "7640002"   "THA: UPPER SECONDARY LEVEL"
     "7640003"   "THA: VOCATIONAL CERTIFICATE LEVEL (UPPER SECONDARY LEVEL)"
     "7880001"   "TUN: ENSEIGNEMENT DE BASE (LOWER SECONDARY)"
     "7880002"   "TUN: ENSEIGNEMENT SECONDAIRE (UPPER SECONDARY)"
     "7920001"   "TUR: PRIMARY EDUCATION"
     "7920002"   "TUR: GENERAL HIGH SCHOOL"
     "7920003"   "TUR: ANATOLIAN HIGH SCHOOL"
     "7920004"   "TUR: HIGH SCHOOL WITH INTENSIVE FOREIGN LANGUAGE TEACHING"
     "7920005"   "TUR: SCIENCE HIGH SCHOOLS"
     "7920006"   "TUR: VOCATIONAL HIGH SCHOOLS"
     "7920007"   "TUR: ANATOLIAN VOCATIONAL HIGH SCHOOLS"
     "7920011"   "TUR: SECONDARY AND VOCATIONAL HIGH SCHOOL"
     "8261001"   "GBR: STUDYING MOSTLY TOWARD ENTRY LEVEL CERTIFICATES"
     "8261002"   "GBR: STUDYING MOSTLY TOWARD GCSE OR LEVEL 1 OR 2 QUALIF."
     "8261003"   "GBR: STUDYING MOSTLY FOR AS OR A LEV. OR NON-VOC. LEV. 3 QUALIF."
     "8261007"   "GBR: STUDENTS < YEAR 10 (ENG. & WALES) OR < YEAR 11 (NORTH. IRELAND)"
     "8262001"   "GBR: STUDYING IN S3 OR S4. (SCO)"
     "8262002"   "GBR: S5-S6 & NAT. QUALIF. AT HIGHER LEV., A-LEV., OR EQUIV. (SCO)"
     "8262003"   "GBR: S5-S6 & NAT. QUAL. AT INTERMED. OR ACCESS LEVEL, OR EQUIV. (SCO)"
     "8400001"   "USA: GRADES 7-9"
     "8400002"   "USA: GRADES 10-12"
     "8400097"   "USA: MISSING/UNKNOWN"
     "8580001"   "URY: LOWER SECONDARY"
     "8580002"   "URY: LOWER SECONDARY WITH A TECHNOLOGICAL COMPONENT"
     "8580003"   "URY: VOCATIONAL LOWER SECONDARY (BASIC COURSES)"
     "8580004"   "URY: VOCATIONAL LOWER SECONDARY (BASIC PROF. EDUC.)"
     "8580005"   "URY: RURAL LOWER SECONDARY"
     "8580006"   "URY: GENERAL UPPER SECONDARY"
     "8580007"   "URY: TECHNICAL UPPER SECONDARY"
     "8580008"   "URY: VOCATIONAL UPPER SECONDARY"
     "8580009"   "URY: MILITARY SCHOOL"
.


VALUE LABELS
   COBN_M COBN_F COBN_S
     "00020"   "Africa"
     "00021"   "A Sub-Saharan country (Africa excl. Maghreb)"
     "00080"   "Albania"
     "00110"   "Cap Verde (in Western Africa)"
     "00150"   "North African country (Maghreb)"
     "00290"   "Caribbean"
     "00310"   "Azerbaijan"
     "00320"   "Argentina"
     "00360"   "Australia"
     "00361"   "England"
     "00400"   "Austria"
     "00500"   "Bangladesh"
     "00560"   "Belgium"
     "00680"   "Bolivia"
     "00700"   "Bosnia and Herzegovina"
     "00760"   "Brazil"
     "01000"   "Bulgaria"
     "01120"   "Belarus"
     "01240"   "Canada"
     "01451"   "Middle Eastern country"
     "01510"   "An Eastern European country"
     "01520"   "Chile"
     "01560"   "China"
     "01561"   "China (incl. HongKong)"
     "01580"   "Chinese Taipei"
     "01700"   "Colombia"
     "01910"   "Croatia"
     "02030"   "Czech Republic"
     "02080"   "Denmark"
     "02330"   "Estonia"
     "02460"   "Finland"
     "02500"   "France"
     "02750"   "Occupied Palestinian Territory"
     "02760"   "Germany"
     "03000"   "Greece"
     "03440"   "Hong Kong-China"
     "03480"   "Hungary"
     "03520"   "Iceland"
     "03560"   "India"
     "03600"   "Indonesia"
     "03720"   "Republic of Ireland"
     "03760"   "Israel"
     "03800"   "Italy"
     "03920"   "Japan"
     "04000"   "Jordan"
     "04100"   "Republic of Korea"
     "04170"   "Kyrgyzstan"
     "04280"   "Latvia"
     "04380"   "Liechtenstein"
     "04400"   "Lithuania"
     "04420"   "Luxembourg"
     "04460"   "Macao-China"
     "04461"   "Mainland China"
     "04580"   "Malaysia"
     "04840"   "Mexico"
     "05280"   "Netherlands"
     "05540"   "New Zealand"
     "05780"   "Norway"
     "05860"   "Pakistan"
     "06000"   "Paraguay"
     "06080"   "Philippines"
     "06160"   "Poland"
     "06200"   "Portugal"
     "06340"   "Qatar"
     "06420"   "Romania"
     "06430"   "Russian Federation"
     "07020"   "Singapore"
     "07030"   "Slovakia"
     "07050"   "Slovenia"
     "07100"   "South Africa"
     "07240"   "Spain"
     "07241"   "Andalusia (in Spain)"
     "07242"   "Aragon (in Spain)"
     "07243"   "Asturias (in Spain)"
     "07244"   "Balearic Islands (in Spain)"
     "07245"   "Canary Islands (in Spain)"
     "07246"   "Cantabria (in Spain)"
     "07247"   "Castile-La Mancha (in Spain)"
     "07248"   "Castile and Leon (in Spain)"
     "07249"   "Catalonia (in Spain)"
     "07251"   "Extremadura (in Spain)"
     "07252"   "Galicia (in Spain)"
     "07253"   "La Rioja (in Spain)"
     "07254"   "Madrid (in Spain)"
     "07255"   "Murcia (in Spain)"
     "07256"   "Navarre (in Spain)"
     "07257"   "Basque Country (in Spain)"
     "07258"   "Valencian Community (in Spain)"
     "07259"   "Ceuta and Melilla (in Spain)"
     "07520"   "Sweden"
     "07560"   "Switzerland"
     "07620"   "Tajikistan"
     "07640"   "Thailand"
     "07880"   "Tunisia"
     "07920"   "Turkey"
     "08040"   "Ukraine"
     "08070"   "Former Yugoslav Republic of Macedonia"
     "08100"   "A former USSR republic"
     "08101"   "Another former USSR republic (RUS)"
     "08102"   "Another former USSR republic (EST)"
     "08180"   "Egypt"
     "08260"   "United Kingdom"
     "08261"   "United Kingdom (excl.Scotland)"
     "08262"   "United Kingdom (Scotland)"
     "08263"   "Northern Ireland"
     "08264"   "Great Britain"
     "08400"   "United States"
     "08580"   "Uruguay"
     "08600"   "Uzbekistan"
     "08820"   "Samoa"
     "08870"   "Yemen"
     "08900"   "A former Yugoslav republic"
     "08910"   "Serbia-Montenegro"
     "08911"   "Serbia"
     "08912"   "Montenegro"
     "10560"   "Other Western European country (BEL)"
     "11910"   "Another former Yugoslav republic (HRV)"
     "13800"   "Other European Union Country (ITA)"
     "14420"   "Other European Union Country (LUX)"
     "15280"   "Other European country (NLD)"
     "16200"   "African country with Portuguese as the official language"
     "18262"   "Other European country (QSC)"
     "18911"   "One of the other former Yugoslav republics (SRB)"
     "23800"   "A European country that is not a member of the European Union"
     "26200"   "Other European Union Country (PRT)"
     "36200"   "An Eastern European country outside the EU"
     "90310"   "Other countries (AZE)"
     "90320"   "Other countries (ARG)"
     "90360"   "Other countries (AUS)"
     "90400"   "Other countries (AUT)"
     "90560"   "Other countries (BEL)"
     "90760"   "Other countries (BRA)"
     "91000"   "Other countries (BGR)"
     "91240"   "Other countries (CAN)"
     "91520"   "Other countries (CHL)"
     "91580"   "Other countries (TAP)"
     "91700"   "Other countries (COL)"
     "91910"   "Other countries (HRV)"
     "92030"   "Other countries (CZE)"
     "92080"   "Other countries (DNK)"
     "92330"   "Other countries (EST)"
     "92460"   "Other countries (FIN)"
     "92500"   "Other countries (FRA)"
     "92760"   "Other countries (DEU)"
     "93000"   "Other countries (GRC)"
     "93440"   "Other countries (HKG)"
     "93480"   "Other countries (HUN)"
     "93520"   "Other countries (ISL)"
     "93600"   "Other countries (IDN)"
     "93720"   "Other countries (IRL)"
     "93760"   "Other countries (ISR)"
     "93800"   "Other countries (ITA)"
     "93920"   "Other countries (JPN)"
     "94000"   "Other countries (JOR)"
     "94100"   "Other countries (KOR)"
     "94170"   "Other countries (KGZ)"
     "94280"   "Other countries (LVA)"
     "94400"   "Other countries (LTU)"
     "94420"   "Other countries (LUX)"
     "94460"   "Other countries (MAC)"
     "94840"   "Other countries (MEX)"
     "95280"   "Other countries (NLD)"
     "95540"   "Other countries (NZL)"
     "95780"   "Other countries (NOR)"
     "96160"   "Other countries (POL)"
     "96200"   "Other countries (PRT)"
     "96340"   "Other countries (QAT)"
     "96420"   "Other countries (ROU)"
     "96430"   "Other countries (RUS)"
     "97030"   "Other countries (SVK)"
     "97050"   "Other countries (SVN)"
     "97240"   "Other countries (ESP)"
     "97520"   "Other countries (SWE)"
     "97560"   "Other countries (CHE)"
     "97640"   "Other countries (THA)"
     "97770"   "Other countries (URY)"
     "97880"   "Other countries (TUN)"
     "97920"   "Other countries (TUR)"
     "98260"   "Other countries (GBR-QUK)"
     "98262"   "Other countries (GBR-QSC)"
     "98400"   "Other countries (USA)"
     "98911"   "Other countries (SRB)"
     "98912"   "Other countries (MNE)"
     "99997"   "N/A"
     "99998"   "Invalid"
     "99999"   "Missing"
.


VALUE LABELS
   ST13Q15
     "031001"   "AZE: Satellite Dish"
     "031002"   "AZE: No Satellite Dish"
     "032001"   "ARG: Cable TV (Direct TV, Cablevision, etc.)"
     "032002"   "ARG: No Cable TV (Direct TV, Cablevision, etc.)"
     "036001"   "AUS: Cable/Pay TV"
     "036002"   "AUS: No Cable/Pay TV"
     "040001"   "AUT: MP3 Player"
     "040002"   "AUT: No MP3 Player"
     "056011"   "QBL: Home Cinema"
     "056012"   "QBL: No Home Cinema"
     "056961"   "QBF: Home Cinema (LCD screen…)"
     "056962"   "QBF: No Home Cinema (LCD screen…)"
     "076001"   "BRA: Personal Mobile Phone"
     "076002"   "BRA: No Personal Mobile Phone"
     "100001"   "BGR: Air Conditioning"
     "100002"   "BGR: No Air Conditioning"
     "124001"   "CAN: MP3 Player/iPod"
     "124002"   "CAN: No MP3 Player/iPod"
     "152001"   "CHL: Hot Water"
     "152002"   "CHL: No Hot Water"
     "158001"   "TAP: Musical Instrument"
     "158002"   "TAP: No Musical Instrument"
     "170001"   "COL: Refrigerator"
     "170002"   "COL: No Refrigerator"
     "191001"   "HRV: Video Camera"
     "191002"   "HRV: No Video Camera"
     "203001"   "CZE: Digital Camera (not part of a mobile phone)"
     "203002"   "CZE: No Digital Camera (not part of a mobile phone)"
     "208001"   "DNK: Colour Printer"
     "208002"   "DNK: No Colour Printer"
     "233001"   "EST: Video Camera"
     "233002"   "EST: No Video Camera"
     "246001"   "FIN: Digital Camera"
     "246002"   "FIN: No Digital Camera"
     "250001"   "FRA: Flat Screen TV"
     "250002"   "FRA: No Flat Screen TV"
     "276001"   "DEU: Subscription to a Newspaper"
     "276002"   "DEU: No Subscription to a Newspaper"
     "300001"   "GRC: Home Cinema"
     "300002"   "GRC: No Home Cinema"
     "344001"   "HKG: Digital Camera / Video Recorder"
     "344002"   "HKG: No Digital Camera / Video Recorder"
     "348001"   "HUN: Automatic Washing Machine"
     "348002"   "HUN: No Automatic Washing Machine"
     "352001"   "ISL: Security Service or Security System"
     "352002"   "ISL: No Security Service or Security System"
     "360001"   "IDN: Washing Machine"
     "360002"   "IDN: No Washing Machine"
     "372001"   "IRL: MP3 Player (e.g. iPod)"
     "372002"   "IRL: No MP3 Player (e.g. iPod)"
     "376001"   "ISR: Home Alarm System"
     "376002"   "ISR: No Home Alarm System"
     "380001"   "ITA: Antique Furniture"
     "380002"   "ITA: No Antique Furniture"
     "392001"   "JPN: Digital Camera"
     "392002"   "JPN: No Digital Camera"
     "400001"   "JOR: Central Heating"
     "400002"   "JOR: No Central Heating"
     "410001"   "KOR: Air Conditioning"
     "410002"   "KOR: No Air Conditioning"
     "417001"   "KGZ: Camera"
     "417002"   "KGZ: No Camera"
     "428001"   "LVA: Bicycle"
     "428002"   "LVA: No Bicycle"
     "438001"   "LIE: MP3 Player or iPod"   
     "438002"   "LIE: No MP3 Player or iPod"
     "440001"   "LTU: Digital Camera"
     "440002"   "LTU: No Digital Camera"
     "442001"   "LUX: Digital Camera"
     "442002"   "LUX: No Digital Camera"
     "446001"   "MAC: Video Game Machine"
     "446002"   "MAC: No Video Game Machine"
     "484001"   "MEX: Pay TV"
     "484002"   "MEX: No Pay TV"
     "499001"   "MNE: Cable TV"
     "499002"   "MNE: No Cable TV"
     "528001"   "NLD: Digital Camera (not part of mobile phone or laptop computer)"
     "528002"   "NLD: No Digital Camera (not part of mobile phone or laptop computer)"
     "554001"   "NZL: Broadband Internet Connection"
     "554002"   "NZL: No Broadband Internet Connection"
     "578001"   "NOR: Cleaner"
     "578002"   "NOR: No Cleaner"
     "616001"   "POL: Cable TV with at least 30 channels"
     "616002"   "POL: No Cable TV with at least 30 channels"
     "620001"   "PRT: Cable TV or Satellite Dish"
     "620002"   "PRT: No Cable TV or Satellite Dish"
     "634001"   "QAT: MP3 Walkman"
     "634002"   "QAT: No MP3 Walkman"
     "642001"   "ROU: Video Camera / Digital Photo Camera"
     "642002"   "ROU: No Video Camera / Digital Photo Camera"
     "643001"   "RUS: Digital Camera or Video Camera"
     "643002"   "RUS: No Digital Camera or Video Camera"
     "688001"   "SRB: Digital Camera"
     "688002"   "SRB: No Digital Camera"
     "703001"   "SVK: Video Camera"
     "703002"   "SVK: No Video Camera"
     "705001"   "SVN: Digital Camera or Video Camera"
     "705002"   "SVN: No Digital Camera or Video Camera"
     "724001"   "ESP: Video Camera"
     "724002"   "ESP: No Video Camera"
     "752001"   "SWE: Piano"
     "752002"   "SWE: No Piano"
     "756001"   "CHE: MP3 Player or iPod"
     "756002"   "CHE: No MP3 Player or iPod"
     "764001"   "THA: Air Conditioning"
     "764002"   "THA: No Air Conditioning"
     "788001"   "TUN: Satellite Dish"
     "788002"   "TUN: No Satellite Dish"
     "792001"   "TUR: Air-Conditioning-type Heating and Cooling System"
     "792002"   "TUR: No Air-Conditioning-type Heating and Cooling System"
     "826101"   "QUK: Digital TV"
     "826102"   "QUK: No Digital TV"
     "826201"   "QSC: Video Camera"
     "826202"   "QSC: No Video Camera"
     "840001"   "USA: Guest Room"
     "840002"   "USA: No Guest Room"
     "858001"   "URY: Television Subscription"
     "858002"   "URY: No Television Subscription"
     "999997"   "N/A"
     "999998"   "Invalid"
     "999999"   "Missing"
  /ST13Q16
     "031001"   "AZE: Video Camera"
     "031002"   "AZE: No Video Camera"
     "032001"   "ARG: Telephone Line"
     "032002"   "ARG: No Telephone Line"
     "036001"   "AUS: Digital Camera"
     "036002"   "AUS: No Digital Camera"
     "040001"   "AUT: Digital Camera"
     "040002"   "AUT: No Digital Camera"
     "056011"   "QBL: Alarm System"
     "056012"   "QBL: No Alarm System"
     "056961"   "QBF: Alarm System"
     "056962"   "QBF: No Alarm System"
     "076001"   "BRA: Cable TV"
     "076002"   "BRA: No Cable TV"
     "100001"   "BGR: Freezer"
     "100002"   "BGR: No Freezer"
     "124001"   "CAN: Subscription to a Daily Newspaper"
     "124002"   "CAN: No Subscription to a Daily Newspaper"
     "152001"   "CHL: Washing Machine"
     "152002"   "CHL: No Washing Machine"
     "158001"   "TAP: iPod"
     "158002"   "TAP: No iPod"
     "170001"   "COL: Cable TV or Direct to Home TV"
     "170002"   "COL: No Cable TV or Direct to Home TV"
     "191001"   "HRV: Clothes Dryer"
     "191002"   "HRV: No Clothes Dryer"
     "203001"   "CZE: Digital Video Camera"
     "203002"   "CZE: No Digital Video Camera"
     "208001"   "DNK: MP3 Player"
     "208002"   "DNK: No MP3 Player"
     "233001"   "EST: Hi-Fi"
     "233002"   "EST: No Hi-Fi"
     "246001"   "FIN: Wide Screen TV"
     "246002"   "FIN: No Wide Screen TV"
     "250001"   "FRA: Digital Camera (not part of a mobile phone)"
     "250002"   "FRA: No Digital Camera (not part of a mobile phone)"
     "276001"   "DEU: Video Camera"
     "276002"   "DEU: No Video Camera"
     "300001"   "GRC: Cable TV (Nova, Filmnet,etc.)"
     "300002"   "GRC: No Cable TV (Nova, Filmnet,etc.)"
     "344001"   "HKG: Musical Instrument (e.g. piano, violin)"
     "344002"   "HKG: No Musical Instrument (e.g. piano, violin)"
     "348001"   "HUN: Video Camera"
     "348002"   "HUN: No Video Camera"
     "352001"   "ISL: Satellite Dish"
     "352002"   "ISL: No Satellite Dish"
     "360001"   "IDN: Motorcycle"
     "360002"   "IDN: No Motorcycle"
     "372001"   "IRL: Bedroom with an En-suite Bathroom"
     "372002"   "IRL: No Bedroom with an En-suite Bathroom"
     "376001"   "ISR: Digital Camera"
     "376002"   "ISR: No Digital Camera"
     "380001"   "ITA: Plasma TV Set"
     "380002"   "ITA: No Plasma TV Set"
     "392001"   "JPN: Plasma/Liquid Crystal TV"
     "392002"   "JPN: No Plasma/Liquid Crystal TV"
     "400001"   "JOR: Satellite Dish"
     "400002"   "JOR: No Satellite Dish"
     "410001"   "KOR: Digital Camera"
     "410002"   "KOR: No Digital Camera"
     "417001"   "KGZ: Vacuum Cleaner"
     "417002"   "KGZ: No Vacuum Cleaner"
     "428001"   "LVA: Snowboard"
     "428002"   "LVA: No Snowboard"
     "438001"   "LIE: Digital Camera"
     "438002"   "LIE: No Digital Camera"
     "440001"   "LTU: Press Subscription Edition (newspaper, magazine)"
     "440002"   "LTU: No Press Subscription Edition (newspaper, magazine)"
     "442001"   "LUX: MP3 Player"
     "442002"   "LUX: No MP3 Player"
     "446001"   "MAC: Digital Camera"
     "446002"   "MAC: No Digital Camera"
     "484001"   "MEX: Telephone Line"
     "484002"   "MEX: No Telephone Line"
     "499001"   "MNE: Jacuzzi"
     "499002"   "MNE: No Jacuzzi"
     "528001"   "NLD: Piano"
     "528002"   "NLD: No Piano"
     "554001"   "NZL: Digital Camera (not part of mobile phone)"
     "554002"   "NZL: No Digital Camera (not part of mobile phone)"
     "578001"   "NOR: Plasma/LCD TV"
     "578002"   "NOR: No Plasma/LCD TV"
     "616001"   "POL: Digital Camera"
     "616002"   "POL: No Digital Camera"
     "620001"   "PRT: Plasma or LCD Screen TV"
     "620002"   "PRT: No Plasma or LCD Screen TV"
     "634001"   "QAT: Digital Video Camera"
     "634002"   "QAT: No Digital Video Camera"
     "642001"   "ROU: Cable TV"
     "642002"   "ROU: No Cable TV"
     "643001"   "RUS: Home Cinema"
     "643002"   "RUS: No Home Cinema"
     "688001"   "SRB: Laundry Drying Machine"
     "688002"   "SRB: No Laundry Drying Machine"
     "703001"   "SVK: Digital Camera (not part of mobile phone)"
     "703002"   "SVK: No Digital Camera (not part of mobile phone)"
     "705001"   "SVN: Personal MP3 Player"
     "705002"   "SVN: No Personal MP3 Player"
     "724001"   "ESP: Satellite Dish or Digital TV Set"
     "724002"   "ESP: No Satellite Dish or Digital TV Set"
     "752001"   "SWE: Video Camera"
     "752002"   "SWE: No Video Camera"
     "756001"   "CHE: Digital Camera"
     "756002"   "CHE: No Digital Camera"
     "764001"   "THA: Washing Machine"
     "764002"   "THA: No Washing Machine"
     "788001"   "TUN: Digital Camera"
     "788002"   "TUN: No Digital Camera"
     "792001"   "TUR: Treadmill (fitness equipment device)"
     "792002"   "TUR: No Treadmill (fitness equipment device)"
     "826101"   "QUK: Digital Camcorder"
     "826102"   "QUK: No Digital Camcorder"
     "826201"   "QSC: Plasma Screen TV"
     "826202"   "QSC: No Plasma Screen TV"
     "840001"   "USA: High-Speed Internet Connection"
     "840002"   "USA: No High-Speed Internet Connection"
     "858001"   "URY: Washing Machine"
     "858002"   "URY: No Washing Machine"
     "999997"   "N/A"
     "999998"   "Invalid"
     "999999"   "Missing"
  /ST13Q17
     "031001"   "AZE: Colour Printer"
     "031002"   "AZE: No Colour Printer"
     "032001"   "ARG: Refrigerator with Freezer"
     "032002"   "ARG: No Refrigerator with Freezer"
     "036001"   "AUS: Plasma TV"
     "036002"   "AUS: No Plasma TV"
     "040001"   "AUT: Digital Video Camera"
     "040002"   "AUT: No Digital Video Camera"
     "056011"   "QBL: Plasma or LCD TV"
     "056012"   "QBL: No Plasma or LCD TV"
     "056961"   "QBF: Housekeeper"
     "056962"   "QBF: No Housekeeper"
     "076001"   "BRA: Video Game"
     "076002"   "BRA: No Video Game"
     "100001"   "BGR: Digital Camera"
     "100002"   "BGR: No Digital Camera"
     "124001"   "CAN: Central Air Conditioning"
     "124002"   "CAN: No Central Air Conditioning"
     "152001"   "CHL: Digital Video Camera"
     "152002"   "CHL: No Digital Video Camera"
     "158001"   "TAP: Jacuzzi Bath"
     "158002"   "TAP: No Jacuzzi Bath"
     "170001"   "COL: Encyclopedia"
     "170002"   "COL: No Encyclopedia"
     "191001"   "HRV: Air Conditioning"
     "191002"   "HRV: No Air Conditioning"
     "203001"   "CZE: Personal Discman or MP3 Player"
     "203002"   "CZE: No Personal Discman or MP3 Player"
     "208001"   "DNK: Digital Camera"
     "208002"   "DNK: No Digital Camera"
     "233001"   "EST: Broadband Internet Connection"
     "233002"   "EST: No Broadband Internet Connection"
     "246001"   "FIN: Fitness Equipment (e.g. exercise bike, rowing machine)"
     "246002"   "FIN: No Fitness Equipment (e.g. exercise bike, rowing machine)"
     "250001"   "FRA: Laptop Computer"
     "250002"   "FRA: No Laptop Computer"
     "276001"   "DEU: ISDN Connection"
     "276002"   "DEU: No ISDN Connection"
     "300001"   "GRC: Alarm System"
     "300002"   "GRC: No Alarm System"
     "344001"   "HKG: Pay TV Channel"
     "344002"   "HKG: No Pay TV Channel"
     "348001"   "HUN: Digital Camera (not part of a mobile phone)"
     "348002"   "HUN: No Digital Camera (not part of a mobile phone)"
     "352001"   "ISL: Plasma TV or TV Projector"
     "352002"   "ISL: No Plasma TV or TV Projector"
     "360001"   "IDN: Air Conditioning"
     "360002"   "IDN: No Air Conditioning"
     "372001"   "IRL: Premium Cable TV Package (e.g. Sky Movies, Sky Sports)"
     "372002"   "IRL: No Premium Cable TV Package (e.g. Sky Movies, Sky Sports)"
     "376001"   "ISR: Home Movie Theatre"
     "376002"   "ISR: No Home Movie Theatre"
     "380001"   "ITA: Air Conditioning"
     "380002"   "ITA: No Air Conditioning"
     "392001"   "JPN: Clothing Dryer"
     "392002"   "JPN: No Clothing Dryer"
     "400001"   "JOR: Digital Camera"
     "400002"   "JOR: No Digital Camera"
     "410001"   "KOR: Water Purifier"
     "410002"   "KOR: No Water Purifier"
     "417001"   "KGZ: Imported Clothes Washing Machine such as Ariston or Indesit"
     "417002"   "KGZ: No Imported Clothes Washing Machine such as Ariston or Indesit"
     "428001"   "LVA: Digital Camera"
     "428002"   "LVA: No Digital Camera"
     "438001"   "LIE: Digital Video Camera"
     "438002"   "LIE: No Digital Video Camera"
     "440001"   "LTU: MP3 Player"
     "440002"   "LTU: No MP3 Player"
     "442001"   "LUX: Flat Screen TV"
     "442002"   "LUX: No Flat Screen TV"
     "446001"   "MAC: MP3 Player"
     "446002"   "MAC: No MP3 Player"
     "484001"   "MEX: Microwave Oven"
     "484002"   "MEX: No Microwave Oven"
     "499001"   "MNE: Digital Camera"
     "499002"   "MNE: No Digital Camera"
     "528001"   "NLD: Laptop"
     "528002"   "NLD: No Laptop"
     "554001"   "NZL: Clothes Dryer"
     "554002"   "NZL: No Clothes Dryer"
     "578001"   "NOR: Spa Bath"
     "578002"   "NOR: No Spa Bath"
     "616001"   "POL: Telescope or Microscope"
     "616002"   "POL: No Telescope or Microscope"
     "620001"   "PRT: Central Heating or Air Conditioning Equipment"
     "620002"   "PRT: No Central Heating or Air Conditioning Equipment"
     "634001"   "QAT: X-Box"
     "634002"   "QAT: No X-Box"
     "642001"   "ROU: Air Conditioning"
     "642002"   "ROU: No Air Conditioning"
     "643001"   "RUS: Satellite Antenna"
     "643002"   "RUS: No Satellite Antenna"
     "688001"   "SRB: Cable TV"
     "688002"   "SRB: No Cable TV"
     "703001"   "SVK: Satellite Receiver or Cable TV"
     "703002"   "SVK: No Satellite Receiver or Cable TV"
     "705001"   "SVN: Sauna"
     "705002"   "SVN: No Sauna"
     "724001"   "ESP: Home Cinema Set"
     "724002"   "ESP: No Home Cinema Set"
     "752001"   "SWE: Wall TV"
     "752002"   "SWE: No Wall TV"
     "756001"   "CHE: Digital Video Camera"
     "756002"   "CHE: No Digital Video Camera"
     "764001"   "THA: Microwave Oven"
     "764002"   "THA: No Microwave Oven"
     "788001"   "TUN: Washing Machine"
     "788002"   "TUN: No Washing Machine"
     "792001"   "TUR: Home Cinema System (5+1)"
     "792002"   "TUR: No Home Cinema System (5+1)"
     "826101"   "QUK: Swimming Pool"
     "826102"   "QUK: No Swimming Pool"
     "826201"   "QSC: Broadband Internet Connection"
     "826202"   "QSC: No Broadband Internet Connection"
     "840001"   "USA: iPod or MP3 Player"
     "840002"   "USA: No iPod or MP3 Player"
     "858001"   "URY: Microwave Oven"
     "858002"   "URY: No Microwave Oven"
     "999997"   "N/A"
     "999998"   "Invalid"
     "999999"   "Missing"
.


MISSING VALUES
  ST11Q01 ST11Q02 ST11Q03
  ST04Q01 ST06Q01 ST07Q01 ST07Q02 ST07Q03 ST09Q01 ST10Q01 ST10Q02
  ST10Q03 ST12Q01 ST13Q01 ST13Q02 ST13Q03 ST13Q04 ST13Q05 ST13Q06
  ST13Q07 ST13Q08 ST13Q09 ST13Q10 ST13Q11 ST13Q12 ST13Q13 ST13Q14
  ST14Q01 ST14Q02 ST14Q03 ST14Q04 
  ST15Q01 ST16Q01 ST16Q02 ST16Q03 ST16Q04 ST16Q05 ST17Q01 ST17Q02
  ST17Q03 ST17Q04 ST17Q05 ST17Q06 ST17Q07 ST17Q08 ST18Q01 ST18Q02
  ST18Q03 ST18Q04 ST18Q05 ST18Q06 ST18Q07 ST18Q08 ST18Q09 ST18Q10
  ST19Q01 ST19Q02 ST19Q03 ST19Q04 ST19Q05 ST19Q06 ST20QA1 ST20QA2
  ST20QA3 ST20QA4 ST20QA5 ST20QA6 ST20QB1 ST20QB2 ST20QB3 ST20QB4
  ST20QB5 ST20QB6 ST20QC1 ST20QC2 ST20QC3 ST20QC4 ST20QC5 ST20QC6
  ST20QD1 ST20QD2 ST20QD3 ST20QD4 ST20QD5 ST20QD6 ST20QE1 ST20QE2
  ST20QE3 ST20QE4 ST20QE5 ST20QE6 ST20QF1 ST20QF2 ST20QF3 ST20QF4
  ST20QF5 ST20QF6 ST20QG1 ST20QG2 ST20QG3 ST20QG4 ST20QG5 ST20QG6
  ST20QH1 ST20QH2 ST20QH3 ST20QH4 ST20QH5 ST20QH6 ST21Q01 ST21Q02
  ST21Q03 ST21Q04 ST21Q05 ST21Q06 ST21Q07 ST21Q08 ST22Q01 ST22Q02
  ST22Q03 ST22Q04 ST22Q05 ST23QA1 ST23QA2 ST23QA3 ST23QA4 ST23QA5
  ST23QA6 ST23QB1 ST23QB2 ST23QB3 ST23QB4 ST23QB5 ST23QB6 ST23QC1
  ST23QC2 ST23QC3 ST23QC4 ST23QC5 ST23QC6 ST23QD1 ST23QD2 ST23QD3
  ST23QD4 ST23QD5 ST23QD6 ST23QE1 ST23QE2 ST23QE3 ST23QE4 ST23QE5
  ST23QE6 ST23QF1 ST23QF2 ST23QF3 ST23QF4 ST23QF5 ST23QF6 ST24Q01
  ST24Q02 ST24Q03 ST24Q04 ST24Q05 ST24Q06 ST25Q01 ST25Q02 ST25Q03
  ST25Q04 ST25Q05 ST25Q06 ST26Q01 ST26Q02 ST26Q03 ST26Q04 ST26Q05
  ST26Q06 ST26Q07 ST27Q01 ST27Q02 ST27Q03 ST27Q04 ST28Q01 ST28Q02
  ST28Q03 ST28Q04 ST29Q01 ST29Q02 ST29Q03 ST29Q04 ST31Q01 ST31Q02
  ST31Q03 ST31Q04 ST31Q05 ST31Q06 ST31Q07 ST31Q08 ST31Q09 ST31Q10
  ST31Q11 ST31Q12 ST32Q01 ST32Q02 ST32Q03 ST32Q04 ST32Q05 ST32Q06
  ST33Q11 ST33Q12 ST33Q21 ST33Q22 ST33Q31 ST33Q32 ST33Q41 ST33Q42
  ST33Q51 ST33Q52 ST33Q61 ST33Q62 ST33Q71 ST33Q72 ST33Q81 ST33Q82
  ST34Q01 ST34Q02 ST34Q03 ST34Q04 ST34Q05 ST34Q06 ST34Q07 ST34Q08
  ST34Q09 ST34Q10 ST34Q11 ST34Q12 ST34Q13 ST34Q14 ST34Q15 ST34Q16
  ST34Q17 ST35Q01 ST35Q02 ST35Q03 ST35Q04 ST35Q05 ST36Q01 ST36Q02
  ST36Q03 ST37Q01 ST37Q02 ST37Q03 ST37Q04 ST37Q05 ST37Q06 IC01Q01
  IC02Q01 IC03Q01 IC03Q02 IC03Q03 IC04Q01 IC04Q02 IC04Q03 IC04Q04
  IC04Q05 IC04Q06 IC04Q07 IC04Q08 IC04Q09 IC04Q10 IC04Q11 IC05Q01
  IC05Q02 IC05Q03 IC05Q04 IC05Q05 IC05Q06 IC05Q07 IC05Q08 IC05Q09
  IC05Q10 IC05Q11 IC05Q12 IC05Q13 IC05Q14 IC05Q15 IC05Q16
  (7, 8, 9).

MISSING VALUES ST13Q15 ST13Q16 ST13Q17 ("999997","999998","999999").

MISSING VALUES ST01Q01 ST02Q01 (96, 99).
MISSING VALUES ST03Q02 ST03Q03 ('97', '98', '99').
MISSING VALUES ST05Q01 ST08Q01 ST30Q01 ('9997', '9998', '9999').
MISSING VALUES ST11Q04 (97,98,99).
MISSING VALUES ISCEDL ISCEDD ISCEDO MISCED FISCED HISCED IMMIG (7, 8, 9).
MISSING VALUES AGE BMMJ BFMJ BSMJ HISEI PARED (97, 98, 99).
MISSING VALUES MsECATEG FsECATEG HsECATEG SRC_M SRC_F SRC_E SRC_S (7,8,9).
MISSING VALUES CLCUSE3a CLCUSE3b Deffort (997, 998, 999).  

MISSING VALUES ESCS (997,999).
MISSING VALUES 
  CARINFO CARPREP CULTPOSS ENVAWARE ENVOPT ENVPERC GENSCIE 
  HEDRES HIGHCONF HOMEPOS INSTSCIE INTCONF INTSCIE INTUSE JOYSCIE 
  PERSCIE PRGUSE  RESPDEV SCAPPLY SCHANDS SCIEACT SCIEEFF SCIEFUT 
  SCINTACT SCINVEST SCSCIE WEALTH (997,999).

MISSING VALUES PV1READ PV2READ PV3READ PV4READ PV5READ (9997).
MISSING VALUES S421Q02 ("7").
MISSING VALUES S456Q01 ("77","71").
MISSING VALUES S456Q02 ("7").

SAVE OUTFILE='C:\****\INT_Stu06_Dec07.sav'.
