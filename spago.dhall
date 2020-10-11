{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "mkdirp"
, dependencies =
  [ "console"
  , "effect"
  , "either"
  , "exceptions"
  , "functions"
  , "node-fs"
  , "nullable"
  , "prelude"
  , "psci-support"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
