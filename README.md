# Bifunctors for Curry

Bifunctors, as known from [Haskell](https://hackage.haskell.org/package/base-4.16.0.0/docs/Data-Bifunctor.html), are functors over types with two arguments:

```curry
class Bifunctor p where
  -- | Maps over both arguments at the same time.
  bimap :: (a -> b) -> (c -> d) -> p a c -> p b d
```
