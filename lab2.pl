/*Воронов, Павлов, Левицкий и Сахаров четыре талантливых молодых человека. 
Один из них танцор, другой художник, третий певец, четвертый писатель. 
Воронов и Левицкий сидели в зале консерватории в тот вечер, когда певец дебютировал в сольном концерте. 
Павлов и писатель вместе позировали художнику. 
Писатель написал биографическую повесть о Сахарове и собирается написать о Воронове. 
Воронов никогда не слышал о Левицком. Кто чем занимается?*/

work('dancer').
work('painter').
work('singer').
work('writer').

surname('Voronov').
surname('Pavlov').
surname('Levitsky').
surname('Saharov').


check('Voronov',A,'Pavlov',B,'Levitsky',C,'Saharov',D):-
	(C='writer',!,A\='painter');
	(C='painter',!,A\='writer').
	
main(Result):-
	Result=[[Person1,Work1],[Person2,Work2],[Person3,Work3],[Person4,Work4]],
	surname(Person1),
	surname(Person2),
	surname(Person3),
	surname(Person4),	

	Person1\=Person2, Person1\=Person3, Person1\=Person4,
	Person2\=Person3, Person2\=Person4,
	Person3\=Person4,
	
	work(Work1),
	work(Work2),
	work(Work3),
	work(Work4),	

	Work1\=Work2, Work1\=Work3, Work1\=Work4,
	Work2\=Work3, Work2\=Work4,
	Work3\=Work4,
	Work1\='singer',
	Work3\='singer',
	Work2\='writer',
	Work2\='painter',
	Work4\='writer',
	Work1\='writer',
	check(Person1,Work1,Person2,Work2,Person3,Work3,Person4,Work4),!.