%
memb(X,[X|_]).
memb(X,[Y|L]) :- X \== Y, memb(X,L).

% unify finite sets with [] at the end
unify_set(A,B) :- subset_of(A,B), subset_of(B,A).

subset_of([], _).
subset_of([X|R],L) :- memb(X,L), subset_of(R,L).

% unify open ended sets with possibliy uninstantiated varible tail at the end
unify_oeset(A,B) :- ( var(A); var(B) ), !, A=B.
unify_oeset(A,B) :- split_heads(A,Xs-T1), split_heads(B,Ys-T2),
                    unify_oe_set(Xs-T1, Ys-T2).

split_heads([],[]-[]).
split_heads([X|T],[X]-T) :- var(T), !, true.
split_heads([X|Xs],[X|Hs]-T) :- split_heads(Xs,Hs-T).

% helper function for unify_oeset
unify_oe_set(Xs-T1,Ys-T2) :- T1==[], T2==[], unify_set(Xs,Ys).
unify_oe_set(Xs-T1,Ys-T2) :- T1==[], subset_of(Ys,Xs), T2=Xs.
unify_oe_set(Xs-T1,Ys-T2) :- T2==[], subset_of(Xs,Ys), T1=Ys.
unify_oe_set(Xs-T1,Ys-T2) :- append(Xs,Ys,Zs), append(Zs,T,T1), append(Zs,T,T2).

