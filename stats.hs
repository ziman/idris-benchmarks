import Data.List

count :: [Double] -> (Double, Double)
count xs = (mean, sd)
  where
    mean = sum xs / n
    sd   = sqrt $ sum [(x - mean)^2 | x <- xs] / (n-1)
    n    = genericLength xs

fmt :: (Double, Double) -> String
fmt (mean, sd) = "avg = " ++ shw mean ++ ", sd = " ++ shw sd
  where
    shw = show . rnd
    rnd x = (fromIntegral $ round (x * 1000)) / 1000

main :: IO ()
main = interact $ fmt . count . map read . lines
