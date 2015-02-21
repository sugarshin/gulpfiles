gulp = require 'gulp'
stylus = require 'gulp-stylus'
nib = require 'nib'
plumber = require 'gulp-plumber'
notify = require 'gulp-notify'
C = require('./package.json').config

path =
  css: [
    "#{C.SRC}/**/*.styl"
    "!#{C.SRC}/**/import/*.styl"
    "!#{C.SRC}/**/_**/*.styl"
    "!#{C.SRC}/**/_*.styl"
  ]

gulp.task 'stylus', ->
  gulp.src path.css
    .pipe plumber
      errorHandler: notify.onError '<%= error.message %>'
    .pipe stylus
      use: nib()
      compress: true
    .pipe gulp.dest C.DST,
      cwd: './'
