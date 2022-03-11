module Data.Functor.Sum
  ( Sum (..)
  ) where

import Data.Functor.Contravariant ( Contravariant (..) )

-- | Lifted sum of functors.
data Sum f g a = InL (f a) | InR (g a)

instance (Functor f, Functor g) => Functor (Sum f g) where
  fmap f s = case s of
    InL x -> InL (fmap f x)
    InR y -> InR (fmap f y)

instance (Contravariant f, Contravariant g) => Contravariant (Sum f g) where
  contramap f s = case s of
    InL x -> InL (contramap f x)
    InR y -> InR (contramap f y)
