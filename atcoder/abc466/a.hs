import Data.Bool

main :: IO ()
main = (readLn :: IO Int) >> getLine >>= putStrLn . bool "No" "Yes" . all (< 0) . map read . words
