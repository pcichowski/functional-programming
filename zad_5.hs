module Main where
main :: IO ()
main =
 return ()

{-  driver dziala na dwoch kopiach listy, 
    do jednej z nich dodaje element zbioru do kazdego elementu listy, 
    następnie konkatenuje z drugą kopią     -}
driver :: [[a]] -> [[a]]
driver [] = [[]]
driver (n:ls) =
 driver ls ++ dodajDoKazdego (driver ls) n
dodajDoKazdego :: [[a]] -> [a] -> [[a]]
dodajDoKazdego [] _ = []
dodajDoKazdego (n:ls) elem =
 (n ++ elem) : dodajDoKazdego ls elem

{-  konwertuj zamienia postać listy na listę singletonów
    np [1, 2, 3] -> [[1], [2], [3]]     -}
konwertuj :: [a] -> [[a]]
konwertuj [] = [[]]
konwertuj [x] = [[x]]
konwertuj (n:ls) =
  [n] : konwertuj ls

{-  printListElements zamienia listę na zwykłego stringa    -}
printListElements :: Show a => [[a]] -> String
printListElements [[]] = ""
printListElements [] = ""
printListElements (n:ls) =
 show n ++ " " ++ printListElements ls

{-  zbiorPotegowy to końcowa funkcja która przyjmuję listę i zwraca zbiór potegowy-}
zbiorPotegowy :: [a] -> [[a]]
zbiorPotegowy x = driver (konwertuj x) 
