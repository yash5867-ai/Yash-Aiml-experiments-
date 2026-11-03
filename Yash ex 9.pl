% Objective function
% Maximum value occurs at X = 3
value(X, V) :-
    V is 9 - (X - 3) * (X - 3).

% Generate neighbouring states
neighbor(X, Y) :-
    Y is X + 1.
neighbor(X, Y) :-
    Y is X - 1.

% Hill Climbing
hill_climb(X, Best) :-
    value(X, V),
    findall(Y,
        (neighbor(X, Y),
         value(Y, V1),
         V1 > V),
        Neighbors),
    ( Neighbors = [] ->
        Best = X
    ;
        Neighbors = [Next|_],
        hill_climb(Next, Best)
    ).
