% Facts about family relationships
parent(john, mary).    % John is the parent of Mary
parent(john, dave).    % John is the parent of Dave
parent(mary, anne).    % Mary is the parent of Anne
parent(dave, peter).   % Dave is the parent of Peter
parent(anne, lisa).    % Anne is the parent of Lisa

% Rules to define other relationships
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
child(X, Y) :- parent(Y, X).
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
brother(X, Y) :- sibling(X, Y), male(X).
sister(X, Y) :- sibling(X, Y), female(X).

% Facts about genders
male(john).
male(dave).
male(peter).
female(mary).
female(anne).
female(lisa).

% Example queries
% Who are the children of John and Mary?
% ?- child(X, john), child(X, mary).
% Output: X = dave

% Who is the mother of Lisa?
% ?- mother(X, lisa).
% Output: X = anne

% Who are the siblings of Peter?
% ?- sibling(X, peter).
% Output: X = lisa
