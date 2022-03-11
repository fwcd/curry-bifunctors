# Functors for Curry

This package adds a range of more or less exotic functors to Curry, including contravariant functors, bifunctors and profunctors.

## Contravariant functors

Contravariant functors, as known from [Haskell](https://hackage.haskell.org/package/base-4.16.0.0/docs/Data-Functor-Contravariant.html), are functors that 'flip' the direction of the mapped function:

```curry
class Contravariant f where
  contramap :: (a -> b) -> f b -> f a
```

A simple example of a bifunctor is a regular function where the functor maps over the _argument_ rather than the _result_.

## Bifunctors

Bifunctors, as known from [Haskell](https://hackage.haskell.org/package/base-4.16.0.0/docs/Data-Bifunctor.html), are functors over types with two arguments:

```curry
class Bifunctor p where
  -- | Maps over both arguments at the same time.
  bimap :: (a -> b) -> (c -> d) -> p a c -> p b d
```

Examples of bifunctors are `Either` and `(,)` (2-ary tuples).

## Credits

The modules are adapted from BSD-licensed code from Haskell's base libraries and related packages under the following copyrights:

| Module | Copyright |
| ------ | --------- |
| `Data.Bifunctor` | (C) 2008-2014 Edward Kmett |
| `Data.Biapplicative` | (C) 2011-2015 Edward Kmett |
| `Data.Functor.Compose` | (c) Ross Paterson 2010 |
| `Data.Functor.Const` | Conor McBride and Ross Paterson 2005 |
| `Data.Functor.Contravariant` | (C) 2007-2015 Edward Kmett |
| `Data.Functor.Sum` | (c) Ross Paterson 2014 |
| `Data.Functor.Product` | 	(c) Ross Paterson 2010 |
