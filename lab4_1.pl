%1.3
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
%1.4
		memberCount1(_,[],0):-!.
		memberCount1(X,List,Number):-
			delete(List,X,L1),
			subtract(List,L1,L2),
			length(L2,Number).
		
		memberCount2(_,[],0):-!.
		memberCount2(X,[X|List],Number):-
			memberCount2(X,List,N1),
			Number is N1 + 1,!.
		memberCount2(X,[_|List],Number):-
			memberCount2(X,List,Number),!.
%1.5
		memberMax1(List,R):-
			max_list(List,R).
		
		memberMax2([X],X):-!, true.
		memberMax2([L|List], M):-
			memberMax2(List,M),
			M >= L,!.
		memberMax2([L|List],L):-
			memberMax2(List,M),
			L > M,!.
%1.6
		countOfMaxMember(List,Res):-
			memberMax2(List,X),
			memberCount2(X,List,Res).
