  capture program drop cdgit
  program cdgit
    if "`c(os)'" == "MacOSX" {
        cd ~/github/master/`1'
    }
    else {
        cd ~/git/`1'
    }
  end
  
