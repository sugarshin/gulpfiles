gulp = require 'gulp'
browserSync = require 'browser-sync'
sequence = require 'gulp-sequence'
requireDir = require 'require-dir'
$ = require './config.json'

requireDir './tasks'

reload = browserSync.reload

gulp.task 'serve', ->
  browserSync
    startPath: '/'
    server:
      baseDir: './'
      index: "#{$.DEST}/"
      routes:
        '/': "#{$.DEST}/"

gulp.task 'start', sequence ['jade', 'stylus'], ['replace-normal', 'browserify'], 'serve'

gulp.task 'default', ['start'], ->
  gulp.watch ["./#{$.SRC}/**/*.coffee"], ['browserify', reload]
  gulp.watch ["./#{$.SRC}/**/*.jade"], ['jade', reload]
  gulp.watch ["./#{$.SRC}/**/*.styl"], ['stylus', reload]

gulp.task 'build', sequence 'clean', ['jade', 'stylus', 'browserify', 'imagemin'], ['replace-min', 'header'], 'uglify'
# After -> 'git push' 'npm run deploy'
