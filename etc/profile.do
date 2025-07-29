adopath + ~/github/master/ado
set more on
set maxvar 32000

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

capture program drop tt
program define tt
    // 현재 trace 상태를 로컬 매크로에 저장
    local curtrace : set trace

    // 대소문자 구분 없이 소문자로 변환
    local curtrace = lower("`curtrace'")

    // 상태에 따라 toggle
    if "`curtrace'" == "on" {
        di as result "→ Turning trace OFF"
        set trace off
    }
    else {
        di as result "→ Turning trace ON"
        set trace on
    }
end
