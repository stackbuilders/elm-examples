module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

-- Model
type alias Model =
  { entries : List String
  , results : List String
  , filter : String
  }

-- Initial state
myModel : Model
myModel =
    { entries = []
    , results = []
    , filter = ""
    }

-- Update
type Msg
    = Filter String
    | Add

update : Msg -> Model -> Model
update msg model =
  case msg of
    Filter filter ->
      { model
          | results = List.filter (String.contains filter) model.entries
          , filter = filter
      }

    Add ->
      { model
          | entries = model.filter :: model.entries
          , results = model.filter :: model.results
      }

-- View
view : Model -> Html Msg
view model =
    div []
        [ input [ placeholder "Filter…", onInput Filter ] []
        , button [ onClick Add ] [ text "Add New" ]
        , ul [] (List.map viewEntry model.results)
        ]

viewEntry : String -> Html Msg
viewEntry entry =
    li [] [ text entry ]

-- Main

main : Program Never Model Msg
main =
  Html.beginnerProgram
    { model = myModel
    , view = view
    , update = update
    }
