% N-Queens problem

queens(N, Solution) :-
    numlist(1, N, Columns),
    permutation(Columns, Solution),
    safe(Solution).

% Check whether queens are safe
safe([]).
safe([Q|Others]) :-
    safe(Others),
    no_attack(Q, Others, 1).

% Check diagonal attacks
no_attack(_, [], _).
no_attack(Q, [Next|Others], Distance) :-
    abs(Q - Next) =\= Distance,
    D1 is Distance + 1,
    no_attack(Q, Others, D1).
