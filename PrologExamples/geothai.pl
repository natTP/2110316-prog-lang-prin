
/* Clause 1 */  is_within(jompol, jatujak).
/* Clause 2 */  is_within(ladyao, jatujak).
/* Clause 3 */  is_within(toongpayathai, patumwan).
/* Clause 4 */  is_within(kualalompur, malaysia).
/* Clause 5 */  is_within(X, bangkok) :- is_within(X, jatujak).
/* Clause 6 */  is_within(X, bangkok) :- is_within(X, patumwan).
/* Clause 7 */  is_within(X, thailand) :- is_within(X, bangkok).
/* Clause 8 */  is_within(X, southeastasia) :- is_within(X, thailand).
/* Clause 9 */  is_within(X, southeastasia) :- is_within(X, malaysia).

