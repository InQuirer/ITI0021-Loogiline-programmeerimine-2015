%====================== NÄIDE 2 ====================
% Omaduste pärimine klasside vahel
%==================================================

 % ------ Klass-alamklass seos ------
is_a(loom,elusolend).
is_a(taim,elusolend).
is_a(herbivoor,loom).
is_a(karnivoor,loom).
is_a(omnivoor,loom).
is_a(oistaim,taim).
is_a(mitteoistaim,taim).

is_a(rebane,karnivoor).
is_a(lehm,herbivoor).
is_a(maasi,lehm).
is_a(fennec_fox, rebane).
is_a(forest_fox, rebane).
is_a(kapsas,mitteoistaim).
is_a(kana,herbivoor).
is_a(wild_fennec_fox, fennec_fox).
is_a(home_fennec_fox, fennec_fox).
is_a(kitty, kana).
% ----------------- Klasside omadused ---------
   toitub(elusolend).
   hingab(elusolend).
   paljuneb(elusolend).
   kasvab(elusolend).
   liigub(loom).

%-----------------------------------------------------------------------------
%		Konkreetsete omaduste pärimise reeglid
%-----------------------------------------------------------------------------
alamklass(X,Y):- is_a(X,Y),!.
alamklass(X,Y):- is_a(X,W), alamklass(W,Y).

   toitub(R):- alamklass(R,S), toitub(S),!.
   hingab(M):- alamklass(M,N), hingab(N),!.
   paljuneb(X):- alamklass(X,Y), paljuneb(Y),!. 
   kasvab(V):- alamklass(V,W), kasvab(W),!.
   liigub(P):- alamklass(P,Q), liigub(Q),!.
   
%soob(X,Y):- alamklass(X,V), alamklass(Y,W), soob(V,W).
soob(Kes,Keda,Millal):-
	Millal > 06.01,
	Millal < 21.59,
	is_a(Kes,P),
	is_a(Keda,Q),
	P\=Q,
	soob(X,Y),
	taimne_toit(Keda),
	alamklass(Kes,X),
	alamklass(Keda,Y),!.
	
soob(Kes,Keda,Millal):-
	(Millal < 06.00;
	Millal > 22.00),
	is_a(Kes,P),
	is_a(Keda,Q),
	P\=Q,
	soob(X,Y),
	loomne_toit(Keda),
	alamklass(Kes,X),
	alamklass(Keda,Y),!.

soob(herbivoor, taim).
soob(karnivoor, loom).
soob(omnivoor, taim).
soob(omnivoor, loom).

loomne_toit(X):-alamklass(X,Y),loomne_toit(Y),!.
loomne_toit(loom).
taimne_toit(X):-alamklass(X,Y),taimne_toit(Y),!.
taimne_toit(taim).


%------------------ Omaduse tuvastamise üldine reegel --------------------
omadus(Om_nimi, Om_subjekt):-
	alamklass(Om_subjekt,Esivanem),
	Term =.. [Om_nimi,Esivanem],
	Term.