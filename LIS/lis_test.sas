/*1.	소득분위별 위험도 구하기(예, 빈곤위험)*/
    /*(데이터 불러오기. 예시로 2020년 분석. 과거의 빈곤위험도 평균을 구하기 위해서는 아래의 작업을 연도별로 약 10년간에 걸쳐 해야 함. )*/
        DATA PP; SET &AU20H;
        /*(변수이름 바꾸기. 익숙한 이름으로)*/
            CIN=HITOTAL;
            DIN=DHI;
            PUTRAN=HPUBLIC;
            TAXSOINS=HXITSC;
            PUPEN=HI31;
            SBEN=HIPUBSOC;
            HNUM=NHHMEM;
            ONUM=NHHMEM65;
            KNUM=NHHMEM17;
            YNUM=HNUM-ONUM-KNUM;
            WEI=HPOPWGT;
            PWEI=WEI*HNUM;
            UNIT=1;
        /*(추가변수 정의)*/
            MIN=CIN-PUTRAN;
            EQ=HNUM**0.5;
        /*(공적이전소득)*/
            PRTRAN=SUM(HIPRIVATE, HI33);
        /*(소득변수 균등화)*/
            EMIN=MIN/EQ;
            ecin=cin/EQ;
            edin=din/EQ;
            EPUTRAN=PUTRAN/EQ;
            EPUPEN=PUPEN/EQ;
            ESBEN=SBEN/EQ;
            ETAXSOINS=TAXSOINS/EQ;
        /*(가구유형 구분)*/
            IF      HNUM=1             AND ONUM=1            THEN HT=1;
            ELSE IF HNUM=ONUM                                THEN HT=2;
            ELSE IF HNUM=1             AND YNUM=1            THEN HT=3;
            ELSE IF HNUM=2             AND YNUM=2            THEN HT=4;
            ELSE IF SUM(ONUM, YNUM)>=1 AND KNUM=0            THEN HT=5;
            ELSE IF ONUM>0             AND YNUM=0 AND KNUM>0 THEN HT=6;
            ELSE IF ONUM=0             AND YNUM=1 AND KNUM>0 THEN HT=6;
            ELSE IF ONUM=0             AND YNUM=2 AND KNUM>0 THEN HT=7;
            ELSE IF YNUM>=3                                  THEN HT=8;
            ELSE HT=9;
        /*(각 가구의 노인, 비노인성인, 아동 가구원수 조합)*/
            HNC=ONUM*100+YNUM*10+KNUM;
        RUN;

    /*(균등화된 시장소득 기준 10분위 구분과 분위별 빈곤 위험도 구하기)*/
        proc univariate data=PP noprint;
            var EMIN;
            weight PWEI;
            output out=stat pctlpts= 10 20 30 40 50 60 70 80 90 pctlpre=p;
            run;
        data stat;
            set stat;
            unit=1;
            run;
        data qq;
            merge PP stat;
            by unit;
            run;
        data qq;
            set qq;
        /*(10분위구분)*/
            if      EMIN<p10      then dc=1;
            else if p10<=EMIN<p20 then dc=2;
            else if p20<=EMIN<p30 then dc=3;
            else if p30<=EMIN<p40 then dc=4;
            else if p40<=EMIN<p50 then dc=5;
            else if p50<=EMIN<p60 then dc=6;
            else if p60<=EMIN<p70 then dc=7;
            else if p70<=EMIN<p80 then dc=8;
            else if p80<=EMIN<p90 then dc=9;
            else  dc=10;
        /*(5분위 구분)*/
            if      dc<=2 then qt=1;
            else if dc<=4 then qt=2;
            else if dc<=6 then qt=3;
            else if dc<=8 then qt=4;
            else qt=5;
        PL5=0.5*P50;
        PL6=0.6*P50;
        IF EMIN<PL5 THEN PV5=1;
            ELSE PV5=0;
        IF EMIN<PL6 THEN PV6=1;
            ELSE PV6=0;
        RUN;

    /*(가구 유형별로 빈곤 위험도 할당. 아래 예시는 단년도 수치를 할당해준 것이나 실제 작업시에는 직전 10개 연도 평균값을 할당해 줘야 함)*/
        DATA RR;
            SET QQ;
        /*(가구유형별로 빈곤위험도 부여. 수치는 앞의 스텝에서 구한 것임.))*/
            IF HT=1 THEN DO;
                RPV5=0.824;
                RPV6=0.835;
                END;
            ELSE IF HT=2 THEN DO;
                RPV5=0.715;
                RPV6=0.745;
                END;
            ELSE IF HT=3 THEN DO;
                RPV5=0.326;
                RPV6=0.317;
                END;
            ELSE IF HT=4 THEN DO;
                RPV5=0.141;
                RPV6=0.142;
                END;
            ELSE IF HT=5 THEN DO;
                RPV5=0.197;
                RPV6=0.193;
                END;
            ELSE IF HT=6 THEN DO;
                RPV5=0.704;
                RPV6=0.720;
                END;
            ELSE IF HT=7 THEN DO;
                RPV5=0.185;
                RPV6=0.193;
                END;
            ELSE IF HT=8 THEN DO;
                RPV5=0.163;
                RPV6=0.143;
                END;
            ELSE IF HT=9 THEN DO;
                RPV5=0.481;
                RPV6=0.542;
                END;
            RUN;
        /*(소득분위별 빈곤위험도 구하기)*/
            PROC MEANS MEAN DATA=RR ;
                WEIGHT PWEI;
                *CLASS QT;
                VAR RPV5;
                RUN;
            PROC MEANS MEAN DATA=RR ;
                WEIGHT PWEI;
                *CLASS QT;
                VAR RPV6;
                RUN;


/*2.	소득분위별 주요 소득(및 조세, 사회보장부담금)값 구하기(1과 많은 부분 겹침)*/
    DATA PP; SET &AU20H;
    CIN=HITOTAL; DIN=DHI; PUTRAN=HPUBLIC; TAXSOINS=HXITSC; PUPEN=HI31; SBEN=HIPUBSOC;
    HNUM=NHHMEM; ONUM=NHHMEM65; KNUM=NHHMEM17;
    YNUM=HNUM-ONUM-KNUM;
    PRTRAN=SUM(HIPRIVATE, HI33);
    WEI=HPOPWGT; PWEI=WEI*HNUM; UNIT=1;
    MIN=CIN-PUTRAN;
    EQ=HNUM**0.5;
    EMIN=MIN/EQ; ecin=cin/EQ; edin=din/EQ; EPUTRAN=PUTRAN/EQ; EPUPEN=PUPEN/EQ; ESBEN=SBEN/EQ; ETAXSOINS=TAXSOINS/EQ;
        IF HNUM=1 AND ONUM=1 THEN HT=1;
    ELSE IF HNUM=ONUM THEN HT=2;
    ELSE IF HNUM=1 AND YNUM=1 THEN HT=3;
    ELSE IF HNUM=2 AND YNUM=2 THEN HT=4;
    ELSE IF SUM(ONUM, YNUM)>=1 AND KNUM=0 THEN HT=5;
    ELSE IF ONUM>0 AND YNUM=0 AND KNUM>0 THEN HT=6;
    ELSE IF ONUM=0 AND YNUM=1 AND KNUM>0 THEN HT=6;
    ELSE IF ONUM=0 AND YNUM=2 AND KNUM>0 THEN HT=7;
    ELSE IF YNUM>=3 THEN  HT=8;
    ELSE HT=9;
    HNC=ONUM*100+YNUM*10+KNUM;
    RUN;
    proc univariate data=PP noprint;
    var EMIN; weight PWEI; output out=stat pctlpts= 10 20 30 40 50 60 70 80 90 pctlpre=p;
    run;
    data stat; set stat; unit=1; run;
    data qq; merge PP stat; by unit; run;
    data qq; set qq;
        if      EMIN<p10 then dc=1; else if p10<=EMIN<p20 then dc=2; else if p20<=EMIN<p30 then dc=3; else if p30<=EMIN<p40 then dc=4; else if p40<=EMIN<p50 then dc=5;
    else if p50<=EMIN<p60 then dc=6; else if p60<=EMIN<p70 then dc=7; else if p70<=EMIN<p80 then dc=8; else if p80<=EMIN<p90 then dc=9; else  dc=10;
    if dc<=2 then qt=1; else if dc<=4 then qt=2; else if dc<=6 then qt=3; else if dc<=8 then qt=4; else qt=5;
    PL5=0.5*P50; PL6=0.6*P50;
    IF EMIN<PL5 THEN PV5=1; ELSE PV5=0;
    IF EMIN<PL6 THEN PV6=1; ELSE PV6=0;
    RUN;


    PROC MEANS SUM DATA=QQ; WEIGHT PWEI; VAR EPUTRAN EPUPEN ESBEN ETAXSOINS EMIN ECIN EDIN;
                OUTPUT OUT=MM SUM=EPUTRAN EPUPEN ESBEN ETAXSOINS EMIN ECIN EDIN;
    RUN; (소득항목별 전체 총액)
    PROC MEANS SUM DATA=QQ;  WEIGHT PWEI; CLASS QT; VAR EPUTRAN EPUPEN ESBEN ETAXSOINS EMIN ECIN EDIN;
                OUTPUT OUT=MM SUM=EPUTRAN EPUPEN ESBEN ETAXSOINS EMIN ECIN EDIN;
    RUN; (소득항목별 분위별 총액)
