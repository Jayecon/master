cd ~/dropbox/pees
set matsize 5000
pause on
local controlvars sex childnum childord agemom agepap edupap edumom pinumpop insnumpop i.year i.jobstat i.income 

use pees_a if school != 4 & totexp >0, clear

eststo clear
	qui bys school : eststo: quietly reg totexp c.yconfirmed##i.region `controlvars' [aw=wt] , vce(cluster region)
	qui bys school : eststo: quietly reg totexp c.ydeath##i.region `controlvars' [aw=wt] , vce(cluster region)
	esttab , se stats(r2 N) ///
        nodepvar nonumber nobaselevel interaction(" X ") label star (* 0.05 ** 0.01 *** 0.001) /// 
        order(yconfirmed ydeath) ///
        indicate("통제 = sex childnum childord agemom agepap edupap edumom pinumpop insnumpop *#* *.region *.jobstat *.income") ///
        title(총사교육비) 
    
eststo clear
	qui bys school : eststo: quietly reg totexp c.hconfirmed##i.region `controlvars' [aw=wt] , vce(cluster region)
	qui bys school : eststo: quietly reg totexp c.hdeath##i.region `controlvars' [aw=wt] , vce(cluster region)
	esttab , se stats(r2 N) ///
        nodepvar nonumber nobaselevel interaction(" X ") label star (* 0.05 ** 0.01 *** 0.001) /// 
        order(hconfirmed hdeath) ///
        indicate("통제 = sex childnum childord agemom agepap edupap edumom pinumpop insnumpop *#* *.region *.jobstat *.income") ///
        title(총사교육비) 
    
eststo clear
	qui bys school : eststo: quietly reg totexp c.rconfirmed##i.region `controlvars' [aw=wt] , vce(cluster region)
	qui bys school : eststo: quietly reg totexp c.rdeath##i.region `controlvars' [aw=wt] , vce(cluster region)
	esttab , se stats(r2 N) ///
        nodepvar nonumber nobaselevel interaction(" X ") label star (* 0.05 ** 0.01 *** 0.001) /// 
        order(rconfirmed rdeath) ///
        indicate("통제 = sex childnum childord agemom agepap edupap edumom pinumpop insnumpop *#* *.region *.jobstat *.income") ///
        title(총사교육비) 
    
/*eststo clear*/
	/*qui bys school : eststo: quietly reg tothour c.yconfirmed##i.region `controlvars' [aw=wt] , vce(cluster region)*/
	/*qui bys school : eststo: quietly reg tothour c.ydeath##i.region `controlvars' [aw=wt] , vce(cluster region)*/
	/*esttab , se stats(r2 N) ///*/
        /*nodepvar nonumber nobaselevel interaction(" X ") label star (* 0.05 ** 0.01 *** 0.001) /// */
        /*order(yconfirmed ydeath) ///*/
        /*indicate("통제 = sex childnum childord agemom agepap edupap edumom pinumpop insnumpop *#* *.region *.jobstat *.income") ///*/
        /*title(총사교육시간) */

/*eststo clear*/
	/*qui bys school : eststo: quietly reg genexp c.yconfirmed##i.region `controlvars' [aw=wt] , vce(cluster region)*/
	/*qui bys school : eststo: quietly reg genexp c.ydeath##i.region `controlvars' [aw=wt] , vce(cluster region)*/
	/*esttab , se stats(r2 N) ///*/
        /*nodepvar nonumber nobaselevel interaction(" X ") label star (* 0.05 ** 0.01 *** 0.001) /// */
        /*order(yconfirmed ydeath) ///*/
        /*indicate("통제 = sex childnum childord agemom agepap edupap edumom pinumpop insnumpop *#* *.region *.jobstat *.income") ///*/
        /*title(일반교과사교육비) */

/*eststo clear*/
	/*qui bys school : eststo: quietly reg genhour c.yconfirmed##i.region `controlvars' [aw=wt] , vce(cluster region)*/
	/*qui bys school : eststo: quietly reg genhour c.ydeath##i.region `controlvars' [aw=wt] , vce(cluster region)*/
	/*esttab , se stats(r2 N) ///*/
        /*nodepvar nonumber nobaselevel interaction(" X ") label star (* 0.05 ** 0.01 *** 0.001) /// */
        /*order(yconfirmed ydeath) ///*/
        /*indicate("통제 = sex childnum childord agemom agepap edupap edumom pinumpop insnumpop *#* *.region *.jobstat *.income") ///*/
        /*title(일반교과사교육시간) */

/*eststo clear*/
	/*qui bys school : eststo: quietly reg netexp c.yconfirmed##i.region `controlvars' [aw=wt] , vce(cluster region)*/
	/*qui bys school : eststo: quietly reg netexp c.ydeath##i.region `controlvars' [aw=wt] , vce(cluster region)*/
	/*esttab , se stats(r2 N) ///*/
        /*nodepvar nonumber nobaselevel interaction(" X ") label star (* 0.05 ** 0.01 *** 0.001) /// */
        /*order(yconfirmed ydeath) ///*/
        /*indicate("통제 = sex childnum childord agemom agepap edupap edumom pinumpop insnumpop *#* *.region *.jobstat *.income") ///*/
        /*title(일반교과온라인사교육비) */

/*use pees_c if school != 4, clear*/

/*eststo clear*/
	/*qui bys school : eststo: quietly reg totexp c.yconfirmed##i.region `controlvars' [aw=wt] , vce(cluster region)*/
	/*qui bys school : eststo: quietly reg totexp c.yconfirmed##i.region grade `controlvars' [aw=wt] , vce(cluster region)*/
	/*esttab , se stats(r2 N) ///*/
        /*nodepvar nonumber nobaselevel interaction(" X ") label star (* 0.05 ** 0.01 *** 0.001) /// */
        /*order(yconfirmed ) ///*/
        /*indicate("학년 = grade" "통제 = sex childnum childord agemom agepap edupap edumom pinumpop insnumpop *#* *.region *.jobstat *.income") ///*/
        /*title(총사교육비) */

/*eststo clear*/
	/*qui bys school : eststo: quietly reg totexp c.ydeath##i.region `controlvars' [aw=wt] , vce(cluster region)*/
	/*qui bys school : eststo: quietly reg totexp c.ydeath##i.region grade `controlvars' [aw=wt] , vce(cluster region)*/
	/*esttab , se stats(r2 N) ///*/
        /*nodepvar nonumber nobaselevel interaction(" X ") label star (* 0.05 ** 0.01 *** 0.001) /// */
        /*order(ydeath) ///*/
        /*indicate("학년 = grade" "통제 = sex childnum childord agemom agepap edupap edumom pinumpop insnumpop *#* *.region *.jobstat *.income") ///*/
        /*title(총사교육비) */

/*use pees_a if school != 4, clear*/

/*eststo clear*/
	/*qui bys school : eststo: quietly reg totexp c.hconfirmed##i.region `controlvars' [aw=wt] , vce(cluster region)*/
	/*qui bys school : eststo: quietly reg totexp c.hdeath##i.region `controlvars' [aw=wt] , vce(cluster region)*/
	/*esttab , se stats(r2 N) ///*/
        /*nodepvar nonumber nobaselevel interaction(" X ") label star (* 0.05 ** 0.01 *** 0.001) /// */
        /*order(hconfirmed hdeath) ///*/
        /*indicate("통제 = sex childnum childord agemom agepap edupap edumom pinumpop insnumpop *#* *.region *.jobstat *.income") ///*/
        /*title(총사교육비) */

/*eststo clear*/
	/*qui bys school : eststo: quietly reg tothour c.hconfirmed##i.region `controlvars' [aw=wt] , vce(cluster region)*/
	/*qui bys school : eststo: quietly reg tothour c.hdeath##i.region `controlvars' [aw=wt] , vce(cluster region)*/
	/*esttab , se stats(r2 N) ///*/
        /*nodepvar nonumber nobaselevel interaction(" X ") label star (* 0.05 ** 0.01 *** 0.001) /// */
        /*order(hconfirmed hdeath) ///*/
        /*indicate("통제 = sex childnum childord agemom agepap edupap edumom pinumpop insnumpop *#* *.region *.jobstat *.income") ///*/
        /*title(총사교육시간) */

/*eststo clear*/
	/*qui bys school : eststo: quietly reg genexp c.hconfirmed##i.region `controlvars' [aw=wt] , vce(cluster region)*/
	/*qui bys school : eststo: quietly reg genexp c.hdeath##i.region `controlvars' [aw=wt] , vce(cluster region)*/
	/*esttab , se stats(r2 N) ///*/
        /*nodepvar nonumber nobaselevel interaction(" X ") label star (* 0.05 ** 0.01 *** 0.001) /// */
        /*order(hconfirmed hdeath) ///*/
        /*indicate("통제 = sex childnum childord agemom agepap edupap edumom pinumpop insnumpop *#* *.region *.jobstat *.income") ///*/
        /*title(일반교과사교육비) */

/*eststo clear*/
	/*qui bys school : eststo: quietly reg genhour c.hconfirmed##i.region `controlvars' [aw=wt] , vce(cluster region)*/
	/*qui bys school : eststo: quietly reg genhour c.hdeath##i.region `controlvars' [aw=wt] , vce(cluster region)*/
	/*esttab , se stats(r2 N) ///*/
        /*nodepvar nonumber nobaselevel interaction(" X ") label star (* 0.05 ** 0.01 *** 0.001) /// */
        /*order(hconfirmed hdeath) ///*/
        /*indicate("통제 = sex childnum childord agemom agepap edupap edumom pinumpop insnumpop *#* *.region *.jobstat *.income") ///*/
        /*title(일반교과사교육시간) */

/*eststo clear*/
	/*qui bys school : eststo: quietly reg netexp c.hconfirmed##i.region `controlvars' [aw=wt] , vce(cluster region)*/
	/*qui bys school : eststo: quietly reg netexp c.hdeath##i.region `controlvars' [aw=wt] , vce(cluster region)*/
	/*esttab , se stats(r2 N) ///*/
        /*nodepvar nonumber nobaselevel interaction(" X ") label star (* 0.05 ** 0.01 *** 0.001) /// */
        /*order(hconfirmed hdeath) ///*/
        /*indicate("통제 = sex childnum childord agemom agepap edupap edumom pinumpop insnumpop *#* *.region *.jobstat *.income") ///*/
        /*title(일반교과온라인사교육비) */

/*use pees_c if school != 4, clear*/

/*eststo clear*/
	/*qui bys school : eststo: quietly reg totexp c.hconfirmed##i.region `controlvars' [aw=wt] , vce(cluster region)*/
	/*qui bys school : eststo: quietly reg totexp c.hconfirmed##i.region grade `controlvars' [aw=wt] , vce(cluster region)*/
	/*esttab , se stats(r2 N) ///*/
        /*nodepvar nonumber nobaselevel interaction(" X ") label star (* 0.05 ** 0.01 *** 0.001) /// */
        /*order(hconfirmed ) ///*/
        /*indicate("학년 = grade" "통제 = sex childnum childord agemom agepap edupap edumom pinumpop insnumpop *#* *.region *.jobstat *.income") ///*/
        /*title(총사교육비) */

/*eststo clear*/
	/*qui bys school : eststo: quietly reg totexp c.hdeath##i.region `controlvars' [aw=wt] , vce(cluster region)*/
	/*qui bys school : eststo: quietly reg totexp c.hdeath##i.region grade `controlvars' [aw=wt] , vce(cluster region)*/
	/*esttab , se stats(r2 N) ///*/
        /*nodepvar nonumber nobaselevel interaction(" X ") label star (* 0.05 ** 0.01 *** 0.001) /// */
        /*order(hdeath) ///*/
        /*indicate("학년 = grade" "통제 = sex childnum childord agemom agepap edupap edumom pinumpop insnumpop *#* *.region *.jobstat *.income") ///*/
        /*title(총사교육비) */

/*////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*use pees_a if school != 4, clear*/

/*local controlvars sex childnum childord agemom agepap edupap edumom pinumpop insnumpop i.year i.jobstat i.school*/
/*local depvar      net*/
/*local titlename : var label `depvar'*/

/*eststo clear*/
    /*qui bys income : eststo: quietly reg `depvar' c.hconfirmed##i.region `controlvars' [aw=wt] , vce(cluster region)*/
    /*esttab , se stats(r2 N) ///*/
        /*nodepvar nonumber nobaselevel interaction(" X ") label star (* 0.05 ** 0.01 *** 0.001) /// */
        /*indicate("통제 = sex childnum childord agemom agepap edupap edumom pinumpop insnumpop *#* *.region *.jobstat *.school ") ///*/
        /*title("`titlename'") */

/*local controlvars sex childnum childord agemom agepap edupap edumom pinumpop insnumpop i.year i.jobstat*/
/*local depvar      totexp*/
/*local titlename : var label `depvar'*/

/*eststo clear*/
    /*qui bys income : eststo: quietly reg `depvar' c.hconfirmed##i.region `controlvars' if school == 3 [aw=wt] , vce(cluster region)*/
    /*esttab , se stats(r2 N) ///*/
        /*nodepvar nonumber nobaselevel interaction(" X ") label star (* 0.05 ** 0.01 *** 0.001) /// */
        /*indicate("통제 = sex childnum childord agemom agepap edupap edumom pinumpop insnumpop *#* *.region *.jobstat ") ///*/
        /*title("`titlename'") */
