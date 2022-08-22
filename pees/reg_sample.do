cd ~/dropbox/pees
use pees , clear
set matsize 5000

eststo clear
    eststo: quietly xi: reg totexp c.nconfirmed##i.region i.year grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income [aw=wt] if school ==  1, vce(cluster region)
    eststo: quietly xi: reg totexp c.nconfirmed##i.region i.year grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income [aw=wt] if school ==  2, vce(cluster region)
    eststo: quietly xi: reg totexp c.nconfirmed##i.region i.year grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income [aw=wt] if school ==  3, vce(cluster region)
esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label
eststo clear

eststo clear
    eststo: quietly xi: reg totexp c.nconfirmed##i.region i.year grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income [aw=wt] if school ==  1, vce(cluster region)
    eststo: quietly xi: reg totexp i.region i.year grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income [aw=wt] if school ==  1, vce(cluster region)
    eststo: quietly xi: reg totexp c.nconfirmed##i.region i.year grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income [aw=wt] if school ==  2, vce(cluster region)
    eststo: quietly xi: reg totexp i.region i.year grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income [aw=wt] if school ==  2, vce(cluster region)
    eststo: quietly xi: reg totexp c.nconfirmed##i.region i.year grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income [aw=wt] if school ==  3, vce(cluster region)
    eststo: quietly xi: reg totexp i.region i.year grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income [aw=wt] if school ==  3, vce(cluster region)
esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g)
eststo clear

eststo clear
    eststo: quietly xi: reg totexp c.nconfirmed##i.region i.year grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income pinum u20pop [aw=wt] if school == 1, vce(cluster region)
    eststo: quietly xi: reg totexp c.nconfirmed##i.region i.year grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income pinum u20pop [aw=wt] if school == 2, vce(cluster region)
    eststo: quietly xi: reg totexp c.nconfirmed##i.region i.year grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income pinum u20pop [aw=wt] if school == 3, vce(cluster region)
esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g)
eststo clear

eststo clear
    eststo: quietly xi: reg totexp c.milcfm##i.region i.year grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income milpi [aw=wt] if school ==  1, vce(cluster region)
    eststo: quietly xi: reg totexp c.milcfm##i.region i.year grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income milpi [aw=wt] if school ==  2, vce(cluster region)
    eststo: quietly xi: reg totexp c.milcfm##i.region i.year grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income milpi [aw=wt] if school ==  3, vce(cluster region)
esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N )
eststo clear

eststo clear
    eststo: quietly xi: reg totexp c.milcfm i.region i.year grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income milpi [aw=wt] if school ==  1, vce(cluster region)
    eststo: quietly xi: reg totexp c.milcfm i.region i.year grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income milpi [aw=wt] if school ==  2, vce(cluster region)
    eststo: quietly xi: reg totexp c.milcfm i.region i.year grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income milpi [aw=wt] if school ==  3, vce(cluster region)
esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g)
eststo clear

eststo clear
    eststo: quietly xi: reg totexp c.mildth i.region i.year grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income milpi [aw=wt] if school ==  1, vce(cluster region)
    eststo: quietly xi: reg totexp c.mildth i.region i.year grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income milpi [aw=wt] if school ==  2, vce(cluster region)
    eststo: quietly xi: reg totexp c.mildth i.region i.year grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income milpi [aw=wt] if school ==  3, vce(cluster region)
esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g)
eststo clear

eststo clear
    eststo: quietly xi: reg totexp c.mildth##i.year i.region grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income milpi [aw=wt] if school ==  1, vce(cluster region)
    eststo: quietly xi: reg totexp c.mildth##i.year i.region grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income milpi [aw=wt] if school ==  2, vce(cluster region)
    eststo: quietly xi: reg totexp c.mildth##i.year i.region grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income milpi [aw=wt] if school ==  3, vce(cluster region)
esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g)
eststo clear

eststo clear
    eststo: quietly xi: reg totexp c.milcfm##i.year i.region grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income milpi [aw=wt] if school ==  1, vce(cluster region)
    eststo: quietly xi: reg totexp c.milcfm##i.year i.region grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income milpi [aw=wt] if school ==  2, vce(cluster region)
    eststo: quietly xi: reg totexp c.milcfm##i.year i.region grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income milpi [aw=wt] if school ==  3, vce(cluster region)
esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label
eststo clear

eststo clear
    eststo: quietly xi: reg totexp c.milcfm i.year i.region grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income milpi [aw=wt] if school ==  1, vce(cluster region)
    eststo: quietly xi: reg totexp c.milcfm i.year i.region grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income milpi [aw=wt] if school ==  2, vce(cluster region)
    eststo: quietly xi: reg totexp c.milcfm i.year i.region grade sex childnum childord agemom agepap edupap edumom i.jobstat i.income milpi [aw=wt] if school ==  3, vce(cluster region)
esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label
eststo clear

eststo clear
    eststo: quietly xi: reg totexp c.milcfm i.year i.region grade sex childnum childord ib(3).agemom ib(3).agepap i.edupap i.edumom i.jobstat i.income milpi [aw=wt] if school ==  1, vce(cluster region)
    eststo: quietly xi: reg totexp c.milcfm i.year i.region grade sex childnum childord ib(3).agemom ib(3).agepap i.edupap i.edumom i.jobstat i.income milpi [aw=wt] if school ==  2, vce(cluster region)
    eststo: quietly xi: reg totexp c.milcfm i.year i.region grade sex childnum childord ib(3).agemom ib(3).agepap i.edupap i.edumom i.jobstat i.income milpi [aw=wt] if school == 3, vce(cluster region)
esttab, se bracket star(* 0.10 ** 0.05 *** 0.01) stats(r2 N N_g) label
eststo clear
    
