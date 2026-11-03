% Graph edges
edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(d, g).
edge(e, g).

% Undirected graph
connected(X, Y) :- edge(X, Y).
connected(X, Y) :- edge(Y, X).

% BFS
bfs(Start, Goal, Path) :-
    bfs_queue([[Start]], Goal, RevPath),
    reverse(RevPath, Path).

bfs_queue([[Goal|Rest]|_], Goal, [Goal|Rest]).

bfs_queue([Path|Queue], Goal, Result) :-
    Path = [Current|_],
    findall(
        [Next|Path],
        (connected(Current, Next),
         \+ member(Next, Path)),
        NewPaths
    ),
    append(Queue, NewPaths, NewQueue),
    bfs_queue(NewQueue, Goal, Result).
