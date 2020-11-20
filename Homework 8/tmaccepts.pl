%% This is a Turing machine "simulator" you will complete.
%% accepts(State, LeftTapeReversed, RightTape) is true if State is a state and 
%% the given TM will reach the accepting state when run from State on that input tape. 
%% Use keywords blank, stay, left, right for the blank symbol and types of moves, respectively.
%%
%% blank - represents an explicit blank symbol on the tape
%% left - represents a left move
%% right - represents a right move
%% stay - represents a non-move (staying put)
%% transition(Q, T, Q', T', L/R/S)
%% Q is our current state
%% T is our current input
%% Q' is our new/next state
%% T' is out new/next symbol
%% L/R/S is direction of movement on tape

%% need these in order to run tmaccepts
%% :- dynamic accepting/1.
%% :- dynamic transition/5.

accepts(State, _, _) :- accepting(State).

% stay cases
accepts(State, LeftTapeReverse, [Symbol | RestRightTape]) :- 
    transition(State, Symbol, NewState, NewSymbol, stay),
    accepts(NewState, LeftTapeReverse, [NewSymbol | RestRightTape]).

% this has been given to us
accepts(State, LeftTapeReverse, []) :- 
    transition(State, blank, NewState, NewSymbol, stay),
    accepts(NewState, LeftTapeReverse, [NewSymbol]).

% right cases 
accepts(State, LeftTapeReverse, [Symbol | RestRightTape]) :- 
    transition(State, Symbol, NewState, NewSymbol, right),
    accepts(NewState, [NewSymbol | LeftTapeReverse], RestRightTape).

accepts(State, LeftTapeReverse, []) :- 
    transition(State, blank, NewState, NewSymbol, right),
    accepts(NewState, [NewSymbol | LeftTapeReverse], []).

% left cases
accepts(State, [PreviousSymbol | RestLeftTape], [Symbol | RestRightTape]) :- 
    transition(State, Symbol, NewState, NewSymbol, left),
    accepts(NewState, RestLeftTape, [PreviousSymbol, NewSymbol | RestRightTape]).

accepts(State, [PreviousSymbol | RestLeftTape], []) :- 
    transition(State, blank, NewState, NewSymbol, left),
    accepts(NewState, RestLeftTape, [PreviousSymbol, NewSymbol]).

accepts(State, [], [Symbol | RestRightTape]) :-
    transition(State, Symbol, NewState, NewSymbol, left),
    accepts(NewState, [], [blank, NewSymbol | RestRightTape]).

accepts(State, [], []) :- 
    transition(State, blank, NewState, NewSymbol, left),
    accepts(NewState, [], [blank, NewSymbol]).
