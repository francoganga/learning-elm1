module Components.MainContent exposing (view)

import Array
import Html exposing (Html, button, div, h1, input, table, tbody, td, text, th, thead, tr)
import Html.Attributes exposing (checked, class, type_)
import Html.Events exposing (onCheck, onClick)
import Messages exposing (Msg(..))
import Models exposing (Model, RequestStatus(..), Todo)
import RemoteData exposing (..)
import Set exposing (Set)



-- renderTodo : Todo -> Html Msg
-- renderTodo todo =
--     tr []
--         [ td [ class "border px-8 py-2" ] [ input [ type_ "checkbox", onCheck (\v -> ToggleSelected todo.id) ] [] ]
--         , td [ class "border px-8 py-2" ] [ text (String.fromInt todo.id) ]
--         , td [ class "border px-8 py-2" ] [ text (String.fromInt todo.userId) ]
--         , td [ class "border px-8 py-2" ] [ text todo.title ]
--         ]


renderTodo2 : Int -> Todo -> Html Msg
renderTodo2 index todo =
    tr []
        [ td [ class "border px-8 py-2" ] [ input [ type_ "checkbox", onCheck (\v -> ToggleSelected ( index, v )) ] [] ]
        , td [ class "border px-8 py-2" ] [ text (String.fromInt todo.id) ]
        , td [ class "border px-8 py-2" ] [ text (String.fromInt todo.userId) ]
        , td [ class "border px-8 py-2" ] [ text todo.title ]
        ]


view : Model -> Html Msg
view model =
    div [ class "h-full" ]
        [ div [ class "h-16" ] [ menu model ]
        , table [ class "table-auto shadow-lg bg-white w-full" ]
            [ thead []
                [ tr []
                    [ th [ class "bg-blue-100 border text-left px-8 py-2" ] [ input [ type_ "checkbox", onCheck (\v -> ToggleMultiple) ] [] ]
                    , th [ class "bg-blue-100 border text-left px-8 py-2" ] [ text "item 1" ]
                    , th [ class "bg-blue-100 border text-left px-8 py-2" ] [ text "item 2" ]
                    , th [ class "bg-blue-100 border text-left px-8 py-2" ] [ text "item 3" ]
                    ]
                ]
            , tbody
                []
                (tableBody model)
            ]
        ]


tableBody : Model -> List (Html Msg)
tableBody model =
    case model.data of
        RemoteData.NotAsked ->
            [ text "" ]

        RemoteData.Loading ->
            [ text "Loading..." ]

        RemoteData.Success todos ->
            todos
                |> Array.indexedMap (\index todo -> renderTodo2 index todo)
                |> Array.toList

        RemoteData.Failure _ ->
            [ text "Failure" ]


menu : Model -> Html Msg
menu model =
    if not (Set.isEmpty model.selected) == True then
        div [ class "bg-blue-100 p-2 flex justify-end h-full" ]
            [ button [ class "uppercase px-8 py-2 border border-blue-600 text-blue-600 max-w-max shadow-sm hover:shadow-lg mr-2 focus:outline-none" ] [ text "Edit" ]
            , button [ class "uppercase px-8 py-2 border border-blue-600 text-blue-600 max-w-max shadow-sm hover:shadow-lg focus:outline-none", onClick Edit ] [ text "Print" ]
            ]

    else
        div [ class "bg-blue-100 p-2 h-full flex items-center" ] [ h1 [] [ text "Lista de Todos" ] ]
