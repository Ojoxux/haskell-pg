main :: IO ()
main = do
  [a, b] <- map read . words <$> getLine :: IO [Int]
  putStrLn $ if 3 * a > 2 * b then "Yes" else "No"
