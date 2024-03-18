% Define facts about fruits and their colors
color(apple, red).
color(banana, yellow).
color(grape, purple).
color(orange, orange).
color(watermelon, green).
color(strawberry, red).

% Define a predicate to query the color of a fruit
fruit_color(Fruit, Color) :-
    color(Fruit, Color).

% Query examples
% Query: What is the color of an apple?
% ?- fruit_color(apple, Color).
% Output: Color = red.

% Query: What is the color of a banana?
% ?- fruit_color(banana, Color).
% Output: Color = yellow.

% Query: What is the color of a watermelon?
% ?- fruit_color(watermelon, Color).
% Output: Color = green.

% Query: What is the color of a strawberry?
% ?- fruit_color(strawberry, Color).
% Output: Color = red.
