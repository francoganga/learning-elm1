module Components.Header exposing (view)

import Html exposing (Html, button, text)
import Html.Events exposing (onClick)
import Messages exposing (Msg(..))


view : Html Msg
view =
    button []
        [ text "toggle" ]
