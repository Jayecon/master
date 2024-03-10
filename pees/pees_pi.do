cd ~/dropbox/pees
clear
import excel "~\Dropbox\PEES\rawdata\2019-21_교육통계연보_사설학원 개황.xlsx", sheet("27-1.사설학원 개황") firstrow
  drop K-Y
  drop if missing(TO)
    replace region = "32"  if inlist( region , "강원" , "강 원" )
    replace region = "31"  if inlist( region , "경기" , "경 기" )
    replace region = "38"  if inlist( region , "경남" , "경 남" )
    replace region = "37"  if inlist( region , "경북" , "경 북" )
    replace region = "24"  if inlist( region , "광주" , "광 주" )
    replace region = "22"  if inlist( region , "대구" , "대 구" )
    replace region = "25"  if inlist( region , "대전" , "대 전" )
    replace region = "21"  if inlist( region , "부산" , "부 산" )
    replace region = "11"  if inlist( region , "서울" , "서 울" )
    replace region = "29"  if inlist( region , "세종" , "세 종" )
    replace region = "26"  if inlist( region , "울산" , "울 산" )
    replace region = "23"  if inlist( region , "인천" , "인 천" )
    replace region = "36"  if inlist( region , "전남" , "전 남" )
    replace region = "35"  if inlist( region , "전북" , "전 북" )
    replace region = "39"  if inlist( region , "제주" , "제 주" )
    replace region = "34"  if inlist( region , "충남" , "충 남" )
    replace region = "33"  if inlist( region , "충북" , "충 북" )
    destring region , replace
    label define REGION  32 "강원" 31 "경기" 38 "경남" ///
      37 "경북" 24 "광주" 22 "대구" 25 "대전" 21 "부산" ///
      11 "서울" 29 "세종" 26 "울산" 23 "인천" 36 "전남" ///
      35 "전북" 39 "제주" 34 "충남" 33 "충북" 99 "검역"
    label value region REGION
  rename PrivateInstitutes  pinum
    label var pinum "학원수"
  rename TO                 pito  
    label var pito "정원"
  rename Instructors        insnum 
    label var insnum "강사수"
  rename Classrooms         picnum 
  label var picnum "강의실수"
  rename hourmax            thourmax
  label var thourmax "월평균최고교습시간"
  rename hourmin            thourmin
  label var thourmin "월평균최소교습시간"
  rename feesmax            tfeemax
  label var tfeemax "월평균최고교습비(원)"
  rename feesmin            tfeemin
  label var tfeemin "월평균최저교습비(원)"
label data "사설학원개황(2019-21)"
save rawdata/pisummary.dta , replace
