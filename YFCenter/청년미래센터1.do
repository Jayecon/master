/* 청년미래센터 성과평가 */

    /** 4월*/
        cd "D:\_KIHASA\2025\02.[수탁] 청년미래센터 운영지침 개선 및 성과 모니터링 연구\7.성과평가\1.온라인조사\2.데이터"
        import excel "20250502_2025년 가족돌봄 고립은둔 청년 참여자 설문조사 응답값(4월)", sheet("data") firstrow clear

        /*변수라벨{{{*/
            label var pid    "응답자ID"
            label var rid    "답변 ID"
            label var stdate "시작일시"
            label var fndate "종료일시"
            label var Q      "조사동의"
            label var Q1     "Q1 주민등록상 출생연도"
            label var Q2     "Q2 성별"
            label var Q3     "Q3 센터사업참여시기"
            label var A1     "A1 가족돌봄여부"
            label var A2a    "A2돌봄시간_a 주중몇일"
            label var A2b    "A2돌봄시간_b 주중하루몇시간"
            label var A2c    "A2돌봄시간_c 주말몇일"
            label var A2d    "A2돌봄시간_d 주말하루몇시간"
            label var CCI1   "A3_(1) 나는 돌봄 때문에 내 개인적인 시간을 충분히 가지지 못한다"
            label var CCI2   "A3_(2) 돌봄 때문에 가족 관계는 긴장 상태에 있다"
            label var CCI3   "A3_(3) 돌봄 때문에 집에서의 나의 일상생활은 방해받는다"
            label var CCI4   "A3_(4) 돌봄 때문에 내 친구나 가족의 친구들이 집으로 방문하는 것이 불편하다"
            label var CCI5   "A3_(5) 돌봄은 내 가족과 나의 건강상태에 부정적인 영향을 끼친다"
            label var CCI6   "A3_(6) 돌봄 때문에 내가 원하는 일을 하기가 어렵다"
            label var CCI7   "A3_(7) 돌봄 때문에 나는 피곤하다"
            label var CCI8   "A3_(8) 나는 돌봄 때문에 걱정되고 불안하고 짜증스럽다"
            label var CCI9   "A3_(9) 돌봄 대상이 원하고 있고 중요하다고 생각하는 것을 충족시켜 드리기 위해 노력하는 것이 가치 없는 일이라고 생각한다"
            label var CCI10  "A3_(10) 돌봄 대상의 건강을 유지하는 데 도움이 되도록 노력하는 것이 가치 없는 일이라고 생각한다"
            label var CCI11  "A3_(11) 돌봄 대상이 일상적인 생활을 하는 데 도움이 되도록 노력하는 것이 가치 없는 일이라고 생각한다"
            label var CCI12  "A3_(12) 돌봄 대상이 사교활동을 할 수 있기 위해 도움이 되도록 노력하는 것이 가치 없는 일이라고 생각한다"
            label var CCI13  "A3_(13) 돌봄에 더 많은 사람의 도움이 필요하다"
            label var CCI14  "A3_(14) 돌봄 대상이 나를 조종하고 있다고 생각한다"
            label var CCI15  "A3_(15) 돌봄 대상으로 인해 내 가족과 나와의 관계는 악화되어 가고 있다"
            label var CCI16  "A3_(16) 돌봄 대상은 나에게 필요하지 않은 일들까지 하도록 요구하고 있다"
            label var CCI17  "A3_(17) 돌봄 대상으로 인해 나는 다른 용도로 저축한 돈을 지출해야 한다"
            label var CCI18  "A3_(18) 나와 내 가족은 돌봄에 들어가는 비용 때문에 생계비를 줄여야 한다"
            label var CCI19  "A3_(19) 나와 내 가족은 돌봄에 들어가는 비용 때문에 생활비에 여유가 없다"
            label var CCI20  "A3_(20) 돌봄에 너무나 많은 비용이 든다"
            label var A4     "A4 자기돌봄비상태"
            label var A5a    "A5_자기돌봄비 주된 용도_a 자기계발비"
            label var A5b    "A5_자기돌봄비 주된 용도_b 가전제품"
            label var A5c    "A5_자기돌봄비 주된 용도_c 식료품비"
            label var A5d    "A5_자기돌봄비 주된 용도_d 피복신발비"
            label var A5e    "A5_자기돌봄비 주된 용도_e 나의의료비"
            label var A5f    "A5_자기돌봄비 주된 용도_f 교통비"
            label var A5g    "A5_자기돌봄비 주된 용도_g 기타1"
            label var A5h    "A5_자기돌봄비 주된 용도_h 기타2"
            label var A5i    "A5_자기돌봄비 주된 용도_ho 기타답변"
            label var A6a    "A6_아픈 가족 관계_a 부모님"
            label var A6b    "A6_아픈 가족 관계_b 조부모"
            label var A6c    "A6_아픈 가족 관계_c 형제자매"
            label var A6d    "A6_아픈 가족 관계_d 배우자"
            label var A6e    "A6_아픈 가족 관계_e 친척"
            label var A6f    "A6_아픈 가족 관계_f 지인친구"
            label var A6g    "A6_아픈 가족 관계_h 기타1"
            label var A6h    "A6_아픈 가족 관계_h 기타2"
            label var A6ho   "A6_아픈 가족 관계_ho 기타답변" 
            label var A7     "A7 돌봄기간"
            label var B1     "B1 고립은둔여부"
            label var LSNS1  "B2LSNS_(1) 최소한 한 달에 한 번 이상 만나거나 연락하는 친인척은 몇 명입니까?"
            label var LSNS2  "B2LSNS_(2) 귀하가 개인적인 일을 편하게 얘기할 수 있는 친인척은 몇 명입니까?"
            label var LSNS3  "B2LSNS_(3) 귀하가 도움을 요청할 정도로 가깝게 느끼는 친인척은 몇 명입니까?"
            label var LSNS4  "B2LSNS_(4) 귀하의 친인척 중 한 분이 중요한 결정을 내려야 할 때, 그분은 귀하와 얼마나 자주 의논하십니까?"
            label var LSNS5  "B2LSNS_(5) 최소한 한 달에 한 번 이상 만나거나 연락하는 친구는 몇 명입니까?"
            label var LSNS6  "B2LSNS_(6) 귀하가 개인적인 일을 편하게 얘기할 수 있는 친구는 몇 명입니까?"
            label var LSNS7  "B2LSNS_(7) 귀하가 도움을 요청할 정도로 가깝게 느끼는 친구는 몇 명입니까?"
            label var LSNS8  "B2LSNS_(8) 귀하의 친구 중 한 분이 중요한 결정을 내려야 할 때, 그분은 귀하와 얼마나 자주 의논하십니까?"
            label var HQ1    "B3HQ25_(1) 나는 다른 사람과 거리를 둔다"
            label var HQ2    "B3HQ25_(2) 하루 종일 거의 집에서 보낸다"
            label var HQ3    "B3HQ25_(3) 중요한 일에 대해 의논할 사람이 정말로 아무도 없다"
            label var HQ4    "B3HQ25_(4) 모르는 사람과 만나는 것을 아주 좋아한다"
            label var HQ5    "B3HQ25_(5) 나의 방에 틀어박혀 있다"
            label var HQ6    "B3HQ25_(6) 사람이 귀찮다"
            label var HQ7    "B3HQ25_(7) 나의 생활에 있어서 나를 이해해 주려고 하는 사람들이 있다"
            label var HQ8    "B3HQ25_(8) 누군가와 함께 있는 것이 불편하게 느껴진다"
            label var HQ9    "B3HQ25_(9) 하루 종일 거의 혼자서 지낸다"
            label var HQ10   "B3HQ25_(10) 몇몇 사람에게 개인적인 생각을 털어놓을 수 있다"
            label var HQ11   "B3HQ25_(11) 사람들에게 보여지는 것이 싫다"
            label var HQ12   "B3HQ25_(12) 가족 외 사람과 직접 만나는 일이 거의 없다"
            label var HQ13   "B3HQ25_(13) 집단에 들어가는 것이 서투르다"
            label var HQ14   "B3HQ25_(14) 중요한 문제에 대해서 의논할 사람이 없다"
            label var HQ15   "B3HQ25_(15) 사람들과의 교류는 즐겁다"
            label var HQ16   "B3HQ25_(16) 나는 사회의 규칙과 가치관에 맞춰서 살 수 없다"
            label var HQ17   "B3HQ25_(17) 자신의 인생에 있어서 소중한 사람이 없다"
            label var HQ18   "B3HQ25_(18) 다른 사람과 이야기하는 것을 피한다"
            label var HQ19   "B3HQ25_(19) 나는 누군가와 직접 또는 글로도 연락을 하는 일이 거의 없다"
            label var HQ20   "B3HQ25_(20) 누군가와 함께 있는 것보다 혼자 있는 것이 좋다"
            label var HQ21   "B3HQ25_(21) 자신이 안고 있는 문제에 대해서 안심하고 상담할 수 있는 사람이 있다"
            label var HQ22   "B3HQ25_(22) 혼자서 시간을 보내는 일은 거의 없다"
            label var HQ23   "B3HQ25_(23) 나는 사회적인 교류를 즐기지 못한다"
            label var HQ24   "B3HQ25_(24) 나는 다른 사람과 교류하는 일이 거의 없다"
            label var HQ25   "B3HQ25_(25) 혼자 있는 것보다 누군가와 함께 있는 편이 훨씬 좋다"
            label var B4a    "B4_a  공동생활여부"
            label var B4b    "B4_b  일경험여부"
            label var B5     "B5_고립은둔기간"
            label var B6a    "B6a_배우자여부"
            label var B6a1   "B6a 배우자와의관계"
            label var B6b    "B6b 아버지여부"
            label var B6b1   "B6b 아버지와의관계"
            label var B6c    "B6c 어머니여부"
            label var B6c1   "B6c 어머니와의관계"
            label var B6d    "B6d 형제자매여부"
            label var B6d1   "B6d 형제자매와의관계"
            label var B6e    "B7e 다른가족여부"
            label var B6e1   "B7e 다른가족과의관계"
            label var C1     "C1 삶의만족"
            label var C2a    "C2LCS_(1) 나는 집에 있을 때, 발생한 대부분의 상황을 통제할 수 있다고 느낀다"
            label var C2b    "C2LCS_(2) 나는 내 인생에서 발생한 일들이 내가 통제할 수 없는 요인들에 의해 결정된다고 느낀다"
            label var C2c    "C2LCS_(3) 향후 5~10년 동안 나는 부정적인 경험보다는 긍정적인 경험을 할 것이다"
            label var C2d    "C2LCS_(4) 나는 종종 부당하게 대우받았다고 느낀다"
            label var C2e    "C2LCS_(5) 지난 10년간, 내 인생은 다음에 무엇이 일어날지 모르는 변화로 가득했다"
            label var C2f    "C2LCS_(6) 나는 오래전에 내 삶을 더 개선하려고 하거나 변화시키려는 노력을 포기했다"
            label var D1     "D1_주민등록상거주지_시도"
            label var D1a    "D1a_실제거주지_시도"
            label var D2     "D2_최종학력"
            label var D3     "D3_혼인상태"
            label var D4     "D4_지난주수입목적1시간이상일"
            label var D5     "D5_지난주종사상지위"
            label var D5     "D5_거주주택유형"
            label var D5o    "D5o_거구주택유형_기타답변"
            label var D5a    "D5a_4주택점유형태(명의기준)"
            label var D6     "D6_1인가구"
            label var D6a    "D6a_1동거가구원_a 부모님"
            label var D6b    "D6a_1동거가구원_b 조부모"
            label var D6c    "D6a_1동거가구원_c 형제자매"
            label var D6d    "D6a_1동거가구원_d 배우자"
            label var D6e    "D6a_1동거가구원_e 친척"
            label var D6f    "D6a_1동거가구원_f 지인이나친구"
            label var D6g    "D6a_1동거가구원_g 기타"
            label var D7a    "D7_가구경제수준_상"
            label var D7b    "D7_가구경제수준_중"
            label var D7c    "D7_가구경제수준_하"
            label var D8a    "D8_본인경제수준_상"
            label var D8b    "D8_본인경제수준_중"
            label var D8c    "D8_본인경제수준_하"
            label var D9     "D9_답례품정보동의"
            label var D9a    "D9a_이름"
            label var D9b    "D9b_소속센터"
            label var D9c    "D9c_휴대폰번호"
            label var sample " 적격"
        /*}}}*/

        tab Q
        tab A1
        tab B1
        tab A1 B1
        tab A1 B1, nof cell
        tab D9b

        tostring Q1, replace

        gen sido=""
            replace sido="인천" if D9b=="인천 청년미래센터"
            replace sido="울산" if D9b=="울산 청년미래센터"
            replace sido="충북" if D9b=="충북 청년미래센터"
            replace sido="전북" if D9b=="전북 청년미래센터"
        gen id=D9a+Q1+sido
        sort id

        duplicates r id
        duplicates r D9c 

        gen stm=substr(stdate,6,2)
        gen std=substr(stdate,9,2)
        gen stmd=stm+std

        order stm std stmd, before(stdate)
        destring stm std stmd, replace

        bysort D9a: gen nid=_n  // 이름+생년
        order nid, after(rid)

        keep if nid==1 & D9=="동의한다."  // 유효표본만 남김 n=514

        drop pid rid nid

        save "청년미래센터4.dta", replace


    /*7월*/
        cd "D:\_KIHASA\2025\02.[수탁] 청년미래센터 운영지침 개선 및 성과 모니터링 연구\7.성과평가\1.온라인조사\2.데이터"
        import excel "20250721_청년응답 결과(7월)_확장형", sheet("data") firstrow clear

        /*변수라벨{{{*/
            label var rid    "응답자ID"
            label var pid    "답변 ID"
            label var stdate "시작일시"
            label var fndate "종료일시"
            label var Q      "조사동의"
            label var Q1     "Q1 주민등록상 출생연도"
            label var Q2     "Q2 성별"
            label var Q3     "Q3 센터사업참여시기"
            label var A1     "A1 가족돌봄여부"
            label var A2a    "A2 돌봄시간_a주중몇일"
            label var A2b    "A2 돌봄시간_b주중하루몇시간"
            label var A2c    "A2 돌봄시간_c주말몇일"
            label var A2d    "A2 돌봄시간_d주말하루몇시간"
            label var CCI1   "A3_(1) 나는 돌봄 때문에 내 개인적인 시간을 충분히 가지지 못한다"
            label var CCI2   "A3_(2) 돌봄 때문에 가족 관계는 긴장 상태에 있다"
            label var CCI3   "A3_(3) 돌봄 때문에 집에서의 나의 일상생활은 방해받는다"
            label var CCI4   "A3_(4) 돌봄 때문에 내 친구나 가족의 친구들이 집으로 방문하는 것이 불편하다"
            label var CCI5   "A3_(5) 돌봄은 내 가족과 나의 건강상태에 부정적인 영향을 끼친다"
            label var CCI6   "A3_(6) 돌봄 때문에 내가 원하는 일을 하기가 어렵다"
            label var CCI7   "A3_(7) 돌봄 때문에 나는 피곤하다"
            label var CCI8   "A3_(8) 나는 돌봄 때문에 걱정되고 불안하고 짜증스럽다"
            label var CCI9   "A3_(9) 돌봄 대상이 원하고 있고 중요하다고 생각하는 것을 충족시켜 드리기 위해 노력하는 것이 가치 없는 일이라고 생각한다"
            label var CCI10  "A3_(10) 돌봄 대상의 건강을 유지하는 데 도움이 되도록 노력하는 것이 가치 없는 일이라고 생각한다"
            label var CCI11  "A3_(11) 돌봄 대상이 일상적인 생활을 하는 데 도움이 되도록 노력하는 것이 가치 없는 일이라고 생각한다"
            label var CCI12  "A3_(12) 돌봄 대상이 사교활동을 할 수 있기 위해 도움이 되도록 노력하는 것이 가치 없는 일이라고 생각한다"
            label var CCI13  "A3_(13) 돌봄에 더 많은 사람의 도움이 필요하다"
            label var CCI14  "A3_(14) 돌봄 대상이 나를 조종하고 있다고 생각한다"
            label var CCI15  "A3_(15) 돌봄 대상으로 인해 내 가족과 나와의 관계는 악화되어 가고 있다"
            label var CCI16  "A3_(16) 돌봄 대상은 나에게 필요하지 않은 일들까지 하도록 요구하고 있다"
            label var CCI17  "A3_(17) 돌봄 대상으로 인해 나는 다른 용도로 저축한 돈을 지출해야 한다"
            label var CCI18  "A3_(18) 나와 내 가족은 돌봄에 들어가는 비용 때문에 생계비를 줄여야 한다"
            label var CCI19  "A3_(19) 나와 내 가족은 돌봄에 들어가는 비용 때문에 생활비에 여유가 없다"
            label var CCI20  "A3_(20) 돌봄에 너무나 많은 비용이 든다"
            label var P1a1   "A4_(1) 장학금 등 교육지원 프로그램 참여"
            label var P1a2   "A4_(1) 장학금 등 교육지원 프로그램 만족도"
            label var P1b1   "A4_(2) 심리상담 등 마음건강 프로그램 참여"
            label var P1b2   "A4_(2) 심리상담 등 마음건강 프로그램 만족도"
            label var P1c1   "A4_(3) 원데이클래스 등 힐링프로그램 참여"
            label var P1c2   "A4_(3) 원데이클래스 등 힐링프로그램 만족도"
            label var P1d1   "A4_(4) 캠프 등 외부활동 프로그램 참여"
            label var P1d2   "A4_(4) 캠프 등 외부활동 프로그램 만족도"
            label var P1e1   "A4_(5) 직업상담 및 일경험 등 취업지원 프로그램 참여"
            label var P1e2   "A4_(5) 직업상담 및 일경험 등 취업지원 프로그램 만족도"
            label var P1f1   "A4_(6) 금융교육 등 독립생활역량 강화 프로그램 참여"
            label var P1f2   "A4_(6) 금융교육 등 독립생활역량 강화 프로그램 만족도"
            label var P1g1   "A4_(7) 법률자문 참여"
            label var P1g2   "A4_(7) 법률자문 만족도"
            label var P1h1   "A4_(8) 자조모임 참여"
            label var P1h2   "A4_(8) 자조모임 만족도"
            label var P1i1   "A4_(9) 아픈 가족을 위한 돌봄서비스 참여"
            label var P1i2   "A4_(9) 아픈 가족을 위한 돌봄서비스 만족도"
            label var A4     "A4 자기돌봄비상태"
            label var A5a    "A5_자기돌봄비 주된 용도_a 자기계발비"
            label var A5b    "A5_자기돌봄비 주된 용도_b 가전제품"
            label var A5c    "A5_자기돌봄비 주된 용도_c 식료품비"
            label var A5d    "A5_자기돌봄비 주된 용도_d 피복신발비"
            label var A5e    "A5_자기돌봄비 주된 용도_e 나의의료비"
            label var A5f    "A5_자기돌봄비 주된 용도_f 교통비"
            label var A5g    "A5_자기돌봄비 주된 용도_g 기타1"
            label var A5i    "A5_자기돌봄비 주된 용도_ho기타답변"
            label var A6a    "A6_아픈 가족 관계_a 부모님"
            label var A6b    "A6_아픈 가족 관계_b 조부모"
            label var A6c    "A6_아픈 가족 관계_c 형제자매"
            label var A6d    "A6_아픈 가족 관계_d 배우자"
            label var A6e    "A6_아픈 가족 관계_e 친척"
            label var A6f    "A6_아픈 가족 관계_f 지인친구"
            label var A6g    "A6_아픈 가족 관계_h 기타1"
            label var A6h    "A6_아픈 가족 관계_h 기타2"
            label var A6ho   "A6_아픈 가족 관계_ho기타답변"
            label var A7     "A7 돌봄기간"
            label var A8     "A8 아픈가족돌봄서비스"
            label var A8a    "A8 돌봄서비스 도움 정도"
            label var A8b    "A8 돌봄서비스 미이용 이유"
            label var A8bo   "A8 돌봄서비스 미이용 기타 이유"
            label var B1     "B1 고립은둔여부" 
            label var LSNS1  "B2LSNS_(1) 최소한 한 달에 한 번 이상 만나거나 연락하는 친인척은 몇 명입니까?"
            label var LSNS2  "B2LSNS_(2) 귀하가 개인적인 일을 편하게 얘기할 수 있는 친인척은 몇 명입니까?"
            label var LSNS3  "B2LSNS_(3) 귀하가 도움을 요청할 정도로 가깝게 느끼는 친인척은 몇 명입니까?"
            label var LSNS4  "B2LSNS_(4) 귀하의 친인척 중 한 분이 중요한 결정을 내려야 할 때, 그분은 귀하와 얼마나 자주 의논하십니까?"
            label var LSNS5  "B2LSNS_(5) 최소한 한 달에 한 번 이상 만나거나 연락하는 친구는 몇 명입니까?"
            label var LSNS6  "B2LSNS_(6) 귀하가 개인적인 일을 편하게 얘기할 수 있는 친구는 몇 명입니까?"
            label var LSNS7  "B2LSNS_(7) 귀하가 도움을 요청할 정도로 가깝게 느끼는 친구는 몇 명입니까?"
            label var LSNS8  "B2LSNS_(8) 귀하의 친구 중 한 분이 중요한 결정을 내려야 할 때, 그분은 귀하와 얼마나 자주 의논하십니까?"
            label var HQ1    "B3HQ25_(1) 나는 다른 사람과 거리를 둔다"
            label var HQ2    "B3HQ25_(2) 하루 종일 거의 집에서 보낸다"
            label var HQ3    "B3HQ25_(3) 중요한 일에 대해 의논할 사람이 정말로 아무도 없다"
            label var HQ4    "B3HQ25_(4) 모르는 사람과 만나는 것을 아주 좋아한다"
            label var HQ5    "B3HQ25_(5) 나의 방에 틀어박혀 있다"
            label var HQ6    "B3HQ25_(6) 사람이 귀찮다"
            label var HQ7    "B3HQ25_(7) 나의 생활에 있어서 나를 이해해 주려고 하는 사람들이 있다"
            label var HQ8    "B3HQ25_(8) 누군가와 함께 있는 것이 불편하게 느껴진다"
            label var HQ9    "B3HQ25_(9) 하루 종일 거의 혼자서 지낸다"
            label var HQ10   "B3HQ25_(10) 몇몇 사람에게 개인적인 생각을 털어놓을 수 있다"
            label var HQ11   "B3HQ25_(11) 사람들에게 보여지는 것이 싫다"
            label var HQ12   "B3HQ25_(12) 가족 외 사람과 직접 만나는 일이 거의 없다"
            label var HQ13   "B3HQ25_(13) 집단에 들어가는 것이 서투르다"
            label var HQ14   "B3HQ25_(14) 중요한 문제에 대해서 의논할 사람이 없다"
            label var HQ15   "B3HQ25_(15) 사람들과의 교류는 즐겁다"
            label var HQ16   "B3HQ25_(16) 나는 사회의 규칙과 가치관에 맞춰서 살 수 없다"
            label var HQ17   "B3HQ25_(17) 자신의 인생에 있어서 소중한 사람이 없다"
            label var HQ18   "B3HQ25_(18) 다른 사람과 이야기하는 것을 피한다"
            label var HQ19   "B3HQ25_(19) 나는 누군가와 직접 또는 글로도 연락을 하는 일이 거의 없다"
            label var HQ20   "B3HQ25_(20) 누군가와 함께 있는 것보다 혼자 있는 것이 좋다"
            label var HQ21   "B3HQ25_(21) 자신이 안고 있는 문제에 대해서 안심하고 상담할 수 있는 사람이 있다"
            label var HQ22   "B3HQ25_(22) 혼자서 시간을 보내는 일은 거의 없다"
            label var HQ23   "B3HQ25_(23) 나는 사회적인 교류를 즐기지 못한다"
            label var HQ24   "B3HQ25_(24) 나는 다른 사람과 교류하는 일이 거의 없다"
            label var HQ25   "B3HQ25_(25) 혼자 있는 것보다 누군가와 함께 있는 편이 훨씬 좋다"
            label var P2a1   "B4_(1) 챌린지 등 일상회복루틴 회복 프로그램 참여"
            label var P2a2   "B4_(1) 챌린지 등 일상회복루틴 회복 프로그램 만족도"
            label var P2b1   "B4_(2) 집단활동 프로그램 참여"
            label var P2b2   "B4_(2) 집단활동 프로그램 만족도"
            label var P2c1   "B4_(3) 식사 프로그램 참여"
            label var P2c2   "B4_(3) 식사 프로그램 만족도"
            label var P2d1   "B4_(4) 캠프 등 외부활동 프로그램 참여"
            label var P2d2   "B4_(4) 캠프 등 외부활동 프로그램 만족도"
            label var P2e1   "B4_(5) 심리상담 등 마음건강 프로그램 참여"
            label var P2e2   "B4_(5) 심리상담 등 마음건강 프로그램 만족도"
            label var P2f1   "B4_(6) 금융교육 등 독립생활역량 강화 프로그램 참여"
            label var P2f2   "B4_(6) 금융교육 등 독립생활역량 강화 프로그램 만족도"
            label var P2g1   "B4_(7) 법률자문 참여"
            label var P2g2   "B4_(7) 법률자문 만족도"
            label var P2h1   "B4_(8) 자조모임 참여"
            label var P2h2   "B4_(8) 자조모임 만족도"
            label var P2i1   "B4_(9) 공동생활 참여"
            label var P2i2   "B4_(9) 공동생활 만족도"
            label var P2k1   "B4_(10) 직업상담 및 일경험 등 취업지원 프로그램램 참여"
            label var P2k2   "B4_(10) 직업상담 및 일경험 등 취업지원 프로그램만족도"
            label var P2l1   "B4_(11) 가족교육 및 가족상담 등 가족지원 프로그램 참여"
            label var P2l2   "B4_(11) 가족교육 및 가족상담 등 가족지원 프로그램 만족도"
            label var TU1    "B5_시간사용_(1) TV시청"
            label var TU2    "B5_시간사용_(2) PC/모바일 게임"
            label var TU3    "B5_시간사용_(3) SNS, 커뮤니티 등 활동"
            label var TU4    "B5_시간사용_(4) 유튜브, 넷플릭스 등 OTT 서비스 시청"
            label var TU5    "B5_시간사용_(5) 일(구직 포함)"
            label var TU6    "B5_시간사용_(6) 운동 등 취미활동"
            label var TU7    "B5_시간사용_(7) 잠"
            label var TU8    "B5_시간사용_(8) 특별히 하는 것이 없음(누워있기 등)"
            label var TU9    "B5_시간사용_(9) 청년미래센터 활동 참여"
            label var TU10   "B5_시간사용_(10) 기타"
            label var TU1o   "B5_시간사용_(10) 기타 답변"
            label var B5     "B5_고립은둔기간"
            label var B6a    "B6a_배우자여부"
            label var B6a1   "B6a 배우자와의관계"
            label var B6b    "B6b 아버지여부"
            label var B6b1   "B6b 아버지와의관계"
            label var B6c    "B6c 어머니여부"
            label var B6c1   "B6c 어머니와의관계"
            label var B6d    "B6d 형제자매여부"
            label var B6d1   "B6d 형제자매와의관계"
            label var B6e    "B7e 다른가족여부"
            label var B6e1   "B7e 다른가족과의관계"
            label var C1     "C1 삶의만족"
            label var C2a    "C2LCS_(1) 나는 집에 있을 때, 발생한 대부분의 상황을 통제할 수 있다고 느낀다"
            label var C2b    "C2LCS_(2) 나는 내 인생에서 발생한 일들이 내가 통제할 수 없는 요인들에 의해 결정된다고 느낀다"
            label var C2c    "C2LCS_(3) 향후 5~10년 동안 나는 부정적인 경험보다는 긍정적인 경험을 할 것이다"
            label var C2d    "C2LCS_(4) 나는 종종 부당하게 대우받았다고 느낀다"
            label var C2e    "C2LCS_(5) 지난 10년간, 내 인생은 다음에 무엇이 일어날지 모르는 변화로 가득했다"
            label var C2f    "C2LCS_(6) 나는 오래전에 내 삶을 더 개선하려고 하거나 변화시키려는 노력을 포기했다"
            label var D1     "D1_주민등록상거주지_시도"
            label var D1a    "D1a_실제거주지_시도"
            label var D2     "D2_최종학력"
            label var D3     "D3_혼인상태"
            label var D4     "D4_지난주수입목적1시간이상일"
            label var D5     "D5_지난주종사상지위"
            label var D5     "D5_거주주택유형"
            label var D5o    "D5o_거구주택유형_기타답변"
            label var D5a    "D5a_4주택점유형태(명의기준)"
            label var D6     "D6_1인가구"
            label var D6a    "D6a_1동거가구원_a 부모님"
            label var D6b    "D6a_1동거가구원_b 조부모"
            label var D6c    "D6a_1동거가구원_c 형제자매"
            label var D6d    "D6a_1동거가구원_d 배우자"
            label var D6e    "D6a_1동거가구원_e 친척"
            label var D6f    "D6a_1동거가구원_f 지인이나친구"
            label var D6g    "D6a_1동거가구원_g 기타"
            label var D7a    "D7_가구경제수준_상"
            label var D7b    "D7_가구경제수준_중"
            label var D7c    "D7_가구경제수준_하"
            label var D8a    "D8_본인경제수준_상"
            label var D8b    "D8_본인경제수준_중"
            label var D8c    "D8_본인경제수준_하"
            label var D9     "D9_답례품정보동의"
            label var D9a    "D9a_이름"
            label var D9b    "D9b_소속센터"
            label var D9c    "D9c_휴대폰번호"
            label var sample "적격"
        /*}}}*/

        tab Q
        tab A1
        tab B1
        tab A1 B1
        tab A1 B1, nof cell
        tab D9b

        tostring Q1, replace
        gen sido=""
            replace sido="인천" if D9b=="인천 청년미래센터"
            replace sido="울산" if D9b=="울산 청년미래센터"
            replace sido="충북" if D9b=="충북 청년미래센터"
            replace sido="전북" if D9b=="전북 청년미래센터"
        gen id=D9a+Q1+sido
        sort id

        duplicates r id
        duplicates r D9c 

        gen stm=substr(stdate,6,2)
        gen std=substr(stdate,9,2)
        gen stmd=stm+std

        order stm std stmd, before(stdate)
        destring stm std stmd, replace

        bysort D9a: gen nid=_n  // 이름+생년
        order nid, after(rid)

        keep if nid==1 & D9=="동의한다."  // 유효표본만 남김 n=533 

        drop nid

        save "청년미래센터7.dta", replace


    /*t0*/
        cd "D:\_KIHASA\2025\02.[수탁] 청년미래센터 운영지침 개선 및 성과 모니터링 연구\7.성과평가\2.전담인력조사"

        foreach r in 인천 울산 충북 전북 {
        import excel "★★★2025년(청년미래센터)사업성과모니터링조사_7월_가족돌봄T0", sheet("`r'") firstrow clear
        destring _all, replace
        gen A1="그렇다, 참여하였다."
        save "`r'_가족돌봄t0.dta", replace
        }

        foreach r in 인천 울산 충북 전북 {
        import excel "★★★2025년(청년미래센터)사업성과모니터링조사_7월_고립은둔T0", sheet("`r'") firstrow clear
        destring _all, replace
        gen B1="그렇다, 참여하였다."
        save "`r'_고립은둔t0.dta", replace
        }

        use "인천_가족돌봄t0.dta", clear
        foreach r in 인천 울산 충북 전북 {
        append using "`r'_가족돌봄t0.dta"
        }
        foreach r in 인천 울산 충북 전북 {
        append using "`r'_고립은둔t0.dta"
        }
        drop if D9a==""

        tostring Q1, replace
        gen id=D9a+Q1+sido
        order id, first
        sort id year_t0

        drop if year_t0==.	

        bysort id: gen nid=_n  // 이름+생년
        order nid, after(id)
        keep if nid==1 // 유효표본만 남김 n=1930
        drop nid

        gen stm=0

        save "D:\_KIHASA\2025\02.[수탁] 청년미래센터 운영지침 개선 및 성과 모니터링 연구\7.성과평가\1.온라인조사\2.데이터\청년미래센터0.dta", replace
