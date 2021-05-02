module Ch11NerdFun where

data OperatingSystem = Linux | FreeBSD | MacOS | Windows | Haiku deriving (Eq, Show)

data ProgLang = Haskell | Rust | Scala | Python | TypeScript | Perl deriving (Eq, Show)

data Programmer = Programmer
  { os :: OperatingSystem,
    lang :: ProgLang
  }
  deriving (Eq, Show)

allOperatingSystems :: [OperatingSystem]
allOperatingSystems = [Linux, FreeBSD, MacOS, Windows, Haiku]

allLanguages :: [ProgLang]
allLanguages = [Haskell, Rust, Scala, Python, TypeScript, Perl]

allProgramers :: [Programmer]
allProgramers = [Programmer {os = x, lang = y} | x <- allOperatingSystems, y <- allLanguages]
