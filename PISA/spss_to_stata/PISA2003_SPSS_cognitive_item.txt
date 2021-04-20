* This program reads the txt file data and applies variable and value labels, format and missing values specifications.
* Write the location of the ASCII file at the beginning of the control file.
* Write the location of the SPSS data file at the end of the control file.

SET decimal=dot.
DATA LIST file="e:\works\pisa\pisa2003\INT_cogn_2003_v2.txt"
/ country               1-  3  (A)
CNT                   4-  6  (A)
subnatio              7- 10  (A)
schoolid             11- 15  (A)
stidstd              16- 20  (A)
BOOKID               22- 23  (A)
M033Q01              24- 24  (A)
M034Q01T             25- 25  (A)
M124Q01              26- 26  (A)
M124Q03T             27- 27  (A)
M144Q01T             28- 28  (A)
M144Q02T             29- 29  (A)
M144Q03              30- 30  (A)
M144Q04T             31- 31  (A)
M145Q01T             32- 32  (A)
M150Q01              33- 33  (A)
M150Q02T             34- 34  (A)
M150Q03T             35- 35  (A)
M155Q01              36- 36  (A)
M155Q02T             37- 37  (A)
M155Q03T             38- 38  (A)
M155Q04T             39- 39  (A)
M179Q01T             40- 40  (A)
M192Q01T             41- 41  (A)
M266Q01T             42- 42  (A)
M273Q01T             43- 43  (A)
M302Q01T             44- 44  (A)
M302Q02              45- 45  (A)
M302Q03              46- 46  (A)
M305Q01              47- 47  (A)
M402Q01              48- 48  (A)
M402Q02              49- 49  (A)
M406Q01              50- 50  (A)
M406Q02              51- 51  (A)
M406Q03              52- 52  (A)
M408Q01T             53- 53  (A)
M411Q01              54- 54  (A)
M411Q02              55- 55  (A)
M413Q01              56- 56  (A)
M413Q02              57- 57  (A)
M413Q03T             58- 58  (A)
M420Q01T             59- 59  (A)
M421Q01              60- 60  (A)
M421Q02T             61- 61  (A)
M421Q03              62- 62  (A)
M423Q01              63- 63  (A)
M438Q01              64- 64  (A)
M438Q02              65- 65  (A)
M442Q02              66- 66  (A)
M446Q01              67- 67  (A)
M446Q02              68- 68  (A)
M447Q01              69- 69  (A)
M462Q01T             70- 70  (A)
M464Q01T             71- 71  (A)
M467Q01              72- 72  (A)
M468Q01T             73- 73  (A)
M474Q01              74- 74  (A)
M484Q01T             75- 75  (A)
M496Q01T             76- 76  (A)
M496Q02              77- 77  (A)
M505Q01              78- 78  (A)
M509Q01              79- 79  (A)
M510Q01T             80- 80  (A)
M513Q01              81- 81  (A)
M520Q01T             82- 82  (A)
M520Q02              83- 83  (A)
M520Q03T             84- 84  (A)
M547Q01T             85- 85  (A)
M555Q02T             86- 86  (A)
M559Q01              87- 87  (A)
M564Q01              88- 88  (A)
M564Q02              89- 89  (A)
M571Q01              90- 90  (A)
M598Q01              91- 91  (A)
M603Q01T             92- 92  (A)
M603Q02T             93- 93  (A)
M702Q01              94- 94  (A)
M704Q01T             95- 95  (A)
M704Q02T             96- 96  (A)
M710Q01              97- 97  (A)
M800Q01              98- 98  (A)
M803Q01T             99- 99  (A)
M806Q01T            100-100  (A)
M810Q01T            101-101  (A)
M810Q02T            102-102  (A)
M810Q03T            103-103  (A)
M828Q01             104-104  (A)
M828Q02             105-105  (A)
M828Q03             106-106  (A)
M833Q01T            107-107  (A)
R055Q01             108-108  (A)
R055Q02             109-109  (A)
R055Q03             110-110  (A)
R055Q05             111-111  (A)
R067Q01             112-112  (A)
R067Q04             113-113  (A)
R067Q05             114-114  (A)
R102Q04A            115-115  (A)
R102Q05             116-116  (A)
R102Q07             117-117  (A)
R104Q01             118-118  (A)
R104Q02             119-119  (A)
R104Q05             120-120  (A)
R111Q01             121-121  (A)
R111Q02B            122-122  (A)
R111Q06B            123-123  (A)
R219Q01T            124-124  (A)
R219Q01E            125-125  (A)
R219Q02             126-126  (A)
R220Q01             127-127  (A)
R220Q02B            128-128  (A)
R220Q04             129-129  (A)
R220Q05             130-130  (A)
R220Q06             131-131  (A)
R227Q01             132-132  (A)
R227Q02T            133-133  (A)
R227Q03             134-134  (A)
R227Q06             135-135  (A)
S114Q03T            136-136  (A)
S114Q04T            137-137  (A)
S114Q05T            138-138  (A)
S128Q01             139-139  (A)
S128Q02             140-140  (A)
S128Q03T            141-141  (A)
S129Q01             142-142  (A)
S129Q02T            143-143  (A)
S131Q02T            144-144  (A)
S131Q04T            145-145  (A)
S133Q01             146-146  (A)
S133Q03             147-147  (A)
S133Q04T            148-148  (A)
S213Q01T            149-149  (A)
S213Q02             150-150  (A)
S252Q01             151-151  (A)
S252Q02             152-152  (A)
S252Q03T            153-153  (A)
S256Q01             154-154  (A)
S268Q01             155-155  (A)
S268Q02T            156-156  (A)
S268Q06             157-157  (A)
S269Q01             158-158  (A)
S269Q03T            159-159  (A)
S269Q04T            160-160  (A)
S304Q01             161-161  (A)
S304Q02             162-162  (A)
S304Q03a            163-163  (A)
S304Q03b            164-164  (A)
S326Q01             165-165  (A)
S326Q02             166-166  (A)
S326Q03             167-167  (A)
S326Q04T            168-168  (A)
S327Q01T            169-169  (A)
X402Q01T            170-170  (A)
X402Q02T            171-171  (A)
X412Q01             172-172  (A)
X412Q02             173-173  (A)
X412Q03             174-174  (A)
X414Q01             175-175  (A)
X415Q01T            176-176  (A)
X417Q01             177-177  (A)
X423Q01T            178-178  (A)
X423Q02T            179-179  (A)
X430Q01             180-180  (A)
X430Q02             181-181  (A)
X601Q01T            182-182  (A)
X601Q02             183-183  (A)
X602Q01             184-184  (A)
X602Q02             185-185  (A)
X603Q01             186-186  (A)
X603Q02T            187-187  (A)
X603Q03             188-188  (A)
MSCALE              189-189  (A)
RSCALE              190-190  (A)
SSCALE              191-191  (A)
PSCALE              192-192  (A)
CLCUSE1             193-193  (A)
CLCUSE3a            194-196
CLCUSE3b            197-199
  .
  
variable labels
  country        "Country three-digit ISO code"
  CNT            "Country Alphanumeric ISO Code"
  subnatio  "Sub-Nation code" 
  SchoolID   "School ID"
  StIDStd   "Student ID"
  M033Q01 	  "View Room Q1		"
  M034Q01T   "Bricks Q1		"
  M124Q01    "Walking Q1		"
  M124Q03T   "Walking Q3		"
  M144Q01T   "Cube Painting Q1		"
  M144Q02T   "Cube Painting Q2		"
  M144Q03    "Cube Painting Q3		"
  M144Q04T   "Cube Painting Q4		"
  M145Q01T   "Cubes Q1		"
  M150Q01    "Growing Up Q1		"
  M150Q02T   "Growing Up Q2		"
  M150Q03T   "Growing Up Q3		"
  M155Q01    "Pop Pyramids Q1		"
  M155Q02T   "Pop Pyramids Q2		"
  M155Q03T   "Pop Pyramids Q3		"
  M155Q04T   "Pop Pyramids Q4		"
  M179Q01T   "Robberies Q1		"
  M192Q01T   "Containers Q1		"
  M266Q01T   "Carpenter Q01		"
  M273Q01T   "Pipelines Q1		"
  M302Q01T   "Car Drive Q1		"
  M302Q02    "Car Drive Q2		"
  M302Q03    "Car Drive Q3		"
  M305Q01    "Map Q1		"
  M402Q01    "INTERNET  Q1		"
  M402Q02    "INTERNET  Q2		"
  M406Q01    "RUNNING TRACKS Q1		"
  M406Q02    "RUNNING TRACKS Q2		"
  M406Q03    "RUNNING TRACKS Q3		"
  M408Q01T   "LOTTERIES Q1		"
  M411Q01    "DIVING Q1		"
  M411Q02    "DIVING Q2		"
  M413Q01    "EXCHANGE RATE Q1		"
  M413Q02    "EXCHANGE RATE Q2		"
  M413Q03T   "EXCHANGE RATE Q3		"
  M420Q01T   "TRANSPORT Q1		"
  M421Q01    "HEIGHT Q1		"
  M421Q02T   "HEIGHT Q2		"
  M421Q03    "HEIGHT Q3		"
  M423Q01    "TOSSING COINS Q1		"
  M438Q01    "EXPORTS Q1		"
  M438Q02    "EXPORTS Q2		"
  M442Q02    "BRAILLE Q2		"
  M446Q01    "THERMOMETER CRICKET Q1		"
  M446Q02    "THERMOMETER CRICKET Q2		"
  M447Q01    "TILE ARRANGE1 Q1		"
  M462Q01T   "THIRD SIDE Q1		"
  M464Q01T   "FENCE Q1		"
  M467Q01    "COLOURED CANDIES Q1		"
  M468Q01T   "SCIENCE TESTS Q1		"
  M474Q01    "RUNNING TIME Q1		"
  M484Q01T   "BOOKSHELVES Q1		"
  M496Q01T   "CASH WITHDRAWAL Q1		"
  M496Q02    "CASH WITHDRAWAL Q2		"
  M505Q01    "LITTER Q1		"
  M509Q01    "EARTHQUAKE Q1		"
  M510Q01T   "CHOICES Q1		"
  M513Q01    "TEST SCORES Q1		"
  M520Q01T   "SKATEBOARD Q1		"
  M520Q02    "SKATEBOARD Q2		"
  M520Q03T   "SKATEBOARD Q3		"
  M547Q01T   "STAIRCASE Q1		"
  M555Q02T   "NUMBER CUBES Q2		"
  M559Q01    "TELEPHONE RATES Q1		"
  M564Q01    "CHAIR LIFT Q1		"
  M564Q02    "CHAIR LIFT Q2		"
  M571Q01    "STOP THE CAR Q1		"
  M598Q01    "MAKING A BOOKLET Q1		"
  M603Q01T   "NUMBER CHECK Q1		"
  M603Q02T   "NUMBER CHECK Q2		"
  M702Q01    "SUPPORT FOR PRESIDENT Q1		"
  M704Q01T   "THE BEST CAR Q1		"
  M704Q02T   "THE BEST CAR Q2		"
  M710Q01    "FORECAST OF RAIN Q1		"
  M800Q01    "COMPUTER GAME Q1		"
  M803Q01T   "LABELS Q1		"
  M806Q01T   "STEP PATTERN Q1		"
  M810Q01T   "BICYCLES Q1		"
  M810Q02T   "BICYCLES Q2		"
  M810Q03T   "BICYCLES Q3		"
  M828Q01    "CARBON DIOXIDE Q1		"
  M828Q02    "CARBON DIOXIDE Q2		"
  M828Q03    "CARBON DIOXIDE Q3		"
  M833Q01T   "Seeing the Tower Q1		"
  R055Q01    "Drugged Spiders Q1		"
  R055Q02    "Drugged Spiders Q2		"
  R055Q03    "Dugged Spiders Q3		"
  R055Q05    "Drugged Spiders Q5		"
  R067Q01    "Aesop Q1		"
  R067Q04    "Aesop Q4		"
  R067Q05    "Aesop Q5		"
  R102Q04A   "Shirt Q4A		"
  R102Q05    "Shirt Q5		"
  R102Q07    "Shirt Q7		"
  R104Q01    "Telephone Q1		"
  R104Q02    "Telephone Q2		"
  R104Q05    "Telephone Q5		"
  R111Q01    "Exchange Q1		"
  R111Q02B   "Exchange Q2B		"
  R111Q06B   "Exchange Q6B		"
  R219Q01T   "Employment Q1		"
  R219Q01E   "Employment Q1E		"
  R219Q02    "Employment Q2		"
  R220Q01    "South Pole- Q1		"
  R220Q02B   "South Pole Q2B		"
  R220Q04    "South Pole Q4		"
  R220Q05    "South Pole Q5		"
  R220Q06    "South Pole Q6		"
  R227Q01    "Optician Q1		"
  R227Q02T   "Optician Q2		"
  R227Q03    "Optician Q3		"
  R227Q06    "Optician Q6		"
  S114Q03T   "Greenhouse Q3		"
  S114Q04T   "Greenhouse Q4		"
  S114Q05T   "Greenhouse Q5		"
  S128Q01    "Cloning Q1		"
  S128Q02    "Cloning Q2		"
  S128Q03T   "Cloning Q3		"
  S129Q01    "Daylight Q1		"
  S129Q02T   "Daylight Q2		"
  S131Q02T   "Good Vibrations Q2		"
  S131Q04T   "Good Vibrations Q4		"
  S133Q01    "Research Q1		"
  S133Q03    "Research Q3		"
  S133Q04T   "Research Q4		"
  S213Q01T   "Clothes Q1		"
  S213Q02    "Clothes Q2		"
  S252Q01    "South Rainea Q1		"
  S252Q02    "South Rainea Q2		"
  S252Q03T   "South Rainea Q3		"
  S256Q01    "Spoons Q1		"
  S268Q01    "Algae Q1		"
  S268Q02T   "Algae Q2		"
  S268Q06    "Algae Q6		"
  S269Q01    "Earth Q1		"
  S269Q03T   "Earth Q3		"
  S269Q04T   "Earth Q4		"
  S304Q01    "WATER Q1		"
  S304Q02    "WATER Q2		"
  S304Q03a   "WATER Q3a		"
  S304Q03b   "WATER Q3b		"
  S326Q01    "MILK Q1		"
  S326Q02    "MILK Q2		"
  S326Q03    "MILK Q3		"
  S326Q04T   "MILK Q4		"
  S327Q01T   "Tidal Energy Q1		"
  X402Q01T   "Library System Q1		"
  X402Q02T   "Library System Q2		"
  X412Q01    "Design by Numbers Q1		"
  X412Q02    "Design by Numbers Q2		"
  X412Q03    "Design by Numbers Q3		"
  X414Q01    "Course Design Q1		"
  X415Q01T   "Transit System Q1		"
  X417Q01    "Children's Camp Q1		"
  X423Q01T   "Freezer Q1		"
  X423Q02T   "Freezer Q2		"
  X430Q01    "Energy Needs Q1		"
  X430Q02    "Energy Needs Q2		"
  X601Q01T   "Cinema Outing Q1		"
  X601Q02    "Cinema Outing Q2		"
  X602Q01    "Holiday Q1		"
  X602Q02    "Holiday Q2		"
  X603Q01    "Irrigation Q1		"
  X603Q02T   "Irrigation Q2		"
  X603Q03    "Irrigation Q3		"
  CLCUSE1   "Calculator Use"   
  CLCUSE3a   "Effort-real: a"  
  CLCUSE3b   "Effort-real: b"  
  MSCALE         " Maths Scalable     "
  RSCALE         " Reading Scalable    "
  SSCALE         " Science Scalable    "  
  PSCALE         " Problem Solving Scalable    "   
  .
  
value labels 
 M033Q01 to X603Q03 
        "n"  "N/A"
        "r"  "Not reached"
        "8"  "M/R"
        "9"  "Missing". 
value labels  MSCALE RSCALE SSCALE PSCALE  
 	"0"   "non-scalable"
	"1"   "scalable"
	"8"   "non-scalable" .
value labels  CLCUSE1   "1" "No calculator"                     
          "2" "A Simple calculator"               
          "3" "A Scientific calculator"           
          "4" "A Programmable calculator"         
          "5" "A Graphics calculator"             
          "8" "Invalid"                           
          "9" "Miss"                              
          "n" "N/A" .

missing values  MSCALE RSCALE SSCALE PSCALE CLCUSE1 ('8','9','n').
missing values CLCUSE3a CLCUSE3b (997,998,999).
missing values M033Q01 to X603Q03 ('n').
exe.
    SAVE TRANSLATE OUTFILE= "E:\works\pisa\stata\p03_cogitm.dta" 
          /TYPE=STATA
          /VERSION=13
          /EDITION=SE
          /MAP
          /REPLACE.
