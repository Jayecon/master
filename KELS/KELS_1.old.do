local path "~/dropbox/kels/rawdata/"
cd `path'

import excel "`path'KELS_Y1_parents_published.xlsx", sheet("Recovered_Sheet1") firstrow clear
  save KELS_Y1_parents, replace

import excel "`path'KELS_Y1_student_evaluation_published.xlsx", sheet("Recovered_Sheet1") firstrow clear
  save KELS_Y1_student_evaluation, replace

import excel "`path'KELS_Y1_student_survey_published.xlsx", sheet("Recovered_Sheet1") firstrow clear
  save KELS_Y1_student_survey, replace

import excel "`path'KELS_Y2_parents_published.xlsx", sheet("Recovered_Sheet1") firstrow clear
  save KELS_Y2_parents, replace

import excel "`path'KELS_Y2_student_evaluation_published.xlsx", sheet("Recovered_Sheet1") firstrow clear
  save KELS_Y2_student_evaluation, replace

import excel "`path'KELS_Y2_student_survey_published.xlsx", sheet("Recovered_Sheet1") firstrow clear
  save KELS_Y2_student_survey, replace

import excel "`path'KELS_Y3_parents_published.xlsx", sheet("Recovered_Sheet1") firstrow clear
  save KELS_Y3_parents, replace

import excel "`path'KELS_Y3_student_evaluation_published.xlsx", sheet("Recovered_Sheet1") firstrow clear
  save KELS_Y3_student_evaluation, replace

import excel "`path'KELS_Y3_student_survey_published.xlsx", sheet("Recovered_Sheet1") firstrow clear
  save KELS_Y3_student_survey, replace

import excel "`path'KELS_Y6_parents_published.xlsx", sheet("Recovered_Sheet1") firstrow clear
  save KELS_Y6_parents, replace

import excel "`path'KELS_Y6_student_evaluation_published.xlsx", sheet("Recovered_Sheet1") firstrow clear
  save KELS_Y6_student_evaluation, replace

import excel "`path'KELS_Y6_student_survey_published.xlsx", sheet("Recovered_Sheet1") firstrow clear
  save KELS_Y6_student_survey, replace

