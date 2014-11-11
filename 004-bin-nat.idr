%default total

-- A prelude without the Nat->GMP optimisation
namespace MyPrelude

  data N : Type where
    Z : N
    S : N -> N

  (+) : N -> N -> N
  (+)  Z    m = m
  (+) (S n) m = S (n + m)

data Bit : N -> Type where
  I : Bit (S Z)
  O : Bit    Z
  
infixl 3 #
data Bin : N -> N -> Type where
  NN   : Bin Z Z
  (#) : Bin w n -> Bit b -> Bin (S w) (b + n + n)
  
-- It's often much more convenient to create a custom record type
-- instead of deeply nested pairs.
infixl 3 ##
record Sum : N -> N -> N -> Type where
  (##) : Bit hi -> Bit lo
      -> .{auto pf : with MyPrelude (c + x + y = lo + hi + hi)}
      -> Sum c x y

instance Show (Bin w n) where
  show NN = ""
  show (xs # I) = show xs ++ "1"
  show (xs # O) = show xs ++ "0"
  
-- No term/pattern syntax extensions needed!
adb : Bit c -> Bit x -> Bit y -> Sum c x y
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
add : Bit c -> Bin w p -> Bin w q -> Bin (S w) (c + p + q)
add c NN       NN       = NN # c
add c (xs # x) (ys # y) with (adb c x y)
  | (hi ## lo) ?= add hi xs ys # lo
  
-- Let's cheat through the boring stuff.
Main.add_lemma_1 c c1 w n b xs x n1 b1 hi lo hi1 lo1 pf ys y = replace eq
  where
    -- the following postulate seems implausible but don't forget the IH:
    -- pf : (c + b) + b1 = lo + hi + hi + 0
    postulate eq : (lo + ((hi + n) + n1)) + ((hi + n) + n1) = (c + ((b + n) + n)) + ((b1 + n1) + n1)

fromNat : Nat -> N
fromNat  Z    = Z
fromNat (S n) = S (fromNat n)

partial
readNum : IO N
readNum = map (Main.fromNat . fromInteger . cast) getLine

record B : N -> Type where
    MkB : (value : Bin w x) -> B w

partial
readBin : (w : N) -> IO (B w)
readBin w = map (parse w . reverse . unpack . trim) getLine
  where
    pad : (ww : N) -> Bin ww Z
    pad  Z     = NN
    pad (S ww) = pad ww # O

    parse : (ww : N) -> List Char -> B ww
    parse  Z     (_ :: _) = MkB NN
    parse  Z     []       = MkB NN
    parse (S ww) []       = MkB (pad $ S ww)
    parse (S ww) (c :: cs) with (parse ww cs)
        | MkB bs = if (c == '0') then MkB (bs # O) else MkB (bs # I)

iter : (n : N) -> Bin (S w) (x + y) -> Bin w x -> Bin w y -> Bin (S w) (x + y)
iter  Z    sum x y = sum
iter (S n)   _ x y = iter n (add O x y) x y

fmt : B w -> String
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
    work : (x, y : B w) -> (iters : N) -> B (S w)
    work (MkB x) (MkB y) iters = MkB $ iter iters (add O x y) x y
