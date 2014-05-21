module Main

import System
import Data.Erased

-- -- Pair types -- --

data Exists' : {a : Type} -> (a -> Type) -> Type where
  witness : .(x : a) -> (pf : b x) -> Exists' b

data Subset : (a : Type) -> (b : a -> Type) -> Type where
  element : (x : a) -> .(pf : b x) -> Subset a b

-- -- Main program -- --

data Bit : Nat -> Type where
     b0 : Bit 0
     b1 : Bit 1

instance Show (Bit n) where
     show b0 = "0"
     show b1 = "1"

infixl 5 #

data Binary : (width : Nat) -> (value : Nat) -> Type where
     zero : Binary Z Z
     (#) :  Binary w v -> (p : Bit bit) -> Binary (S w) (bit + 2 * v)

instance Show (Binary w k) where
     show zero = ""
     show (bin # bit) = show bin ++ show bit

data Bin : Nat -> Type where
    MkBin : Binary w x -> Bin w

pattern syntax bitpair [x] [y] = witness _ (witness _ (element (x, y) _))
term    syntax bitpair [x] [y] = witness _ (witness _ (element (x, y) refl))

addBit : Bit x -> Bit y -> Bit c -> 
  Exists' (\bx => Exists' (\by =>
    Subset (Bit bx, Bit by) (\_=>
      c + x + y = by + 2*bx)))
addBit b0 b0 b0 = bitpair b0 b0
addBit b0 b0 b1 = bitpair b0 b1 
addBit b0 b1 b0 = bitpair b0 b1
addBit b0 b1 b1 = bitpair b1 b0
addBit b1 b0 b0 = bitpair b0 b1 
addBit b1 b0 b1 = bitpair b1 b0 
addBit b1 b1 b0 = bitpair b1 b0 
addBit b1 b1 b1 = bitpair b1 b1 

adc : Binary w x -> Binary w y -> Bit c -> Binary (S w) (c + x + y) 
adc zero        zero        carry ?= zero # carry
adc (numx # bx) (numy # by) carry
   ?= let (bitpair carry0 lsb) = addBit bx by carry in 
          adc numx numy carry0 # lsb

------------

readNum : IO Nat
readNum = map (fromInteger . cast) getLine

readBin : (w : Nat) -> IO (Bin w)
readBin w = map (parse w . reverse . unpack . trim) getLine
  where
    pad : (ww : Nat) -> Binary ww Z
    pad  Z     = zero
    pad (S ww) = pad ww # b0

    parse : (ww : Nat) -> List Char -> Bin ww
    parse  Z     (_ :: _) = MkBin zero
    parse  Z     []       = MkBin zero
    parse (S ww) []       = MkBin (pad $ S ww)
    parse (S ww) (c :: cs) with (parse ww cs)
        | MkBin bs = if (c == '0') then MkBin (bs # b0) else MkBin (bs # b1)

iter : (n : Nat) -> Binary (S w) (x + y) -> Binary w x -> Binary w y -> Binary (S w) (x + y)
iter  Z    sum x y = sum
iter (S n)   _ x y = iter n (adc x y b0) x y

fmt : Bin w -> String
fmt (MkBin x) = show x

main : IO ()
main = do
    w <- readNum
    x <- readBin w
    y <- readBin w
    iters  <- readNum
    putStrLn . fmt $ work x y iters
  where
    work : (x, y : Bin w) -> (iters : Nat) -> Bin (S w)
    work (MkBin x) (MkBin y) iters = MkBin $ iter iters (adc x y b0) x y
    
    
---------- Proofs ----------

-- There is almost certainly an easier proof. I don't care, for now :)

Main.adc_lemma_2 = proof {
    intro c,w,v,bit0,num0;
    intro b0,v1,bit1,num1,b1;
    intro bc,x,x1,bx,bx1;
    rewrite sym (plusZeroRightNeutral x);
    rewrite sym (plusZeroRightNeutral v1);
    rewrite sym (plusZeroRightNeutral (plus (plus x v) v1));
    rewrite sym (plusZeroRightNeutral v);
    intros;
    rewrite sym (plusAssociative (plus c (plus bit0 (plus v v))) bit1 (plus v1 v1));
    rewrite  (plusAssociative c (plus bit0 (plus v v)) bit1);
    rewrite  (plusAssociative bit0 (plus v v) bit1);
    rewrite plusCommutative bit1 (plus v v);
    rewrite sym (plusAssociative c bit0 (plus bit1 (plus v v)));
    rewrite sym (plusAssociative (plus c bit0) bit1 (plus v v));
    rewrite sym pf;
    rewrite plusAssociative x1 (plus x x) (plus v v);
    rewrite plusAssociative x x (plus v v);
    rewrite sym (plusAssociative x v v);
    rewrite plusCommutative v (plus x v);
    rewrite sym (plusAssociative x v (plus x v));
    rewrite (plusAssociative x1 (plus (plus x v) (plus x v)) (plus v1 v1));
    rewrite sym (plusAssociative (plus (plus x v) (plus x v)) v1 v1);
    rewrite  (plusAssociative (plus x v) (plus x v) v1);
    rewrite (plusCommutative v1 (plus x v));
    rewrite sym (plusAssociative (plus x v) v1 (plus x v));
    rewrite (plusAssociative (plus (plus x v) v1) (plus x v) v1);
    trivial;
}

Main.adc_lemma_1 = proof {
    intros;
    rewrite sym (plusZeroRightNeutral c) ;
    trivial;
}

