gulp = require 'gulp'
stylus = require 'gulp-stylus'
koutoSwiss = require 'kouto-swiss'
plumber = require 'gulp-plumber'
notify = require 'gulp-notify'
$ = require './../config.json'

path =
  css: [
    "#{$.SRC}/stylus/**/*.styl"
    "!#{$.SRC}/stylus/import/*.styl"
    "!#{$.SRC}/**/_**/*.styl"
    "!#{$.SRC}/**/_*.styl"
  ]

gulp.task 'stylus', ->
  gulp.src path.css
    .pipe plumber
      errorHandler: notify.onError '<%= error.message %>'
    .pipe stylus
      use: koutoSwiss()
      compress: true
    .pipe gulp.dest $.DEST,
      cwd: './'
