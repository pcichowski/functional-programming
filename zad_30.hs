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
rozkrotkuj (x:xs) = fst x : [snd x] ++ rozkrotkuj xs

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

{- wierzchołki zwraca wierzchołki pierwszego stopnia z grafu (z formatu wejściowego)
   np. [(1, 3), (3, 5)]  =>  [1, 5] -}
wierzcholki :: (Ord a) => [(a, a)] -> [a]
wierzcholki x =
 konwertuj (usunDuplikaty (grupuj (qsort (rozkrotkuj x))))

{-
TODO
   Couldn't match type ‘a’ with ‘a -> a’
   Expected: [a]
    Actual: [a -> a]
LINIJKA 77
-}
rob :: Ord a => [(a, a)] -> [a] -> [a]
rob l (y:ys) =
 let elementNaWyjscie = wybierzZKrotki (wytnijKrotke l y) y
     resztaElementow = wytnijReszte l y
  in
   elementNaWyjscie : rob resztaElementow (wierzcholki resztaElementow)

   
 

{-  -}
wytnijKrotke :: Eq a => [(a, a)] -> a -> (a, a)
wytnijKrotke l y = 
 if y `elem` rozkrotkuj l
  then head (filter (\x -> fst x == y || snd x == y) l)
 else head l
 
wybierzZKrotki :: Eq a => (a, a) -> a -> a
wybierzZKrotki (x, y) z
 | x == z = x
 | y == z = y
 | otherwise = x

wytnijReszte :: Eq a => [(a,a)] -> a -> [(a,a)]
wytnijReszte l y = 
 if y `elem` rozkrotkuj l
  then filter (\x -> fst x /= y && snd x /= y) l
 else l
 

{-rob (sortuj xs) wierzcholki (y:ys)-}


{- 
sortuj :: [(a, a)] -> [a] -> [(a, a)]-}
{-sortuj (x:y:xs) (z:zs) =
if  
then x ++ sortuj(y:xs)
else
y ++ sortuj (x:xs) -}
{-
porownaj :: (a, a) -> (a, a) -> [a] -> Bool
porownaj (a, b) (c, d) filtr =
 elem a filtr || elem b filtr-}