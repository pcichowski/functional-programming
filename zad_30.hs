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
   np. [(1, 2), (1, 7), (8, 6)] ==> [1, 2, 1, 7, 8 ,6] -}
rozkrotkuj :: [(a,a)] -> [a]
rozkrotkuj [] = []
rozkrotkuj (x:xs) = fst x : [snd x] ++ rozkrotkuj xs



