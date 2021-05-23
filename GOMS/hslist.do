cd ~/dropbox/goms
use goms_master
sort f006 f007 hsname
capture log close
log using hslist , replace
/* wave 1 {{{*/
list f006 f007 hsname if wave == 1 & f00907 == 9 , clean
/*}}}*/

/* wave 2 {{{*/
list f006 f007 hsname if wave == 2 & f00909 == 9 , clean
/*}}}*/

/* wave 3 {{{*/
list f006 f007 hsname if wave == 3 & f00909 == 9 , clean
/*}}}*/

/* wave 4 {{{*/
list f006 f007 hsname if wave == 4 & f00910 == 9 , clean
/*}}}*/

/* wave 5 {{{*/
list f006 f007 hsname if wave == 5 & f00911 == 9 , clean
/*}}}*/

/* wave 6 {{{*/
list f006 f007 hsname if wave == 6 & f00912 == 9 , clean
/*}}}*/

/* wave 7 {{{*/
list f006 f007 hsname if wave == 7 & f00913 == 9 , clean
/*}}}*/

/* wave 8 {{{*/
list f006 f007 hsname if wave == 8 & f00914 == 8 , clean
/*}}}*/

/* wave 9 {{{*/
list f006 f007 hsname if wave == 9 & f00915 == 9 , clean
/*}}}*/

/* wave 10 {{{*/
list f006 f007 hsname if wave == 10 & f00916 == 9 , clean
/*}}}*/

/* wave 11 {{{*/
list f006 f007 hsname if wave == 11 & f00917 == 9 , clean
/*}}}*/

log close
