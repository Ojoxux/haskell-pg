main :: IO ()
main = do
    n <- readLn :: IO Int
    s <- getLine
    let (front, back, rev) = go 1 s [] [] False
        answer = if rev then back ++ reverse front else front ++ reverse back
    putStrLn $ unwords $ map show answer

go :: Int -> String -> [Int] -> [Int] -> Bool -> ([Int], [Int], Bool)
go _ [] front back rev = (front, back, rev)
go k (c : cs) front back rev
    | rev = go (k + 1) cs (k : front) back (c == 'x')
    | otherwise = go (k + 1) cs front (k : back) (c == 'o')
