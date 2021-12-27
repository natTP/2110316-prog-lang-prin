% From the book
% PROLOG PROGRAMMING IN DEPTH
% by Michael A. Covington, Donald Nute, and Andre Vellino
% (Prentice Hall, 1997).
% Copyright 1997 Prentice-Hall, Inc.
% For educational use only

% File CAPITALS.PL or KB.PL
% Knowledge base for several examples in Chapter 2

:- dynamic(capital_of/2).      % Remove if not needed. See text, section 2.8.

capital_of(georgia,atlanta).
capital_of(california,sacramento).
capital_of(florida,tallahassee).
capital_of(maine,augusta).

print_a_capital :- capital_of(State,City), write(City), write(' is the capital of '), write(State), nl.

print_capitals :- print_a_capital, fail.
print_capitals.




