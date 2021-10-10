module Main where
main :: IO ()
main = return()

isPrimal :: Int -> Bool
isPrimal n = if n > 1 then isEmpty [x | x <- [2..(n `div` 2)], n `mod` x == 0]  else False

isEmpty :: [x] -> Bool
isEmpty [] = True
isEmpty xs = False