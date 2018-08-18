module Node.FS.Aff.Mkdirp (mkdirp) where

import Prelude
import Effect.Aff (Aff, makeAff)
import Node.FS.Async.Mkdirp as Async

mkdirp
  ∷ String
  → Aff Unit
mkdirp dir =
  makeAff \cb -> do
    Async.mkdirp dir cb
    pure mempty
