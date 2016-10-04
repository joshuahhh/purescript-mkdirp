module Node.FS.Async.Mkdirp (mkdirp) where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (Error)
import Data.Either (Either(Left, Right))
import Data.Function.Uncurried (Fn2, Fn3, runFn3, runFn2)
import Data.Nullable (Nullable)
import Node.FS (FS)
import Node.FS.Async (Callback)


type JSCallback a = Fn2 (Nullable Error) a Unit

foreign import handleCallbackImpl
  ∷ ∀ eff a
  . Fn3 (Error → Either Error a)
        (a → Either Error a)
        (Callback eff a)
        (JSCallback a)

handleCallback
  ∷ ∀ eff a
  . Callback eff a
  → JSCallback a
handleCallback cb = runFn3 handleCallbackImpl Left Right cb

foreign import unsafeMkEff
  ∷ ∀ eff a
  . (Unit → a)
  → Eff eff a

foreign import mkdirpImpl ∷ Fn2 String (JSCallback Unit) Unit

mkdirp
  ∷ ∀ eff
  . String
  → Callback eff Unit
  → Eff (fs :: FS | eff) Unit
mkdirp dir cb = unsafeMkEff $ \_ -> runFn2
  mkdirpImpl dir (handleCallback cb)
