/*list of countries*/
#delimit ;
local datalist
    /*{{{*/
    /*Australia*/
    AU81 AU85 AU89 AU95 AU01 AU03 AU04 AU08 AU10 AU14 AU16 AU18 AU20
    /*Austria*/
    AT94 AT95 AT96 AT97 AT98 AT99 AT00 AT03 AT04 AT05 AT06 AT07 AT08 AT09 AT10 AT11 AT12 AT13 AT14 AT15 AT16 AT17 AT18 AT19 AT20 AT21 AT22
    /*Belgium*/
    BE85 BE88 BE92 BE95 BE97 BE00 BE03 BE04 BE05 BE06 BE07 BE08 BE09 BE10 BE11 BE12 BE13 BE14 BE15 BE16 BE17 BE18 BE19 BE20 BE21
    /*Brazil*/
    BR81 BR82 BR83 BR84 BR85 BR86 BR87 BR88 BR89 BR90 BR92 BR93 BR95 BR96 BR97 BR98 BR99 BR01 BR02 BR03 BR04 BR05 BR06 BR07 BR08 BR09 BR11 BR12 BR13 BR14 BR15 BR16 BR17 BR18 BR19 BR20 BR21 BR22
    /*Canada*/
    CA71 CA73 CA75 CA77 CA79 CA81 CA82 CA84 CA85 CA86 CA87 CA88 CA89 CA90 CA91 CA92 CA93 CA94 CA95 CA96 CA97 CA98 CA99 CA00 CA01 CA02 CA03 CA04 CA05 CA06 CA07 CA08 CA09 CA10 CA11 CA12 CA13 CA14 CA15 CA16 CA17 CA18 CA19 CA20 CA21
    /*Chile*/
    CL90 CL92 CL94 CL96 CL98 CL00 CL03 CL06 CL09 CL11 CL13 CL15 CL17
    /*China*/
    CN02 CN13 CN18
    /*Colombia*/
    CO01 CO02 CO03 CO04 CO05 CO06 CO07 CO08 CO09 CO10 CO11 CO12 CO13 CO14 CO15 CO16 CO17 CO18 CO19 CO20 CO21 CO22 CO23
    /*Czech Rep */
    CZ92 CZ96 CZ02 CZ04 CZ07 CZ10 CZ13 CZ16
    /*Denmark*/
    DK87 DK92 DK95 DK00 DK04 DK07 DK10 DK13 DK15 DK16 DK17 DK18 DK19 DK20 DK21 DK22
    /*Dominican Rep.*/
    DO07
    /*Estonia*/
    EE00 EE04 EE07 EE10 EE13 EE16
    /*Finland*/
    FI87 FI91 FI95 FI00 FI04 FI07 FI10 FI13 FI16
    /*France*/
    FR70 FR75 FR79 FR84 FR90 FR96 FR97 FR98 FR99 FR00 FR01 FR02 FR03 FR04 FR05 FR06 FR07 FR08 FR09 FR10 FR11 FR12 FR13 FR14 FR15 FR16 FR17 FR18 FR19 FR20
    /*Germany*/
    DE73 DE78 DE83 DE84 DE85 DE86 DE87 DE88 DE89 DE90 DE91 DE92 DE93 DE94 DE95 DE96 DE97 DE98 DE99 DE00 DE01 DE02 DE03 DE04 DE05 DE06 DE07 DE08 DE09 DE10 DE11 DE12 DE13 DE14 DE15 DE16 DE17 DE18 DE19 DE20
    /*Georgia*/
    GE09 GE10 GE11 GE12 GE13 GE14 GE15 GE16 GE17 GE18 GE19 GE20 GE21 GE22
    /*Greece*/
    GR95 GR00 GR02 GR03 GR04 GR05 GR06 GR07 GR08 GR09 GR10 GR11 GR12 GR13 GR14 GR15 GR16 GR17 GR18 GR19 GR20 GR21
    /*Guatemala*/
    GT06 GT11 GT14
    /*Hungary*/
    HU91 HU94 HU99 HU05 HU07 HU09 HU12 HU15
    /*Iceland*/
    IS04 IS07 IS10
    /*India*/
    IN04 IN11
    /*Ireland*/
    IE87 IE94 IE95 IE96 IE00 IE02 IE03 IE04 IE05 IE06 IE07 IE08 IE09 IE10 IE11 IE12 IE13 IE14 IE15 IE16 IE17 IE18 IE19 IE20 IE21
    /*Israel*/
    IL79 IL86 IL92 IL97 IL01 IL02 IL03 IL04 IL05 IL06 IL07 IL08 IL09 IL10 IL11 IL12 IL13 IL14 IL15 IL16 IL17 IL18 IL19 IL20 IL21
    /*Italy*/
    IT77 IT78 IT79 IT80 IT81 IT82 IT83 IT84 IT86 IT87 IT89 IT91 IT93 IT95 IT98 IT00 IT02 IT04 IT06 IT08 IT10 IT12 IT14 IT16 IT20
    /*Ivory Coast*/
    CI02 CI08 CI15
    /*Japan*/
    JP08 JP09 JP10 JP11 JP12 JP13 JP14 JP15 JP16 JP17 JP18 JP19 JP20
    /*Lithuania*/
    LT09 LT10 LT11 LT12 LT13 LT14 LT15 LT16 LT17 LT18 LT19 LT20 LT21
    /*Luxembourg*/
    LU86 LU87 LU85 LU88 LU89 LU90 LU91 LU92 LU93 LU94 LU95 LU96 LU97 LU98 LU99 LU00 LU01 LU02 LU03 LU04 LU05 LU06 LU07 LU08 LU09 LU10 LU11 LU12 LU13 LU14 LU15 LU16 LU17 LU18 LU19 LU20 LU21
    /*Mali*/
    ML11 ML13 ML14 ML15 ML16 ML17 ML18 ML19 ML20
    /*Mexico*/
    MX84 MX89 MX92 MX94 MX96 MX98 MX00 MX02 MX04 MX05 MX06 MX08 MX10 MX12 MX14 MX16 MX18 MX20 MX22
    /*Netherlands*/
    NL83 NL87 NL90 NL93 NL99 NL04 NL05 NL06 NL07 NL08 NL09 NL10 NL11 NL12 NL13 NL14 NL15 NL16 NL17 NL18 NL19 NL20 NL21
    /*Norway*/
    NO79 NO86 NO91 NO95 NO00 NO04 NO07 NO10 NO13 NO16 NO19 NO20 NO21 NO22
    /*Palestine*/
    PS17 PS23
    /*Panama*/
    PA07 PA10 PA13 PA16
    /*Paraguay*/
    PY97 PY99 PY00 PY02 PY03 PY04 PY05 PY06 PY07 PY08 PY09 PY10 PY11 PY12 PY13 PY14 PY15 PY16 PY17 PY18 PY19 PY20
    /*Peru*/
    PE04 PE05 PE06 PE07 PE08 PE09 PE10 PE11 PE12 PE13 PE14 PE15 PE16 PE17 PE18 PE19 PE21
    /*Poland*/
    PL86 PL92 PL95 PL99 PL04 PL05 PL06 PL07 PL08 PL09 PL10 PL11 PL12 PL13 PL14 PL15 PL16 PL17 PL18 PL19 PL20
    /*Romania*/
    RO95 RO97 RO06 RO07 RO08 RO09 RO10 RO11 RO12 RO13 RO14 RO15 RO17 RO16 RO18 RO19 RO20 RO21
    /*Russia*/
    RU00 RU04 RU07 RU10 RU11 RU13 RU14 RU15 RU16 RU17 RU18 RU19 RU20 RU21 RU22
    /*Serbia*/
    RS06 RS07 RS08 RS09 RS10 RS11 RS12 RS13 RS14 RS15 RS16 RS17 RS18 RS19 RS21 RS22
    /*Slovakia*/
    SK92 SK96 SK04 SK07 SK10 SK13 SK14 SK15 SK16 SK17 SK18
    /*Slovenia*/
    SI97 SI99 SI04 SI07 SI10 SI12 SI15
    /*South Africa*/
    ZA08 ZA10 ZA12 ZA15 ZA17
    /*South Korea*/
    KR06 KR08 KR10 KR12 KR14 KR16 KR17 KR18 KR19 KR20 KR21
    /*Spain*/
    ES80 ES85 ES90 ES93 ES94 ES95 ES96 ES97 ES98 ES99 ES00 ES04 ES05 ES06 ES07 ES08 ES09 ES10 ES11 ES12 ES13 ES14 ES15 ES16 ES17 ES18 ES19 ES20 ES21 ES22
    /*Sweden*/
    SE75 SE81 SE87 SE92 SE95 SE00 SE01 SE02 SE03 SE04 SE05 SE06 SE07 SE08 SE09 SE10 SE11 SE12 SE13 SE14 SE15 SE16 SE17 SE18 SE19 SE20 SE21
    /*Switzerland*/
    CH82 CH92 CH00 CH02 CH04 CH06 CH07 CH08 CH09 CH10 CH11 CH12 CH13 CH14 CH15 CH16 CH17 CH18 CH19
    /*Taiwan*/
    TW81 TW86 TW91 TW95 TW97 TW00 TW05 TW07 TW10 TW13 TW16 TW17 TW18 TW19 TW20 TW21
    /*United Kingdom*/
    UK68 UK69 UK70 UK71 UK72 UK73 UK74 UK75 UK76 UK77 UK78 UK79 UK80 UK81 UK82 UK83 UK84 UK85 UK86 UK87 UK88 UK89 UK90 UK91 UK92 UK93 UK94 UK95 UK96 UK97 UK98 UK99 UK00 UK01 UK02 UK03 UK04 UK05 UK06 UK07 UK08 UK09 UK10 UK11 UK12 UK13 UK14 UK15 UK16 UK17 UK18 UK19 UK20 UK21
    /*United States*/
    US63 US64 US65 US66 US67 US68 US69 US70 US71 US72 US73 US74 US75 US76 US77 US78 US79 US80 US81 US82 US83 US84 US85 US86 US87 US88 US89 US90 US91 US92 US93 US94 US95 US96 US97 US98 US99 US00 US01 US02 US03 US04 US05 US06 US07 US08 US09 US10 US11 US12 US13 US14 US15 US16 US17 US18 US19 US20 US21 US22 US23
    /*Uruguay*/
    UY04 UY05 UY06 UY07 UY08 UY09 UY10 UY11 UY12 UY13 UY14 UY15 UY16 UY17 UY18 UY19 UY22
    /*Vietnam*/
    VN05 VN07 VN09 VN11 VN13
    /*}}}*/
;
#delimit cr

    foreach mydata of local datalist {
        // [1] use data and define vars
        use `mydata'.dta, clear
        rename _all , lower

        rename cin = hitotal
        rename din = dhi
        rename putran = hpublic
        rename taxsoins = hxitsc
        rename pupen = hi31
        rename sben = hipubsoc
        rename hnum = nhhmem
        rename onum = nhhmem65
        rename knum = nhhmem17
        rename wei = hpopwgt

        gen ynum = hnum - onum - knum
        gen prtran = hiprivate + hi33 /*public transfer*/
        gen pwei = wei * hnum
        gen unit = 1
        gen min = cin - putran
        gen eq = sqrt(hnum)
        gen emin = min / eq
        gen ecin = cin / eq
        gen edin = din / eq
        gen eputran = putran / eq
        gen epupen = pupen / eq
        gen esben = sben / eq
        gen etaxsoins = taxsoins / eq /*equalized income*/

        // [2] gen household type var
        gen ht = .
            label var ht "Household type"
            replace ht = 1 if hnum == 1 & onum == 1
            replace ht = 2 if hnum == onum
            replace ht = 3 if hnum == 1 & ynum == 1
            replace ht = 4 if hnum == 2 & ynum == 2
            replace ht = 5 if (onum + ynum) >= 1 & knum == 0
            replace ht = 6 if (onum > 0 & ynum == 0 & knum > 0) | (onum == 0 & ynum == 1 & knum > 0)
            replace ht = 7 if onum == 0 & ynum == 2 & knum > 0
            replace ht = 8 if ynum >= 3
            replace ht = 9 if missing(ht)

        // [3] gen household composition code
        gen hnc = onum * 100 + ynum * 10 + knum
        /*??? just the household number or any means?*/

        // [4] cal quantile
        pctile p10 = emin [pweight = pwei], nquantiles(10)

        // [5] cal quantile intervals and the poverty line
        gen dc = .
        forvalues i = 1(1)9 {
            quietly replace dc = `i' if emin >= p10[`i'-1] & emin < p10[`i']
        }
        replace dc = 10 if emin >= p10[9]

        gen qt = .
        replace qt = 1 if dc <= 2
        replace qt = 2 if dc <= 4 & dc > 2
        replace qt = 3 if dc <= 6 & dc > 4
        replace qt = 4 if dc <= 8 & dc > 6
        replace qt = 5 if dc > 8

        gen pl5 = 0.5 * p10[5]
        gen pl6 = 0.6 * p10[5]

        gen pv5 = (emin < pl5)
        gen pv6 = (emin < pl6)

        // [6] assign poverty risk along with household type
        /*??? why are they have values?*/
        gen rpv5 = .
            replace rpv5 = 0.824 if ht == 1
            replace rpv5 = 0.715 if ht == 2
            replace rpv5 = 0.326 if ht == 3
            replace rpv5 = 0.141 if ht == 4
            replace rpv5 = 0.197 if ht == 5
            replace rpv5 = 0.704 if ht == 6
            replace rpv5 = 0.185 if ht == 7
            replace rpv5 = 0.163 if ht == 8
            replace rpv5 = 0.481 if ht == 9
        gen rpv6 = .
            replace rpv6 = 0.835 if ht == 1
            replace rpv6 = 0.745 if ht == 2
            replace rpv6 = 0.317 if ht == 3
            replace rpv6 = 0.142 if ht == 4
            replace rpv6 = 0.193 if ht == 5
            replace rpv6 = 0.720 if ht == 6
            replace rpv6 = 0.193 if ht == 7
            replace rpv6 = 0.143 if ht == 8
            replace rpv6 = 0.542 if ht == 9

        // [7] mean of poverty risk
        mean rpv5 [pweight = pwei]
        mean rpv6 [pweight = pwei]

        // [8] cal total amount by types of income
        preserve
        collapse (sum) eputran epupen esben etaxsoins emin ecin edin [pweight = pwei]
        save total_income_sum.dta, replace
        restore

        // [9] cal total amount by types of income and quantile
        collapse (sum) eputran epupen esben etaxsoins emin ecin edin [pweight = pwei], by(qt)
        save quintile_income_sum.dta, replace
    }
