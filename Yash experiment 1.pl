% Facts
male(rahul).
male(amit).
female(priya).
female(neha).

parent(rahul, amit).
parent(priya, amit).
parent(amit, neha).

% Rules
father(X, Y) :- male(X), parent(X, Y).
mother(X, Y) :- female(X), parent(X, Y).
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).
