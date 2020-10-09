%% CS 81, Logic and Computability
%% Homework 5, DFA 3
%% Alex Bishka
%% 10/8/20


%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% YOUR CODE
% to run:
% consult("DFAaccepts.pl").
% consult("problem3.pl").
%
% should pass (6 in binary):
% accepts(q0, [0, 0, 0, 1, 1, 1, 1, 0]).
% should fail (7 in binary):
% accepts(q0, [0, 0, 1, 1, 1]).
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Define accepting state(s) here.
accepting(q1).
accepting(q2).

%% Define transitions here.
transition(q0, 1, q2).
transition(q0, 0, q1).
transition(q1, 1, q3).
transition(q1, 0, q1).
transition(q2, 1, q2).
transition(q2, 0, q4).
transition(q3, 1, q3).
transition(q3, 0, q1).
transition(q4, 1, q2).
transition(q4, 0, q4).