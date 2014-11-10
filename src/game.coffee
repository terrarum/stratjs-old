define (require) ->

    Gameloop =  require 'modules/core/gameloop'
    Stats =  require 'modules/core/stats'
    DayCycle =  require 'modules/daynightcycle/daycycle'

    class Game
        game: {}

        # Set everything up.
        initGame: ->
            @stats = new Stats.getInstance()
            @gameloop = new Gameloop
            dayLength = 30000

            game =
                dayLength: dayLength
                newDayLength: dayLength
                isDay: true
                buildings:
                    batteries: 1
                    collectors: 1

            @dayCycle = new DayCycle(game)

        # Set any options for the gameloop.
        # Start the gameloop.
        start: (game) ->
            @game = game
            options =
                update: @update
                render: @render
                fps: 60
                gamespeed: 1    # increase for slow motion
            @gameloop.start options

        # The update function.
        # Only to be used for updating the values of things.
        update: (step) =>
            @dayCycle.update step

        # The render function.
        # Only to be used for drawing out the results of the update function.
        render: (step) =>
            @stats.render()
            @dayCycle.render()