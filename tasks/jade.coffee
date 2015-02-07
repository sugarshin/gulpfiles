gulp = require 'gulp'
jade = require 'gulp-jade'
plumber = require 'gulp-plumber'
notify = require 'gulp-notify'
rename = require 'gulp-rename'
$ = require './../config.json'

path =
  html: [
    "#{$.SRC}/**/*.jade"
    "!#{$.SRC}/**/_**/*.jade"
    "!#{$.SRC}/**/_*.jade"
  ]

gulp.task 'jade', ->
  gulp.src path.html
    .pipe plumber
      errorHandler: notify.onError '<%= error.message %>'
    .pipe jade pretty: true
    .pipe rename
      dirname: './'
    .pipe gulp.dest $.DEST,
      cwd: './'
