module Main

import Effect.State
import Effect.Exception

%default total

showEither : Either Integer b -> String
showEither (Left x) = show x
showEither (Right y) = "ERROR"

hd : List Integer -> Integer
hd [] = 0
hd (x :: xs) = x

esum : List Integer -> { [STATE (List Integer), EXCEPTION Integer] } Eff (Either Integer) Bool
esum [] = do
    ys <- get
    raise (hd ys)

esum (x :: xs) = do
    ys <- get
    put (x + hd ys :: ys)
    esum xs

partial
main : IO ()
main = do
    n <- cast `map` getLine
    putStrLn . showEither . runInit [List.Nil, ()] . esum $ [1..n]
