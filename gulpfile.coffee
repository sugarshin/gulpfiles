gulp = require 'gulp'
browserSync = require 'browser-sync'
sequence = require 'gulp-sequence'
requireDir = require 'require-dir'
$ = require('./package.json').config

requireDir './tasks'

reload = browserSync.reload

gulp.task 'serve', ->
  browserSync
    notify: false
    startPath: $.PATH
    server:
      baseDir: './'
      index: "#{$.DST}#{$.PATH}/"
      routes:
        "#{$.PATH}": "#{$.DST}#{$.PATH}/"

gulp.task 'start', sequence ['jade', 'stylus'], [ 'browserify'], 'serve'

gulp.task 'default', ['start'], ->
  gulp.watch ["./#{$.SRC}/**/*.coffee"], ['browserify', reload]
  gulp.watch ["./#{$.SRC}/**/*.jade"], ['jade', reload]
  gulp.watch ["./#{$.SRC}/**/*.styl"], ['stylus', reload]

gulp.task 'build', sequence 'clean', ['jade', 'stylus'], 'copy', ['replace-min', 'minify-css-jp', 'minify-css', 'browserify', 'imagemin'], 'uglify'
