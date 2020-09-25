%% CS 81, Logic and Computability
%% Homework 4, Problem 2
%% Graphs!
%% Alex Bishka
%% 9/23/2020

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% BASE CASE - STARTER CODE
%%%%%%%%%%%%%%%%%%%%%%%%%%%
path(X, X, _, [X], K) :- K >= 0.

%%%%%%%%%%%%%
%% YOUR TURN!
% Description:
%   our predicate is true iff Path is a list of vertices comprising a path
%   from vertex start to vertex end in the given weighted directed Graph
%   such that the sum of the costs of the edges in the path does not exceed 
%   the given budget
%
% Notes:
%   a graph is represented as a list of triples where a triple [x, y, z]
%   denotes an edge from x to y with a weight of z
%   (x = start; y = end; z is cost - aka weight)
%   z is always postive.
%   cycles can exist!
%
% What our predicate looks like:  
%   path(start_vertex, end_vertex, graph, path, budget)
%
% To run:
% [problem2].
% dynamic graph/1.
% assert(graph(  [ [a,b,1], [b,c,2], [c,b,1], [b,a,5], [c,d,2],[b,w,2], [w,x,3], [x,z,2], [b,z,5] ] )).
% graph(G), path(a, z, G, P, 5).
% graph(G), path(a, z, G, P, 6).
% graph(G), path(a, z, G, P, 8).
% graph(G), path(a, z, G, P, 10).
%%%%%%%%%%%%%
path(X, Y, Graph, [X | Rest], Budget) :- 
    member([X, NewStart, Weight], Graph), 
    NewWeight is Budget - Weight, 
    \+ Weight > Budget, 
    path(NewStart, Y, Graph, Rest, NewWeight).