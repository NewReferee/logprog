%length
    myLength([], 0):-!.
    myLength([_|L],N):-
	myLength(L,M), 
	N is M + 1.
%member
    myMember(X,[X|_]):-!.
    myMember(X,[_|L]):-
	myMember(X,L).
%append
    myAppend([],L,L):-!.
    myAppend([X|L1],L2,[X|L3]):-
	myAppend(L1,L2,L3).
%remove
    myRemove(X,[X|T],T):-!.
    myRemove(X,[Y|T],[Y|Z]):-
	myRemove(X,T,Z).
%permute
    myPermute([],[]):-!.
    myPermute(L,[X|T]):-
	myRemove(X,L,Y), 
	myPermute(Y,T).
%sublist
    mySublist(S, L):-
	myAppend(_, L1, L), 
	myAppend(S, _, L1).

%last element
    myLastElement([S|[]], S):-!.
    myLastElement([S|L], X):-
	myLastElement(L,Z),
	X is Z.

%sum_elements
    mySum([], 0):-!.
    mySum([S|L], X):-
	mySum(L, Y),
	X is Y + S.