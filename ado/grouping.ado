#delimit ;
program define groupby ;
    // 명령줄 인자 구문 설정
    syntax varlist(numeric) [if] [in] [pweight aweight fweight] , by(varname) [GENerate(string) REPlace] ;

    // 변수 목록 보기
    describe `by' ;

    // 변수 요약 통계
    summarize `by' `varlist' ;

    // `v1` 값의 빈도수 및 비율 계산
    tabulate `by', matcell(freq) matrow(perc) ;

    // 고유한 `v1` 값 목록 가져오기
    levelsof `by', local(levels) ;

    // 데이터 내림차순 정렬
    sort `varlist', stable ;
    gen rank = _n ;

    // 총 관측치 수
    local n = _N ;

    // 초기화
    gen `v3' = . ;
    local cumcutoff 0 ;

    // 각 `v1` 값에 대해 반복
    foreach level of local levels { ;
        // 현재 비율 계산
        local perc = perc[1, `level'] ;

        // 현재 비율에 해당하는 컷오프 계산
        local cutoff = floor(`perc' * `n') ;

        // `v3` 값을 그룹화하여 할당
        replace `v3' = `level' if rank > `cumcutoff' & rank <= (`cumcutoff' + `cutoff') ;

        // 누적 컷오프 업데이트
        local cumcutoff = `cumcutoff' + `cutoff' ;
    }

    // 결과 확인
    list `by' `varlist' `v3' if !mi(`v3'), sep(0) ;
end ;
