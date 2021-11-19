swapIfGreater([A,B], [B,A]) :- A > B.
swapIfGreater([A,B], [A,B]).

% użycie przytnij (list, X).
przytnij([A|T], T).

dolacz( [],L,L ).
dolacz( [H|T],L,[H|X] ) :- dolacz( T,L,X ).

gnomuj([], []).
gnomuj([A,B|T], Sorted) :- gnomuj([C|S], Sorted), Sorted is dolacz([A], S).


driver([A, B | T]) :- A =< B, driver([B | T]).
driver(Poprzedni, [A, B | T]) :- A > B, driver([]).

isSorted([]).
isSorted([_]).
isSorted([X, Y|T]) :- X =< Y, isSorted([Y|T]).


reverse(Xs, Ys) :-
    reverse(Xs, [], Ys, Ys).
    
  reverse([], Ys, Ys, []).
  
  reverse([X|Xs], Rs, Ys, [_|Bound]) :-
    reverse(Xs, [X|Rs], Ys, Bound).


odwroc(Xs, Ys) :-
    odwroc(Xs, [], Ys, Ys).

odwroc([], Ys, Ys, []).

odwroc([X|Xs], Rs, Ys, [_|Bound]) :-
    reverse(Xs, [X|Rs], Ys, Bound).



gnomesort(List, Sorted) :-
    gnomesort([], List, Sorted).

gnomesort(Left, [], Sorted) :-
    reverse(Left, Sorted).

gnomesort([], [R | Rs], Sorted) :-
    gnomesort([R], Rs, Sorted). 
gnomesort([L | Ls], [R | Rs], Sorted) :-
    R =< L, 
    gnomesort([R, L | Ls], Rs, Sorted).
gnomesort([L | Ls], [R | Rs], Sorted) :-
    R > L,
    gnomesort(Ls, [R, L | Rs], Sorted).