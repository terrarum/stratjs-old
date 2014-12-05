var bower = '../bower_components'
var npm = '../node_modules'

require.config({
    paths: {
        jquery: bower + '/jquery/dist/jquery',
        jade: npm + '/grunt-contrib-jade/node_modules/jade/jade',
        FPSMeter: bower + '/fpsmeter/dist/fpsmeter'
    },
    shim: {
        FPSMeter: {
            exports: 'FPSMeter'
        }
    }
})