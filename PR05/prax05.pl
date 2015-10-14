% #1
viimane_element(El, [El]).
viimane_element(El, [_|Tail]):-
	viimane_element(El, Tail).

% #2
on_palindroom(List):-
	reverse(List, List).
  
% #3
paki([], []).
paki([List], [List]).
paki([El, El|Tail], X):-
	paki([El|Tail], X).
	
paki([El1, El2|Mid], [El1|Tail]):-
	El1 \= El2,
	paki([El2|Mid], Tail).

% #4
duplitseeri([], []).
duplitseeri([El|Mid], [El, El|Tail]):-
	duplitseeri(Mid, Tail).

% #5
kordista(List, N, X):-
	kordista(List, N, X, N).
kordista([], _, [], _).
kordista([_|Mid], N, Tail, 0):-
	kordista(Mid, N, Tail, N).
kordista([Head|Mid], N, [Head|Tail], K):-
	K > 0,
	K1 is K - 1,
	kordista([Head|Mid], N, Tail, K1).
