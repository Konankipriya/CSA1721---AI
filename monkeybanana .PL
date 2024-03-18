% Initial state of the monkey and banana problem
at(monkey, door).
at(box, middle).
at(banana, ceiling).
at(obstacle, middle).

% Actions the monkey can take
move(monkey, door, middle).  % Move from door to middle
move(monkey, middle, door).  % Move from middle to door
move(monkey, middle, box).    % Move from middle to box
move(monkey, box, middle).    % Move from box to middle
climb(monkey, box).           % Climb the box
push(box, middle, door).      % Push the box from middle to door
jump(monkey, middle, ceiling).% Jump from middle to ceiling

% Rules to perform actions and check goal state
can_do_action(Action) :-
    at(monkey, MonkeyLocation),
    at(box, BoxLocation),
    at(banana, BananaLocation),
    moveable(Action, MonkeyLocation, BoxLocation, BananaLocation).

% Moveable actions based on current state
moveable(move(monkey, From, To), From, BoxLocation, _) :-
    (To = middle; To = door),
    (BoxLocation = From; BoxLocation = To).
moveable(climb(monkey, box), middle, middle, _).
moveable(push(box, From, To), From, From, _) :- To = middle.
moveable(jump(monkey, middle, To), middle, _, To).

% Define goal state
goal_state(at(monkey, middle), at(banana, middle)).

% Predicate to check if the monkey has reached the banana
goal_reached :- goal_state(at(monkey, middle), at(banana, middle)).

% Rules to perform actions and reach the goal state
move_monkey(Action) :-
    can_do_action(Action),
    apply_action(Action),
    write(Action), nl,
    goal_reached,
    write('Goal Reached!'), nl, !.

apply_action(move(monkey, From, To)) :-
    retract(at(monkey, From)),
    assert(at(monkey, To)).
apply_action(climb(monkey, box)) :-
    retract(at(monkey, middle)),
    assert(at(monkey, ceiling)).
apply_action(push(box, From, To)) :-
    retract(at(box, From)),
    assert(at(box, To)).
apply_action(jump(monkey, From, To)) :-
    retract(at(monkey, From)),
    assert(at(monkey, To)).

% Example query to solve the problem
% ?- move_monkey(Action).
