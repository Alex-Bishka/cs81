%% Author(s):
%%
%% CS 81 HW 3, Problem 6

% some "nice" prolog settings...
:- set_prolog_flag( prompt_alternatives_on, groundness ).
:- set_prolog_flag(toplevel_print_options, [quoted(true),
     portray(true), attributes(portray), max_depth(999), priority(699)]).
:- set_prolog_flag(answer_write_options, [quoted(true),
     portray(true), attributes(portray), max_depth(999), priority(699)]).

% We start you with some starter code, which handles the case of an empty list.

%%%%%%%%%%%
% STARTER %
%%%%%%%%%%%

count(_, [], 0). % The empty list contains no occurrences of X

% Finish writing the code for the other two cases.

%%%%%%%%%%
% YOU DO %
%%%%%%%%%%
%
count(X, [X | Rest], N) :- count(X, Rest, P), N is P + 1.
count(X, [Y | Rest], N) :- count(X, Rest, N), \+X = Y.