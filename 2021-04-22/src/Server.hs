{-# LANGUAGE OverloadedStrings #-}
module Server (server) where

import Prelude hiding (lookup)
import Data.Text
import Data.IORef
import Data.Map
import Control.Monad.IO.Class
import Web.Spock
import Web.Spock.Config
import Network.Wai (Middleware)
import Network.HTTP.Types.Status (status404)

server :: IO Middleware
server = do
  init <- liftIO initialState
  spockCfg <- defaultSpockCfg () PCNoDatabase init
  spock spockCfg routes

type AppState = IORef (Map Text Text)
initialState = newIORef (fromList [("toto", "tutu")])

type Server = SpockM () () AppState ()

routes :: Server
routes = do
  get root   $
    text ""

  get "help" $
    text "actually helpless"

  get ("values" <//> var) $
    \v -> do
      ref <- getState
      dict <- liftIO (readIORef ref) 
      case lookup v dict of
        Just value -> text(value)
        Nothing -> do
          setStatus status404
          text ("unknown: " <> v)

  post ("values" <//> var) $
    \k -> do
   --   theBody :: Text <- jsonBody
   --   dict <- getState
      text "Stored!"
      
      
