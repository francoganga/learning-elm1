module View exposing (..)

import Components.Header as Header exposing (view)
import Components.MainContent as MainContent exposing (view)
import Html exposing (Html, div, text)
import Html.Attributes exposing (class, src)
import Messages exposing (Msg(..))
import Models exposing (Model)


view : Model -> Html Msg
view model =
    div [ class "h-screen" ]
        [ div [ class "grid grid-rows-burger h-full" ]
            [ div [ class "bg-red-600" ]
                [ Header.view ]
            , div [ class "grid grid-cols-side-test h-full" ]
                [ div [ class "bg-indigo-600" ] []
                , div []
                    [ MainContent.view model ]
                ]
            , div [ class "bg-red-600" ] [ text "footer" ]
            ]
        ]
