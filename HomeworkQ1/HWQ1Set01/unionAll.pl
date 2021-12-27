in(Item, [Item|Tail]).
in(Item, [Head|Tail]):- in(Item, Tail).

union([], List2, List2).
union([Head|Tail], List2, [Head|Result]):-
    \+ in(Head, List2),
    union(Tail, List2, Result).
union([Head|Tail], List2, Result):-
    in(Head, List2),
    union(Tail, List2, Result).

unionAll([List], List).
unionAll([Head|Tail], Result):-
    unionAll(Tail, SubResult),
    union(Head, SubResult, Result).
    