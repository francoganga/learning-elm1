module Update exposing (update)

import Array exposing (fromList)
import Messages exposing (Msg(..))
import Models exposing (Data(..), Model)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        RcvData httpPayload ->
            case httpPayload of
                Ok data ->
                    ( { model | data = Success (fromList data) }, Cmd.none )

                Err _ ->
                    ( { model | data = Failure }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )

        ToggleMenu ->
            let
                _ =
                    Debug.log "info" "toggle"
            in
            ( { model | menu = not model.menu }, Cmd.none )

        Edit ->
            let
                _ =
                    Debug.log "info" "edit works"
            in
            ( model, Cmd.none )
