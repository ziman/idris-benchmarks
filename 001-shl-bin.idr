module Main

%default total

data Bin : Nat -> Type where
    N : Bin Z
    I : Bin n -> Bin (1 + n + n)
    O : Bin n -> Bin (0 + n + n)

shl : Bin n -> Bin (n + n)
shl bs = O bs

pow2 : Nat -> Nat -> Nat
pow2 (S n) k = pow2 n k + pow2 n k
pow2  Z    k = k

pow : (k : Nat) -> Bin n -> Bin (pow2 k n)
pow (S k) bs = O (pow k bs)
pow  Z    bs = bs

fmt : Bin n -> String
fmt  N     = ""
fmt (I bs) = "1" ++ fmt bs
fmt (O bs) = "0" ++ fmt bs

read : Integer -> List Char -> Integer
read acc       []  = acc
read acc (c :: cs) = read (cast (ord c - ord '0') + 10 * acc) cs

partial
main : IO ()
main = do
    input <- map trim getLine
    putStrLn . fmt $ pow (fromInteger . read 0 . unpack $ input) (I N)
