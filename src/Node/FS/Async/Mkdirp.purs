module Node.FS.Async.Mkdirp (mkdirp) where

import Prelude
import Effect (Effect)
import Effect.Exception (Error)
import Data.Either (Either(Left, Right))
import Data.Function.Uncurried (Fn2, Fn3, runFn3, runFn2)
import Data.Nullable (Nullable)
import Node.FS.Async (Callback)


type JSCallback a = Fn2 (Nullable Error) a Unit

foreign import handleCallbackImpl
  ∷ ∀ a
  . Fn3 (Error → Either Error a)
        (a → Either Error a)
        (Callback a)
        (JSCallback a)

handleCallback
  ∷ ∀ a
  . Callback a
  → JSCallback a
handleCallback cb = runFn3 handleCallbackImpl Left Right cb

foreign import unsafeMkEff
  ∷ ∀ a
  . (Unit → a)
  → Effect a

foreign import mkdirpImpl ∷ Fn2 String (JSCallback Unit) Unit

mkdirp
  ∷ String
  → Callback Unit
  → Effect Unit
mkdirp dir cb = unsafeMkEff $ \_ -> runFn2
  mkdirpImpl dir (handleCallback cb)
