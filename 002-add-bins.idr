module Main

import Parity
import System

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








pad : Binary w n -> Binary (S w) n
pad zero = zero # b0 
pad (num # x) = pad num # x

natToBin : (width : Nat) -> (n : Nat) ->
           Maybe (Binary width n)
natToBin Z (S k) = Nothing
natToBin Z Z = Just zero
natToBin (S w) Z = do x <- natToBin w Z
                      Just (pad x)
natToBin (S w) (S k) with (parity k)
  natToBin (S w) (S (plus j j)) | even {n = _}
    = do jbin <- natToBin w j
         let value = jbin # b1
         ?ntbEven
  natToBin (S w) (S (S (plus j j))) | odd {n = _}
    = do jbin <- natToBin w (S j)
         let value = jbin # b0
         ?ntbOdd











pattern syntax bitpair [x] [y] = (_ ** (_ ** (x, y, _)))
term    syntax bitpair [x] [y] = (_ ** (_ ** (x, y, refl)))

addBit : Bit x -> Bit y -> Bit c -> 
          (bx ** (by ** (Bit bx, Bit by, c + x + y = by + 2 * bx)))
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

readNum : String -> IO Nat
readNum what = do
  putStr $ "Enter " ++ what ++ ": "
  (fromInteger . cast) `map` getLine

iter : (n : Nat) -> Binary (S w) (x + y) -> Binary w x -> Binary w y -> Binary (S w) (x + y)
iter  Z    sum x y = sum
iter (S n)   _ x y = iter n (adc x y b0) x y

main : IO ()
main = do
    w <- readNum "width"
    x <- readNum "x"
    y <- readNum "y"
    iters  <- readNum "iters"
    print $ iter iters (adc (bin w x) (bin w y) b0) (bin w x) (bin w y)
  where
    bin : (w : Nat) -> (x : Nat) -> Binary w x
    bin w x = let Just y = natToBin w x in y





    
---------- Proofs ----------

Main.ntbOdd = proof {
    intro w,j;
    rewrite sym (plusZeroRightNeutral j);
    rewrite plusSuccRightSucc j j;
    intros;
    refine Just;
    trivial;
}

Main.ntbEven = proof {
    compute;
    intro w,j;
    rewrite sym (plusZeroRightNeutral j);
    intros;
    refine Just;
    trivial;
}

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
    rewrite sym b;
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

