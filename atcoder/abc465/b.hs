main :: IO ()
main = do
  [x, y, l, r, a, b] <- map read . words <$> getLine :: IO [Int]
  let s = max 0 (min b r - max a l)
      n = b - a - s
  print $ s * x + n * y
