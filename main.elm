module Main exposing (..)

import Html


type alias Model =
    { done : Bool }


model : Model
model =
    { done = False }


type Message
    = Boop


type alias View =
    Html.Html Message


view : model -> Html.Html Message
view model =
    Html.div [] [ Html.text "hi" ]


update : msg -> model -> model
update message model =
    model



-- { model : model, view : model -> Html msg, update : msg -> model -> model }


main : Program Never Model Message
main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }
