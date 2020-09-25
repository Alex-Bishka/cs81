%% CS 81, Logic and Computability
%% Homework 4, Problem 3
%% A problem inspired by the Four Fours Puzzle!
%% Alex Bishka
%% 9/23/2020

%% The solve predicate evaluates to true if the arithmetic tree, Tree
%% uses some subset of the operations specified in Operations (which is
%% a subset of [+, *, -, \]) and the list of Numbers and the tree evaluates
%% to the value Target.  Arithmetic operations may be used as many times
%% as we wish, but each number in Numbers must be used exactly once but
%% in any order.

solve(Operations, Numbers, Target, Tree) :-
    permutation(Numbers, PermutedNumbers),
    tree(Operations, PermutedNumbers, Tree),
    eval(Tree, Target).

%% The permutation predicate was written in class and it will be very useful here!

permutation([], []).
permutation(L, [F | R]) :-
    append(BeforeF, [F | AfterF], L),
    append(BeforeF, AfterF, Other),
    permutation(Other, R).
   
%% RECOMMENDED (BUT NOT REQUIRED) HELPER PREDICATES ARE OUTLINED BELOW 
%% tree(Operations, List, Tree) is true iff Tree can be constructed
%% from Operations in the internal nodes (with repetition) and the 
%% elements of List as the leaves with no repetition and from left to right 
% 
% operations is a list of mathematical operations (can repeat)
% list is a list of our numbers (can not repeat)
%
% To test/run:
%   [problem3].
%   tree([+, *], [4, 4, 4, 4], X).
%

tree(Operations, [X], X).

tree(Operations, List, [Root, Left, Right]) :- 
    member(Root, Operations), 
    append(LeftList, RightList, List),
    \+ LeftList = [],
    \+ RightList = [],
    tree(Operations, LeftList, Left), 
    tree(Operations, RightList, Right).

%% eval(Tree, Value) is true if the arithmetic Tree evaluates to the given Value.
%% We've provided the base case.  You'll need to write the recursive cases.

%% Base case.  This checks if R is a number.
    
eval(R, R) :- number(R).

% recursive cases (may need to do operate slash)
eval([*, Left, Right], Value) :- eval(Left, L), eval(Right, R), Value is L * R.

eval([/, Left, Right], Value) :- eval(Left, L), eval(Right, R), \+ R is 0, Value is L / R.

eval([+, Left, Right], Value) :- eval(Left, L), eval(Right, R), Value is L + R.

eval([-, Left, Right], Value) :- eval(Left, L), eval(Right, R), Value is L - R.