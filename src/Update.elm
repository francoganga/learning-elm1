module Update exposing (update)

import Array exposing (fromList)
import Dict exposing (Dict)
import Messages exposing (Msg(..))
import Models exposing (Model, RequestStatus(..), Todo)
import RemoteData
import Set exposing (Set)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        RcvData httpPayload ->
            ( { model | data = httpPayload }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )

        Edit ->
            ( model, Cmd.none )

        ToggleSelected ( index, selected ) ->
            if selected then
                ( { model | selected = Set.insert index model.selected }, Cmd.none )

            else
                ( { model | selected = Set.remove index model.selected }, Cmd.none )

        ToggleMultiple ->
            ( model, Cmd.none )



-- model.data
--     |> RemoteData.map
--         (\v ->
--             Array.get index v
--                 |> Maybe.map (\todo -> Debug.log "test" todo)
--                 |> Maybe.map (\todo -> Array.set index { todo | selected = not todo.selected } v)
--                 |> Maybe.withDefault v
--         )
--     |> (\m -> ( { model | data = m }, Cmd.none ))
-- a |> RemoteData.map (\v -> (Array.get 0 v) |> Maybe.map (\t -> Array.set 1 t v))
