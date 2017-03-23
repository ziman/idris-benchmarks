module Main

import Data.Vect
import Decidable.Equality

%default total

data U : List a -> Type where
  UNil : U []
  UOne : (x : a) -> U [x]
  UTwo : (x : a) -> (u : U xs) -> (y : a)
    -> U (x :: xs ++ [y])

index : (n : Nat) -> Vect k a -> Vect k a -> List a
index       Z         xs        ys  = []
index    (S Z)  (x :: xs) (y :: ys) = [x]
index (S (S n)) (x :: xs) (y :: ys) = x :: index n xs ys ++ [y]
index    (S n)        []        []  = []

build : (n : Nat) -> (xs : Vect k a) -> (ys : Vect k a) -> U (index n xs ys)
build       Z         xs        ys  = UNil
build    (S Z)  (x :: xs) (y :: ys) = UOne x
build (S (S n)) (x :: xs) (y :: ys) = UTwo x (build n xs ys) y
build    (S n)        []        []  = UNil

postulate eq : (xs : List a) -> index (length xs) (fromList xs) (reverse $ fromList xs) = xs

toU : (xs : List a) -> U xs
toU xs = replace (eq xs) $ build (length xs) (fromList xs) (reverse $ fromList xs)

data Palindrome : List a -> Type where
  PNil : Palindrome []
  POne : (x : a) -> Palindrome [x]
  PTwo : (x : a) -> (u : Palindrome xs) -> Palindrome (x :: xs ++ [x])

isPalinU : DecEq a => {xs : List a} -> U xs -> Maybe (Palindrome xs)
isPalinU  UNil    = Just $ PNil
isPalinU (UOne x) = Just $ POne x
isPalinU (UTwo x u y) with (decEq x y)
  isPalinU (UTwo x u x) | Yes Refl = PTwo x `map` isPalinU u
  isPalinU (UTwo x u y) | No  neq  = Nothing

isPalindrome : DecEq a => (xs : List a) -> Maybe (Palindrome xs)
isPalindrome xs = isPalinU $ toU xs

partial
main : IO ()
main = do
  input <- unpack . trim `map` getLine
  putStrLn $ case isPalindrome input of
    Just p  => "yes"
    Nothing => "no"
