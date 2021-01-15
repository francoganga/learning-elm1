module Update exposing (update)

import Array exposing (fromList)
import Messages exposing (Msg(..))
import Models exposing (Model, RequestStatus(..), Todo)
import RemoteData


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        RcvData httpPayload ->
            ( { model | data = httpPayload }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )

        ToggleMenu ->
            ( { model | menu = not model.menu }, Cmd.none )

        Edit ->
            ( model, Cmd.none )

        ToggleSelected index ->
            model.data
                |> RemoteData.map
                    (\v ->
                        Array.get index v
                            |> Maybe.map (\todo -> Debug.log "test" todo)
                            |> Maybe.map (\todo -> Array.set index { todo | selected = not todo.selected } v)
                            |> Maybe.withDefault v
                    )
                |> (\m -> ( { model | data = m }, Cmd.none ))



-- a |> RemoteData.map (\v -> (Array.get 0 v) |> Maybe.map (\t -> Array.set 1 t v))


toggleTodoSelected : Todo -> Todo
toggleTodoSelected todo =
    { todo | selected = not todo.selected }


test : RemoteData.RemoteData e (Array.Array Todo) -> Int -> ()
test remote index =
    remote
        |> RemoteData.map
            (\v ->
                Array.get index v
                    |> Maybe.map (Debug.log "index")
            )
        |> (\s -> ())
