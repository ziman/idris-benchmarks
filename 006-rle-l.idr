module Main

%default total

because : {f : a -> Type} -> {x, y : a} -> f x -> (x = y) -> f y
because x Refl = x

data RLE : List a -> Type where
  Nil : RLE []

  Cons :
      .{xs : List a}
    -> (n : Nat)
    -> (x : a)
    -> (r : RLE xs)
    -> RLE (replicate n x ++ xs)

lemma : (n : Nat) -> (y : a) -> (ys : List a)
  -> replicate (S n) y ++ ys = replicate n y ++ y :: ys
lemma  Z    y ys = Refl
lemma (S n) y ys = cong (lemma n y ys)

parameters (a : Type, decEq : (x, y : a) -> Dec (x = y))
  compL : (n : Nat) -> (x : a) -> (xs : List a) -> RLE (replicate n x ++ xs)
  compL Z x [] = Nil
  compL n x [] = Cons n x Nil
  compL n x (y :: ys) with (decEq x y)
    compL n y (y :: ys) | Yes Refl = compL (S n) y ys `because` lemma n y ys
    compL n x (y :: ys) | No  neq  = Cons n x (compL 1 y ys)

  compressL : (xs : List a) -> RLE xs
  compressL []        = Nil
  compressL (x :: xs) = compL 1 x xs

decompress : .{xs : List a} -> RLE xs -> List a
decompress  Nil           = []
decompress (Cons n x r) = replicate n x ++ decompress r

strId : String -> String
strId s = pack . decompress $ compressL Char decEq (unpack s)

partial
main : IO ()
main = getLine >>= putStr . strId
