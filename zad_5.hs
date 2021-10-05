module Main where

main :: t
main = do 
 printElements driver konwertuj [1, 2, 3]
 
{- TODO linijka 5 -}

{- driver obsługuje każdy element listy od jej końca -}
driver :: [[a]] -> [[a]]
driver [] = driver [[]]
driver (n:ls) =
 driver ls ++ dodajDoKazdego ls n

{-  dodajDoKazdego dodaje element np. [8] do listy list np [ [1], [2] ] -> [ [1], [2], [8] ] -}
dodajDoKazdego :: [[a]] -> [a] -> [[a]]
dodajDoKazdego [] elem = [ elem ]
dodajDoKazdego (n:ls) elem =
 [n ++ elem] ++ dodajDoKazdego ls elem

konwertuj :: [a] -> [[a]]
konwertuj [] = [[]]
konwertuj [x] = [[x]]
konwertuj (n:ls) =
 [ n ] : konwertuj ls

printElements :: Show a => [[a]] -> [IO ()]
printElements l = do
 map print l  
 