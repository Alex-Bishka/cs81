%% CS 81, Logic and Computability
%% Homework 4, Problem 4
%% Fox, hare, lettuce, man
%% YOUR NAME
%% DATE

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

%% The solve predicate simply retracts all previous marked assertions
%% and calls cross to solve the puzzle.

solve(Configuration, X) :- retractall(marked(X)), cross(Configuration, X).

cross(Configuration, []) :- final(Configuration).

cross(Configuration, ListOfMoves) :- fail. %% <---Interesting code goes here, after you remove the `fail.'

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

valid([LEFT1, RIGHT1], man_goes_right, [LEFT2, RIGHT2]) :- fail.