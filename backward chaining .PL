% Rules: (Hypotheses)
% If X and Y, then Z.
rule(fever, flu).
rule(coughing, cold).
rule(sore_throat, cold).
rule(headache, flu).
rule(body_ache, flu).

% Initial facts: (Data)
% Known symptoms
symptom(temperature_high).
symptom(coughing).
symptom(sore_throat).

% Backward chaining algorithm
infer(Disease) :-
    query(Disease),
    prove(Disease).

% Check if a disease is already known
prove(Disease) :-
    diagnosed(Disease), !.

% Check if there is a rule supporting the disease
prove(Disease) :-
    rule(Symptom, Disease),
    prove(Symptom),
    assertz(diagnosed(Disease)).

% Query examples
% Query: Is there evidence to diagnose flu?
% ?- infer(flu).
% Output: true.

% Query: Is there evidence to diagnose cold?
% ?- infer(cold).
% Output: true.

% Query: Is there evidence to diagnose fever?
% ?- infer(fever).
% Output: false.
