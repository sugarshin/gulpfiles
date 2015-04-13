gulp = require 'gulp'
stylus = require 'gulp-stylus'
nib = require 'nib'
plumber = require 'gulp-plumber'
notify = require 'gulp-notify'
rename = require 'gulp-rename'
$ = require('../package.json').settings

path = [
  "#{$.SRC}/**/*.styl"
  "!#{$.SRC}/**/_**/*.styl"
  "!#{$.SRC}/**/_*.styl"
]

gulp.task 'stylus', ->
  gulp.src path
    .pipe plumber
      errorHandler: notify.onError '<%= error.message %>'
    .pipe stylus
      use: nib()
      compress: true
    .pipe rename
      dirname: './'
    .pipe gulp.dest "#{$.DEST}#{$.PATH}/css",
      cwd: './'
