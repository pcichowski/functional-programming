{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
module Main where
main :: IO ()
main =
 return ()

{- funkcja usuwa listy elementow których liczba jest wieksza niż 1
   np. [[1,1,1], [2,2], [3], [4, 4, 4], [5]] ==>  [[3], [5]] -}
usunDuplikaty :: [[a]] -> [[a]]
usunDuplikaty [] = []
usunDuplikaty [[]] = [[]]
usunDuplikaty (x:xs) =
 if length x > 1
  then  usunDuplikaty xs
 else x : usunDuplikaty xs

{- funkcja grupuje elementy w krotki
   np. [1, 1, 1 , 2, 2, 2, 2, 3]  ==>  [[1, 1, 1], [2, 2, 2, 2], [3]] 
   identyczna funkcja: 
   grupuj lista = 
    foldr dodajJezeliRowne [] lista    -}
grupuj :: Eq a => [a] -> [[a]]
grupuj =
 foldr dodajJezeliRowne []

{- funkcja doda element x do listy list jeżeli składa się ona z elementów x 
   np. dodajJezeliRowne 1 [[1, 1, 1], [2, 2], [1, 1]]  ==>  [[1, 1, 1, 1], [2, 2], [1, 1]] 
   np. dodajJezeliRowne 3 [[5, 5, 5], [4], [3, 3]]   ==>  [[3], [5, 5, 5], [4], [3, 3]]-}
dodajJezeliRowne :: Eq a => a -> [[a]] -> [[a]]
dodajJezeliRowne x [] = [[x]]
dodajJezeliRowne x (y:xs) =
 if x == head y
  then (x:y):xs
 else [x]:y:xs

przeniesPierwszyElement :: [a] -> [[a]] -> [a]
przeniesPierwszyElement xs (y:ys) =
 xs ++ y

{- funkcja zamienia listę krotek na listę elementów w tej samej kolejności
   np. [(1, 2), (1, 7), (8, 6)] ==> [1, 2, 1, 7, 8, 6] -}
rozkrotkuj :: [(a,a)] -> [a]
rozkrotkuj [] = []
rozkrotkuj (x:xs) = fst x : snd x : rozkrotkuj xs

qsort :: (Ord a) => [a] -> [a]
qsort [] = []
qsort (x:xs) =
 qsort [a | a <- xs, a < x] {- partycja mniejsza od x -}
 ++ [x] ++
 qsort [b | b <- xs, b >= x] {- partycja wieksza rowna x -}

{- konwertuj zamienia listę list na listę 
   np. [[3], [8]]  =>  [3, 8]-}
konwertuj :: [[a]] -> [a]
konwertuj [] = []
konwertuj ([x]:xs) =
 x : konwertuj xs

konwertuj' :: [(a, b)] -> (a, b)
konwertuj' [(a,b)] =
 (a,b)

{- wierzchołki zwraca wierzchołki pierwszego stopnia(liście) z grafu (z formatu wejściowego)
   np. [(1, 3), (3, 5)]  =>  [1, 5] -}
wierzcholki :: (Ord a) => [(a, a)] -> [a]
wierzcholki x =
 konwertuj (usunDuplikaty (grupuj (qsort (rozkrotkuj x))))

{- zwraca krotke z elementem podanym jako drugi argument
np. [(1,2),(1,3)] 2 => (1,2) -}
wytnijKrotke :: Eq a => [(a, a)] -> a -> (a, a)
wytnijKrotke l y =
 if y `elem` rozkrotkuj l
  then head (filter (\x -> fst x == y || snd x == y) l)
 else head l

{- wybiera inny element z krotki 
np. (1,2) 2 => 1-}
wybierzZKrotki :: Eq a => (a, a) -> a -> a
wybierzZKrotki (x, y) z
 | x == z = y
 | y == z = x
 | otherwise = x

{- zwraca liste krotek bez krotki, w której znajduje sie element podany jako argument
np. [(1,2),(1,3),(1,4)] 2 => [(1,3),(1,4)]-}
wytnijReszte :: Eq a => [(a,a)] -> a -> [(a,a)]
wytnijReszte l y =
 if y `elem` rozkrotkuj l
  then filter (\x -> fst x /= y && snd x /= y) l
 else l

generujPrufera :: (Eq a, Ord a )=> [(a,a)] -> [a] -> [a]
generujPrufera []  _ = []
generujPrufera krotki wynik =
 wynik 
 ++ generujPrufera (wytnijReszte krotki (head (wierzcholki krotki)))
  [wybierzZKrotki (wytnijKrotke krotki (head (wierzcholki krotki))) (head (wierzcholki krotki))]