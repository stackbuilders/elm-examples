# Elm Examples
En este repositorio puedes encontrar los ejemplos de Elm que se presentaron en
el [Quito Lambda Meetup][quito-lambda]. ¡Espero que hayas aprendido algo nuevo!
Dale un vistazo a los ejemplos y practica. También, puedes encontrar la presentación
en el siguiente [enlace][presentation]:

## Dependencias
- elm-complier-0.18
- stack-1.4.0

## Configuración
Ejecuta los siguientes comandos en una terminal:

```shell
$ git clone git@github.com:stackbuilders/elm-examples.git --recursive
$ cd elm-examples/
$ elm-package install
```

## Ejecutar ejemplo sobre la Elm Architecture 
```shell
$ elm-reactor # Then choose the src/ElmArchitecture/Main.elm file
```

## Ejecutar ejemplo sobre Cmd 
```shell
$ ./download-images.sh
$ elm-reactor # Then choose the src/Cmd/Main.elm file
```

## Ejecutar ejemplo sobre Subscriptions
Muchas gracias a Mats Rietdijk de Paramander.
```shell
$ cd src/Subs/
$ stack build --exec "typesafe-websockets"
$ elm-reactor # Then choose the src/Subs/src/Main.elm file
```
## Ejecutar ejemplo sobre Interoperability 
```shell
$ elm-make src/Interoperability/Main.elm --output src/Interoperability/main.js
$ elm-reactor # Then choose the src/Interoperability/index.html file
```

## Enlaces para seguir aprendiendo
Si estás interesado en Elm y quieres aprender más puedes darle un vistazo a los siguientes enlaces:

- [Elm guide](https://guide.elm-lang.org)
- [Elm tutorial](https://www.elm-tutorial.org/en/)
- [PokeAPI][poke-api]
- [Images PokeAPI][poke-images]

[quito-lambda]: https://www.meetup.com/Quito-Lambda-Meetup/
[presentation]: https://docs.google.com/a/stackbuilders.com/presentation/d/1LYMMZOJAP12wCWieE6qpIrY_t3ahzv6_YASWCJrW7HE/edit?usp=sharing
[poke-api]: http://pokeapi.co/
[poke-images]: https://github.com/PokeAPI/sprites/tree/master/sprites/pokemon
