%% This is a Turing machine for the language (0^i)(1^i)(2^i).

%% ADD PREDICATES FOR TRANSITIONS, ACCEPTING STATES, etc.
%% 
%% Our functions being used:
%% accepting(State).
%% transition(State, Symbol, NewState, NewSymbol, direction).
%%
%% our only accepting state:
accepting(qaccept).

%% transitions from q0
transition(q0, b, q0, b, right).
transition(q0, c, q0, c, right).
transition(q0, 0, q1, a, right).
transition(q0, blank, qaccept, blank, stay).

%% transitions from q1
transition(q1, b, q1, b, right).
transition(q1, 0, q1, 0, right).
transition(q1, 1, q2, b, right).

%% transitions from q2
transition(q2, 1, q2, 1, right).
transition(q2, c, q2, c, right).
transition(q2, 2, q3, c, left).

%% transitions from q3
transition(q3, 1, q3, 1, left).
transition(q3, 0, q3, 0, left).
transition(q3, b, q3, b, left).
transition(q3, c, q3, c, left).
transition(q3, a, q0, a, right).
