cd C:\170818sci
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
