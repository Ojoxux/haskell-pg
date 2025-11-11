module Squares (evenSquares) where

evenSquares :: [Int]
evenSquares = [x * x | x <- [1 .. 10], even x]
