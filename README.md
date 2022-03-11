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

Bifunctors, as known from [Haskell](https://hackage.haskell.org/package/base-4.16.0.0/docs/Data-Bifunctor.html), are (covariant) functors over types with two arguments:

```curry
class Bifunctor p where
  -- | Maps over both arguments at the same time.
  bimap :: (a -> b) -> (c -> d) -> p a c -> p b d
```

Examples of bifunctors are `Either` and `(,)` (2-ary tuples).

## Profunctors

Profunctors, as known from [Haskell](https://hackage.haskell.org/package/profunctors-5.6.2/docs/Data-Profunctor.html), are functors over types with two arguments where the first argument is _contravariant_ and the second argument is _covariant_ (compare this to bifunctors where both arguments are covariant):

```curry
class Profunctor p where
  -- | Maps over both arguments at the same time.
  dimap :: (a -> b) -> (c -> d) -> p b c -> p a d
```

An example of a profunctor is `(->)` (functions).

## Comonads

Comonads, as known from [Haskell](https://hackage.haskell.org/package/comonad-5.0.8/docs/Control-Comonad.html), are the dual of monads, i.e. monads construct and comonads deconstruct:

```curry
class Functor w => Comonad w where
  extract :: w a -> a
  duplicate :: w a -> w (w a)
```

## Credits

The modules are adapted from BSD-licensed code from Haskell's [`base` libraries](https://hackage.haskell.org/package/base) and related packages ([`bifunctors`](https://hackage.haskell.org/package/bifunctors), [`profunctors`](https://hackage.haskell.org/package/profunctors), [`comonad`](https://hackage.haskell.org/package/comonad)) under the following copyrights:

| Module | Copyright |
| ------ | --------- |
| `Control.Comonad` | (C) 2008-2015 Edward Kmett, (C) 2004 Dave Menendez |
| `Data.Bifunctor` | (C) 2008-2014 Edward Kmett |
| `Data.Biapplicative` | (C) 2011-2015 Edward Kmett |
| `Data.Functor.Compose` | (c) Ross Paterson 2010 |
| `Data.Functor.Const` | Conor McBride and Ross Paterson 2005 |
| `Data.Functor.Contravariant` | (C) 2007-2015 Edward Kmett |
| `Data.Functor.Sum` | (c) Ross Paterson 2014 |
| `Data.Functor.Product` | 	(c) Ross Paterson 2010 |
| `Data.Profunctor` | (C) 2011-2018 Edward Kmett |
