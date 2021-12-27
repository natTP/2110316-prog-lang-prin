:- reconsult('tvshowData.pl').
:- reconsult('tvshowList.pl').
:- reconsult('validDays.pl').
:- dynamic day/1.
:- dynamic showList/2.
:- dynamic tvshow/3.

% ----- Accept Input -------

getName(Name) :-
    write('Type the name of the TV program.'), nl,
    read(Name). 
 
getDay(NewDay) :-
    write('Type the day of the TV program.'), nl,
    read(Day),
    validDay(Day, NewDay).

validDay(Day, Day) :- day(Day).
validDay(Day, NewDay) :-
    \+ day(Day),
    write('Invalid day of week.'), nl,
    getDay(NewDay).

getTime(Time):-
    write('Type the time of the TV program.'), nl,
    read(Time).

% ----- Sort List -------

insert(X, [], [X]) :- !.
insert(tvshow(XName, XDay, XTime), [tvshow(YName, YDay, YTime)|T], [tvshow(XName, XDay, XTime),tvshow(YName, YDay, YTime)|T]) :- XTime=<YTime, !.
insert(X, [Y|T], [Y|T1]) :- insert(X, T, T1).

deleteName(X) :-
    day(Day),
    showList(Day, List),
    delete(List, tvshow(X,_,_), NewList),
    retract(showList(Day, List)),
    asserta(showList(Day, NewList)),
    fail.

% ----- Display List -------

showByDay([]).
showByDay([tvshow(XName, _, XTime)]) :-
    write(XName), write(', '), write(XTime).
showByDay([tvshow(XName, _, XTime), Y|T]) :-
    write(XName), write(', '), write(XTime), nl,
    showByDay([Y|T]).  

showByName(XName) :-
    tvshow(XName, XDay, XTime),
    write(XDay), write(', '), write(XTime), nl,
    fail.

% ----- Program Features -------

input :-
    getName(InputName),
    getDay(InputDay),
    getTime(InputTime),
    showList(InputDay, List),
    insert(tvshow(InputName, InputDay, InputTime), List, NewList),
    retract(showList(InputDay, List)),
    asserta(showList(InputDay, NewList)),
    assertz(tvshow(InputName, InputDay, InputTime)),
    write(InputName), write(', '), write(InputDay), write(', '), write(InputTime).  

dayView :-
    getDay(InputDay),
    showList(InputDay, List),
    showByDay(List).

programView :-
    getName(InputName),
    showByName(InputName). 

removeAll :-
    getName(InputName),
    retractall(tvshow(InputName,_,_)),
    deleteName(InputName).

quit :-
    tell('tvshowData.pl'),
    listing(tvshow/3),
    told,
    tell('tvShowList.pl'),
    listing(showList/2),
    told.