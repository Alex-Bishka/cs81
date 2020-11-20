%% Define accepting state(s) here.
% need to have at least one accepting predicate
accepting(q0).
accepting(q2).

%% Define transitions here.
% q0 transitions:
transition(q0, 0, q1).
transition(q0, 1, q3).
% q1 transitions:
transition(q1, 0, q2).
transition(q1, 1, q4).
% q2 transitions:
transition(q2, 0, q1).
transition(q2, 1, q3).
% q3 transitions:
transition(q3, 0, q4).
transition(q3, 1, q2).
% q4 transitions:
transition(q4, 0, q4).
transition(q4, 1, q4).
