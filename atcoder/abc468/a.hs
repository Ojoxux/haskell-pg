main :: IO ()
main = do
    _ <- getLine
    a <- map read . words <$> getLine :: IO [Int]
    print . length $
        [()
        | (x, y, z) <- zip3 a (drop 1 a) (drop 2 a)
        , x < y && y > z
        ]
