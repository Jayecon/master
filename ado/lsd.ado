  capture program drop lsd
  program lsd
    if "`1'" != "" {
        ls "`1'/*.dta"
    }
    else {
        ls *.dta
    }
  end
