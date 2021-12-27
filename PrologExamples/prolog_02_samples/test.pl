:- dynamic(f/0).
:- dynamic(count/1).
count(0).
test :- f, retract(count(N)), N2 is N+1, asserta(count(N2)), write('even number of times = '), write(N2), nl, retract(f).

test :- \+ f, asserta(f), retract(count(N)), N2 is N+1, asserta(count(N2)),write('odd numbers of time = '), write(N2), nl.

:- write('To start this program, type ''test.''.').
