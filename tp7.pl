analyse([qui|L]):-etat2(L).
etat2([est|L]):-etat3(L).

etat3([le|L]):-etat4(L).
etat3([l|L]):-etat5(L).
etat3([la|L]):-etat10(L).

etat4([pere|L]):-etat6(L).
etat4([frere|L]):-etat6(L).
etat4([neveu|L]):-etat6(L).

etat5([oncle|L]):-etat6(L).
etat5([ancetre|L]):-etat6(L).
etat6([d|L]):-etat7(L).
etat6([de|L]):-etat8(L).
etat6([du|L]):-etat4(L).

etat7([andre]).

etat8([bernard]).
etat8([caroline]).
etat8([babar]).
etat8([l|L]):-etat5(L).
etat8([la|L]):-etat10(L).

etat10([mere|L]):-etat6(L).
etat10([soeur|L]):-etat6(L).

motVide(qui).
motVide(est).
motVide(le).
motVide(l).
motVide(la).
motVide(du).
motVide(de).
motVide(d).

nettoie([],[]).
nettoie([L|Q],R):-motVide(L),!,nettoie(Q,R).
nettoie([L|Q],[L|R]):-nettoie(Q,R).

reponse1([Predicat,Individu],X):-Pred..=[Predicat,Individu],X is call(Pred).
