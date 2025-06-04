/*호출변수 목록 생성*/
    #delimit ;
    local datalist /*관측치 5개 이하 국가는 제외*/
        /*{{{*/
        /*Australia*/
            au81 au85 au89 au95 au01 au03 au04 au08 au10 au14 au16 au18 au20
        /*Austria*/
            at94 at95 at96 at97 at98 at99 at00 at03 at04 at05 at06 at07 at08 at09 at10 at11
            at12 at13 at14 at15 at16 at17 at18 at19 at20 at21 at22
        /*Belgium*/
            be85 be88 be92 be95 be97 be00 be03 be04 be05 be06 be07 be08 be09 be10 be11 be12
            be13 be14 be15 be16 be17 be18 be19 be20 be21
        /*Brazil*/
            br81 br82 br83 br84 br85 br86 br87 br88 br89 br90 br92 br93 br95 br96 br97 br98
            br99 br01 br02 br03 br04 br05 br06 br07 br08 br09 br11 br12 br13 br14 br15 br16
            br17 br18 br19 br20 br21 br22
        /*Canada*/
            ca71 ca73 ca75 ca77 ca79 ca81 ca82 ca84 ca85 ca86 ca87 ca88 ca89 ca90 ca91 ca92
            ca93 ca94 ca95 ca96 ca97 ca98 ca99 ca00 ca01 ca02 ca03 ca04 ca05 ca06 ca07 ca08
            ca09 ca10 ca11 ca12 ca13 ca14 ca15 ca16 ca17 ca18 ca19 ca20 ca21
        /*Chile*/
            cl90 cl92 cl94 cl96 cl98 cl00 cl03 cl06 cl09 cl11 cl13 cl15 cl17
        /*China*/
            /*cn02 cn13 cn18*/
        /*Colombia*/
            co01 co02 co03 co04 co05 co06 co07 co08 co09 co10 co11 co12 co13 co14 co15 co16
            co17 co18 co19 co20 co21 co22 co23
        /*Czech Rep */
            cz92 cz96 cz02 cz04 cz07 cz10 cz13 cz16
        /*Denmark*/
            dk87 dk92 dk95 dk00 dk04 dk07 dk10 dk13 dk15 dk16 dk17 dk18 dk19 dk20 dk21 dk22
        /*Dominican Rep.*/
            /*do07*/
        /*Estonia*/
            ee00 ee04 ee07 ee10 ee13 ee16
        /*Finland*/
            fi87 fi91 fi95 fi00 fi04 fi07 fi10 fi13 fi16
        /*France*/
            fr70 fr75 fr79 fr84 fr90 fr96 fr97 fr98 fr99 fr00 fr01 fr02 fr03 fr04 fr05 fr06
            fr07 fr08 fr09 fr10 fr11 fr12 fr13 fr14 fr15 fr16 fr17 fr18 fr19 fr20
        /*Germany*/
            de73 de78 de83 de84 de85 de86 de87 de88 de89 de90 de91 de92 de93 de94 de95 de96
            de97 de98 de99 de00 de01 de02 de03 de04 de05 de06 de07 de08 de09 de10 de11 de12
            de13 de14 de15 de16 de17 de18 de19 de20
        /*Georgia*/
            ge09 ge10 ge11 ge12 ge13 ge14 ge15 ge16 ge17 ge18 ge19 ge20 ge21 ge22
        /*Greece*/
            gr95 gr00 gr02 gr03 gr04 gr05 gr06 gr07 gr08 gr09 gr10 gr11 gr12 gr13 gr14 gr15
            gr16 gr17 gr18 gr19 gr20 gr21
        /*Guatemala*/
            /*gt06 gt11 gt14*/
        /*Hungary*/
            hu91 hu94 hu99 hu05 hu07 hu09 hu12 hu15
        /*Iceland*/
            /*is04 is07 is10*/
        /*India*/
            /*in04 in11*/
        /*Ireland*/
            ie87 ie94 ie95 ie96 ie00 ie02 ie03 ie04 ie05 ie06 ie07 ie08 ie09 ie10 ie11 ie12
            ie13 ie14 ie15 ie16 ie17 ie18 ie19 ie20 ie21
        /*Israel*/
            il79 il86 il92 il97 il01 il02 il03 il04 il05 il06 il07 il08 il09 il10 il11 il12
            il13 il14 il15 il16 il17 il18 il19 il20 il21
        /*Italy*/
            it77 it78 it79 it80 it81 it82 it83 it84 it86 it87 it89 it91 it93 it95 it98 it00
            it02 it04 it06 it08 it10 it12 it14 it16 it20
        /*Ivory Coast*/
            /*ci02 ci08 ci15*/
        /*Japan*/
            jp08 jp09 jp10 jp11 jp12 jp13 jp14 jp15 jp16 jp17 jp18 jp19 jp20
        /*Lithuania*/
            lt09 lt10 lt11 lt12 lt13 lt14 lt15 lt16 lt17 lt18 lt19 lt20 lt21
        /*Luxembourg*/
            lu86 lu87 lu85 lu88 lu89 lu90 lu91 lu92 lu93 lu94 lu95 lu96 lu97 lu98 lu99 lu00
            lu01 lu02 lu03 lu04 lu05 lu06 lu07 lu08 lu09 lu10 lu11 lu12 lu13 lu14 lu15 lu16
            lu17 lu18 lu19 lu20 lu21
        /*Mali*/
            ml11 ml13 ml14 ml15 ml16 ml17 ml18 ml19 ml20
        /*Mexico*/
            mx84 mx89 mx92 mx94 mx96 mx98 mx00 mx02 mx04 mx05 mx06 mx08 mx10 mx12 mx14 mx16
            mx18 mx20 mx22
        /*Netherlands*/
            nl83 nl87 nl90 nl93 nl99 nl04 nl05 nl06 nl07 nl08 nl09 nl10 nl11 nl12 nl13 nl14
            nl15 nl16 nl17 nl18 nl19 nl20 nl21
        /*Norway*/
            no79 no86 no91 no95 no00 no04 no07 no10 no13 no16 no19 no20 no21 no22
        /*Palestine*/
            /*ps17 ps23*/
        /*Panama*/
            /*pa07 pa10 pa13 pa16*/
        /*Paraguay*/
            py97 py99 py00 py02 py03 py04 py05 py06 py07 py08 py09 py10 py11 py12 py13 py14
            py15 py16 py17 py18 py19 py20
        /*Peru*/
            pe04 pe05 pe06 pe07 pe08 pe09 pe10 pe11 pe12 pe13 pe14 pe15 pe16 pe17 pe18 pe19
            pe21
        /*Poland*/
            pl86 pl92 pl95 pl99 pl04 pl05 pl06 pl07 pl08 pl09 pl10 pl11 pl12 pl13 pl14 pl15
            pl16 pl17 pl18 pl19 pl20
        /*Romania*/
            ro95 ro97 ro06 ro07 ro08 ro09 ro10 ro11 ro12 ro13 ro14 ro15 ro17 ro16 ro18
            ro19 ro20 ro21
        /*Russia*/
            ru00 ru04 ru07 ru10 ru11 ru13 ru14 ru15 ru16 ru17 ru18 ru19 ru20 ru21 ru22
        /*Serbia*/
            rs06 rs07 rs08 rs09 rs10 rs11 rs12 rs13 rs14 rs15 rs16 rs17 rs18 rs19 rs21 rs22
        /*Slovakia*/
            sk92 sk96 sk04 sk07 sk10 sk13 sk14 sk15 sk16 sk17 sk18
        /*Slovenia*/
            /*si97 si99 si04 si07 si10 si12 si15*/
        /*South Africa*/
            /*za08 za10 za12 za15 za17*/
        /*South Korea*/
            kr06 kr08 kr10 kr12 kr14 kr16 kr17 kr18 kr19 kr20 kr21
        /*Spain*/
            es80 es85 es90 es93 es94 es95 es96 es97 es98 es99 es00 es04 es05 es06 es07 es08
            es09 es10 es11 es12 es13 es14 es15 es16 es17 es18 es19 es20 es21 es22
        /*Sweden*/
            se75 se81 se87 se92 se95 se00 se01 se02 se03 se04 se05 se06 se07 se08 se09 se10
            se11 se12 se13 se14 se15 se16 se17 se18 se19 se20 se21
        /*Switzerland*/
            ch82 ch92 ch00 ch02 ch04 ch06 ch07 ch08 ch09 ch10 ch11 ch12 ch13 ch14 ch15 ch16
            ch17 ch18 ch19
        /*Taiwan*/
            tw81 tw86 tw91 tw95 tw97 tw00 tw05 tw07 tw10 tw13 tw16 tw17 tw18 tw19 tw20 tw21
        /*United Kingdom*/
            uk68 uk69 uk70 uk71 uk72 uk73 uk74 uk75 uk76 uk77 uk78 uk79 uk80 uk81 uk82 uk83
            uk84 uk85 uk86 uk87 uk88 uk89 uk90 uk91 uk92 uk93 uk94 uk95 uk96 uk97 uk98 uk99
            uk00 uk01 uk02 uk03 uk04 uk05 uk06 uk07 uk08 uk09 uk10 uk11 uk12 uk13 uk14 uk15
            uk16 uk17 uk18 uk19 uk20 uk21
        /*United States*/
            us63 us64 us65 us66 us67 us68 us69 us70 us71 us72 us73 us74 us75 us76 us77 us78
            us79 us80 us81 us82 us83 us84 us85 us86 us87 us88 us89 us90 us91 us92 us93 us94
            us95 us96 us97 us98 us99 us00 us01 us02 us03 us04 us05 us06 us07 us08 us09 us10
            us11 us12 us13 us14 us15 us16 us17 us18 us19 us20 us21 us22 us23
        /*Uruguay*/
            uy04 uy05 uy06 uy07 uy08 uy09 uy10 uy11 uy12 uy13 uy14 uy15 uy16 uy17 uy18 uy19
            uy22
        /*Vietnam*/
            /*vn05 vn07 vn09 vn11 vn13*/
        /*}}}*/ ;
    #delimit cr

    foreach k of local datalist {
        qui {
        /*자료호출*/
            use $`k'h, clear
        /*변수조작*/
            /*변수 생성*/
                gen min     = hitotal - hpublic
                gen pwgt    = hpopwgt * nhhmem
            /*변수 생성 : 균등화 소득*/
                gen ehhmen    = sqrt(nhhmem)
                gen emin      = min      / ehhmen
                gen ehitotal  = hitotal  / ehhmen
            /*변수 생성 : 가중 분위수 집단*/
                xtile qtgroup = emin [aw=hpopwgt], nq(5)
        /*소득분위별 가중 소득 계산*/
            /*ehpublic ehi31 ehipubsoc ehxitsc emin ehitotal edhi*/
            summarize ehitotal [aw=pwgt], meanonly
            local ehitotalq0 = r(sum)
            forvalue i = 1/5 {
                summarize ehitotal if qtgroup == `i' [aw=pwgt] , meanonly
                local ehitotalq`i' = r(sum)
            }
        }
        /*결과 출력*/
            /*국가명 년도*/
                local cname = cname[1]
                local iso2 = iso2[1]
                local iso3 = iso3[1]
                local year = year[1]
            if "`k'" == "au81" {
                di as text "cname; iso2; iso3; year; ehitotalq0; ehitotalq1; ehitotalq2; ehitotalq3; ehitotalq4; ehitotalq5;"
            }
            di as text "`cname'; `iso2'; `iso3'; `year'; `ehitotalq0'; `ehitotalq1'; `ehitotalq2'; `ehitotalq3'; `ehitotalq4'; `ehitotalq5';"
    }
