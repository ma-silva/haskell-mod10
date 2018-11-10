module Main where

import Data.Char

main :: IO ()
main = do
  putStrLn("Enter a credit card no.:")
  line <- getLine
  putStrLn("Is valid: " ++ show (luhn $ line))

luhn x =
  let nums = zipIndex $ reverse x
      digits = checkDigit $ nums
  in (sum digits) `mod` 10 == 0

checkDigit = map (\x -> if (fst x `mod` 2) == 0
                 then digitToInt $ snd x
                 else sumDigits $ show $ (digitToInt $ snd x) *2)

zipIndex = (\x -> zip [0..] x)

sumDigits x = 
  let toList = map (\x -> read [x]) 
  in sum $ toList x
