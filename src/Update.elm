module Update exposing (..)

import Array exposing (Array)
import Messages exposing (Msg(..))
import Models exposing (Model)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        RcvData httpPayload ->
            case httpPayload of
                Ok data ->
                    let
                        _ =
                            Debug.log "data" data
                    in
                    ( { model | data = Just (Array.fromList data) }, Cmd.none )

                Err _ ->
                    ( model, Cmd.none )

        NoOp ->
            ( model, Cmd.none )
