% related paper:
%
% Membership-Constraints and Complexity in Logic Programming with Sets,
% Frieder Stolzenburg (1996).
% http://link.springer.com/chapter/10.1007%2F978-94-009-0349-4_15
% http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.54.8356

% set membership with non-pure builtin \==
% to cut down duplicate answers as sets
memb(X,[X|_]).
memb(X,[Y|L]) :- X \== Y, memb(X,L).

% unify finite sets (i.e. set with [] at the end)
unify_set(A,B) :- subset_of(A,B), subset_of(B,A).

subset_of([], _).
subset_of([X|R],L) :- memb(X,L), subset_of(R,L).

% finite set union
union([],B,B).
union(A,[],A).
union([X|Xs],B,C) :- memb(X,B), !, union(Xs,B,C).
union([X|Xs],B,[X|C]) :- union(Xs,B,C).

% finite set intersection
intersect([],_,[]).
intersect(_,[],[]).
intersect([X|Xs],B,[X|C]) :- memb(X,B), !, intersect(Xs,B,C).
intersect([_|Xs],B,C) :- intersect(Xs,B,C).

% finite set minus
setminus(A,[],A).
setminus([],_,[]).
setminus([X|Xs],B,C) :- memb(X,B), !, setminus(Xs,B,C).
setminus([X|Xs],B,[X|C]) :- setminus(Xs,B,C).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% once inspired by the idea of the paper,
% finite map unification is just like this
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% unify finite maps
unify_map(A,B) :- submap_of(A,B), submap_of(B,A).

submap_of([], _).
submap_of([X:V|R],M) :- first(X:V,M), submap_of(R,M).

% search key and find value in a finite map
first(X:V,[X:V|_]).
first(X:V,[Y:_|L]) :- X \== Y, first(X:V,L).

% finite map minus
mapminus(A,[],A).
mapminus([],_,[]).
mapminus([X:V|Ps],B,C) :- first(X:V1,B), !, (V1 = V -> mapminus(Ps,B,C); fail).
mapminus([X:V|Ps],B,[X:V|C]) :- mapminus(Ps,B,C).

