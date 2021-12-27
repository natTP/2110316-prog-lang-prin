% From the book
% PROLOG PROGRAMMING IN DEPTH
% by Michael A. Covington, Donald Nute, and Andre Vellino
% (Prentice Hall, 1997).
% Copyright 1997 Prentice-Hall, Inc.
% For educational use only

% File FAMILY.PL
% Part of a family tree expressed in Prolog

% In father/2, mother/2, and parent/2,
% first arg. is parent and second arg. is child.

father(michael,cathy).
father(michael,sharon).
father(charles_gordon,michael).
father(charles_gordon,julie).
father(charles,charles_gordon).
father(jim,melody).
father(jim,crystal).
father(elmo,jim).
father(greg,stephanie).
father(greg,danielle).

mother(melody,cathy).
mother(melody,sharon).
mother(hazel,michael).
mother(hazel,julie).
mother(eleanor,melody).
mother(eleanor,crystal).
mother(crystal,stephanie).
mother(crystal,danielle).

parent(X,Y) :- father(X,Y).
parent(X,Y) :- mother(X,Y).


is_a_grandmother(X):-mother(X,Y), parent(Y,Z).

parentMoreThan1(X):-parent(X,Y),parent(X,Z),Y\==Z.
parent2Children(X):-parent(X,Y),parent(X,Z),Y\==Z,\+ (parent(X,Z2),Z2\==Y,Z2\==Z).
% hasNoMaleHeir(X):-male(X),\+ (ancestor(X,_)).

ancestor(A,B):-parent(A,B).
ancestor(A,B):-parent(A,Z),ancestor(Z,B).
