module Models exposing (Data(..), Model, Todo)

import Array exposing (Array)


type alias Todo =
    { userId : Int
    , id : Int
    , title : String
    , completed : Bool
    }


type Data
    = Loading
    | Success (Array Todo)
    | Failure


type alias Model =
    { data : Data
    , page : Int
    , menu : Bool
    }
