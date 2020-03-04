

nieme1(1,[X|_],X) :- !.
nieme1(N,[_|R],X) :- N1 is N-1, nieme1(N1,R,X).

nieme2(1,[X|_],X) :- !.
nieme2(N,[_|Q],X):- nieme2(M,Q,X),N is M+1.

affiche([]).
affiche(T):-write('['),afficheInside(T),write(']').
afficheInside([]).
afficheInside([T]):-write(T).
afficheInside([T|Q]):-write(T),write(','),afficheInside(Q).

taille([],X):- X is 0.
taille([_|Q],Tot):- taille(Q,S), Tot is 1+S.

affiche2([]).
affiche2([T|Q]):- affiche(Q),write(T).

%substitue(+X,+Y,+L1,-L2)
substitue(_,_,[],[]).
substitue(X,Y,[X|Q1],L2):- substitue(X,Y,Q1,L3),append([Y],L3,L2).
substitue(X,Y,[Z|Q1],L2):-substitue(X,Y,Q1,L3),append([Z],L3,L2).


%substitue(_,_,[],[]).
%substitue(X,Y,[X|L1],[Y|L2]):-substitue(X,Y,L1,L2).
%substitue(X,Y,[Z|L1],[Z|L2]):-substitue(X,Y,L1,L2).

test([],[]).
test([X|L1],[X|L2]):-test(L1,L2).

test2(X,[_|Q]):- test2(X,Q).
test2(X,[X|Q1]):- write(Q1).

%selection(L,LI,R)
selection([],[],[]).
selection([],_,[]).
selection(L1,L2,R):-selection(L1,L2,R,1).
selection([],_,[],_).
selection([T1|Q1],[N|Q2],[T1|R],N):-N1 is N+1,selection(Q1,Q2,R,N1),!.
selection([_|Q1],L1,R,N1):-N is N1+1,selection(Q1,L1,R,N).



%maxliste(L,?M)

maxliste([T],T).
maxliste([T|Q],M):-maxliste(Q,M),M>T.
maxliste([T|Q],T):-maxliste(Q,M),T>=M.


%fusion(+L1,+L2,?L3)
fusion([],L,L).
fusion([T|Q],L,[T|R]):-fusion(Q,L,R).

%position(+X,+L,?N)
position(X,[X|_],1):-!.
position(X,[_|Q],N):-position(X,Q,N1),N is N1+1.

%position2(+X,+L,?N)
position2(X,[X|_],1).
position2(X,[_|Q],N):-position2(X,Q,N1),N is N1+1.

%ad(+L,?X)
ad(X,[X|[_]]):-!.
ad(X,[_|Q]):-ad(X,Q).

dernier(X,[X]):-!.
dernier(X,[_|Q]):-dernier(X,Q).

%somme(+L,?X)
somme([],0).
somme([T|Q],X):-somme(Q,X1),X is T+X1.


%%retourne(+L,?L1)
retourne([],[]).
retourne([T|Q],L1):-retourne(Q,R1),append(R1,[T],L1).

%triee(+L)
triee([]).
triee([P,S|R]):-S>=P,triee(R).

%insert(+X,+L,-R)
insert(_,[],[]).
insert(X,[T,X2|Q],[T,X,X2|Q2]):-X>=T,X2>=X,insert(X,Q,Q2).
insert(X,[T|Q],[T|Q2]):-insert(X,Q,Q2).

%sous_ens(+L1,+L2)
sous_ens([],[]).
sous_ens([],[_]).
sous_ens([T|Q],[T1|Q2]):-T==T1,sous_ens(Q,Q2),!.
sous_ens(T,[_|Q2]):-sous_ens(T,Q2).

dernier2([T]):-write(T).
dernier2([_|Q]):-dernier2(Q).

%addition(X,Y,Z)
+(X,Y,Z):- Z is X+Y.
addition(X,Y,Z):- Z is X+Y.
multiplication(X,Y,Z):- Z is X*Y.
division(X,Y,Z):-Z is X/Y.
soustraction(X,Y,Z):-Z is X-Y.

appliquer([],_,[]).
appliquer([T1,T2|Q],O,[T|Q1]):-Pred=..[O,T1,T2,T],call(Pred),appliquer(Q,O,Q1).

recup_dansListe(Var,[T|_],R):-arg(1,T,T1),T1==Var,!,arg(2,T,R).
recup_dansListe(Var,[_|Q],R):-recup_dansListe(Var,Q,R).

%eval(+E,+L,?V)

eval(E,L,V):-
   E=..[O,X,Y],
   recup_dansListe(X,L,X1),
   recup_dansListe(Y,L,Y1),
   Pred=..[O,X1,Y1,V],
   call(Pred).

bio(louis13, h, 1601, 1643, henri4, marie_medicis).
bio(elisabeth_france, f, 1603, 1644, henri4, marie_medicis).
bio(marie_therese_autriche, f, 1638, 1683, philippe4, elisabeth_france).
bio(louis14, h, 1638, 1715, louis13, anne_autriche).
bio(grand_dauphin, h, 1661, 1711, louis14, marie_therese_autriche).
bio(louis_bourbon, h, 1682, 1712, grand_dauphin, marie_anne_baviere).
bio(philippe5, h, 1683, 1746, grand_dauphin, marie_anne_baviere).
bio(louis15, h, 1710, 1774, louis_bourbon, marie_adelaide_savoie).
bio(louis_dauphin, h, 1729, 1765, louis15, marie_leczcynska).
bio(louis16, h, 1754, 1793, louis_dauphin, marie_josephe_saxe).
bio(louis18, h, 1755, 1824, louis_dauphin, marie_josephe_saxe).
bio(charles10, h, 1757, 1836, louis_dauphin, marie_josephe_saxe).
bio(clotilde, f, 1759, 1802, louis_dauphin, marie_josephe_saxe).
bio(louis17, h, 1785, 1795, louis16, marie_antoinette).
bio(philippe1, h, 1640, 1701, louis13, anne_autriche).
bio(philippe2, h, 1674, 1723, philippe1, charlotte_baviere).
bio(louis_orleans, h, 1703, 1752, philippe, francoise_marie_bourbon).
bio(louis_philippe, h, 1725, 1785, louis_orleans, augusta_marie_bade).
bio(philippe_egalite, h, 1747, 1793, louis_philippe, louise_henriette_bourbon_conti).
bio(louis_philippe1, h, 1773, 1850, philippe_egalite, louise_marie_adelaide_bourbon).

enfant(Enfant,Parent):-bio(Enfant,_,_,_,Parent,_).
enfant(Enfant,Parent):-bio(Enfant,_,_,_,_,Parent).
petitEft(Petit,Gp):-enfant(Y,Gp),enfant(Petit,Y).
descendant(Descendant,Ascendant):-enfant(Descendant,Ascendant).
descendant(Descendant,Ascendant):-enfant(X,Ascendant),descendant(Descendant,X).

%findall(X,(bio(_,_,_,_,_,X),bio(X,f,_,_,_,_)),L).
%findall(X,(bio(X,_,Y,_,_,_),Y>=1700,Y=<1800),L),length(L,N).
%findall(X,(bio(_,_,_,_,_,X),bio(X,f,_,_,henri4,_)),L).
%findall(X,(bio(X,f,_,_,_,_),petitEft(X,henri4)),L),length(L,N).
