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
% What our "function" looks like:
%   insert(insertion_value, tree, new_tree)
%%%%%%%%%%%%%
% insertion is on the left subtree
insert(E, [Root, Left, Right], [Root, NewLeft, Right]) :- fail. % <--- write your code here, replacing 'fail.' 
% insertion is on the right subtree
insert(E, [Root, Left, Right], [Root, Left, NewRight]) :- fail. % <--- write your code here, replacing 'fail.' 