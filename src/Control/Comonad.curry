module Control.Comonad
  ( Comonad (..)
  ) where

import Data.Functor.Identity ( Identity (..) )

-- | The dual of a monad.
class Functor w => Comonad w where
  extract :: w a -> a

  duplicate :: w a -> w (w a)
  duplicate = extend id

  extend :: (w a -> b) -> w a -> w b
  extend f = fmap f . duplicate

instance Comonad Identity where
  extract (Identity x) = x
  duplicate = Identity
  extend f x = Identity (f x)
