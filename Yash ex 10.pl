% Objective function
objective(X, V) :-
    V is 100 - (X - 5) * (X - 5).

% Generate random neighbouring state
random_neighbor(X, Y) :-
    random_between(-1, 1, Step),
    Y is X + Step.

% Simulated Annealing
simulated_annealing(X, T, Best) :-
    ( T < 0.1 ->
        Best = X
    ;
        random_neighbor(X, Y),
        objective(X, VX),
        objective(Y, VY),
        ( VY > VX ->
            Next = Y
        ;
            random_float(R),
            P is exp((VY - VX) / T),
            ( R < P -> Next = Y ; Next = X )
        ),
        NewT is T * 0.9,
        simulated_annealing(Next, NewT, Best)
    ).
