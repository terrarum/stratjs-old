define (require) ->

    class Entity

        health: 100

        moveRange: 0
        viewRange: 0

        spawn: ->
            console.log "spawning"