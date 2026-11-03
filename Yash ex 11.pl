% Available colors
color(red).
color(green).
color(blue).

% Map coloring constraints
map_coloring(A, B, C, D) :-
    color(A),
    color(B),
    color(C),
    color(D),

    A \= B,
    A \= C,
    B \= C,
    B \= D,
    C \= D.

% A, B, C, D represent four regions
