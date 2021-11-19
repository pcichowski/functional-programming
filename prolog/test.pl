loves(romeo,juliet).

loves(juliet, romeo) :- loves(romeo,juliet).

happy(albert).
happy(alice).
happy(bill).
happy(bob).
with_albert(alice).

runs(albert) :-
    happy(albert).

dances(alice) :-
    happy(alice),
    with_albert(alice).

does_alice_dance(alice) :-
    dances(alice),
    write('She dances').

swims(bob) :-
    happy(bob).


%%%%%%%%%%%%%%%%%%%%%%

parent(albert, bob).
parent(albert, betsy).
parent(albert, bill).
 
parent(alice, bob).
parent(alice, betsy).
parent(alice, bill).
 
parent(bob, carl).
parent(bob, charlie).

% Find Carl's grandparent
get_grandparent :-  
    parent(Y, carl),
    parent(X, Y),
    format('~w ~s grandparent ~n', [X, 'is the']).
% = X = albert, Y = bob, X = alice

stabs(tybalt, mercutio, sword).
hates(romeo, X) :- stabs(X, mercutio, sword).
% hates(romeo, X). = X = tybalt
 
what_grade(5) :-
    write('Go to kindergarten').
what_grade(6) :-
    write('Go to first grade').
what_grade(Other) :-
    Grade is Other - 5,
    format('Go to grade ~w', [Grade]).

