%2.1
	sum([],0):-!.
	sum([L|List],S):-
		sum(List,SS),
		S is L + SS.

	averageForSubject(Sb,X):-
		findall(M,grade(_,_,Sb,M),Ma),
		sum(Ma,S),
		length(Ma,R),
		X is S / R.

	averageForAllSubject(Sb,X):-
		findall(S,grade(_,'Petrov',S,_),Res),
		member(Sb,Res),
		averageForSubject(Sb,X).
%2.2
	countNotPassedForGroup(N,X):-
		findall(Y,grade(N,Y,_,2),AA),
		length(AA,X).
		
		
	countNotPassedForAllGroup(Group,K):-
		member(Group,[101,102,103,104]),
		countNotPassedForGroup(Group,K).
%2.3
	countNotPassedForSubject(Sb,X):-
		findall(F,grade(_,F,Sb,2),FA),
		length(FA,X).
		
	countNotPassedForAllSubject(Sb,X):-
		findall(F,grade(_,'Petrov',F,_),FA),
		member(Sb,FA),
		countNotPassedForSubject(Sb,X).
