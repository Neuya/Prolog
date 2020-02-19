

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