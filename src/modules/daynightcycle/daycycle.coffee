define (require) ->
    Stats =  require 'modules/core/stats'

    class DayCycle
        constructor: (game) ->
            @game = game
            @stats = new Stats.getInstance()

        # Updates the current time of day.
        update: (step) ->
            ms = step * 1000;
            @game.newDayLength -= ms;
            if (@game.newDayLength <= 0)
                @game.newDayLength = @game.dayLength
                @game.isDay = !@game.isDay

        render: ->
            progressPercent = parseInt(@game.newDayLength / @game.dayLength * 100)
            if @game.isDay
                progressPercent = 100 - progressPercent
            @stats.log 'percent', 'Percent', progressPercent
            $('.js-progress-bar').css
                width: progressPercent + '%'