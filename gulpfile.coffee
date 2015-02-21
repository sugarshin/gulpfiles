gulp = require 'gulp'
browserSync = require 'browser-sync'
sequence = require 'gulp-sequence'
requireDir = require 'require-dir'
C = require('./package.json').config

requireDir './tasks'

reload = browserSync.reload

gulp.task 'serve', ->
  browserSync
    notify: false
    startPath: '/'
    server:
      baseDir: './'
      index: "#{C.DST}/"
      routes:
        '/': "#{C.DST}/"

gulp.task 'start', sequence ['jade', 'stylus'], ['replace-normal', 'browserify'], 'serve'

gulp.task 'default', ['start'], ->
  gulp.watch ["./#{C.SRC}/**/*.coffee"], ['browserify', reload]
  gulp.watch ["./#{C.SRC}/**/*.jade"], ['jade', reload]
  gulp.watch ["./#{C.SRC}/**/*.styl"], ['stylus', reload]

gulp.task 'build', sequence 'clean', ['jade', 'stylus', 'browserify', 'imagemin'], ['replace-min', 'header'], 'uglify'
# After -> 'git push' 'npm run deploy'
