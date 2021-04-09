* This program reads the txt file data and applies variable and value labes, format and missing valus specifications.
* Write the location of the ASCII file on the at the beginning of the controle file.
* Write the location of the SPSS file at the end of the controle file.

DATA LIST file="e:/works/pisa/pisa2000/intcogn_v4.txt"
/COUNTRY	    2-4(a)
SCHOOLID	     5-9(a)
STIDSTD	        10-14(a)
SUBNATIO	    16-17(a)
BOOKID	        19-20(a)
M033Q01	       22-22(a)
M034Q01T	     23-23(a)
M037Q01T	    24-24(a)
M037Q02T	    25-25(a)
M124Q01	        26-26(a)
M124Q03T	27-27(a)
M136Q01T	28-28(a)
M136Q02T	29-29(a)
M136Q03T	30-30(a)
M144Q01T	31-31(a)
M144Q02T	32-32(a)
M144Q03	        33-33(a)
M144Q04T	34-34(a)
M145Q01T	35-35(a)
M148Q02T	36-36(a)
M150Q01	        37-37(a)
M150Q02T	38-38(a)
M150Q03T	39-39(a)
M155Q01	        40-40(a)
M155Q02T	41-41(a)
M155Q03T	42-42(a)
M155Q04T	43-43(a)
M159Q01 	44-44(a)
M159Q02 	45-45(a)
M159Q03 	46-46(a)
M159Q05 	47-47(a)
M161Q01 	48-48(a)
M179Q01T	49-49(a)
M192Q01T	50-50(a)
M266Q01T	51-51(a)
M273Q01T	52-52(a)
M300Q1AT	53-53(a) 
M300Q1BT	54-54(a) 
M300Q1CT	55-55(a) 
M302Q01T	56-56(a) 
M302Q02 	57-57(a)
M302Q03 	58-58(a)
M303Q01T	59-59(a)
M305Q01 	60-60(a)
M307Q01 	61-61(a)
M307Q02 	62-62(a)
M309Q01T	63-63(a)
M309Q02T	64-64(a)
M309Q03T	65-65(a)
M309Q04T	66-66(a)
R040Q02		67-67(a)
R040Q03A	68-68(a)
R040Q03B	69-69(a)
R040Q04		70-70(a)
R040Q06		71-71(a)
R055Q01		72-72(a)
R055Q02		73-73(a)
R055Q03		74-74(a)
R055Q05		75-75(a)
R061Q01		76-76(a)
R061Q03		77-77(a)
R061Q04		78-78(a)
R061Q05		79-79(a)
R067Q01		80-80(a)
R067Q04		81-81(a)
R067Q05		82-82(a)
R070Q02		83-83(a)
R070Q03		84-84(a)
R070Q04		85-85(a)
R070Q07T	86-86(a)
R076Q03		87-87(a)
R076Q04		88-88(a)
R076Q05		89-89(a)
R077Q02		90-90(a)
R077Q03		91-91(a)
R077Q04		92-92(a)
R077Q05		93-93(a)
R077Q06		94-94(a)
R081Q01		95-95(a)
R081Q05		96-96(a)
R081Q06A	97-97(a)
R081Q06B	98-98(a)
R083Q01		99-99(a)
R083Q02		100-100(a)
R083Q03		101-101(a)
R083Q04		102-102(a)
R083Q06		103-103(a)
R086Q04		104-104(a)
R086Q05		105-105(a)
R086Q07		106-106(a)
R088Q01		107-107(a)
R088Q03		108-108(a)
R088Q04T	109-109(a)
R088Q05T	110-110(a)
R088Q07		111-111(a)
R091Q05		112-112(a)
R091Q06		113-113(a)
R091Q07B	114-114(a)
R093Q03		115-115(a)
R099Q04B	116-116(a)
R100Q04		117-117(a)
R100Q05		118-118(a)
R100Q06		119-119(a)
R100Q07		120-120(a)
R101Q01		121-121(a)
R101Q02		122-122(a)
R101Q03		123-123(a)
R101Q04		124-124(a)
R101Q05		125-125(a)
R101Q08		126-126(a)
R102Q01		127-127(a)
R102Q04A	128-128(a)
R102Q05		129-129(a)
R102Q06		130-130(a)
R102Q07		131-131(a)
R104Q01		132-132(a)
R104Q02		133-133(a)
R104Q05		134-134(a)
R104Q06		135-135(a)
R110Q01		136-136(a)
R110Q04		137-137(a)
R110Q05		138-138(a)
R110Q06		139-139(a)
R111Q01		140-140(a)
R111Q02B	141-141(a)
R111Q04		142-142(a)
R111Q06B	143-143(a)
R119Q01		144-144(a)
R119Q04		145-145(a)
R119Q05		146-146(a)
R119Q06		147-147(a)
R119Q07		148-148(a)
R119Q08		149-149(a)
R119Q09T	150-150(a)
R120Q01		151-151(a)
R120Q03		152-152(a)
R120Q06		153-153(a)
R120Q07T	154-154(a)
R122Q02		155-155(a)
R122Q03T	156-156(a)
R216Q01		157-157(a)
R216Q02		158-158(a)
R216Q03T	159-159(a)
R216Q04		160-160(a)
R216Q06		161-161(a)
R219Q01E	162-162(a)
R219Q01T	163-163(a)
R219Q02		164-164(a)
R220Q01		165-165(a)
R220Q02B	166-166(a)
R220Q04		167-167(a)
R220Q05		168-168(a)
R220Q06		169-169(a)
R225Q02		170-170(a)
R225Q03		171-171(a)
R225Q04		172-172(a)
R227Q01		173-173(a)
R227Q02T	174-174(a)
R227Q03		175-175(a)
R227Q04		176-176(a) 
R227Q06		177-177(a) 
R228Q01		178-178(a) 
R228Q02		179-179(a) 
R228Q04		180-180(a) 
R234Q01		181-181(a) 
R234Q02		182-182(a) 
R236Q01		183-183(a) 
R236Q02		184-184(a) 
R237Q01		185-185(a) 
R237Q03		186-186(a) 
R238Q01		187-187(a) 
R238Q02		188-188(a) 
R239Q01		189-189(a) 
R239Q02		190-190(a) 
R241Q02		191-191(a) 
R245Q01		192-192(a) 
R245Q02		193-193(a) 
R246Q01		194-194(a) 
R246Q02		195-195(a)
S114Q03T	196-196(a)
S114Q04T	197-197(a)
S114Q05T	198-198(a)
S128Q01		199-199(a)
S128Q02		200-200(a)
S128Q03T	201-201(a)
S129Q01		202-202(a)
S129Q02T	203-203(a)
S131Q02T	204-204(a)
S131Q04T	205-205(a)
S133Q01		206-206(a)
S133Q03		207-207(a)
S133Q04T	208-208(a)
S195Q02T	209-209(a)
S195Q04		210-210(a)
S195Q05T	211-211(a)
S195Q06		212-212(a)
S209Q02T	213-213(a)
S213Q01T	214-214(a)
S213Q02		215-215(a)
S252Q01	        216-216(a) 
S252Q02	        217-217(a)
S252Q03T        218-218(a)
S253Q01T        219-219(a)
S253Q02	        220-220(a)
S253Q05	        221-221(a)
S256Q01	        222-222(a)
S268Q01	        223-223(a)
S268Q02T        224-224(a)
S268Q06	        225-225(a)
S269Q01	        226-226(a)
S269Q03T        227-227(a)
S269Q04T        228-228(a)
S270Q03T        229-229(a)
S301Q01T        230-230(a)
S301Q02T        231-231(a)
S301Q03A        232-232(a)
S301Q04         233-233(a)
S302Q01         234-234(a)
S302Q02         235-235(a)
S304Q01         236-236(a)
S304Q02         237-237(a)
S305Q01T        238-238(a)
S305Q02         239-239(a) 
S305Q03T        240-240(a) 
MSCALE		242-242(a)
RSCALE		243-243(a)
SSCALE		244-244(a)
CNT		248-250(a)
VER_COGN 		256-268(a).
cache.                 
execute.               
                       
variable labels        
  country	" Country three-digit ISO code"
  schoolid	" School ID (unique)"
  stidstd	" Student ID"
  subnatio	" Language community ID"
  bookid	" Booklet No."
  M033Q01	" View Room - Q1      "
  M034Q01T     " Bricks - Q1         "
  M037Q01T     " Farms - Q1          "
  M037Q02T     " Farms - Q2          "
  M124Q01      " Walking - Q1        "
  M124Q03T     " Walking - Q3        "
  M136Q01T     " Apples - Q1         "
  M136Q02T     " Apples - Q2         "
  M136Q03T     " Apples - Q3         "
  M144Q01T     " Cube Painting -Q1   "
  M144Q02T     " Cube Painting -Q2   "
  M144Q03      " Cube Painting -Q3   "
  M144Q04T     " Cube Painting -Q4   "
  M145Q01T     " Cubes - Q1          "
  M148Q02T     " Continent Area      "
  M150Q01      " Growing Up - Q1     "
  M150Q02T     " Growing Up - Q2     "
  M150Q03T     " Growing Up - Q3     "
  M155Q01      " Pop Pyramids -Q1    "
  M155Q02T     " Pop Pyramids -Q2    "
  M155Q03T     " Pop Pyramids -Q3    "
  M155Q04T     " Pop Pyramids -Q4    "
  M159Q01      " Racing Car - Q1     "
  M159Q02      " Racing Car - Q2     "
  M159Q03      " Racing Car - Q3     "
  M159Q05      " Racing Car - Q5     "
  M161Q01      " Triangles - Q1      "
  M179Q01T     " Robberies - Q1      "
  M192Q01T     " Containers - Q1     "
  M266Q01T     " Carpenter - Q01     "
  M273Q01T     " Pipelines - Q1      "
  M300Q1AT 	"Angles - Q01A"                          
  M300Q1BT 	"Angles - Q01B"                          
  M300Q1CT 	"Angles - Q01C"                          
  M302Q01T 	"Car Drive - Q01"                        
  M302Q02 	"Car Drive - Q02"                         
  M302Q03 	"Car Drive - Q03"
  M303Q01T      "Suitcase - Q01"
  M305Q01	"Map - Q01"
  M307Q01 	"Drug concentration - Q01"
  M307Q02 	"Drug concentration - Q02"
  M309Q01T 	"Building Blocks - Q01"
  M309Q02T 	"Building Blocks - Q02"
  M309Q03T 	"Building Blocks - Q03"
  M309Q04T 	"Building Blocks - Q04" 
  R040Q02       " Lake Chad  - Q2     "
  R040Q03A     " Lake Chad - Q3A     "
  R040Q03B     " Lake Chad - Q3B     "
  R040Q04       " Lake Chad - Q4      "
  R040Q06       " Lake Chad - Q6      "
  R055Q01       " Drugged Spiders     "
  R055Q02       " Drugged Spiders     "
  R055Q03       " Drugged Spiders     "
  R055Q05       " Drugged Spiders     "
  R061Q01       " Macondo - Q1        "
  R061Q03       " Macondo - Q3        "
  R061Q04       " Macondo - Q4        "
  R061Q05       " Macondo - Q5        "
  R067Q01       " Aesop - Q1          "
  R067Q04       " Aesop - Q4          "
  R067Q05       " Aesop - Q5          "
  R070Q02       " Beach - Q2          "
  R070Q03       " Beach - Q3          "
  R070Q04       " Beach - Q4          "
  R070Q07T      " Beach - Q7          "
  R076Q03       " Iran Air - Q3       "
  R076Q04       " Iran Air - Q4       "
  R076Q05       " Iran Air - Q5       "
  R077Q02       " Flu - Q2            "
  R077Q03       " Flu - Q3            "
  R077Q04       " Flu - Q4            "
  R077Q05       " Flu - Q5            "
  R077Q06       " Flu - Q6            "
  R081Q01       " Graffiti - Q1       "
  R081Q05       " Graffiti - Q5       "
  R081Q06A      " Graffiti - Q6A      "
  R081Q06B      " Graffiti - Q6B      "
  R083Q01       " Household - Q1      "
  R083Q02       " Household - Q2      "
  R083Q03       " Household - Q3      "
  R083Q04       " Household - Q4      "
  R083Q06       " Household - Q6      "
  R086Q04       " If - Q4             "
  R086Q05       " If - Q5             "
  R086Q07       " If - Q7             "
  R088Q01       " Labour - Q1         "
  R088Q03       " Labour - Q3         "
  R088Q04T      " Labour - Q4         "
  R088Q05T      " Labour - Q5         "
  R088Q07       " Labour - Q7         "
  R091Q05       " Library - Q5        "
  R091Q06       " Library - Q6        "
  R091Q07B      " Library - Q7B       "
  R093Q03       " News Agencies -Q3   "
  R099Q04B      " Planint - Q4B       "
  R100Q04       " Police - Q4         "
  R100Q05       " Police - Q5         "
  R100Q06       " Police - Q6         "
  R100Q07       " Police - Q7         "
  R101Q01       " Rhinoceros - Q1     "
  R101Q02       " Rhinoceros - Q2     "
  R101Q03       " Rhinoceros - Q3     "
  R101Q04       " Rhinoceros - Q4     "
  R101Q05       " Rhinoceros - Q5     "
  R101Q08       " Rhinoceros - Q8     "
  R102Q01       " Shirt - Q1          "
  R102Q04A      " Shirt - Q4A         "
  R102Q05       " Shirt - Q5          "
  R102Q06       " Shirt - Q6          "
  R102Q07       " Shirt - Q7          "
  R104Q01       " Telephone - Q1      "
  R104Q02       " Telephone - Q2      "
  R104Q05       " Telephone - Q5      "
  R104Q06       " Telephone - Q6      "
  R110Q01       " Runners - Q1        "
  R110Q04       " Runners - Q4        "
  R110Q05       " Runners - Q5        "
  R110Q06       " Runners - Q6        "
  R111Q01       " Exchange - Q1       "
  R111Q02B      " Exchange - Q2B      "
  R111Q04       " Exchange - Q4       "
  R111Q06B      " Exchange - Q6B      "
  R119Q01       " Gift - Q1           "
  R119Q04       " Gift - Q4           "
  R119Q05       " Gift - Q5           "
  R119Q06       " Gift - Q6           "
  R119Q07       " Gift - Q7           "
  R119Q08       " Gift - Q8           "
  R119Q09T      " Gift - Q9           "
  R120Q01       " Opinions - Q1       "
  R120Q03       " Opinions - Q3       "
  R120Q06       " Opinions- Q6        "
  R120Q07T      " Opinions- Q7        "
  R122Q02       " Just Art - Q2       "
  R122Q03T      " Just Art - Q3       "
  R216Q01       " Amanda - Q1         "
  R216Q02       " Amanda - Q2         "
  R216Q03T      " Amanda - Q3         "
  R216Q04       " Amanda - Q4         "
  R216Q06       " Amanda - Q6         "
  R219Q01E      " Employment - Q1     "
  R219Q01T      " Employment - Q1     "
  R219Q02       " Employment - Q2     "
  R220Q01       " South Pole- Q1      "
  R220Q02B      " South Pole - Q2     "
  R220Q04       " South Pole - Q4     "
  R220Q05       " South Pole - Q5     "
  R220Q06       " South Pole - Q6     "
  R225Q02       " Nuclear - Q2        "
  R225Q03       " Nuclear - Q3        "
  R225Q04       " Nuclear - Q4        "
  R227Q01       " Optician - Q1       "
  R227Q02T      " Optician - Q2       "
  R227Q03       " Optician - Q3       "
  R227Q04       " Optician - Q4       "
  R227Q06       " Optician - Q6       "
  R228Q01       " Guide - Q1          "
  R228Q02       " Guide - Q2          "
  R228Q04       " Guide - Q4          "
  R234Q01       " Personnel - Q1      "
  R234Q02       " Personnel - Q2      "
  R236Q01       " New Rules - Q1      "
  R236Q02       " New Rules - Q2      "
  R237Q01       " Job Interview -     "
  R237Q03       " Job Interview -     "
  R238Q01       " Bicycle - Q1        "
  R238Q02       " Bicycle - Q2        "
  R239Q01       " Allergies - Q1      "
  R239Q02       " Allergies - Q2      "
  R241Q02       " WarrantyHotPoin     "
  R245Q01       " Movie Reviews -Q1   "
  R245Q02       " Movie Reviews -Q2   "
  R246Q01       " Contact Employe     "
  R246Q02       " Contact Employe     "
  S114Q03T      " Greenhouse - Q3     "
  S114Q04T      " Greenhouse - Q4     "
  S114Q05T      " Greenhouse - Q5     "
  S128Q01       " Cloning - Q1        "
  S128Q02       " Cloning - Q2        "
  S128Q03T      " Cloning - Q3        "
  S129Q01       " Daylight - Q1       "
  S129Q02T      " Daylight - Q2       "
  S131Q02T      " Good Vibrations     "
  S131Q04T      " Good Vibrations     "
  S133Q01       " Research - Q1       "
  S133Q03       " Research - Q3       "
  S133Q04T      " Research - Q4       "
  S195Q02T      " Semmelweis - Q2     "
  S195Q04       " Semmelweis - Q4     "
  S195Q05T      " Semmelweis - Q5     "
  S195Q06       " SemmelWeis - Q6     "
  S209Q02T      " Tidal Power - Q     "
  S213Q01T      " Clothes - Q1        "
  S213Q02       " Clothes - Q2        "
  S252Q01       " South Rainea -Q1    "
  S252Q02       " South Rainea -Q2    "
  S252Q03T      " South Rainea -Q3    "
  S253Q01T      " Ozone - Q1          "
  S253Q02       " Ozone - Q2          "
  S253Q05       " Ozone - Q5          "
  S256Q01       " Spoons - Q1         "
  S268Q01       " Algae - Q1          "
  S268Q02T      " Algae - Q2          "
  S268Q06       " Algae - Q6          "
  S269Q01       " Earth - Q1          "
  S269Q03T      " Earth - Q3          "
  S269Q04T      " Earth - Q4          "
  S270Q03T      " Ozone - Q3          " 
  S301Q01T      "Moonlight - Q01"
  S301Q02T      "Moonlight - Q02"
  S301Q03A      "Moonlight - Q03A"
  S301Q04      "Moonlight - Q04"
  S302Q01       "Ozone Layer - Q01" 
  S302Q02       "Ozone Layer - Q02"
  S305Q01T    "Greenhouse effect - Q01"
  S304Q01     "From seawater - Q01"
  S304Q02     "From seawater - Q02"
  S305Q02     "Greenhouse effect - Q02"
  S305Q03T    "Greenhouse effect - Q03"
  MSCALE       " Maths Scalable     "
  RSCALE       " Reading Scalable    "
  SSCALE       " Science Scalable    "
  CNT          "Country Alphanumeric ISO Code"
  VER_COGN  	"Version of cognitive database and date of release".

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
           "807" "MACEDONIA" /
  M033Q01 to S305Q03T    
              "n"    "N/A"
	             "r"    "Not reached"
              "8"    "M/R"
              "9"    "Missing"/
  MSCALE  RSCALE SSCALE      
	"0"    "non-scalable"
	"1"    "scalable"
	"8"    "non-scalable"/ 
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
           "USA" "UNITED STATES"/.
missing value
M033Q01 to  S305Q03T ('8','9','n').
execute.

    SAVE TRANSLATE OUTFILE= 'E:\works\pisa\stata\p00_cogitm.dta'
          /TYPE=STATA
          /VERSION=13
          /EDITION=SE
          /MAP
          /REPLACE.
