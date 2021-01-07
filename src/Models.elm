module Models exposing (..)

import Array exposing (Array)


type alias Todo =
    { userId : Int
    , id : Int
    , title : String
    , completed : Bool
    }


type alias Model =
    { data : Maybe (Array Todo)
    , page : Int
    }
