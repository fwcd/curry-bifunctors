module Data.Functor.Contravariant
  ( Contravariant (..)
  , ($<), (>$<), (>$$<)
  , Predicate (..)
  , Comparison (..)
  , defaultComparison
  ) where

infixl 4 >$, $<, >$<, >$$<

class Contravariant f where
  contramap :: (a -> b) -> f b -> f a

  (>$) :: b -> f b -> f a
  (>$) = contramap . const

-- | (>$) with its arguments flipped.
($<) :: Contravariant f => f b -> b -> f a
($<) = flip (>$)

-- | An infix alias for contramap.
(>$<) :: Contravariant f => (a -> b) -> f b -> f a
(>$<) = contramap

-- | (>$<)/contramap with its arguments flipped.
(>$$<) :: Contravariant f => f b -> (a -> b) -> f a
(>$$<) = flip contramap

newtype Predicate a = Predicate { getPredicate :: a -> Bool }

instance Contravariant Predicate where
  contramap f (Predicate g) = Predicate (g . f)

newtype Comparison a = Comparison { getComparison :: a -> a -> Ordering }

instance Contravariant Comparison where
  contramap f (Comparison g) = Comparison (\x y -> g (f x) (f y))

defaultComparison :: Ord a => Comparison a
defaultComparison = Comparison compare
