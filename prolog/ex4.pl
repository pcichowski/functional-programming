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
    
% [1,1,1,0] -> [0,1,1,1]
przesun_jedynki([L|Lista], [0|Shifted]) :-
    init(Lista, Init),
    append(Init, [1], Shifted).
    
% wykonaj ruch dostaje listę z jedynką na początku i nią probuje wykonać ruch
wykonaj_ruch(Lista, Po_ruchu) :-
    znajdz_do_zera(Lista, Do_zera) -> 
        (przesun_jedynki(Do_zera, Przesuniete),
        append(Do_zera, Od_zera, Lista), % Od_zera szukane
        append(Przesuniete, Od_zera, Po_ruchu))
        ; false.

koniec(Plansza) :-
    znajdz_do_pierwszej_jedynki(Plansza, Do_jedynki),
    append(Do_jedynki, X, Plansza),
    maplist(=(1), X),
    nl.

pierwszy_ruch(Plansza) :-
    write("\nplansza startowa "),
    write(Plansza),
    write("\n"),
    ruchy(Plansza).

% funkcja rekurencyjna do ruch_worker
ruchy(Plansza) :-
    ruch_worker(Plansza, Wynik),
    nl,
    write(Wynik),
    ruchy(Wynik).

% wykonuje ruch dla każdej jedynki na planszy
ruch_worker(Plansza, Output) :-
    split_by_jeden(Plansza, X, Y),
    wykonaj_ruch(Y, Po_ruchu),
    append(X, Po_ruchu, Output).

% funkcja zwroci każde możliwe podzielenie planszy z jedynką na początku
% np [0,1,0,0,1,0] -> X = [0], Y = [1,0,0,1,0]
%                     X = [0,1,0,0], Y = [1,0]
split_by_jeden(Lista, X, [1|L]) :-
    append(X, [1|L], Lista).
    
    


znajdz_do_zera([],_) :- false.
znajdz_do_zera([0|_], [0]).
znajdz_do_zera([L|Lista], [L|R]) :- 
    znajdz_do_zera(Lista, R).

znajdz_do_pierwszej_jedynki([],_) :- false.
znajdz_do_pierwszej_jedynki([1|_], []) :- !.
znajdz_do_pierwszej_jedynki([L|Lista], [L|R]) :- 
    znajdz_do_pierwszej_jedynki(Lista, R).


    

po_jedynkach([1|Lista], Output) :-
    wykonaj_ruch([1|Lista], Po_ruchu).

po_jedynkach([0|Lista], Output) :-
    po_jedynkach(Lista, Output).


all_jedynki([1]).
all_jedynki([L|Lista]) :-
    all_jedynki(Lista).

same_zero_jedynki([0|Lista]) :-
    all_jedynki(Lista).

usun_jedynki_z_przodu(Lista, Lista) :-
    same_zero_jedynki(Lista).
usun_jedynki_z_przodu([H|Hs], Output) :-
    usun_jedynki_z_przodu(Hs, Output).


znajdz_od_zera(Lista, Os) :-
    usun_jedynki_z_przodu(Lista, [O|Os]).
    
generuj_pionki_do_ruchu(L,W) :- znajdz_do_zera(L, X), append(X, W, L).
ruszaj(L,W) :- generuj_pionki_do_ruchu(L, X), wykonaj_ruch(X, W).
    
generuj_pionki([0|Lista], W) :-
    generuj_pionki(Lista, W).
  generuj_pionki([1|Lista], W) :-
     wykonaj_ruch([1|Lista], W),
     generuj_pionki(Lista, W).