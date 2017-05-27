port module Interoperability.Main exposing(..)

import Html exposing(..)
import Html.Events exposing(onClick)
import Debug exposing(log)
import String exposing(join)

main =
  program
    { init = init
    , update = update
    , view = view
    , subscriptions = subscriptions
    }

-- Model
type alias Model = List String

type alias Data =
  { training : List (List Float)
  , labels : List String
  , testCases : List (List Float)
  }

training : List (List Float)
training = [ [5.1, 3.5, 1.4, 0.2]
  , [4.9, 3.0, 1.4, 0.2]
  , [4.7, 3.2, 1.3, 0.2]
  , [4.6, 3.1, 1.5, 0.2]
  , [5.0, 3.6, 1.4, 0.2]
  , [5.4, 3.9, 1.7, 0.4]
  , [4.6, 3.4, 1.4, 0.3]
  , [5.0, 3.4, 1.5, 0.2]
  , [4.4, 2.9, 1.4, 0.2]
  , [4.9, 3.1, 1.5, 0.1]
  , [5.4, 3.7, 1.5, 0.2]
  , [4.8, 3.4, 1.6, 0.2]
  , [4.8, 3.0, 1.4, 0.1]
  , [4.3, 3.0, 1.1, 0.1]
  , [5.8, 4.0, 1.2, 0.2]
  , [5.7, 4.4, 1.5, 0.4]
  , [5.4, 3.9, 1.3, 0.4]
  , [5.1, 3.5, 1.4, 0.3]
  , [5.7, 3.8, 1.7, 0.3]
  , [5.1, 3.8, 1.5, 0.3]
  , [5.4, 3.4, 1.7, 0.2]
  , [5.1, 3.7, 1.5, 0.4]
  , [4.6, 3.6, 1.0, 0.2]
  , [5.1, 3.3, 1.7, 0.5]
  , [4.8, 3.4, 1.9, 0.2]
  , [5.0, 3.0, 1.6, 0.2]
  , [5.0, 3.4, 1.6, 0.4]
  , [5.2, 3.5, 1.5, 0.2]
  , [5.2, 3.4, 1.4, 0.2]
  , [4.7, 3.2, 1.6, 0.2]
  , [4.8, 3.1, 1.6, 0.2]
  , [5.4, 3.4, 1.5, 0.4]
  , [5.2, 4.1, 1.5, 0.1]
  , [5.5, 4.2, 1.4, 0.2]
  , [4.9, 3.1, 1.5, 0.1]
  , [5.0, 3.2, 1.2, 0.2]
  , [5.5, 3.5, 1.3, 0.2]
  , [4.9, 3.1, 1.5, 0.1]
  , [4.4, 3.0, 1.3, 0.2]
  , [5.1, 3.4, 1.5, 0.2]
  , [5.0, 3.5, 1.3, 0.3]
  , [4.5, 2.3, 1.3, 0.3]
  , [4.4, 3.2, 1.3, 0.2]
  , [5.0, 3.5, 1.6, 0.6]
  , [5.1, 3.8, 1.9, 0.4]
  , [4.8, 3.0, 1.4, 0.3]
  , [5.1, 3.8, 1.6, 0.2]
  , [4.6, 3.2, 1.4, 0.2]
  , [5.3, 3.7, 1.5, 0.2]
  , [5.0, 3.3, 1.4, 0.2]
  , [7.0, 3.2, 4.7, 1.4]
  , [6.4, 3.2, 4.5, 1.5]
  , [6.9, 3.1, 4.9, 1.5]
  , [5.5, 2.3, 4.0, 1.3]
  , [6.5, 2.8, 4.6, 1.5]
  , [5.7, 2.8, 4.5, 1.3]
  , [6.3, 3.3, 4.7, 1.6]
  , [4.9, 2.4, 3.3, 1.0]
  , [6.6, 2.9, 4.6, 1.3]
  , [5.2, 2.7, 3.9, 1.4]
  , [5.0, 2.0, 3.5, 1.0]
  , [5.9, 3.0, 4.2, 1.5]
  , [6.0, 2.2, 4.0, 1.0]
  , [6.1, 2.9, 4.7, 1.4]
  , [5.6, 2.9, 3.6, 1.3]
  , [6.7, 3.1, 4.4, 1.4]
  , [5.6, 3.0, 4.5, 1.5]
  , [5.8, 2.7, 4.1, 1.0]
  , [6.2, 2.2, 4.5, 1.5]
  , [5.6, 2.5, 3.9, 1.1]
  , [5.9, 3.2, 4.8, 1.8]
  , [6.1, 2.8, 4.0, 1.3]
  , [6.3, 2.5, 4.9, 1.5]
  , [6.1, 2.8, 4.7, 1.2]
  , [6.4, 2.9, 4.3, 1.3]
  , [6.6, 3.0, 4.4, 1.4]
  , [6.8, 2.8, 4.8, 1.4]
  , [6.7, 3.0, 5.0, 1.7]
  , [6.0, 2.9, 4.5, 1.5]
  , [5.7, 2.6, 3.5, 1.0]
  , [5.5, 2.4, 3.8, 1.1]
  , [5.5, 2.4, 3.7, 1.0]
  , [5.8, 2.7, 3.9, 1.2]
  , [6.0, 2.7, 5.1, 1.6]
  , [5.4, 3.0, 4.5, 1.5]
  , [6.0, 3.4, 4.5, 1.6]
  , [6.7, 3.1, 4.7, 1.5]
  , [6.3, 2.3, 4.4, 1.3]
  , [5.6, 3.0, 4.1, 1.3]
  , [5.5, 2.5, 4.0, 1.3]
  , [5.5, 2.6, 4.4, 1.2]
  , [6.1, 3.0, 4.6, 1.4]
  , [5.8, 2.6, 4.0, 1.2]
  , [5.0, 2.3, 3.3, 1.0]
  , [5.6, 2.7, 4.2, 1.3]
  , [5.7, 3.0, 4.2, 1.2]
  , [5.7, 2.9, 4.2, 1.3]
  , [6.2, 2.9, 4.3, 1.3]
  , [5.1, 2.5, 3.0, 1.1]
  , [5.7, 2.8, 4.1, 1.3]
  , [6.3, 3.3, 6.0, 2.5]
  , [5.8, 2.7, 5.1, 1.9]
  , [7.1, 3.0, 5.9, 2.1]
  , [6.3, 2.9, 5.6, 1.8]
  , [6.5, 3.0, 5.8, 2.2]
  , [7.6, 3.0, 6.6, 2.1]
  , [4.9, 2.5, 4.5, 1.7]
  , [7.3, 2.9, 6.3, 1.8]
  , [6.7, 2.5, 5.8, 1.8]
  , [7.2, 3.6, 6.1, 2.5]
  , [6.5, 3.2, 5.1, 2.0]
  , [6.4, 2.7, 5.3, 1.9]
  , [6.8, 3.0, 5.5, 2.1]
  , [5.7, 2.5, 5.0, 2.0]
  , [5.8, 2.8, 5.1, 2.4]
  , [6.4, 3.2, 5.3, 2.3]
  , [6.5, 3.0, 5.5, 1.8]
  , [7.7, 3.8, 6.7, 2.2]
  , [7.7, 2.6, 6.9, 2.3]
  , [6.0, 2.2, 5.0, 1.5]
  , [6.9, 3.2, 5.7, 2.3]
  , [5.6, 2.8, 4.9, 2.0]
  , [7.7, 2.8, 6.7, 2.0]
  , [6.3, 2.7, 4.9, 1.8]
  , [6.7, 3.3, 5.7, 2.1]
  , [7.2, 3.2, 6.0, 1.8]
  , [6.2, 2.8, 4.8, 1.8]
  , [6.1, 3.0, 4.9, 1.8]
  , [6.4, 2.8, 5.6, 2.1]
  , [7.2, 3.0, 5.8, 1.6]
  , [7.4, 2.8, 6.1, 1.9]
  , [7.9, 3.8, 6.4, 2.0]
  , [6.4, 2.8, 5.6, 2.2]
  , [6.3, 2.8, 5.1, 1.5]
  , [6.1, 2.6, 5.6, 1.4]
  , [7.7, 3.0, 6.1, 2.3]
  , [6.3, 3.4, 5.6, 2.4]
  , [6.4, 3.1, 5.5, 1.8]
  , [6.0, 3.0, 4.8, 1.8]
  , [6.9, 3.1, 5.4, 2.1]
  , [6.7, 3.1, 5.6, 2.4]
  , [6.9, 3.1, 5.1, 2.3]
  , [5.8, 2.7, 5.1, 1.9]
  , [6.8, 3.2, 5.9, 2.3]
  , [6.7, 3.3, 5.7, 2.5]
  , [6.7, 3.0, 5.2, 2.3]
  , [6.3, 2.5, 5.0, 1.9]
  , [6.5, 3.0, 5.2, 2.0]
  , [6.2, 3.4, 5.4, 2.3]
  , [5.9, 3.0, 5.1, 1.8]]

labels : List String
labels = [ "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-setosa"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-versicolor"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"
  , "Iris-virginica"]

testCases : List (List Float)
testCases =
  [ [4.7,3.2,1.3,0.2] -- Iris-setosa
  , [6.1,3.0,4.6,1.4] -- Iris-versicolor
  , [6.4,2.8,5.6,2.2] -- Iris-virginica
  ]

initData : Data
initData =
  { training = training
  , labels = labels
  , testCases = testCases
  }

init : (Model, Cmd msg)
init =
  let initialModel = []
  in (initialModel, Cmd.none)

type Msg = RecieveFromJS (List String) | Send

-- Update
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    RecieveFromJS results ->
      let newModel = results
      in (newModel, Cmd.none)

    Send ->
      (model, sendData initData)

-- View
view : Model -> Html Msg
view model =
  div []
      [ button [ onClick Send ][ text "Click on me!" ]
      , ul []
           (List.map viewTest (List.map2 (,) testCases model))
      ]

viewTest : (List Float, String) -> Html msg
viewTest (features, label) =
  li []
     [ text ((toString features) ++ " ==> " ++ label)
     ]

-- Ports
-- port for sending data out to JavaScript
port sendData : Data -> Cmd msg

-- port for listening for results from JavaScript
port recieveData : (List String -> msg) -> Sub msg

-- Subscriptions
subscriptions : Model -> Sub Msg
subscriptions model =
  recieveData RecieveFromJS
