# Functors for Curry

This package adds a range of more or less exotic functors to Curry, including contravariant functors, bifunctors and profunctors.

## Bifunctors

Bifunctors, as known from [Haskell](https://hackage.haskell.org/package/base-4.16.0.0/docs/Data-Bifunctor.html), are functors over types with two arguments:

```curry
class Bifunctor p where
  -- | Maps over both arguments at the same time.
  bimap :: (a -> b) -> (c -> d) -> p a c -> p b d
```

## Credits

The libraries are adapted from BSD-licensed code from Haskell's base libraries under the following copyrights:

| Module | Copyright |
| ------ | --------- |
| `Data.Bifunctor` | (C) 2008-2014 Edward Kmett |
| `Data.Functor.Compose` | (c) Ross Paterson 2010 |
| `Data.Functor.Const` | Conor McBride and Ross Paterson 2005 |
| `Data.Functor.Contravariant` | (C) 2007-2015 Edward Kmett |
| `Data.Functor.Sum` | (c) Ross Paterson 2014 |
| `Data.Functor.Product` | 	(c) Ross Paterson 2010 |
