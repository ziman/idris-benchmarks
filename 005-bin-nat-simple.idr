-- A prelude without the Nat->GMP optimisation
namespace MyPrelude

  data N : Type where
    Z : N
    S : N -> N

  (+) : N -> N -> N
  (+)  Z    m = m
  (+) (S n) m = S (n + m)

data Bit : Type where
  I : Bit
  O : Bit
  
infixl 3 #
data Bin : Type where
  NN   : Bin
  (#) : Bin -> Bit -> Bin
  
infixl 3 ##
record Sum : Type where
  (##) : Bit -> Bit -> Sum

instance Show Bin where
  show NN = ""
  show (xs # I) = show xs ++ "1"
  show (xs # O) = show xs ++ "0"
  
-- No term/pattern syntax extensions needed!
adb : Bit -> Bit -> Bit -> Sum
adb I I I = I ## I
adb I I O = I ## O
adb I O I = I ## O
adb I O O = O ## I
adb O I I = I ## O
adb O I O = O ## I
adb O O I = O ## I
adb O O O = O ## O
  
-- With/case/let -- these all create a sub-function.
-- it would be nice to have it inlined back in the parent function.
add : Bit -> Bin -> Bin -> Bin
add c NN       NN       = NN # c
add c (xs # x) (ys # y) with (adb c x y)
  | (hi ## lo) = add hi xs ys # lo
  
fromNat : Nat -> N
fromNat  Z    = Z
fromNat (S n) = S (fromNat n)

partial
readNum : IO N
readNum = map (Main.fromNat . fromInteger . cast) getLine

record B : Type where
    MkB : (value : Bin) -> B

partial
readBin : (w : N) -> IO B
readBin w = map (parse w . reverse . unpack . trim) getLine
  where
    pad : (ww : N) -> Bin
    pad  Z     = NN
    pad (S ww) = pad ww # O

    parse : (ww : N) -> List Char -> B
    parse  Z     (_ :: _) = MkB NN
    parse  Z     []       = MkB NN
    parse (S ww) []       = MkB (pad $ S ww)
    parse (S ww) (c :: cs) with (parse ww cs)
        | MkB bs = if (c == '0') then MkB (bs # O) else MkB (bs # I)

iter : (n : N) -> Bin -> Bin -> Bin -> Bin
iter  Z    sum x y = sum
iter (S n)   _ x y = iter n (add O x y) x y

fmt : B -> String
fmt (MkB x) = show x

partial
main : IO ()
main = do
    w <- readNum
    x <- readBin w
    y <- readBin w
    iters  <- readNum
    putStrLn . fmt $ work x y iters
  where
    work : (x, y : B) -> (iters : N) -> B
    work (MkB x) (MkB y) iters = MkB $ iter iters (add O x y) x y
