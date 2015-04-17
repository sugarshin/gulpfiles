gulp = require 'gulp'
browserSync = require 'browser-sync'
runSequence = require 'run-sequence'
$ = require('gulp-load-plugins')()
opts = require './tasks/config.coffee'

reload = browserSync.reload

gulp.task 'serve', ->
  browserSync
    notify: false
    startPath: $.PATH
    server:
      baseDir: './'
      index: "#{$.DEST}#{$.PATH}/"
      routes:
        "#{$.PATH}": "#{$.DEST}#{$.PATH}/"

require('./tasks/jade')(gulp, opts.jade, $)
require('./tasks/stylus')(gulp, opts.stylus, $)
require('./tasks/imagemin')(gulp, opts.imagemin, $)
require('./tasks/replace')(gulp, opts.replace, $)
require('./tasks/uglify')(gulp, opts.uglify, $)
require('./tasks/clean')(gulp, opts.clean)
require('./tasks/script')(gulp, opts.script)

gulp.task 'start', (cb) ->
  runSequence ['jade', 'stylus', 'browserify'], 'watchify', 'serve', cb

gulp.task 'default', ['start'], ->
  gulp.watch ["./#{$.SRC}/**/*.jade"], ['jade', reload]
  gulp.watch ["./#{$.SRC}/**/*.styl"], ['stylus', reload]
  gulp.watch ["./#{$.DEST}/**/*.js"], reload

gulp.task 'build', (cb) ->
  runSequence 'clean', ['jade', 'stylus'], 'copy', ['replace', 'minify-css', 'browserify', 'imagemin'], 'uglify', cb
