set more off
set maxvar 30000
cd ~/dropbox/data/goms
    /*list of common variables */
    local varlist00 ///
        pid age birthy sex area province graduy gradum majorcat major school wt     /// drmographic info*/ 
        a001-a002 a003 a004_10-a006_10 a007a_2018-a009_2018 a010 a011 a012 a014     ///
        a020 a021 a022 a023 a024 a116-a118 a120-a122 a142-a144                      /// present job*/ 
        d001-d006 d110-d112 e001-e006 e078-e081 e153-e156                           /// past job exp*/ 
        f001-f002 f006-f009 f010-f012 f073-f074 f101 f102 f104 f108 f112 f116 f120  /// education*/ 
        h001 h002 h020 h040 h060                                                    /// jobs on univ */ 
        l001 l003 m001 m002                                                         /// traininigs and cert.*/ 
        p014 p026-p031z p032-p033 p034 p035 p045                                      /*parents info */ 

    use goms_eq_raw , clear
    foreach i of local varlist00 {
        de `i'??
    }
