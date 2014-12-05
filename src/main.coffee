require [
    "jquery"
    "game"
    "jade"
], ($, Game) ->
    game = new Game()
    gameData = game.initGame()
    game.start gameData