module Main where

import Lib
import Data.Char

main :: IO ()
main = do
  putStrLn("Enter a credit card no.:")
  line <- getLine
  let nums = zipIndex line
      digits = luhn $ reverse nums
  putStrLn("Is valid: " ++ show ((sum digits) `mod` 10 == 0))

luhn = map (\x -> if (fst x `mod` 2) == 0
                 then digitToInt $ snd x
                 else sumDigits $ show $ (digitToInt $ snd x) *2)

zipIndex = (\x -> zip [0..] x)

sumDigits x = 
  let toList = map (\x -> read [x]) 
  in sum $ toList x
