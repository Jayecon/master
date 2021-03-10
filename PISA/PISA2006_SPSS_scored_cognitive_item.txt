***** PISA 2006 Scored Cognitive file *****.
***** Read-in syntax for SPSS         *****.

* This syntax reads the ASCII txt file data and applies variable and value labels, formats and missing value specifications.
* Write the location of the ASCII txt file below, in the DATA LIST command.

*** For the cognitive items, responses are coded as 7 for not administered, 8 for unreached,
*** while missing (omitted reponse) is recoded into 0 (incorrect response) .
*** For the attitude items, 7 is used for not administered, 8 for unreached and 9 for missing (omitted reponse).

*** Two options for recoding these auxilary codes into scores are given at the end of this file, one that recodes unreached into 
*** incorrect responses (for population estimates) and one that recodes unreached into not administered (for item analysis).

SET decimal=dot.

data  list file='c:\****\INT_Cogn06_S_Dec07.txt'
   /SUBNATIO	1-5	(a)
   SCHOOLID	6-10	(a)
   STIDSTD	11-15	(a)
   CNT	16-18	(a)
   COUNTRY	19-21	(a)
   OECD	22-22
   BOOKID	23-24
   M033Q01	26-26	
   M034Q01T	27-27	
   M155Q01	28-28	
   M155Q02T	29-29	
   M155Q03T	30-30	
   M155Q04T	31-31	
   M192Q01T	32-32	
   M273Q01T	33-33	
   M302Q01T	34-34	
   M302Q02	35-35	
   M302Q03	36-36	
   M305Q01	37-37	
   M406Q01	38-38	
   M406Q02	39-39	
   M408Q01T	40-40	
   M411Q01	41-41	
   M411Q02	42-42	
   M420Q01T	43-43	
   M421Q01	44-44	
   M421Q02T	45-45	
   M421Q03	46-46	
   M423Q01	47-47	
   M442Q02	48-48	
   M446Q01	49-49	
   M446Q02	50-50	
   M447Q01	51-51	
   M462Q01T	52-52	
   M464Q01T	53-53	
   M474Q01	54-54	
   M496Q01T	55-55	
   M496Q02	56-56	
   M559Q01	57-57	
   M564Q01	58-58	
   M564Q02	59-59	
   M571Q01	60-60	
   M598Q01	61-61	
   M603Q01T	62-62	
   M603Q02T	63-63	
   M710Q01	64-64	
   M800Q01	65-65	
   M803Q01T	66-66	
   M810Q01T	67-67	
   M810Q02T	68-68	
   M810Q03T	69-69	
   M828Q01	70-70	
   M828Q02	71-71	
   M828Q03	72-72	
   M833Q01T	73-73	
   R055Q01	74-74	
   R055Q02	75-75	
   R055Q03	76-76	
   R055Q05	77-77	
   R067Q01	78-78	
   R067Q04	79-79	
   R067Q05	80-80	
   R102Q04A	81-81	
   R102Q05	82-82	
   R102Q07	83-83	
   R104Q01	84-84	
   R104Q02	85-85	
   R104Q05	86-86	
   R111Q01	87-87	
   R111Q02B	88-88	
   R111Q06B	89-89	
   R219Q01E	90-90	
   R219Q01T	91-91	
   R219Q02	92-92	
   R220Q01	93-93	
   R220Q02B	94-94	
   R220Q04	95-95	
   R220Q05	96-96	
   R220Q06	97-97	
   R227Q01	98-98	
   R227Q02T	99-99	
   R227Q03	100-100	
   R227Q06	101-101	
   S114Q03T	102-102	
   S114Q04T	103-103	
   S114Q05T	104-104	
   S131Q02T	105-105	
   S131Q04T	106-106	
   S213Q01T	107-107	
   S213Q02	108-108	
   S256Q01	109-109	
   S268Q01	110-110	
   S268Q02T	111-111	
   S268Q06	112-112	
   S269Q01	113-113	
   S269Q03T	114-114	
   S269Q04T	115-115	
   S304Q01	116-116	
   S304Q02	117-117	
   S304Q03A	118-118	
   S304Q03B	119-119	
   S326Q01	120-120	
   S326Q02	121-121	
   S326Q03	122-122	
   S326Q04T	123-123	
   S408Q01	124-124	
   S408Q03	125-125	
   S408Q04T	126-126	
   S408Q05	127-127	
   S413Q04T	128-128	
   S413Q05	129-129	
   S413Q06	130-130	
   S415Q02	131-131	
   S415Q07T	132-132	
   S415Q08T	133-133	
   S416Q01	134-134	
   S421Q01	135-135	
   S421Q03	136-136	
   S425Q02	137-137	
   S425Q03	138-138	
   S425Q04	139-139	
   S425Q05	140-140	
   S426Q03	141-141	
   S426Q05	142-142	
   S426Q07T	143-143	
   S428Q01	144-144	
   S428Q03	145-145	
   S428Q05	146-146	
   S437Q01	147-147	
   S437Q03	148-148	
   S437Q04	149-149	
   S437Q06	150-150	
   S438Q01T	151-151	
   S438Q02	152-152	
   S438Q03T	153-153	
   S447Q02	154-154	
   S447Q03	155-155	
   S447Q04	156-156	
   S447Q05	157-157	
   S458Q01	158-158	
   S458Q02T	159-159	
   S465Q01	160-160	
   S465Q02	161-161	
   S465Q04	162-162	
   S466Q01T	163-163	
   S466Q05	164-164	
   S466Q07T	165-165	
   S476Q01	166-166	
   S476Q02	167-167	
   S476Q03	168-168	
   S477Q02	169-169	
   S477Q03	170-170	
   S477Q04	171-171	
   S478Q01	172-172	
   S478Q02T	173-173	
   S478Q03T	174-174	
   S485Q02	175-175	
   S485Q03	176-176	
   S485Q05	177-177	
   S493Q01T	178-178	
   S493Q03T	179-179	
   S493Q05T	180-180	
   S495Q01T	181-181	
   S495Q02T	182-182	
   S495Q03	183-183	
   S495Q04T	184-184	
   S498Q02T	185-185	
   S498Q03	186-186	
   S498Q04	187-187	
   S508Q02T	188-188	
   S508Q03	189-189	
   S510Q01T	190-190	
   S510Q04T	191-191	
   S514Q02	192-192	
   S514Q03	193-193	
   S514Q04	194-194	
   S519Q01	195-195	
   S519Q02T	196-196	
   S519Q03	197-197	
   S521Q02	198-198	
   S521Q06	199-199	
   S524Q06T	200-200	
   S524Q07	201-201	
   S527Q01T	202-202	
   S527Q03T	203-203	
   S527Q04T	204-204	
   S408QNA	205-205	
   S408QNB	206-206	
   S408QNC	207-207	
   S413QNA	208-208	
   S413QNB	209-209	
   S413QNC	210-210	
   S416QNA	211-211	
   S416QNB	212-212	
   S428QNA	213-213	
   S428QNB	214-214	
   S428QNC	215-215	
   S437QNA	216-216	
   S437QNB	217-217	
   S437QNC	218-218	
   S438QNA	219-219	
   S438QNB	220-220	
   S438QNC	221-221	
   S456QNA	222-222	
   S456QNB	223-223	
   S456QNC	224-224	
   S466QNA	225-225	
   S466QNB	226-226	
   S466QNC	227-227	
   S476QNA	228-228	
   S476QNB	229-229	
   S476QNC	230-230	
   S478QNA	231-231	
   S478QNB	232-232	
   S478QNC	233-233	
   S485QNA	234-234	
   S485QNB	235-235	
   S485QNC	236-236	
   S498QNA	237-237	
   S498QNB	238-238	
   S498QNC	239-239	
   S508QNA	240-240	
   S508QNB	241-241	
   S508QNC	242-242	
   S514QNA	243-243	
   S514QNB	244-244	
   S514QNC	245-245	
   S519QNA	246-246	
   S519QNB	247-247	
   S519QNC	248-248	
   S521QNA	249-249	
   S521QNB	250-250	
   S524QNA	251-251	
   S524QNB	252-252	
   S524QNC	253-253	
   S527QNA	254-254	
   S527QNB	255-255	
   S527QNC	256-256	
   S408QSA	257-257	
   S408QSB	258-258	
   S408QSC	259-259	
   S416QSA	260-260	
   S416QSB	261-261	
   S416QSC	262-262	
   S421QSA	263-263	
   S421QSC	264-264	
   S425QSA	265-265	
   S425QSB	266-266	
   S425QSC	267-267	
   S426QSA	268-268	
   S426QSB	269-269	
   S426QSC	270-270	
   S438QSA	271-271	
   S438QSB	272-272	
   S438QSC	273-273	
   S456QSA	274-274	
   S456QSB	275-275	
   S456QSC	276-276	
   S465QSA	277-277	
   S465QSB	278-278	
   S476QSA	279-279	
   S476QSB	280-280	
   S476QSC	281-281	
   S477QSA	282-282	
   S477QSB	283-283	
   S477QSC	284-284	
   S485QSB	285-285	
   S485QSC	286-286	
   S498QSA	287-287	
   S498QSB	288-288	
   S519QSA	289-289	
   S519QSB	290-290	
   S519QSC	291-291	
   S527QSB	292-292	
   S527QSC	293-293	
   CLCUSE3A	295-297	
   CLCUSE3B	298-300	
   DEFFORT	  301-303	
   TESTLANG	304-306	(A)
   VER_COGN 	307-318	(A)
   .

var lab 
   SUBNATIO 'Adjudicated sub-region '
   SCHOOLID 'School ID 5-digit'
   STIDSTD 'Student ID 5-digit'
   CNT 'Country code 3-character'
   COUNTRY 'Country code 3-digit'
   OECD 'OECD Country'
   BOOKID 'Booklet'
   M033Q01 'MATH - P2000 A View Room (Q01)'
   M034Q01T 'MATH - P2000 Bricks (Q01)'
   M155Q01 'MATH - P2000 Population Pyramids (Q01)'
   M155Q02T 'MATH - P2000 Population Pyramids (Q02)'
   M155Q03T 'MATH - P2000 Population Pyramids (Q03)'
   M155Q04T 'MATH - P2000 Population Pyramids (Q04)'
   M192Q01T 'MATH - P2000 Containers (Q01)'
   M273Q01T 'MATH - P2000 Pipelines (Q01)'
   M302Q01T 'MATH - P2003 Car Drive (Q01)'
   M302Q02 'MATH - P2003 Car Drive (Q02)'
   M302Q03 'MATH - P2003 Car Drive (Q03)'
   M305Q01 'MATH - P2003 Map (Q01)'
   M406Q01 'MATH - P2003 Running Tracks (Q01)'
   M406Q02 'MATH - P2003 Running Tracks (Q02)'
   M408Q01T 'MATH - P2003 Lotteries (Q01)'
   M411Q01 'MATH - P2003 Diving (Q01)'
   M411Q02 'MATH - P2003 Diving (Q02)'
   M420Q01T 'MATH - P2003 Transport (Q01)'
   M421Q01 'MATH - P2003 Height (Q01)'
   M421Q02T 'MATH - P2003 Height (Q02)'
   M421Q03 'MATH - P2003 Height (Q03)'
   M423Q01 'MATH - P2003 Tossing Coins (Q01)'
   M442Q02 'MATH - P2003 Braille (Q02)'
   M446Q01 'MATH - P2003 Thermometer Cricket (Q01)'
   M446Q02 'MATH - P2003 Thermometer Cricket (Q02)'
   M447Q01 'MATH - P2003 Tile Arrangement (Q01)'
   M462Q01T 'MATH - P2003 Third Side (Q01)'
   M464Q01T 'MATH - P2003 The Fence (Q01)'
   M474Q01 'MATH - P2003 Running Time (Q01)'
   M496Q01T 'MATH - P2003 Cash Withdrawal (Q01)'
   M496Q02 'MATH - P2003 Cash Withdrawal (Q02)'
   M559Q01 'MATH - P2003 Telephone Rates (Q01)'
   M564Q01 'MATH - P2003 Chair Lift (Q01)'
   M564Q02 'MATH - P2003 Chair Lift (Q02)'
   M571Q01 'MATH - P2003 Stop The Car (Q01)'
   M598Q01 'MATH - P2003 Making A Booklet (Q01)'
   M603Q01T 'MATH - P2003 Number Check (Q01)'
   M603Q02T 'MATH - P2003 Number Check (Q02)'
   M710Q01 'MATH - P2003 Forecast of Rain (Q01)'
   M800Q01 'MATH - P2003 Computer Game (Q01)'
   M803Q01T 'MATH - P2003 Labels (Q01)'
   M810Q01T 'MATH - P2003 Bicycles (Q01)'
   M810Q02T 'MATH - P2003 Bicycles (Q02)'
   M810Q03T 'MATH - P2003 Bicycles (Q03)'
   M828Q01 'MATH - P2003 Carbon Dioxide (Q01)'
   M828Q02 'MATH - P2003 Carbon Dioxide (Q02)'
   M828Q03 'MATH - P2003 Carbon Dioxide (Q03)'
   M833Q01T 'MATH - P2003 Seeing the tower (Q01)'
   R055Q01 'READ - P2000 Drugged Spiders (Q01)'
   R055Q02 'READ - P2000 Drugged Spiders (Q02)'
   R055Q03 'READ - P2000 Drugged Spiders (Q03)'
   R055Q05 'READ - P2000 Drugged Spiders (Q05)'
   R067Q01 'READ - P2000 Aesop (Q01)'
   R067Q04 'READ - P2000 Aesop (Q04)'
   R067Q05 'READ - P2000 Aesop (Q05)'
   R102Q04A 'READ - P2000 Shirts (Q04a)'
   R102Q05 'READ - P2000 Shirts (Q05)'
   R102Q07 'READ - P2000 Shirts (Q07)'
   R104Q01 'READ - P2000 Telephone (Q01)'
   R104Q02 'READ - P2000 Telephone (Q02)'
   R104Q05 'READ - P2000 Telephone (Q05)'
   R111Q01 'READ - P2000 Exchange (Q01)'
   R111Q02B 'READ - P2000 Exchange (Q02b)'
   R111Q06B 'READ - P2000 Exchange (Q06b)'
   R219Q01E 'READ - P2000 Employment (Q01e)'
   R219Q01T 'READ - P2000 Employment (Q01)'
   R219Q02 'READ - P2000 Employment (Q02)'
   R220Q01 'READ - P2000 South Pole (Q01)'
   R220Q02B 'READ - P2000 South Pole (Q02b)'
   R220Q04 'READ - P2000 South Pole (Q04)'
   R220Q05 'READ - P2000 South Pole (Q05)'
   R220Q06 'READ - P2000 South Pole (Q06)'
   R227Q01 'READ - P2000 Optician (Q01)'
   R227Q02T 'READ - P2000 Optician (Q02)'
   R227Q03 'READ - P2000 Optician (Q03)'
   R227Q06 'READ - P2000 Optician (Q06)'
   S114Q03T 'SCIE - P2000 Greenhouse (Q03)'
   S114Q04T 'SCIE - P2000 Greenhouse (Q04)'
   S114Q05T 'SCIE - P2000 Greenhouse (Q05)'
   S131Q02T 'SCIE - P2000 Good Vibrations (Q02)'
   S131Q04T 'SCIE - P2006 (broken link) Good Vibrations (Q04)'
   S213Q01T 'SCIE - P2000 Clothes (Q01)'
   S213Q02 'SCIE - P2000 Clothes (Q02)'
   S256Q01 'SCIE - P2000 Spoons (Q01)'
   S268Q01 'SCIE - P2000 Algae (Q01)'
   S268Q02T 'SCIE - P2000 Algae (Q02)'
   S268Q06 'SCIE - P2000 Algae (Q06)'
   S269Q01 'SCIE - P2000 Earth Temperature (Q01)'
   S269Q03T 'SCIE - P2000 Earth Temperature (Q03)'
   S269Q04T 'SCIE - P2000 Earth Temperature (Q04)'
   S304Q01 'SCIE - P2003 Water (Q01)'
   S304Q02 'SCIE - P2003 Water (Q02)'
   S304Q03A 'SCIE - P2003 Water (Q03a)'
   S304Q03B 'SCIE - P2003 Water (Q03b)'
   S326Q01 'SCIE - P2003 Milk (Q01)'
   S326Q02 'SCIE - P2003 Milk (Q02)'
   S326Q03 'SCIE - P2003 Milk (Q03)'
   S326Q04T 'SCIE - P2003 Milk (Q04)'
   S408Q01 'SCIE - P2006 Wild Oat Grass (Q01)'
   S408Q03 'SCIE - P2006 Wild Oat Grass (Q03)'
   S408Q04T 'SCIE - P2006 Wild Oat Grass (Q04)'
   S408Q05 'SCIE - P2006 Wild Oat Grass (Q05)'
   S413Q04T 'SCIE - P2006 Plastic Age (Q04)'
   S413Q05 'SCIE - P2006 Plastic Age (Q05)'
   S413Q06 'SCIE - P2006 Plastic Age (Q06)'
   S415Q02 'SCIE - P2006 Solar Power Generation (Q02)'
   S415Q07T 'SCIE - P2006 Solar Power Generation (Q07)'
   S415Q08T 'SCIE - P2006 Solar Power Generation (Q08)'
   S416Q01 'SCIE - P2006 The Moon (Q01)'
   S421Q01 'SCIE - P2006 Big and Small (Q01)'
   S421Q03 'SCIE - P2006 Big and Small (Q03)'
   S425Q02 'SCIE - P2006 Penguin Island (Q02)'
   S425Q03 'SCIE - P2006 Penguin Island (Q03)'
   S425Q04 'SCIE - P2006 Penguin Island (Q04)'
   S425Q05 'SCIE - P2006 Penguin Island (Q05)'
   S426Q03 'SCIE - P2006 The Grand Canyon (Q03)'
   S426Q05 'SCIE - P2006 The Grand Canyon (Q05)'
   S426Q07T 'SCIE - P2006 The Grand Canyon (Q07)'
   S428Q01 'SCIE - P2006 Bacteria in Milk (Q01)'
   S428Q03 'SCIE - P2006 Bacteria in Milk (Q03)'
   S428Q05 'SCIE - P2006 Bacteria in Milk (Q05)'
   S437Q01 'SCIE - P2006 Extinguishing Fires (Q01)'
   S437Q03 'SCIE - P2006 Extinguishing Fires (Q03)'
   S437Q04 'SCIE - P2006 Extinguishing Fires (Q04)'
   S437Q06 'SCIE - P2006 Extinguishing Fires (Q06)'
   S438Q01T 'SCIE - P2006 Green Parks (Q01)'
   S438Q02 'SCIE - P2006 Green Parks (Q02)'
   S438Q03T 'SCIE - P2006 Green Parks (Q03)'
   S447Q02 'SCIE - P2006 Sunscreens (Q02)'
   S447Q03 'SCIE - P2006 Sunscreens (Q03)'
   S447Q04 'SCIE - P2006 Sunscreens (Q04)'
   S447Q05 'SCIE - P2006 Sunscreens (Q05)'
   S458Q01 'SCIE - P2006 The Ice Mummy (Q01)'
   S458Q02T 'SCIE - P2006 The Ice Mummy (Q02)'
   S465Q01 'SCIE - P2006 Different Climates (Q01)'
   S465Q02 'SCIE - P2006 Different Climates (Q02)'
   S465Q04 'SCIE - P2006 Different Climates (Q04)'
   S466Q01T 'SCIE - P2006 Forest Fires (Q01)'
   S466Q05 'SCIE - P2006 Forest Fires (Q05)'
   S466Q07T 'SCIE - P2006 Forest Fires (Q07)'
   S476Q01 'SCIE - P2006 Heart Surgery (Q01)'
   S476Q02 'SCIE - P2006 Heart Surgery (Q02)'
   S476Q03 'SCIE - P2006 Heart Surgery (Q03)'
   S477Q02 'SCIE - P2006 Mary Montagu (Q02)'
   S477Q03 'SCIE - P2006 Mary Montagu (Q03)'
   S477Q04 'SCIE - P2006 Mary Montagu (Q04)'
   S478Q01 'SCIE - P2006 Antibiotics (Q01)'
   S478Q02T 'SCIE - P2006 Antibiotics (Q02)'
   S478Q03T 'SCIE - P2006 Antibiotics (Q03)'
   S485Q02 'SCIE - P2006 Acid Rain (Q02)'
   S485Q03 'SCIE - P2006 Acid Rain (Q03)'
   S485Q05 'SCIE - P2006 Acid Rain (Q05)'
   S493Q01T 'SCIE - P2006 Physical Exercise (Q01)'
   S493Q03T 'SCIE - P2006 Physical Exercise (Q03)'
   S493Q05T 'SCIE - P2006 Physical Exercise (Q05)'
   S495Q01T 'SCIE - P2006 Radiotherapy (Q01)'
   S495Q02T 'SCIE - P2006 Radiotherapy (Q02)'
   S495Q03 'SCIE - P2006 Radiotherapy (Q03)'
   S495Q04T 'SCIE - P2006 Radiotherapy (Q04)'
   S498Q02T 'SCIE - P2006 Experimental Digestion (Q02)'
   S498Q03 'SCIE - P2006 Experimental Digestion (Q03)'
   S498Q04 'SCIE - P2006 Experimental Digestion (Q04)'
   S508Q02T 'SCIE - P2006 Genetically Modified Food (Q02)'
   S508Q03 'SCIE - P2006 Genetically Modified Food (Q03)'
   S510Q01T 'SCIE - P2006 Magnetic Hovertrain (Q01)'
   S510Q04T 'SCIE - P2006 Magnetic Hovertrain (Q04)'
   S514Q02 'SCIE - P2006 Development and Disaster (Q02)'
   S514Q03 'SCIE - P2006 Development and Disaster (Q03)'
   S514Q04 'SCIE - P2006 Development and Disaster (Q04)'
   S519Q01 'SCIE - P2006 Airbags (Q01)'
   S519Q02T 'SCIE - P2006 Airbags (Q02)'
   S519Q03 'SCIE - P2006 Airbags (Q03)'
   S521Q02 'SCIE - P2006 Cooking Outdoors (Q02)'
   S521Q06 'SCIE - P2006 Cooking Outdoors (Q06)'
   S524Q06T 'SCIE - P2006 Penicillin Manufacture (Q06)'
   S524Q07 'SCIE - P2006 Penicillin Manufacture (Q07)'
   S527Q01T 'SCIE - P2006 Extinction of the Dinosaurs (Q01)'
   S527Q03T 'SCIE - P2006 Extinction of the Dinosaurs (Q03)'
   S527Q04T 'SCIE - P2006 Extinction of the Dinosaurs (Q04)'
   S408QNA 'INTR - P2006 Wild Oat Grass (A)'
   S408QNB 'INTR - P2006 Wild Oat Grass (B)'
   S408QNC 'INTR - P2006 Wild Oat Grass (C)'
   S413QNA 'INTR - P2006 Plastic Age (A)'
   S413QNB 'INTR - P2006 Plastic Age (B)'
   S413QNC 'INTR - P2006 Plastic Age (C)'
   S416QNA 'INTR - P2006 The Moon (A)'
   S416QNB 'INTR - P2006 The Moon (B)'
   S428QNA 'INTR - P2006 Bacteria in Milk (A)'
   S428QNB 'INTR - P2006 Bacteria in Milk (B)'
   S428QNC 'INTR - P2006 Bacteria in Milk (C)'
   S437QNA 'INTR - P2006 Extinguishing Fires (A)'
   S437QNB 'INTR - P2006 Extinguishing Fires (B)'
   S437QNC 'INTR - P2006 Extinguishing Fires (C)'
   S438QNA 'INTR - P2006 Green Parks (A)'
   S438QNB 'INTR - P2006 Green Parks (B)'
   S438QNC 'INTR - P2006 Green Parks (C)'
   S456QNA 'INTR - P2006 The Cheetah (A)'
   S456QNB 'INTR - P2006 The Cheetah (B)'
   S456QNC 'INTR - P2006 The Cheetah (C)'
   S466QNA 'INTR - P2006 Forest Fires (A)'
   S466QNB 'INTR - P2006 Forest Fires (B)'
   S466QNC 'INTR - P2006 Forest Fires (C)'
   S476QNA 'INTR - P2006 Heart Surgery (A)'
   S476QNB 'INTR - P2006 Heart Surgery (B)'
   S476QNC 'INTR - P2006 Heart Surgery (C)'
   S478QNA 'INTR - P2006 Antibiotics (A)'
   S478QNB 'INTR - P2006 Antibiotics (B)'
   S478QNC 'INTR - P2006 Antibiotics (C)'
   S485QNA 'INTR - P2006 Acid Rain (A)'
   S485QNB 'INTR - P2006 Acid Rain (B)'
   S485QNC 'INTR - P2006 Acid Rain (C)'
   S498QNA 'INTR - P2006 Experimental Digestion (A)'
   S498QNB 'INTR - P2006 Experimental Digestion (B)'
   S498QNC 'INTR - P2006 Experimental Digestion (C)'
   S508QNA 'INTR - P2006 Genetically Modified Food (A)'
   S508QNB 'INTR - P2006 Genetically Modified Food (B)'
   S508QNC 'INTR - P2006 Genetically Modified Food (C)'
   S514QNA 'INTR - P2006 Development and Disaster (A)'
   S514QNB 'INTR - P2006 Development and Disaster (B)'
   S514QNC 'INTR - P2006 Development and Disaster (C)'
   S519QNA 'INTR - P2006 Airbags (A)'
   S519QNB 'INTR - P2006 Airbags (B)'
   S519QNC 'INTR - P2006 Airbags (C)'
   S521QNA 'INTR - P2006 Cooking Outdoors (A)'
   S521QNB 'INTR - P2006 Cooking Outdoors (B)'
   S524QNA 'INTR - P2006 Penicillin Manufacture (A)'
   S524QNB 'INTR - P2006 Penicillin Manufacture (B)'
   S524QNC 'INTR - P2006 Penicillin Manufacture (C)'
   S527QNA 'INTR - P2006 Extinction of the Dinosaurs (A)'
   S527QNB 'INTR - P2006 Extinction of the Dinosaurs (B)'
   S527QNC 'INTR - P2006 Extinction of the Dinosaurs (C)'
   S408QSA 'SUPP - P2006 Wild Oat Grass (A)'
   S408QSB 'SUPP - P2006 Wild Oat Grass (B)'
   S408QSC 'SUPP - P2006 Wild Oat Grass (C)'
   S416QSA 'SUPP - P2006 The Moon (A)'
   S416QSB 'SUPP - P2006 The Moon (B)'
   S416QSC 'SUPP - P2006 The Moon (C)'
   S421QSA 'SUPP - P2006 Big and Small (A)'
   S421QSC 'SUPP - P2006 Big and Small (C)'
   S425QSA 'SUPP - P2006 Penguin Island (A)'
   S425QSB 'SUPP - P2006 Penguin Island (B)'
   S425QSC 'SUPP - P2006 Penguin Island (C)'
   S426QSA 'SUPP - P2006 The Grand Canyon (A)'
   S426QSB 'SUPP - P2006 The Grand Canyon (B)'
   S426QSC 'SUPP - P2006 The Grand Canyon (C)'
   S438QSA 'SUPP - P2006 Green Parks (A)'
   S438QSB 'SUPP - P2006 Green Parks (B)'
   S438QSC 'SUPP - P2006 Green Parks (C)'
   S456QSA 'SUPP - P2006 The Cheetah (A)'
   S456QSB 'SUPP - P2006 The Cheetah (B)'
   S456QSC 'SUPP - P2006 The Cheetah (C)'
   S465QSA 'SUPP - P2006 Different Climates (A)'
   S465QSB 'SUPP - P2006 Different Climates (B)'
   S476QSA 'SUPP - P2006 Heart Surgery (A)'
   S476QSB 'SUPP - P2006 Heart Surgery (B)'
   S476QSC 'SUPP - P2006 Heart Surgery (C)'
   S477QSA 'SUPP - P2006 Mary Montagu (A)'
   S477QSB 'SUPP - P2006 Mary Montagu (B)'
   S477QSC 'SUPP - P2006 Mary Montagu (C)'
   S485QSB 'SUPP - P2006 Acid Rain (B)'
   S485QSC 'SUPP - P2006 Acid Rain (C)'
   S498QSA 'SUPP - P2006 Experimental Digestion (A)'
   S498QSB 'SUPP - P2006 Experimental Digestion (B)'
   S519QSA 'SUPP - P2006 Airbags (A)'
   S519QSB 'SUPP - P2006 Airbags (B)'
   S519QSC 'SUPP - P2006 Airbags (C)'
   S527QSB 'SUPP - P2006 Extinction of the Dinosaurs (B)'
   S527QSC 'SUPP - P2006 Extinction of the Dinosaurs (C)'
   CLCUSE3A 'Effort A: real '
   CLCUSE3B 'Effort B: if counted '
   DEFFORT 'Effort B - Effort A'
   TESTLANG 'Language of Test (3-character)'
   VER_COGN  'Version of cognitive database and date of release '
.


val lab 
  /M033Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M034Q01T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M155Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M155Q02T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M155Q03T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M155Q04T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M192Q01T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M273Q01T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M302Q01T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M302Q02	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M302Q03	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M305Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M406Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M406Q02	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M408Q01T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M411Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M411Q02	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M420Q01T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M421Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M421Q02T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M421Q03	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M423Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M442Q02	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M446Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M446Q02	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M447Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M462Q01T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M464Q01T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M474Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M496Q01T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M496Q02	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M559Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M564Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M564Q02	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M571Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M598Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M603Q01T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M603Q02T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M710Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M800Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M803Q01T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M810Q01T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M810Q02T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M810Q03T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M828Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M828Q02	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M828Q03	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /M833Q01T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /R055Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /R055Q02	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /R055Q03	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /R055Q05	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /R067Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /R067Q04	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /R067Q05	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /R102Q04A	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /R102Q05	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /R102Q07	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /R104Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /R104Q02	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /R104Q05	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /R111Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /R111Q02B	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /R111Q06B	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /R219Q01E	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /R219Q01T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /R219Q02	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /R220Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /R220Q02B	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /R220Q04	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /R220Q05	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /R220Q06	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /R227Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /R227Q02T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /R227Q03	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /R227Q06	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S114Q03T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S114Q04T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S114Q05T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S131Q02T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S131Q04T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S213Q01T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S213Q02	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S256Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S268Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S268Q02T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S268Q06	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S269Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S269Q03T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S269Q04T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S304Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S304Q02	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S304Q03A	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S304Q03B	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S326Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S326Q02	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S326Q03	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S326Q04T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S408Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S408Q03	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S408Q04T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S408Q05	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S413Q04T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S413Q05	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S413Q06	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S415Q02	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S415Q07T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S415Q08T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S416Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S421Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S421Q03	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S425Q02	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S425Q03	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S425Q04	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S425Q05	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S426Q03	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S426Q05	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S426Q07T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S428Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S428Q03	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S428Q05	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S437Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S437Q03	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S437Q04	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S437Q06	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S438Q01T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S438Q02	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S438Q03T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S447Q02	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S447Q03	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S447Q04	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S447Q05	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S458Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S458Q02T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S465Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S465Q02	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S465Q04	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S466Q01T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S466Q05	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S466Q07T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S476Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S476Q02	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S476Q03	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S477Q02	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S477Q03	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S477Q04	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S478Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S478Q02T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S478Q03T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S485Q02	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S485Q03	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S485Q05	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S493Q01T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S493Q03T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S493Q05T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S495Q01T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S495Q02T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S495Q03	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S495Q04T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S498Q02T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S498Q03	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S498Q04	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S508Q02T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S508Q03	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S510Q01T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S510Q04T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S514Q02	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S514Q03	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S514Q04	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S519Q01	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S519Q02T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S519Q03	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S521Q02	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S521Q06	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S524Q06T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S524Q07	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S527Q01T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S527Q03T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S527Q04T	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 
  /S408QNA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S408QNB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S408QNC	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S413QNA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S413QNB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S413QNC	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S416QNA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S416QNB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S428QNA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S428QNB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S428QNC	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S437QNA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S437QNB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S437QNC	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S438QNA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S438QNB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S438QNC	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S456QNA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S456QNB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S456QNC	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S466QNA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S466QNB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S466QNC	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S476QNA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S476QNB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S476QNC	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S478QNA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S478QNB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S478QNC	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S485QNA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S485QNB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S485QNC	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S498QNA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S498QNB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S498QNC	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S508QNA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S508QNB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S508QNC	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S514QNA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S514QNB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S514QNC	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S519QNA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S519QNB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S519QNC	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S521QNA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S521QNB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S524QNA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S524QNB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S524QNC	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S527QNA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S527QNB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S527QNC	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S408QSA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S408QSB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S408QSC	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S416QSA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S416QSB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S416QSC	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S421QSA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S421QSC	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S425QSA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S425QSB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S425QSC	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S426QSA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S426QSB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S426QSC	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S438QSA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S438QSB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S438QSC	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S456QSA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S456QSB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S456QSC	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S465QSA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S465QSB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S476QSA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S476QSB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S476QSC	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S477QSA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S477QSB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S477QSC	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S485QSB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S485QSC	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S498QSA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S498QSB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S519QSA	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S519QSB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S519QSC	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S527QSB	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /S527QSC	0 'Score=0' 1 'Score=1' 2 'Score=2' 3 'Score=3' 7 'Not administered' 8 'Unreached' 9 'Missing'
  /CLCUSE3A  997  'N/A'                    
   998  'M/R '                             
   999  'Missing'                          
  /CLCUSE3B  997  'N/A'                    
   998  'M/R '                             
   999  'Missing'                          
  /DEFFORT  997  'N/A'                     
   998  'M/R '                             
   999  'Missing'                          
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

miss val M033Q01 to S527Q04T (7,8).
miss val S408QNA to S527QSC (7,8,9).
mis val CLCUSE3A CLCUSE3B DEFFORT (997,998,999).


SAVE OUTFILE='C:\****\INT_Cogn06_S_Dec07.sav'.

***  * unreached treated as incorrect response.
***  miss val M033Q01 to S527Q04T ().
***  recode M033Q01 to S527QSC (7=sysmis)(8,9=0).
***  
***  * unreached treated as not administered.
***  miss val M033Q01 to S527Q04T ().
***  recode M033Q01 to S527QSC (7,8=sysmis)(9=0).
***  exe.


