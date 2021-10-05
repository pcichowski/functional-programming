module Main where

main :: IO ()
main = do
 let dupa = [ [1], [2] ]
  in  putStrLn ( printListElements (driver dupa) )
 n <- getLine 
 return ()
 
{- TODO linijka 5 -}

{- driver obsługuje każdy element listy od jej końca -}
driver :: [[a]] -> [[a]]
driver [] = [[]]
driver [n] = [[] , n]
driver (n:ls) =
 driver ls ++ dodajDoKazdego (driver ls) n

{-  dodajDoKazdego dodaje element np. [8] do listy list np [ [], [1], [2] ] -> [ [8], [1, 8], [2, 8] ] -}
dodajDoKazdego :: [[a]] -> [a] -> [[a]]
dodajDoKazdego [] _ = []
dodajDoKazdego (n:ls) elem =
 [n ++ elem] ++ dodajDoKazdego ls elem

konwertuj :: [a] -> [[a]]
konwertuj [] = [[]]
konwertuj [x] = [[x]]
konwertuj (n:ls) =
  [n] : konwertuj ls

printListElements :: Show a => [[a]] -> String
printListElements [[]] = ""
printListElements [] = ""
printListElements (n:ls) = 
 show n ++ " " ++ printListElements ls
