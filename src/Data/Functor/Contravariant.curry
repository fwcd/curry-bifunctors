module Data.Functor.Contravariant
  ( Contravariant (..), ($<), (>$<), (>$$<)
  , Predicate (..)
  , Comparison (..), defaultComparison
  , Equivalence (..), defaultEquivalence, comparisonEquivalence
  , Op (..)
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

-- | A boolean-returning function.
newtype Predicate a = Predicate { getPredicate :: a -> Bool }

instance Contravariant Predicate where
  contramap f (Predicate p) = Predicate (p . f)

-- | A total ordering.
newtype Comparison a = Comparison { getComparison :: a -> a -> Ordering }

instance Contravariant Comparison where
  contramap f (Comparison cmp) = Comparison (\x y -> cmp (f x) (f y))

defaultComparison :: Ord a => Comparison a
defaultComparison = Comparison compare

-- | An equivalence relation.
newtype Equivalence a = Equivalence { getEquivalence :: a -> a -> Bool }

instance Contravariant Equivalence where
  contramap f (Equivalence eq) = Equivalence (\x y -> eq (f x) (f y))

defaultEquivalence :: Eq a => Equivalence a
defaultEquivalence = Equivalence (==)

comparisonEquivalence :: Comparison a -> Equivalence a
comparisonEquivalence (Comparison cmp) = Equivalence (\x y -> cmp x y == EQ)

-- | Dual function arrows.
newtype Op a b = Op { getOp :: b -> a }

instance Contravariant (Op a) where
  contramap f (Op g) = Op (g . f)

instance Monoid a => Monoid (Op a b) where
  mempty = Op (\_ -> mempty)
  Op f `mappend` Op g = Op (\x -> f x `mappend` g x)
