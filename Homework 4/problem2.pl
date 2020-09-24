%% CS 81, Logic and Computability
%% Homework 4, Problem 2
%% Graphs!
%% Alex Bishka
%% 9/23/2020

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% BASE CASE - STARTER CODE
%%%%%%%%%%%%%%%%%%%%%%%%%%%
path(X, X, _, [X], K) :- K >= 0.

%%%%%%%%%%%%%
%% YOUR TURN!
%%%%%%%%%%%%%
path(X, Y, Graph, [X | Rest], Budget) :- fail. % <--- write your code here, replacing 'fail.'