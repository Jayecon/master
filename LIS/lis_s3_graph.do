use $kr20h , clear
*가구 소득의 누적분포와 누적가구비율 계산
glcurve hitotal [aw=hwgt], p(p) gl(g) nograph
* 로렌츠 곡선 그리기
twoway (line g p, sort lwidth(medium)) ///
       (line p p, sort lpattern(dash) lcolor(gray)), ///
       legend(off) ///
       title("Lorenz Curve") ///
       xtitle("Cumulative Population Share") ///
       ytitle("Cumulative Income Share")
graphexportpdf $mypdf/graphteststata
