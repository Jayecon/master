cd C:\Users\USER\Dropbox\Stata\170818
discard
set more off
capture log close
timer clear 1
log using timss_data , replace
timer on 1
timss_data
timer off 1
timer list 1
log close
