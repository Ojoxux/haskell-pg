main :: IO ()
main = do
    (_ : xs) <- map read . words <$> getContents :: IO [Integer]
    putStr . unlines $ go xs

go :: [Integer] -> [String]
go [] = []
go (x : y : k : xs) = show (solve x y k) : go xs
go _ = []

solve :: Integer -> Integer -> Integer -> Int
solve x y k
    | x == y = 0
    | x > y = 1 + solve (x `div` k) y k
    | otherwise = 1 + solve x (y `div` k) k
