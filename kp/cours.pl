sister_in_law(X,C):-
	marrieds(X,Y),
	father(F,Y),
	mother(M,Y),
	father(F,C),
	mother(M,C),
	mother(C).
	
marrieds(Y,T):-
	father(T,C),
	mother(Y,C),!.
	
mother(M):-
	mother(M,_),!.