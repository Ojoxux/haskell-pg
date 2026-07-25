import Data.List (permutations)

-- memo:
-- 全順列を試せばいける？
-- n<=10なら最大でも10!通りなので間に合いそう

main :: IO ()
main = do
    n <- readLn :: IO Int
    p <- map read . words <$> getLine :: IO [Int]
    q <- map read . words <$> getLine :: IO [Int]
    print . length $
        [r | r <- permutations [1 .. n], p < r, r < q]
