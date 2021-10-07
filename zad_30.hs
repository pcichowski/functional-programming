module Main where
main :: IO ()
main =
 return ()


rozkrkrotkuj :: [(a,a)] -> [a]
rozkrkrotkuj [] = []
rozkrkrotkuj (x:xs) = fst x : [snd x] ++ rozkrkrotkuj xs


