module Main

import Decidable.Equality

%default total

data U : List a -> Type where
  nil : U (List.Nil {a})
  one : (x : a) -> U [x]
  two : (x : a) -> (u : U xs) -> (y : a)
    -> U (x :: xs ++ [y])

index : (n : Nat) -> Vect k a -> Vect k a -> List a
index       Z         xs        ys  = []
index    (S Z)  (x :: xs) (y :: ys) = [x]
index (S (S n)) (x :: xs) (y :: ys) = x :: index n xs ys ++ [y]
index    (S n)        []        []  = []

build : (n : Nat) -> (xs : Vect k a) -> (ys : Vect k a) -> U (index n xs ys)
build       Z         xs        ys  = nil
build    (S Z)  (x :: xs) (y :: ys) = one x
build (S (S n)) (x :: xs) (y :: ys) = two x (build n xs ys) y
build    (S n)        []        []  =  nil

eq : (xs : List a) -> index (length xs) (fromList xs) (reverse $ fromList xs) = xs
eq xs = believe_me ()

toU : (xs : List a) -> U xs
toU xs = replace (eq xs) $ build (length xs) (fromList xs) (reverse $ fromList xs)

data Palindrome : List a -> Type where
  p0 : Palindrome (List.Nil {a})
  p1 : (x : a) -> Palindrome [x]
  p2 : (x : a) -> (u : Palindrome xs) -> Palindrome (x :: xs ++ [x])

isPalinU : DecEq a => {xs : List a} -> U xs -> Maybe (Palindrome xs)
isPalinU  nil    = Just $ p0
isPalinU (one x) = Just $ p1 x
isPalinU (two x u y) with (decEq x y)
  isPalinU (two x u x) | Yes refl = p2 x `map` isPalinU u
  isPalinU (two x u y) | No  neq  = Nothing

isPalindrome : DecEq a => (xs : List a) -> Maybe (Palindrome xs)
isPalindrome xs = isPalinU $ toU xs

partial
main : IO ()
main = do
  input <- unpack . trim `map` getLine
  putStrLn $ case isPalindrome input of
    Just p  => "yes"
    Nothing => "no"
