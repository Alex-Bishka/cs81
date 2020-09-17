%% Author(s):
%%
%% CS 81 HW 3, Problem 7

% some "nice" prolog settings...
:- set_prolog_flag( prompt_alternatives_on, groundness ).
:- set_prolog_flag(toplevel_print_options, [quoted(true),
     portray(true), attributes(portray), max_depth(999), priority(699)]).
:- set_prolog_flag(answer_write_options, [quoted(true),
     portray(true), attributes(portray), max_depth(999), priority(699)]).

% We start you with the base case.
%%%%%%%%%%%
% STARTER %
%%%%%%%%%%%
depth(E, [E, _, _], 0).

% You finish the following cases.
%%%%%%%%%%
% YOU DO %
%%%%%%%%%%

depth(E, [Root, Left, _], N) :- \+E = Root, depth(E, [E, Left, _], P), N is P + 1.
depth(E, [Root, _, Right], N) :- \+E = Root, depth(E, [E, _, Right], P), N is P + 1.