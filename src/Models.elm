module Models exposing (Model, RequestStatus(..), Todo)

import Array exposing (Array)
import Dict exposing (Dict)
import RemoteData exposing (RemoteData, WebData)
import Set exposing (Set)


type alias Todo =
    { userId : Int
    , id : Int
    , title : String
    , completed : Bool
    }


type RequestStatus
    = Loading
    | Success
    | Failure


type alias Model =
    { data : WebData (Array Todo)
    , page : Int
    , menu : Bool
    , selected : Set Int
    }
