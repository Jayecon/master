use ~/dropbox/pisaw2 if cntcod == 410, clear

egen group = group(posses posbok paredu fambrn)
recode group 140 = 1 163 = 2 nonmissing = ., gen(cgroup)
sum *group

gen wgt = round(stuwgt ,1)

reg pv1mrsc posses posbok paredu fambrn [fw=wgt] 
predict res if e(sample) , residual

reg pv1mrsc posses posbok paredu fambrn if cgroup == 1 [fw=wgt] 
predict res1 if e(sample) , residual

reg pv1mrsc posses posbok paredu fambrn if cgroup == 2 [fw=wgt] 
predict res2 if e(sample) , residual

sum  res* pv1mrsc [fw=wgt]

ttest res , by(cgroup)

sdtest res , by(cgroup)

qui sum res [fw=wgt]

local k = 1/r(sd)

qui sum res1 [fw=wgt]

local sd1 = r(sd)

qui sum res2 [fw=wgt]

local sd2 = r(sd)

gen res1a = res1/(`k'*`sd1')

gen res2a = res2/(`k'*`sd2')

sum res* [fw=wgt]

iop pv1mrsc posses posbok paredu fambrn [fw=wgt]

eopcal pv1mrsc posses posbok paredu fambrn [fw=wgt] , bjork(mld,5)
