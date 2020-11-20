%% CS 81, Logic and Computability
%% Homework 4, Problem 1
%% More Trees!
%% Alex Bishka
%% 9/23/2020

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% BASE CASE - STARTER CODE
%%%%%%%%%%%%%%%%%%%%%%%%%%%
insert(E, [], [E, [], []]).

%%%%%%%%%%%%%
%% YOUR TURN!
% Description:
%   True if and only if the result of inserting element E into the binary 
%   search tree Tree results in the new binary search tree called NewTree.
% 
% Notes:
%   Trees are represented as [Root, Left, Right].
%   Insertion must preserve binary search tree property.
%
% What our predicate looks like:
%   insert(insertion_value, tree, new_tree)
%
% Need to run:
% [problem1].
% dynamic tree/1.
% assert(tree([42, [5, [], []], [47, [], [50, [], []]]])).
% tree(T).
% tree(T), insert(200, T, New).
%%%%%%%%%%%%%
% insertion is on the left subtree
insert(E, [Root, Left, Right], [Root, NewLeft, Right]) :- E < Root, insert(E, Left, NewLeft).

% insertion is on the right subtree
insert(E, [Root, Left, Right], [Root, Left, NewRight]) :- E > Root, insert(E, Right, NewRight).