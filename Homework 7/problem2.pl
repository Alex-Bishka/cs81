% PDA for the language 0^(2i)1^i

% accepting states
% accepting(accepting_state).
% YOUR ACCEPTING STATES HERE
accepting(q0).
accepting(q4).

% transition(state, tape, top of stack, pushed on top of stack, newState).
% YOUR TRANSITIONS HERE
transition(q0, epsilon, epsilon, $, q1).
transition(q1, 0, epsilon, 0, q2).
transition(q1, 1, 0, epsilon, q3).
transition(q2, 0, epsilon, epsilon, q1).
transition(q3, 1, 0, epsilon, q3).
transition(q3, epsilon, $, epsilon, q4).
