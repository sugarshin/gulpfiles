gulp = require 'gulp'
browserSync = require 'browser-sync'
runSequence = require 'run-sequence'
requireDir = require 'require-dir'
$ = require('./package.json').settings

requireDir './tasks'

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

gulp.task 'start', (cb) -> runSequence ['jade', 'stylus'], [ 'browserify'], 'serve', cb

gulp.task 'default', ['start'], ->
  gulp.watch ["./#{$.SRC}/**/*.coffee"], ['browserify', reload]
  gulp.watch ["./#{$.SRC}/**/*.jade"], ['jade', reload]
  gulp.watch ["./#{$.SRC}/**/*.styl"], ['stylus', reload]

gulp.task 'build', (cb) -> runSequence 'clean', ['jade', 'stylus'], 'copy', ['replace-min', 'minify-css', 'browserify', 'imagemin'], 'uglify', cb
