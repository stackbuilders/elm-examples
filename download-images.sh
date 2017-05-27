#!/bin/bash
for i in $(seq 0 20); do
  wget "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$i.png" -O "src/Cmd/$i.png"
done
