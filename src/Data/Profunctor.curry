module Data.Profunctor
  ( Profunctor (..)
  ) where

class Profunctor p where
  -- | Maps over both arguments at the same time.
  dimap :: (a -> b) -> (c -> d) -> p b c -> p a d
  dimap f g = lmap f . rmap g

  -- | Maps over the left argument (which is contravariant).
  lmap :: (a -> b) -> p b c -> p a c
  lmap f = dimap f id
  
  -- | Maps over the right argument (which is covariant).
  rmap :: (c -> d) -> p a c -> p a d
  rmap = dimap id

instance Profunctor (->) where
  dimap f g h = g . h . f
