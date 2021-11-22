gnomesort(List, Sorted) :-
    gnomesort([], List, Sorted).

gnomesort(Left, [], Sorted) :-
    reverse_list(Left, Sorted).
gnomesort([], [R | Rs], Sorted) :-
    gnomesort([R], Rs, Sorted). 
gnomesort([L | Ls], [R | Rs], Sorted) :-
    R =< L, 
    gnomesort([R, L | Ls], Rs, Sorted).
gnomesort([L | Ls], [R | Rs], Sorted) :-
    R > L,
    gnomesort(Ls, [R, L | Rs], Sorted).


reverse_list(Xs,Ys) :-
    reverse_worker(Xs,[],Ys) .

reverse_worker([],R, R).
reverse_worker([X|Xs],T,R) :-
    reverse_worker(Xs,[X|T],R) .

all_zeroes([0]).
all_zeroes([H|T]) :-
    H = 0, all_zeroes(T).

% Przykład 1
% n=5, c=2,3,2,3,2
% posorutj ciąg: c=3,3,2,2,2
% odejmij 1 od od c1 elementów ciągu począwszy od c2 podstaw 0 do c1 c=0,2,1,1,2
% posorutj ciąg: c=2,2,1,1,0
% odejmij 1 od od c1 elementów ciągu począwszy od c2 podstaw 0 do c1 c=0,1,0,1,0
% posorutj ciąg: c=1,1,0,0,0
% odejmij 1 od od c1 elementów ciągu począwszy od c2 podstaw 0 do c1 c=0,0,0,0,0
% w ciągu zostały same zera a więc ciąg c=2,3,2,3,2 jest graficzny.

%funkcja ktora bedzie wywolywana w petli
driver([L|Ls], Output) :-
    sub_from_n(Ls, L, S),
    Output is [0|S].


sub_one(X, W) :- W is X - 1.
sub_one_list(Lista, Output) :-
    maplist(sub_one, Lista, Output).

% znajduje init (elementy listy bez ostatniego)
init(Lista, Output) :- 
    append(Output, [_], Lista).

dlugosc( [],0 ).
dlugosc( [_|T],L ) :- dlugosc( T,P ), L is P + 1.

% odejmuje od N pierwszych elementow
sub_from_n(Lista, N, Output) :- 
    dlugosc(Lista, Dlugosc),
    Dlugosc = N,
    sub_one_list(Lista, Output). % jesli lista.len() == N, odejmij jeden od wszystkich

sub_from_n(Lista, N, Output) :- 
    init(Lista, R),
    sub_from_n(R, N, O),
    last(Lista, Last),
    append(O, [Last], Output).

czy_graficzny(Lista) :- all_zeroes(Lista).

czy_graficzny([L|Ls], X) :- gnomesort([L|Ls], [S|Sorted]). 
    