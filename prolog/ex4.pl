:- include('ex1-test.pl').

tworz_plansze(N, Pusta_Plansza) :-
    length(Pusta_Plansza, N),
    maplist(=(0), Pusta_Plansza).


dodaj_pionka_posortuj(Plansza, Output) :-
    random_member(X, Plansza),
    X is 1,
    sortuj(Plansza, Output).
    

populuj_plansze(M, Plansza).

    