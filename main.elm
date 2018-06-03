module Main exposing (..)

import Html
import Html.Events


type SquareValue
    = Unset
    | X
    | O


type alias Model =
    { done : Bool
    , value : SquareValue
    }


model : Model
model =
    { done = False
    , value = Unset
    }


type Message
    = ChangeValue String
    | RotateSquareValue


type alias View =
    Html.Html Message


getSquareText : SquareValue -> String
getSquareText value =
    case value of
        Unset ->
            "[-]"

        X ->
            "X"

        O ->
            "O"


renderSquare : SquareValue -> View
renderSquare value =
    Html.div [] [ Html.text (getSquareText value) ]


view : Model -> View
view model =
    Html.div
        [ Html.Events.onClick RotateSquareValue
        ]
        [ renderSquare model.value
        ]


nextSquareValue : SquareValue -> SquareValue
nextSquareValue value =
    case value of
        Unset ->
            X

        X ->
            O

        O ->
            Unset


update : Message -> Model -> Model
update message model =
    case message of
        ChangeValue value ->
            model

        RotateSquareValue ->
            { model | value = nextSquareValue model.value }


main : Program Never Model Message
main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }
