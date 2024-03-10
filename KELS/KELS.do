/Users/jay/Library/CloudStorage/Dropbox/KELS/rawdata
/*자기조절학습1-3은 자기주도적 학습능력검사로 불필요*/
  /*교사1-3{{{*/
    "KELS2005 1차 데이터(공개)/ Y1_교사설문지_공개"
      rename _all , lower
      keep tid schid t1-t8 t17_1-t24_8 t28_* t31_1-t40_7
      TID
    "KELS2005 2차 데이터(공개)/ Y2_교사설문지_공개"
      rename _all , lower
      keep tid schid t1-t7 t14_1-t24_8 t27_1-t38_7 t40
      TID
    "KELS2005 3차 데이터(공개)/ Y3_교사_공개"
      rename _all , lower
      TID
  /*}}}*/
  /*학교장1-3{{{*/
    "KELS2005 1차 데이터(공개)/ Y1_학교장설문지_공개"
      rename _all , lower
      /*전부 다 사용할 것*/
      SCHID
    "KELS2005 2차 데이터(공개)/ Y2_학교장설문지_공개"
      rename _all , lower
      SCHID
    "KELS2005 3차 데이터(공개)/ Y3_학교장_공개"
      rename _all , lower
      SCHID
  /*}}}*/
  /*학교1-3{{{*/
    "KELS2005 1차 데이터(공개)/ Y1_학교조사지_공개"
      rename _all , lower
      /*전부 다 사용할 것*/
      SCHID
    "KELS2005 2차 데이터(공개)/ Y2_학교조사지_공개"
      rename _all , lower
      SCHID
    "KELS2005 3차 데이터(공개)/ Y3_학교조사지_공개"
      rename _all , lower
      SCHID
  /*}}}*/
  /*통계DB4-6{{{*/
    "KELS2005 4차 데이터(공개)/ Y4_통계DB_공개"
      rename _all , lower
      Y4SCHID
    "KELS2005 5차 데이터(공개)/ Y5_통계DB_공개"
      rename _all , lower
      Y5SCHID
    "KELS2005 6차 데이터(공개)/ Y6_통계DB_공개"
      rename _all , lower
      Y6SCHID
  /*}}}*/
  /*학부모1-6{{{*/
    "KELS2005 1차 데이터(공개)/ Y1_학부모_공개"
      rename _all , lower
      drop p12-p14_2 p34_* p35_* p36_* p40_*
      SID
    "KELS2005 2차 데이터(공개)/ Y2_학부모_공개"
      rename _all , lower
      SID
    "KELS2005 3차 데이터(공개)/ Y3_학부모_공개"
      rename _all , lower
      SID
    "KELS2005 4차 데이터(공개)/ Y4_학부모_공개"
      rename _all , lower
      SID
    "KELS2005 5차 데이터(공개)/ Y5_학부모_공개"
      rename _all , lower
      SID
    "KELS2005 6차 데이터(공개)/ Y6_학부모_공개"
      rename _all , lower
      SID
  /*}}}*/
  /*학생평가1-6{{{*/
  /*교사의 학생에 대한 평가*/
  "KELS2005 1차 데이터(공개)/ Y1_학생평가지_공개"
    rename _all , lower
    rename y1* *
    keep sid-eva 
    SID
  "KELS2005 2차 데이터(공개)/ Y2_학생평가지_공개"
    rename _all , lower
    rename y2* *
    keep sid-eva e22* // 학생이 받는 지원금 
    SID
  "KELS2005 3차 데이터(공개)/ Y3_학생평가지_공개"
    rename _all , lower
    rename y3* *
    keep sid-eva e12* // 학생이 받는 지원금 
    SID
  "KELS2005 4차 데이터(공개)/ Y4_학생평가지_공개"
    rename _all , lower
    rename y4* *
    SID
  "KELS2005 5차 데이터(공개)/ Y5_학생평가지_공개"
    rename _all , lower
    rename y5* *
    SID
  "KELS2005 6차 데이터(공개)/ Y6_학생평가지_공개"
    rename _all , lower
    rename y6* *
    SID
  /*}}}*/
  /*학생1-3{{{*/
    "KELS2005 1차 데이터(공개)/ Y1_학생_공개"
      rename _all , lower
      rename y1* *
      keep sid-stu s2 kor* eng* mat*
      SID
    "KELS2005 2차 데이터(공개)/ Y2_학생_공개"
      rename _all , lower
      rename y2* *
      keep sid-stu kor* eng* mat*
      SID
    "KELS2005 3차 데이터(공개)/ Y3_학생설문지_공개"
      rename _all , lower
      rename y3* *
      keep sid-stu kor* eng* mat*
      SID
  /*}}}*/
  /*학생설문4-6{{{*/
    "KELS2005 4차 데이터(공개)/ Y4_학생설문지_공개"
      rename _all , lower
      SID
    "KELS2005 5차 데이터(공개)/ Y5_학생설문지_공개"
      rename _all , lower
      SID
    "KELS2005 6차 데이터(공개)/ Y6_학생설문지_공개"
      rename _all , lower
      SID
  /*}}}*/
    "KELS2005 5차 데이터(공개)/ Y5_학습자특성조사지_공개"
      rename _all , lower
      SID
    "KELS2005 6차 데이터(공개)/ Y6_목표의식조사지_공개"
      rename _all , lower
      SID
