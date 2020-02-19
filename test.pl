% ----------------------------------------------------------------------
% -
% - BD parentale 
% -
% ----------------------------------------------------------------------
% faits
pere(paul,luc).
pere(guy,aude).
pere(luc,anne).
pere(luc,eric).

mere(rose,luc).
mere(ines,aude).
mere(aude,anne).
mere(aude,eric).

% règles
% X est un parent de Y
parent(X,Y) :-
    pere(X,Y).
parent(X,Y) :-
    mere(X,Y).

% X et Y sont les parents de Z
parents(Pere,Mere,Enfant) :-
    pere(Pere,Enfant),
    mere(Mere,Enfant).

% X est un enfant de Y
enfant(X,Y) :-
    parent(Y,X).

% X est un grand-père de Y
grand_pere(X,Y) :-
    pere(X,Z),
    parent(Z,Y).

% X est un descendant de Y
descendant(X,Y) :-
    parent(Y,X).
descendant(X,Y) :-
    parent(Z,X),
    descendant(Z,Y).
