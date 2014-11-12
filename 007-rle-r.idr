module Main

%default total

data RLE : List a -> Type where
  Nil : RLE []

  Cons :
      .{xs : List a}
    -> (n : Nat)
    -> (x : a)
    -> (r : RLE xs)
    -> RLE (replicate n x ++ xs)

-- could this algorithm benefit from uniqueness types?
-- so that when returning from nested recursion, we just overwrite the "n" to "S n"
parameters (a : Type, decEq : (x, y : a) -> Dec (x = y))
  compress : (xs : List a) -> RLE xs
  compress [] = Nil
  compress (x :: xs) with (compress xs)
    compress (x :: replicate n y ++ ys) | Cons {xs = ys} n y r with (decEq x y)
      compress (y :: replicate n y ++ ys) | Cons n y r | Yes Refl = Cons (S n) y r  -- destructive update?
      compress (x :: replicate n y ++ ys) | Cons n y r | No  neq  = Cons 1 x (Cons n y r)
    compress (x :: xs) | r = Cons 1 x r  -- r must be Nil here, can we show it easily?

decompress : .{xs : List a} -> RLE xs -> List a
decompress  Nil           = []
decompress (Cons n x r) = replicate n x ++ decompress r

strId : String -> String
strId s = pack . decompress $ compress Char decEq (unpack s)

partial
main : IO ()
main = getLine >>= putStr . strId
