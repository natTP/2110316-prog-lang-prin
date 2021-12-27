% From the book
% PROLOG PROGRAMMING IN DEPTH
% by Michael A. Covington, Donald Nute, and Andre Vellino
% (Prentice Hall, 1997).
% Copyright 1997 Prentice-Hall, Inc.
% For educational use only

% File INTERAC.PL
% Simple interactive program


:- dynamic capital_of/2.
capital_of(georgia,atlanta).
capital_of(florida,tallahassee).

go :- write('What state do you want to know about?'),nl,
      write('Type its name, all lower case, followed by a period.'),nl,
      read(State),
      capital_of(State,City),
      write('Its capital is: '),write(City),nl.
