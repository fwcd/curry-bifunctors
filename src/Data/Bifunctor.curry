module Data.Bifunctor
  ( Bifunctor (..)
  ) where

class Bifunctor p where
  -- | Maps over both arguments at the same time.
  bimap :: (a -> b) -> (c -> d) -> p a c -> p b d
  bimap f g = first f . second g

  -- | Maps over the first argument.
  first :: (a -> b) -> p a c -> p b c
  first f = bimap f id

  -- | Maps over the second argument.
  second :: (b -> c) -> p a b -> p a c
  second = bimap id
