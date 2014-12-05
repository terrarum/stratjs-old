define (require) ->

    class Entity

        moveRange: 0
        viewRange: 0
        attackRange: 0
        damage: 0

        spawn: ->
            console.log "spawning"