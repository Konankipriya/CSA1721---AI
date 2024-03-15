% Facts representing the database
planet(mercury, 0.055, 0.387, 0.241).
planet(venus, 0.815, 0.723, 0.615).
planet(earth, 1.0, 1.0, 1.0).
planet(mars, 0.107, 1.524, 1.881).
planet(jupiter, 317.8, 5.203, 11.86).
planet(saturn, 95.2, 9.539, 29.46).
planet(uranus, 14.6, 19.18, 84.01).
planet(neptune, 17.2, 30.06, 164.8).

% Queries
mass(Planet, Mass) :-
    planet(Planet, Mass, _, _).

distance_from_sun(Planet, Distance) :-
    planet(Planet, _, Distance, _).

orbital_period(Planet, Period) :-
    planet(Planet, _, _, Period).

% Example usage:
% mass(mercury, Mass).
% distance_from_sun(venus, Distance).
% orbital_period(earth, Period).
