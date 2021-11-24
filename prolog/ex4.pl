:- include('ex1-test.pl').

tworz_plansze_zer(N, Pusta_Plansza) :-
    length(Pusta_Plansza, N),
    maplist(=(0), Pusta_Plansza).
tworz_plansze_jedynek(N, Plansza) :-
    length(Plansza, N),
    maplist(=(1), Plansza).

% N - dlugosc planszy, M - liczba pionkow
tworz_plansze(N, M, Plansza) :-
    Liczba_zer is N - M,
    tworz_plansze_zer(Liczba_zer, Plansza_1),
    tworz_plansze_jedynek(M, Plansza_2),
    append(Plansza_1, Plansza_2, Polaczone_plansze),
    random_permutation(Polaczone_plansze, Plansza).
    
takeout(X,[X|R],R).  
takeout(X,[F |R],[F|S]) :- takeout(X,R,S).

perm([X|Y],Z) :- perm(Y,W), takeout(X,Z,W).  
perm([],[]).


dla_jedynek([X,Y|R], [0,1|R]) :-
    X = 1,
    Y = 0.
dla_jedynek([X,Y|R], E) :-
    X = 1,
    Y = 1.
    % znajdz miejsce gdzie wskoczyc
    % przesun jedynki od tego elementu w prawo i ustaw zero na tym elemencie
    
% [1,1,1,0,0,1,0] -> [0,1,1,1,0,1,0]
przesun_jedynki(Lista, Li) :-
    L = 0,

    length(Lx, N).

znajdz_do_zera([0|_], [0]).
znajdz_do_zera([L|Lista], [L|R]) :- 
    znajdz_do_zera(Lista, R).



all_jedynki([1]).
all_jedynki([1|T]) :-
    all_jedynki(T).

same_zero_jedynki([0|Lista]) :-
    all_jedynki(Lista).

usun_jedynki_z_przodu(Lista, Lista) :-
    same_zero_jedynki(Lista).
usun_jedynki_z_przodu([H|Hs], Output) :-
    usun_jedynki_z_przodu(Hs, Output).


znajdz_od_zera(Lista, Os) :-
    usun_jedynki_z_przodu(Lista, [O|Os]).
    
    