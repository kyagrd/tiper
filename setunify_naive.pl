%
:- [setmemb].

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

% helper function for unify_oeset (naive solution, possibly many duplication)
unify_oe_set(Xs-T1,Ys-T2) :- T1==[], T2==[], unify_set(Xs,Ys).
unify_oe_set(Xs-T1,Ys-T2) :- T1==[], subset_of(Ys,Xs), T2=Xs.
unify_oe_set(Xs-T1,Ys-T2) :- T2==[], subset_of(Xs,Ys), T1=Ys.
unify_oe_set(Xs-T1,Ys-T2) :- append(Xs,Ys,Zs), append(Zs,T,T1), append(Zs,T,T2).



%% ?- unify_oeset([1,3,5,9|T1],[2,3,5,6|T2]).
%% T1 = T2, T2 = [1, 3, 5, 9, 2, 3, 5, 6|_G505].
