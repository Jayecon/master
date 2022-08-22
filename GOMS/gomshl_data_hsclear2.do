cd ~/dropbox/goms
use goms , clear
numlabel , add
set more off
    /*levelsof hsname if mod(strlen(hsname) , 3) , local(hslist)*/
    /*foreach i of local hslist {*/
        /*di as text "hsname : " as error "`i'" _col(50) as text "hsnamec : " as error "`temp'"*/
    /*}*/
   di as text "학교종류 : " as error "과학고"
       /*{{{*/
       /*tab hsnamec if strpos(hsnamec , "과학")      & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)*/                          
       /*tab hsnamec f007 if strpos(hsnamec , "경기")      & ( inlist(f009 , 3, 9 ) | missing(f009) ) & missing(f998) // 경기      수원시  */
       /*tab hsnamec f007 if strpos(hsnamec , "의정부")    & ( inlist(f009 , 3, 9 ) | missing(f009) ) & missing(f998) // 경기      의정부시*/
       /*tab hsnamec f007 if strpos(hsnamec , "경기북")    & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998) // 경기      의정부시*/
       /*tab hsnamec f007 if strpos(hsnamec , "인천")      & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)  // 인천      중구  */
       /*tab hsnamec f007 if strpos(hsnamec , "진산")      & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998) // 인천      부평구  */
       /*tab hsnamec f007 if strpos(hsnamec , "서울")      & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)  // 서울      종로구  */
       /*tab hsnamec f007 if strpos(hsnamec , "세종")      & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998) // 서울      구로구  */
       /*tab hsnamec f007 if strpos(hsnamec , "한성")      & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)  // 서울      서대문구	*/
       /*tab hsnamec f007 if strpos(hsnamec , "강원")      & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998) // 강원      원주시  */
       /*tab hsnamec f007 if strpos(hsnamec , "경남")      & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)  // 경남      진주시  */
       /*tab hsnamec f007 if strpos(hsnamec , "경북")      & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998) // 경북      포항시  */
       /*tab hsnamec f007 if strpos(hsnamec , "경산")      & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998) // 경북      경산시  */
       /*tab hsnamec f007 if strpos(hsnamec , "대구")      & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998) // 대구      수성구  */
       /*tab hsnamec f007 if strpos(hsnamec , "대구일")    & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998) // 대구      동구    */
       /*tab hsnamec f007 if strpos(hsnamec , "울산")      & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998) // 울산      울주군  */
       /*tab hsnamec f007 if strpos(hsnamec , "장영실")    & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998) // 부산      금정구  */
       /*tab hsnamec f007 if strpos(hsnamec , "부산")      & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998) // 부산      금정구   */
       /*tab hsnamec f007 if strpos(hsnamec , "부산일")    & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998) // 부산      사하구  */
       /*tab hsnamec f007 if strpos(hsnamec , "창원")      & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)  // 경남      창원시*/  
       /*tab hsnamec f007 if strpos(hsnamec , "동신")      & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998) // 대전      동구    */
       /*tab hsnamec f007 if strpos(hsnamec , "대전")      & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998) // 대전      유성구  */
       /*tab hsnamec f007 if strpos(hsnamec , "충남")      & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)  // 충남      공주시  */
       /*tab hsnamec f007 if strpos(hsnamec , "충북")      & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998) // 충북      청주시  */
       /*tab hsnamec f007 if strpos(hsnamec , "광주")      & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)  // 광주      동구    */
       /*tab hsnamec f007 if strpos(hsnamec , "전남")      & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998) // 전남      나주시  */
       /*tab hsnamec f007 if strpos(hsnamec , "전북")      & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)  // 전북      익산시  */
       /*tab hsnamec f007 if strpos(hsnamec , "제주")      & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)  // 제주      제주시  */
       /*}}}*/
   di as text "학교종류 : " as error "영재학교"
       tab hsnamec f007 if strpos(hsnamec , "영재")     & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)       
       tab hsnamec f007 if strpos(hsnamec , "KAIST")     & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)  // 부산      부산진구
       tab hsnamec f007 if strpos(hsnamec , "한국")      & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)  // 부산      부산진구
	   영재 f007 == 207
       /*{{{*/
       /*tab hsnamec f007 if strpos(hsnamec , "서울")      & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998) // 서울      종로구  */
       /*tab hsnamec f007 if strpos(hsnamec , "경기")      & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998) // 경기도    수원시  */
       /*tab hsnamec f007 if strpos(hsnamec , "대구")      & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998) // 대구      수성구  */
       /*tab hsnamec f007 if strpos(hsnamec , "대전")      & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998) // 대전      유성구  */
       /*tab hsnamec f007 if strpos(hsnamec , "광주")      & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)  // 광주      북구    */
       /*tab hsnamec f007 if strpos(hsnamec , "세종예술")  & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998) // 세종              */
       /*tab hsnamec f007 if strpos(hsnamec , "인천예술")  & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)  // 인천      연수구 */
       /*}}}*/
   di as text "학교종류 : " as error "외국어고"
       tab hsnamec f007 if strpos(hsnamec , "외국어")    & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)
       tab hsnamec f007 if strpos(hsnamec , "대일")    & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)    //           성북구
	   f007 == 117
       tab hsnamec f007 if strpos(hsnamec , "명덕")    & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)    //           강서구 
	   f007 == 104
       tab hsnamec f007 if strpos(hsnamec , "이화")    & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)    //           중구  
	   f007 == 124
       tab hsnamec f007 if strpos(hsnamec , "한영")    & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)    //           강동구  
	   f007 == 102
       tab hsnamec f007 if strpos(hsnamec , "부일")    & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)    //           사하구  
       f007 == 210
	   /*{{{*/
       /*tab hsnamec f007 if strpos(hsnamec , "대원")    & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)    //           광진구  */
       /*tab hsnamec f007 if strpos(hsnamec , "서울")    & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)   //           도봉구  */
       /*tab hsnamec f007 if strpos(hsnamec , "부산")    & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)   //           연제구  */
       /*tab hsnamec f007 if strpos(hsnamec , "대구")    & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)   //           달서구  */
       /*tab hsnamec f007 if strpos(hsnamec , "미추홀")  & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)   //           남동구  */
       /*tab hsnamec f007 if strpos(hsnamec , "인천")    & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)    //           부평구  */
       /*tab hsnamec f007 if strpos(hsnamec , "대전")    & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)   //           서구    */
       /*tab hsnamec f007 if strpos(hsnamec , "울산")    & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)   //           북구    */
       /*tab hsnamec f007 if strpos(hsnamec , "경기")    & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)   //           의왕시  */
       /*}}}*/
   di as text "학교종류 : " as error "국제고"
       tab hsnamec f007 if strpos(hsnamec , "국제")    & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)
       tab hsnamec f007 if strpos(hsnamec , "고양") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)       // 경기      고양시 
	   고양외국어고등학교 802
       /*{{{*/
       /*tab hsnamec f007 if strpos(hsnamec , "인천") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)       // 인천      중구*/
       /*tab hsnamec f007 if strpos(hsnamec , "동탄") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 경기      화성시*/
       /*tab hsnamec f007 if strpos(hsnamec , "부산") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 부산      부산진구*/
       /*tab hsnamec f007 if strpos(hsnamec , "서울") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 서울      종로구*/
       /*tab hsnamec f007 if strpos(hsnamec , "세종") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 세종      아름동*/
       /*tab hsnamec f007 if strpos(hsnamec , "청심") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 경기      가평군*/
       /*tab hsnamec f007 if strpos(hsnamec , "대구") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 대구      북구*/
       /*}}}*/
   di as text "학교종류 : " as error "전국 자사고"
       tab hsnamec f007 if strpos(hsnamec , "청운") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)       // 울산      동구
	   울산현대청운고등학교 702
       tab hsnamec f007 if strpos(hsnamec , "외대") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)       // 경기
	   한국외 823
       tab hsnamec f007 if strpos(hsnamec , "북일") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)       // 충남
	   천안북일고등학교 1113
       /*{{{*/
       /*tab hsnamec f007 if strpos(hsnamec , "하나") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 서울      은평구  */
       /*tab hsnamec f007 if strpos(hsnamec , "하늘") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 인천      영종도  */
       /*tab hsnamec f007 if strpos(hsnamec , "민족사관") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)  // 강원              */
       /*tab hsnamec f007 if strpos(hsnamec , "민사") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 강원              */
       /*tab hsnamec f007 if strpos(hsnamec , "김천") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 경북              */
       /*tab hsnamec f007 if strpos(hsnamec , "제철") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 경북              */
       /*tab hsnamec f007 if strpos(hsnamec , "포철") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 경북              */
       /*tab hsnamec f007 if strpos(hsnamec , "상산") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 전북              */
       /*}}}*/
   di as text "학교종류 : " as error "광역 자사고"
       tab hsnamec f007 if strpos(hsnamec , "동성") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)       // 서울      종로구
	   123
       tab hsnamec f007 if strpos(hsnamec , "신일") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)       // 서울      강북구
	   103
       tab hsnamec f007 if strpos(hsnamec , "중앙") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)       // 서울      종로구  
	   123
       tab hsnamec f007 if strpos(hsnamec , "한가람") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)     // 서울      양천구
	   119
       tab hsnamec f007 if strpos(hsnamec , "동산") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)       // 경기  
	   815
       tab hsnamec f007 if strpos(hsnamec , "대성") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)       // 대전      
	   405
       tab hsnamec f007 if strpos(hsnamec , "선덕") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)       // 서울      도봉구
	   110
       tab hsnamec f007 if strpos(hsnamec , "장훈") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)       // 서울      영등포구 
       120
	   tab hsnamec f007 if strpos(hsnamec , "현대") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)       // 서울      강남구   
       101
       tab hsnamec f007 if strpos(hsnamec , "경신") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)       // 대구      수성구   
       307
	   tab hsnamec f007 if strpos(hsnamec , "경일") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)       // 대구      남구
	   301
       tab hsnamec f007 if strpos(hsnamec , "중앙") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)       // 서울 종로구
	   123
       /*{{{*/
       /*tab hsnamec f007 if strpos(hsnamec , "양정") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)       // 서울      양천구  */
       /*tab hsnamec f007 if strpos(hsnamec , "대광") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)       // 서울      동대문구 */
	   /*tab hsnamec f007 if strpos(hsnamec , "대건") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)       // 대구      달서구  */
       /*tab hsnamec f007 if strpos(hsnamec , "보문") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)       // 광주      광산구  */
       /*tab hsnamec f007 if strpos(hsnamec , "삼성") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)       //                     */
       /*tab hsnamec f007 if strpos(hsnamec , "경희") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 서울      동대문구*/
       /*tab hsnamec f007 if strpos(hsnamec , "배재") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 서울      강동구  */
       /*tab hsnamec f007 if strpos(hsnamec , "세화") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 서울      서초구  */
       /*tab hsnamec f007 if strpos(hsnamec , "숭문") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 서울      마포구  */
       /*tab hsnamec f007 if strpos(hsnamec , "우신") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 서울      구로구  */
       /*tab hsnamec f007 if strpos(hsnamec , "금란") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 서울      서대문구*/
       /*tab hsnamec f007 if strpos(hsnamec , "중동") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 서울      강남구  */
       /*tab hsnamec f007 if strpos(hsnamec , "한양대") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)    // 서울      성동구  */
       /*tab hsnamec f007 if strpos(hsnamec , "한대") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 서울      성동구  */
       /*tab hsnamec f007 if strpos(hsnamec , "계성") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 대구      중구    */
       /*tab hsnamec f007 if strpos(hsnamec , "동래") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 부산      동래구  */
       /*tab hsnamec f007 if strpos(hsnamec , "송원") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 광주      남구    */
       /*tab hsnamec f007 if strpos(hsnamec , "경문") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 서울      동작구  */
       /*tab hsnamec f007 if strpos(hsnamec , "동양") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 서울      강서구  */
       /*tab hsnamec f007 if strpos(hsnamec , "미림") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 서울      관악구  */
       /*tab hsnamec f007 if strpos(hsnamec , "보인") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 서울      송파구  */
       /*tab hsnamec f007 if strpos(hsnamec , "세화") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 서울      서초구  */
       /*tab hsnamec f007 if strpos(hsnamec , "용문") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 서울      성북구  */
       /*tab hsnamec f007 if strpos(hsnamec , "휘문") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 서울      강남구  */
       /*tab hsnamec f007 if strpos(hsnamec , "서대전") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)    // 대전      서구    */
       /*tab hsnamec f007 if strpos(hsnamec , "숭덕") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 광주      광산구  */
       /*tab hsnamec f007 if strpos(hsnamec , "성신") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 울산      중구     */
       /*tab hsnamec f007 if strpos(hsnamec , "남성") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 전북      익산    */
       /*tab hsnamec f007 if strpos(hsnamec , "대신") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)      // 대전      서구      */
       /*tab hsnamec f007 if strpos(hsnamec , "포스코") & ( inlist(f009 , 3 , 9) | missing(f009) ) & missing(f998)    // 인천                */
       /*}}}*/
   di as text "학교종류 : " as error "강남8학군"
       tab hsnamec f007 if strpos(hsnamec , "경기")   & inlist(f007 , 101 , 115 ) & missing(f998)
	   서울경기여자고등학교
       tab hsnamec f007 if strpos(hsnamec , "서울")   & inlist(f007 , 101 , 115 ) & missing(f998)
       tab hsnamec f007 if strpos(hsnamec , "경기")   & inlist(f007 , 101 , 115 ) & missing(f998)
       tab hsnamec f007 if strpos(hsnamec , "숙명")   & inlist(f007 , 101 , 115 ) & missing(f998) 
	   숙명고등학교
	   숙명여고등학교
       tab hsnamec f007 if strpos(hsnamec , "풍문")   & inlist(f007 , 101 , 115 ) & missing(f998)
	   풍문여자고등학교
       tab hsnamec f007 if strpos(hsnamec , "동덕")   & inlist(f007 , 101 , 115 ) & missing(f998)
	   동덕고등학교
       tab hsnamec f007 if strpos(hsnamec , "세종")   & inlist(f007 , 101 , 115 ) & missing(f998)
	   서울세정고등학교
	   세종고등학교
       tab hsnamec f007 if strpos(hsnamec , "서초")   & inlist(f007 , 101 , 115 ) & missing(f998)
       tab hsnamec f007 if strpos(hsnamec , "현대")   & inlist(f007 , 101 , 115 ) & missing(f998) 
	   서울현대고등학교
       tab hsnamec f007 if strpos(hsnamec , "청담")   & inlist(f007 , 101 , 115 ) & missing(f998)
       서울청담고등학교
	   tab hsnamec f007 if strpos(hsnamec , "언남")   & inlist(f007 , 101 , 115 ) & missing(f998)
	   언남자고등학교
       tab hsnamec f007 if strpos(hsnamec , "은광")   & inlist(f007 , 101 , 115 ) & missing(f998)
	   은광고등학교
       tab hsnamec f007 if strpos(hsnamec , "영동")   & inlist(f007 , 101 , 115 ) & missing(f998) 
       서울영동고등학교
	   tab hsnamec f007 if strpos(hsnamec , "중산")   & inlist(f007 , 101 , 115 ) & missing(f998)
	   서울중산고등학교
       tab hsnamec f007 if strpos(hsnamec , "서문")   & inlist(f007 , 101 , 115 ) & missing(f998)
	   서문고등학교
       /*{{{*/
       /*tab hsnamec f007 if strpos(hsnamec , "휘문")   & inlist(f007 , 101 , 115 ) & missing(f998)*/
       /*tab hsnamec f007 if strpos(hsnamec , "중동")   & inlist(f007 , 101 , 115 ) & missing(f998)*/
       /*tab hsnamec f007 if strpos(hsnamec , "단국대") & inlist(f007 , 101 , 115 ) & missing(f998)*/
       /*tab hsnamec f007 if strpos(hsnamec , "단대")   & inlist(f007 , 101 , 115 ) & missing(f998)*/
       /*tab hsnamec f007 if strpos(hsnamec , "반포")   & inlist(f007 , 101 , 115 ) & missing(f998)*/
       /*tab hsnamec f007 if strpos(hsnamec , "세화")   & inlist(f007 , 101 , 115 ) & missing(f998)*/
       /*tab hsnamec f007 if strpos(hsnamec , "양재")   & inlist(f007 , 101 , 115 ) & missing(f998)*/
       /*tab hsnamec f007 if strpos(hsnamec , "상문")   & inlist(f007 , 101 , 115 ) & missing(f998)*/
       /*tab hsnamec f007 if strpos(hsnamec , "압구정") & inlist(f007 , 101 , 115 ) & missing(f998)*/
       /*tab hsnamec f007 if strpos(hsnamec , "구정")   & inlist(f007 , 101 , 115 ) & missing(f998)*/
       /*tab hsnamec f007 if strpos(hsnamec , "진선")   & inlist(f007 , 101 , 115 ) & missing(f998)*/
       /*tab hsnamec f007 if strpos(hsnamec , "개포")   & inlist(f007 , 101 , 115 ) & missing(f998)*/
       /*tab hsnamec f007 if strpos(hsnamec , "중앙대") & inlist(f007 , 101 , 115 ) & missing(f998)*/
       /*tab hsnamec f007 if strpos(hsnamec , "중대")   & inlist(f007 , 101 , 115 ) & missing(f998)*/
       /*}}}*/
