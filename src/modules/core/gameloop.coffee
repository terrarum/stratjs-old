define (require) ->
    FPSMeter = require 'FPSMeter'
    Stats =  require 'modules/core/stats'

    class Gameloop
        start: (options) ->
            timestamp = ->
                (if window.performance and window.performance.now then window.performance.now() else new Date().getTime())

            # Setup
            now = undefined
            dt = 0
            last = timestamp()
            slow = options.gamespeed # slow-motion value
            step = 1 / options.fps
            slowStep = slow * step
            showFPS = options.showFPS || false

            if showFPS?
                fpsmeter = new FPSMeter(document.getElementById('fpsmeter'),
                    decimals: 0
                    graph: true
                    theme: "dark"
                    left: 0
                    top: 0
                    position: 'relative'
                )

            frame = =>
                if showFPS?
                    fpsmeter.tickStart()
                now = timestamp()
                # dt = dt + Math.min(5, (now - last) / 1000)
                dt += (now - last) / 1000
                while dt > slowStep
                    dt = dt - slowStep
                    options.update step
                options.render dt / slow
                last = now

                if showFPS?
                    fpsmeter.tick()

                requestAnimationFrame frame
                return

            requestAnimationFrame frame

