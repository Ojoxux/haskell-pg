main :: IO ()
main = do
    s <- getLine
    let n = length s
        cnt left right =
            length . takeWhile (<= 1) $
                scanl
                    (\bad (x, y) -> bad + fromEnum (x /= y))
                    0
                    (zip left right)
        oddA =
            sum
                [ cnt (reverse (take c s)) (drop (c + 1) s)
                | c <- [0 .. n - 1]
                ]

        evenA =
            sum
                [ cnt (reverse (take c s)) (drop c s) - 1
                | c <- [1 .. n - 1]
                ]

    print $ oddA + evenA
