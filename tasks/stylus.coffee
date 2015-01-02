gulp = require 'gulp'
stylus = require 'gulp-stylus'
nib = require 'nib'
plumber = require 'gulp-plumber'
notify = require 'gulp-notify'
$ = require './../config.json'



path =
  css: [
    "#{$.SRC}/**/*.styl"
    "!#{$.SRC}/**/_**/*.styl"
    "!#{$.SRC}/**/_*.styl"
  ]

gulp.task 'stylus', ->
  gulp.src path.css
    .pipe plumber
      errorHandler: notify.onError '<%= error.message %>'
    .pipe stylus
      use: nib()
      compress: true
    .pipe gulp.dest $.DEST
