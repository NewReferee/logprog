parent(alexey, tolya).
parent(alexey, volodya).
parent(tolya, tima).
parent(gena, sergey).
parent(gena, alexey).
parent(gena, oleg).
parent(oleg, misha).


padej(tolya, toli, tolin).
padej(alexey, alexeya, alexeev).
padej(tima, timi, timin).
padej(volodya, volodi, volodin).
padej(gena, geni, genin).
padej(oleg, olega, olegov).
padej(misha, mishi, mishin).
padej(sergey, sergeya, sergeev).



move(equal, X, X).
move(brat, X, Y) :- parent(Moth, X), parent(Moth, Y), \+(move(equal, X, Y)).
move(papa, X, Y) :- parent(X, Y).
move(son, X, Y) :- parent(Y,X).
move(ded, X, Y) :- parent(X, W), parent(W, Y).

quest_first(A) :- member(A, ['Kto', kto]).
quest_second(A) :- member(A, [chei, 'Chei']).

% kto brat toli?
answer([A, B, C, '?'], Ans):-
	quest_first(A),
	move(B, _, _),
	padej(X, C, Y),
	(parent(X, _);parent(_, X)),
	findall(Q, move(B, Q, X), Ans),!.

% Chei brat volodya?
	answer([A, B, X, '?'], Ans):-
	quest_second(A),
	move(B, _, _),
	padej(X, C, _),
	(parent(X, _); parent(_, X)),
	findall(Q, (move(B, X, U), padej(U, Q, _)), Ans),!.

% volodya brat toli?
answer([A, B, C, '?'], Ans):-
	(parent(A, _); parent(_, A)),
	move(B, _, _),
	padej(X, C, _),
	move(B, A, X), !.