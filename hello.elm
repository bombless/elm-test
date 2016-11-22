import Html exposing (Html, button, div, span, text)
import Html.App as App
import Html.Events exposing (onClick)
import Html.Attributes exposing (style)

main =
    App.beginnerProgram { model = model, view = view, update = update }


type Color = Red | Blue

type alias Model = (Int, Color)

model : Model
model = (0, Red)


type Msg = Increment | Decrement

update: Msg -> Model -> Model
update msg (cnt, color) = 
    (
        case msg of
            Increment -> cnt + 1
            Decrement -> cnt - 1
    ,
        case color of
            Red -> Blue
            Blue -> Red
    )

toStyle: Color -> String
toStyle clr =
    case clr of
        Red -> "red"
        Blue -> "blue"

view: Model -> Html Msg
view (cnt, clr) =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , span [ style [("backgroundColor", toStyle clr), ("color", "white")]] [ text (toString cnt) ]
        , button [ onClick Increment ] [ text "+" ]
        ]

