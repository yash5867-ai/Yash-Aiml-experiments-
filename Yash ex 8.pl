% Graph edges with costs
edge(a, b, 1).
edge(a, c, 4).
edge(b, d, 2).
edge(b, e, 5).
edge(c, f, 2).
edge(d, g, 5).
edge(e, g, 1).
edge(f, g, 3).

% Heuristic values
heuristic(a, 7).
heuristic(b, 6).
heuristic(c, 4).
heuristic(d, 5).
heuristic(e, 1).
heuristic(f, 3).
heuristic(g, 0).

% A* search
astar(Start, Goal, Path, Cost) :-
    astar_search([[0, Start, [Start]]],
                 Goal, Path, Cost).

astar_search([[Cost, Goal, RevPath]|_],
             Goal, Path, Cost) :-
    reverse(RevPath, Path).

astar_search([[G, Node, RevPath]|Open],
             Goal, Path, Cost) :-
    findall(
        [F, Next, [Next|RevPath]],
        (edge(Node, Next, Step),
         \+ member(Next, RevPath),
         NewG is G + Step,
         heuristic(Next, H),
         F is NewG + H),
        Children
    ),
    append(Open, Children, NewOpen),
    sort(NewOpen, Sorted),
    astar_search(Sorted, Goal, Path, Cost).
