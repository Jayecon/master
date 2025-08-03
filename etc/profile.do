adopath + ~/github/master/ado
set maxvar 32000

capture program drop cdgit
program cdgit
    cd ~/github/master/`1'
end

capture program drop cdbox
program cdbox
    cd ~/dropbox
end

capture program drop cdata
program cdata
    cd ~/dropbox/data/`1'
end

capture program drop lsa
program lsa
    ls *`1'*
end

capture program drop lsf
program lsf
    ! ls -d */
end

capture program drop lsd
program lsd
    if "`1'" != "" {
        ls "`1'/*.dta"
    }
    else {
        ls *.dta
    }
end

capture program drop lsx
program lsx
    if "`1'" != "" {
        ls "`1'/*.xls*"
    }
    else {
        ls *.xls*
    }
end

capture program drop lsp
program lsp
    if "`1'" != "" {
        ls "`1'/*.pdf"
    }
    else {
        ls *.pdf
    }
end
