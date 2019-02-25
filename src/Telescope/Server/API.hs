{-# LANGUAGE DataKinds     #-}
{-# LANGUAGE TypeOperators #-}

module Telescope.Server.API where

import           Data.Map    (Map)
import           Servant.API ((:<|>), (:>), Capture, DeleteNoContent, Get, JSON,
                              NoContent, PostNoContent, ReqBody)
-- import           Servant.API.WebSocket (WebSocket)

type API =
  "rmAll"
    :> Capture "tableKey" String
    :> DeleteNoContent '[JSON] NoContent
  :<|>
  "viewAll"
    :> Capture "tableKey" String
    :> Get '[JSON] [(String, String)]
  :<|>
  "setAll"
    :> Capture "tableKey" String
    :> ReqBody '[JSON] (Map String String)
    :> PostNoContent '[JSON] NoContent

-- type WebSocketAPI = "update" :> WebSocket
-- type SourceAPI = API :<|> WebSocketAPI
