% Student marks
marks(rahul, 95).
marks(amit, 75).
marks(priya, 55).
marks(neha, 30).
marks(rohit, 85).

% Classification rules
classify(X, topper) :-
    marks(X, M),
    M >= 85.

classify(X, average) :-
    marks(X, M),
    M >= 50,
    M < 85.

classify(X, fail) :-
    marks(X, M),
    M < 50.
