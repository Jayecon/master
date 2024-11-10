cd ~/dropbox/class_le
import excel "/Users/jay/Library/CloudStorage/Dropbox/LE_발표주제.xlsx", sheet("중간고사") firstrow
label data "노사관계의 이론과 실제 2024 2학기 중간고사"
rename (학과 학년 학번 이름 분반 응시) (dept grade id name class attend)
rename _all , low
label var dept   "학과"
label var grade  "학년"
label var id     "학번"
label var name   "이름"
label var class  "분반"
label var attend "응시"
label var c010   "객관식 1번 정답: 4"
label var c020   "객관식 2번 정답: 4"
label var c030   "객관식 3번 정답: 1"
label var c040   "객관식 4번 정답: 2"
label var c050   "객관식 5번 정답: 4"
label var c060   "객관식 6번 정답: 3"
label var c070   "객관식 7번 정답: 2"
label var c080   "객관식 8번 정답: 3"
label var c090   "객관식 9번 정답: 4"
label var c100   "객관식 10번 정답: 4"
label var c110   "객관식 11번 정답: 4"
label var c120   "객관식 12번 정답: 3"
label var c130   "객관식 13번 정답: 2"
label var f141   "빈칸 14-1번 정답: 분배적교섭"
label var f142   "빈칸 14-2번 정답: 통합적교섭"
label var f150   "빈칸 15번 정답: 노동위원회"
label var f160   "빈칸 16번 정답: 전태일"
label var f170   "빈칸 17번 정답: 민주노총"
label var f180   "빈칸 18번 정답: 집단교섭"
label var f190   "빈칸 19번 정답: 일반조합"
label var f200   "빈칸 20번 정답: 예비회담"
label var f210   "빈칸 21번 정답: 조정전치주의"
label var f220   "빈칸 22번 정답: 34시간"
label var f231   "빈칸 23-1번 정답: 직장폐쇄"
label var f232   "빈칸 23-2번 정답: 조업계속"
label var f241   "빈칸 24-1번 정답: 10일"
label var f242   "빈칸 24-2번 정답: 15일"
label var w251   "주관식 25-1번"
label var w252   "주관식 25-2번"
label var w26    "주관식 26번"
label var w27    "주관식 26번"

gen y010 = (c010 == 4) if attend
gen y020 = (c020 == 4) if attend
gen y030 = (c030 == 1) if attend
gen y040 = (c040 == 2) if attend
gen y050 = (c050 == 4) if attend
gen y060 = (c060 == 3) if attend
gen y070 = (c070 == 2) if attend
gen y080 = (c080 == 3) if attend
gen y090 = (c090 == 4) if attend
gen y100 = (c100 == 4) if attend
gen y110 = (c110 == 4) if attend
gen y120 = (c120 == 3) if attend
gen y130 = (c130 == 2) if attend
gen y141 = (strpos(f141 , "분배적")) if attend
gen y142 = (strpos(f142 , "통합적")) if attend
gen y150 = (strpos(f150 , "노동위원회")) if attend
gen y160 = (strpos(f160 , "전태일")) if attend
gen y170 = (strpos(f170 , "민주노총")) if attend
replace y170 = 1 if f180 == "전국민주노동조합총연맹"
gen y180 = (strpos(f180 , "집단교섭")) if attend
gen y190 = (strpos(f190 , "일반조합")) if attend
gen y200 = (strpos(f200 , "예비회담")) if attend
gen y210 = (strpos(f210 , "조정전치주의")) if attend
gen y220 = (f220 == 34) if attend
gen y231 = (strpos(f231 , "직장폐쇄")) if attend
gen y232 = (strpos(f232 , "조업계속")) if attend
gen y241 = (f241 == 10) if attend
gen y242 = (f242 == 15) if attend

egen temp = rowtotal(y???) , miss
gen score = temp*2 + w251 + w252 + w26 +w27
drop temp
label var score "총점"

replace score = score + 1 if f142 == "통합교섭"
replace score = score + 1 if f180 == "집단적교섭"
replace score = score + 1 if f180 == "집단"
replace score = score + 1 if f190 == "일반노동조합"
replace score = score + 1 if f190 == "일반노조"
replace score = score + 1 if f200 == "예비"
replace score = score + 1 if f200 == "예비교섭"
replace score = score + 1 if f200 == "예비회의"
replace score = score + 1 if f210 == "전치조정주의"
replace score = score + 1 if f210 == "조정전치제도"
replace score = score/2 if name == "이채연"

save LR_midterm , replace
