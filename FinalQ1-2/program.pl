:- reconsult('noteData.pl').
:- reconsult('noteList.pl').
:- dynamic note/1.
:- dynamic num/2.
:- dynamic noteList/2.

% ----- Program Features -------

new :-
    getNote(Note),
    addNoteToList(normal, Note),
    asserta(note(Note)),
    show.

pin :- num(normal, 0),
    write('No line to pin.').

pin :-
    getLine(normal, Line),
    noteList(normal, NormalList),
    find(Line, 1, NormalList, Note),
    addNoteToList(pinned, Note),
    removeNoteFromList(normal, Note),
    show.

unpin :- num(pinned, 0),
    write('No line to unpin.').

unpin :- 
    getLine(pinned, Line),
    noteList(pinned, PinnedList),
    find(Line, 1, PinnedList, Note),
    addNoteToList(normal, Note),
    removeNoteFromList(pinned, Note),
    show.

delLine :- num(normal, 0),
    write('No line to delete.').

delLine :-
    getLine(normal, Line),
    noteList(normal, NormalList),
    find(Line, 1, NormalList, Note),
    removeNoteFromList(normal, Note),
    retract(note(Note)),
    show.

% ----- Accept Input -------

getNote(Note) :-
    write('Please type new text.'), nl,
    read(Note).

getLine(Type, NewLine) :-
    write('Which line of '), write(Type), write(' text would you like to choose?'), nl,
    read(Line),
    validLine(Type, Line, NewLine).

validLine(Type, Line, Line) :- 
    num(Type, X), 
    1 =< Line, Line =< X, !.
validLine(Type, _, NewLine) :-
    write('Invalid input. Please try again'), nl,
    getLine(Type, NewLine).

% ----- Utilities -------

increment(Type) :-
    retract(num(Type, X)),
    Y is(X+1),
    asserta(num(Type, Y)).

decrement(Type) :-
    retract(num(Type, X)),
    Y is(X-1),
    asserta(num(Type, Y)).

addNoteToList(Type, Note) :-
    noteList(Type, List),
    increment(Type),
    insert(note(Note), List, NewList),
    retract(noteList(Type, List)),
    asserta(noteList(Type, NewList)).

removeNoteFromList(Type, Note) :-
    noteList(Type, List),
    decrement(Type),
    del(note(Note), List, NewList),
    retract(noteList(Type, List)),
    asserta(noteList(Type, NewList)).

find(Line, Id, [note(Note)|_], Note) :- Id == Line.
find(Line, Id, [_|T], Note) :- 
    Id < Line, 
    NewId is(Id+1),
    find(Line, NewId, T, Note).

% ----- List Insert & Delete -------

insert(X, L, [X|L]).

del(_, [], []).
del(X, [X|T], T).
del(X, [H|T], [H|NewT]) :- X\==H, del(X,T,NewT).

% ----- Show & Save -------

show([], 1).
show([note(Note)], Id) :-
    write(Id), write(': '), write(Note), nl.
show([note(Note),Y|T], Id) :-
    write(Id), write(': '), write(Note), nl,
    NextId is(Id+1),
    show([Y|T], NextId).

show :-
    noteList(pinned, PinnedList),
    show(PinnedList, 1),
    write('---------------'), nl,
    noteList(normal, NormalList),
    show(NormalList, 1).

save :-
    tell('noteData.pl'),
    listing(num/2),
    listing(note/1),
    told,
    tell('noteList.pl'),
    listing(noteList/2),
    told.