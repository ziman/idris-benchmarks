module Main

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

main : IO ()
main = do
    putStrLn . fmt $ pow 100000 (I N)
