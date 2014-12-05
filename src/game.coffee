define (require) ->

    Gameloop = require 'modules/core/gameloop'
    Stats = require 'modules/core/stats'

    Sniper = require 'entities/sniper'

    class Game
        game: {}

        # Set everything up.
        init: ->
            @stats = new Stats.getInstance()
            @gameloop = new Gameloop

            console.log "Spawning Sniper"
            sniper = new Sniper()
            console.log sniper

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
        update: (step) =>


        # The render function.
        # Only to be used for drawing out the results of the update function.
        render: (step) =>
            @stats.render()