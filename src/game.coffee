define (require) ->

    Gameloop = require 'modules/core/gameloop'
    Stats = require 'modules/core/stats'

    MapLoader = require 'controllers/MapLoader'

    class Game
        game: {}

        # Set everything up.
        init: ->
            @stats = new Stats.getInstance()
            @gameloop = new Gameloop

            # load the map
            mapLoader = new MapLoader(@game)
            mapLoader.load 0
            

            # create the teams/units

        # Set any options for the gameloop.
        # Start the gameloop.
        start: ->
            options =
                update: @update
                render: @render
                fps: 60
                gamespeed: 1    # increase for slow motion
                showFPS: true
            @gameloop.start options

        # The update function.
        # Only to be used for updating the values of things.
        update: (@game, step) =>


        # The render function.
        # Only to be used for drawing out the results of the update function.
        render: (@game, step) =>
            @stats.render()