-- TODO: Redudant if https://git.ps.informatik.uni-kiel.de/curry/curry-libs/-/merge_requests/16
--       is merged (i.e. the functor is included in Curry's base libraries).

-----------------------------------------------------------------------------
--- This simple module defines the const functor known from Haskell's
--- base libraries. It defines a wrapper around a constant value that
--- 'ignores' functions mapped over it.
-----------------------------------------------------------------------------

module Data.Functor.Const
  ( Const (..)
  ) where

newtype Const a _ = Const { getConst :: a }
  deriving (Eq, Ord, Read, Show)

instance Functor (Const a) where
  fmap _ (Const x) = Const x
