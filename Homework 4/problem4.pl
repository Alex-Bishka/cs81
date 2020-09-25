%% CS 81, Logic and Computability
%% Homework 4, Problem 4
%% Fox, hare, lettuce, man
%% Alex Bishka
%% 9/23/2020

%% A configuration comprises a list of two lists in which
%% the first list in the pair consists of the items on the left bank
%% and the second list consists of the items on the right bank.  The
%% man is considered to be an item.  The lists will be kept in sorted
%% order such that man precedes fox precedes hare precedes lettuce.

%% The initial configuration, therefore, is:
%% [ [man, fox, hare, lettuce], [] ]

:- dynamic marked/1.

initial([[man, fox, hare, lettuce], []]).
final([[], [man, fox, hare, lettuce]]).

% precedes is a helper for our sorted function, replacing less than operator
precedes(man, _).
precedes(fox, hare).
precedes(fox, lettuce).
precedes(hare, lettuce).

% no repeats - helper for sorted
occursOnce(X, [X | R]) :- \+ member(X, R).
occursOnce(X, [F | R]) :- occursOnce(X, R), \+ X = F.

% sorted makes sure the order of our elements is correct
sorted([]).
sorted([_]).
sorted([D1, D2 | R]) :- occursOnce(D1, [D2, R]), memberprecedes(D1, D2), sorted([D2 | R]).

% our banks are not going to eat each other
safe([]).
safe([_]).
safe([man | Rest]).
safe([fox, lettuce]).

% removeOne - checks to make sure our banks are the same after we move an animal over
removeOne(A, [A | X], X).
removeOne(B, [A | X], [A | Y]) :- removeOne(B, X, Y).

%% The solve predicate simply retracts all previous marked assertions
%% and calls cross to solve the puzzle.

solve(Configuration, X) :- retractall(marked(X)), cross(Configuration, X).

cross(Configuration, []) :- final(Configuration).

cross(Configuration, [Move | Rest]) :- 
    \+ marked(Configuration),
    assert(marked(Configuration)),
    valid(Configuration, Move, NewConfiguration),
    cross(NewConfiguration, Rest).

%% The possible moves must be named:
%% man_goes_right (Man goes from the left bank TO the right bank by himself
%% man_goes_left (Man goes from the right bank TO the left bank by himself
%% man_takes_fox_right (Man and fox go from left to right bank)
%% man_takes_fox_left (Man and fox go from right to left bank)
%% man_takes_hare_right (Man and hare go from from left to right bank)
%% man_takes_hare_left (Man and hare go from right to left bank)
%% man_takes_lettuce_right (Man and lettuce go from left to right bank)
%% man_takes_lettuce_left (Man and lettuce from from right to left bank)

%% I suggest writing a separate "valid" predicate for each of the moves above.

%% This predicate is true, for example, if the left and right banks look like
%% [LEFT1, RIGHT1] before the move.  Then, upon making the move man_goes_right
%% the left and right banks look like [LEFT2, RIGHT2]

valid([[man | LEFT1], RIGHT1], man_goes_right, [LEFT1, [man | RIGHT1]]) :- sorted(LEFT1), sorted([man | RIGHT1]).

valid([LEFT1, RIGHT1], man_goes_left, [LEFT2, RIGHT2]) :- fail.

valid([LEFT1, RIGHT1], man_takes_fox_right, [LEFT2, RIGHT2]) :- fail.

valid([LEFT1, RIGHT1], man_takes_fox_left [LEFT2, RIGHT2]) :- fail.

valid([LEFT1, RIGHT1], man_takes_hare_right [LEFT2, RIGHT2]) :- fail.

valid([LEFT1, RIGHT1], man_takes_hare_left [LEFT2, RIGHT2]) :- fail.

valid([LEFT1, RIGHT1], man_takes_lettuce_right, [LEFT2, RIGHT2]) :- fail.

valid([LEFT1, RIGHT1], man_takes_lettuce_left [LEFT2, RIGHT2]) :- fail.