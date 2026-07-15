{-# LANGUAGE BangPatterns #-}

import qualified Data.ByteString.Char8 as BS
import Data.Char
import qualified Data.IntSet as IS

main :: IO ()
main = do
  input <- BS.getContents
  case ints input of
    _ : m : xs -> print $ solve m xs
    _ -> return ()

ints :: BS.ByteString -> [Int]
ints bs =
  case BS.readInt $ BS.dropWhile isSpace bs of
    Just (x, rest) -> x : ints rest
    Nothing -> []

solve :: Int -> [Int] -> Int
solve m xs = loop 0 IS.empty IS.empty $ reverse $ take (2 * m) xs
  where
    loop !ans !_ !_ [] = ans
    loop !ans !rows !cols (c : r : rest) =
      let !exists = IS.member r rows || IS.member c cols
          !ans' = if exists then ans else ans + 1
          !rows' = IS.insert r rows
          !cols' = IS.insert c cols
       in loop ans' rows' cols' rest
    loop !ans !_ !_ _ = ans
