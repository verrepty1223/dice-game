# Project - Dice game

## About
This project is a rewrite of an old c# school task I had to make 3 years ago but now in the vala programming language.

It is a dice / guess game where the player has to guess of the next throw is LOWER, HIGHER, EQUAL (not added).

The project follow a layered approch with the files doing the following:
- dice.vala: contains the dice class that gives a random number between 1 and 6.
- game-core.vala: contains the game logic of the program and calls dice.vala
- controller.vala: server as the abstraction layer between the frontend (cli or gui) and the backend. 

## Todo
- [x] Change te way the property choice get its valua from the user.
- [x] Split do_roll() into two functions one for each roll.
- [x] Redo code of test_game_core() to make it more then a one use case.
- [x] Add code to controller.vala
- [ ] Add entrypoint and interface/ with interface/cli folders
- [ ] Add code for entrypoint and interface/cli

## build commands
```sh
meson setup builddir
meson compile -C builddir
```