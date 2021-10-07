module Main where
main :: IO ()
main =
 return ()

{- input: [[1,1,1], [2,2], [3], [4, 4, 4], [5]] 
   output: [ [3], [5] ]     -}

usunDuplikaty :: [[a]] -> [[a]]
usunDuplikaty [] = []
usunDuplikaty [[]] = [[]]
usunDuplikaty (x:xs) =
 if length x > 1
  then  usunDuplikaty xs
 else x : usunDuplikaty xs

grupuj' :: [[a]] -> [[a]]
grupuj' (x:xs) = do
 {-until (head xs == head x) (przeniesPierwszyElement x xs)-}
 x : grupuj' xs

grupuj :: Eq a => [a] -> [[a]]
grupuj = 
 foldr func []
   
func :: Eq a => a -> [[a]] -> [[a]]
func x [] = [[x]]
func x (y:xs) = 
 if x == head y 
  then (x:y):xs 
 else [x]:y:xs

przeniesPierwszyElement :: [a] -> [[a]] -> [a]
przeniesPierwszyElement xs (y:ys) =
 xs ++ y

rozkrkrotkuj :: [(a,a)] -> [a]
rozkrkrotkuj [] = []
rozkrkrotkuj (x:xs) = fst x : snd x : rozkrkrotkuj xs


