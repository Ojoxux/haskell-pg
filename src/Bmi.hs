module Bmi (bmiTell) where

bmiTell :: Double -> String
bmiTell bmi
  | bmi <= 18.5 = "やせ型"
  | bmi <= 25.0 = "標準"
  | bmi <= 30.0 = "ぽっちゃり"
  | otherwise = "肥満"
