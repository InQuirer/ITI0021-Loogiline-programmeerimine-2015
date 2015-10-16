% #1 -- X = [1, a].
% yhisosa([1,2,a,3], [5,d,a,1], X).
yhisosa(L1, L2, X):-
	yhisosa(L1, L2, L2, X).

yhisosa([], _, _, []).

yhisosa([Head|L1], [Head|L2], Tmp, [Head|X]):-
	yhisosa(L1, L2, Tmp, X).

yhisosa(L1, [_|L2], Tmp, X):-
	yhisosa(L1, L2, Tmp, X),!.

yhisosa([_|L1], [], Tmp, X):-
	yhisosa(L1, Tmp, Tmp, X),!.

% #2 -- X = [1, 2, a, 3, 5, d].
% yhend([1,2,a,3], [5,d,a,1], X).
yhend(List, List2, X):-
	vahe(List2, List, Y),
	flatten([List|Y], X).
	
% second alternative.
yhend(L, [], L).

yhend(L, [H| T], R) :-
    (   check(H, L)
    ->  yhend(L, T, R)
    ;   lisa(L, [H], L1),
        yhend(L1, T, R)),!.
        
% #3 -- X = [2, 3].
% vahe([1,2,a,3], [5,d,a,1], X).
vahe([],_,[]).
vahe([X|Z],Y,R):-
	member(X,Y),!,
	vahe(Z,Y,R).
vahe([X|Z],Y,[X|R]):-
	vahe(Z,Y,R).

% #4 -- X = [[1,a],[2,a],[3,a],[1,b],[2,b],[3,b]].
% ristkorrutis([1,2,3], [a,b], X).
ristkorrutis(_,[], _):-!.
ristkorrutis([], _, _):-!.
ristkorrutis(L1, L2, X):-
	ristkorrutis(L1, L2, L1, X).
	
ristkorrutis(X, [_|X], _, X).

ristkorrutis([], [_|T], Tmp, X):-
	ristkorrutis(Tmp, T, Tmp, X),!.
	
ristkorrutis([H|T], [H1|T1], Tmp, [[H,H1]|X]):-
	ristkorrutis(T, [H1|T1], Tmp, X).

%helpers
inclusion(_, []).

inclusion(El, [El|T]):-
	inclusion(El, T),!.
	
inclusion(El, [_|T]):-
	not(inclusion(El, T)).

addToEnd(El, List, X):-
	reverse(Rlist, List),
	reverse([El|Rlist], X),!.

lisa([], R, R) .
lisa([H|T], R1, [H|R2]) :-
    lisa(T, R1, R2).


check(H, [H|_]).
check(H, [_|T]) :-
    check(H, T).

% test
teest([X], [X]).
teest([H|L], [H|X]):-
	teest(L, X).

a2b([a|Ta],[b|Tb]):-
	a2b(Ta,Tb).
