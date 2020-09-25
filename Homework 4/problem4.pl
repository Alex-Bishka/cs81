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

% sorted determines if a list is sorted
sorted([]).
sorted([_]).
sorted([D1, D2 | R]) :- occursOnce(D1, [D2, R]), precedes(D1, D2), sorted([D2 | R]).

% our banks are not going to eat each other
safe([]).
safe([_]).
safe([man | Rest]).
safe([fox, lettuce]).

% removeOne - checks to make sure our banks are the same after we move an animal over
% removes an element from the first list and produces a second list without that element
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

valid([[man | LEFT1], RIGHT1], man_goes_right, [LEFT1, [man | RIGHT1]]) :- 
    sorted(LEFT1), 
    sorted([man | RIGHT1]), 
    safe(LEFT1), 
    safe([man | RIGHT1]).

valid([LEFT1, [man | RIGHT1]], man_goes_left, [[man | LEFT1], RIGHT1]) :- 
    sorted([man | LEFT1]),
    sorted(RIGHT1),
    safe([man | LEFT1]),
    safe([RIGHT1]).

valid([[man | fox | LEFT1], RIGHT1], man_takes_fox_right, [LEFT1, [man | fox | RIGHT1]]) :- 
    sorted(LEFT1), 
    sorted([man | fox | RIGHT1]), 
    removeOne(fox, [fox | LEFT1], LEFT1).
    removeOne(fox, [fox | RIGHT1], RIGHT1).
    safe(LEFT1), 
    safe([man | fox | RIGHT1]).

valid([LEFT1, [man | fox | RIGHT1]], man_takes_fox_left [[man | fox | LEFT1], RIGHT1]) :-
    sorted([man | fox | LEFT1]),
    sorted(RIGHT1),
    removeOne(fox, [fox | RIGHT1], RIGHT1),
    removeOne(fox, [fox | LEFT1], LEFT1),
    safe([man | fox | LEFT1]),
    safe([RIGHT1]).

valid([[man | LEFT1], RIGHT1], man_takes_hare_right [LEFT2, [man | RIGHT2]]) :-
    member(hare, LEFT1),
    member(hare, RIGHT2),
    sorted([man | LEFT1]),
    sorted(RIGHT1),
    sorted(LEFT2),
    sorted([man | RIGHT2]),
    removeOne(hare, LEFT1, LEFT2),
    removeOne(hare, RIGHT2, RIGHT1),
    safe(RIGHT1),
    safe(LEFT2).

valid([LEFT1, [man | RIGHT1]], man_takes_hare_left [[man | LEFT2], RIGHT2]) :- fail.
    member(hare, RIGHT1),
    member(hare, LEFT2),
    sorted(LEFT1),
    sorted([man | RIGHT1]),
    sorted([man | LEFT2]),
    sorted(RIGHT2),
    removeOne(hare, RIGHT1, RIGHT2),
    removeOne(hare, LEFT2, LEFT1),
    safe(LEFT1),
    safe(RIGHT2).

% do I need to check if inputs are sorted for lettuce cases?
valid([[man | LEFT1], RIGHT1], man_takes_lettuce_right, [LEFT2, [man | RIGHT2]]) :- 
    last(LEFT1, lettuce),
    last(RIGHT2, lettuce),
    sorted([man | LEFT1]),
    sorted(RIGHT1),
    sorted(LEFT2), 
    sorted([man | RIGHT2]), 
    removeOne(lettuce, LEFT1, LEFT2).
    removeOne(lettuce, RIGHT2, RIGHT1).
    safe(RIGHT1)
    safe(LEFT2).

valid([LEFT1, [man | RIGHT1]], man_takes_lettuce_left [[man | LEFT2], RIGHT2]) :- 
    last(RIGHT1, lettuce),
    last(LEFT2, lettuce),
    sorted([man | RIGHT1]),
    sorted(LEFT1),
    sorted([man | LEFT2]),
    sorted(RIGHT2),
    removeOne(lettuce, RIGHT1, RIGHT2),
    removeOne(lettuce, LEFT2, LEFT1),
    safe(LEFT1),
    safe(RIGHT2).