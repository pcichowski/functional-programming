doubleMe :: Num a => a -> a
doubleMe x =
 x * x

doubleSmall :: (Ord a, Num a) => a -> a
doubleSmall x =
 if x > 100
  then x
  else x * 2
