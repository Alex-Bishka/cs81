%% CS 81, Logic and Computability
%% Homework 5, DFA 2
%% Alex Bishka
%% 9/30/20

%% Strings of valid additions read left-to-right

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% YOUR CODE
% to run:
% consult("DFAaccepts.pl").
% consult("dfa2.pl").
%
% should pass:
% accepts(q0, [[0, 0, 1], [1, 1, 0], [0, 1, 1], [1, 0, 1]]).
% should fail:
% accepts(q0, [[0, 0, 1], [1, 0, 0]]).
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% The start state is understood to ALWAYS be named q0.

%% Define accepting state(s) here.
accepting(q0).

%% Define transitions here.
% from accepting (q0) to either accepting, carry, or error state
transition(q0, [0, 0, 0], q0).
transition(q0, [0, 1, 1], q0).
transition(q0, [1, 0, 1], q0).
transition(q0, [1, 1, 0], q2).
transition(q0, [0, 0, 1], q1).
transition(q0, [0, 1, 0], q1).
transition(q0, [1, 0, 0], q1).
transition(q0, [1, 1, 1], q2).

% from carry (q1) to either accepting, carry, or error state
transition(q1, [0, 0, 0], q2).
transition(q1, [0, 1, 1], q2).
transition(q1, [1, 0, 1], q2).
transition(q1, [1, 1, 0], q0).
transition(q1, [0, 0, 1], q2).
transition(q1, [0, 1, 0], q1).
transition(q1, [1, 0, 0], q1).
transition(q1, [1, 1, 1], q0).

% error state (q2) always in error state
transition(q2, [0, 0, 0], q2).
transition(q2, [0, 1, 1], q2).
transition(q2, [1, 0, 1], q2).
transition(q2, [1, 1, 0], q2).
transition(q2, [0, 0, 1], q2).
transition(q2, [0, 1, 0], q2).
transition(q2, [1, 0, 0], q2).
transition(q2, [1, 1, 1], q2).