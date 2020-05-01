set more off
clear all
set mem 1g
cap log close

#delimit ; 

adopath + C:\Users\Administrator\Dropbox\Sharedir\TIMSS\Kang;

//local path_input C:\Users`c(dirsep)'`c(username)'\Dropbox\Stata\TIMSS\Kang\data\ ;
local path_input C:\Users\Administrator\Dropbox\Sharedir\TIMSS\Kang\data\ ;

log using "`path_input'analysis2-w1.log", replace text;

use `path_input'timss_v11.dta ; 

/*
keep if cntry=="kor";
keep if wave==1;

sum;

anova bsmmat01 cgrp [aw=totwgt] if cntry=="kor"&wave==1;
*/ 

tab cntry;
tab wave;

tab cntry wave;

local c1list "aus aut can col cyp csk dnk fra deu grc hkg hun isl irn irl isr kor kwt lva ltu nld nzl nor prt rom rus sgp slv svn esp swe che tha usa";
local c2list "aus bgr can chl twn cyp cze fin hkg hun idn irn isr ita jor kor lva ltu mkd mda mar mys nld nzl phl rom rus sgp svk svn tha tun tur usa";
local c3list "arm aus bhr bwa bgr chl twn cyp egy eng est gha hkg hun idn irn isr ita jpn jor kor lva lbn ltu mkd mys mda mar nld nzl nor pse phl rom rus sau sco scg sgp svk svn zaf swe syr tun usa";
local c4list "dza arm aus bhr bih bwa bgr twn col cyp cze  egy slv geo gha hkg  hun idn irn isr ita jpn  jor kor kwt lbn ltu mys  mlt mng mar nor omn pse  qat rom rus sau scg  sgp svn swe syr tha tun  ukr usa";
local c5list "arm aus bhr chl twn eng fin geo gha hkg hun idn irn isr ita jpn jor kaz kor lbn ltu mkd mys mar nzl nor omn pse qat rom  rus sau sgp svn swe  syr tha tun tur ukr  are usa";
local c6list "aus bhr bwa can chl twn egy eng geo hkg hun irn irl isr ita jpn jor kaz kor kwt lbn ltu mys mlt mar nzl nor omn qat rus sau sgp svn zaf swe tha tur are usa";


foreach var of local c1list {;

use "`path_input'timss_v11.dta", clear ; 

keep if wave==1;
keep if cntry=="`var'";

display "                                      ";
display "*********** Cntry is `var' ***********";
display "*********** Cntry is `var' ***********";

tab cntry;


mi set mlong;

mi register imputed bsmmat01 bsssci01 dsex cedu cbok;
mi describe;


regress bsmmat01 dsex cedu cbok [aw=totwgt];
gen tempindex = e(r2);
gen n0=e(N);

mi impute chained (regress) bsmmat01 bsssci01 cedu cbok (logit) dsex, add(20);
mi estimate, saving(miest, replace): regress bsmmat01 dsex cedu cbok [aw=totwgt];
gen n1=e(N_mi);

mi predict yhat using miest, xb;
mi xeq 0: sum bsmmat01 yhat [aw=totwgt];

mi xeq 0: sum yhat [aw=totwgt];
gen vyhat = r(Var);

mi xeq 0: sum bsmmat01 [aw=totwgt];
gen vy = r(Var);

gen index = vyhat / vy;
gen missing=1-n0/n1;

sum tempindex index missing;

display "*********** Cntry is `var' ***********";
display "*********** Cntry is `var' ***********";
display "                                      ";

};

log close;
