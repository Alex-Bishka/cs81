%% This is the DFA "simulator" that we wrote in class.
%% accepts(Q, List) is true if Q is a state and List is a list of inputs
%% and the given DFA will reach an accepting state when run from Q on that input. 

accepts(Q, []) :- accepting(Q).
accepts(Q, [Symbol | Rest]) :- transition(Q, Symbol, NewQ), accepts(NewQ, Rest).
