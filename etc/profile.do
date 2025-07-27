capture program drop cdgit
program cdgit
    cd ~/github/data/`1'
end

capture program drop cdbox
program cdbox
    cd ~/dropbox
end

capture program drop cdata
program cdata
    cd ~/dropbox/data/`1'
end

capture program drop lsd
program lsd
    ls *.dta
end

capture program drop lsx
program lsx
    ls *.xls*
end

capture program drop lsp
program lsp
    ls *.pdf
end

capture program drop lsa
program lsa
    ls *`1'*
end

capture program drop lsf
program lsf
    ! ls -d */
end
