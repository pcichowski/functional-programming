module Main where
main :: IO ()
main = return()

isPrimal :: Int -> Bool
isPrimal n = if n > 1 then isEmpty [x | x <- [2..(n `div` 2)], n `mod` x == 0]  else False

isEmpty :: [x] -> Bool
isEmpty [] = True
isEmpty x = False

createPrimalList :: Int -> [Int]
createPrimalList n = [x | x <- [2..n], isPrimal x]

numberToListOfDigits :: Int -> [Int]
numberToListOfDigits 0 = []
numberToListOfDigits n = numberToListOfDigits(n `div` 10) ++ [n `mod` 10]

iterateOnList :: [Int] -> [Int]
iterateOnList x = tail x ++ [head x]

iterateTest :: [Int] -> Int -> IO()
iterateTest x 0 = return()
iterateTest x n = do
    putStrLn (show (iterateOnList x))
    iterateTest (iterateOnList x) (n-1)
