% Facts representing the database
dob(john, 1990).
dob(mary, 1985).
dob(peter, 1992).
dob(susan, 1998).

% Rules to query the database
older(Name1, Name2) :-
    dob(Name1, Year1),
    dob(Name2, Year2),
    Year1 < Year2.

younger(Name1, Name2) :-
    dob(Name1, Year1),
    dob(Name2, Year2),
    Year1 > Year2.

same_age(Name1, Name2) :-
    dob(Name1, Year1),
    dob(Name2, Year2),
    Year1 =:= Year2.

% Query examples:
% older(john, mary).
% younger(peter, susan).
% same_age(john, peter).
