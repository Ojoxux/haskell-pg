main :: IO ()
main = do
    [m, d] <- map read . words <$> getLine :: IO [Int]
    s <- getLine
    print . length $
        [()
        | x <- [0 .. m - 1]
        , not $ any (\(i, c) -> c == 'G' && abs (x - i) <= d) (zip [0 ..] s)
        ]
