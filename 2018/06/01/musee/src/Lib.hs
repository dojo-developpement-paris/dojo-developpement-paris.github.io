{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE TypeOperators #-}

module Lib
    ( app
    ) where

import Servant.API
import Servant
import Data.Proxy
import Data.Aeson 
import GHC.Generics
import Servant.Utils.StaticFiles


data Museum = M { museum :: String }
 deriving (Generic)

instance ToJSON Museum
instance FromJSON Museum

type Data = "museums" :> Get '[JSON] [Museum]

server :: Server Data
server = return [ M { museum = "Orsay"}, M {museum= "Louvre"}]

app = serve dataAPI server 

dataAPI :: Proxy Data
dataAPI = Proxy

