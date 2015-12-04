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

% unify open ended sets with possibly uninstantiated variable tail at the end
unify_oeset(A,B) :- ( var(A); var(B) ), !, A=B.
unify_oeset(A,B) :-
       	split_heads(A,Xs-T1), make_set(Xs,S1),
       	split_heads(B,Ys-T2), make_set(Ys,S2),
	unify_oe_set(S1-T1, S2-T2).

make_set(L,S) :- setof(X,memb(X,L),S).

split_heads([],[]-[]).
split_heads([X|T],[X]-T) :- var(T), !, true.
split_heads([X|Xs],[X|Hs]-T) :- split_heads(Xs,Hs-T).

% helper function for unify_oeset (almost no duplicate answers)
unify_oe_set(Xs-T1,Ys-T2) :- T1==[], T2==[], unify_set(Xs,Ys).
unify_oe_set(Xs-T1,Ys-T2) :- T1==[], subset_of(Ys,Xs), setminus(Xs,Ys,T2).
unify_oe_set(Xs-T1,Ys-T2) :- T2==[], subset_of(Xs,Ys), setminus(Ys,Xs,T1).
unify_oe_set(Xs-T1,Ys-T2) :- 
	setminus(Ys,Xs,L1), append(L1,T,T1),
       	setminus(Xs,Ys,L2), append(L2,T,T2).

%% ?- unify_oeset([1,3,5,9|T1],[2,3,5,6|T2]).
%% T1 = [2, 6|_G481],
%% T2 = [1, 9|_G481].
