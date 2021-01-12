module Main exposing (main)

import Browser
import Http exposing (Error(..))
import Json.Decode as Decode exposing (Decoder, bool, int, string)
import Json.Decode.Pipeline as Pipeline exposing (required)
import Messages exposing (Msg(..))
import Models exposing (Data(..), Model, Todo)
import Update exposing (update)
import View exposing (view)


init : ( Model, Cmd Msg )
init =
    ( { data = Loading, page = 0, menu = False }, getData )


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
