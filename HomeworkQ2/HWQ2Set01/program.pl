:-reconsult('data.pl').
:- dynamic bomb/1.

start:-
    write('Player1, please select a position for the bomb (1-3).'),
    getFromAsk(BombPos),
    retract(bomb(X)),
    asserta(bomb(BombPos)),
    write('Player2, please pick a position (1-3). Avoid the bomb!'),
    getFromAsk(Guess),
    findWinner(Guess).

getFromAsk(Pos):-
    get(Input),
    interpret(Input, Pos).
interpret(49, 1).
interpret(50, 2).
interpret(51, 3).

findWinner(Guess):-
    bomb(Guess),
    incrementWins(player1),
    write('You picked the bomb! Player1 wins.').
findWinner(Guess):-
    \+ bomb(Guess),
    incrementWins(player2),
    write('You avoided the bomb! Player2 wins.').

incrementWins(Player):-
    retract(wins(Player, X)),
    Y is(X+1),
    asserta(wins(Player, Y)).

save:-
    tell('data.pl'),
    listing(wins/2),
    listing(bomb/1),
    told,
    write('Saved.').

printRec:-
    listing(wins/2).
    