module Cmd.Main exposing(..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as Decode

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- MODEL
type alias Model =
  { pokemons : List Pokemon
  , selectedPokemon : Pokemon
  }

type alias Pokemon =
  { url : Maybe String
  , name : String
  , id : Maybe Int
  , abilities : Maybe (List Ability)
  }

type alias Ability = String

init : (Model, Cmd Msg)
init =
  ( Model [] { url = Nothing, name = "", id = Nothing, abilities = Nothing }
  , getPokemons 0
  )

-- UPDATE
type Msg
  = PokemonList (Result Http.Error (List Pokemon))
  | SelectPokemon Pokemon
  | RequestPokemon (Result Http.Error Pokemon)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    PokemonList (Ok pokemonList) ->
      ({ model | pokemons = pokemonList }, Cmd.none)

    PokemonList (Err _) ->
      (model, Cmd.none)

    SelectPokemon pokemon ->
      ({ model | selectedPokemon = pokemon}, getPokemon (Maybe.withDefault "" pokemon.url))

    RequestPokemon (Ok pokemon) ->
      ({ model | selectedPokemon = pokemon}, Cmd.none)

    RequestPokemon (Err _) ->
      (model, Cmd.none)

-- VIEW
divStyle : Attribute msg
divStyle =
  style
    [ ("float", "left")
    , ("margin-right", "5px")
    , ("height", "90px")
    , ("width", "30%")
    ]

view : Model -> Html Msg
view model =
  div []
    [ div [ divStyle ]
          [ ul []
               (List.map viewPokemonList model.pokemons)
          ]
    , viewPokemon model.selectedPokemon
    ]

viewPokemonList : Pokemon -> Html Msg
viewPokemonList pokemon =
  li [ onClick (SelectPokemon pokemon) ]
   [ text pokemon.name
   ]

viewPokemon : Pokemon -> Html Msg
viewPokemon pokemon =
  div []
      [ div [ divStyle ]
            [ img [ src (toString (Maybe.withDefault 0 pokemon.id) ++ ".png") ] [] 
            , div [][text pokemon.name]
            ]
      , div [ divStyle ][ viewAbilities (Maybe.withDefault [] pokemon.abilities) ]
      ]

viewAbilities : List Ability -> Html Msg
viewAbilities abilities =
  ul []
     (List.map (\ab -> li [] [ text ab ]) abilities)

-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

-- HTTP
getPokemons : Int -> Cmd Msg
getPokemons offset =
  Http.send PokemonList (Http.get (urlPokemons offset) decodePokemonList)

getPokemon : String -> Cmd Msg
getPokemon url =
  Http.send RequestPokemon (Http.get url decodePokemon)

-- Urls
urlPokemons : Int -> String
urlPokemons offset = "http://pokeapi.co/api/v2/pokemon/?offset=" ++ toString offset

-- Decodes
decodePokemonList : Decode.Decoder (List Pokemon)
decodePokemonList =
  Decode.field "results"
    (Decode.list decodePokemon)

decodePokemon : Decode.Decoder Pokemon
decodePokemon =
  Decode.map4 Pokemon
    (Decode.maybe (Decode.field "url" Decode.string))
    (Decode.field "name" Decode.string)
    (Decode.maybe (Decode.field "id" Decode.int))
    (Decode.maybe decodeAbilities)

decodeAbilities : Decode.Decoder (List Ability)
decodeAbilities =
  Decode.field "abilities" (Decode.list decodeAbility)

decodeAbility : Decode.Decoder Ability
decodeAbility =
  Decode.at ["ability", "name"] Decode.string
