  capture program drop cdgit
  program cdgit
    if "`c(os)'" == "MacOSX" {
        cd ~/github/master
    }
    else {
        cd ~/git
    }
  end
  
