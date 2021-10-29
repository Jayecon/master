cd ~/dropbox/klips

use klips , clear

sort hhid wave

/* incn은 KLIPS User Guide의 방식을 이용한 연간가계총소득에서 물가수준, 가구원수를 고려하고 해당년도의 평균가구소득으로 나눠준 값*/
/* incn1은 incn의 0 과 누락값을 모두 누락으로 처리. incn2는 incn의 0 과 누락값을 모두 0으로 처리*/
list hhid wave incn incn1 incn2 if head & ( incn == 0 | missing(incn) ) in 1/1000 , sepby( hhid)

/* incn1m은 incn1이 누락된 경우 무시한채로 평균을 낸다. 반면 incn1t는 누락된 경우를 0으로 간주하고 평균을 낸다. 
	따라서 2개년 평균이면 incn1t는 incn1m의 절반값을 제시한다.*/
list hhid wave incn1 incn1m incn1t  incn2 incn2m incn2t if head & hhid == 171 , clean

