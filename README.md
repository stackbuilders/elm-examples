# Elm Examples
In this repository you can find some of the Elm Examples that we present in the
[Quito Lambda Meetup][quito-lambda]. I hope you've learn a lot. Take a look at
these examples and practice! Also, you can find the presentation clicking the
following [link][presentation].<`3`>

## Dependencies
- elm-complier-0.18
- stack-1.4.0 (or higher)

## Set up
```shell
$ git clone git@github.com:stackbuilders/elm-examples.git --recursive
$ cd elm-examples/
$ elm-package install
```

## Run Elm Architecture example
```shell
$ elm-reactor # Then choose the src/ElmArchitecture/Main.elm file
```

## Run Cmd example
```shell
$ ./download-images.sh
$ elm-reactor # Then choose the src/Cmd/Main.elm file
```

## Run Subs example
Especial thanks to Mats Rietdijk from Paramander.
```shell
$ cd src/Subs/
$ stack build --exec "typesafe-websockets"
$ elm-reactor # Then choose the src/Subs/src/Main.elm file
```
## Run Interoperability example
```shell
$ elm-make src/Interoperability/Main.elm --output src/Interoperability/main.js
$ elm-reactor # Then choose the src/Interoperability/index.html file
```

## Links for keep learning
If you're interested in Elm you can take a look at the following links:

- [Elm guide](https://guide.elm-lang.org)
- [Elm tutorial](https://www.elm-tutorial.org/en/)
- [PokeAPI][poke-api]
- [Images PokeAPI][poke-images]

[quito-lambda]: https://www.meetup.com/Quito-Lambda-Meetup/
[presentation]: https://docs.google.com/a/stackbuilders.com/presentation/d/1LYMMZOJAP12wCWieE6qpIrY_t3ahzv6_YASWCJrW7HE/edit?usp=sharing
[poke-api]: http://pokeapi.co/
[poke-images]: https://github.com/PokeAPI/sprites/tree/master/sprites/pokemon
