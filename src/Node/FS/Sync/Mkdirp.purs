module Node.FS.Sync.Mkdirp (mkdirp) where

import Prelude
import Effect (Effect)


foreign import mkdirp
  ∷ String
  → Effect Unit
