%
:- [setmemb].

% unify open ended maps with possibly uninstantiated variable tail at the end
unify_oemap(A,B) :- ( var(A); var(B) ), !, A=B.
unify_oemap(A,B) :-
       	split_heads(A,Xs-T1), make_map(Xs,M1),
       	split_heads(B,Ys-T2), make_map(Ys,M2),
	unify_oe_map(M1-T1, M2-T2).

make_map(L,M) :- setof(X:V,first(X:V,L),M). % remove duplicates

split_heads([],[]-[]).
split_heads([X:V|T],[X:V]-T) :- var(T), !, true.
split_heads([X:V|Ps],[X:V|Hs]-T) :- split_heads(Ps,Hs-T).

% helper function for unify_oemap
unify_oe_map(Xs-T1,Ys-T2) :- T1==[], T2==[], unify_map(Xs,Ys).
unify_oe_map(Xs-T1,Ys-T2) :- T1==[], submap_of(Ys,Xs), mapminus(Xs,Ys,T2).
unify_oe_map(Xs-T1,Ys-T2) :- T2==[], submap_of(Xs,Ys), mapminus(Ys,Xs,T1).
unify_oe_map(Xs-T1,Ys-T2) :- 
	mapminus(Ys,Xs,L1), append(L1,T,T1),
       	mapminus(Xs,Ys,L2), append(L2,T,T2).

%% ?- unify_oemap([z:string,y:bool|M1],[y:T,x:int|M2]).
%% M1 = [x:int|_G1426],
%% T = bool,
%% M2 = [z:string|_G1426].
