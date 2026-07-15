main :: IO ()
main = do
  [n, m] <- map read . words <$> getLine :: IO [Int]
  balls <- sequence $ replicate n $ map read . words <$> getLine
  let f k = case [s | [c, s] <- balls, c == k] of
        [] -> -1
        xs -> maximum xs
  putStrLn $ unwords $ map (show . f) [1 .. m]
