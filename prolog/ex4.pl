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
    

    