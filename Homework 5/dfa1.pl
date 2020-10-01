%% CS 81, Logic and Computability
%% Homework 5, DFA 1
%% Alex Bishka
%% 9/30/20

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% YOUR CODE
% to run:
% consult("DFAaccepts.pl").
% consult("dfa1.pl").
%
% should pass:
% accepts(q0, [0, 1, 1, 0, 1, 1, 1, 1]).
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% some notes:
% The start state is understood to be called q0
% For every accepting state (e.g., q42) we include a predicate accepting(q42).
% For every transition from one state (e.g q42) to a state (e.g. q47) on a given symbol (e.g. 1), 
% we include a predicate of the form: transition(q42, 1, q47).
% input is represented as a list (read left to right)
% if Q is set of states and alphabet is Σ, then the number of transitions will be |Q| x |Σ|
%
% our task is to write DFA for the langauge for alphabet {0, 1} such that the number of 0s is a multiple of 2
% and the number of 1s is a multiple of 3 

%% The start state is understood to ALWAYS be named q0.

%% Define accepting state(s) here.
% need to have at least one accepting predicate
accepting(q0).

%% Define transitions here.
transition(q0, 1, q1).
transition(q0, 0, q2).
transition(q1, 1, q5).
transition(q1, 0, q3).
transition(q2, 1, q3).
transition(q2, 0, q0).
transition(q3, 1, q4).
transition(q3, 0, q1).
transition(q4, 1, q2).
transition(q4, 0, q5).
transition(q5, 1, q0).
transition(q5, 0, q4).