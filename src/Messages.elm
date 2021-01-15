module Messages exposing (Msg(..))

import Array exposing (Array)
import Http exposing (Error)
import Models exposing (Todo)
import RemoteData exposing (WebData)


type Msg
    = NoOp
    | RcvData (WebData (Array Todo))
    | ToggleMenu
    | Edit
    | ToggleSelected Int
