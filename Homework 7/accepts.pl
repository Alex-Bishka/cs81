% accepts predicate for PDAs.
% accepts(State, Tape, Stack) is True iff the given PDA would accept, 
% starting in the given State, the input on the Tape with the given Stack.

accepts(Q, [], []) :- accepting(Q).

accepts(Q, Tape, Stack) :-
    ([S | _] = Tape; S = epsilon),
    ([T | _] = Stack; T = epsilon),
    transition(Q, S, T, NewTop, NewQ),
    newTape(Tape, S, NewTape),
    newStack(Stack, T, NewTop, NewStack),
    accepts(NewQ, NewTape, NewStack).

% ADD YOUR PREDICATES HERE FOR newTape AND newStack.
% 
% Recall that newTape(Tape, Symbol, NewTape) is true iff 
% 	1) Tape is the list of symbols on the tape beforehand, 
% 	2) Symbol is the symbol that was just consumed or epsilon
% 	3) NewTape is the list of symbols on the tape afterwards.
% Note: sample solution is 2 lines!
%
% if symbol is equal to top, we take it off
% if symbol is epsilon we keep the same tape
% if both fail we hit a false state
newTape(Tape, epsilon, Tape).
newTape([Top | Rest], Top, Rest) :- \+ Top = epsilon.

% Similarly, newStack(Stack, Pop, Push, NewStack) is true if and only if 
%	1) Stack is the current stack 
%	2) Pop is the symbol at the top of that stack (or epsilon which is always at the top of the stack!) 
%	3) Push is the symbol that replaces Pop and 
%	4) New Stack is the resulting stack at the end of all of that.
% Note: sample solution is 4 lines!
%
% if Pop == Top we want to remove Top
% if Pop is espilon, we remove nothing
% otherwise return false
% push replaces pop, so push is our NewTop, if it is a symbol
% NewRest is always rest
% basically, we only care about how pop/push relate to Top/NewTop
newStack(Stack, epsilon, epsilon, Stack).
newStack(Stack, epsilon, Push, [Push | Stack]) :- \+ Push = epsilon.
newStack([Top | Rest], Top, epsilon, Rest) :- \+ Top = epsilon.  
newStack([Top | Rest], Top, Push, [Push | Rest]) :- \+ Top = epsilon, \+ Push = epsilon.
