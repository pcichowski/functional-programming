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

rozkrkrotkuj :: [(a,a)] -> [a]
rozkrkrotkuj [] = []
rozkrkrotkuj (x:xs) = fst x : [snd x] ++ rozkrkrotkuj xs


