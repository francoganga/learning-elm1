module Layout exposing (..)

import Html exposing (Attribute, Html, div)
import Main exposing (Model)


view : Model -> Html Msg
view model =
    div [ class "mainContentStyle" ]
        [ Header.view
        , Main.view
        , Modal.view model
        ]
