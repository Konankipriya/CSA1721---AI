% Facts about birds and whether they can fly
can_fly(sparrow).
can_fly(eagle).
can_fly(albatross).
cannot_fly(penguin).
cannot_fly(ostrich).

% Rules to determine whether a bird can fly or not
fly(X) :- can_fly(X).
fly(X) :- \+cannot_fly(X).

% Example queries
% Querying whether a sparrow can fly
% ?- fly(sparrow).
% Output: true

% Querying whether a penguin can fly
% ?- fly(penguin).
% Output: false
