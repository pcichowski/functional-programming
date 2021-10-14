-- Michał Ziemiec 184519, Paweł Cichowski 184465, Kacper Cencelewski 184848
module Main where
main :: IO ()
main = return()

{-Sprawdza czy liczba jest Pierwsza-}
isPrimal :: Int -> Bool
isPrimal n = if n > 1 then isEmpty [x | x <- [2..(n `div` 2)], n `mod` x == 0]  else False

{-Sprawdza czy lista jest pusta-}
isEmpty :: [x] -> Bool
isEmpty [] = True
isEmpty x = False

{-Tworzy listę liczb Pierwszych-}
createPrimalList :: Int -> [Int]
createPrimalList n = [x | x <- [2..n], isPrimal x]

{-Zamienia liczbę na listę cyfr-}
numberToListOfDigits :: Int -> [Int]
numberToListOfDigits 0 = []
numberToListOfDigits n = numberToListOfDigits(n `div` 10) ++ [n `mod` 10]

{-Ustawia pierwszą cyfrę na koniec-}
iterateOnList :: [Int] -> [Int]
iterateOnList x = tail x ++ [head x]

{-Zamienia listę cyfr na liczbę-}
fromListToNumber :: [Int] -> Int
fromListToNumber [] = 0
fromListToNumber (x:xs) = x * 10 ^ (length xs) + fromListToNumber xs

{-Oddaje następną możliwą rotację-}
nextRotation :: Int -> Int
nextRotation x = fromListToNumber (iterateOnList ( numberToListOfDigits x))

{-Sprawdza czy każda rotacja danej liczby spełnia warunek-}
checkEveryRotation :: Int -> Int-> Bool
checkEveryRotation x 0 = True
checkEveryRotation x n = if (isPrimal x) then True &&  checkEveryRotation (nextRotation x) (n - 1) else False 

{-Zwraca liczbę cyfr w liczbie-}
numberOfDigits :: Int -> Int
numberOfDigits 0 = 0
numberOfDigits n = 1 + numberOfDigits( n `div` 10)

{-Funkcja sprawdzająca czy w wyrazie występuje "0" ,bo jeśli tak to może dojść do sytuacji w której liczba zmniejszy swój rozmiar i "0"
nigdy nie trafi na koniec, a wiadomo że jeśli "0" jest na końcu to liczba jest parzysta. Oznacza to iż nie ma takiego wyrazu który by spełniał wymagania
posiadając "0" jako jedną ze swoich cyfr-}
ifContainsZero :: [Int] -> Bool
ifContainsZero [] = False
ifContainsZero (x:xs) = if x == 0 then True else ifContainsZero xs

{-Gotowa funkcja-}
giveAllWantedNumbers :: Int -> [Int]
giveAllWantedNumbers n = [x | x <- createPrimalList n, checkEveryRotation x (numberOfDigits x) && not(ifContainsZero $ numberToListOfDigits x)]

