module Main where

import Bmi
import Factorial
import Hello
import Squares

main :: IO ()
main = do
  sayHello
  putStrLn $ "5! = " ++ show (factorial 5)
  putStrLn $ "偶数の平方リスト: " ++ show evenSquares
  putStrLn $ "BMI 22 は " ++ bmiTell 22.0
