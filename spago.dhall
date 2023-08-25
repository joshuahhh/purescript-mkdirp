{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "mkdirp"
, dependencies =
  [ "effect"
  , "either"
  , "exceptions"
  , "functions"
  , "node-fs"
  , "nullable"
  , "prelude"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
