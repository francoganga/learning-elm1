module Components.MainContent exposing (view)

import Array exposing (Array)
import Html exposing (Attribute, Html, div, h1, table, tbody, td, text, th, thead, tr)
import Html.Attributes exposing (class, style)
import Messages exposing (Msg)
import Models exposing (Model, Todo)


renderTodo : Todo -> Html Msg
renderTodo todo =
    tr []
        [ td [ class "border px-8 py-2" ] [ text (String.fromInt todo.id) ]
        , td [ class "border px-8 py-2" ] [ text (String.fromInt todo.userId) ]
        , td [ class "border px-8 py-2" ] [ text todo.title ]
        ]


view : Model -> Html Msg
view model =
    div [ class "h-full" ]
        [ table [ class "table-auto shadow-lg bg-white w-full" ]
            [ thead []
                [ tr []
                    [ th [ class "bg-blue-100 border text-left px-8 py-2" ] [ text "item 1" ]
                    , th [ class "bg-blue-100 border text-left px-8 py-2" ] [ text "item 2" ]
                    , th [ class "bg-blue-100 border text-left px-8 py-2" ] [ text "item 3" ]
                    ]
                ]
            , tbody
                []
                (tableBody model.data)
            ]
        ]


tableBody : Maybe (Array Todo) -> List (Html Msg)
tableBody todos =
    case todos of
        Just data ->
            data
                |> Array.toList
                |> List.map renderTodo

        _ ->
            []
