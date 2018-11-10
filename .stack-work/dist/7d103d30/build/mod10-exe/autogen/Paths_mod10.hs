{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_mod10 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Github\\haskell-mod10\\.stack-work\\install\\6f1bd928\\bin"
libdir     = "C:\\Github\\haskell-mod10\\.stack-work\\install\\6f1bd928\\lib\\x86_64-windows-ghc-8.4.4\\mod10-0.1.0.0-9jJ6HsDvn7BLPqkEFwbZtf-mod10-exe"
dynlibdir  = "C:\\Github\\haskell-mod10\\.stack-work\\install\\6f1bd928\\lib\\x86_64-windows-ghc-8.4.4"
datadir    = "C:\\Github\\haskell-mod10\\.stack-work\\install\\6f1bd928\\share\\x86_64-windows-ghc-8.4.4\\mod10-0.1.0.0"
libexecdir = "C:\\Github\\haskell-mod10\\.stack-work\\install\\6f1bd928\\libexec\\x86_64-windows-ghc-8.4.4\\mod10-0.1.0.0"
sysconfdir = "C:\\Github\\haskell-mod10\\.stack-work\\install\\6f1bd928\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "mod10_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "mod10_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "mod10_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "mod10_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "mod10_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "mod10_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
