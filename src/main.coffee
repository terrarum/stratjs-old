require [
    "jquery"
    "game"
    "jade"
], ($, Game) ->
    game = new Game()
    game.init()
    game.start()