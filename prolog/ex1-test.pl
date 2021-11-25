% funkcja sortuje listę malejąco
sortuj(List, Sorted) :-
    sortuj([], List, Sorted).

sortuj(Left, [], Left).
sortuj([], [R | Rs], Sorted) :-
    sortuj([R], Rs, Sorted). 
sortuj([L | Ls], [R | Rs], Sorted) :-
    R > L, 
    sortuj([R, L | Ls], Rs, Sorted).
sortuj([L | Ls], [R | Rs], Sorted) :-
    R =< L,
    sortuj(Ls, [R, L | Rs], Sorted).

% Ys jest odwróceniem lustrzanym elementów Xs
reverse_list(Xs,Ys) :-
    reverse_worker(Xs,[],Ys) .

reverse_worker([],R, R).
reverse_worker([X|Xs],T,R) :-
    reverse_worker(Xs,[X|T],R) .

% funkcja sprawdza czy lista składa się z samych zer
all_zeroes([0]).
all_zeroes([H|T]) :-
    H = 0,
    all_zeroes(T).


% Przykład 1
% n=5, c=2,3,2,3,2
% posorutj ciąg: c=3,3,2,2,2
% odejmij 1 od od c1 elementów ciągu począwszy od c2 podstaw 0 do c1 c=0,2,1,1,2
% posorutj ciąg: c=2,2,1,1,0
% odejmij 1 od od c1 elementów ciągu począwszy od c2 podstaw 0 do c1 c=0,1,0,1,0
% posorutj ciąg: c=1,1,0,0,0
% odejmij 1 od od c1 elementów ciągu począwszy od c2 podstaw 0 do c1 c=0,0,0,0,0
% w ciągu zostały same zera a więc ciąg c=2,3,2,3,2 jest graficzny.

% funkcja sprawdza czy podana lista stopni wierzchołków odpowiada grafowi graficznemu
czy_graficzny(Lista) :-
    driver(Lista, X) -> (all_zeroes(X) -> true; czy_graficzny(X)); false.

% funkcja wykonuje kolejne kroki graficzności
driver(Lista, Output) :-
    sortuj(Lista, [S|Sorted]), % sortuj rosnąco
    sub_from_n(Sorted, S, R), % odejmij 1 od c1 elementow bez c1
    zero_first([S|R], Output). % ustaw c1 = 0 i skonkatenuj z resztą

% ustaw 0 na pierwszym elemencie listy
zero_first([_|Ls], [0|Ls]).

% predykat odejmujący jeden od elementu jeżeli nie jest zerem
sub_one(X, W) :- 
    X > 0,
    W is X - 1.
sub_one(X, _) :-
    X = 0,
    false.

% predykat odejmuje jeden od każdego elementu listy
sub_one_list(Lista, Output) :-
    maplist(sub_one, Lista, Output).

% znajduje init (elementy listy bez ostatniego)
init(Lista, Output) :- 
    append(Output, [_], Lista).

% zwraca dlugosc listy
dlugosc( [],0 ).
dlugosc( [_|T],L ) :- dlugosc( T,P ), L is P + 1.

% odejmuje od N pierwszych elementow
sub_from_n(Lista, N, Output) :- 
    dlugosc(Lista, Dlugosc),
    Dlugosc = N,                 % jesli lista.len() == N,
    sub_one_list(Lista, Output). %  odejmij jeden od wszystkich

% przypadek kiedy lista.len() jest wieksza niż N
sub_from_n(Lista, N, Output) :- 
    init(Lista, R),
    sub_from_n(R, N, O),
    last(Lista, Last),
    append(O, [Last], Output).



%%%%%%%%%%%%%%%%%%%%
% SPÓJNOŚĆ
%%%%%%%%%%%%%%%%%%%%

% predykat sprawdza czy lista składa się z jednego zera
is_zero_element_list(List):-
    List = [0].

% predykat sprawdza czy zero istnieje w liscie
if_not_zero_present([]).
if_not_zero_present([H|T]) :- H \= 0, if_not_zero_present(T).

% predykat sprawdza czy graf w postaci listy stopni wierzcholkow jest spojny
czy_spojny(Lista):-
    czy_graficzny(Lista) ->(wykonaj_krok(Lista));false.

% funkcja wykonuje krok sprawdzania spojności
wykonaj_krok(Lista):-
    is_zero_element_list(Lista) -> true;    % czy lista sklada sie z zera
    if_not_zero_present(Lista) ->(          % czy zero istnieje w liscie
    sortuj(Lista,PosortowanaLista),         % sortuj rosnaco
    last(Lista, Last),                      % wyodrebnij ostatni element
    sub_from_n(PosortowanaLista,Last,WynikowaLista),    % odejmij jeden od pierwszych Last elementow
    init(WynikowaLista,ListaBezOstatniego),             % wyodrebnnij wszystkie oprocz ostatniego
    wykonaj_krok(ListaBezOstatniego));false.            % jezeli zero istnieje wykonaj kolejny krok