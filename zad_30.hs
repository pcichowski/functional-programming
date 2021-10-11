{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
module Main where
main :: IO ()
main =
 return ()

{- funkcja usuwa listy elementow których liczba jest wieksza niż 1
   np. [[1,1,1], [2,2], [3], [4, 4, 4], [5]] ==>  [[3], [5]] -}
deleteDuplicates :: [[a]] -> [[a]]
deleteDuplicates [] = []
deleteDuplicates [[]] = [[]]
deleteDuplicates (x:xs) =
 if length x > 1
  then  deleteDuplicates xs
 else x : deleteDuplicates xs

{- funkcja grupuje elementy w krotki
   np. [1, 1, 1 , 2, 2, 2, 2, 3]  ==>  [[1, 1, 1], [2, 2, 2, 2], [3]] 
   identyczna funkcja: 
   gruoup lista = 
    foldr addIfEqual [] lista    -}
group :: Eq a => [a] -> [[a]]
group =
 foldr addIfEqual []

{- funkcja doda element x do listy list jeżeli składa się ona z elementów x 
   np. addIfEqual 1 [[1, 1, 1], [2, 2], [1, 1]]  ==>  [[1, 1, 1, 1], [2, 2], [1, 1]] 
   np. addIfEqual 3 [[5, 5, 5], [4], [3, 3]]   ==>  [[3], [5, 5, 5], [4], [3, 3]]-}
addIfEqual :: Eq a => a -> [[a]] -> [[a]]
addIfEqual x [] = [[x]]
addIfEqual x (y:xs) =
 if x == head y
  then (x:y):xs
 else [x]:y:xs

-- moveFirstElement :: [a] -> [[a]] -> [a]
-- moveFirstElement xs (y:ys) =
--  xs ++ y

{- funkcja zamienia listę krotek na listę elementów w tej samej kolejności
   np. [(1, 2), (1, 7), (8, 6)] ==> [1, 2, 1, 7, 8, 6] -}
detuple :: [(a,a)] -> [a]
detuple [] = []
detuple (x:xs) = fst x : snd x : detuple xs

qsort :: (Ord a) => [a] -> [a]
qsort [] = []
qsort (x:xs) =
 qsort [a | a <- xs, a < x] {- partycja mniejsza od x -}
 ++ [x] ++
 qsort [b | b <- xs, b >= x] {- partycja wieksza rowna x -}

{- convert zamienia listę list na listę 
   np. [[3], [8]]  =>  [3, 8]-}
convert :: [[a]] -> [a]
convert [] = []
convert ([x]:xs) =
 x : convert xs

-- konwertuj' :: [(a, b)] -> (a, b)
-- konwertuj' [(a,b)] =
--  (a,b)

{- wierzchołki zwraca wierzchołki pierwszego stopnia(liście) z grafu (z formatu wejściowego)
   np. [(1, 3), (3, 5)]  =>  [1, 5] -}
wierzcholki :: (Ord a) => [(a, a)] -> [a]
wierzcholki x =
 convert (deleteDuplicates (group (qsort (detuple x))))

{- zwraca krotke z elementem podanym jako drugi argument
np. [(1,2),(1,3)] 2 => (1,2) -}
cutTuple :: Eq a => [(a, a)] -> a -> (a, a)
cutTuple l y =
 if y `elem` detuple l
  then head (filter (\x -> fst x == y || snd x == y) l)
 else head l

{- wybiera inny element z krotki 
np. (1,2) 2 => 1-}
selectFromTuple :: Eq a => (a, a) -> a -> a
selectFromTuple (x, y) z
 | x == z = y
 | y == z = x
 | otherwise = x

{- zwraca liste krotek bez krotki, w której znajduje sie element podany jako argument
np. [(1,2),(1,3),(1,4)] 2 => [(1,3),(1,4)]-}
cutRest :: Eq a => [(a,a)] -> a -> [(a,a)]
cutRest l y =
 if y `elem` detuple l
  then filter (\x -> fst x /= y && snd x /= y) l
 else l

generujPrufera :: (Eq a, Ord a )=> [(a,a)] -> [a] -> [a]
generujPrufera []  _ = []
generujPrufera tuples result =
 result
 ++ generujPrufera (cutRest tuples (head (wierzcholki tuples)))
  [selectFromTuple (cutTuple tuples (head (wierzcholki tuples))) (head (wierzcholki tuples))]