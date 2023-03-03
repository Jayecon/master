local path "~/dropbox/kels/rawdata/"
cd `path'
tempfile temp
  use KELS_Y1_parents, clear
    isid SID
    merge 1:1 SID using  KELS_Y1_student_evaluation , nogen
    isid SID
    merge 1:1 SID using KELS_Y1_student_survey , nogen
    gen byte wave = 1
    save `temp' , replace
  use KELS_Y2_parents, clear
    isid SID
    merge 1:1 SID using   KELS_Y2_student_evaluation , nogen
    isid SID
    merge 1:1 SID using   KELS_Y2_student_survey , nogen
    gen byte wave = 2
    append using `temp' 
    save `temp' , replace
  use KELS_Y3_parents, clear
    isid SID
    merge 1:1 SID using   KELS_Y3_student_evaluation , nogen
    isid SID
    gen byte wave = 3
    merge 1:1 SID using   KELS_Y3_student_survey , nogen
    append using `temp' 
    save `temp' , replace
  use KELS_Y6_parents, clear
    isid SID
    merge 1:1 SID using   KELS_Y6_student_evaluation , nogen
    isid SID
    merge 1:1 SID using   KELS_Y6_student_survey , nogen
    gen byte wave = 6
    rename * Y6*
    rename (Y6SID Y6GENDER Y6SCHID Y6wave) (SID GENDER SCHID wave)
    append using `temp' 
    save `temp' , replace
save KELS_master , replace
