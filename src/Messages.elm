module Messages exposing (Msg(..))

import Http exposing (Error)
import Models exposing (Todo)


type Msg
    = NoOp
    | RcvData (Result Http.Error (List Todo))
