% Graph representation: graph(Node, Neighbors)
% Example:
graph(a, [b, c, d]).
graph(b, [a, e, f]).
graph(c, [a]).
graph(d, [a, g]).
graph(e, [b]).
graph(f, [b]).
graph(g, [d]).

% Heuristic function: heuristic(Node, Value)
% Example: (distance from node to goal node)
heuristic(a, 5).
heuristic(b, 4).
heuristic(c, 6).
heuristic(d, 3).
heuristic(e, 7).
heuristic(f, 6).
heuristic(g, 2).

% Best First Search
best_first_search(Start, Goal, Path) :-
    best_first_search_recursive([[(0, Start)]], Goal, Path).

% Base case: goal reached
best_first_search_recursive([[(_, Goal)|Path]|_], Goal, Path).

% Recursive case
best_first_search_recursive([Path|Paths], Goal, FinalPath) :-
    expand(Path, NextPaths),
    append(Paths, NextPaths, NewPaths),
    sort(NewPaths, SortedPaths), % Sort by heuristic value
    best_first_search_recursive(SortedPaths, Goal, FinalPath).

% Expand a path by considering its possible extensions
expand([(Cost, CurrentNode)|Path], NewPaths) :-
    findall((NewCost, NextNode), 
            (graph(CurrentNode, [NextNode|Rest]),
            heuristic(NextNode, H),
            NewCost is Cost + H),
            Successors),
    create_paths(Successors, [(Cost, CurrentNode)|Path], NewPaths).

% Create new paths from successors
create_paths([], _, []).

create_paths([(Cost, NextNode)|RestSuccessors], Path, [NewPath|NewPaths]) :-
    NewPath = [(Cost, NextNode)|Path],
    create_paths(RestSuccessors, Path, NewPaths).
