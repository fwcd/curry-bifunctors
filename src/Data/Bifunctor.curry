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

instance Bifunctor Either where
  bimap f g e = case e of
    Left x  -> Left (f x)
    Right x -> Right (g x)

instance Bifunctor (,) where
  bimap f g (x, y) = (f x, g y)

instance Bifunctor ((,,) a) where
  bimap f g (a, x, y) = (a, f x, g y)

instance Bifunctor ((,,,) a b) where
  bimap f g (a, b, x, y) = (a, b, f x, g y)

instance Bifunctor ((,,,,) a b c) where
  bimap f g (a, b, c, x, y) = (a, b, c, f x, g y)

instance Bifunctor ((,,,,,) a b c d) where
  bimap f g (a, b, c, d, x, y) = (a, b, c, d, f x, g y)
