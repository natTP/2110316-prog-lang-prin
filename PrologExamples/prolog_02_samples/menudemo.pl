% From the book
% PROLOG PROGRAMMING IN DEPTH
% by Michael A. Covington, Donald Nute, and Andre Vellino
% (Prentice Hall, 1997).
% Copyright 1997 Prentice-Hall, Inc.
% For educational use only

% File  MENUDEMO.PL
% Illustrates accepting input from a menu

% Knowledge base

capital_of(georgia,atlanta).
capital_of(california,sacramento).
capital_of(florida,tallahassee).
capital_of(maine,augusta).

% Procedures to interact with user

start :-  display_menu,
          get_from_menu(State),
          capital_of(State,City),
          nl,
          write('The capital of '),
          write(State),
          write(' is '),
          write(City),
          nl.

display_menu :- write('Which state do you want to know about?'),nl,
                write(' 1  Georgia'),nl,
                write(' 2  California'),nl,
                write(' 3  Florida'),nl,
                write(' 4  Maine'),nl,
                write('Type a number, 1 to 4 -- ').

get_from_menu(State) :-  get(Code),  % read a character
                         %get0(_),    % consume the Return keystroke
                         interpret(Code,State).

interpret(49,georgia).      /* ASCII 49 = '1' */
interpret(50,california).   /* ASCII 50 = '2' */
interpret(51,florida).      /* ASCII 51 = '3' */
interpret(52,maine).        /* ASCII 52 = '4' */
    