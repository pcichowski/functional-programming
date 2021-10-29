-- Michał Ziemiec 184519, Paweł Cichowski 184465, Kacper Cencelewski 184848
module Main where
main :: IO ()
main =
 return ()

{-  driver dziala na dwoch kopiach listy, 
    do jednej z nich dodaje element zbioru do kazdego elementu listy, 
    następnie konkatenuje z drugą kopią     -}
driver :: [[a]] -> [[a]]
driver [] = [[]]
driver (x:xs) =
 driver xs ++ addToEachElement (driver xs) x

{- addToEachElement dodaje dany element do listy list
   np. addToEachElement [[1],[2],[3]] 8 => [[1, 8], [2, 8], [3, 8]] -}
addToEachElement :: [[a]] -> [a] -> [[a]]
addToEachElement [] _ = []
addToEachElement (x:xs) y =
 (x ++ y) : addToEachElement xs y

{-  convertToListOfLists zamienia postać listy na listę singletonów
    np [1, 2, 3] -> [[1], [2], [3]]     -}
convertToListOfLists :: [a] -> [[a]]
convertToListOfLists [x] = [[x]]
convertToListOfLists (x:xs) =
  [x] : convertToListOfLists xs

{-  powerSet to końcowa funkcja która przyjmuję listę i zwraca zbiór potegowy-}
powerSet :: [a] -> [[a]]
powerSet x = driver (convertToListOfLists x) 
