% Rules: (Hypotheses)
% If X and Y, then Z.
rule(temperature_high, fever).
rule(coughing, cold).
rule(sore_throat, cold).
rule(fever, flu).
rule(headache, flu).
rule(body_ache, flu).

% Initial facts: (Data)
% Known symptoms
symptom(temperature_high).
symptom(coughing).
symptom(sore_throat).

% Forward chaining algorithm
infer(Disease) :-
    rule(Symptom, Disease),
    not(diagnosed(Disease)),
    check_symptom(Symptom),
    assertz(diagnosed(Disease)),
    infer(Disease).

% Check if symptom is present
check_symptom(Symptom) :-
    symptom(Symptom).

% Query examples
% Query: What diseases can be inferred from the given symptoms?
% ?- infer(Disease).
% Output: Disease = flu.

% Query: Is fever diagnosed?
% ?- diagnosed(fever).
% Output: true.
