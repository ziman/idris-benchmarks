module Main

{-
data Step : Nat -> Nat -> Nat -> Type where
    s0 : Step    k     k     Z
    s1 : Step    k  (S k) (S Z)
    s2 : Step (S k)    n     r
         -> Step k (S n) (S (S r))

step : (n : Nat) -> Step 0 n n
step       Z   = s0
step    (S Z)  = s1
step (S (S n)) = s2 ?x

data U : List a -> Type where
    nil : U []
    one : (x : a) -> U [x]
    two : (x : a) -> U xs -> (y : a) -> U (x ++ xs ++ [y])

toU : (xs : List a) -> U xs
toU xs = toU' (length xs) xs (reverse xs)

theIndex : (k : Nat) -> (n : Nat) -> (xs : List a) -> (ys : List a) -> List a
theIndex k    Z  xs ys = []
theIndex k (S Z) (= [

toU' : (n : Nat) -> (xs : List a) -> (ys : List a) -> U (theIndex n xs ys)
toU' 
-}

data Step : Nat -> Nat -> Type where
    s0 : Step Z k
    sS : Step n k -> Step (S (S n)) (S k)

main : IO ()
main = do
    input <- getLine
    putStr input
