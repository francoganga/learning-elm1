module Main exposing (..)

import Browser
import Html exposing (Html, button, div, h1, img, p, text)
import Html.Attributes exposing (class, src)
import Http exposing (Error(..))
import Json.Decode as Decode exposing (Decoder, bool, float, int, string)
import Json.Decode.Pipeline as Pipeline exposing (..)
import Messages exposing (Msg(..))
import Models exposing (Model, Todo)
import Update exposing (update)
import View exposing (view)


init : ( Model, Cmd Msg )
init =
    ( { data = Nothing, page = 0 }, getData )


getData : Cmd Msg
getData =
    Http.get { url = "https://jsonplaceholder.typicode.com/todos", expect = Http.expectJson RcvData listTodoDecoder }


todoDecoder : Decoder Todo
todoDecoder =
    Decode.succeed Todo
        |> Pipeline.required "userId" int
        |> Pipeline.required "id" int
        |> Pipeline.required "title" string
        |> Pipeline.required "completed" bool


listTodoDecoder : Decoder (List Todo)
listTodoDecoder =
    Decode.list todoDecoder



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
