module.exports = function(grunt) {

    grunt.initConfig({

        // Compile JS to single file. Only call this in production build,
        // dev build should be done by copying the js source over.
        requirejs: {
            prod: {
                options: {
                    baseUrl: 'src/',
                    mainConfigFile: 'src/require-config.js',
                    name: 'bower_components/almond/almond',
                    out: 'src/main.min.js',
                    include: ['main'],
                    insertRequire: ['main']
                }
            }
        },

        // Compile Coffeescript.
        coffee: {
            dev: {
                options: {
                    bare: false,
                    sourceMap: true
                },
                expand: true,
                cwd: 'src/',
                src: ['**/*.coffee'],
                dest: 'dist/',
                ext: '.js'
            },
            prod: {

            }
        },

        // Compile SCSS.
        compass: {
            dev: {
                options: {
                    environment: 'development',
                    sassDir: 'src/sass',
                    cssDir: 'dist/'
                }
            },
            prod: {
                options: {
                    sassDir: 'src/sass',
                    cssDir: 'src',
                    outputStyle: 'compressed',
                    environment: 'production',
                    watchTask: true
                }
            }
        },

        // BrowserSync.
        browserSync: {
            dev: {
                bsFiles: {
                    src: 'dist/daynight.css'
                },
                options: {
                    proxy: 'http://localhost/daynight/dist/',
                    watchTask: true
                }
            }
        },

        // Compile Jade templates.
        jade: {
            static: {
                options: {
                    data: {
                        debug: false
                    }
                },
                files: {
                    './dist/index.html': 'src/index.jade'
                }
            },
            templates: {
                options: {
                    data: {
                        debug: false
                    },
                    client: true,
                    amd: true,
                    namespace: false
                },
                files: [{
                    expand: true,
                    src: '**/*.jade',
                    dest: 'dist/views/partials',
                    cwd: 'src/views/partials',
                    ext: '.js'
                }]
            }
        },

        // Clear the dist folder.
        clean: {
            dist: ['./dist']
        },

        // Combine css files together.
        concat: {
            dev: {
                src: ['bower_components/bootstrap/dist/css/bootstrap.css', 'dist/daynight.css'],
                dest: 'dist/daynight.css'
            },
            prod: {
                src: ['bower_components/bootstrap/dist/css/bootstrap.min.css', 'dist/daynight.css'],
                dest: 'dist/daynight.css'
            }
        },

        // Copy files to dist.
        copy: {
            dev: {
                files: [
                    {
                        nonull: true,
                        flatten: true,
                        expand: true,
                        src: ['bower_components/requirejs/require.js', 'src/require-config.js'],
                        dest: 'dist/'
                    }
                ]

            }
        },

        // Watch for changes.
        watch: {
            sass: {
                files: 'src/sass/*.scss',
                tasks: ['compass:dev', 'concat:dev']
            },
            js: {
                files: ['src/**/*.coffee', 'src/**/*.jade'],
                tasks: [
                    'jade:static',
                    'jade:templates',
                    'concat:dev',
                    'coffee:dev'
                ]
            }
        }

    });

    grunt.loadNpmTasks('grunt-contrib-requirejs');
    grunt.loadNpmTasks('grunt-contrib-compass');
    grunt.loadNpmTasks('grunt-browser-sync');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-jade');
    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-copy');

    /*
    * Development build process:
    *   Clean /dist.
    *   Compile any .jade files.
    *   Compile any .sass files.
    *   Add lib css to compiled sass.
    *   Compile Coffeescript. (*)
    *   Run JS through RequireJS. (*)
    */

    // Development task.
    grunt.registerTask('dev', [
        'clean:dist',
        'copy:dev',
        'jade:static',
        'jade:templates',
        'compass:dev',
        'concat:dev',
        'coffee:dev'
    ]);

    grunt.registerTask('default', ["browserSync", "watch"]);
};