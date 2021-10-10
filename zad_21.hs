module Main where
main :: IO ()
main = return()

isPrimal :: Int -> Bool
isPrimal n = if n > 1 then isEmpty [x | x <- [2..(n `div` 2)], n `mod` x == 0]  else False

isEmpty :: [x] -> Bool
isEmpty [] = True
isEmpty xs = False

createPrimalList :: Int -> [Int]
createPrimalList n = [x | x <- [2..n], isPrimal x]

numberToListOfDigits :: Int -> [Int]
numberToListOfDigits 0 = []
numberToListOfDigits n = numberToListOfDigits(n `div` 10) ++ [n `mod` 10]
