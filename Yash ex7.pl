% Graph
edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(e, g).
edge(f, g).

% Heuristic values
heuristic(a, 7).
heuristic(b, 6).
heuristic(c, 4).
heuristic(d, 5).
heuristic(e, 2).
heuristic(f, 3).
heuristic(g, 0).

% Greedy Best-First Search
greedy(Start, Goal, Path) :-
    greedy_search([[Start]], Goal, RevPath),
    reverse(RevPath, Path).

greedy_search([[Goal|Rest]|_], Goal, [Goal|Rest]).

greedy_search(Paths, Goal, Result) :-
    select_best(Paths, [Current|Rest], Remaining),
    findall(
        [Next,Current|Rest],
        (edge(Current, Next),
         \+ member(Next, [Current|Rest])),
        NewPaths
    ),
    append(Remaining, NewPaths, Updated),
    sort_paths(Updated, Sorted),
    greedy_search(Sorted, Goal, Result).

select_best([P|Ps], Best, Rest) :-
    select_best_helper(Ps, P, Best, Rest).

select_best_helper([], Best, Best, []).
select_best_helper([P|Ps], Current, Best, Rest) :-
    P = [Node|_],
    Current = [CurrentNode|_],
    heuristic(Node, H1),
    heuristic(CurrentNode, H2),
    ( H1 < H2 ->
        select_best_helper(Ps, P, Best, R),
        Rest = [Current|R]
    ;
        select_best_helper(Ps, Current, Best, R),
        Rest = [P|R]
    ).

sort_paths(Paths, Sorted) :-
    predsort(compare_paths, Paths, Sorted).

compare_paths(Order, [A|_], [B|_]) :-
    heuristic(A, HA),
    heuristic(B, HB),
    compare(Order, HA, HB).
