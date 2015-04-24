gulp = require 'gulp'
browserSync = require 'browser-sync'
runSequence = require 'run-sequence'
$ = require('gulp-load-plugins')()
conf = require './tasks/config'

require('./tasks/jade')(gulp, conf.jade, $)
require('./tasks/stylus')(gulp, conf.stylus, $)
require('./tasks/imagemin')(gulp, conf.imagemin, $)
require('./tasks/replace')(gulp, conf.replace, $)
require('./tasks/uglify')(gulp, conf.uglify, $)
require('./tasks/minify-css')(gulp, conf.minifyCss, $)
require('./tasks/clean')(gulp, conf.clean)
require('./tasks/script')(gulp, conf.script)
require('./tasks/copy')(gulp, conf.copy)

reload = browserSync.reload

gulp.task 'serve', -> browserSync conf.serve

gulp.task 'start', (cb) ->
  runSequence ['jade', 'stylus', 'browserify'], 'watchify', 'serve', cb

gulp.task 'default', ['start'], ->
  gulp.watch ["./#{conf.S.SRC}/**/*.jade"], ['jade', reload]
  gulp.watch ["./#{conf.S.SRC}/**/*.styl"], ['stylus', reload]
  gulp.watch ["./#{conf.S.DEST}/**/*.js"], reload

gulp.task 'build', (cb) ->
  runSequence(
    'clean'
    ['jade', 'stylus']
    'copy'
    ['replace', 'minify-css', 'browserify', 'imagemin']
    'uglify'
    cb
  )
