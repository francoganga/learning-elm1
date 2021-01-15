module Models exposing (Model, RequestStatus(..), Todo)

import Array exposing (Array)
import RemoteData exposing (RemoteData, WebData)


type alias Todo =
    { userId : Int
    , id : Int
    , title : String
    , completed : Bool
    , selected : Bool
    }


type RequestStatus
    = Loading
    | Success
    | Failure


type alias Model =
    { data : WebData (Array Todo)
    , page : Int
    , menu : Bool
    }
