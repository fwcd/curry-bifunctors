module Data.Functor.Product
  ( Product (..)
  ) where

data Product f g a = Pair { fstP :: f a, sndP :: g a }

instance (Functor f, Functor g) => Functor (Product f g) where
  fmap f (Pair x y) = Pair (fmap f x) (fmap f y)

instance (Applicative f, Applicative g) => Applicative (Product f g) where
  pure x = Pair (pure x) (pure x)
  Pair f g <*> Pair x y = Pair (f <*> x) (g <*> y)

instance (Monad f, Monad g) => Monad (Product f g) where
  return = pure
  Pair x y >>= f = Pair (x >>= fstP . f) (y >>= sndP . f)

instance (Alternative f, Alternative g) => Alternative (Product f g) where
  empty = Pair empty empty
  Pair x y <|> Pair x' y' = Pair (x <|> x') (y <|> y')
