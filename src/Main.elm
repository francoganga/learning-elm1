module Main exposing (..)

import Browser
import Html exposing (Html, button, div, h1, img, p, text)
import Html.Attributes exposing (class, src)



---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div [ class "h-screen" ]
        [ div [ class "grid grid-rows-burger h-full" ]
            [ div [ class "bg-red-600" ] [ text "header" ]
            , div [ class "bg-green-400 grid grid-cols-side-test h-full" ] [ div [ class "bg-indigo-600" ] [], div [ class "bg-green-400" ] [ text "asd" ] ]
            , div [ class "bg-red-600" ] [ text "footer" ]
            ]
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
