module Data.Biapplicative
  ( Biapplicative (..)
  , (*>>), (<<*), (<<**>>), biliftA3
  ) where

import Data.Bifunctor ( Bifunctor (..) )

infixl 4 <<*>>, *>>, <<*, <<**>>

class Bifunctor p => Biapplicative p where
  bipure :: a -> b -> p a b

  (<<*>>) :: p (a -> b) (c -> d) -> p a c -> p b d
  (<<*>>) = biliftA2 id id

  biliftA2 :: (a -> b -> c) -> (d -> e -> f) -> p a d -> p b e -> p c f 
  biliftA2 f g x y = bimap f g x <<*>> y

(*>>) :: Biapplicative p => p a b -> p c d -> p c d
(*>>) = biliftA2 (const id) (const id)

(<<*) :: Biapplicative p => p a b -> p c d -> p a b
(<<*) = biliftA2 const const

(<<**>>) :: Biapplicative p => p a c -> p (a -> b) (c -> d) -> p b d
(<<**>>) = biliftA2 (flip id) (flip id)

biliftA3 :: Biapplicative p => (a -> b -> c -> d) -> (e -> f -> g -> h)
                            -> p a e -> p b f -> p c g -> p d h
biliftA3 f g x y z = biliftA2 f g x y <<*>> z
