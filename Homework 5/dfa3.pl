%% CS 81, Logic and Computability
%% Homework 5, DFA 3
%% Alex Bishka
%% 9/30/20

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% YOUR CODE
% to run:
% consult("DFAaccepts.pl").
% consult("dfa3.pl").
%
% should pass (6 in binary):
% accepts(q0, [1, 1, 0]).
% should fail (7 in binary):
% accepts(q0, [0, 0, 1, 1, 1]).
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% The start state is understood to ALWAYS be named q0.

%% Define accepting state(s) here.
accepting(q0).

%% Define transitions here.
transition(q0, 1, q2).
transition(q0, 0, q0).

transition(q1, 1, q1).
transition(q1, 0, q2).

transition(q2, 1, q0).
transition(q2, 0, q1).