gulp = require 'gulp'
  browserSync = require 'browser-sync'
runSequence = require 'run-sequence'
$ = require('gulp-load-plugins')()
opts = require './tasks/config.coffee'

require('./tasks/jade')(gulp, opts.jade, $)
require('./tasks/stylus')(gulp, opts.stylus, $)
require('./tasks/imagemin')(gulp, opts.imagemin, $)
require('./tasks/replace')(gulp, opts.replace, $)
require('./tasks/uglify')(gulp, opts.uglify, $)
require('./tasks/minify-css')(gulp, opts.minifyCss, $)
require('./tasks/clean')(gulp, opts.clean)
require('./tasks/script')(gulp, opts.script)

reload = browserSync.reload

gulp.task 'serve', -> browserSync opts.serve

gulp.task 'start', (cb) ->
  runSequence ['jade', 'stylus', 'browserify'], 'watchify', 'serve', cb

gulp.task 'default', ['start'], ->
  gulp.watch ["./#{opts.S.SRC}/**/*.jade"], ['jade', reload]
  gulp.watch ["./#{opts.S.SRC}/**/*.styl"], ['stylus', reload]
  gulp.watch ["./#{opts.S.DEST}/**/*.js"], reload

gulp.task 'build', (cb) ->
  runSequence 'clean', ['jade', 'stylus'], 'copy', ['replace', 'minify-css', 'browserify', 'imagemin'], 'uglify', cb
