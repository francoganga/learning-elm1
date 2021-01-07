module View exposing (..)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class, src)
import Messages exposing (Msg(..))
import Models exposing (Model)


view : Model -> Html Msg
view model =
    div [ class "h-screen" ]
        [ div [ class "grid grid-rows-burger h-full" ]
            [ div [ class "bg-red-600" ] [ text "header" ]
            , div [ class "bg-green-400 grid grid-cols-side-test h-full" ] [ div [ class "bg-indigo-600" ] [], div [ class "bg-green-400" ] [ text "asd" ] ]
            , div [ class "bg-red-600" ] [ text "footer" ]
            ]
        ]
