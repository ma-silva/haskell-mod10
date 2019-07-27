module Validate where
import Data.Char
import Data.List
import Data.Maybe

validate :: Integer -> Bool
validate x = 
  let digits = toDigits x
      doubled = doubleDigit $ zipIndex $ reverse digits
  in (sum doubled) `mod` 10 == 0

toDigits :: Integer -> [Int]
toDigits = map digitToInt . show

sumDigits :: String -> Int
sumDigits x = 
  let toList = map (\x -> read [x]) 
  in sum $ toList x

doubleDigit :: [(Int, Int)] -> [Int]
doubleDigit = map (\x -> if (fst x `mod` 2) == 0
  then snd x
  else sumDigits $ show $ (snd x) *2)

zipIndex :: [Int] -> [(Int, Int)]
zipIndex = (\x -> zip [0..] x)
