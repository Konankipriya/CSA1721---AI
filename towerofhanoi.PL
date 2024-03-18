% hanoi(+N, +A, +B, +C, -Moves)
% N: number of disks
% A: source peg
% B: auxiliary peg
% C: destination peg
% Moves: list of moves to solve the Tower of Hanoi problem

% Base case: moving 0 disks requires no moves
hanoi(0, _, _, _, []).

% Recursive case: moving N disks involves the following steps:
% 1. Move N-1 disks from A to B using C as auxiliary peg
% 2. Move the remaining disk from A to C
% 3. Move N-1 disks from B to C using A as auxiliary peg
hanoi(N, A, B, C, Moves) :-
    N > 0,
    N1 is N - 1,
    hanoi(N1, A, C, B, Moves1),
    append(Moves1, [(A,C)], Moves2),
    hanoi(N1, B, A, C, Moves3),
    append(Moves2, Moves3, Moves).
