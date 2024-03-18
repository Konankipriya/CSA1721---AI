% Dietary recommendations for different diseases
diet_recommendation(diabetes, [avoid(sugar), eat(vegetables), eat(fruits), limit(carbohydrates)]).
diet_recommendation(hypertension, [limit(sodium), eat(fruits), eat(vegetables), exercise(regularly)]).

% Rule to suggest diet based on disease
suggest_diet(Disease, Diet) :-
    diet_recommendation(Disease, Diet).

% Example queries
% Querying diet recommendation for diabetes
% ?- suggest_diet(diabetes, Diet).
% Output: Diet = [avoid(sugar), eat(vegetables), eat(fruits), limit(carbohydrates)]

% Querying diet recommendation for hypertension
% ?- suggest_diet(hypertension, Diet).
% Output: Diet = [limit(sodium), eat(fruits), eat(vegetables), exercise(regularly)]
