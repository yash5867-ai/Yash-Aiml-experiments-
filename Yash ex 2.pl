% Arithmetic operations
add(X, Y, R) :- R is X + Y.
subtract(X, Y, R) :- R is X - Y.
multiply(X, Y, R) :- R is X * Y.
divide(X, Y, R) :- Y =\= 0, R is X / Y.

% Factorial
factorial(0, 1).
factorial(N, F) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.

% Fibonacci
fib(0, 0).
fib(1, 1).
fib(N, F) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fib(N1, F1),
    fib(N2, F2),
    F is F1 + F2.
