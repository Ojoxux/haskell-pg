import System.IO -- 質問出したｒflushしたいから入れる

main :: IO ()
main = do
  n <- readLn :: IO Int
  ans <- go n 1 2 0
  putStrLn $ "! " ++ show ans

go :: Int -> Int -> Int -> Int -> IO Int
go n i j k
  | i >= n = return k
  | otherwise = do
      j' <- ask n i (max j (i + 1))
      go n (i + 1) j' (k + j' - i - 1)

ask :: Int -> Int -> Int -> IO Int
ask n i j
  | j > n = return j
  | otherwise = do
      putStrLn $ "? " ++ show i ++ " " ++ show j
      hFlush stdout
      t <- getLine
      if yes t then ask n i (j + 1) else return j

yes :: String -> Bool
yes t = case words t of
  ("Yes" : _) -> True
  _ -> False
