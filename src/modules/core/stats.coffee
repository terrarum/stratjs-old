# Stats singleton.
# Used for adding information to be tracked to the stats bar.

define (require) ->
    console.log "Require Stat Partials"
    StatTemplate = require 'views/partials/stat'

    class Stats
        constructor: ->
            console.log "Stats Constructor"
        instance = null

        @getInstance: ->
            console.log "Get Stats Instance"
            instance ?= new PrivateClass

        class PrivateClass
            constructor: ->

            stats: {}

            # Stat model.
            # TODO create actual model.
            stat: (id, title, value) ->
                id: id
                title: title
                value: value

            # Add the given information to the list of stats.
            log: (id, title, value) ->
                if !@stats[id]?
                    $('.js-stats').append(StatTemplate({id: id, title: title, value: value}));
                @stats[id] = @stat(id, title, value)

            render: ->
                if Object.keys(@stats).length > 0
                    for key, stat of @stats
                        $('.' + stat.id).html(StatTemplate({id: stat.id, title: stat.title, value: stat.value}))